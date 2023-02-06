#! /bin/bash

PSQL="psql username=freecodecamp --dbname=periodic_table --no-align --typles-only -c"

if [[ $1 ]]
  then
  #if [[ !$1 =~ ^[0-9]+$ ]]
  #hen 

  #fi
  echo "Please provide an element as an argument."
fi 