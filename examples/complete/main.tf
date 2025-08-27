module "vpc" {
  source = "./modules/networking"
  vpc_config = {
    name       = "your_vpc_name"
    cidr_block = "10.0.0.0/16"
  }
  subnet_config = {
    subnet-1 = {
      cidr_block = "10.0.0.0/24"
      az         = "us-east-1a"
    }
    subnet-2 = {
      cidr_block = "10.0.1.0/24"
      az         = "us-east-1b"
      # While creating subnet please make note of this.
      public = true
    }
  }
}
