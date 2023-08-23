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
  ];
}
