
# MedStream Healthcare Data Lake Platform  
![Python](https://img.shields.io/badge/python-3.11-blue)  
![License](https://img.shields.io/badge/license-MIT-green)  
![CI](https://img.shields.io/github/actions/workflow/status/LokeshwarReddy-DS/medstream-healthcare-datalake/ci.yml?branch=main)  

## 🚀 Overview  
MedStream is an **enterprise-grade healthcare data lake** designed for **HIPAA-compliant data processing**. It implements the **Medallion Architecture (Bronze → Silver → Gold)** using **Apache Spark** and **Delta Lake**, ensuring scalability, data quality, and security.

### ✅ Key Features  
- **PII Detection & Masking** for compliance  
- **Delta Lake ACID Transactions** with SCD Type 2  
- **Dagster Orchestration** for workflows  
- **Data Quality Checks** using Great Expectations  
- **CI/CD Pipeline** with GitHub Actions  
- **Dockerized Infrastructure** for easy deployment  

---

## 🏗 Architecture  
![Architecture Diagram](docs/architecture.png) *(Add diagram here)*  

---

## 🔧 Tech Stack  
- **Processing**: Apache Spark, PySpark  
- **Storage**: MinIO (S3-compatible), Delta Lake  
- **Orchestration**: Dagster  
- **Databases**: PostgreSQL, MongoDB  
- **Infrastructure**: Docker, Terraform  
- **Language**: Python 3.11  

---

## ⚡ Quick Start  
```bash
# Clone repo
git clone https://github.com/LokeshwarReddy-DS/medstream-healthcare-datalake.git
cd medstream-healthcare-datalake

# Setup environment
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Start services
docker-compose up -d

# Run pipeline
