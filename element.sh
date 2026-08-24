#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c"

# Check if an argument was provided..
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit 0
fi

# Get element information..
if [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT_INFO=$($PSQL "
    SELECT elements.atomic_number, elements.name, elements.symbol,
           properties.atomic_mass,
           properties.melting_point_celsius,
           properties.boiling_point_celsius,
           types.type
    FROM elements
    JOIN properties
      ON elements.atomic_number = properties.atomic_number
    JOIN types
      ON properties.type_id = types.type_id
    WHERE elements.atomic_number = $1;
  ")
else
  ELEMENT_INFO=$($PSQL "
    SELECT elements.atomic_number, elements.name, elements.symbol,
           properties.atomic_mass,
           properties.melting_point_celsius,
           properties.boiling_point_celsius,
           types.type
    FROM elements
    JOIN properties
      ON elements.atomic_number = properties.atomic_number
    JOIN types
      ON properties.type_id = types.type_id
    WHERE elements.symbol = '$1'
       OR elements.name = '$1';
  ")
fi

# Check if the element exists
if [[ -z $ELEMENT_INFO ]]
then
  echo "I could not find that element in the database."
  exit 0
fi

# Extract the values
ATOMIC_NUMBER=$(echo "$ELEMENT_INFO" | cut -d '|' -f 1)
NAME=$(echo "$ELEMENT_INFO" | cut -d '|' -f 2)
SYMBOL=$(echo "$ELEMENT_INFO" | cut -d '|' -f 3)
ATOMIC_MASS=$(echo "$ELEMENT_INFO" | cut -d '|' -f 4)
MELTING_POINT=$(echo "$ELEMENT_INFO" | cut -d '|' -f 5)
BOILING_POINT=$(echo "$ELEMENT_INFO" | cut -d '|' -f 6)
TYPE=$(echo "$ELEMENT_INFO" | cut -d '|' -f 7)

# Display element information
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
