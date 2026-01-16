locals {
  name = "${var.org}-${var.dep}-${var.bu}-${var.env}-${var.region}-${var.tier}-rtype" 

  common_tags = { 
    Environment = "dev"
    Business_Unit = var.bu
    Tier = var.tier  
    Team = "devop" 
    Project_name = "streaming_ai"
    Managed_by = "terraform"
  }
}