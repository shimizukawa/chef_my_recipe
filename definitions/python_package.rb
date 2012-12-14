
define :python_package, :action => :install, :version => nil do
  package = params[:name]
  version = params[:version] || ''
  major_version = "#{version.split('.')[0,2].join('.')}"
  python_prefix = params[:python_prefix] || '/usr/local'
  python_bin = "#{python_prefix}/bin/python#{major_version}"
  easy_install = 'easy_install'
  if major_version
    easy_install += "-#{major_version}"
  end
  easy_install_bin = "#{python_prefix}/bin/#{easy_install}"

  case params[:action]
  when :install
    remote_file "#{Chef::Config[:file_cache_path]}/distribute_setup.py" do
      source "http://python-distribute.org/distribute_setup.py"
      mode "0644"
      not_if {::File.exists?(easy_install_bin)}
    end

    execute "install #{easy_install}" do
      cwd Chef::Config[:file_cache_path]
      command "#{python_bin} distribute_setup.py"
      not_if {::File.exists?(easy_install_bin)}
    end

    execute "#{easy_install} #{package}" do
      command "#{easy_install_bin} #{package}"
    end

  end
end
