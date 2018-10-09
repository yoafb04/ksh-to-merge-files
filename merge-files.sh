#!/usr/bin/ksh
# files to be merged -> TEST01.txt, TEST03.txt TEST99.txt ..
umask 111
. $HOME/.bash_profile

echo "Starting shell to merge several files into a new file"
export INPUT_DIR=/file_path
export FILE_PATTERN= 'TEST*.txt'

echo $INPUT_DIR
cd $INPUT_DIR

#Remuving files headers
FILE=$(FILE_PATTERN)
wc -l $FILE
sed -i -e '$a\' TEST*.txt

#appending all files into a new single file
cat TEST*.txt > ALLTESTFILESTEMP.txt

#eliminating duplicate records from the new file
awk '!x[$0]++' ALLTESTFILESTEMP.txt > ALLTESTFILES.txt
rm ALLTESTFILESTEMP.txt

exit 0