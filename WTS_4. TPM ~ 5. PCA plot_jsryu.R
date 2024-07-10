### 4. TPM scaling
R
library(dplyr)
library(readr)
## 4.1  라이브러리 로드 및 데이터 읽기
# 파일 리스트 
file_list <- list.files(pattern = "featurecount_output_*")
# Remove files containing "summary"
file_list <- list.files[!grepl("summary", file_list)]
# 데이터 읽기
data_list <- lapply(file_list, function(file) {
  read_delim(file, delim = "\t", comment = "#")
})
# 첫 번째 데이터 프레임을 기준으로 유전자 길이 정보 추출
gene_lengths <- data_list[[1]] %>%
  select(Geneid, Length) %>%
  distinct()
## 4.2 TPM 계산 함수 정의
calculate_tpm <- function(counts, lengths) {
  # Lengths를 kb로 변환
  lengths_kb <- lengths / 1000
  # RPK (Reads Per Kilobase) 계산
  rpk <- counts / lengths_kb
  # Scaling factor로 나누어 TPM 계산
  scaling_factor <- sum(rpk) / 1e6
  tpm <- rpk / scaling_factor
  return(tpm)
}
## 4.3 TPM 계산 및 결과 저장
# 모든 파일에 대해 TPM 계산
tpm_list <- lapply(data_list, function(df) {
  counts <- df[[7]]
  gene_lengths_df <- df %>%
    select(Geneid, Length) %>%
    distinct()
  # Lengths 정렬
  lengths <- gene_lengths_df$Length[match(gene_lengths$Geneid, gene_lengths_df$Geneid)]
  tpm <- calculate_tpm(counts, lengths)
  tpm_df <- data.frame(Geneid = df$Geneid, TPM = tpm)
  return(tpm_df)
})
# TPM 결과를 파일로 저장
for (i in 1:length(tpm_list)) {
  write_delim(tpm_list[[i]], paste0("tpm_", file_list[i]), delim = "\t")
}

### 5. PCA plot
## 5.1 12개 sample의 tpm output 파일을 geneid 기준으로 1개로 합치기
library(dplyr)
# 파일을 읽어들이고 리스트에 저장
data_list <- lapply(file_list, function(file) {
  read_tsv(file)  # 파일 포맷에 맞게 read_csv, read_delim 등으로 변경 가능
})
# Geneid을 기준으로 병합
combined_tpm <- data_list[[1]]  # 첫 번째 파일을 기준으로 시작
for (i in 2:length(data_list)) {
  combined_tpm <- merge(combined_tpm, data_list[[i]], by = "Geneid", all = TRUE)
}
# 컬럼 이름 변경 
colnames(combined_tpm)[-1] <- paste0("TPM_", gsub("tpm_featurecount_output_", "", file_list))

# NA를 0으로 대체
combined_tpm[is.na(combined_tpm)] <- 0

# 결과를 csv 파일로 저장 
write.csv(combined_tpm, file = "combined_tpm_output.csv", row.names = FALSE)

## 5.2 PCA
library(dplyr)
library(readr)
library(ggplot2)
library(factoextra)

# 데이터 읽기
combined_tpm <- read_csv("combined_tpm_output.csv")

# gene id를 rownames로 설정하고 나머지 TPM 값으로 새로운 데이터프레임 생성
rownames(combined_tpm) <- combined_tpm$Geneid
tpm_matrix <- combined_tpm[,-1]  # 첫 번째 열(Geneid) 제거


# PCA 수행
tpm_pca <- prcomp(t(tpm_matrix), scale = TRUE)

# 샘플 그룹 정의 (case: 73, 74, 75; control: 64, 65, 66, 67, 68, 69, 108, 109, 110)
group_names <- colnames(tpm_matrix)
groups <- ifelse(group_names %in% c("TPM_73", "TPM_74", "TPM_75"), "Case", "Control")
groups <- factor(groups)

# PCA 결과 시각화
pca_plot <- fviz_pca_ind(tpm_pca,
                  geom.ind = "point", # 포인트 모양
                  col.ind = groups, # 그룹에 따른 색상
                  palette = c("#00AFBB", "#FC4E07"), # 색상 팔레트
                  addEllipses = TRUE, # 그룹별 타원 추가
                  legend.title = "Groups") +
  theme_minimal() +
  ggtitle("PCA of TPM normalized data") +
  theme(plot.title = element_text(hjust = 0.5)) +
  coord_fixed() + # 축 비율 고정
  xlim(-200, 200) + ylim(-200, 200) + # x축과 y축 범위 설정
  geom_text(aes(label = rownames(tpm_pca$x)), vjust = 1, hjust = 1, size = 2) # 샘플 이름 추가, 폰트 크기 조정

# PCA plot 저장
ggsave("PCA_plot.pdf", plot = pca_plot)