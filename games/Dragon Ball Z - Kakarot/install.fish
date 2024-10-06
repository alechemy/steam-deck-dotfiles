#!/usr/bin/env fish

set DECK_IP (security find-generic-password -w -s 'Cinnamon')
set REMOTE "deck@$DECK_IP"
set DECK_PW (security find-generic-password -w -s 'Parsley')

set STEAM_ID 851850
set PREFIX_DIR "/home/deck/.local/share/Steam/steamapps/compatdata/$STEAM_ID/pfx"
set GAME_DIR "/run/media/SN01T/steamapps/common/DRAGON\ BALL\ Z\ KAKAROT/AT/Content"

set PAKS_DIR "$GAME_DIR/Paks/~mods"
set ENGINE_INI "$PREFIX_DIR/drive_c/users/steamuser/AppData/Local/AT/Saved/Config/WindowsNoEditor/Engine.ini"

# ------------------------------------------
# Copy paks
sshpass -p $DECK_PW rsync -r mods/paks/ $REMOTE:$PAKS_DIR

# ------------------------------------------
# Enable motion blur all the time
sshpass -p $DECK_PW ssh $REMOTE "echo 'r.DefaultFeature.MotionBlur=1' >>$ENGINE_INI"
sshpass -p $DECK_PW ssh $REMOTE "echo 'r.MotionBlurQuality=4' >>$ENGINE_INI"
sshpass -p $DECK_PW ssh $REMOTE "echo 'r.MotionBlur.Amount=0.5' >>$ENGINE_INI"
sshpass -p $DECK_PW ssh $REMOTE "echo 'r.MotionBlur.Max=5' >>$ENGINE_INI"
# make immutable
sshpass -p $DECK_PW ssh $REMOTE "sudo chattr +i $ENGINE_INI"


# ----------------------------------------------------------------------------
# Faulconer Music Mod
# https://www.nexusmods.com/dragonballzkakarot/mods/66?tab=description
set MUSIC_DIR "$GAME_DIR/Sound/Bgm"
# These are big files, so commenting this out by default.
# sshpass -p $DECK_PW rsync -r mods/FaulconerMusicMod/ $REMOTE:$MUSIC_DIR


# ----------------------------------------------------------------------------
# Better cutscene mod
# https://www.nexusmods.com/dragonballzkakarot/mods/203
set MOVIES_DIR "$GAME_DIR/Movies"
# These are big files, so commenting this out by default.
# sshpass -p $DECK_PW rsync -r mods/BetterCutscenesMod/SaiyanSaga/ $REMOTE:$MOVIES_DIR
