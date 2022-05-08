
resource "aws_ecs_cluster" "cluster" {
  name = var.CLUSTER_NAME # Naming the cluster
}

resource "aws_ecs_service" "python-service" {
  name            = var.SERVICE_NAME                           
  cluster         = aws_ecs_cluster.cluster.id                 
  task_definition = aws_ecs_task_definition.on-create-task.arn 
  launch_type     = "FARGATE"
  desired_count   = 2 

  load_balancer {
    target_group_arn = aws_lb_target_group.target-group.arn 
    container_name   = aws_ecs_task_definition.on-create-task.family
    container_port   = 8000 
  }

  network_configuration {
    subnets          = var.PUBLIC_SUBNETS
    assign_public_ip = true 
    security_groups  = ["${aws_security_group.service-security-group.id}"]
  }

}

resource "aws_security_group" "service-security-group" {

  vpc_id = var.VPC_ID
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # Only allowing traffic in from the load balancer security group
    security_groups = ["${aws_security_group.loadbalancer-securitygroup.id}"]
  }

  egress {
    from_port   = 0             # Allowing any incoming port
    to_port     = 0             # Allowing any outgoing port
    protocol    = "-1"          # Allowing any outgoing protocol 
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic out to all IP addresses
  }
}
