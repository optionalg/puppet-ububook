class vim {

  package { 'vim-package':
    name => 'vim',
    ensure => present,
  }

  file { 'vim-config':
    ensure => file,
    path => '/home/tmolnar/.vimrc',
    source => 'puppet:///modules/vim/.vimrc',
    mode => 0755,
    owner => 'tmolnar',
    group => 'tmolnar',
    require => Package['vim-package'],
  }

}
