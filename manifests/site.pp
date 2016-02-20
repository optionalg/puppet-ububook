node default {
  $local_user = 'tmolnar'

  include nvidia
  include cron-puppet
  include tmux
  include vim
  include perl
  include misc-pkgs
}
