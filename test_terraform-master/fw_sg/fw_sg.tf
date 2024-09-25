# Define required providers
terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

resource "openstack_networking_secgroup_v2" "fw_secgroup" {
  name        = var.fw_security_group_name
  description = "vpn security group for instances"
}

resource "openstack_networking_secgroup_rule_v2" "fw_secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "0"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.fw_secgroup.id
}  
resource "openstack_networking_secgroup_rule_v2" "fw_secgroup_rule_2" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_max = 443
  port_range_min = 443
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.fw_secgroup.id
}
