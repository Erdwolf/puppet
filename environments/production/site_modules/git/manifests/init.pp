class git {

  include userhome
  $user = $userhome::user
  $home = $userhome::home

  file { "${home}/.gitconfig":
    owner   => $user,
    source => 'puppet:///modules/git/gitconfig',
  }

  file { "${home}/.gitignore_global":
    owner  => $user,
    source => 'puppet:///modules/git/gitignore',
  }

  file { "${home}/bin":
    ensure => directory,
    owner  => $user,
    group  => $user,
  }

  file { "${home}/bin/git-user":
    owner  => $user,
    source => 'puppet:///modules/git/git-user',
    require => File["${home}/bin"],
  }

}
