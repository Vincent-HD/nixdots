_: {
  programs.git = {
    enable = true;
    userName = "vincent-hd";
    userEmail = "vincenthoudan@gmail.com";
    extraConfig = {
      init = {defaultBranch = "main";};
      core.editor = "nvim";
      pull.rebase = false;
    };
  };
}
