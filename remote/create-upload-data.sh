#! /usr/bin/zsh

python transform.py

oci os object put -ns fropgpctldxd -bn hafur --name library.csv --file library_redo.csv --force


