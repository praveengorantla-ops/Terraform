module "db" {
  # source = "github.com/CloudTechDevOps/terraform-aws-rds" #terraform registry forked into my github
  identifier = "demodb"

engine   = "mysql"
engine_version = "5.7"
instance_class = "db.t3a.large"
allocated_storage = 5

db_name = "demodb"
username = "user"
port = "3306"

iam_database_authentication_enabled = true

vpc_security_group_ids = ["sg-06dc8c54581585563"]

maintenance_window = "mon:00:00-mon:03:00"
backup_window = "03:00-06:00"

# Enhanced Monitoring - see example for details on how to create the role
# by yourself, in case you dont want to create it automatically
monitoring_interval = "30"
monitoring_role_name = "MyRDSMonitoringRole"
create_monitoring_role = true

tags = {
    owner = "user"
    Environment = "devl"
}

# DB subnet group 
create_db_subnet_group = true
subnet_ids = ["subnet-0ebd64e7897776ef9", "subnet-0abb46d28fffccb31"]

# DB parameter group
family = "mysql5.7"

# DB option group
major_engine_version = "5.7"

# Database Deletion protection
deletion_protection = true

parameters = [
    {
        name = "character_set_client"
        value = "utf8mb4"
    },
    {
        name = "character_set_server"
        value = "utf8mb4"
    }
]

options = [
    {
        option_name = "MARIADB_AUDIT_PLUGIN"

        option_settings = [
            {
                name = "SERVER_AUDIT_EVENTS"
                value = "CONNECT"
            },
            {
                name = "SERVER_AUDIT_FILE_ROTATIONS"
                value = "37"
            },   
        ]
    },
  ]
}