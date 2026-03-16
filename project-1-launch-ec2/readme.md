# 🚀 Terraform Project 1 – Launch EC2 Instance on AWS

## 📌 Project Overview

This project demonstrates how to launch an **AWS EC2 instance using Terraform**.

Terraform allows infrastructure to be defined in code and deployed automatically instead of creating resources manually from the AWS console.

In this project, an EC2 instance is created using configurable variables such as **region, AMI ID, and instance type**.

---

# 🎯 Problem Statement

Creating infrastructure manually from the AWS Management Console can be repetitive and time-consuming.

To improve automation and consistency, infrastructure should be provisioned using **Infrastructure as Code (IaC)** tools.

The objective of this project is to create an **AWS EC2 instance using Terraform configuration files** and display the **public IP address** of the created instance.

---

# 🧠 Terraform Concepts Used

This project demonstrates the following Terraform concepts:

* Provider configuration
* Variables
* Resource creation
* Terraform variable values using tfvars file
* Outputs

---

# 🛠 Technologies Used

* Terraform
* AWS EC2
* Infrastructure as Code (IaC)

---

# 📂 Project Structure

```
project-1-launch-ec2
│
├── main.tf
├── terraform.tfvars
└── README.md
```

---

# ⚙️ Terraform Configuration

## Provider Configuration

Terraform uses the AWS provider to interact with AWS services.

```
provider "aws" {
  region = var.region
}
```

---

## Variables

Variables allow the configuration to be reusable and configurable.

Variables used in this project:

* region
* ami_value
* instance_type_value

---

## Resource Creation

The following resource creates an EC2 instance.

```
resource "aws_instance" "computer" {
  ami           = var.ami_value
  instance_type = var.instance_type_value

  tags = {
    Name = "My-EC2-Instance"
  }
}
```

---

## Output

Terraform outputs the public IP address of the EC2 instance after creation.

```
output "show_instance_publicip" {
  value = aws_instance.computer.public_ip
}
```

---

# 📄 terraform.tfvars

The variable values are defined in the `terraform.tfvars` file.

```
region              = "us-east-1"
ami_value           = "ami-02dfbd4ff395f2a1b"
instance_type_value = "t3.micro"
```

This allows easy modification of configuration values without editing the Terraform code.

---

# ▶️ How to Run This Project

### Initialize Terraform

```
terraform init
```

### Review Execution Plan

```
terraform plan
```

### Apply Configuration

```
terraform apply
```

Terraform will create an EC2 instance and display the **public IP address** in the terminal.

---

# 📊 Expected Output

After applying Terraform configuration:

```
show_instance_publicip = xx.xx.xx.xx
```

This is the public IP address of the created EC2 instance.

---

# 🎯 Learning Outcome

Through this project I learned:

* How to configure the AWS provider in Terraform
* How to create AWS infrastructure using Terraform resources
* How to use variables and tfvars for configuration
* How to output infrastructure details after deployment

---

# 👨‍💻 Author

Raj Krishna
