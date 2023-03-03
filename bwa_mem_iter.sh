#!/bin/bash

ref_genome='/home/nilmbb/share/plants/Genomes/flax/GCA_000224295.2_ASM22429v2_genomic.fna'

dir_list=(
  '/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/F22FTSEUHT1158_PLAcoprR/Res/V350133434_L01_B5GPLAcoprRAABA-527'
  '/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/F22FTSEUHT1158_PLAcoprR/Res/V350133434_L01_B5GPLAcoprRAABA-528'
  '/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/F22FTSEUHT1158_PLAcoprR/Res/V350134452_L01_B5GPLAcoprRAABA-527'
  '/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/F22FTSEUHT1158_PLAcoprR/Res/V350134452_L01_B5GPLAcoprRAABA-528'
  '/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/F22FTSEUHT1158_PLAcoprR/Sus/V350133434_L01_B5GPLAcoprRAAAA-525'
  '/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/F22FTSEUHT1158_PLAcoprR/Sus/V350133434_L01_B5GPLAcoprRAAAA-526'
  '/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/F22FTSEUHT1158_PLAcoprR/Sus/V350134452_L01_B5GPLAcoprRAAAA-525'
  '/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/F22FTSEUHT1158_PLAcoprR/Sus/V350134452_L01_B5GPLAcoprRAAAA-526'
  '/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/F22FTSEUHT1158_PLAxeinR/3896'
  '/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/F22FTSEUHT1158_PLAxeinR/987'
)

#/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/F22FTSEUHT1158_PLAcoprR/Res/V350133434_L01_B5GPLAcoprRAABA-527/V350133434_L01_B5GPLAcoprRAABA-527_2.fasta.gz

for dir in "${dir_list[@]}"; do
    #
    sample_name="$(basename "$dir")"
    read1="$dir"/*_1.fasta.gz
    read2="$dir"/*_2.fasta.gz
    echo $read1    #/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/F22FTSEUHT1158_PLAxeinR/3896/V350094918_L01_B5GPLAxeinRAABA-594_1.fasta.gz
    echo $read2    #/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/F22FTSEUHT1158_PLAxeinR/3896/V350094918_L01_B5GPLAxeinRAABA-594_2.fasta.gz
    echo $sample_name    #3896
    sbatch /home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/bwa_results/scripts/bwa_mem_sc2.sh "$sample_name" "$read1" "$read2"
done


