# Create a BWA index in the genomic reference
configfile: "config.yaml"


rule all:
    input:
        'temp/out.sai'

rule bwa_index:
    input:
        config['reference']
    output:
        touch('bwa_index.done')
    shell:
        'bwa index {input}'


rule bwa_allign1:
    input:
        check = 'bwa_index.done',
        gen = config['reference'],
        reads = 'data/A.txt',
        #reads=expand("data/{sample}.txt", sample=config["samples"])
    output:
        'temp/out.sai'
    shell:
        "bwa aln -I -t 8 {input.gen} {input.reads} > {output}"
