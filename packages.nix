{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

   environment.systemPackages = with pkgs; [
    # Desktop apps

    telegram-desktop
    alacritty
    obsidian
    firefox
    spotify
    onlyoffice-desktopeditors
    kdePackages.okular
    anydesk
    anki

    # Coding stuff
    vscode
    nodejs

    # VPN
    nekoray
    xray

    #CLI utils
    ## Системные
    neofetch
    fastfetch
    tree
    htop
    btop
    nix-index
    unzip
    zip
    openssl
    lazygit
    micro
    tldr
    eza
    lsd
    bat
    git



    ## Сетевые и файловые
    wget
    networkmanager


    # Скриншоты
    flameshot

    home-manager


  ];
  fonts.packages = with pkgs; [
    font-awesome
    fira
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
];

}
