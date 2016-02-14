require 'etc'

def user
   Etc.getlogin
end

Facter.add("userhome::user") do
  setcode do
    user
  end
end

Facter.add("userhome::home") do
  setcode do
    Etc.getpwnam(user).dir
  end
end
