#
# Cookbook Name:: astrolabe-rb
# Recipe:: libnova
#
# Copyright (C) 2013 Ho-Sheng Hsiao
#
# All rights reserved - Do Not Redistribute
# Permission is hereby granted, free of charge, to any person obtaining a copy of this
# software and associated documentation files (the "Software"), to deal in the Software
# without restriction, including without limitation the rights to use, copy, modify,
# merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be included in all copies
# or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
# CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

include_recipe "build-essential"

libnova_source = node['libnova']['source']
src_filepath   = "#{libnova_source['cache_dir']}/libnova-#{libnova_source['version']}.tar.gz"
build_dir      = libnova_source['build_dir']
build_src_dir  = "#{build_dir}/libnova-#{libnova_source['version']}"
cache_dir      = libnova_source['cache_dir']
libnova_url    = libnova_source['url']

# Refactor this later, owner should be configurable
directory cache_dir do
  user      'vagrant'
  group     'vagrant'
  mode      '00755'
  recursive true
end

directory build_dir do
  user      'vagrant'
  group     'vagrant'
  mode      '00755'
  recursive true
end

package 'libtool'

remote_file libnova_url do
  source   libnova_url
  checksum node['libnova']['source']['checksum']
  path     src_filepath
  backup   false
  action   :create_if_missing
end

bash "compile-libnova" do
  cwd ::File.dirname(src_filepath)
  user  'vagrant'
  group 'vagrant'
  code <<-EOH

    mkdir -p #{build_dir}
    tar -zxf #{::File.basename(src_filepath)} -C #{build_dir} &&
    cd #{build_src_dir} && autoreconf && ./configure && make
  EOH

  #not_if File.exists?('something')
end

execute "install libnova" do
  cwd      build_src_dir
  command 'make install'
  user    'root'
  group   'root'
end

