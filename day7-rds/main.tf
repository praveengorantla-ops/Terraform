resource "aws_db_instance" "default" {
    allocated_storage = 10
    db_name = "mydb"
    engine = "mysql"
    engine_version = "8.0"
    instance_class = "db.t3.micro"
    username = "admin"
    password = "cloud124"
    db_subnet_group_name = aws_db_subnet_group.sub-grp.id
    parameter_group_name = "default.mysql8.0"

    # enable backups and retention
    backup_retention_period = 7 #retain backups for 7 days
    backup_window = "02:00-03:00" #daily backup window (UTC)

    # enable monitoring  (cloudwatch enhanced monitoring)
    monitoring_interval = 60 #collect metrics every 60 seconds
    monitoring_role_arn = aws_iam_role.rds_monitoring.arn

        # maintenance window
    maintenance_window = "sun:04:00-sun:05:00" # maintenance every sunday (UTC)

    # enable deletion protection (to prevent accidental deletion)
    deletion_protection = true

    #skip final snapshot
    skip_final_snapshot = true
}

# IAM role for rds enhanced monitoring
resource "aws_iam_role" "rds_monitoring" {
    name = "rds-monitoring-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
                Service = "monitoring.rds.amazonaws.com"
            }
        }]
    })
}

# iam policy attachment for rds monitoring
resource "aws_iam_role_policy_attachment" "rds_monitoring_attach" {
    role = aws_iam_role.rds_monitoring.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}


resource "aws_db_subnet_group" "sub-grp" {
   name  = "mycutsubnet" 
   subnet_ids = ["subnet-0abb46d28fffccb31",
"subnet-0ebd64e7897776ef9"]

   tags = {
     name = "My DB subnet group"
   }
}
