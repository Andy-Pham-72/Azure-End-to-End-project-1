# Azure end-to-end data pipeline mini project

## Equity Market Data Analysis

## Overview
Spring Capital is an investment bank who owe their success to Big Data analytics. They make critical decisions about investments based on high-frequency trading data analysis. High-frequency financial data relate to important financial market events, like the price of a stock, that are collected many times throughout each day.
Spring Capital collects data on trades and quotes from multiple exchanges every day. Their data team creates data platforms and pipelines that provide the firm with insights through merging data points and y calculating key indicators. Spring Capital’s business analysts want to better understand their raw quote data by referencing specific trade indicators which occur whenever their quote data is generated, including:
- Latest trade price
- Prior day closing price
- 30-minute moving average trade price (Average price over the past 30 minutes,
constantly updated. This is a common indicator which smooths the price trend and cuts down noise.)
As a data engineer, you are asked to build a data pipeline that produces a dataset including the above indicators for the business analysts.

## Goal:
The goal of this project is to build an end-to-end data pipeline to ingest and process daily stock market data from multiple stock exchanges. The pipeline should maintain the source data in a structured format, organized by date. It also needs to produce analytical results that support business analysis.

# Objectives:
- Create a high-level architecture and data flow before starting your development work.
- Learn to parse CSV and JSON files
- Create a Spark DataFrame with defined schema
- Persist the Spark DataFrame into file system using partitioning

# Prerequisites
- Python: basics, string manipulation, control flow, exception handling, JSON parsing
- PySpark: RDD from text file, custom DataFrames, write with partitions, Parquet
- Azure Databricks setup
- Azure Blob Storage setup

Originally I wanted to use HDInsight cluster and mount with Blob Storage from Azure and then I realized it's more efficient using Databricks cluster and mount with Blob Storage.

# Data Source
The source data used in this project is randomly generated stock exchange data.
- Trades: records that indicate transactions of stock shares between broker-dealers. See trade data below.

![Screen Shot 2022-03-10 at 10 25 03 AM](https://user-images.githubusercontent.com/70767722/157694493-524622c5-9f01-4fa1-a279-40b23bb42794.png)

- Quotes: records of updates best bid/ask price for a stock symbol on a certain exchange. See quote data below.

![Screen Shot 2022-03-10 at 10 25 16 AM](https://user-images.githubusercontent.com/70767722/157694537-4177d43e-b25e-42be-8662-c7d7aaf15be1.png)

-After the data ingestion, we will create a `Common Event` dataframe following below schema:

![Screen Shot 2022-03-10 at 10 23 27 AM](https://user-images.githubusercontent.com/70767722/157694121-91984caf-3b82-4e3e-b0d9-b9945b534620.png)

## Diagram of the data flow
![Screen Shot 2022-03-10 at 10 21 47 AM](https://user-images.githubusercontent.com/70767722/157693765-9709acf6-424f-4b2a-bef5-18b6cc4c45b9.png)

## Step 1: Data Source
- First, we upload data from folder [data](https://github.com/Andy-Pham-72/Azure-End-to-End-project-1/tree/master/data) using [AzCopy](https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10?toc=/azure/storage/blobs/toc.json) 
- Creates a container then upload the CSV and JSON files using [upload_files.sh](https://github.com/Andy-Pham-72/Azure-End-to-End-project-1/blob/master/upload_files.sh)

## Step 2: Create Azure Databricks cluster

![Screen Shot 2022-03-10 at 10 12 22 AM](https://user-images.githubusercontent.com/70767722/157693600-46bbe945-7560-4b20-af8f-e964dd1512df.png)

## Step 3: Run the [Jupyter notebook](https://github.com/Andy-Pham-72/Azure-End-to-End-project-1/blob/master/notebook/data_ingestion.ipynb)
- Please note to input your own config into the variables into the notebook.

## Step 4: Check the output dataframe

![Screen Shot 2022-03-10 at 6 27 38 PM](https://user-images.githubusercontent.com/70767722/157772480-be572e42-63be-4db3-a8f2-601409154fba.png)


## Step 5: Check the output directory
- Since we use the code `data.write.partitionBy("partition").mode("overwrite").parquet("output_dir")` , we should expect the processed data stored in this data structure:
```
output_dir/partition=T/ 
output_dir/partition=Q/ 
output_dir/partition=B/
```

From the Databricks File System (`DBFS`), we should see this:

![Screen Shot 2022-03-10 at 10 21 28 AM](https://user-images.githubusercontent.com/70767722/157693694-c96a6ae5-6dfc-45ee-97f4-17e049126b74.png)

