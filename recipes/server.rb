#
# Cookbook:: myiis
# Recipe:: server
#
# Copyright:: 2021, The Authors, All Rights Reserved.

windows_feature 'IIS-WebServerRole' do
  action :install
  all true
end

# file 'C:\inetpub\wwwroot\Default.htm' do
#   content "<h1>Hello, world!</h1>
#   <h2>PLATFORM: #{node['platform']} </h2>
# 	<h2>HOSTNAME: #{node['hostname']} </h2>
# 	<h2>IPADDRESS: #{node['ipaddress']} </h2>
#   <h2>IPADDRESS: #{node['network']['interfaces']['0x4']['addresses'].first.first} </h2>
# 	<h2>CPU: #{node['cpu']['0']['mhz']} </h2>
# 	<h2>MEMORY: #{node['memory']['total']} </h2>
# "
# end

template 'C:\inetpub\wwwroot\Default.htm' do
	source 'Default.htm.erb'
	variables(
		:name => 'minson'
	)
	action :create
	notifies :restart, 'service[w3svc]', :immediately
end

remote_file 'C:\inetpub\wwwroot\image.jpg' do
	source 'https://static.vecteezy.com/system/resources/previews/000/366/941/original/chef-boy-vector.jpg'
end

service 'w3svc' do
  action [:enable, :restart ]
end
