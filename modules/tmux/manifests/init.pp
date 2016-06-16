#
# Class for installing and configuring
# my tmux environment
#
# Params:
#
# remote_user: user to configure vim to
#

class tmux($remote_user = 'tmolnar') {
  package { 'tmux-package':
    ensure => present,
    name   => 'tmux',
  }
  file { 'tmux-config':
    ensure  => file,
    path    => "/home/${remote_user}/.tmux.conf",
    source  => 'puppet:///modules/tmux/.tmux.conf',
    mode    => '0644',
    owner   => $remote_user,
    group   => $remote_user,
    require => Package['tmux-package'],
  }
}
