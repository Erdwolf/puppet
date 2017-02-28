class intellij {

  include userhome
  $home = $userhome::home
  # install under user's home directory
  # so the installation doesn't require
  # permissions.
  $target_dir = $home # /opt

  $ideaIC = 'ideaIC-2016.3.4'
  $url  = "https://download.jetbrains.com/idea/$ideaIC.tar.gz"
  $sha  = '712dccd726b43e2187e8025a6effb711d35310b36d553dbf7bf85400ec1cec15'

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
