class misc-pkgs {
  $pkgs = hiera('misc-pkgs::pkgs')
  package { $pkgs: ensure => present }
}
