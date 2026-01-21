# 🦠 COVID-19 Data Exploration (SQL)

## 📌 Project Overview
This project is part of a data analyst portfolio series focused on **SQL-based data exploration**. The objective is to analyze a global COVID-19 dataset (early 2020 to mid-2021) to extract meaningful insights related to infection rates, death percentages, and vaccination progress across countries and continents.

The project emphasizes **exploratory analysis, query logic, and SQL best practices**, serving as a foundation for future visualization work.

---

## 🗂️ Data Sources
The analysis uses two primary tables:

### 1️⃣ [CovidDeaths](https://github.com/anand-analytics/Covid-19-Data-Exploration-SQL-/blob/main/Data/CovidDeaths.xlsx)
Contains:
- Location
- Date
- Population
- Total cases
- New cases
- Total deaths

### 2️⃣ CovidVaccinations
Contains:
- Location
- Date
- New vaccinations
- Rolling count of people vaccinated

---

## 🛠️ Skills & Tools Used
- **SQL Server** – Primary tool for querying and analysis  
- **Excel** – Initial data formatting and cleaning  
- **SQL Techniques Applied**
  - Joins
  - Common Table Expressions (CTEs)
  - Temporary Tables
  - Window Functions (`PARTITION BY`)
  - Aggregate Functions (`SUM`, `MAX`)
  - Data Type Conversions (`CAST`, `CONVERT`)
  - Views for downstream visualization

---

## 📊 Key Analysis & Insights
The project explores several critical COVID-19 metrics:

- **Likelihood of Dying**
  - Calculated death percentage by comparing total deaths to total cases for specific countries (e.g., United States)

- **Infection Rate vs Population**
  - Measured what percentage of a country’s population was infected

- **Global Impact**
  - Aggregated daily new cases and deaths to understand global trends

- **Rolling Vaccination Count**
  - Used window functions to calculate cumulative vaccinations by location over time

- **Highest Impact Regions**
  - Identified countries and continents with the highest death counts relative to population

---

## 🔧 Project Workflow

### 1️⃣ Data Preparation
- Downloaded the dataset
- Split into two Excel files: `CovidDeaths` and `CovidVaccinations`
- Performed basic formatting and validation

### 2️⃣ Environment Setup
- Created a `PortfolioProject` database in SQL Server
- Imported data using the **SQL Server Import and Export Wizard (64-bit)** to prevent data type issues

### 3️⃣ Exploratory Data Analysis
- Wrote 15–20 SQL queries covering country-level and global metrics
- Focused on accuracy, readability, and logical query structure

### 4️⃣ Visualization Preparation
- Created permanent **SQL Views**
- Designed queries to be reused for future visualization tools such as Tableau or Power BI




