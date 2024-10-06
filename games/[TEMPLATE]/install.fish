#!/usr/bin/env fish

set DECK_IP (security find-generic-password -w -s 'Cinnamon')
set REMOTE "deck@$DECK_IP"
set DECK_PW (security find-generic-password -w -s 'Parsley')

set STEAM_ID 00000
set PREFIX_DIR "/home/deck/.local/share/Steam/steamapps/compatdata/$STEAM_ID/pfx"
set GAME_DIR "/run/media/SN01T/steamapps/common/<GAME NAME HERE>"

# Do stuff here
