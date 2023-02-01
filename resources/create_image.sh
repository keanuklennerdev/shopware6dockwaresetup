#!/bin/bash

blue=$(tput setaf 4)
normal=$(tput sgr0)

printf "\n${blue}Shopware 6 ${normal}Dockware Configuration\n"
read -p "project name : " PROJECT_NAME
read -p "shopware version [default: ${blue}latest${normal}] : " SHOPWARE_VERSION
read -p "PHP version [default: ${blue}7.4${normal}] : " PHP_VERSION
read -p "dockware image [default: ${blue}dev${normal}] : " IMAGE_TAG
read -p "container Name : " CONTAINER_NAME
read -p "node version [default: ${blue}16${normal}] : " NODE_VERSION
read -p "XDEBUG [default: ${blue}0${normal}] : " XDEBUG

mkdir $PROJECT_NAME
cd $PROJECT_NAME
sleep 1
printf "\ncreated project ${blue}$PROJECT_NAME${normal}\n"

cp ../resources/SW6Dockware/docker-compose.yml ./
sleep 1
printf "created ${blue}docker-compose.yml${normal}\n"

printf "PROJECT_NAME=$PROJECT_NAME\nSHOPWARE_VERSION=$SHOPWARE_VERSION\nPHP_VERSION=$PHP_VERSION\nIMAGE_TAG=$IMAGE_TAG\nCONTAINER_NAME=$CONTAINER_NAME\nNODE_VERSION=$NODE_VERSION\nXDEBUG=$XDEBUG" > .env
sleep 1
printf "created ${blue}.env${normal}\n"

printf "\nsetup ${blue}accomplished!${normal}\n"
