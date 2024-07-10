zcat SRR13281064_1.fastq.gz | less
### 1. Indexing
./hisat2-build GCF_000069185.1_ASM6918v1_genomic.fna genome_index
### 2. Mapping
## 2.1 sam file
./hisat2 -p 4 -x genome_index -1 /data/raw/rna/SRR13281064_1.fastq.gz -2 /data/raw/rna/SRR13281064_2.fastq.gz -S output.sam
## 2.2 bam file
./hisat2 -p 4 -x genome_index -1 /data/raw/rna/SRR13281064_1.fastq.gz -2 /data/raw/rna/SRR13281064_2.fastq.gz | samtools sort > all_samples.sorted.64.bam
## 2.3 make script, use nohup
touch script.sh
vi script.sh
# i     _ 입력 시작
# 샘플 이름들을 배열에 저장
samples=(
    SRR13281064
    SRR13281065
    SRR13281066
    SRR13281067
    SRR13281068
    SRR13281069
    SRR13281073
    SRR13281074
    SRR13281075
    SRR13281108
    SRR13281109
    SRR13281110
)
# hisat2 명령어를 각 샘플에 대해 실행
for sample in "${samples[@]}"
do
    ./hisat2 -p 4 -x genome_index \
             -1 /data/raw/rna/${sample}_1.fastq.gz \
             -2 /data/raw/rna/${sample}_2.fastq.gz \
             -S output_${sample}.sam
done
# :wq   _ vi 편집기에서 나가기
nohup script.sh &
### 3. Counting
featureCounts -T 4 -p -a /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.gtf -t gene -g gene_id -o featurecount_output_64 all_samples.sorted.64.bam
touch script2.sh
vi script2.sh
# i     _ 입력 시작
samples=(
    SRR13281064
    SRR13281065
    SRR13281066
    SRR13281067
    SRR13281068
    SRR13281069
    SRR13281073
    SRR13281074
    SRR13281075
    SRR13281108
    SRR13281109
    SRR13281110
)

# featureCounts 명령어를 각 샘플에 대해 실행
for sample in "${samples[@]}"
do
    featureCounts -T 4 -p \
                  -a /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.gtf \
                  -t gene -g gene_id \
                  -o featurecount_output_${sample} \
                  /path/to/${sample}.sorted.bam
done
# :wq   _ vi 편집기에서 나가기
nohup script.sh &