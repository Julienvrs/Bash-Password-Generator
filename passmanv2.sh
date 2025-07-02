#!/bin/bash

#check if ccrypt is installed
if ! command -v ccrypt &> /dev/null; then
    echo "Erreur: ccrypt is not installed. Install with sudo apt install ccrypt"
    exit 1
fi

#message d'accueil
echo "I'm making my own pw generator cause I fck h8 coding right now"
echo "Please enter the length of your fucking password so I can generate it:"

#lecture de la longueur du mdp
read PASS_LENGTH

#validation de l'entrée (entiers uniquement)
if ! [[ $PASS_LENGTH =~ [0-9]+$ ]]; then
    echo "Error: Integers only."
    exit 1
fi

#création d'un tableau pour stocker les mdp
passwords=()

#génération de 3 mdp
for p in $(seq 1 3); do
    passwords+=("$(openssl rand -base64 48 | cut -c1-$PASS_LENGTH)")
done

#affichage
echo "Here are the generated passwords:"
printf "%s\n" "${passwords[@]}"

#Demande de save
echo "Do you want to save these passwords to a file? (y/n)"
read choice

if [ "$choice" = "y" ]; then
    #demande une passphrase pour encrypter le fichier
    echo "Enter a passphrase to encrypt the file /!\ DO NOT FORGET IT /!\:"
    read -s PASSPHRASE
    echo #pour forcer le retour a la ligne apres lecture 

    #check si la passphrase est vide ou non
    if [ -z "$PASSPHRASE" ]; then
        echo "Error: Passphrase cannot be empty"
        exit 1
    fi

    #creation d'un fichier temporaire contenant les mdp
    TMP_FILE="passwords.txt"
    printf "%s\n" "${passwords[@]}" > "$TMP_FILE"

    #chiffrement du fichier
    ccrypt -e -K "$PASSPHRASE" "$TMP_FILE"

    #suppression du fichier non chiffré
    [ -f "$TMP_FILE" ] && rm "$TMP_FILE"

    echo "Passwords saved securely to passwords.txt.cpt"
elif [ "$choice" = "n" ]; then
    echo "Passwords not saved."
else
    echo "Invalid choice."
fi