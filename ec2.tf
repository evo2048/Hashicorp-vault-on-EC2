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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDh+gXOpZvLpry4hLQN3S2UjKTk9aAww61Rd9MTrnvM1jJJkcb6J7K2tTIweS7JGJf/nhZ6JxMDA6Xul7WHIQqO++3wGCqIqKicaKTHBRydvdbXE/WjAyUkpd+W9tARJ56FtDsLWmOHpcwImLdyo4noO/vm/4lZ/tZCNSiwVrWI6+FXo3SC78BZ1BrFvZEtP0D/rVZ6zIfkTL+M/97LoST2xI0yiid7F4gNQyplGT1eVWz5aXy5Y3McUtG/bo2F8+PSIrVV5o6r1uxRnHPA3vGjtQF2BhbOEWM8p10FDlNt3VPjOh0phUsaLldY/ZGYKAPV8kXJv2aYmc/QVK+woipD mrc@loca1host"
  tags = {
    "Name" = "Personal key"
  }
}
