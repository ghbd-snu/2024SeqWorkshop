zcat SRR13281064_1.fastq.gz | less
### 1. Indexing
./hisat2-build GCF_000069185.1_ASM6918v1_genomic.fna genome_index
### 2. Mapping
## 2.1 sam file
./hisat2 -p 4 -x genome_index -1 /data/raw/rna/SRR13281064_1.fastq.gz -2 /data/raw/rna/SRR13281064_2.fastq.gz -S output.sam
## 2.2 bam file
./hisat2 -p 4 -x genome_index -1 /data/raw/rna/SRR13281064_1.fastq.gz -2 /data/raw/rna/SRR13281064_2.fastq.gz | samtools sort > all_samples.sorted.64.bam
### 3. Counting
featureCounts -T 4 -p -a /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.gtf -t gene -g gene_id -o featurecount_output_64 all_samples.sorted.64.bam