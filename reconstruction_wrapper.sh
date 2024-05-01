#!/bin/bash

INPUT_DIR=/home/brett/work/LineageTracing/BK18_extracting_subclades_16MPRESUMEBE/data/fastas
NEWICK_DIR=/home/brett/work/LineageTracing/BK18_extracting_subclades_16MPRESUMEBE/data/newicks
for FASTA_PATH in $INPUT_DIR/*.fa.gz
do
    echo $FASTA_PATH
    LABEL=$( basename -s ".fa.gz" $FASTA_PATH )
    TREE_PATH=$NEWICK_DIR/${LABEL}.nwk
    if [ ! -s "$TREE_PATH" ]
    then
        qsub FastTree2_approximate_maximum_likelihood.sh $FASTA_PATH
    fi
done