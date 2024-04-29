resource "aws_security_group" "alb" {
  name = "${var.cluster_name}-alb-sg"
}

resource "aws_security_group_rule" "allow_http_inbound" {
  security_group_id = aws_security_group.alb.id
  type              = "ingress"
  from_port         = local.http_port
  to_port           = local.http_port
  protocol          = local.tcp_protocol
  cidr_blocks       = local.all_ips
}

resource "aws_security_group_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.alb.id
  type              = "egress"
  from_port         = local.any_port
  to_port           = local.any_port
  protocol          = local.any_protocol
  cidr_blocks       = local.all_ips
}

