#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if[[$YEAR != "year"]]
  then
    #Team_id
    
    if [[ -z $WINNER_ID ]]
    then
      $($PSQL "INSERT INTO teams(team) VALUES ($WINNER)")
      WINNER_ID=$(PSQL "SELECT team_id FROM teams WHERE team=$WINNER");

    if [[ -z $OPPONENT_ID ]]
    then
      $($PSQL "INSERT INTO teams(team) VALUES ($OPPONENT)")
      OPPONENT_ID=$(PSQL "SELECT team_id FROM teams WHERE team=$OPPONENT");

#get new team_ids
WINNER_ID=$(PSQL "SELECT team_id FROM teams WHERE team=$WINNER");
OPPONENT_ID=$(PSQL "SELECT team_id FROM teams WHERE team=$OPPONENT");
done
