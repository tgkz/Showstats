#!/bin/bash
# version tag tester
# usage: versiotagtest setupfile

# default variable setup
GITREPO=NULL
YEARS_TO_SHOWN=1
VERSION_TAG_FILER="*"
if [ $# -eq 0 ] ; then
   echo "No setup file specified"
   exit 1
fi
source  $1   # include specific values

# printe headers
echo -e "Project: " $PROJECT
echo -e "GITREPO: " $GITREPO
echo -ne "Date: "; date
#echo -e "Version" " " "Date" "\t" "#committer" "\t" "commits   domain"
# start version report
dir=$GITREPO
cd $dir
#git tag -l
echo '$VRESION_TAG_FILTER='$VERSION_TAG_FILTER
echo '$VERSION_TAG_UNFILTER='$VERSION_TAG_UNFILTER
if [ "$VERSION_TAG_UNFILTER" != "" ]; then
    git tag -l |grep $VERSION_TAG_FILTER|grep -v $VERSION_TAG_UNFILTER|sort -r --version-sort
else
    echo version un filter not exist
    git tag -l |grep $VERSION_TAG_FILTER| sort -r --version-sort
fi
#ver=`git tag -l  |sort -r --version-sort `

#for i in  $ver
#do
#  echo  -n $i " "
#  set `git log -1 --pretty=format:%ai $i`; echo -ne $1 '\t' #print tag and date
#  git shortlog -sne $i| domcount.py ; echo
#  #set `git shortlog -s $i |wc -l`; echo -e $1 '\t'  #  print num contributors
#  #(cd ..;  sh gitlinecount.sh $dir $i)
#done | grep $VERSION_TAG_FILTER
