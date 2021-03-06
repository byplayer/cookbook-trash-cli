#
# Cookbook Name:: trash-cli
# Recipe:: default
#
# Copyright (C) 2017 byplayer
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

git node['trash-cli']['work_dir'] do
  repository node['trash-cli']['repo']
  reference node['trash-cli']['ref']
  enable_submodules true
  action :sync
end

bash 'install trash-cli' do
  code <<-EOH
    cd #{node['trash-cli']['work_dir']}
    python setup.py install #{node['trash-cli']['install_opts'].join(' ')}
  EOH
end
