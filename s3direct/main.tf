resource "aws_s3_bucket" "tf-remote-state" {
  bucket = "name of bucket to create" 
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
}
resource "aws_dynamodb_table" "dynamodb-tf-state-lock" {
  name            = "test run" 
  hash_key        = "LockID"
  read_capacity   = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
  tags {
    Name = "DynamoDB tf state locking"
  }
} 
