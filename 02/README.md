# Overview

We're going to build a role and test it. This will be far more involved than the previous lesson. The final role will be located [here](https://github.com/pgporada/ansible-role-vim).

We'll be covering
* [Conditionals](https://docs.ansible.com/ansible/latest/playbooks_conditionals.html)
* [Loops](https://docs.ansible.com/ansible/latest/playbooks_loops.html)
* [Testing](https://github.com/test-kitchen/test-kitchen/wiki/Getting-Started)

- - - -
# Commands

You will need [vagrant](https://www.vagrantup.com/) and the latest virtualbox. You can either download this manually or use my ansible code to install Vagrant for you. As always, please review any foreign code before you run it. Would you trust me? I would trust me.

    # Source code: https://github.com/pgporada/ansible-role-vagrant
    sudo ansible-galaxy install pgporada.vagrant
    ansible-playbook pgporada.vagrant --ask-become-password

You will also need to install a working ruby environment to run tests. I prefer to use [kitchen](https://kitchen.ci/).

    # Debian based systems
    sudo apt update && sudo apt install ruby gem

    # RHEL based systems
    sudo yum install ruby rubygems

Install a required gem. This is similar to a pip requirements file, but for ruby. Bundler utilizes the `Gemfile` and creates a `Gemfile.lock`.

    gem install bundler

Install the kitchen test environment

    bundle install
    bundle update

Run the test harness which will run ansible against the target systems as configured in `.kitchen.yml`.

    bundle exec kitchen create -c2
    bundle exec kitchen converge
    bundle exec kitchen verify
    bundle exec kitchen destroy -c2

Actually deploy this role to some servers instead of vagrant VMs

    ansible-playbook -i inventory playbook.yml --check --diff
    ansible-playbook -i inventory playbook.yml

- - - -
# Author
(C) 2018 [Phil Porada](https://philporada.com)

[Here's a song I like](https://www.youtube.com/watch?v=swW4mJuLzWw)
