task :default, [:test, :run]

task :test do
   exec 'docker -t puppet build docker/'
   exec 'scripts/test-in-docker.sh'
end

task :run do
   exec 'puppet apply --config puppet.conf -e ""'
end

task :forge do
   exec '(cd environments/production; librarian-puppet install --verbose --path forge_modules/)'
end

task :dot do
   exec 'puppet apply --config puppet.conf -e "" --noop --graph true --graphdir .'
end
