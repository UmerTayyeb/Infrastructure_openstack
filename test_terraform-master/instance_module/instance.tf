resource "openstack_compute_instance_v2" "internal_instance" {
  name            = var.instance_name
  flavor_id       = var.flavor_id
  image_id        = var.image_id
  key_pair        = var.ssh_key_pair//openstack_compute_keypair_v2.umer_ssh_key.name
  security_groups = [var.security_group_names]

  network {
    name = var.network_name
  }
}
