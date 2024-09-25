resource "openstack_networking_secgroup_v2" "default_secgroup" {
  name        = var.security_group_name
  description = "default security group for instances"
}

# Define security group rules as needed
resource "openstack_networking_secgroup_rule_v2" "def_secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
//  protocol          = "any"
  security_group_id = openstack_networking_secgroup_v2.default_secgroup.id
}
resource "openstack_networking_secgroup_rule_v2" "def_secgroup_rule_2" {
  direction         = "ingress"
  ethertype         = "IPv6"
  //protocol          = "any"
  security_group_id = openstack_networking_secgroup_v2.default_secgroup.id
} 
