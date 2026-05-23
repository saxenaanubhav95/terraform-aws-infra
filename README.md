# terraform-aws-infra

Automated AWS infrastructure provisioning using Terraform — deploys a production-ready environment with VPC, EC2, Security Groups, IAM Role, and S3 bucket in the **ap-south-1 (Mumbai)** region.

---

## Architecture

```
Internet
   |
Internet Gateway
   |
VPC (10.0.0.0/16)
   |
Public Subnet (10.0.1.0/24)
   |
Security Group (SSH:22, HTTP:80)
   |
EC2 t2.micro (Amazon Linux 2 + Apache)
   |
IAM Role → S3 Bucket (versioned, encrypted)
```

---

## Resources Provisioned

| Resource | Details |
|---|---|
| VPC | Custom VPC with DNS support |
| Internet Gateway | For public internet access |
| Public Subnet | ap-south-1a |
| Route Table | Routes traffic to IGW |
| Security Group | SSH (port 22) + HTTP (port 80) |
| EC2 Instance | t2.micro — Amazon Linux 2 + Apache |
| IAM Role | EC2 role with S3 read access |
| S3 Bucket | Versioning enabled, AES256 encrypted, public access blocked |

---

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.3.0
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) configured
- AWS account with IAM permissions for EC2, VPC, S3, IAM

### Configure AWS CLI
```bash
aws configure
# Enter: Access Key ID, Secret Access Key, Region: ap-south-1, Output: json
```

---

## Usage

```bash
# 1. Clone the repo
git clone https://github.com/<your-username>/terraform-aws-infra.git
cd terraform-aws-infra

# 2. Initialise Terraform (downloads AWS provider)
terraform init

# 3. Preview resources to be created
terraform plan

# 4. Deploy infrastructure (~2 minutes)
terraform apply

# 5. Access your deployed app
# Open the app_url from outputs in your browser

# 6. Destroy all resources when done (avoids billing)
terraform destroy
```

---

## Outputs

After `terraform apply`, you will see:

```
vpc_id          = "vpc-xxxxxxxxxx"
ec2_instance_id = "i-xxxxxxxxxx"
ec2_public_ip   = "13.x.x.x"
ec2_public_dns  = "ec2-13-x-x-x.ap-south-1.compute.amazonaws.com"
s3_bucket_name  = "anubhav-infra-bucket-xxxxxxxx"
app_url         = "http://13.x.x.x"
```

---

## Security Notes

- Restrict `allowed_ssh_cidr` in `variables.tf` to your IP (`x.x.x.x/32`) before deploying
- S3 bucket has public access fully blocked
- S3 data encrypted at rest with AES-256
- EC2 uses IAM Role (no hardcoded credentials)

---

## Tech Stack

`Terraform` · `AWS EC2` · `VPC` · `S3` · `IAM` · `Security Groups` · `Internet Gateway` · `Apache HTTP`

---

*Maintained by Anubhav Saxena — [ePortfolio](https://olympus.mygreatlearning.com/eportfolio)*
