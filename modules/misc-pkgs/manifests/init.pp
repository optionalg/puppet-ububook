class misc-pkgs {

  $pkgs = [ 'mc', 'curl', 'wget', 'aptitude', 'python-software-properties' ]
  package { $pkgs: ensure => present }

}
