
variable "Region_name" {
     description = "name of region"
     default = "eu-west-2"
}


 variable "VPC_Cidr" {
     description = "cidre block for VPC"
     default = "10.0.0.0/16"
    
   
 }

 variable "Pub1_Cidr" {
     description = "cidre block for public subnet"
     default = "10.0.14.0/24"
   
 }

 variable "pub2_Cidr" {
     description = "cidre block for public subnet"
     default = "10.0.15.0/24"
   
 }

 variable "priv1_Cidr" {
     description = "cidre block for private subnet"
     default = "10.0.16.0/24"
 }
   
 variable "priv2_Cidr" {
     description = "cidre block for private subnet"
     default = "10.0.17.0/24"
 }
   


 variable "ami_1" {
     description = "AMI for server1"
     default =  "ami-0c0a1cc13a52a158f" 
   
 }

 variable "ami_2" {
     description = "AMI for server2"
     default =  "ami-0c0a1cc13a52a158f" 
   
 }

 variable "IGW_cidr" {
     description = "cidr for IGW"
     default = "0.0.0.0/0"
 }

 variable "type1" {
     description = "instance type for server 1"
     default = "T2 micro"
 }

 variable "type2" {
     description = "instance type for server 1"
     default = "T2 micro"
 }

 variable "zone1" {
     description = "availabibilty for server 1"
     deafault =    "eu-west-2a"
   
 }

 variable "zone2" {
     description = "availabibilty for server 1"
     deafault =    "eu-west-2b"
   
 }