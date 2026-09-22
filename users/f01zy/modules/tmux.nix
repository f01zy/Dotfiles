{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    escapeTime = 0;
    keyMode = "vi";

    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '15'
        '';
      }
    ];

    extraConfig = ''
      set -g mouse on
      set -g default-terminal "tmux-256color"
      set -g allow-passthrough on
      set -ag terminal-overrides ",xterm-256color:RGB"
    '';
  };
}
