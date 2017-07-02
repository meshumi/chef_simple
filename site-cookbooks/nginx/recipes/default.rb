cookbook_file '/etc/nginx/sites-enabled/shopperations' do
  owner 'root'
  group 'root'
  mode '0655'
  notifies :restart, resources(service: 'nginx'), :delayed
end
