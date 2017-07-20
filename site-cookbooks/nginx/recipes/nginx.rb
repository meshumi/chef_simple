package 'nginx'

directory '/etc/nginx/ssl/my_site' do
  owner node['user']['name']
  group node['user']['name']
  mode 0644
  recursive true
  action :create
end

template '/etc/nginx/ssl/my_site/ssl_bundle.crt' do
  source 'ssl_bundle.crt'
  owner node['user']['name']
  group node['user']['name']
  mode 0644
end

template '/etc/nginx/ssl/my_site/my_site_ssl.key' do
  source 'my_site_ssl.key'
  owner node['user']['name']
  group node['user']['name']
  mode 0644
end

service 'nginx' do
  supports [:status, :restart]
  action :start
end
