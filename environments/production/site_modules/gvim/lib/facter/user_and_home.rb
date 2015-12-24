require 'etc'

USER = Etc.getlogin

Facter.add("user") do
  setcode do
    USER
  end
end

Facter.add("home") do
  setcode do
    Etc.getpwnam(USER).dir
  end
end
