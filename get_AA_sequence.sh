#change MS-DOS to ASCII or text mode
#line 3 needs to be typed into terminal and "^M" is CTRL-V and then CTRL-M
#sed -e "s/^M//g" original_files.txt > new_file.txt
#sed 'N;N;N;N;N;N;N; s/\n//g' newfile.txt > temp.txt  ; This depends on the lines
echo "Well_number DNA_seq AA_seq" > result.txt
#depends on keywrods
grep 'GTGGGTAAACAGTTCGACGTTACC' temp.txt | grep 'ATCGAAGCGAAGGCGCTG' > filtered_seq.txt
#look forward and look back options depends on keywords
ggrep -o -P '(?<=Sample).*(?=_Premixed)' filtered_seq.txt > Well_number.txt
ggrep -o -P '(?<=GTGGGTAAACAGTTCGACGTTACC).*(?=ATCGAAGCGAAGGCGCTG)' filtered_seq.txt | tr a-z A-Z > DNA_seq.txt
cat  DNA_seq.txt | sed -n -e 's/\(...\)/\1 /gp' | sed -f DNA_codon.sed > AA_seq.txt
paste -d ' ' Well_number.txt DNA_seq.txt AA_seq.txt >> Result.txt
#remove duplicates, irregular length and ones containing stop codons
awk '(NR>1) && (!seen[$3]++) && (length($3)==6) && (!/\*/)' Result.txt > Clean_result.txt



#join lines
#start=2
#end=7
#for i in open(P24975_Plate1.seq.txt)
#do
#paste -d '\n' - - - - - - - - P24975_Plate1.seq.txt
# | sed -n 's/TTCGACGTTACC/ATCGAAGCGA/'
#|sed -n -e 's/\(...\)/\1 /gp' | sed -f DNA_codon.sed > temp.txt
#sed -n 'p;n' P24975_Plate1.seq.txt | sed -n 's/>/,/_Plate/'> rawdata.txt
#sed -n 'n;p' P24975_Plate1.seq.txt | sed -n 's/TTCGACGTTACC/,/ATCGAAGCGA/'> rawdata_temp.txt
#paste -d ' ' rawdata
#for

#sed s///$linex
#linex +1=
