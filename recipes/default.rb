#
# Cookbook Name:: srr_deploy
# Recipe:: default
#
# Copyright 2014, Steven Riggs
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
#

#setup the group
group "#{node[:srr_deploy][:group]}" do
	if node['srr_deploy']['gid'] != ''
		gid "#{node[:srr_deploy][:gid]}"
	end
end

#setup deploy user account
user "#{node[:srr_deploy][:user]}" do
  supports :manage_home=>true
  comment "Used for app deployments"
  if node['srr_deploy']['uid'] != ''
    uid "#{node[:srr_deploy][:uid]}"
  end
  gid "#{node[:srr_deploy][:group]}"
  password "#{node[:srr_deploy][:user_password]}"
end
#put it in the group
group "#{node[:srr_deploy][:group]}" do
  action :modify
  members "#{node[:srr_deploy][:user]}"
  append true
end

#give deploy user account some sudo privs
template "/etc/sudoers.d/deploy" do
  source "deploy_sudo.erb"
  mode '0440'
  variables ({
	:user => node[:srr_deploy][:user]
  })
end
