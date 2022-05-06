resource "aws_key_pair" "keypair" {
  key_name   = var.keyname
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

output "required-keypair-vars" {
  value = aws_key_pair.keypair.key_name
}