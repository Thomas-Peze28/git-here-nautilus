#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}=== Désinstallation de git-here-nautilus ===${NC}\n"
echo -e "${YELLOW}[1/2] Suppression de l'extension...${NC}"
EXTENSION_DIR="$HOME/.local/share/nautilus-python/extensions"
rm -f "$EXTENSION_DIR/git_here_nautilus.py"
echo -e "${YELLOW}[2/2] Redémarrage de Nautilus...${NC}"
nautilus -q || true
echo -e "\n${GREEN}✅ Désinstallation terminée avec succès !${NC}"