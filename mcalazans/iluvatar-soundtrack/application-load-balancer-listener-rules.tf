###
### Listener Rules
###
### Arod Listener Rule
resource "aws_lb_listener_rule" "arod_rule" {
  listener_arn = "${aws_lb_listener.arda_load_balancer_listerner.arn}"
  priority     = 100
  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.target_group_http_arod.arn}"
  }
  condition {
    field  = "path-pattern"
    values = ["/arod*"]
  }
}

### Shadowfax Listener Rule
resource "aws_lb_listener_rule" "shadowfax_rule" {
  listener_arn = "${aws_lb_listener.arda_load_balancer_listerner.arn}"
  priority     = 110
  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.target_group_http_shadowfax.arn}"
  }
  condition {
    field  = "path-pattern"
    values = ["/shadowfax*"]
  }
}