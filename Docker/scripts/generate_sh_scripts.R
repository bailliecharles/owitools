## Script for generating the sh files for paired-end alignment, demultiplexing and ecotag


for (i in 1:8){
  outfile <- file(paste("MYC2paired_part",i,".sh",sep=""),"w")
  writeLines("#!/bin/bash",con = outfile)
  writeLines(paste("illuminapairedend -r MYC2_R2_part_",sprintf("%01d", i),".fastq MYC2_R1_part_",sprintf("%01d", i),".fastq | obiannotate -S goodali:'",'"',"Good_MYC2.part-",sprintf("%02d", i),'"'," if score>40.00 else ",'"','Bad_MYC2.part-',sprintf("%02d", i),'"',"'  | obisplit -t goodali",sep=""),con = outfile)
  close(outfile)

  outfile <- file(paste("MYC2ngsfilter_part",i,".sh",sep=""),"w")
  writeLines("#!/bin/bash",con = outfile)
  writeLines(paste("ngsfilter -t ngsfilter_MYC2_COI.tsv --fasta-output -u unidentified_MYC2.part-",sprintf("%02d", i),".fasta Good_MYC2.part-",sprintf("%02d", i),".fastq > MYC2.filtered.part-",sprintf("%02d", i),".fasta",sep=""),con = outfile)
  close(outfile)

  outfile <- file(paste("MYC2lenfilter_part",i,".sh",sep=""),"w")
  writeLines("#!/bin/bash",con = outfile)
  writeLines(paste("obigrep -p 'seq_length>303' -p 'seq_length<323' -s '^[ACGT]+$' MYC2.filtered.part-",sprintf("%02d", i),".fasta > MYC2.filtered_length.part-",sprintf("%02d", i),".fasta",sep=""),con = outfile)
  close(outfile)

 # outfile <- file(paste("LERA_swarm13nc.ecotag_part",i,".sh",sep=""),"w")
 # writeLines("#!/bin/bash",con = outfile)
 # writeLines(paste("ecotag -d ~/../ubuntu/taxo/taxo_Sep2017 -R ~/../ubuntu/taxo/db_COI_Sep2017u.fasta ~/LERA/LERA_seeds_part_",i,".fasta > ~/LERA/LERA_ecotag_part_",sprintf("%02d", i),".fasta",sep=""),con = outfile)
 # close(outfile)

  }

