class astah {

  $url = 'http://www.astah.net/download'
  $deb = '/tmp/astah-latest.deb'

  exec {'download latest .deb':
    command => "ruby -e 'require \"open-uri\"; puts open(\"$url\").read.scan(/href=\"(http[^\"]*community[^\"]*deb)\"/).uniq' | xargs wget -O $deb",
    path => '/usr/bin',
  } ->

  # Using exec since the dpkg provider doesn't let us agree to the license terms
  exec { 'install .deb':
    command => "yes | dpkg --install $deb",
    path => ['/usr/bin','/bin','/sbin'],
  }

}
