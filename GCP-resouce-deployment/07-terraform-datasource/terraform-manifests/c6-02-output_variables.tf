/*
#Single VM instnace output
output "vm_instance_id"{
    description = "VM instance id"
    value = google_compute_instance.server-vm.instance_id
}

output "vm_external_ip"{
    description="Ext IP"
    value=google_compute_instance.server-vm.network_interface.0.access_config.0.nat_ip
}

output "vm_machine_type" {
  description = "VM Machine Type"
  value = google_compute_instance.server-vm.machine_type
}

# Terraform Output Values
## ATTRIBUTES


output "vm_selflink" {
  description = "VM Instance Self link"
  value = google_compute_instance.server-vm.self_link
}

output "vm_id" {
  description = "VM ID"
  value = google_compute_instance.server-vm.id
}

## ARGUMENTS
output "vm_name" {
  description = "VM Name"
  value = google_compute_instance.server-vm.name
}

# output "vm_machine_type" {
#   description = "VM Machine Type"
#   value = google_compute_instance.myapp1.machine_type
# }

*/

output "vm_name_0" {
  description = "VM Name"
  value = google_compute_instance.server-vm[0].name
}

output "vm_name_1" {
  description = "VM Name"
  value = google_compute_instance.server-vm[1].name
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

output "for_output_map2" {
  description = "map_output_map advanced"
  value = { 
    for c, instance in google_compute_instance.server-vm: c => instance.instance_id
  }
}

output "for_output_map3" {
  description = "map_output_map advanced"
  value = { 
    for c, instance in google_compute_instance.server-vm: instance.name => instance.instance_id
  }
}


output "legacy_splat_instance" {
  description = "legacy_splat_instance"
  value = google_compute_instance.server-vm.*.name
}

output "latest_splat_instance" {
  description = "Generalized  latest splat_instance"
  value = google_compute_instance.server-vm[*].name
}