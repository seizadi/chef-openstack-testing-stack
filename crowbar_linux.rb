require 'chef/provisioning'
with_driver 'crowbar'
with_machine_options crowbar_options: { 'provisioner-target_os' => 'centos-7.0' }
