class git {

  $user = $::facts['user']
  $home = $::facts['home']

  file { "${home}/.gitconfig":
    owner   => $user,
    content => template('git/gitconfig.erb'),
  }

  file { "${home}/.gitignore_global":
    owner  => $user,
    source => 'puppet:///modules/git/gitignore',
  }

  file { "${home}/bin/git-user":
    owner  => $user,
    source => 'puppet:///modules/git/git-user',
  }

}