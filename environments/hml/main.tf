terraform { 
  cloud { 
    
    organization = "threecloud" 

    workspaces { 
      name = "infra_hml" 
    } 
  } 
}

provider "aws" {
  region = "us-east-1"
}