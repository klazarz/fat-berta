#! /bin/zsh

#scp /Users/kevin/Library.xml opc@130.61.182.191:.

rsync -avzh Library.xml  opc@130.61.187.216:.

rm /Users/kevin/Library.xml 
