{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    gimp
    digikam
    handbrake
    (davinci-resolve.overrideAttrs (oldAttrs: {
      src =
        runCommandLocal "${oldAttrs.pname}-src.zip"
          rec {
            pname = oldAttrs.pname;
            version = oldAttrs.version;
            studioVariant = false;

            outputHashMode = "recursive";
            outputHashAlgo = "sha256";
            outputHash =
              if studioVariant then
                "sha256-9iTdIjHH8uoXlVr6miyqmHuzbbpbqdJPEbPGycsccoI="
              else
                "sha256-WrIQ1FHm65MOGb5HfFl2WzXYJRlqktuZdrtzcjWp1gI=";

            impureEnvVars = lib.fetchers.proxyImpureEnvVars;

            nativeBuildInputs = [
              curl
              jq
              axel
            ];

            # ENV VARS
            SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";

            # Get linux.downloadId from HTTP response on https://www.blackmagicdesign.com/products/davinciresolve
            REFERID = "263d62f31cbb49e0868005059abcb0c9";
            DOWNLOADSURL = "https://www.blackmagicdesign.com/api/support/us/downloads.json";
            SITEURL = "https://www.blackmagicdesign.com/api/register/us/download";
            PRODUCT = "DaVinci Resolve${lib.optionalString studioVariant " Studio"}";
            VERSION = version;

            USERAGENT = builtins.concatStringsSep " " [
              "User-Agent: Mozilla/5.0 (X11; Linux ${stdenv.hostPlatform.linuxArch})"
              "AppleWebKit/537.36 (KHTML, like Gecko)"
              "Chrome/77.0.3865.75"
              "Safari/537.36"
            ];

            REQJSON = builtins.toJSON {
              "firstname" = "NixOS";
              "lastname" = "Linux";
              "email" = "someone@nixos.org";
              "phone" = "+31 71 452 5670";
              "country" = "nl";
              "street" = "-";
              "state" = "Province of Utrecht";
              "city" = "Utrecht";
              "product" = PRODUCT;
            };

          }
          ''
            DOWNLOADID=$(
              curl --silent --compressed "$DOWNLOADSURL" \
                | jq --raw-output '.downloads[] | select(.name | test("^'"$PRODUCT $VERSION"'( Update)?$")) | .urls.Linux[0].downloadId'
            )
            echo "downloadid is $DOWNLOADID"
            test -n "$DOWNLOADID"
            RESOLVEURL=$(curl \
              --silent \
              --header 'Host: www.blackmagicdesign.com' \
              --header 'Accept: application/json, text/plain, */*' \
              --header 'Origin: https://www.blackmagicdesign.com' \
              --header "$USERAGENT" \
              --header 'Content-Type: application/json;charset=UTF-8' \
              --header "Referer: https://www.blackmagicdesign.com/support/download/$REFERID/Linux" \
              --header 'Accept-Encoding: gzip, deflate, br' \
              --header 'Accept-Language: en-US,en;q=0.9' \
              --header 'Authority: www.blackmagicdesign.com' \
              --header 'Cookie: _ga=GA1.2.1849503966.1518103294; _gid=GA1.2.953840595.1518103294' \
              --data-ascii "$REQJSON" \
              --compressed \
              "$SITEURL/$DOWNLOADID")
            echo "resolveurl is $RESOLVEURL"

            axel \
              --num-connections=10 \
              --header "Upgrade-Insecure-Requests: 1" \
              --header "$USERAGENT" \
              --header "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" \
              --header "Accept-Language: en-US,en;q=0.9" \
              --verbose \
              --insecure \
              --output $out \
              "$RESOLVEURL"
          '';
    }))
  ];
}
