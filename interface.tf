variable "name" {
  description = "The name of the VCP."
}

variable "cidr" {
  description = "The CIDR of the VCP."
}

variable "public_subnet" {
  description = "The public subnet to create"
}

variable "enable_dns_hostnames" {
 description = "Should be true if you want to use private DNS within the VCP"
 default = true
}

variable "enable_dns_support" {
 description = "Should be true if you want to use private DNS in the VCP"
 default = true
}

output "public_subnet_id" {
  value = "${aws_subnet.public.id}"
}

output "vcp_id" {
  value = "${aws_vcp.tfb.id}"
}

output "cidr" {
  value = "${aws_vcp.tfb.cidr_block}"
}

