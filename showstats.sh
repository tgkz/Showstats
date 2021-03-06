#!/bin/bash
# print statistics for specific Gitrep
# usage: showstats cf-file
#
# ex. showstats hyperledger.cf

GITREPO=""
GITDIR="./"  # default is current
VERSION_TAG_FILER="*"
if [ $# -eq 0 ] ; then
   echo "No config file specified"
   exit 1
fi
source  $1   # include configration file to get specific values
if [ $GITDIR = "./" ]; then
    echo "WARING: configration file may not specify GITDIR in " $1
    exit 1
fi 
 
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
# we create from-version-tag..to-version-tag with list from $ver
set $ver ; shift ; from=$@   # remove 1st item and stro to $from
set $ver # to refere as $1 in loop
verlist=""
for f in $from
do 
  verlist="$verlist $f..$1"
  shift
done
# end of making version..version list
for i in  $verlist
do
  echo  -n $i " "
  set `git log -1 --pretty=format:%ai $i`; echo -ne $1 '\t' #print tag and date
  git shortlog -sne $i| domcount ; echo -n
  #set `git shortlog -s $i |wc -l`; echo -e $1 '\t'  #  print num contributors
  #(cd ..;  sh gitlinecount.sh $dir $i)
done 
