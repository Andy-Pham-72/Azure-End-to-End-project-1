CREATE DATABASE job_tracker;
CREATE TABLE job_tracker_table(
    job_id VARCHAR(40) NOT NULL,
    job_status VARCHAR(40),
    update_time VARCHAR(40),
PRIMARY KEY(job_id)

);

-- psql "host=open-ended-project.postgres.database.azure.com port=5432 dbname=job_tracker user=andy@open-ended-project password=quanganhtrai7291* sslmode=require"