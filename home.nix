{ config, pkgs, ... }:
{
    home.username = "marco";
    home.homeDirectory = "/home/marco";
    home.stateVersion = "23.11";
    programs.home-manager.enable = true;

    home.sessionVariables = {
        EDITOR = "nvim";
        XCURSOR_THEME = "Vimix-cursors";
        ZDOTDIR = "~/.config/zsh";
    };

    home.shellAliases = {
        cfg-network = "nm-connection-editor";
        cfg-bluetooth = "overskride";
        img = "gthumb";
        vid = "vlc";
        remote = "remmina";
        usb = "udiskie";
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

        theme.package = pkgs.kanagawa-gtk-theme;
        theme.name = "Kanagawa";
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
        zsh
        ripgrep
        tmux
        openconnect
        (python312.withPackages(ps: with ps; [
            numpy
            matplotlib
            polars
        ]))
        python312Packages.pip
        cargo
        go
        nodejs_20
        # obsidian-wayland
        obsidian
        nixd
        clang-tools
        clang
        glibc
        ltex-ls
        remmina
        overskride
        udiskie
        gthumb
        vlc
        lazygit
        pyright
        rust-analyzer
        vistafonts
        zellij
    ];
}
