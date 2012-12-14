# Cookbook Name:: redmine
# Attributes:: redmine
#
# Copyright 2009, Opscode, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

default[:python_build][:name] = '2.7.3'
default[:python_build][:owner] = 'vagrant'
default[:python_build][:archive_dir] = "/home/vagrant/src"
default[:python_build][:install_prefix] = '/usr/local'
default[:python_build][:action] = 'build'
default[:python_build][:versions] = ['2.7.3']

default[:mercurial_ext][:action] = :run
default[:mercurial_ext][:owner] = 'vagrant'
default[:mercurial_ext][:hgext_dir] = "/home/vagrant/.hgext"

default[:hgrc][:path] = '/home/vagrant/.hgrc'
default[:hgrc][:username] = nil
default[:hgrc][:hostfingerprints] = {
  'bitbucket.org' => '24:9c:45:8b:9c:aa:ba:55:4e:01:6d:58:ff:e4:28:7d:2a:14:ae:3b',
}
default[:hgrc][:bb] = {
  'username' => '',
  'password' => '',
  'default_method' => 'ssh',
}
