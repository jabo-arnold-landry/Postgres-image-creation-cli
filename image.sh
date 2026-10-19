#!bin/bash
read -p 'DB: ' db
read -p 'DB-user: ' user
read -sp 'DB-password: ' pwd
echo "user is->$user || 'arnold', password is-> $pwd and db is $db!"


#  >  docker-compose.yaml


# cat<<EOF>>docker-compose.yaml
#  services:
#     postgres:
#         image: postgres:18-alpine
#         container_name: testing_bash_docker

# EOF