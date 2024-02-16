#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games")

WINNER_ID=0
OPPONENT_ID=0

function find_team_id {

  TEMP_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$1'")
  if ((  TEMP_ID == 0 ))
  then 
    echo $($PSQL "INSERT INTO teams(name) VALUES('$1')")
    TEMP_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$1'")

  fi

  if [[ $2 == "WINNER" ]]
  then WINNER_ID=$TEMP_ID
  elif [[ $2 == "OPPONENT" ]]
  then OPPONENT_ID=$TEMP_ID
  fi

}

cat "games.csv" | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do
    if [[ $YEAR == "year" ]]
    then continue
    fi
    
    find_team_id "$WINNER" "WINNER"
    find_team_id "$OPPONENT" "OPPONENT"

    echo "$($PSQL "INSERT INTO games(year, round, winner_id, \
        opponent_id, winner_goals, opponent_goals)
      VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, \
        $WINNER_GOALS, $OPPONENT_GOALS)" \
      )"
done