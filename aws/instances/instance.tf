resource "aws_instance" "ec2" {
  ami           = "ami-02541b8af977f6cdd"
  instance_type = "t2.micro"


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