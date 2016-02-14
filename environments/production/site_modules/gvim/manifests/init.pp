
class gvim {

  include userhome
  $user = $userhome::user
  $home = $userhome::home

  package { 'vim-gtk':
    ensure => present,
  } ->

  package { 'git':
    ensure => present,
  } ->

  file { ["${home}/.vim", "${home}/.vim/bundle"]:
    ensure => directory,
    owner  => $user,
    group  => $user,
  } ->

  vcsrepo { "${home}/.vim/bundle/vundle":
    ensure   => present,
    owner    => $user,
    group    => $user,
    provider => git,
    source   => 'https://github.com/gmarik/vundle.git',
  } ->

  file { "${home}/.vimrc":
    owner  => $user,
    source => 'puppet:///modules/gvim/vimrc',
  } ->

  exec { 'vim +BundleInstall +qall':
    path        => '/usr/bin',
    user        => $user,
    environment => "HOME=${home}",
    subscribe   => File["${home}/.vimrc"],
    refreshonly => true,
  }

}
