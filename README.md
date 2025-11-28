# 🌟 Portfolio Website

A modern, responsive portfolio website deployed across multiple cloud platforms.

## 🚀 Live Deployments

- **Local (Docker)**: http://localhost:5000
- **GitHub Pages**: https://parthipan868.github.io/Portfolio-/
- **AWS S3**: http://portfolio-arunp-parthipan-2025.s3-website-us-east-1.amazonaws.com

## 🛠️ Tech Stack

- **Frontend**: HTML5, CSS3, JavaScript
- **Containerization**: Docker
- **CI/CD**: Jenkins, GitHub Actions
- **Infrastructure as Code**: Terraform
- **Cloud Platforms**: AWS S3, GitHub Pages

## 📦 Deployment Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    GitHub Repository                     │
└─────────────────────────────────────────────────────────┘
                           │
                ┌──────────┼──────────┐
                │          │          │
                ▼          ▼          ▼
          ┌─────────┐ ┌─────────┐ ┌─────────┐
          │ Jenkins │ │ GitHub  │ │ GitHub  │
          │         │ │ Actions │ │ Actions │
          └─────────┘ └─────────┘ └─────────┘
                │          │          │
                ▼          ▼          ▼
          ┌─────────┐ ┌─────────┐ ┌─────────┐
          │ Docker  │ │ GitHub  │ │Terraform│
          │         │ │  Pages  │ │         │
          └─────────┘ └─────────┘ └─────────┘
                │                      │
                ▼                      ▼
         localhost:5000            AWS S3
```

## 🔧 Quick Start

### Local Development with Docker

```bash
# Build the Docker image
docker build -t portfolio:latest .

# Run the container
docker run -d -p 5000:80 --name portfolio portfolio:latest

# Access at http://localhost:5000
```

### Deploy to AWS S3 with Terraform

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed instructions.

## 📋 Prerequisites

- **Docker** (for local deployment)
- **Jenkins** (for CI/CD)
- **Terraform** (for AWS deployment)
- **AWS Account** (for S3 deployment)
- **GitHub Account** (for Pages deployment)

## 🔄 CI/CD Pipeline

### Jenkins Pipeline
- Monitors GitHub repository every minute
- Builds Docker image on code changes
- Deploys to local Docker container

### GitHub Actions
- Deploys to GitHub Pages on push to `main`
- Deploys to AWS S3 using Terraform

## 📁 Project Structure

```
Portfolio/
│
├── .github/
│   └── workflows/
│       └── deploy.yml          # GitHub Actions workflow
│
├── terraform/
│   ├── main.tf                 # Terraform main configuration
│   ├── variables.tf            # Terraform variables
│   ├── outputs.tf              # Terraform outputs
│   └── .gitignore              # Terraform gitignore
│
├── index.html                  # Main portfolio page
├── Dockerfile                  # Docker configuration
├── Jenkinsfile                 # Jenkins pipeline
├── DEPLOYMENT.md               # Deployment guide
└── README.md                   # This file
```

## 🌐 Features

- ✅ Responsive design
- ✅ Multi-cloud deployment
- ✅ Automated CI/CD
- ✅ Infrastructure as Code
- ✅ Containerized application
- ✅ High availability

## 📚 Documentation

- [Deployment Guide](DEPLOYMENT.md) - Complete setup and deployment instructions
- [Terraform Configuration](terraform/) - Infrastructure as Code files

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 👤 Author

**Parthipan**

- GitHub: [@Parthipan868](https://github.com/Parthipan868)

## 🙏 Acknowledgments

- Built with modern DevOps best practices
- Deployed across multiple cloud platforms for reliability
- Automated with Jenkins and GitHub Actions

---

**⭐ Star this repository if you find it helpful!**
