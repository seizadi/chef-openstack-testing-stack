require 'chef/provisioning'

machine 'controller' do
  role 'os-compute-single-controller'
  recipe 'openstack-network::identity_registration'
  role 'os-network-dhcp-agent'
  role 'os-network-metadata-agent'
  role 'os-network-server'
  recipe 'openstack-common::openrc'
  # if you would like to use centos7 you'll need to use 'vagrant-multi-centos7-nova' for the environment
#  chef_environment 'vagrant-multi-nova'
  chef_environment 'vagrant-multi-centos7-nova'
  file('/etc/chef/openstack_data_bag_secret',
       "#{File.dirname(__FILE__)}/.chef/encrypted_data_bag_secret")
  converge true
end

machine_batch do
  [%w(compute1), %w(compute2), %w(compute3)].each do |name|
    machine name do
      role 'os-compute-worker'
      # if you would like to use centos7 you'll need to use 'vagrant-multi-centos7-nova' for the environment
#      chef_environment 'vagrant-multi-nova'
      chef_environment 'vagrant-multi-centos7-nova'
      file('/etc/chef/openstack_data_bag_secret',
           "#{File.dirname(__FILE__)}/.chef/encrypted_data_bag_secret")
      converge true
    end
  end
end
