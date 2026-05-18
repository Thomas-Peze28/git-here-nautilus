#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}=== Installation de git-here-nautilus ===${NC}\n"

echo -e "${YELLOW}[1/4] Vérification et installation des dépendances...${NC}"
echo "Cela nécessite les droits administrateur (sudo)."
sudo apt update
sudo apt install -y python3-nautilus zenity gnome-terminal

echo -e "${YELLOW}[2/4] Préparation du dossier de destination...${NC}"
EXTENSION_DIR="$HOME/.local/share/nautilus-python/extensions"
mkdir -p "$EXTENSION_DIR"

echo -e "${YELLOW}[3/4] Installation de l'extension...${NC}"
cp main.py "$EXTENSION_DIR/git_here_nautilus.py"

echo -e "${YELLOW}[4/4] Redémarrage de Nautilus...${NC}"
nautilus -q || true 

echo -e "\n${GREEN}✅ Installation terminée avec succès !${NC}"
echo "L'option 'Clone repository' est maintenant disponible lors d'un clic droit dans l'explorateur de fichiers."