#!/usr/bin/env fish

set DECK_IP (security find-generic-password -w -s 'Cinnamon')
set REMOTE "deck@$DECK_IP"
set DECK_PW (security find-generic-password -w -s 'Parsley')

set STEAM_ID 350080
set PREFIX_DIR ".local/share/Steam/steamapps/compatdata/$STEAM_ID/pfx"

# ------------------------------------------
# Create texture cache folder
# According to PCGamingWiki this cache performs best if game is installed to SSD
sshpass -p $DECK_PW ssh $REMOTE mkdir -p "$PREFIX_DIR/drive_c/users/steamuser/AppData/Local/MachineGames/Wolfenstein\ The\ Old\ Blood"
