{
  lib,
  osConfig,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "vincent-hd";
    userEmail = "vincenthoudan@gmail.com";
    extraConfig = {
      init = {defaultBranch = "main";};
      github.user = "Vincent";
      core.editor = "nvim";
      pull.rebase = false;
    };
  };
}
