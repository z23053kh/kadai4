#!/bin/bash

function is_natural_number() {
  num1=$1
  num2=$2
  regex='^[0-9]+$'

  if [[ ! $num1 =~ $regex || ! $num2 =~ $regex ]]; then
    echo '引数は自然数としてください'
    exit 1
  fi
}

function calculate_gcd() {
  num1=$1
  num2=$2

  while [[ $num2 -ne 0 ]]; do
    remainder=$((num1 % num2))
    num1=$num2
    num2=$remainder
  done

  echo $num1
}

if [[ $# -eq 2 ]]; then
  is_natural_number $1 $2
  calculate_gcd $1 $2
else
  echo '引数は2つ指定してください'
  exit 1
fi
