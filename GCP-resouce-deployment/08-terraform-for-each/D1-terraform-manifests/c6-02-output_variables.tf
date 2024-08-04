output "vm_external_ip"{
    description="Ext IP"
    #value=google_compute_instance.server-vm.network_interface.0.access_config.0.nat_ip
    value = {for instance in google_compute_instance.server-vm: instance.name => instance.network_interface.0.access_config.0.nat_ip}
}



output "for_output_list" {
  description = "for_output_list"
  value = [ 
    for instance in google_compute_instance.server-vm: instance.name
     ]
}

output "for_output_map1" {
  description = "map_output_map"
  value = { 
    for instance in google_compute_instance.server-vm: instance.name => instance.instance_id
  }
}

