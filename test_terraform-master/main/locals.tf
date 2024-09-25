locals {

# network
priv_network_name_open = "test_private_network"
subnet_cidr_open = "16.0.1.0/24"
pub_network_name = "eu-west-01-public"

# SG
security_group_name_open = "test-01-SG"
vpn_security_group_name_open = "vpn-01-SG"
fw_security_group_name_open = "fw-01-SG"

# instance
instance_name_open = "test_instance"
flavor_id_open = "079d96e7-289d-4241-964e-d9445d5a61f0"
image_id_open = "e84572fe-fef3-4e1c-9bd0-922c791b8718"

# vpn
vpn_name_open = "vpn-test-terraform"
# vpn_security_group_name_open = "vpn-01-SG"

# FW
fw_name_open = "fw-test-terraform"
# security_group_id =

# ssh-key
ssh_name_open = "umer-ssh-key"
# ssh_public_key_open = file("~/.ssh/id_rsa.pub")
//ssh_public_key_open = "~/.ssh/id_rsa.pub"
}
