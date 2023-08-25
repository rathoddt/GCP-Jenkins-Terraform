terraform {
 required_providers {
     aws = {
         source = "hashicorp/aws"
         version = "5.13.1"
     }
 }
}

# Configure the AWS provider

provider "aws" {
    region = "us-east-1"
    #access_key = "AKIA5F6AT3FUTXHT6BOP"
    #secret_key = "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"
}


# Create a VPC

resource "aws_vpc" "MyLab-VPC"{
    //cidr_block = var.cidr_block[0]
    cidr_block ="172.20.0.0/16"

    tags = {
        Name = "MyLab-VPC"
    }

}

# Create Subnet

resource "aws_subnet" "MyLab-Subnet1" {
    vpc_id = aws_vpc.MyLab-VPC.id
    #cidr_block = var.cidr_block[1]
    cidr_block ="172.20.10.0/24"

    tags = {
        Name = "MyLab-Subnet1"
    }
}

# Create Internet Gateway

resource "aws_internet_gateway" "MyLab-IntGW" {
    vpc_id = aws_vpc.MyLab-VPC.id

    tags = {
        Name = "MyLab-InternetGW"
    }
}