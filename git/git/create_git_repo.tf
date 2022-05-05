
resource "github_repository" "new_git_repo" {
  name        = var.name
  description = var.description
  visibility = var.visibility
  # gitignore_template = var.gitignoreTemplate ? var.gitignoreTemplate : ""
}