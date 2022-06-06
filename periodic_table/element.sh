#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ $1 ]]
then
  #get available element
  AVAILABLE_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$(($1)) OR symbol='$1' OR name='$1'")
  
  if [[ -z $AVAILABLE_ATOMIC_NUMBER ]]
  then
    #The argument doesn't exist
    echo "I could not find that element in the database."
  else
    # get and print element info
    ELEMENT_FULL_INFO=$($PSQL "SELECT atomic_number, name, symbol, types.type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$AVAILABLE_ATOMIC_NUMBER")
    echo "$ELEMENT_FULL_INFO" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR MASS BAR MELTING BAR BOILING
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."      
    done

  fi
else
  echo Please provide an element as an argument.
fi
