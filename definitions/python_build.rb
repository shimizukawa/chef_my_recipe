
define :python_build, :action => :build, :owner => 'vagrant' do
  version = params[:name] || '2.7.3'
  owner = params[:owner] || 'vagrant'
  archive_dir = params[:archive_dir] || "/home/#{owner}/src"
  archive_file = "Python-#{version}.tar.bz2"
  install_prefix = params[:install_prefix] || '/usr/local'

  case params[:action]
  when :build
    directory archive_dir do
      action :create
    end

    remote_file archive_file do
      action :create_if_missing
      path "#{archive_dir}/#{archive_file}"
      source "http://www.python.org/ftp/python/#{version}/#{archive_file}"
      notifies :run, "execute[extract-python-#{version}]"
    end

    execute "extract-python-#{version}" do
      #action :nothing
      cwd archive_dir
      command "tar jxf #{archive_file}"
      not_if "test -f #{archive_dir}/Python-#{version}"
      notifies :run, "execute[configure-python-#{version}]"
    end

    execute "configure-python-#{version}" do
      #action :nothing
      cwd "#{archive_dir}/Python-#{version}"
      command "./configure --prefix=#{install_prefix}"
      not_if "test -f #{archive_dir}/Python-#{version}/Makefile"
      notifies :run, "execute[make-python-#{version}]"
    end

    execute "make-python-#{version}" do
      action :nothing
      cwd "#{archive_dir}/Python-#{version}"
      command "make"
      notifies :run, "execute[make-install-python-#{version}]"
    end

    execute "make-install-python-#{version}" do
      action :nothing
      cwd "#{archive_dir}/Python-#{version}"
      command "make install"
    end

  end
end
