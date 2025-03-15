# E-Commerce Data Warehouse & Analytics Project


Overview
This project takes raw e-commerce data, cleans it, organizes it into a normalized database, and then transforms it into a dimensional model for analytics. We use SQL for data processing and Python (Pandas, Matplotlib, Seaborn) for visualization. The goal is to extract meaningful insights to help a business make better decisions.


📁 e-commerce-data-warehouse
│-- 📂 data          # Raw dataset files
│-- 📂 scripts       # SQL scripts for schema, ETL, and queries
│-- 📂 notebook      # Charts and graphs from analysis
│-- README.md         # Project documentation (this file)


Dataset
The project uses the Olist E-Commerce Dataset from Kaggle. It includes:
Customers (olist_customers_dataset.csv)
Orders (olist_orders_dataset.csv)
Order Items (olist_order_items_dataset.csv)
Products (olist_products_dataset.csv)
Sellers (olist_sellers_dataset.csv)
Payments (olist_order_payments_dataset.csv)
Reviews (olist_order_reviews_dataset.csv)

Steps & Implementation
1. Data Sourcing & Understanding
  Loaded raw e-commerce data from CSV files.
  Created a data dictionary explaining field meanings and relationships.
2. Normalized Database (3NF)
  Designed a normalized schema to remove redundancy.
  Created DDL scripts for table creation with primary & foreign key constraints.
Generated an ER Diagram to visualize relationships.
3. ETL Process
  Extracted raw data from CSV files.
  Transformed data (cleaning, handling missing values, standardizing formats).
Loaded data into the normalized database.
4. Dimensional Modeling (Star Schema)
  Created a fact table for orders and multiple dimension tables (customers, products, payments, etc.).
  Optimized for fast analytical queries.
5. Analytical Queries & Insights

Technologies Used
SQL (BigQuery)
Python (Pandas, Matplotlib, Seaborn)
Jupyter Notebook
Git & GitHub
