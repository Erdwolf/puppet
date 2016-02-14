class userhome {
  $user = $::facts['userhome::user']
  $home = $::facts['userhome::home']

  include stdlib
  validate_absolute_path($home)
}
