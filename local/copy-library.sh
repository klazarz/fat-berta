#! /bin/zsh

#scp /Users/kevin/Library.xml opc@130.61.182.191:.

#rsync -avzh /Users/kevin/Library.xml  opc@130.61.187.216:.

mv /Users/kevin/Library.xml /Users/kevin/Documents/GitHub/fat-berta/data/.

python3 /Users/kevin/Documents/GitHub/fat-berta/bin/transform.py

oci os object put -ns fropgpctldxd -bn hafur --name library.csv --file ../data/library_redo.csv --force
#rm /Users/kevin/Library.xml 
