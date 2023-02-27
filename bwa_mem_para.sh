#!/bin/bash

ref_genome='/home/nilmbb/share/plants/Genomes/flax/GCA_000224295.2_ASM22429v2_genomic.fna'

directories=(
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

process_fasta_file() {
  local fq_file="$1"
  local base_name="${fq_file%.fasta.gz}"
  
  gunzip -c "$fq_file" > "$base_name.fasta"
  /home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/bwa_results/scripts/bwa-0.7.17/bwa mem "$ref_genome" "$base_name.fasta" > "$base_name.sam"
  /home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/bwa_results/sam/samtools-1.16.1/samtools view -bS "$base_name.sam" > "$base_name.bam"
  /home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/bwa_results/sam/samtools-1.16.1/samtools sort "$base_name.bam" -o "$base_name.sorted.bam"
  #no need indexing?
  /home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/bwa_results/sam/samtools-1.16.1/samtools index "$base_name.sorted.bam"
  /home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/bwa_results/sam/samtools-1.16.1/samtools flagstat "$base_name.sorted.bam" > "$base_name.flagstat.txt"
  rm "$base_name.fasta" "$base_name.sam" "$base_name.bam"
}


for fq_file in /home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/*/*/*.fasta.gz; do
  process_fasta_file "$fq_file"
done
