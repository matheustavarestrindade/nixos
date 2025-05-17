{ config, pkgs, ... }:

{ 
    services.swaync = {
        enable = true;
        settings = {
          positionX = "right";
          positionY = "top";
          timeout = 10;
          "timeout-low" = 5;
          "timeout-critical" = 0;
          "control-center-width" = 500;
          "control-center-height" = 600;
        };

        style = ''
          * {
            font-family: JetBrainsMono Nerd Font Mono;
            font-weight: bold;
          }

          .notification {
            background-color: #282a36;
            color: #f8f8f2;
            border-radius: 10px;
            border: 2px solid #bd93f9;
          }

          .control-center {
            background-color: #282a36;
            border: 2px solid #50fa7b;
          }
          /* Add more custom CSS rules as needed */
        '';
    };
}
