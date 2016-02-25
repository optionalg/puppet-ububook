node default {
  include apt
  include nvidia
  include cron-puppet
  include tmux
  include vim
  include perl
  include misc-pkgs
}
