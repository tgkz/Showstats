# IMPORTANT: This README is still underconstruction, some parts are incorrect and some parts are not yet implemented
----
Showstats is an set of scripts that will shown specific Git repository.
You will be able to see -
How many of contributors in the specifc version
How many commits were merged
How many number of commits from email domains, that means how many companies were participated
All those informations will be shown in the each indiviual release.

Note: Release recognized as release-tag in git repository


By using showstats, you will be able to see how the open source project is moving

----
#### To install showstats

Down load latest showstats source fils and install in to you specific directory and then add it to the PATH environment variable.

$ cd $HOME
$ mkdir toolbin
$ cd toolbin
$ git clone https://SHOWSTATS's git hub URL
$ PATH=$PATH:$PWD

#### To prepare using showstats

Showstats need setupfile that includes specific Git repository and filtering specifications.
Number of real examples are located at ./Example directory so that you are easy to use them. Also ./Exmaple/Example.setup includes more detailed descriptions about each of variables.

$ cd $HOME
$ mkdir showstats
$ cp $HOME/toolbin/Example/* .
$ vi Example.setup
 
Also, we need to download/pull Git repository you would like to analyze
In the case of Kubernetes, here it is:

$ cd $HOME
$ mkdir CNCF
$ cd CNCF
$ git clone https://kubernetes git repo



### To start using showstats


