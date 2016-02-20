class perl {

  package { 'perlbrew-package':
    name => 'perlbrew',
    ensure => present,
  }

}
