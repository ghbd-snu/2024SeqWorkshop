import pandas as pd
import vcfpy

# defining parse_vcf_to_df
def parse_vcf_to_df(f):
    data = []
    
    with vcfpy.Reader.from_path(f) as vcf_reader:
        for record in vcf_reader:
            chrom = record.CHROM
            pos = record.POS
            
            qual = record.QUAL
            dp = record.INFO['DP']
            
            ref = record.REF
            alt = '|'.join([alt.value for alt in record.ALT]) 
              
            row = [chrom, pos, qual, dp, ref, alt]
            data.append(row)
    
    df = pd.DataFrame(
        data,
        columns=['chrom', 'pos', 'qual', 'dp', 'ref', 'alt']
    )
    return df
    
#loading data
df_1 = parse_vcf_to_df('called_ERR343204.vcf')
df_2 = parse_vcf_to_df('bayes_ERR343204.vcf')

# makeing a set of variants position
pos_1 = set(df_1['pos'])
pos_2 = set(df_2['pos'])

# number of variants called in both files
print(len(pos_1 & pos_2))

# number of variants only in bcftools
print(len(pos_1 - pos_2))

# number of variants only in freebayes
print(len(pos_2 - pos_1))

#comparing 'DP' values
merged = df_1.merge(
    df_2,
    on = ['chrom', 'pos'],
    how = 'inner'
)
print((merged['dp_x'] -
merged['dy_y']).describe())

