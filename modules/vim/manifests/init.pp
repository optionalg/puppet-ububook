class vim(
  $local_user = 'tmolnar',
  $vim_for_root = 'enable'
) {
  package { 'vim-package':
    ensure => present,
    name   => 'vim',
  }

  file { 'vim-config':
    ensure  => file,
    path    => "/home/${local_user}/.vimrc",
    source  => 'puppet:///modules/vim/.vimrc',
    mode    => '0755',
    owner   => $local_user,
    group   => $local_user,
    require => Package['vim-package'],
  }

  if $vim_for_root == 'enable' {
    file { 'vim-config-root':
      ensure  => file,
      path    => '/root/.vimrc',
      source  => 'puppet:///modules/vim/.vimrc',
      mode    => '0755',
      owner   => 'root',
      group   => 'root',
      require => Package['vim-package'],
    }
  }

  package { 'vim-puppet-package':
    ensure  => present,
    name    => 'vim-puppet',
    require => Package['vim-package'],
  }
  
  file { 'vim-dir':
    ensure  => directory,
    path    => "/home/${local_user}/.vim",
    mode    => '0755',
    owner   => $local_user,
    group   => $local_user,
    require => Package['vim-package'],
  }

  file { 'vim-plugin-dir':
    ensure  => directory,
    path    => "/home/${local_user}/.vim/plugin",
    mode    => '0755',
    owner   => $local_user,
    group   => $local_user,
    require => Package['vim-puppet-package'],
  }

  file { 'vim-syntax-link':
    ensure  => link,
    target  => '/usr/share/vim/addons/syntax/puppet.vim',
    path    => "/home/${local_user}/.vim/plugin/puppet.vim",
    require => Package['vim-puppet-package'],
  }
}
