import os
import subprocess
from urllib.parse import unquote
import gi

gi.require_version('Nautilus', '4.0')
from gi.repository import Nautilus, GObject

class CloneRepoExtension(GObject.GObject, Nautilus.MenuProvider):
    def __init__(self):
        super().__init__()

    def clone_action(self, menu, path):
        local_path = unquote(path.replace("file://", ""))
        
        try:
            url = subprocess.check_output(
                ['zenity', '--entry', '--title=Cloner un dépôt Git', '--text=Entrer l\'URL du dépôt :'],
                universal_newlines=True
            ).strip()
            
            if url:
                cmd = f"cd '{local_path}' && echo 'Clonage dans {local_path}...' && echo '' && git clone '{url}' || (echo '' && echo '❌ Échec du clonage !' && read -p 'Appuyez sur Entrée pour fermer la fenêtre...')"
                subprocess.Popen(['gnome-terminal', '--', 'bash', '-c', cmd])
        except subprocess.CalledProcessError:
            pass

    def get_background_items(self, current_folder):
        item = Nautilus.MenuItem(
            name="CloneRepoExtension::CloneBackground",
            label="Clone repository",
            tip="Cloner un dépôt Git ici"
        )
        item.connect('activate', self.clone_action, current_folder.get_uri())
        return [item]

    def get_file_items(self, files):
        if len(files) != 1 or not files[0].is_directory():
            return []
        
        item = Nautilus.MenuItem(
            name="CloneRepoExtension::CloneFolder",
            label="Clone repository",
            tip="Cloner un dépôt Git dans ce dossier"
        )
        item.connect('activate', self.clone_action, files[0].get_uri())
        return [item]
