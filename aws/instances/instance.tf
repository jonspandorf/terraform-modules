resource "aws_instance" "ec2" {
  ami           = var.instance_ami
  instance_type = var.instance_type


  subnet_id = aws_subnet.public-subnet.id

  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  key_name = aws_key_pair.keypair.key_name

  provisioner "remote-exec" {
    inline = length(var.remote-exec_commands) > 0 ? var.remote-exec_commands : ""
  }

  connection {
    type        = "ssh"
    user        = var.sshuser
    private_key = file("${var.PATH_TO_KEY}")
    host        = self.public_ip
  }


}

output "instance-public-ip" {
  value = ["${aws_instance.ec2.*.public_ip}"]
}