resource "aws_security_group" "required-sec-groups" {
  #  needs the project-network.id 
  vpc_id      = var.vpc_id
  name        = var.securitygroup_name
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.secgrp_ports
    iterator = port
    content {
      from_port = port.value
      to_port   = port.value
      # secgroup is map/object
      protocol    = lookup(var.protocols, port.value)
      cidr_blocks = ["${var.mycidr_block}"]
    }

  }
  tags = {
    Name = "${var.securitygroup_name}"
  }
}


output "security-group-id" {
  value = aws_security_group.required-sec-groups.id
}