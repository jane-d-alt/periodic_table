PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

NUM='^[0-9]+$'
SYM='^[A-Z][a-z]?$'
NAM='^[A-Z][a-z]{2,}$'

if [[ $1 ]]
then
  #if arg is number
  if [[ $1 =~ $NUM ]]
  then
    OBJECT=$($PSQL "SELECT * FROM elements JOIN properties ON elements.atomic_number=properties.atomic_number JOIN types ON properties.type_id = types.type_id WHERE elements.atomic_number=$1")
  elif [[ $1 =~ $SYM ]]
  then
    OBJECT=$($PSQL "SELECT * FROM elements JOIN properties ON elements.atomic_number=properties.atomic_number JOIN types ON properties.type_id = types.type_id WHERE elements.symbol='$1'")
  elif [[ $1 =~ $NAM ]]
  then
    OBJECT=$($PSQL "SELECT * FROM elements JOIN properties ON elements.atomic_number=properties.atomic_number JOIN types ON properties.type_id = types.type_id WHERE elements.name='$1'")
  fi
  if [[ -z $OBJECT ]]
  then
   echo "I could not find that element in the database."
  else
    echo "$OBJECT" | while read NUMBER BAR SYMBOL BAR NAME BAR NUMBER2 BAR MASS BAR MELT BAR BOIL BAR TYPEID BAR TYPEID2 BAR TYPE
    do
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
    done
  fi
else
  echo "Please provide an element as an argument."
fi
