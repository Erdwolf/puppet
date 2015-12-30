Provisioning scripts for my machines
====================================

This repository contains Puppet scripts to provision my boxes.

It uses Puppet environments and a puppet.conf so that Puppet finds
the right files when called.

Usage
-----

As long as you tell puppet the config file, you can include any of the
modules or execute a manifest, e.g.

> puppet apply --config puppet.conf -e 'include gvim'

> puppet apply --config puppet.conf /path/to/some/manifest.pp

To apply all manifests inside environments/production/manifests, run

> puppet apply --config puppet.conf -e ''

Directory layout
----------------

    docker/Dockerfile        <- environment used for testing
    environments/production/
      forge_modules/            <- downloaded dependencies from the forge
      site_modules/
        docker/
        gvim/
          files/vimrc             <- my .vimrc
        sbt/
        stack/
      environment.conf         <- specifies the modulepath
      Puppetfile               <- specifies dependencies
    scripts/*.sh             <- scripts for testing
    lib/facter/*.rb          <- custom facts
    puppet.conf              <- specifies paths and options


Testing
-------

There is a rudimentary test that will run puppet inside a docker container.
It runs the command twice to check for idempotence. Afterwards, it performs
a simple smoke test that checks for installed commands.

To create the docker image, run

> docker build -t puppet docker/

Then you can execute the tests by running

> scripts/test-in-docker.sh

This will use a fresh container based on the 'puppet' image every time.
