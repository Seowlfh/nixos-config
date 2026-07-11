{ pkgs, ... }:
{
  enable = true;

  escapeTime = 0;
  newSession = true;
  terminal = "screen-256color";

  extraConfig = ''
    set -g mode-keys vi

    set -g status-position top
    set -g status-justify absolute-centre
    set -g status-style "bg=#0B0E14"
    set -g window-status-current-style "fg=black bg=white  "
    set -g window-status-current-style "fg=colour255,bg=default,bold"
    set -g window-status-separator ""
    set -g window-status-format "#[fg=colour240]#[default] #I:#W#{?window_flags,#{window_flags},} #[fg=colour240]#[default]"
    set -g window-status-current-format "#[fg=colour252]#[default] #I:#W#{?window_flags,#{window_flags},} #[fg=colour252]#[default]"
    set -g status-interval 5
    set -g status-left "#S"
    set -g status-right ""
  '';
}
