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