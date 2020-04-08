#!/bin/bash
epost -input corona/GenBankGenomes.lst |efetch -db nucleotide -format fasta>corona/GenBankGenomes.fasta

mafft --auto gisaid_cov2020_sequences.fasta >gisaid.msa.fa

FastTreeDbl -quote gisaid.msa.fa>gisaid.nwk

#FUNCIONA!!!!!
raxmlHPC  -T 5 -s GenBankGenomes.msa.prank.fa.best.fas  -n GenBankGenomes.raxml.tre -b 12345 -p 12345 --HKY85  -T 5 -N 10 -m GTRCAT


#phyloFit -tree gisaid.nwk -subst-mod HKY85
