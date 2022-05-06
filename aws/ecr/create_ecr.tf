resource "aws_ecr_repository" "myrepo" {
  name = var.my_ecr
}

output "ecr_url" {
    value = "${aws_ecr_repository.myrepo.repository_url}"
}

