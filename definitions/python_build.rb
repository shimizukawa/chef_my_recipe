
define :python_build, :action => :build, :owner => 'vagrant' do
  version = params[:name] || '2.7.3'
  owner = params[:owner] || 'vagrant'

  case params[:action]
  when :build
    directory "/home/#{owner}/src" do
      action :create
    end

    remote_file "Python-#{version}.tgz" do
      action :create_if_missing
      path "/home/#{owner}/src/Python-#{version}.tar"
      # remote_file automatically unzipping... this is work-around.
      source "http://www.python.org/ftp/python/#{version}/Python-#{version}.tgz"
      notifies :run, "execute[extract-python-#{version}]"
    end

    execute "extract-python-#{version}" do
      #action :nothing
      cwd "/home/#{owner}/src"
      command "tar xf Python-#{version}.tar"
      # remote_file automatically unzipping... "xf" instead of "zxf" is work-around.
      not_if "test -f /home/#{owner}/src/Python-#{version}"
      notifies :run, "execute[configure-python-#{version}]"
    end

    execute "configure-python-#{version}" do
      #action :nothing
      cwd "/home/#{owner}/src/Python-#{version}"
      command "./configure --prefix=/usr/local"
      not_if "test -f /home/#{owner}/src/Python-#{version}/Makefile"
      notifies :run, "execute[make-python-#{version}]"
    end

    execute "make-python-#{version}" do
      action :nothing
      cwd "/home/#{owner}/src/Python-#{version}"
      command "make"
      notifies :run, "execute[make-install-python-#{version}]"
    end

    execute "make-install-python-#{version}" do
      action :nothing
      cwd "/home/#{owner}/src/Python-#{version}"
      command "make install"
    end

  end
end
