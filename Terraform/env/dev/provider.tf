provider "aws" {
  version = "~> 3.27"
  region  = "us-east-2"
}

module "the4techies" {
  source = "../../modules"
  env    = "dev"
}
