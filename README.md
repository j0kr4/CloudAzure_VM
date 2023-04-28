# CloudAzure_VM

Ce projet consiste à créer des VM grace au Cloud Azure.

Il contient un fichier d'environnement env.sh qui contient les variables d'environnement azure, un fichier requirements.txt qui contient les dépendances python à installer, un fichier example.py qui contient le script de céation d'une vm Linux et un fichier vm.sh qui contient le script de gestion des utilisateurs

## Avant toute chose

Veuillez executé la commande `pip install -r requirements.txt`

Veuillez modifier les valeurs des variables du fichier env.sh pour y mettre vos clés Azure.

## La liste des utilisateur

user1 password1
user2 password2
user3 password3

Les utilisateurs ont des droits différents:
le user1 ne possède pas de crédit et ne peux pas créer de VM.
le user2 a la possibilité de créer une seule VM Linux à la fois et de choisir le nom de cette VM.
le user3 a la possibilité de créer 3 VM Linux à la fois et de choisir le nom de cette VM.

pour créer une VM avec un utilisateur, il suffit d'entrer la commande `./vm.sh -u <user> -p <password>`
Il vous sera ensuite demandé d'entrer le nom de la VM.
