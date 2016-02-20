class misc-pkgs {

  $pkgs = [ 'dkms', 'htop', 'mc', 'curl', 'wget', 'aptitude', 'python-software-properties' ]
  package { $pkgs: ensure => present }

}
