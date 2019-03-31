Grub version 2.00
Décompacter et copier le dossier Tuxkiller2 dans "/boot/grub/themes/".
Si vous voulez ajouter les lignes "Redémarrage du système" et "Arrêt du système" copier le fichier "40_custom" dans "etc/grub.d/" ou modifiez-le manuellement.
Dans le fichier "/etc/default/grub" changez les paramètres suivants :
GRUB_BACKGROUND="/boot/grub/themes/Tuxkiller2/tuxkiller3.png"
GRUB_THEME="/boot/grub/themes/Tuxkiller2/theme.txt"
GRUB_GFXMODE="1280x1024x32"
GRUB_GFXPAYLOAD_LINUX="1024x768x32"
GRUB_FONT="/boot/grub/themes/Tuxkiller2/dejavu_14.pf2"
Si vous voulez changer le titre du thème vous pouvez le faire dans le fichier "/boot/grub/themes/Tuxkiller2/theme.txt" ligne 45.
Puis tapez dans un terminal "sudo update-grub".

Unzip and copy the Tuxkiller2 folder in "/boot/grub/themes".
If you want to add the lines "System Reboot" and "System Shutdown"  copy the file "40_custom" in "etc/grub.d/" or change it manually.
In the file in the "/etc/default/grub" change the following settings:
GRUB_BACKGROUND = "/boot/grub/themes/Tuxkiller2/tuxkiller3.png"
GRUB_THEME = "/boot/grub/themes/Tuxkiller2/theme.txt"
GRUB_GFXMODE = "1280x1024x32"
GRUB_GFXPAYLOAD_LINUX = "1024x768x32"
GRUB_FONT = "/boot/grub/themes/Tuxkiller2/dejavu_14.pf2"
If you want to change the title of the theme you can in the file "/boot/grub/themes/Tuxkiller2/theme.txt" line 45.
Then type in a terminal "sudo update-grub".

V2
Wrong location of the background image "tuxkiller2.png" in the "theme.txt" file. Problem resolution.

V2
Mauvais emplacement de l'image de fond "tuxkiller2.png" dans le fichier "theme.txt". Résolution du problème.