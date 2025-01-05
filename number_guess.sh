#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDOM_NUMBER=$((RANDOM % 1000 + 1))
GUESSES=0
GUESS=0

echo -e "Enter your username:"
read USERNAME

GAMES_PLAYED=$($PSQL "SELECT games_played FROM user_info WHERE username='$USERNAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM user_info WHERE username='$USERNAME'")

if [[ -z $GAMES_PLAYED ]]; then
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO user_info(username, games_played, guesses, best_game) VALUES('$USERNAME', 0, 0, NULL)")
else
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "Guess the secret number between 1 and 1000:"
while [[ $GUESS -ne $RANDOM_NUMBER ]]; do

  read GUESS
  
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((GUESSES++))

  if [[ $GUESS -gt $RANDOM_NUMBER ]]; then
    echo "It's lower than that, guess again:"    
  elif [[ $GUESS -lt $RANDOM_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  else
    echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    
    UPDATE_GAMES_PLAYED=$($PSQL "UPDATE user_info SET games_played = games_played + 1 WHERE username='$USERNAME'")

    UPDATE_GUESSES=$($PSQL "UPDATE user_info SET guesses = COALESCE(guesses, 0) + $GUESSES WHERE username='$USERNAME'")

    if [[ -z $BEST_GAME || $GUESSES -lt $BEST_GAME ]]; then
      UPDATE_BEST_GAME=$($PSQL "UPDATE user_info SET best_game=$GUESSES WHERE username='$USERNAME'")
    fi 
  fi
done