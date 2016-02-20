class misc-pkgs {

  $pkgs = [ 'htop', 'mc', 'curl', 'wget', 'aptitude', 'python-software-properties' ]
  package { $pkgs: ensure => present }

}
