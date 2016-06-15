# Vagrantfile default
# 2012-2016 3E Enterprises, LLC

# This configuration will set up a default base VM provisioned with puppet.
# Uses vagrant-vbguest plugin (https://github.com/dotless-de/vagrant-vbguest)
# to keep VirtualBox Guest Addition wrangled.

# Configuration settings
BOOTSTRAP_SCRIPT        = "vagrant_data/base/install.sh"
CPUS                    = "1"
IP                      = "192.168.50.4"
ENVIRONMENT             = "development"
ENVIRONMENT_PATH        = "./puppet/environments"
HIERA_CONFIG_PATH       = "./puppet/environments/development/hiera.yaml"
MEMORY                  = "1024"
PROVIDER                = "virtualbox"
SYNCED_FOLDER           = "/vagrant"
SYNCED_FOLDER_TYPE      = "nfs"
VAGRANT_VERSION_REQUIRE = ">= 1.8.4"
VAGRANTFILE_API_VERSION = "2"
VM_BOX                  = "ubuntu/trusty64"
VM_BOX_VERSION          = "20151203.2.0"

# Lock down vagrant version.
Vagrant.require_version VAGRANT_VERSION_REQUIRE

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # vagrant-vbguest config
  config.vbguest.no_install = false

  # vagrant-librarian-puppet config
  config.librarian_puppet.puppetfile_dir       = "puppet/environments/development"
  config.librarian_puppet.placeholder_filename = ".gitkeep"

  # Lock box version down.
  config.vm.box              = VM_BOX
  config.vm.box_version      = VM_BOX_VERSION
  config.vm.box_check_update = true
  config.vm.synced_folder ".", SYNCED_FOLDER, type: SYNCED_FOLDER_TYPE

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on the "Usage" link above
    config.cache.scope = :box
  end

  # Run the bootstrap script on every machine.
  config.vm.provision :shell, :path => BOOTSTRAP_SCRIPT

  # Build the base VM (base):
  config.vm.define :"base", primary: true do |base|
    base.vm.hostname = "base"
    base.vm.network "public_network" #, bridge: 'en7: Thunderbolt Ethernet'
    base.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
    base.vm.network :private_network, ip: IP

    base.vm.provision :puppet, run: "always" do |puppet|
      puppet.hiera_config_path = HIERA_CONFIG_PATH
      puppet.environment       = ENVIRONMENT
      puppet.environment_path  = ENVIRONMENT_PATH
      #puppet.options = "--strict_variables"
      puppet.working_directory = "/tmp/vagrant-puppet/environments/development"
    end

    # Set up VM
    base.vm.provider PROVIDER do |v|
      v.customize [
        "modifyvm", :id,
        "--memory", MEMORY,
        "--cpus", CPUS
      ]
    end
  end
end
