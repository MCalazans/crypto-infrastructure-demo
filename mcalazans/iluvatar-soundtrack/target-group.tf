###
### Target Groups
###
### Target HTTP
resource "aws_lb_target_group" "target_group_http_arda" {
  name = "target-group-http"
  port = "${var.arda_port}"
  protocol = "HTTP"
  target_type = "instance"
  vpc_id = "${aws_vpc.main_vpc.id}"
  health_check {
      protocol = "HTTP"
      path = "/"
      port = "traffic-port"
      timeout = 5
      healthy_threshold = 3
      unhealthy_threshold = 3
      interval = 10
      matcher = 200
  }
}
### Target Arod
resource "aws_lb_target_group" "target_group_http_arod" {
  name = "target-group-http-arod"
  port = "${var.arod_port}"
  protocol = "HTTP"
  target_type = "instance"
  vpc_id = "${aws_vpc.main_vpc.id}"
  health_check {
      protocol = "HTTP"
      path = "/"
      port = "traffic-port"
      timeout = 5
      healthy_threshold = 3
      unhealthy_threshold = 3
      interval = 10
      matcher = 200
  }
}
### Target Shadowfax
resource "aws_lb_target_group" "target_group_http_shadowfax" {
  name = "target-group-http-shadowfax"
  port = "${var.shadowfax_port}"
  protocol = "HTTP"
  target_type = "instance"
  vpc_id = "${aws_vpc.main_vpc.id}"
  health_check {
      protocol = "HTTP"
      path = "/"
      port = "traffic-port"
      timeout = 5
      healthy_threshold = 3
      unhealthy_threshold = 3
      interval = 10
      matcher = 200
  }
}