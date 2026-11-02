#!/bin/bash

set -Eeuo pipefail

DOSSIER="$1"

if [ ! -d "$DOSSIER" ]; then
    echo "Erreur : le dossier n'existe pas." >&2
    exit 1
fi

mkdir -p backups

DATE=$(date +%Y-%m-%d_%H-%M-%S)

tar -czf "backups/archive_$DATE.tar.gz" "$DOSSIER"

for fichier in backups/*.tar.gz; do
    find "$fichier" -mtime +7 -exec rm {} \;
done

echo "Sauvegarde terminée avec succès."

exit 0
