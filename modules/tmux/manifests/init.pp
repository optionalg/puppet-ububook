class tmux {

  $local_user = hiera('tmux::local_user', 'tmolnar')

  package { 'tmux-package':
    name   => 'tmux',
    ensure => present,
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
