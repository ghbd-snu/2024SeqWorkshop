1) FastQC
import os

# Combined list of new IDs
ids = [
    "ERR343185", "ERR343204", "ERR349268", "ERR349323", "ERR373964",
    "ERR373980", "ERR374033", "ERR374060", "ERR374082", "ERR374098",
    "ERR374119", "ERR374119", "ERR374150", "ERR459776", "ERR459869",
    "ERR484956", "ERR484989", "ERR485004", "ERR494887", "ERR494905"
]

# Base command template
command_template = (
    "fastp -i /data/raw/wgs/{id}_1.fastq.gz "
    "-I /data/raw/wgs/{id}_2.fastq.gz "
    "-o /home/admin2/rawdata/trimmed.{id}_1.fastq.gz "
    "-O /home/admin2/rawdata/trimmed.{id}_2.fastq.gz"
)

# Run command for each ID
for id in ids:
    command = command_template.format(id=id)
    print(f"Running command: {command}")  # Print the command for logging/debugging purposes
    os.system(command)

2) Mapping with BWA-MEM
import os

# Combined list of new IDs
ids = [
    "ERR343185", "ERR343204", "ERR349268", "ERR349323", "ERR373964",
    "ERR373980", "ERR374033", "ERR374060", "ERR374082", "ERR374098",
    "ERR374119", "ERR374119", "ERR374150", "ERR459776", "ERR459869",
    "ERR484956", "ERR484989", "ERR485004", "ERR494887", "ERR494905"
]

# Base command template
command_template = (
    "bwa mem -aM /home/admin2/mapping/GCF_000069185.1_ASM6918v1_genomic.fna "
    "/home/admin2/rawdata/trimmed.{id}_R1_001.fastq.gz "
    "/home/admin2/rawdata/trimmed.{id}_R2_001.fastq.gz | "
    "samtools sort > sorted_{id}.bam"
)

# Run command for each ID
for id in ids:
    command = command_template.format(id=id)
    print(f"Running command: {command}")  # Print the command for logging/debugging purposes
    os.system(command)


3) Remove Duplicates
import os

# Combined list of new IDs
ids = [
    "ERR343185", "ERR343204", "ERR349268", "ERR349323", "ERR373964",
    "ERR373980", "ERR374033", "ERR374060", "ERR374082", "ERR374098",
    "ERR374119", "ERR374119", "ERR374150", "ERR459776", "ERR459869",
    "ERR484956", "ERR484989", "ERR485004", "ERR494887", "ERR494905"
]

# Base command template
command_template = (
    "picard MarkDuplicates \
    I=sorted_{id}.bam \
    O=dupmarked_{id}.bam \
    M=dupmarked_{id}"
)

# Run command for each ID
for id in ids:
    command = command_template.format(id=id)
    print(f"Running command: {command}")  # Print the command for logging/debugging purposes
    os.system(command)
