# IMPORTANT: This README is still underconstruction, some parts are incorrect and some parts are not yet implemented

# Showstats
Showstats is the set of scripts to see statistics of the specified Git Repository  
You will be able to see -  
- How many of contributors in the specifc version  
- How many commits were merged  
- How many number of commits from email domains, that means how many companies were participated  
All those informations will be shown in the each indiviual release.  

Note: Release recognized as release-tag in git repository  

## Geting Started

### Preresuesties

You need to download the Git repository/repositories you wanted to see its statistics into your local environment.  
In case of Kubernates;

```
$ cd $HOME
$ mkdir projects
$ cd projects
$ git clone https://github.com/kubernetes/kubernetes
```
Note that we have kubernetes git repo in $HOME/projects/kubernetes

### Installing
Download latest showstats source fils and install into you specific directory and then add it to the PATH environment variable.

```
$ cd $HOME
$ mkdir toolbin
$ cd toolbin
$ git clone https://github.com/tgkzsh/Showstats
$ PATH=$PATH:$PWD
```


### Prepare using showstats

Showstats need setupfile that includes path of Git repository and filtering specifications.  
Number of real examples are located at ./Example directory so that you are easy to use them. Also ./Exmaple/Example.setup includes more detailed descriptions about each of variables.  

```
$ cd $HOME
$ mkdir showstats
$ cd showstats
$ cp $HOME/toolbin/Example/* .
$ vi Example.setup
```

## Running 

We have kubernetes setup file in the Example directory.  
```
$ showstats kubernetes-stable.setup
```

