#!/usr/bin/bash

#extracts content of a tar file specified as the first command line
#argument and counts the number of files with word success and files with word failure

tar_file=$1


SCRATCH=`mktemp --directory`

# echo $SCRATCH

tar zxf $tar_file --directory $SCRATCH

num_success=`grep -lr SUCCESS $SCRATCH | wc -l`
num_failures=`grep -lr FAILURE $SCRATCH | wc -l`

echo "There were $num_success successes and $num_failures failures."

rm -rf $SCRATCH