#!/bin/bash
#
#$SBATCH --job-name=wgs_after
#
#$SBATCH --ntasks=1
#$SBATCH --cpus-per-task=16

#f1=$1

#nf=`basename $f1 | awk -F"." '{print $1}'`
#f2=`echo $f1 | sed 's/\_1.fq.gz/\_2.fq.gz/g'`

ref_gen_path = '/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/bwa_results/'

bwa index $ref_gen_path/*
