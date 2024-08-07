{ ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [ "--bind clrl-n:down,ctrl-e:up" ];
  };
}
