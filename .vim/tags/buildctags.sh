#!/bin/bash

for DIR in `cat dirlist`
do
  FILES=`ls -1 $DIR/*.pc|tee a`
  if [ -z "$FILES" ]; then
    FILES=`ls -1 $DIR/*.[ch]`
  else
    CFILES=`ls -1 $DIR/*.c|tee b`
    A=`sed "s/\.[a-z]*$//" a |tee c`
    B=`sed "s/\.[a-z]*$//" b |tee d`
    for C in `cat c`
    do
      sed "\&$C&d" d > e
      mv e d
    done
    sed "s/$/.c/" d >> a
    FILES=`cat a`
  fi
  if [ -n "$FILES" ]; then
    ctags $FILES
    cat tags >> alltags
  fi
done
cat alltags | sort -u > tags
rm alltags
rm a b c d
