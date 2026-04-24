# 🚀 Advanced DevOps Infrastructure Automation with AWS EKS, Terraform & VPC

## 📌 Project Overview

This project demonstrates a **production-grade DevOps implementation** where a Flask-based web application is fully automated from infrastructure provisioning to deployment on AWS.

Unlike basic setups, this project includes a **custom-designed VPC architecture**, making it closer to real-world cloud environments where network isolation, scalability, and control are critical.

The entire system is built using **Infrastructure as Code (Terraform)** and deployed on **AWS EKS (Kubernetes)** with a fully automated **CI/CD pipeline**.

---

## 🏗️ Architecture

```text
User → AWS LoadBalancer → Kubernetes Service → Pods (Flask App)
                         ↓
                    EKS Cluster
                         ↓
        Custom VPC (Subnets, IGW, Routing)
                         ↓
                 Terraform (IaC)
```

---

## 🌐 VPC Architecture (Core Highlight)

A **custom AWS VPC** was designed and implemented instead of using the default VPC.

### Components:

* VPC (CIDR: 10.0.0.0/16)
* Public Subnets across multiple Availability Zones
* Internet Gateway (IGW)
* Route Tables for internet access
* Subnet tagging for Kubernetes LoadBalancer integration

### Why this matters:

* Simulates **real production environments**
* Provides **network isolation and control**
* Enables proper **Kubernetes service exposure (ELB)**
* Demonstrates strong **cloud networking fundamentals**

---

## ⚙️ Tech Stack

* **Backend:** Flask (Python)
* **Containerization:** Docker
* **Orchestration:** Kubernetes (AWS EKS)
* **Infrastructure as Code:** Terraform
* **CI/CD:** GitHub Actions
* **Cloud:** AWS
* **Networking:** Custom VPC Architecture

---

## 🔥 Key Features

* Designed and provisioned **custom VPC infrastructure** using Terraform
* Deployed containerized application on **AWS EKS**
* Implemented **Kubernetes Deployment & LoadBalancer Service**
* Built a **fully automated CI/CD pipeline**
* Optimized infrastructure to run on **AWS Free Tier**
* Solved real-world Kubernetes scheduling limitations

---

## 📁 Project Structure

```text
PROJECT2/
│
├── app.py
├── requirements.txt
├── Dockerfile
├── .dockerignore
│
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
│
├── terraform/
│   ├── dev/
│   │   └── main.tf
│   └── modules/
│       ├── eks/
│       └── vpc/
│
└── .github/
    └── workflows/
        └── ci-cd.yml
```

---

## 🚀 Deployment Workflow

### 1. Infrastructure Provisioning (Terraform)

* Creates VPC, subnets, IAM roles, and EKS cluster
* Fully automated and reusable

```bash
cd terraform/dev
terraform init
terraform apply
```

---

### 2. Containerization

```bash
docker build -t arshen00r/blog-app .
docker push arshen00r/blog-app
```

---

### 3. Kubernetes Deployment

```bash
kubectl apply -f k8s/
```

---

### 4. Access Application

```bash
kubectl get svc
```

Open the **LoadBalancer EXTERNAL-IP** in browser.

---

## 🔄 CI/CD Pipeline (GitHub Actions)

The pipeline automates:

* Code checkout from repository
* Docker image build
* Push to DockerHub
* Deployment to AWS EKS
* Rolling updates of application pods

👉 Trigger: Every push to `main` branch

---

## ⚠️ Challenges & Solutions

### ❌ Pods stuck in Pending (Free Tier Limitation)

* Cause: Limited pod capacity on `t3.micro`
* Fix:

  * Reduced replicas
  * Scaled CoreDNS from 2 → 1

---

### ❌ LoadBalancer delay

* Cause: AWS provisioning time
* Fix: Waited for ELB creation (~2–5 mins)

---

## 🧠 Key Learnings

* Designed and implemented **custom AWS VPC networking**
* Hands-on experience with **Kubernetes scheduling & debugging**
* Built reusable **Terraform modules**
* Implemented **real CI/CD automation**
* Managed infrastructure under **resource constraints (Free Tier)**

---

## 📌 Future Enhancements

* Add monitoring (Prometheus + Grafana)
* Implement autoscaling (HPA)
* Use Helm for deployments
* Automate Terraform via CI/CD

---

## 👨‍💻 Author

**Arsh E Noor**
DevOps Engineer

---

## ⭐ Support

If you found this project helpful, consider giving it a ⭐ on GitHub!
