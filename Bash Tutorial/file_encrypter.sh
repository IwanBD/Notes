#!/bin/bash

echo "This is a simple file encrypter/decrypter"
echo "Please choose what you want to do"

choices="Encrypt Decrypt"
select option in $choices; do
    if [ $REPLY -eq 1 ]; then
        echo "You have selected Encryption"
        echo "Please enter the file name"
        read file
        if [ -f "$file" ]; then
            gpg -c "$file"
            echo "The file has been encrypted"
        else
            echo "File does not exist"
        fi
        break
    else
        echo "You have selected Decryption"
        echo "Please enter the file name"
        read file
        if [ -f "$file" ]; then
            gpg -d "$file"
            echo "The file has been decrypted"
        else
            echo "File does not exist"
        fi
        break
    fi
done
