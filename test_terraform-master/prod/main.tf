
# data "openstack_networking_secgroup_v2" "example" {
#   name = "test-01-SG"  # Replace with the name of your security group
# }

module "private_network" {
  source = "../priv_net"

  # Pass any required variables to the private network module
  network_name       = local.priv_network_name_open 
  subnet_cidr        = local.subnet_cidr_open
}

# def SG
module "security_group" {
  source = "../SG_module"

  # Pass any required variables to the security group module
  security_group_name = local.security_group_name_open
}

# vpn SG
module "vpn_sg" {
  source = "../vpn_sg"

  # Pass any required variables to the security group module
  vpn_security_group_name = local.vpn_security_group_name_open
}

# fw SG
module "fw_sg" {
  source = "../fw_sg"

  # Pass any required variables to the security group module
  fw_security_group_name = local.fw_security_group_name_open
}

# # # ssh-key
module "ssh_key" {
  source = "../ssh_key_module"

  ssh_name = local.ssh_name_open
  //ssh_public_key = local.ssh_public_key_open
}

# instance
module "instance" {
  source = "../instance_module"

  # Pass any required variables to the instance module
  instance_name      = local.instance_name_open
  flavor_id          = local.flavor_id_open
  network_name       = local.priv_network_name_open
  image_id           = local.image_id_open
  security_group_names = local.security_group_name_open
  ssh_key_pair = local.ssh_name_open
  //key_pair        = openstack_compute_keypair_v2.umer_ssh_key.name
  # key_pair {
  #   name      = openstack_compute_keypair_v2.umer_ssh_key.name
  # }
  depends_on = [
    module.private_network,
    module.security_group,
    module.ssh_key,
  ]
}

# vpn instance
module "vpn_instance" {
  source = "../vpn_module"

  # Pass any required variables to the instance module
  instance_name      = local.vpn_name_open
  flavor_id          = local.flavor_id_open
  priv_network_name = local.priv_network_name_open
  pub_network_name= local.pub_network_name
  image_id           = local.image_id_open
  security_group_names = local.vpn_security_group_name_open
  ssh_key_pair = local.ssh_name_open
  depends_on = [
    module.private_network,
    module.vpn_sg,
    module.ssh_key,
  ]
}

# fw instance
module "fw_instance" {
  source = "../fw_module"

  # Pass any required variables to the instance module
  instance_name      = local.fw_name_open
  flavor_id          = local.flavor_id_open
  priv_network_name = local.priv_network_name_open
  pub_network_name= local.pub_network_name
  image_id           = local.image_id_open
  security_group_names = local.fw_security_group_name_open
  ssh_key_pair = local.ssh_name_open
  depends_on = [
    module.private_network,
    module.fw_sg,
    module.ssh_key,
  ]
}