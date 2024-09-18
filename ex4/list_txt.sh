files=$(ls *.txt 2>/dev/null)

if [ -z "$files" ]; then
  echo "Aucun fichier .txt trouvé"
else
  
  echo "$files"
fi

