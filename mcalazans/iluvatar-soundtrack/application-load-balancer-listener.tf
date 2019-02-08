###
### Load balancer listener
###
resource "aws_lb_listener" "arda_load_balancer_listerner" {
  load_balancer_arn = "${aws_lb.arda-loadbalancer.arn}"
  port              = "${var.arda_port}"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.target_group_http_arda.arn}"
  }
}