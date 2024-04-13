variable "region" {}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "Project-pub-sub-1-cidr" {
    default = "10.0.1.0/24"
}

variable "Project-pub-sub-2-cidr" {
    default = "10.0.2.0/24"
}

variable "Project-priv-sub-1-cidr" {
    default = "10.0.3.0/24"
}

variable "Project-priv-sub-2-cidr" {
    default = "10.0.4.0/24"
}

variable "gateway_cidr" {
    default = "0.0.0.0/0"
}

variable "instance_tenancy" {
    default = "default"
}

variable "enable_dns_hostnames" {
    default = "true"
}

variable "availability_zone_1" {}

variable "availability_zone_2" {}
