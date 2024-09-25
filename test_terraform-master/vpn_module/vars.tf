variable "instance_name" {
  type    = string
}

variable "flavor_id" {
  type    = string
}

variable "priv_network_name" {
  type    = string
}

variable "pub_network_name" {
  type    = string
}

variable "image_id" {
  type    = string
}

variable "security_group_names" {
  type    = string
}

variable "ssh_key_pair" {
  type    = string
}

# variable "security_group_name_open" {
#   type    = string
# }