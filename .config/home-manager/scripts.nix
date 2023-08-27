{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (writeShellScriptBin "pass-menu" ''
      record=$(
        fd \
          --extension 'gpg' \
          --type f \
          --base-directory ~/.password-store \
        | sd '.gpg' "" \
        | sk
      )

      pass -c "$record"
    '')

    (writeShellScriptBin "project-menu" ''
      quick_exit ()
      {
        read VAR
        if [ ! -z "$VAR" ]; then
          echo $VAR
          PID=$$
          kill $PID 2&> /dev/null
        fi
      }

      fd -I -i -H \
        -t d ^.git$ ~/.config ~/Workspace \
        -x 'echo' '{//}' | sk | quick_exit
    '')

    (writeShellScriptBin "conv-mkv-to-mov" ''
      #!/bin/sh

      set -euxo pipefail

      if [[ $# -eq 0 ]] ; then
        # has no parameters
        echo 'Converting all the files in the current dir to mov'

        mov_files=$(fd -t f --no-ignore '.*\.mkv')

        if [ -n "$mov_files" ]; then
          mkdir -p "converted";
          
          echo "$mov_files" | 
          xargs -I {} basename {} .mkv | \
          xargs -I {} \
          sh -c 'ffmpeg -i "{}.mkv" -vcodec mjpeg -q:v 2 -acodec pcm_s16be -q:a 0 -f mov "converted/{}.mov"'
        fi

        exit 0
      else
        echo 'Converting "$1" to mov'

        abs_path=$(realpath "$1")

        if [ ! -f "$abs_path" ]; then
          echo "File not found"
          exit 1;
        fi

        mkdir -p "converted"
        target="$(dirname "$abs_path")/converted/$(basename "$abs_path")"

        ffmpeg -i "$abs_path" -vcodec mjpeg -q:v 2 -acodec pcm_s16be -q:a 0 -f mov "$target_path"

        exit 0
      fi
    '')

    (writeShellScriptBin "conv-mov-to-mp4" ''
      #!/bin/bash

      set -euxo pipefail

      if [[ $# -eq 0 ]] ; then
          echo 'Video file path should be passed to the command'
          exit 0
      fi

      ABSOLUTE_PATH=$(realpath "$1")
      FILE_PATH_WITHOUT_EXT="$\{ABSOLUTE_PATH%%.*}"

      TARGET_FILE="$FILE_PATH_WITHOUT_EXT.mp4"

      ffmpeg -i "$ABSOLUTE_PATH" -qscale 0 "$TARGET_FILE"
    '')

    (writeShellScriptBin "conv-webm-to-mp3" ''
      #!/bin/env bash

      for FILE in *.webm; do
          echo -e "Processing video '\e[32m$FILE\e[0m'";
          ffmpeg -i "$\{FILE}" -vn -ab 128k -ar 44100 -y "$\{FILE%.webm}.mp3";
      done;
    '')

    (writeShellScriptBin "kc-share" ''
      #!/bin/env bash

      set -euxo pipefail

      if [[ $# -eq 0 ]] ; then
	      echo 'Path to share should be passed'
	      exit 1
      fi

      function find_files {
	      if [ -d "$1" ]; then
		      find $1 -type f
	      else
		      echo $1
	      fi
      }

      AVAILABLE=$(kdeconnect-cli --list-available --name-only)
      DEVICE_COUNT=$(echo "$AVAILABLE" | wc -l)

      if [ $DEVICE_COUNT -gt 1 ]; then
	      PICKED_DEVICE=$(echo "$AVAILABLE" | dmenu)
      else
	      PICKED_DEVICE=$AVAILABLE
      fi

      for path in "$@"; do
	      find_files "$path" | xargs -I{} kdeconnect-cli --name="$PICKED_DEVICE" --share="{}"
      done
    '')
  ];
}
