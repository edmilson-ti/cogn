terraform { 
  cloud { 
    
    organization = "threecloud" 

    workspaces { 
      name = "infra_prd" 
    } 
  } 
}

provider "aws" {
  region = "us-east-1"
}