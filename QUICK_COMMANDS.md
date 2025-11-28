# 🚀 Quick Deployment Commands

## AWS S3 Deployment (Terraform)

### First Time Setup
```bash
# Navigate to terraform directory
cd terraform

# Copy example variables file
cp terraform.tfvars.example terraform.tfvars

# Edit terraform.tfvars and set your unique bucket name
# bucket_name = "portfolio-yourname-unique-123"

# Initialize Terraform
terraform init

# Preview deployment
terraform plan

# Deploy to AWS S3
terraform apply
```

### Update Website After Changes
```bash
cd terraform
terraform apply
```

### Destroy AWS Resources
```bash
cd terraform
terraform destroy
```

---

## GitHub Pages Deployment

### Enable GitHub Pages
1. Go to repository **Settings** → **Pages**
2. Under **Source**, select **GitHub Actions**

### Configure Secrets (for AWS deployment via GitHub Actions)
1. Go to **Settings** → **Secrets and variables** → **Actions**
2. Add secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `S3_BUCKET_NAME`

### Deploy
```bash
git add .
git commit -m "Deploy to multi-cloud"
git push origin main
```

---

## Docker (Local Development)

### Build and Run
```bash
# Build image
docker build -t portfolio:latest .

# Run container
docker run -d -p 5000:80 --name portfolio portfolio:latest

# View logs
docker logs portfolio

# Stop container
docker stop portfolio

# Remove container
docker rm portfolio
```

---

## AWS CLI Setup

### Install AWS CLI
**Windows (PowerShell):**
```powershell
# Download and install from: https://aws.amazon.com/cli/
```

### Configure AWS Credentials
```bash
aws configure
# AWS Access Key ID: your-key-id
# AWS Secret Access Key: your-secret-key
# Default region: us-east-1
# Default output format: json
```

### Verify Configuration
```bash
aws sts get-caller-identity
```

---

## Git Commands

### Initial Push
```bash
git add .
git commit -m "Added multi-cloud deployment"
git push origin main
```

### Check Status
```bash
git status
git log --oneline -5
```

---

## Terraform Commands Reference

| Command | Description |
|---------|-------------|
| `terraform init` | Initialize working directory |
| `terraform plan` | Preview changes |
| `terraform apply` | Apply changes |
| `terraform destroy` | Destroy resources |
| `terraform output` | Show outputs |
| `terraform state list` | List resources in state |
| `terraform validate` | Validate configuration |

---

## Troubleshooting

### Check if Terraform is installed
```bash
terraform version
```

### Check if AWS CLI is configured
```bash
aws sts get-caller-identity
```

### View Terraform state
```bash
cd terraform
terraform show
```

### Force unlock Terraform state
```bash
terraform force-unlock <LOCK_ID>
```

---

## Deployment URLs

After deployment, access your portfolio at:

1. **Local**: http://localhost:5000
2. **GitHub Pages**: https://parthipan868.github.io/Portfolio
3. **AWS S3**: Check Terraform output with `terraform output website_url`
