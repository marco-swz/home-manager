{ config, pkgs, ... }:
{
    home.username = "marco";
    home.homeDirectory = "/home/marco";
    home.stateVersion = "23.11";
    programs.home-manager.enable = true;

    home.sessionVariables = {
        EDITOR = "nvim";
        XCURSOR_THEME = "Vimix-cursors";
    };

    home.shellAliases = {
        cfg-network = "nm-connection-editor";
        cfg-bluetooth = "overskride";
        img = "gthumb";
        vid = "vlc";
        remote = "remmina";
        usb = "udiskie";
    };

    programs.bash = {
        enable = true;

        initExtra = ''
            [[ -f ~/.profile ]] && . ~/.profile
        '';
    };

    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "x-scheme-handler/mailto" = ["userapp-Thunderbird-U9XWH2.desktop"];
            "message/rfc822" = ["userapp-Thunderbird-U9XWH2.desktop"];
            "x-scheme-handler/mid" = ["userapp-Thunderbird-U9XWH2.desktop"];
            "text/csv" = ["nvim.desktop"];
            "text/css" = ["nvim.desktop"];
            "text/javascript" = ["nvim.desktop"];
            "application/json" = ["nvim.desktop"];
            "text/plain" = ["nvim.desktop"];
            "text/xml" = ["nvim.desktop"];
            "text/application" = ["nvim.desktop"];
            "text/markdown" = ["nvim.desktop"];
            "application/pdf" = ["firefox.desktop"];
            "text/html" = ["firefox.desktop"];
        };
        associations.added = {
            "x-scheme-handler/mailto" = ["userapp-Thunderbird-U9XWH2.desktop"];
            "x-scheme-handler/mid" = ["userapp-Thunderbird-U9XWH2.desktop"];
            "text/csv" = ["nvim.desktop"];
            "text/css" = ["nvim.desktop"];
            "text/javascript" = ["nvim.desktop"];
            "application/json" = ["nvim.desktop"];
            "text/plain" = ["nvim.desktop"];
            "text/xml" = ["nvim.desktop"];
            "text/application" = ["nvim.desktop"];
            "text/markdown" = ["nvim.desktop"];
            "application/pdf" = ["firefox.desktop"];
            "text/html" = ["firefox.desktop"];
        };
    };

    home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        name = "Vimix-cursors";
        package = pkgs.vimix-cursors;
        size = 24;
      };

    gtk = {
        enable = true;

        cursorTheme.package = pkgs.vimix-cursors;
        cursorTheme.name = "vimix-cursors";

        theme.package = pkgs.orchis-theme;
        theme.name = "orchis";
    };

    home.file = {
        ".icons/Vimix-cursors".source = "${pkgs.vimix-cursors}/share/icons/Vimix-cursors";
    };

    qt = {
        enable = true;
        platformTheme.name = "gtk";
        style.name = "adwaita-dark";
    };

    home.packages = with pkgs; [
        nnn
        zathura
        age
        chezmoi
        alacritty    
        neovim
        fd
        ripgrep
        zellij
        tmux
        openconnect
        (python311.withPackages(ps: with ps; [
            numpy
            matplotlib
            polars
        ]))
        python311Packages.pip
        cargo
        go
        nodejs_20
        obsidian-wayland
        clang-tools
        glibc
        thunderbird
        ltex-ls
        remmina
        overskride
        udiskie
        gthumb
        vlc
        lazygit
        wezterm
        pyright
        rust-analyzer
        terminus-nerdfont
    ];
}
