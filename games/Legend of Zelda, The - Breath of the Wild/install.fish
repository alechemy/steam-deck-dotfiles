#!/usr/bin/env fish

set DECK_IP (security find-generic-password -w -s 'Cinnamon')
set REMOTE "deck@$DECK_IP"
set DECK_PW (security find-generic-password -w -s 'Parsley')

set SHADER_CACHE_DIR "/home/deck/.cache/Cemu/shaderCache"

sshpass -p $DECK_PW rsync -r mods/shaderCache/ $REMOTE:$SHADER_CACHE_DIR
