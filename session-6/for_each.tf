resource "aws_s3_bucket" "main" {
  for_each            = var.buckets
  bucket              = each.value.name
  object_lock_enabled = each.value.object_lock_enabled
  #   acl = each.value.acl 
  tags = {
    Name = each.key
  }

}


variable "buckets" {
  description = "Map for buckets"
  type        = map(any)
  default = {
    bucket-1 = {
      name                = "terraform-session-aug25-meder-1"
      object_lock_enabled = true,
      # acl = "public-read"
    }
    bucket-2 = {
      name                = "terraform-session-aug25-meder-2"
      object_lock_enabled = false,
      # acl = "public-read"

    }
  }
}