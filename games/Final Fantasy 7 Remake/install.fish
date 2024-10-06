#!/usr/bin/env fish

set DECK_IP (security find-generic-password -w -s 'Cinnamon')
set REMOTE "deck@$DECK_IP"
set DECK_PW (security find-generic-password -w -s 'Parsley')

set STEAM_ID 1462040
set PREFIX_DIR "/home/deck/.local/share/Steam/steamapps/compatdata/$STEAM_ID/pfx"
set GAME_DIR "/home/deck/.local/share/Steam/steamapps/common/FINAL\ FANTASY\ VII\ REMAKE/End/Content"

set PAKS_DIR "$GAME_DIR/Paks/~mods"

# ------------------------------------------
# Copy paks
sshpass -p $DECK_PW rsync -r mods/paks/ $REMOTE:$PAKS_DIR
