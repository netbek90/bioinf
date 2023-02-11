#!/bin/bash
#
#$SBATCH --job-name=wgs_after
#
#$SBATCH --ntasks=1
#$SBATCH --cpus-per-task=16

ref_genome=XXX.fasta

path_F22FTSEUHT1158_PLAcoprR_Res= '/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/Res'
path_F22FTSEUHT1158_PLAcoprR_Sus= '/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/Sus'
path_F22FTSEUHT1158_PLAxeinR_3896= '/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/F22FTSEUHT1158_PLAxeinR/3896'
path_F22FTSEUHT1158_PLAxeinR_987= '/home/nilmbb/share/plants/BSSEQ/Bseq1022/analysis/results/F22FTSEUHT1158_PLAxeinR/987'


directories=($path_F22FTSEUHT1158_PLAcoprR_Res $path_F22FTSEUHT1158_PLAcoprR_Sus $path_F22FTSEUHT1158_PLAxeinR_3896 $path_F22FTSEUHT1158_PLAxeinR_987)

for directory in "${directories[@]}"
do
  for fq_file in $directory/*.fasta.gz
  do
    base_name=${fq_file%.fasta.gz}

    gunzip -c $fq_file > $base_name.fasta

    bwa mem $ref_genome $base_name.fasta > $base_name.sam

    samtools view -bS $base_name.sam > $base_name.bam

    samtools sort $base_name.bam -o $base_name.sorted.bam


    samtools index $base_name.sorted.bam

    rm $base_name.fasta
  done
done

