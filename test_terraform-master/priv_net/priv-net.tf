resource "openstack_networking_network_v2" "network_1" {
  name           = var.network_name
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet_1" {
  network_id = openstack_networking_network_v2.network_1.id
  cidr       = var.subnet_cidr
}