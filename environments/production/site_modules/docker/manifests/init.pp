
class docker {
  include userhome

  package {[
    'apt-transport-https',
    'ca-certificates',
    'curl',
    'software-properties-common'
  ]:
    ensure => present,
  } ->

  apt::key { 'docker':
    source => 'https://download.docker.com/linux/ubuntu/gpg',
    id     => '9DC858229FC7DD38854AE2D88D81803C0EBFCD88',
  } ->

  apt::source { 'download.docker.com':
    location => 'https://download.docker.com/linux/ubuntu',
    repos    => 'stable',
    release  => $facts['os']['distro']['codename'] ? {
      sarah => xenial,
      /.*/ => $0
    },
  } ->

  package { 'docker-ce':
    ensure => present,
  } ->

  package { ['docker.io','docker-engine']:
    ensure => absent,
  } ->

  group { 'docker':
    ensure => 'present',
  } ->

  exec { "user in group":
    unless => "/bin/grep -q 'docker\\S*$userhome::user' /etc/group",
    command => "/usr/sbin/usermod -aG docker $userhome::user",
  }

}
