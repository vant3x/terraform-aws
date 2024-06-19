output "instance_ip_address" {
    #value = aws_instance.exampleterra2.private_ip
    value = { for service, i in aws_instance.exampleterra2 : service => i.private_ip}
}