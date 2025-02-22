
#creating s3 bucket and dynamo DB for state backend storage and applying the lock mechanism for statefile

# this backend configuration instructs terraform to store its state in an s3 bucket
terraform {
    backend "s3" {
        bucket       = "mineprvn" # name of the s3 bucket where the state will be stored.
        region       = "ap-south-1"
        key          = "terraform.tfstate" #path within the bucket where the state will be read/written.
        dynamodb_table = "terraform-state-lock-dynamo" # dynamodb table used for state locking, note: first run day-4-s3-dynamodb resource then day-4-state-remote-backend
        encrypt = true # ensures the state is encrypted at rest in s3.
    }
}