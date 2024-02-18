{ ... }: {
  xdg = {
    userDirs.enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;

      associations.removed = {
        "image/png" = [
          "firefox.desktop"
          "org.mozilla.firefox.desktop"
          "com.microsoft.Edge.desktop"
        ];
      };
      defaultApplications = let
        image_viewers = [ "nsxiv.desktop" "org.kde.gwenview.desktop" ];
        web_content = [ "firefox.desktop" "org.mozilla.firefox.desktop" ];
      in {
        "image/png" = image_viewers;
        "image/jpeg" = image_viewers;
        "image/webp" = image_viewers;
        "application/pdf" = [ "org.pwmt.zathura.desktop" ];

        # web content
        "text/html" = web_content;
        "text/xml" = web_content;
        "application/xhtml+xml" = web_content;
        "application/vnd.mozilla.xul+xml" = web_content;
        "text/mml" = web_content;
        "x-scheme-handler/http" = web_content;
        "x-scheme-handler/https" = web_content;
      };
    };
  };
}
