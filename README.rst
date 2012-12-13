Vagrantfile example::

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "my_recipe::python"

    chef.json.merge!({
      :python_build => {
        :versions => %w(2.5.6 2.6.8 2.7.3 3.1.5 3.2.3 3.3.0),
      },
    })
  end
