#!/bin/bash
fi
input_dir="$1"
output_dir="$2"
max_depth="0"
if [ "$3" == "--max_depth" ]; then max_depth = "$4"
fi
copy()
{
	input_dir="$1"
	output_dir="$2"
	max_depth="$3"
	depth="$4"
	if [ "$max_depth" -ne "0" && "$depth" -ge "$max_depth" ]; then return
	fi
	for i in "$input_dir"/*;
	do if [ -d "$i" ]; then copy "$i" "$output_dir" "$max_depth" $((depth+1))
	else; then 
	c=1
	file = $(basename "$i")
	output="$output_dir/$file"
	while [ -f "output" ];
	 do output = "$output_dir/${file%.*}~$c.${file##*.}" 
	c=$((c+1))
	done
	cp "$i" "$output"
	fi
	done
}	
copy "$input_dir" "$output_dir" "$max_depth" 0