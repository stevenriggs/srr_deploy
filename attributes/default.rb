#
# Cookbook Name:: srr_deploy
# Attributes:: default
#

default['srr_deploy']['user'] = 'deploy'
default['srr_deploy']['uid'] = ''
default['srr_deploy']['group'] = 'deploy'
default['srr_deploy']['gid'] = ''


#override this to set your own databag with a password
default['srr_deploy']['password_databag'] = 'deploy'

user_creds = Chef::EncryptedDataBagItem.load("passwords", "#{node['srr_deploy']['password_databag']}")
default['srr_deploy']['user_password'] = user_creds["password"]
