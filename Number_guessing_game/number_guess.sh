#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --tuples-only -c"
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

# Guessing number function
READ_NUMBER() {
  
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi  
  
  read NUMBER
  

  if [[ ! $NUMBER =~ ^[0-9]+$ ]]
  then     
    COUNTER=$((COUNTER+1))
    READ_NUMBER "That is not an integer, guess again:"
  else
    if [[ $SECRET_NUMBER -eq $NUMBER ]] 
    then
      echo You guessed it in $COUNTER tries. The secret number was $SECRET_NUMBER. Nice job!
    else
      if [[ $SECRET_NUMBER -gt $NUMBER ]]
      then
        COUNTER=$((COUNTER+1))
        READ_NUMBER "It's higher than that, guess again:"
      else
        COUNTER=$((COUNTER+1))
        READ_NUMBER "It's lower than that, guess again:"
      fi
    fi

  fi

}

# Checking the username
echo Enter your username:
read USERNAME

CHECK_USERNAME=$($PSQL "SELECT * FROM scoreboard WHERE username='$USERNAME'")

if [[ -z $CHECK_USERNAME ]]
then
  # welcome new user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # insert new user to database
  INSERT_NEW_USERT_TO_DB=$($PSQL "INSERT INTO scoreboard(username) VALUES('$USERNAME')")
else
  # welcome user and pass his stats
  echo "$CHECK_USERNAME" | while read USER_ID BAR NAME BAR GAMES_PLAYED BAR BEST_GAME
  do
    echo Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
  done
fi

# Guessing the number
echo "Guess the secret number between 1 and 1000:"
COUNTER=1
READ_NUMBER

# add new record if there is
GET_BEST_GAME=$($PSQL "SELECT best_game FROM scoreboard WHERE username='$USERNAME'")
if [[ $GET_BEST_GAME -eq 0 ]]
then
  INSERT_NEW_RECORD=$($PSQL "UPDATE scoreboard SET best_game=$COUNTER WHERE username='$USERNAME'")
elif [[ $GET_BEST_GAME -gt $COUNTER ]]
  then
    INSERT_NEW_RECORD=$($PSQL "UPDATE scoreboard SET best_game=$COUNTER WHERE username='$USERNAME'")
fi

# add another game to scoreboard
GET_GAMES_PLAYED=$($PSQL "UPDATE scoreboard SET games_played=games_played+1 WHERE username='$USERNAME'")
