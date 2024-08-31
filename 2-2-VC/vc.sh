# variant calling using freebayes

freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR343185.bam > /data/2_WGS_VC/bayes_ERR343185.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR343204.bam > /data/2_WGS_VC/bayes_ERR343204.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR349268.bam > /data/2_WGS_VC/bayes_ERR349268.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR349323.bam > /data/2_WGS_VC/bayes_ERR349323.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR373964.bam > /data/2_WGS_VC/bayes_ERR373964.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR373980.bam > /data/2_WGS_VC/bayes_ERR373980.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR374033.bam > /data/2_WGS_VC/bayes_ERR374033.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR374060.bam > /data/2_WGS_VC/bayes_ERR374060.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR374082.bam > /data/2_WGS_VC/bayes_ERR374082.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR374098.bam > /data/2_WGS_VC/bayes_ERR374098.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR374119.bam > /data/2_WGS_VC/bayes_ERR374119.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR374150.bam > /data/2_WGS_VC/bayes_ERR374150.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR459776.bam > /data/2_WGS_VC/bayes_ERR459776.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR459869.bam > /data/2_WGS_VC/bayes_ERR459869.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR484956.bam > /data/2_WGS_VC/bayes_ERR484956.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR484989.bam > /data/2_WGS_VC/bayes_ERR484989.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR485004.bam > /data/2_WGS_VC/bayes_ERR485004.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR494887.bam > /data/2_WGS_VC/bayes_ERR494887.vcf
freebayes -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR494905.bam > /data/2_WGS_VC/bayes_ERR494905.vcf


# variant calling using bcftools

bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR343185.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR343185.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR343204.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR343204.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR349268.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR349268.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR349323.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR349323.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR373964.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR373964.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR373980.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR373980.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR374033.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR374033.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR374060.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR374060.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR374082.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR374082.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR374098.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR374098.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR374119.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR374119.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR374150.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR374150.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR459776.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR459776.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR459869.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR459869.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR484956.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR484956.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR484989.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR484989.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR485004.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR485004.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR494887.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR494887.vcf
bcftools mpileup -f /data/raw/ref/GCF_000069185.1_ASM6918v1_genomic.fna /data/1_WGS_QC/dupmarked_ERR494905.bam | bcftools call --ploidy 1 -mv -Oz -o /data/2_WGS_VC/called_ERR494905.vcf
