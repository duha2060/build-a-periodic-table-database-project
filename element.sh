#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --tuples-only -c"
if [[ -z  $1 ]]
  then
  echo "Please provide an element as an argument."
fi 

if [[ $1 =~ ^[0-9]+$ ]]
  then 
  element=$($PSQL " select * from elements join properties using(atomic_number) join types using(type_id) where atomic_number = '$1'")
else
  element=$($PSQL " select * from elements join properties using(atomic_number) join types using(type_id) where name = '$1' or symbol = '$1' ")
 fi
