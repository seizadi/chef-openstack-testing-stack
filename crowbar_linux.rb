require 'chef/provisioning'
with_driver 'crowbar:http://10.49.12.20:3000'
with_machine_options crowbar_options: { 'provisioner-target_os' => 'centos-7.0.1406' }
