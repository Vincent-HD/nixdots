{ lib
, osConfig
, pkgs
, ...
}: {
  programs.git = {
    enable = true;
    userName = "vincent-hd";
    userEmail = "vincenthoudan@gmail.com";
    extraConfig = {
      init = { defaultBranch = "main"; };
    };
  };
}
