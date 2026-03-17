# 🚀 Terraform Project 2 – EC2 with EBS Volume Attachment

## 📌 Project Overview

This project demonstrates how to provision an **AWS EC2 instance** and attach an additional **EBS (Elastic Block Store) volume** using Terraform.

The goal is to understand how external storage can be attached to compute instances and how Terraform manages dependencies between resources.

---

# 🎯 Problem Statement

In real-world cloud environments, applications often require additional storage beyond the default root volume of an EC2 instance.

Manually creating and attaching storage through the AWS console is not scalable and can lead to inconsistencies.

The objective of this project is to:

* Launch an EC2 instance
* Create an EBS volume
* Attach the EBS volume to the EC2 instance using Terraform

---

# 🧠 Terraform Concepts Used

* Provider configuration
* Resource creation
* Resource referencing
* Implicit dependency handling
* Infrastructure as Code (IaC)

---

# 🛠 Technologies Used

* Terraform
* AWS EC2
* AWS EBS

---

# 📂 Project Structure

```
project-2-ec2-ebs-volume
│
├── main.tf
└── README.md
```

---

# ⚙️ Terraform Configuration Explanation

## 1️⃣ EC2 Instance

```hcl
resource "aws_instance" "server" {
  ami           = "ami-02dfbd4ff395f2a1b"
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform_EC2"
  }
}
```

This creates an EC2 instance which acts as a compute server.

---

## 2️⃣ EBS Volume

```hcl
resource "aws_ebs_volume" "ebs_volume" {
  size              = 20
  availability_zone = aws_instance.server.availability_zone

  tags = {
    Name = "Terraform_EBS"
  }
}
```

* Creates a 20 GB EBS volume
* Ensures the volume is in the same Availability Zone as the EC2 instance

---

## 3️⃣ Volume Attachment

```hcl
resource "aws_volume_attachment" "ebs_ec2_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.server.id
}
```

This attaches the EBS volume to the EC2 instance.

---

# 🔗 How Terraform Manages Dependency

Terraform automatically ensures:

* EC2 is created first
* Then EBS volume is created
* Then volume is attached

This is achieved through **resource referencing**.

---

# ▶️ How to Run This Project

```bash
terraform init
terraform plan
terraform apply
```

---

# 📊 Expected Result

In AWS Console:

EC2 → Storage section

You will see:

* Root volume
* Additional **20 GB EBS volume attached**

---

# 🧠 Why EBS and not Instance Store?

## 🔹 EBS (Elastic Block Store)

* Persistent storage
* Data remains even after EC2 is stopped or terminated
* Can be detached and reattached to another instance
* Suitable for databases, applications, and long-term storage

## 🔹 Instance Store

* Temporary storage
* Data is lost when instance stops or terminates
* Cannot be detached
* Used for caching or temporary data

---

# ⚖️ Key Difference

| Feature       | EBS                | Instance Store    |
| ------------- | ------------------ | ----------------- |
| Persistence   | ✅ Yes              | ❌ No              |
| Detach/Attach | ✅ Yes              | ❌ No              |
| Use Case      | Databases, storage | Cache, temp files |

---

# 🎯 Learning Outcome

Through this project I learned:

* How to attach external storage to EC2
* Difference between EBS and Instance Store
* How Terraform handles dependencies
* Real-world storage concepts in AWS

---

# 👨‍💻 Author

Raj Krishna

Building hands-on DevOps and Cloud projects using Terraform.
