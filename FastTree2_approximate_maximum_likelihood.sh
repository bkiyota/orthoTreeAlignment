#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -N bkFASTTREE2
#$ -l s_vmem=1G
#$ -pe def_slot 16
#$ -j y
#$ -o qsub_files

source $HOME/setenv/miniconda.sh

FASTA_PATH=$1 # PRESUMEBE10k.d00.sample1.barcode070.fa.gz
LABEL=$( basename -s ".fa.gz" $FASTA_PATH )

NEWICK_DIR=$HOME/work/LineageTracing/BK18_extracting_subclades_16MPRESUMEBE/data/newicks
TREE_PATH=$NEWICK_DIR/${LABEL}.nwk

export OMP_NUM_THREADS=16

echo "FastTree2 reconstruction"
echo "  Input FASTA path: ${FASTA_PATH}"
echo "  Output tree path: ${TREE_PATH}"

cd $NEWICK_DIR

gunzip -c $FASTA_PATH > ${LABEL}.fa
FastTreeMP -nt -gtr < ${LABEL}.fa > $TREE_PATH
rm ${LABEL}.fa

echo "Done!"
