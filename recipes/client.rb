
require_recipe "syslog"

template "/etc/syslog-ng/syslog-ng.conf" do
  source "syslog-ng-client.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "syslog-ng")
  not_if { node.run_list.include?("recipe[syslog::server]") }
end


