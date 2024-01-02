{
  lib,
  osConfig,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "vincent";
    userEmail = "mateusalvespereira7@gmail.com";
    extraConfig = {
      init = {defaultBranch = "main";};
      github.user = "vincent";
      core.editor = "nvim";
      pull.rebase = false;
    };
  };
}
