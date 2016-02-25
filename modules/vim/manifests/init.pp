class vim {

  $local_user = hiera('vim::local_user', 'tmolnar')

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
    name => "vim-puppet",
    ensure => present,
    require => Package["vim-package"],
  }
  
  file { "vim-dir":
    ensure => directory,
    path => "/home/$local_user/.vim",
    mode => 0755,
    owner => "$local_user",
    group => "$local_user",
    require => Package["vim-package"],
  }

  file { "vim-plugin-dir":
    ensure => directory,
    path => "/home/$local_user/.vim/plugin",
    mode => 0755,
    owner => "$local_user",
    group => "$local_user",
    require => Package["vim-puppet-package"],
  }

  file { "vim-syntax-link":
    ensure => link,
    target => "/usr/share/vim/addons/syntax/puppet.vim",
    path => "/home/$local_user/.vim/plugin/puppet.vim",
    require => Package["vim-puppet-package"],
  }

}
