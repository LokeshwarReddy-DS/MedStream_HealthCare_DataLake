DAGSTER_POSTGRES_PASSWORD: dev_password_change_in_prod
    ports:
      - "3000:3000"
    depends_on:
      - postgres
      - minio
    volumes:
      - ./dagster_orchestration:/opt/dagster/dagster_orchestration
      - ./spark_jobs:/opt/dagster/spark_jobs
    command: dagster dev -h 0.0.0.0 -p 3000
volumes:
  postgres_data:
  mongo_data:
  minio_data:
dockerfile