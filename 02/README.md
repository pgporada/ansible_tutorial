# Overview

We're going to build a role and test it. This will be far more involved than the previous lesson. The final role will be located [here](https://github.com/pgporada/ansible-role-vim).

- - - -
# Commands

You will need [vagrant](https://www.vagrantup.com/) and the latest virtualbox.

    ansible-galaxy install pgporada.vagrant
    ansible-playbook pgporada.vagrant --ask-become-password

You will also need to install a working ruby environment to run tests. I prefer to use [kitchen](https://kitchen.ci/).

    # Debian based systems
    sudo apt update
    sudo apt install ruby gem

    # RHEL based systems
    sudo yum install ruby rubygems

Install a required gem. This is similar to a pip requirements file, but for ruby. Bundler utilizes the `Gemfile` and creates a `Gemfile.lock`.

    gem install bundler

Install the kitchen test environment

    bundle install
    bundle update

Run the test harness which will run ansible against the target systems as configured in `.kitchen.yml`

    bundle exec kitchen create -c2
    bundle exec kitchen converge
    bundle exec kitchen verify
    bundle exec kitchen destroy -c2

- - - -
# Author
[Phil Porada](https://philporada.com)
