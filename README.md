medstream-healthcare-datalake/
├── .github/workflows/
├── docs/
├── spark_jobs/
│   ├── bronze_to_silver/
│   ├── silver_to_gold/
│   └── utils/
├── dagster_orchestration/
│   ├── assets/
│   ├── resources/
│   └── sensors/
├── api/
│   └── routes/
├── terraform/
├── tests/
│   ├── unit/
│   └── integration/
├── config/
└── scripts/
markdown
Data Sources → Bronze Layer (Raw) → Silver Layer (Cleaned) → Gold Layer (Analytics)
↓                      ↓                          ↓
Raw S3 Bucket        Delta Tables (SCD2)        Aggregated Metrics


# MedStream Healthcare Data Lake Platform
![Python Version](https://img.shields.io/badge/python-3.11-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Tests](https://img.shields.io/badge/tests-passing-brightgreen)
A HIPAA-compliant healthcare data aggregation system that processes patient monitoring data, lab results, and appointment r
## 🎯 Project Overview
MedStream demonstrates enterprise-grade data engineering practices for healthcare data processing with:
- **PII Detection & Masking**: Automated detection and deterministic hashing of sensitive information
- **Delta Lake Architecture**: Bronze/Silver/Gold medallion architecture with SCD Type 2
- **Data Quality**: Comprehensive validation and anomaly detection
- **Orchestration**: Dagster-based workflow management
- **Scalability**: Spark-based distributed processing
## 🏗️ Architecture
### Tech Stack
- **Storage**: MinIO (S3-compatible), Delta Lake
- **Processing**: Apache Spark 3.5, PySpark
- **Orchestration**: Dagster 1.5
- **Databases**: PostgreSQL 15, MongoDB
- **Language**: Python 3.11
- **Infrastructure**: Terraform, Docker
## 🚀 Quick Start
### Prerequisites
- Docker & Docker Compose
- Python 3.11+
- 8GB RAM minimum
- Terraform (for cloud deployment)
### Local Setup
1. **Clone the repository**
```bash
git clone https://github.com/LokeshwarReddy-DS/medstream-healthcare-datalake.git
cd medstream-healthcare-datalake
```
2. **Set up environment**
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
pip install -r requirements-dev.txt
```
3. **Start infrastructure**
```bash
docker-compose up -d
```
4. **Generate sample data**
```bash
python scripts/generate_sample_data.py --records 10000
```
5. **Run the pipeline**
```bash
dagster dev -f dagster_orchestration/definitions.py
```
6. **Access services**
- Dagster UI: http://localhost:3000
- MinIO Console: http://localhost:9001
- API Documentation: http://localhost:8000/docs
## 📊 Data Flow
### Bronze Layer (Raw Ingestion)
- Ingests raw JSON/CSV files from multiple sources
- Preserves original data structure
- Adds metadata (ingestion timestamp, source system)
- Stored in MinIO with partitioning by date
### Silver Layer (Cleaned & Validated)
- PII detection and masking
- Data normalization and standardization
- Schema validation and quality checks
- SCD Type 2 for historical tracking
- Delta Lake format for ACID transactions
### Gold Layer (Analytics Ready)
- Aggregated metrics and KPIs
- Patient timelines and clinical histories
- Pre-computed analytics tables
- Optimized for query performance
## 🔒 Security Features
- **PII Masking**: Deterministic hashing for consistent references
- **Access Control**: Role-based access with audit logging
- **Encryption**: At-rest and in-transit encryption
- **Compliance**: HIPAA-compliant data handling patterns
## 🧪 Testing
```bash
# Run all tests
pytest
# Run with coverage
pytest --cov=spark_jobs --cov=dagster_orchestration --cov-report=html
# Run specific test suite
pytest tests/unit/test_pii_masker.py -v
```
## 📈 Performance
- **Throughput**: ~500K records/minute on 4-core setup
- **Latency**: <2 second end-to-end for bronze to silver
- **Storage**: ~40% compression with Delta Lake
- **Scalability**: Tested up to 100M records
## 🛠️ Development
### Code Style
```bash
# Format code
black spark_jobs/ dagster_orchestration/ api/
# Lint
flake8 spark_jobs/ dagster_orchestration/ api/
# Type check
mypy spark_jobs/ dagster_orchestration/ api/
```
### Pre-commit Hooks
```bash
pre-commit install
pre-commit run --all-files
```
## 📚 Documentation
- [Architecture Details](docs/ARCHITECTURE.md)
- [Setup Guide](docs/SETUP.md)
- [Data Dictionary](docs/DATA_DICTIONARY.md)
## 🤝 Contributing
Contributions welcome! Please read CONTRIBUTING.md first.