# SQL Data Warehouse Project
This repository show case work on SQL Server to build modern Data Warehouse, ETL processes, data modelling and reporting analytics

## 📌 Project Overview

This repository showcases work using **SQL Server** to build a modern **Data Warehouse**, including ETL processes, data modeling, and analytical reporting.

## 🔍 Project Scope

This project covers:

- **Data Architecture:** Designing a modern data warehouse using the **Medallion Architecture** (Bronze, Silver, and Gold layers).
- **ETL Pipelines:** Extracting, transforming, and loading data from source systems into the data warehouse.
- **Data Modeling:** Developing fact and dimension tables optimized for analytical and reporting workloads.
- **Analytics & Reporting:** Creating SQL-based reports and dashboards to generate actionable business insights.


![Uploading High Level Architecture.drawio.png…]()

## 📁 Project Structure
```text
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # ETL techniques and methods
│   ├── data_architecture.drawio        # Overall data architecture
│   ├── data_catalog.md                 # Dataset catalog and metadata
│   ├── data_flow.drawio                # Data flow diagram
│   ├── data_models.drawio              # Star schema & data models
│   ├── naming-conventions.md           # Naming standards
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Raw ingestion layer
│   ├── silver/                         # Cleansed & transformed layer
│   ├── gold/                           # Analytics & reporting layer
│
├── tests/                              # Data quality & validation tests
│
├── README.md                           # Project overview
├── LICENSE                             # License information
├── .gitignore                          # Git ignored files
└── requirements.txt                    # Project dependencies
