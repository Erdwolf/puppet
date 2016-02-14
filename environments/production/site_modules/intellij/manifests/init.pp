class intellij {

  include userhome
  $home = $userhome::home
  # install under user's home directory
  # so the installation doesn't require
  # permissions.
  $target_dir = $home # /opt

  $ideaIC = 'ideaIC-15.0.2'
  $url  = "https://download.jetbrains.com/idea/$ideaIC.tar.gz"
  $sha  = '8c988751871faf94a3f60a34f6360e75ddaec8ea21170e5bb05b1db4f4ca1979'

  $check = "echo $sha /tmp/$ideaIC.tar.gz | sha256sum -c"

  exec { "download ${ideaIC}":
    unless => $check,
    command => "wget --output-document=/tmp/$ideaIC.tar.gz ${url}",
    path => ['/usr/local/bin', '/usr/bin', '/bin'],
  }

  exec { "check ${ideaIC}":
    command => $check,
    path => ['/usr/local/bin', '/usr/bin', '/bin'],
    require => Exec["download ${ideaIC}"],
  }

  exec { "extract ${ideaIC}":
    command => "tar --ungzip \
                    --extract \
                    --file=/tmp/${ideaIC}.tar.gz \
                    --transform='s:^[^/]*/:$ideaIC/:' \
                    --directory=$target_dir \
                    ",
    creates => "$target_dir/$ideaIC",
    path => ['/usr/local/bin', '/usr/bin', '/bin'],
    require => Exec["check ${ideaIC}"],
  }

  $applications = "$home/.local/share/applications" # /usr/share/applications
  file { "$applications/$ideaIC.desktop":
    content => template('intellij/ideaIC.desktop.erb'),
    require => Exec["extract ${ideaIC}"],
  }

  # FIXME Clean up afterwards
  #file { "/tmp/${ideaIC}.tar.gz":
  #  ensure => absent,
  #  require => Exec["extract ${ideaIC}"],
  #}

}
