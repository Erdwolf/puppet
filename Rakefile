task :default, [:test, :run]

desc 'Test in docker container'
task :test do
   sh 'docker build -t puppet docker/'
   sh 'scripts/test-in-docker.sh'
end

desc 'Apply manifests to this machine (needs sudo)'
task :run do
   sh 'puppet apply --config puppet.conf -e ""'
end

desc 'Check installation on this machine'
task :check do
   sh 'scripts/check-installation.sh'
end

desc 'Update "environments/production/forge_modules" directory'
task :forge do
   sh '(cd environments/production; librarian-puppet install --verbose --path forge_modules/)'
end

desc 'Create graph (work in progress)'
task :dot do
   sh 'puppet apply --config puppet.conf -e "" --noop --graph true --graphdir .'
end
