node default {
  $local_user = 'tmolnar'
  $vbox_url = 'http://download.virtualbox.org/virtualbox/5.0.14/virtualbox-5.0_5.0.14-105127~Ubuntu~trusty_amd64.deb'

  include cron-puppet
  include tmux
  include vim
  include perl
  include misc-pkgs
  include virtualbox
}
