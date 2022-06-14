{ pkgs, ... }: {
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    aliases = {
      pushall = "!git remote | xargs -L1 git push --all";
      graph = "log --decorate --oneline --graph";
    };
    userName = "lutzgo";
    userEmail = "lutz0go@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      url."https://github.com/".insteadOf = "git://github.com/";
    };
    lfs = { enable = true; };
    ignores = [ ".direnv" "result" ];
  };
}
