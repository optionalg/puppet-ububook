#
# Class for installing and configuring
# my VIM environment
#
# Params:
#
# local_user: user to configure vim to
# vim_for_root: enables vim configuration for root
#

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
    mode    => '0644',
    owner   => $local_user,
    group   => $local_user,
    require => Package['vim-package'],
  }
  if $vim_for_root == 'enable' {
    file { 'vim-config-root':
      ensure  => file,
      path    => '/root/.vimrc',
      source  => 'puppet:///modules/vim/.vimrc',
      mode    => '0644',
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
  package { 'vim-addon-manager-package':
    ensure  => present,
    name    => 'vim-addon-manager',
    require => Package['vim-package'],
  }
  exec { 'enable-vim-puppet':
    command     => 'vim-addons -w install puppet',
    creates     => '/var/lib/vim/addons/syntax/puppet.vim',
    path        => ['/usr/bin', '/usr/sbin'],
    environment => ['HOME=/root'],
    require     => [
      Package['vim-addon-manager-package'],
      Package['vim-puppet-package'],
    ],
  }
#  vim_addons { 'vim-puppet':
#    ensure  => present,
#    name    => 'puppet',
#    require => Package['vim-addon-manager-package'],
#  }
}
