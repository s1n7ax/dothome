{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    package = pkgs.hyprland;
    enable = true;

    xwayland.enable = true;

    settings = {

      windowrulev2 = [
        "workspace 1,class:(org.kde.digikam)"
        "workspace 2,class:(steam),float(0)"
        "workspace 3,class:(Tor Browser)"
        "workspace 3,class:(obsidian)"
        "workspace 4,class:(firefox)"
        "workspace 5,class:(com.obsproject.Studio)"
        "workspace 8,class:(pavucontrol)"

        "float,class:(steam),title:(Friends List)"
        "float,class:(Tor Browser)"
      ];
      monitor = ",preferred,auto,auto";
      exec-once = [ "swaybg -i .wallpaper/*" ];

      env = [ "XCURSOR_SIZE,35" ];

      input = {
        kb_layout = "us";
        # kb_variant =
        # kb_model =
        # kb_options =
        # kb_rules =

        repeat_delay = 190;
        repeat_rate = 200;

        follow_mouse = 1;

        touchpad = { natural_scroll = false; };

        sensitivity = -0.5;
        accel_profile = "flat";
      };

      general = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 10;
        gaps_out = 20;
        border_size = 5;
        "col.active_border" = "rgba(8a1671ff) rgba(8a132fff) 45deg";
        "col.inactive_border" = "rgba(1c1b1c01)";

        layout = "master";
      };

      decoration = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        rounding = 10;

        blur = {
          enabled = true;
          size = 5;
          passes = 3;
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 1, myBezier"
          "windowsOut, 1, 1, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 1, default"
          "workspaces, 1, 1, default"
        ];
      };

      master = {
        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        new_is_master = false;
      };

      gestures = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = false;
      };

      "$mod" = "SUPER";
      "$smod" = "SUPER_SHIFT";
      "$amod" = "SUPER_ALT";

      bind = [
        # run some applications
        "$mod, P, exec, wofiw"

        "$amod, A, exec, flatpak run org.mozilla.firefox"
        "$amod, R, exec, alacritty -e vifm"
        "$amod, S, exec, flatpak run org.kde.dolphin"
        "$amod, T, exec, flatpak run md.obsidian.Obsidian"
        "$amod, Z, exec, slurp | grim -g - - | wl-copy -t image/png"
        ''
          $amod, X, exec, slurp | grim -t png -g - ~/Pictures/"$(date +'screenshot %y-%m-%d %H:%M:%S').png"''

        "$amod, O, exec, poweroff"

        "$smod, Q, exit,"

        "$mod, Return, exec, alacritty"

        # window layouts
        "$mod, H, togglefloating,"
        "$mod, Q, fakefullscreen"
        "$mod, W, fullscreen, 1"
        "$mod, F, fullscreen, 0"
        "$mod, G, killactive,"
        "$mod, K, pin"

        "$mod, H, pseudo, # dwindle"
        "$mod, J, togglesplit, # dwindle"

        # Move focus with mod + arrow keys
        "$mod, M, movefocus, l"
        "$mod, I, movefocus, r"
        "$mod, E, movefocus, u"
        "$mod, N, movefocus, d"

        # Move focused window
        "$smod, M, movewindow, l"
        "$smod, I, movewindow, r"
        "$smod, E, movewindow, u"
        "$smod, N, movewindow, d"

        # Switch workspaces with mod + [0-9]
        "$mod, A, workspace, 1"
        "$mod, R, workspace, 2"
        "$mod, S, workspace, 3"
        "$mod, T, workspace, 4"
        "$mod, Z, workspace, 5"
        "$mod, X, workspace, 6"
        "$mod, C, workspace, 7"
        "$mod, D, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace with mod + SHIFT + [0-9]
        "$mod SHIFT, A, movetoworkspace, 1"
        "$mod SHIFT, R, movetoworkspace, 2"
        "$mod SHIFT, S, movetoworkspace, 3"
        "$mod SHIFT, T, movetoworkspace, 4"
        "$mod SHIFT, Z, movetoworkspace, 5"
        "$mod SHIFT, X, movetoworkspace, 6"
        "$mod SHIFT, C, movetoworkspace, 7"
        "$mod SHIFT, D, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces with mod + scroll
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];

      bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];
    };
  };
}
