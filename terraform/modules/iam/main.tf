resource "aws_iam_role" "gorilla_iam_role" {
    name                = "${var.app_name}-ecs-task-role"
    tags                = merge(var.tags, {Name= "${var.app_name}-ecs-task-role"})
    assume_role_policy  = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Sid    = "",
            Principal= {
                "Service": "ecs-tasks.amazonaws.com"
            }
        },
        ]
    })

    inline_policy {  
        name = "${var.app_name}-policy"
        policy = jsonencode({
            Version = "2012-10-17"
            Statement = [
                {
                    Effect= "Allow",
                    Action= "ecr:*",
                    Resource= "*"
                },
                {
                    Effect  = "Allow",
                    Resource= "*",
                    Action  = [
                        "ecr:GetAuthorizationToken",
                        "ecr:BatchCheckLayerAvailability",
                        "ecr:GetDownloadUrlForLayer",
                        "ecr:BatchGetImage",
                        "logs:CreateLogStream",
                        "logs:PutLogEvents"
                    ],
                },
                {
                    Effect  = "Allow",
                    Resource= "*",
                    Action  = [
                        "ssmmessages:CreateControlChannel",
                        "ssmmessages:CreateDataChannel",
                        "ssmmessages:OpenControlChannel",
                        "ssmmessages:OpenDataChannel"
                    ]
                },
                {
                    Effect= "Allow",
                    Action= "secretsmanager:*",
                    Resource= "*"
                }
            ]
        })
    }
}

output "out_task_role_arn" {
  value = aws_iam_role.gorilla_iam_role.arn
}