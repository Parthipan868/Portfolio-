# 🚀 Multi-Cloud Deployment Guide

This portfolio application is deployed across multiple platforms for high availability and redundancy.

## Deployment Architecture

```
GitHub Repository
       │
       ├─→ Jenkins (CI/CD) → Docker → localhost:5000
       │
       ├─→ GitHub Actions → GitHub Pages
       │
       └─→ GitHub Actions → Terraform → AWS S3
```

## 📋 Prerequisites

### For AWS S3 Deployment:
1. **AWS Account** with appropriate permissions
2. **AWS CLI** installed and configured
3. **Terraform** installed (v1.0+)
4. **AWS Credentials** (Access Key ID and Secret Access Key)

### For GitHub Pages:
1. GitHub repository with **Pages enabled**
2. Repository permissions configured

---

## 🔧 Setup Instructions

### 1. AWS S3 Deployment with Terraform

#### Step 1: Configure AWS Credentials

**Option A: Using AWS CLI**
```bash
aws configure
# Enter your AWS Access Key ID
# Enter your AWS Secret Access Key
# Default region: us-east-1
# Default output format: json
```

**Option B: Using Environment Variables**
```bash
export AWS_ACCESS_KEY_ID="your-access-key-id"
export AWS_SECRET_ACCESS_KEY="your-secret-access-key"
export AWS_DEFAULT_REGION="us-east-1"
```

#### Step 2: Configure Terraform Variables

1. Navigate to the `terraform` directory:
   ```bash
   cd terraform
   ```

2. Create `terraform.tfvars` from the example:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

3. Edit `terraform.tfvars` with your unique bucket name:
   ```hcl
   bucket_name = "your-unique-portfolio-name-123"  # Must be globally unique
   aws_region  = "us-east-1"
   environment = "production"
   ```

#### Step 3: Deploy with Terraform

```bash
# Initialize Terraform
terraform init

# Preview the deployment plan
terraform plan

# Deploy to AWS S3
terraform apply

# After review, type 'yes' to confirm
```

#### Step 4: Access Your S3 Website

After successful deployment, Terraform will output:
```
website_url = "http://your-bucket-name.s3-website-us-east-1.amazonaws.com"
```

Visit this URL to see your portfolio live on AWS S3!

#### Updating the Website

After making changes to `index.html`:
```bash
cd terraform
terraform apply  # This will detect and upload changes
```

---

### 2. GitHub Pages Deployment

#### Step 1: Enable GitHub Pages

1. Go to your GitHub repository
2. Navigate to **Settings** → **Pages**
3. Under **Source**, select **GitHub Actions**

#### Step 2: Configure GitHub Secrets (for AWS deployment)

1. Go to **Settings** → **Secrets and variables** → **Actions**
2. Add the following secrets:
   - `AWS_ACCESS_KEY_ID`: Your AWS Access Key ID
   - `AWS_SECRET_ACCESS_KEY`: Your AWS Secret Access Key
   - `S3_BUCKET_NAME`: Your unique S3 bucket name

#### Step 3: Trigger Deployment

The GitHub Actions workflow (`.github/workflows/deploy.yml`) automatically runs when you push to the `main` branch:

```bash
git add .
git commit -m "Deploy to multi-cloud"
git push origin main
```

#### Step 4: Monitor Deployment

1. Go to **Actions** tab in your GitHub repository
2. Watch the deployment progress
3. Once complete, your site will be live at:
   - **GitHub Pages**: `https://your-username.github.io/your-repo-name/`
   - **AWS S3**: Output from Terraform

---

### 3. Jenkins Pipeline (Existing)

Your current Jenkins pipeline continues to work:
- Monitors GitHub for changes every minute
- Builds Docker image
- Deploys to `localhost:5000`

---

## 🌐 Deployment Endpoints

After setup, your portfolio will be available at:

1. **Local Development**: http://localhost:5000
2. **GitHub Pages**: https://your-username.github.io/Portfolio
3. **AWS S3**: http://your-bucket.s3-website-us-east-1.amazonaws.com

---

## 🔄 Workflow

### Making Updates

1. **Edit your code** (e.g., `index.html`)
2. **Commit and push** to GitHub:
   ```bash
   git add .
   git commit -m "Updated portfolio"
   git push origin main
   ```
3. **Automatic deployments** will trigger:
   - Jenkins builds and deploys to Docker (localhost:5000)
   - GitHub Actions deploys to GitHub Pages
   - GitHub Actions deploys to AWS S3 via Terraform

---

## 🧹 Cleanup

### Destroy AWS Resources

To remove AWS resources and avoid charges:
```bash
cd terraform
terraform destroy
```

---

## 🛠️ Troubleshooting

### Issue: S3 Bucket Name Already Exists
**Solution**: Choose a different, globally unique bucket name in `terraform.tfvars`

### Issue: GitHub Pages Not Deploying
**Solution**: 
1. Check **Settings** → **Pages** → Source is set to "GitHub Actions"
2. Ensure repository is **public** or you have GitHub Pro

### Issue: AWS Credentials Not Working
**Solution**: 
1. Verify credentials with: `aws sts get-caller-identity`
2. Ensure IAM user has S3 permissions

### Issue: Terraform State Lock
**Solution**: 
```bash
# Remove lock file and reinitialize
rm -rf .terraform .terraform.lock.hcl
terraform init
```

---

## 📊 Cost Estimation

- **GitHub Pages**: Free for public repositories
- **AWS S3**: 
  - Storage: ~$0.023/GB/month
  - Requests: ~$0.0004 per 1,000 GET requests
  - Estimated monthly cost for small portfolio: **< $1/month**

---

## 🔐 Security Best Practices

1. **Never commit** AWS credentials to Git
2. **Use IAM roles** with minimum required permissions
3. **Enable S3 versioning** for rollback capability
4. **Consider CloudFront** for HTTPS and better performance
5. **Use GitHub Secrets** for sensitive data

---

## 📚 Additional Resources

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [AWS S3 Static Website Hosting](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html)

---

## 🎉 Success Checklist

- [ ] Terraform files created
- [ ] AWS credentials configured
- [ ] S3 bucket deployed via Terraform
- [ ] GitHub Pages enabled
- [ ] GitHub Secrets configured
- [ ] GitHub Actions workflow running
- [ ] All three deployment URLs accessible
- [ ] DNS updated (optional)

---

**Congratulations on your Multi-Cloud Deployment! 🚀**
