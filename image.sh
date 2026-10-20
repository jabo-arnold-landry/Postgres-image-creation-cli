#!bin/bash

if [[  -s docker-compose.yml ]]
  then
    echo "the file is already created!"
    exit 0
 fi

# database fields correction
read -p 'DataBase-name(*): ' db
if [[ -z $db ]]
    then
        echo "The database field cannot be empty!"
        exit 1
fi

read -p 'DataBase-user(*): ' user
if [[ -z $user ]]
    then
        echo "The user field cannot be empty!"
        exit 1
fi

read -p 'Container-name: ' container_name
read -p 'Container-port(if omitted, the container will use default postgresql default port of 5432): ' port
read -p 'Volume-name: ' vol_name

read -sp 'DataBase-password(*): ' pwd
if [[ -z $pwd ]]
    then
        echo "The password field cannot be empty!"
        exit 1
fi

#file creation and writing
 >  docker-compose.yml

cat<<EOF>>docker-compose.yml
 services:
    postgres:
        image: postgres:18-alpine
        container_name: ${container_name:= $db}

        environment:
            POSTGRES_USER: $user
            POSTGRES_PASSWORD: $pwd
            POSTGRES_database: $db

        ports:
            - ${port:=5432}:5432
        volumes:
            - ${vol_name:=database-data}:/var/postgresql

 volumes:
    ${vol_name:=database-data}:

EOF