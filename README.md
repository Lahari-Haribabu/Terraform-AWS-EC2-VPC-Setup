
# 🚀 Terraform AWS EC2 & VPC Setup  

This repository contains Terraform code to provision infrastructure on **AWS** with:  
- Remote state management using **S3** and **DynamoDB**  
- A **VPC** with public & private subnets  
- **Security Groups** with inbound & outbound rules  
- **EC2 Instance** with NGINX installation via `user_data`  
- **Key Pair** creation for SSH access  
- Outputs for **EC2 IPs and DNS**  

---

## 📂 Project Structure  

```

terraform-ec2/
│── main.tf              # Main Terraform configuration
│── variables.tf         # Variable definitions
│── outputs.tf           # Outputs
│── install\_nginx.sh     # User data script for EC2
│── terraform.tfvars     # Custom values (ignored in .gitignore)
│── README.md            # Documentation

````

---

## ⚙️ Features  

- ✅ **Remote Backend** with S3 bucket + DynamoDB state locking  
- ✅ **VPC module** with private & public subnets  
- ✅ **Security Groups** allowing SSH (22), HTTP (80), and App Port (8000)  
- ✅ **EC2 Instance** provisioned with NGINX installed automatically  
- ✅ **Dynamic Variables** for instance type, AMI, and environment (dev/staging/prod)  
- ✅ **Outputs** showing Public IP, Public DNS, and Private IP  

---

## 🚀 Usage  

### 1️⃣ Initialize Terraform  
```bash
terraform init
````

### 2️⃣ Select Workspace (for environments)

```bash
terraform workspace new dev
terraform workspace new staging
terraform workspace select dev
```

### 3️⃣ Validate & Plan

```bash
terraform validate
terraform plan
```

### 4️⃣ Apply Changes

```bash
terraform apply -auto-approve
```

### 5️⃣ Destroy Resources

```bash
terraform destroy -auto-approve
```

---

## 🌍 Outputs

After apply, you’ll get values like:

```bash
Outputs:

ec2_public_ip   = ["3.142.125.xxx"]
ec2_public_dns  = ["ec2-3-142-125-xxx.us-east-2.compute.amazonaws.com"]
ec2_private_ip  = ["10.0.1.15"]
```

---

## 📌 Requirements

* Terraform >= 1.5
* AWS CLI configured (`aws configure`)
* Valid IAM permissions for **EC2, VPC, S3, DynamoDB**

---

## 👩‍💻 Author

**Lahari Haribabu**
🔗 [GitHub](https://github.com/Lahari-Haribabu)

---

```
