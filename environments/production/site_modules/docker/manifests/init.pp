
class docker {

  package  { 'docker.io':
    ensure => present,
  }

}
