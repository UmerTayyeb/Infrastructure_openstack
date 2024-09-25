resource "openstack_compute_instance_v2" "fw_instance" {
  name            = var.instance_name
  flavor_id       = var.flavor_id
  image_id        = var.image_id
  security_groups = [var.security_group_names]
  key_pair        = var.ssh_key_pair

  network {
    name = var.priv_network_name
  }
  network {
    name = var.pub_network_name
  }
}
