# # ssh-key
resource "openstack_compute_keypair_v2" "umer_ssh_key" {
  name       = var.ssh_name//"umer-ssh-key"
  public_key = file("~/.ssh/id_rsa.pub")  # Replace with the path to your public key file
}