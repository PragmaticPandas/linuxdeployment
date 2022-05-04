#!/bin/bash
argument1=test
argument2=2345

function test() { 
echo $0;

echo $1;

echo $2;
}

test $argument1 $argument2
