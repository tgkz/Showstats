# Showstats
Showstats is the set of scripts to see statistics of the specified Git Repository  
You will be able to see How many of -  
- Contributors in the specifc version  
- Commits were merged  
- Number of commits from each companies

All those informations will be shown in the each release.  

Note: "Release" recognized as release-tag in git repository  

## Geting Started

### Pre requesties

You need to download the Git repository you wanted to see its statistics into your local environment.  
In case of Kubernates;

```
$ cd $HOME
$ mkdir projects
$ cd projects
$ git clone https://github.com/kubernetes/kubernetes
```
Note: We have kubernetes git repo in $HOME/projects/kubernetes

### Installing
Download latest showstats source fils and install into you specific directory and then add it to the PATH environment variable.

```
$ cd $HOME
$ mkdir toolbin
$ cd toolbin
$ git clone https://tgkz.github.io/Showstats/

$ PATH=$PATH:$PWD
```


### Prepair using showstats

Showstats need configuration file that includes path of Git repository and filtering specifications.  
Number of real examples are located at ./cf directory so that you are easy to use them. Also ./cf/Example.cf includes more detailed descriptions about each of variables.  

```
$ cd $HOME
$ mkdir showstats
$ cd showstats
$ cp $HOME/toolbin/cf/* .
$ vi Example.cf
```

## Running 

We have kubernetes cf file in the cf directory.  
```
$ showstats kubernetes.cf
```

