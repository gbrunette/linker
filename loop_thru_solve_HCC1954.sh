#!/bin/bash

#CHR_list=('chr1' 'chr2' 'chr3' 'chr4' 'chr5' 'chr6' 'chr7' 'chr8' 'chr9' 'chr10' 'chr11' 'chr12' 'chr13' 'chr14' 'chr15' 'chr16' 'chr17' 'chr18' 'chr19' 'chr20' 'chr21' 'chr22' 'chrX')
CHR_list=('chr22' 'chr21' 'chr20' 'chr19' 'chr18' 'chr17' 'chr16' 'chr15' 'chr14' 'chr13' 'chr12' 'chr11' 'chr10' 'chr9' 'chr8' 'chr7' 'chr6' 'chr5' 'chr4' 'chr3' 'chr2' 'chr1' 'chrX')

input_graph_file="./output/graph_variant_oct18_HCC1954_all_"
string_id="oct18_HCC1954_all"
nohup_file="nohup_solve_"$string_id"_"


for chr_choice in "${CHR_list[@]}"
do
        loop_nohup_file=$nohup_file$chr_choice".out"
	loop_graph_file=$input_graph_file$chr_choice".dat"
        echo $loop_nohup_file
	echo $loop_graph_file
        echo $string_id
        nohup ./linker solve -c $chr_choice -i $loop_graph_file -n $string_id > $loop_nohup_file &
done



