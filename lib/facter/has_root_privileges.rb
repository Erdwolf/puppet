
Facter.add('has_root_privileges') do
  setcode do
    Process.uid == 0
  end
end
