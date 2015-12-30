class profile::devtools {
  include docker
  include gvim
  include sbt
  include stack
}

class role::my_machine {

  unless $::facts['has_root_privileges'] {
    fail 'Has to be run with root privileges. Consider rerunning with sudo.'
  }

  include profile::devtools
  # ... Include further profiles here...
}

node default {
  include role::my_machine
}
