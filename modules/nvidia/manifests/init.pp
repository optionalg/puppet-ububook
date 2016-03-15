class nvidia {

  if $operatingsystemrelease == '14.04' {
    $packages = [ 'bumblebee', 'bumblebee-nvidia', 'primus', 'linux-headers-generic' ]
    package { $packages: ensure => present }
  }
  else {
    warning('Bumblebee will not be installed!')
  }

}
