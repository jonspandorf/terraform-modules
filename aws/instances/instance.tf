resource "aws_instance" "ec2" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  # needs public-subnet.id
  subnet_id = var.public_subnet_id

  vpc_security_group_ids = [var.securitygroup_id]

  #  provide the keypair name
  key_name = var.keyname

  provisioner "remote-exec" {
    inline = var.remote-exec_commands

    connection {
      type        = "ssh"
      user        = var.sshuser
      private_key = file("${var.PATH_TO_PRIVATE}")
      host        = self.public_ip
    }
  }


}

output "instance-public-ip" {
  value = ["${aws_instance.ec2.*.public_ip}"]
}