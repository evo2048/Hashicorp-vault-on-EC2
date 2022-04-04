resource "aws_instance" "Vault_EC2" {
  ami                         = "ami-04505e74c0741db8d"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.vault_sg.name]
  key_name                    = aws_key_pair.personal_key.key_name
  tags = {
    "Name" = "Vault-Instance"
  }
  provisioner "local-exec" {
    command = "echo [vault-server] '\n' ${aws_instance.Vault_EC2.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=../aws_rsa > ./ansible/hosts"
  }
}
resource "aws_key_pair" "personal_key" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBTQwBFHp3bWgkLZI031vTkVu9Ye/7AOti7ZQH9Se960Y1TcCpnGlVXTrE81BdpiQ7tVlnRydRuJk43KgQsmNRKdHHXOEMikrypzhTwXoOHmvUed5coHCb8z7H6jeef13JHs8L//MVecF89X7YTeW+jCD2TkA6RKZZ2eplAHV2MyWPyZ86ZaUwD/mio4tkXEX/SNVSmQoSf5T/b/R+icIkTy1N949A0ChfqDWtiUNqX4hVFQZXcd+yrAXvnbFPs8qhPGmlgPBPi19iv1gxxkqLVxvuvuzYGOk9jw8FD9xHgDKjrPMSrgxJYMdK+pcyP6/omCthx+pU0hIPZ72h7H8ZY9kNk64k5duR6mfteCKQR9ccRllLFVNVeUfy41xACsYkE+DcLHKPXD4JwoC+XZ4q0tgFJEsymGYBNi+QfRVEOJiGSpM/A0I8Dfdctd80dAYSoC5vJ6/miVlAEO7gV4G6AmPoWPrgOzWy6tk3pTtozNLPU1qft2YtQ8TD0RCTKG8= mrx@admin0"
  tags = {
    "Name" = "Personal key"
  }
}
