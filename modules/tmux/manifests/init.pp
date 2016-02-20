class tmux {

  package { 'tmux-package':
    name => 'tmux',
    ensure => present,
  }

  file { 'tmux-config':
    ensure => file,
    path => '/home/tmolnar/.tmux.conf',
    source => 'puppet:///modules/tmux/.tmux.conf',
    mode => 0755,
    owner => 'tmolnar',
    group => 'tmolnar',
    require => Package['tmux-package'],
  }

}
