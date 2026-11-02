#!/bin/bash

set -Eeuo pipefail

DEPOT="$1"

if [ -z "$DEPOT" ]; then
    echo "Erreur : URL du dépôt manquante."
    exit 1
fi

LOG="ci.log"

fonction() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG"
}

fonction "Début du pipeline CI"

if [ -d "projet" ]; then
    fonction "Mise à jour du dépôt"
    cd projet
    git pull
else
    fonction "Clonage du dépôt"
    git clone "$DEPOT" projet
    cd projet
fi

fonction "Exécution des tests"

# Simulation des tests
if [ -f "test.sh" ]; then
    bash test.sh
else
    fonction "Erreur : fichier test.sh introuvable"
    exit 1
fi

fonction "Pipeline terminé avec succès"

exit 0
