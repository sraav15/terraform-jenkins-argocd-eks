resource "aws_security_group" "appsg" {
  name        = var.name_appsg
  vpc_id      = var.vpc_id

  tags = {
    Name = "app-sg"
  }
}
resource "aws_vpc_security_group_ingress_rule" "appsg_https" {
  security_group_id = aws_security_group.appsg.id
  cidr_ipv4         = var.cidr_ipv4_appsg
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "appsg_http" {
  security_group_id = aws_security_group.appsg.id
  cidr_ipv4        = var.cidr_ipv4_appsg
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "appsg_egress" {
  security_group_id = aws_security_group.appsg.id
  cidr_ipv4         = "0.0.0.0/0"
   ip_protocol = "-1" 
  
}
resource "aws_vpc_security_group_ingress_rule" "appsg_jenkins" {
  security_group_id = aws_security_group.appsg.id
  cidr_ipv4         = var.cidr_ipv4_appsg
  from_port         = 8080
  to_port           = 8080
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "appsg_ssh" {
  security_group_id = aws_security_group.appsg.id
  cidr_ipv4         = var.cidr_ipv4_appsg
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}