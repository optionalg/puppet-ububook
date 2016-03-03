class misc_pkgs {
  $pkgs = hiera('misc_pkgs::pkgs')
  package { $pkgs: ensure => present }
}
