if [ -z "$1" ]; then
    echo "Usage: $0 nom_du_fichier"
    exit 1
fi

fichier="$1"

if [ ! -e "$fichier" ]; then
    echo "Le fichier $fichier n'existe pas."
    exit 2
fi

echo "Permissions du fichier $fichier :"
stat -c "%A" "$fichier"

if [ -x "$fichier" ]; then
    echo "Vous avez le droit d'exécution sur ce fichier."
else
    echo "Vous n'avez pas le droit d'exécution sur ce fichier."
fi
