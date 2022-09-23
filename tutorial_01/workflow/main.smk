SAMPLES = ['Sample1', 'Sample2']

rule all:
    input:
        expand('results/{sample}.txt', sample = SAMPLES)

rule quantify_genes:
    input:
        r1 = 'data/r1.txt',
        r2 = 'data/r2.txt'
    output:
        'results/{sample}.txt'
    shell:
        'cat {input.r1} {input.r2} > {output}'