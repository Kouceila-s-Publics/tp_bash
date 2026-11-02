#!/bin/bash

echo "Exécution des tests..."

if [ -d ".git" ]; then
    echo "Test réussi : dépôt Git trouvé."
    exit 0
else
    echo "Test échoué."
    exit 1
fi
