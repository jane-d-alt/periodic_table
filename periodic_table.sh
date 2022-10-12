PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ $1 ]]
then
  # if value is number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # if value in elements.atomic_number
    ATOMIC_NUMBER=$($PSQL 'SELECT * from elements WHERE atomic_number='$1'')
    if [[ $ATOMIC_NUMBER ]]
    then
      echo -e "1 The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."
    fi    
  # else if value in elements.symbol
  else
    SYMBOL=$($PSQL 'SELECT * FROM elements where symbol='$1'')
  fi
  if [[ $SYMBOL ]]
  then
    echo -e "2 The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."
  # else if value in elements.name
  else
    NAME=$($PSQL 'SELECT * FROM elements where symbol='$1'')
  fi
  if [[ $NAME ]]
  then
    echo -e "3 The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."
  else
    echo "Please provide an element as an argument."  
  fi
else
  echo "Please provide an element as an argument."
fi


