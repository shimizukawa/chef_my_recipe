require_recipe "apt"

package "curl"
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

node.python_build.versions.each do |version|
  python_build version
end
