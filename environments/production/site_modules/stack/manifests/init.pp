
class stack {

  include apt

  apt::key { 'fpco':
    id     => '9BEFB442',
    source => 'https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key',
  } ->

  apt::source { 'debian_unstable':
    location => 'http://download.fpcomplete.com/ubuntu/wily',
    release  => 'stable',
    repos    => 'main',
  } ->

  package { 'stack':
    ensure => latest,
  }

}
