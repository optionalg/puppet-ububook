class nvidia {

  $packages = [ 'bumblebee', 'bumblebee-nvidia', 'primus', 'linux-headers-generic' ]
  package { $packages: ensure => present }

}
