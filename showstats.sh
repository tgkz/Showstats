#!/bin/bash
# print statistics for specific Gitrep
# usage: showstats setupfile
# ex. showstats hyperledger.setup
# default variable setup
GITREPO=""
GITDIR="./"  # default is current
#YEARS_TO_SHOWN=1
VERSION_TAG_FILER="*"
if [ $# -eq 0 ] ; then
   echo "No setup file specified"
   exit 1
fi
source  $1   # include specific values
set $@=`grep https $GITDIR/.git/config`
GITREPO=$4

# printe headers
echo -e "Project: " $PROJECT
echo -e "GITREPO: " $GITREPO
echo -ne "Date: "; date
echo -e "Version" " " "Date\t\t#cmiter\t#cmits\t#domain"
# start version report
cd $GITDIR
if [ "$VERSION_TAG_UNFILTER" != "" ]; then
    ver=`git tag -l  |grep $VERSION_TAG_FILTER| grep -v $VERSION_TAG_UNFILTER|sort -r --version-sort `
else
    ver=`git tag -l  |grep $VERSION_TAG_FILTER| sort -r --version-sort `
fi
for i in  $ver
do
  echo  -n $i " "
  set `git log -1 --pretty=format:%ai $i`; echo -ne $1 '\t' #print tag and date
  git shortlog -sne $i| domcount ; echo -n
  #set `git shortlog -s $i |wc -l`; echo -e $1 '\t'  #  print num contributors
  #(cd ..;  sh gitlinecount.sh $dir $i)
done 
