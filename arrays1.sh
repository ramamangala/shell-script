#!/bin/bash
fruits=("apple" "banana" "cherry")
echo "1st element = ${fruits[0]}"
echo "2nd element = ${fruits[1]}"
echo "3rd element = ${fruits[2]}"
echo "ALL elements : ${fruits[@]}"
echo "${#fruits[@]}"
