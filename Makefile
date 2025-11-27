FROM python:3.11-slim
WORKDIR /opt/dagster
# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    curl \
    && rm -rf /var/lib/apt/lists/*
# Copy requirements
COPY requirements.txt requirements-dev.txt ./
# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
# Copy application code
COPY . .
# Install the package
RUN pip install -e .
# Expose Dagster port
EXPOSE 3000
# Default command
CMD ["dagster", "dev", "-h", "0.0.0.0", "-p", "3000"]
makefile
.PHONY: help install test lint format clean docker-up docker-down
help:
@echo "Available commands:"
@echo "  make install       - Install dependencies"
@echo "  make test          - Run tests"
@echo "  make lint          - Run linters"
@echo "  make format        - Format code"
@echo "  make clean         - Clean up generated files"
@echo "  make docker-up     - Start Docker services"
@echo "  make docker-down   - Stop Docker services"
install:
pip install -r requirements.txt
pip install -r requirements-dev.txt
pre-commit install
test:
pytest tests/ -v --cov=spark_jobs --cov=dagster_orchestration --cov-report=html
lint:
flake8 spark_jobs/ dagster_orchestration/ api/
mypy spark_jobs/ dagster_orchestration/ api/
pylint spark_jobs/ dagster_orchestration/ api/
format:
black spark_jobs/ dagster_orchestration/ api/ tests/
isort spark_jobs/ dagster_orchestration/ api/ tests/
clean:
find . -type d -name "__pycache__" -exec rm -rf {} +
find . -type f -name "*.pyc" -delete
find . -type f -name "*.pyo" -delete
find . -type d -name "*.egg-info" -exec rm -rf {} +
rm -rf build/ dist/ .pytest_cache/ .coverage htmlcov/
docker-up:
docker-compose up -d
docker-down:
docker-compose down -v