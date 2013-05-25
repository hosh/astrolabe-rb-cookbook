#
# Cookbook Name:: astrolabe-rb
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

default['libnova']['source']['url'] = 'http://downloads.sourceforge.net/project/libnova/libnova/v%200.15.0/libnova-0.15.0.tar.gz'
default['libnova']['source']['version'] = '0.15.0'
default['libnova']['source']['md5'] = '756fdb55745cb78511f83a62c25f3be4'
default['libnova']['source']['build_dir'] = '/var/opt/build'
default['libnova']['source']['cache_dir'] = Chef::Config['file_cache_path'] || '/tmp'
