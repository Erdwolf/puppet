class lein {
  $url = 'https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein'

  $file = '/usr/local/bin/lein'

  package { 'leiningen':
    ensure => absent, # don't use the outdated version from the repo
  } ->

  exec { 'ensure latest':
    command => "/usr/bin/curl -z $file -o $file $url", # only download if newer
  } ->

  file { "$file":
    mode => '0755',
  }
}
