
data "template_file" "define-task" {
  template = file("./templates/task_def.json.tpl")
  vars = {
    REPOSITORY_URL = var.MYREPO
    CONTAINER_NAME = var.task-name
  }
}



resource "aws_ecs_task_definition" "on-create-task" {
  family                   = var.task-name
  container_definitions    = data.template_file.define-task.rendered
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = 512
  cpu                      = 256
  execution_role_arn       = aws_iam_role.ecs-execution-roles.arn
}

