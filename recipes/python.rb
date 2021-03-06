require_recipe "apt"

package 'build-essential'
package 'libsqlite3-dev'
package 'libreadline6-dev'
package 'libgdbm-dev'
package 'zlib1g-dev'
package 'libbz2-dev'
package 'sqlite3'
#pakcage 'tk-dev' #not found on ubuntu-12.04?
package "libjpeg62-dev"
package "gettext"

package "pypy"

node.python_build.versions.each do |version|
  python_build version
  node.python_build.packages.each do |package|
    python_package package do
      version version
    end
  end
end
