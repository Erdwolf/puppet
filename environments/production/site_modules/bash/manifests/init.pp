class bash {

 $user = $::facts['user']
 $home = $::facts['home']

 file {"$home/.bashrc":
   owner  => $user,
   source => 'puppet:///modules/bash/bashrc',
 }

 file {"$home/.bashrc.d":
   ensure => 'directory',
   owner  => $user,
 }

 file {"$home/.bashrc.d/defaults.sh":
   owner   => $user,
   source  => 'puppet:///modules/bash/defaults.sh',
   require => File["$home/.bashrc.d"],
 }

}
