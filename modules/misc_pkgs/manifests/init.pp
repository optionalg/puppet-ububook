class misc_pkgs($pkgs = []) {
  package { $pkgs: ensure => present }
}
