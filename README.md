# E-Commerce Data Platform — Databricks DevOps

A production-style **Databricks data engineering and DevOps project** demonstrating how to build, provision, secure, deploy, and automate an analytics platform using **Databricks, Terraform, Databricks Asset Bundles (DAB), GitHub Actions, and Workload Identity Federation**.

The project uses an e-commerce dataset containing customers, orders, products, events, reviews, and order items. The data is processed through a **Bronze → Silver → Gold** architecture in Unity Catalog.

---

## Project Overview

The goal of this project is to demonstrate the responsibilities of a **Databricks DevOps / Data Platform Engineer**.

The platform separates:

- **Infrastructure as Code** → Terraform
- **Data workloads and jobs** → Databricks Asset Bundles
- **CI/CD automation** → GitHub Actions
- **Authentication** → GitHub OIDC + Databricks Workload Identity Federation
- **Data processing** → Databricks notebooks
- **Data governance** → Unity Catalog
- **Storage** → Unity Catalog managed volume

### High-Level Architecture

```text
                         GitHub Repository
                                |
                                |
                         GitHub Actions
                                |
                +---------------+---------------+
                |                               |
                v                               v
          Terraform                         DAB
                |                               |
                |                               |
                v                               v
       Databricks Infrastructure        Databricks Workloads
                |                               |
                |                               |
                +---------------+---------------+
                                |
                                v
                       Databricks Workspace
                                |
                         Unity Catalog
                                |
                    +-----------+-----------+
                    |           |           |
                  Bronze      Silver       Gold
                    |
               Managed Volume
                    |
                Raw CSV Data