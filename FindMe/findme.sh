#!/bin/bash

# Fonction de journalisation
log() {
    logger -t findme "$1" # peut mettre les phrases en français ici
}

log "Recherche de FindMe.txt"

# Recherche des fichiers FindMe.txt dans /home
find_result=$(find /home -type f -name "FindMe.txt" 2>/dev/null)

if [ -n "$find_result" ]; then
    while IFS= read -r file; do
        # Bonus 2 : Obtenir et journaliser le propriétaire du fichier
        owner=$(stat -c '%U' "$file")
        log "Trouvé ici : $file"
        log "Le fichier est possédé par l'utilisateur : $owner"
        rm "$file"
        log "Fichier supprimé : $file. Redémarrage dans 1 minute."
    done <<< "$find_result"
else
    log "Fichier introuvable. Redémarrage dans 1 minute."
fi
