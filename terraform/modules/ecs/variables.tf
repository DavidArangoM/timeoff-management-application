variable "app_name" {
    description = "App name"
}

variable "target_group_arn" {
    description = "Load balancer target group arn"
}

variable "task_role_arn" {
    description = "Task role arn"
}

variable "subnets" {
    description = "The vpc subnets"
    type = list(string)
}

variable "security_groups" {
    description = "The vpc security group"
    type = list(string)
}

variable "tags" {
    type = map(string)
}
