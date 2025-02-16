#!/usr/bin/bash

[[ -z "$db97" ]] && { echo "Script isn't intended to run standalone, instead as part of 'db97' script"; exit 1; }

shopt -s extglob
export LC_COLLATE=C

get_db_name() {
  echo
  read -rp "DB name ('q' to quit): " db_name
  [[ "$db_name" =~ ^[qQ]+([uU][iI][tT])*$ ]] && exit 0;
}

get_db_name
while [[ ! -d "$db97/${db_name:-0}/" ]]; do
  echo "There is no database with the name $db_name"
  get_db_name
done

#           0             1             2                 3                 4                 5                   6          7
opts=("Create Table" "List Tables" "Drop Table" "Insert Into Table" "Select from Table" "Delete from Table" "Update Table" "Exit")
cd "$db97/$db_name" || { echo "Couldn't Connect to $db_name database"; exit 1; }
echo "Connect to $db_name"

while true; do
  echo
  for i in ${!opts[@]}; do
    echo "[$((i+1))] ${opts[i]}"
  done

  read -rp "$db_name _> " opt
  if [[ "$opt" =~ ^[1-8]$ ]]; then
    opt="${opts[opt-1]}"
  else
    opt="wrong"
  fi
  case $opt in
    ${opts[0]})
    echo "To Do"
    ;;

    ${opts[1]})
      echo "To Do"
      ;;

    ${opts[2]})
      echo "To Do"
      ;;

    ${opts[3]})
      echo "To Do"
      ;;

    ${opts[4]})
      echo "To Do"
      ;;

    ${opts[5]})
      echo "To Do"
      ;;

    ${opts[6]})
      echo "To Do"
      ;;

    ${opts[7]})
      echo "Disconnect from $db_name"
      exit 0
      ;;

    *)
      echo "Wrong Choice"
      ;;
  esac
  echo -e "\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
done
