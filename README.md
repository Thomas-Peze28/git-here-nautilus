# git-here-nautilus

Une extension pour Nautilus/GNOME permettant de cloner des dépôts Git directement depuis le menu contextuel du gestionnaire de fichiers.

## ⚙️ Prérequis
Ce projet est conçu pour les environnements basés sur **GNOME** (Ubuntu, Debian, Fedora, etc.) utilisant le gestionnaire de fichiers **Nautilus**.

## 🚀 Installation

Une installation automatisée est disponible grâce au script `install.sh`. 

```bash
git clone [https://github.com/Thomas-Peze28/git-here-nautilus.git](https://github.com/Thomas-Peze28/git-here-nautilus.git)
cd git-here-nautilus
chmod +x install.sh
./install.sh
```

Le script se chargera de vérifier et d'installer les dépendances nécessaires (`python3-nautilus`, `zenity`, `gnome-terminal`), de placer l'extension au bon endroit et de redémarrer Nautilus.

## 🖱️ Utilisation
1. Ouvrez votre explorateur de fichiers (Nautilus).
2. Faites un **clic droit** dans un dossier (ou dans le vide à l'intérieur d'un dossier).
3. Cliquez sur **Clone repository**.
4. Collez l'URL de votre dépôt Git et appuyez sur Entrée.

## 🗑️ Désinstallation
Si vous souhaitez retirer l'extension, il suffit de lancer le script `uninstall.sh`.

```bash
chmod +x uninstall.sh
./uninstall.sh
```

## 👨‍💻 Auteur
**Thomas Pezé**