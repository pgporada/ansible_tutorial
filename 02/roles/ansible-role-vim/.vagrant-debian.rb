Vagrant.configure(2) do |config|
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt update
    sudo apt install -y ansible git
    sudo mkdir -p /home/vagrant/.ansible
    sudo chown -R vagrant:vagrant /home/vagrant/.ansible
  SHELL
end
