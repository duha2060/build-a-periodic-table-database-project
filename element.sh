#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --tuples-only -c"
if [[  $1 ]]
  then
  if [[  $1 =~ ^[1-9]+$ ]]
    then 
    element=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements join properties using(atomic_number) join types using(type_id) where atomic_number = '$1'")
  else
    element=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from properties join elements using(atomic_number) join types using(type_id) where name = '$1' or symbol = '$1'")
  fi

  if [[ -z $element ]]
  then
    echo  "I could not find that element in the database."
  else
    echo $element | while IFS=" |" read a_n name symbol type mass m_p b_p
    do 
    #echo $symbol
    echo -e "The element with atomic number $a_n is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $m_p celsius and a boiling point of $b_p celsius."
  done
  fi

  else
  echo "Please provide an element as an argument."
fi 
