datadir= 'data/'

# rule all:
#     """ final rule """
#     input: 'result/histogram.jpg'


# rule make_histogram:
#     """ rule that creates histogram from gene expression counts"""
#     input:
#         datadir + 'out.csv'
#     output:
#          'result/histogram.jpg'
#     shell:
#         "Rscript scripthist.R {input} {output}"

rule all:
    """final rule"""
    input: 'result/heatmap.jpg'

rule make_heatmap:
    input:
        datadir + 'gene_ex.csv'
    output:
        'result/heatmap.jpg'
    shell:
        "Rscript heatmap.R {input} {output}"