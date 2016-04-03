#
# Class for installing and configuring
# my tmux environment
#
# Params:
#
# local_user: user to configure vim to
#

class tmux($local_user = 'tmolnar') {
  package { 'tmux-package':
    ensure => present,
    name   => 'tmux',
  }

  file { 'tmux-config':
    ensure  => file,
    path    => "/home/${local_user}/.tmux.conf",
    source  => 'puppet:///modules/tmux/.tmux.conf',
    mode    => '0755',
    owner   => $local_user,
    group   => $local_user,
    require => Package['tmux-package'],
  }
}
