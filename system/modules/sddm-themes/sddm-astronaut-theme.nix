# In sddm-astronaut-theme.nix
{
  stdenvNoCC,
  qt6,
  lib,
  fetchFromGitHub,
  formats,
  theme ? "astronaut",
  themeConfig ? null, # This can be null if not provided by the user
  customBackground ? null,
}:
let
  finalThemeConfig =
    let
      # Correctly default baseUserConfig to an empty attrset if themeConfig is null.
      # If themeConfig is already an attrset, use it as is.
      baseUserConfig = if themeConfig == null then {} else themeConfig;
    in
    if customBackground != null then
      baseUserConfig // {
        # This use of 'or' is correct: if 'baseUserConfig.General' attribute does not exist,
        # it defaults to '{}' before merging with the Background setting.
	# ========= WARNING ===========
	# UPDATE THE FILE EXTENSION YOU ARE USING
	# ALSO REMEMBER TO UPDATE THE EXTENSION ON THE COMMAND BELLOW
        General = (baseUserConfig.General or {}) // {
          Background = "Backgrounds/custom_wallpaper.mp4";
        };
      }
    else
      baseUserConfig; # If no custom background, use themeConfig (or {} if it was null)

  overwriteConfig = (formats.ini {}).generate "${theme}.conf.user" finalThemeConfig;

in
  stdenvNoCC.mkDerivation rec {
    name = "sddm-astronaut-theme";

    src = fetchFromGitHub {
      owner = "Keyitdev";
      repo = "sddm-astronaut-theme";
      rev = "11c0bf6147bbea466ce2e2b0559e9a9abdbcc7c3";
      hash = "sha256-gBSz+k/qgEaIWh1Txdgwlou/Lfrfv3ABzyxYwlrLjDk=";
    };

    propagatedUserEnvPkgs = with qt6; [qtsvg qtvirtualkeyboard qtmultimedia];

    dontBuild = true;
    dontWrapQtApps = true;

    installPhase = ''
      themeDir="$out/share/sddm/themes/${name}"

      mkdir -p $themeDir
      cp -r $src/* $themeDir

      install -dm755 "$out/share/fonts"
      if [ -d "$themeDir/Fonts" ]; then
        cp -r $themeDir/Fonts/* "$out/share/fonts/"
      fi

      substituteInPlace "$themeDir/metadata.desktop" \
        --replace-fail "ConfigFile=Themes/astronaut.conf" "ConfigFile=Themes/${theme}.conf"

      ${lib.optionalString (customBackground != null) ''
        mkdir -p "$themeDir/Backgrounds"
        chmod +w "$themeDir/Backgrounds"
        cp "${customBackground}" "$themeDir/Backgrounds/custom_wallpaper.mp4"
      ''}

      ${lib.optionalString (lib.isAttrs finalThemeConfig) ''
        mkdir -p "$themeDir/Themes"
        chmod +w "$themeDir/Themes"
        cp "${overwriteConfig}" "$themeDir/Themes/${theme}.conf.user"
      ''}
    '';

    meta = with lib; {
      description = "Series of modern looking themes for SDDM";
      homepage = "https://github.com/Keyitdev/sddm-astronaut-theme";
      license = licenses.gpl3;
      platforms = platforms.linux;
    };
  }
