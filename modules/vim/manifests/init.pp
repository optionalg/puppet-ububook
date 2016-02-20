class vim {

  package { "vim-package":
    name => "vim",
    ensure => present,
  }

  file { "vim-config":
    ensure => file,
    path => "/home/$local_user/.vimrc",
    source => "puppet:///modules/vim/.vimrc",
    mode => 0755,
    owner => "$local_user",
    group => "$local_user",
    require => Package["vim-package"],
  }

  package { "vim-puppet-package":
    name => "vim-puppet"
    ensure => present,
    require => Package["vim-package"],
  }

}
