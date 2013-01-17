require_recipe "apt"

package "curl"
package "screen"
package "subversion"

cookbook_file "~/.screenrc" do
  source 'screenrc.dot'
  action :create_if_missing
  owner owner
  mode "0664"
end
