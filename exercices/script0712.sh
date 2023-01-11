#ce script est fait pour être lancé à la racine du dossier projet
#cela lui permet de récuperer les fichiers dans les bons dossiers
#
#se lancera donc comme ça : 
#$ ./programme/script.sh

if [[ $# -ne 2 ]]
then
	echo "Deux arguments attendus <dossier> <langue>"
	exit
fi

folder=$1 #dumps text ou contextes
basename=$2 
#le basename correspond au fichier url de la langue qu'on étudie

echo "<lang="$basename">" > "itrameur/$folder-$basename.txt" 

for filepath in $(ls $folder/$basename-*.txt)
do
	#filepath == dumps texts/fr-1.txt
	# ==> pagename = fr-1
	pagename=$(basename -s.txt $filepath)
	
	echo "<page=\"$pagename\">" >> "itrameur/$folder-$basename.txt"
	echo "<text>" >> "./itrameur/$folder-$basename.txt"

	#on récupere les dumps/contextes
	#et on écrit à l'intérieur de la balise test
	content=$(cat $filepath)
	#ordre important : & en premier
	#sinon : < => &lt; ==> &amp 
	content=$(echo "$content" | sed 's/&/&amp;/g')
	content=$(echo "$content" | sed 's/</&lt;/g')
        content=$(echo "$content" | sed 's/</&gt;/g')
	
	echo "$content" >> "itrameur/$folder $basename.txt"

        echo "</text>" >> "itrameur/$folder-basename.txt"
	echo "</page> §" >> "itrameur/$fold $basename.txt"
done

echo "</lang>" >> "./itrameur/$folder-$basename.txt"
