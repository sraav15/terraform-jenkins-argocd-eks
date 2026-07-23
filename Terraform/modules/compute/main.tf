resource "aws_instance""app_instances" {
  
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = var.public_subnets[0]
    # user_data = file("${path.module}/jenkins-install.sh")
    user_data = file("${path.module}/${var.user_data}")
    vpc_security_group_ids = var.vpc_sg_id
    iam_instance_profile = var.iam_instance_profile
    
  tags = {
    Name = var.instance_name
  }
}
  
    
