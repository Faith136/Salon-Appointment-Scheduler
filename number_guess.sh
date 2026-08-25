#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"

echo "Enter your username:"
read USERNAME

# Check if the user already exists
USER_INFO=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -n $USER_INFO ]]
then
  # Existing user
  GAMES_PLAYED=$(echo "$USER_INFO" | cut -d '|' -f 2)
  BEST_GAME=$(echo "$USER_INFO" | cut -d '|' -f 3)
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  # New user — capture the INSERT result so psql's status text isn't printed
  INSERT_RESULT=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, NULL)")
  GAMES_PLAYED=0
  BEST_GAME=""
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

# Generate a random secret number
SECRET_NUMBER=$((RANDOM % 1000 + 1))

# Ask for the first guess
echo "Guess the secret number between 1 and 1000:"
read GUESS
GUESSES=1

# Keep asking until the correct number is guessed
while [[ $GUESS != $SECRET_NUMBER ]]
do
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
  read GUESS
  ((GUESSES++))
done

# Successful guess
echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

# Update games played
GAMES_PLAYED=$((GAMES_PLAYED + 1))

# Update best game if this is the user's first game
# or if they got a better score
if [[ -z $BEST_GAME || $GUESSES -lt $BEST_GAME ]]
then
  BEST_GAME=$GUESSES
fi

# Save the updated statistics — capture the result so psql's status text isn't printed
UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'")