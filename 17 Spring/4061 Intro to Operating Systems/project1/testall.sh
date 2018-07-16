#!/bin/bash

solution=$(realpath ./make4061-solution)
ours=$(realpath src/make4061)

make -C src/ > /dev/null

for f in tests/simple_testcase/*
do
	echo Testing make4061 -f $f
	echo Solution:
	$solution -f $f
	echo Ours:
	$ours -f $f
	echo
done

cd tests/make_testcase
echo "in tests/make_testcase"

echo Make from scratch
make clean &> /dev/null
echo Solution:
$solution
make clean &> /dev/null
sleep 1
echo Ours:
$ours
make &> /dev/null
echo


for f in *.{a,o}
do
	echo Removing $f
	rm -f $f
	echo Solution:
	$solution
	sleep 1
	rm -f $f
	echo Ours:
	$ours
	sleep 1
	make &> /dev/null
	echo
	echo Updating $f
	touch $f
	sleep 1
	echo Solution:
	$solution
	sleep 1
	touch $f
	sleep 1
	echo Ours:
	$ours
	sleep 1
	make &> /dev/null
	echo
done
