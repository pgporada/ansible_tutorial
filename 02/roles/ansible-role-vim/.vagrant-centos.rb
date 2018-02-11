Vagrant.configure(2) do |config|
  config.vm.provision "shell", inline: <<-SHELL
     sudo yum install -y epel-release git
     sudo yum update -y epel-release
     sudo yum install -y ansible
  SHELL
end
