# Cloud-Native EKS Pipeline 🚀

A fully automated **cloud-native CI/CD pipeline** that provisions infrastructure with **Terraform**, builds and pushes container images with **Docker**, automates deployments via **GitHub Actions**, and manages Kubernetes releases with **Helm** — all running on **Amazon EKS**.

## 📌 Features
- **Infrastructure as Code (IaC)** using Terraform (VPC, EKS, IAM roles)
- **Dockerized microservice** built from a Node.js backend
- **Amazon ECR** for secure container image storage
- **Helm** for Kubernetes deployment & versioning
- **GitHub Actions** CI/CD for automated build, push, and deploy
- **Secrets management** with GitHub Secrets & AWS IAM
- **Horizontal scalability** with Kubernetes

---

## 🛠️ Tech Stack
| Tool | Purpose |
|------|---------|
| **Terraform** | Provision AWS infrastructure |
| **Docker** | Containerize application |
| **Amazon ECR** | Store Docker images |
| **Amazon EKS** | Host Kubernetes workloads |
| **Helm** | Manage K8s deployments |
| **GitHub Actions** | CI/CD automation |
| **Node.js + Express** | Backend service |

---

## 📂 Project Structure

```bash
cloud-native-eks-pipeline/
├── backend/                 # Node.js Express app
│   ├── server.js
│   ├── package.json
│   └── Dockerfile
├── charts/                  # Helm charts
│   ├── Chart.yaml
│   ├── values.yaml
│   ├── deployment.yaml
│   └── service.yaml
├── terraform/               # Terraform IaC
│   ├── main.tf
    ├── ecr.tf
    ├── eks.tf
    ├── iam.tf
    ├── vpc.tf
│   ├── variables.tf
│   └── outputs.tf
├── .github/
│   └── workflows/
│       └── deploy.yml       # GitHub Actions CI/CD pipeline
└── README.md
```

---


## 🚀 Deployment Workflow
1. **Terraform** provisions AWS VPC, EKS cluster, IAM roles.
2. **Docker** builds Node.js image locally.
3. **Amazon ECR** stores built image.
4. **GitHub Actions** triggers on `main` branch push:
   - Build Docker image
   - Push to ECR
   - Update Helm chart with new image
   - Deploy to EKS
5. **Helm** ensures Kubernetes deployment consistency.

---

## 📋 Prerequisites
- AWS CLI configured (`aws configure`)
- Terraform >= 1.3
- Docker >= 20.x
- kubectl >= 1.24
- Helm >= 3.x
- GitHub repository with Secrets:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_REGION`
  - `ECR_REGISTRY`
  - `EKS_CLUSTER_NAME`

---

## 🖥️ Local Development

## Clone repo
```bash
git clone https://github.com/Ore-stack/helm-eks-terraform-ci-cd.git
cd cloud-native-eks-pipeline/backend
```

# Install dependencies
npm install

# Run locally
npm start


⸻

## 🐳 Build & Run with Docker

```bash
docker build -t backend .
docker run -p 5000:5000 backend
```

Visit: http://localhost:5000


## ⚙️ Infrastructure Provisioning with Terraform

As part of the automated CI/CD pipeline, Terraform manages the provisioning and lifecycle of AWS infrastructure resources required by the app. The pipeline executes the following commands within the `terraform/` directory:

- 🔄 **Terraform Init**  
  Initializes the working directory and downloads required providers.
   ```bash
  terraform init
   ```

- ✅ **Terraform Validate**  
  Validates the configuration files for syntax and correctness.
   ```bash
  terraform validate
   ```

- 🔍 **Terraform Plan**  
  Generates an execution plan, previewing infrastructure changes.
  ```bash
  terraform plan
   ```

- 🚀 **Terraform Apply**  
  Applies the planned changes automatically, provisioning or updating AWS resources without manual intervention.
  ```bash
  terraform apply -auto-approve
   ```

This automated approach guarantees consistent, repeatable, and reliable infrastructure deployments synchronized with application updates.

---

*Terraform workflow ensures your infrastructure evolves safely and predictably alongside your code.*  
⸻

## ☸ Deploy to EKS with Helm

```bash
helm upgrade --install backend-release ./charts --namespace default --create-namespace
```


⸻

## 📦 CI/CD with GitHub Actions

Every push to main triggers:
	1.	Build & push Docker image to ECR
	2.	Update Helm values with latest image
	3.	Deploy to EKS

 
⸻

### 📈 Real-World Benefits

✅ Speed – Code to production in minutes  
✅ Reliability – Infrastructure & app states managed as code  
✅ Scalability – Kubernetes handles growth automatically  
✅ Security – IAM-based role & secrets management  

⸻

### 📜 License

MIT License — free to use and modify.

