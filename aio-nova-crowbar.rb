require 'chef/provisioning'

machine 'controller-1' do
  role 'allinone-compute'
  role 'os-image-upload'
  recipe 'openstack-common::openrc'
  # if you would like to use centos7 you'll need to use 'vagrant-aio-centos7-nova' for the environment
  chef_environment 'vagrant-aio-centos7-nova'
  file('/etc/chef/openstack_data_bag_secret',
      "#{File.dirname(__FILE__)}/.chef/encrypted_data_bag_secret")
  converge true
end
