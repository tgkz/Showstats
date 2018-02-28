#!/usr/bin/python
# -*- coding: utf-8 -*-
# domain wise count for committer and committed domain 
# note: we must user git shortlog -sne
# git shortlog -sn is not goog because of we are not identify same name but different domain


domlist = {}  # we will use dictinary


def edaddress(eaddress):
    # edit email address with cut middle domain name
    if eaddress == "<>":
	return eaddress
    ns=eaddress.split('@')
    name = ns[0]
    if len(ns) <= 1:
        return eaddress     # we have no domain name in email
    dn = ns[1].split('.')
    l = len(dn)
    lastwd = dn[l-1]
    fixlwd = lastwd[:len(lastwd)-1]  # cut last char ">"
    domain = dn[l-2]+'.'+ fixlwd
    #email = name+'@'+dom
    return domain

def itemreport(domain):
    # print number of commiter 
    item = domlist[domain]
    commiter = len(item)
    #print domain, " ", commiter, " ",
    numcommits = 0
    for i in item:
       numcommits = numcommits + i
    # print number of commits by this email domain
    #print " ", numcommits
    return (commiter, numcommits)

def summary(domlist):
    numdoms = 0
    commiter = 0
    commitcnt = 0
    for k in domlist.keys():
        numdoms = numdoms + 1
        (cmter, cmtcnt) = itemreport(k)
        commiter = commiter + cmter
        commitcnt = commitcnt + cmtcnt
    #print
    #print "Total numcommiters: ", commiter, " numcommits: ", commitcnt,
    print  commiter, "\t", commitcnt, "\t", numdoms,  
    #print "Numdomains:", numdoms  



if __name__ == "__main__":
  import sys
  # read from stdin, we supporse the result of
  # git sortlog -s -n -e 
  # will come 
  #domlist = {}  # we will use dictinary
  for line in sys.stdin:
      field = line.split()
      l = len(field)
      for i in range(0, l-1):
        if (i == 0):
           commitnum = int(field[i]),
           #print '%5d' % commitnum,
      domain = edaddress(field[l-1])
      #print domain
      if (domain in domlist):
           last = domlist[domain]
           domlist[domain] = last + commitnum
      else:
           domlist[domain] = commitnum

  #print domlist
  #print "SUMMARY"
  summary(domlist)

