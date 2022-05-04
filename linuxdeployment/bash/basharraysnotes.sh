#!/bin/bash
function basharraysnotes() { 

#create list
list=(0 1 2 3 4 5)

#echo will only output the first element of the list
echo $list

#use {} to denote when a variable begins and ends, to target elements
echo ${list[1]}

#use @ symbol to target all the elements in an array
echo ${list[@]}

#loop through all elements of an array with a for loop
for number in ${list[@]}; do
  echo $number
done

#loop over the array by indices instead of elements
for i in ${!list[@]}; do
  echo ${list[$i]}
done
#use this loop to return both the index and value in a loop
#iterating by indice saves you from creating an additional variable

#https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays 
}

basharraysnotes
