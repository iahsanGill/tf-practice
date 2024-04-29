resource "aws_security_group" "instance" {
  name = "${var.cluster_name}-instance-sg"
}

resource "aws_security_group_rule" "allow_inbound_server_port" {
  security_group_id = aws_security_group.instance.id
  type              = "ingress"
  from_port         = var.server_port
  to_port           = var.server_port
  protocol          = local.tcp_protocol
  cidr_blocks       = local.all_ips
}
