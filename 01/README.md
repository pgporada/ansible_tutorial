# Overview

This is a basic rundown of ansible commands

- - - -
# Commands

Install ansible and a yaml linter

    pip install ansible --user

    pip install yamllint --user

    alias yams='find . -type f -name "*.yml*" | sed "s|\./||g" | egrep -v "(\[warning\])" | xargs yamllint -f parsable'

    yams

Adhoc commands

    ansible all -i 192.168.3.177, -m ping -u phil -k

    ansible all -i 192.168.3.177,192.168.3.97,192.168.3.77, -m ping -u phil -k

Adhoc commands using an inventory

    ansible -i inventory tom -m ping

    ansiible -i inventory tom -m setup

Targetting a group

    ansible -i inventory fleet -m ping

    ansible -i inventory fleet -m shell -a "uptime"

    ansible -i inventory fleet -m shell -a "free -mt"

Running your first playbook

    ansible-playbook -i inventory playbook.yml

- - - -
# Author
[Phil Porada](https://philporada.com)
