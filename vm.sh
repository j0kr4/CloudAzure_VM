#!/bin/bash

user=""
password=""

# Parsing des options et des arguments de ligne de commande
while getopts "u:p:" opt; do
  case $opt in
    u) user=$OPTARG;;
    p) password=$OPTARG;;
  esac
done

#Préparation des variables d'environnements
source ./env.sh

# Vérification de l'utilisateur et du mot de passe
if [[ $user == "user1" && $password == "password1" ]]; then
  echo "Bienvenue, utilisateur 1! Vous n'avez aucun crédit!"
elif [[ $user == "user2" && $password == "password2" ]]; then
  echo "Bienvenue, utilisateur 2!"
  # Vérification que le script n'est pas déjà en cours d'exécution
  if [ -f "script.lock" ]; then
    echo "Vous n'avez le droit qu'à une seule VM!"
  else
    echo "Entrez le nom de votre VM Linux : "
    read vm_name
    touch "script.lock"
    python example.py $vm_name
    rm "script.lock"
  fi
elif [[ $user == "user3" && $password == "password3" ]]; then
  echo "Bienvenue, utilisateur 3!"
  # Vérification que le nombre de scripts en cours d'exécution ne dépasse pas 3
  if [ $(pgrep -c example.py) -ge 3 ]; then
    echo "Trop de scripts sont déjà en cours d'exécution!"
  else
    echo "Entrez le nom de votre VM Linux : "
    read vm_name
    python example.py $vm_name &
  fi
else
  echo "Identifiant ou mot de passe invalide!"
fi
