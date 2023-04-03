#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ ISHAQ's SALOON ~~~~~\n"

SERVICES_MENU() {
if [[ $1 ]]
then
echo -e "\n$1"
fi

echo "welcome to my Salon, how can I help you?"
echo -e "\n1) cut \n2) color \n3) perm \n4) style \n5) trim"

read SERVICE_ID_SELECTED

case $SERVICE_ID_SELECTED in
1) CUT ;;
2) COLOR ;;
3) PERM ;;
4) STYLE ;;
5) TRIM ;;
*) SERVICES_MENU "Please select a Service with nos. 1-5" ;;
esac
}

CUT() {
  #get service_id
  SERVICE_ID=$($PSQL "SELECT service_id from services where service_id = $SERVICE_ID_SELECTED")
  echo -e "\nYou have selected our Cutting Service\n" 
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED ")

  echo "What is your phone number?"
  read CUSTOMER_PHONE 
  #get customer's name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
  echo -e "\nYou are not yet a Customer"
  echo -e "\nWhat is your name?"
  read CUSTOMER_NAME
  #insert new customer 
  INSERT_CUSTOMER_DATA=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi

  #get time
  echo -e "\nWhat time would you like to cut, $CUSTOMER_NAME?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ $SERVICE_TIME ]]
   then
  #Insert the data into appointment table
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")
  
  if [[ $INSERT_APPOINTMENT ]]
  then
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
 fi
}

COLOR() {
  #get service_id
  SERVICE_ID=$($PSQL "SELECT service_id from services where service_id = $SERVICE_ID_SELECTED")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED ")
  echo -e "\nYou have selected our coloring Service\n" 
  
  echo "What is your phone number?"
  read CUSTOMER_PHONE 
  #get customer's name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
  echo -e "\nYou are not yet a Customer"
 
    echo -e "\nWhat is your name?"
  read CUSTOMER_NAME
  #insert new customer 
  INSERT_CUSTOMER_DATA=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi

  #get time
  echo -e "\nWhat time would you like to $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ $SERVICE_TIME ]]
   then
  #Insert the data into appointment table
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")
  
  if [[ $INSERT_APPOINTMENT ]]
  then
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
 fi
}

PERM() {
  #get service_id
  SERVICE_ID=$($PSQL "SELECT service_id from services where service_id = $SERVICE_ID_SELECTED")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED ")
  echo -e "\nYou have selected our perming Service\n" 
  
  echo "What is your phone number?"
  read CUSTOMER_PHONE 
  #get customer's name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
  echo -e "\nYou are not yet a Customer"

    echo -e "\nWhat is your name?"
  read CUSTOMER_NAME
  #insert new customer 
  INSERT_CUSTOMER_DATA=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi

  #get time
  echo -e "\nWhat time would you like to $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ $SERVICE_TIME ]]
   then
  #Insert the data into appointment table
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")
  
  if [[ $INSERT_APPOINTMENT ]]
  then
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
 fi
}

STYLE() {
  #get service_id
  SERVICE_ID=$($PSQL "SELECT service_id from services where service_id = $SERVICE_ID_SELECTED")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED ")
  echo -e "\nYou have selected our styling Service\n" 
  
  echo "What is your phone number?"
  read CUSTOMER_PHONE 
  #get customer's name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
  echo -e "\nYou are not yet a Customer"
    echo -e "\nWhat is your name?"
  read CUSTOMER_NAME
  #insert new customer 
  INSERT_CUSTOMER_DATA=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi

  #get time
  echo -e "\nWhat time would you like to $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ $SERVICE_TIME ]]
   then
  #Insert the data into appointment table
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")
  
  if [[ $INSERT_APPOINTMENT ]]
  then
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
 fi
}

TRIM() {
  #get service_id
  SERVICE_ID=$($PSQL "SELECT service_id from services where service_id = $SERVICE_ID_SELECTED")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED ")
  echo -e "\nYou have selected our triming Service\n" 
  
  echo "What is your phone number?"
  read CUSTOMER_PHONE 
  #get customer's name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
  echo -e "\nYou are not yet a Customer"
    echo -e "\nWhat is your name?"
  read CUSTOMER_NAME
  #insert new customer 
  INSERT_CUSTOMER_DATA=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi

  #get time
  echo -e "\nWhat time would you like to $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ $SERVICE_TIME ]]
   then
  #Insert the data into appointment table
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")
  
  if [[ $INSERT_APPOINTMENT ]]
  then
  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
 fi
}
SERVICES_MENU
