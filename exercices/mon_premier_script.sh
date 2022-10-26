
#/bin/bash
#traitement de l'année 2016, on crée on écrase le fichier sorti
echo "pour l'année 2016" > sortie.txt
grep "Locations" 2016*.ann | wc -l >> sortie.txt
#traitement de l'année 2016, on écrit la suite du fichier
echo "pour l'année 2017" >> sortie.txt
grep "Locations" 2017*.ann >> sortie.txt
#traitement de l'année 2016, on écrit la suite du fichier
echo "pour l'année 2018" >> sortie.txt
grep "Locations" 2018*.ann >> sortie.txt 
