class credstash {
  package { 'libssl-dev':
    ensure => installed,
  } ->

  package { 'credstash':
    ensure   => installed,
    provider => pip,
  }

}
