# Healthtail-BI-Project

## Table of Contents
- [Project Overview](#project_overview)
- [Objectives](#objectives)
- [Tools & Technologies](#tools-and-technologies)
- [Poject Requirements](#requirements)
- [ETL Plan](#etl-plan)
- [Dashboard](#dashboard)
- [Insights](#insights)
- [Recommendations](#recommendations)


  ## **Project Overview:**

  This project was conducted as part of a Business Intelligence Analyst role at Clinipet, focusing on data from HealthTail, a large veterinary hospital. The objective was to derive 
  actionable insights into pet diagnoses, medication spending, and disease trends to inform operational and strategic decisions.

  ## **Objectives:**

  * Understand diagnosis and medication spending patterns.
  * Analyze disease trends by breed and pet type.
  * Provide management with a real-time dashboard to track key metrics.
 
  ## **Tools & Technologies:**

  Google BigQuery – Data storage and SQL querying,
  SQL – Data cleaning and analysis,
  Looker Studio – Dashboard creation and data visualization.

  ## **Project Requirements:**

 * Cleaning the data & creating aggregated tables using SQL.
 * Answering research questions using SQL.
 * Creating interactive report in Looker Studio.

  ## **ETL Plan:**

  * Extracted raw CSV files from HealthTail’s system and imported into BigQuery.

  * Transformed data using SQL:

      * Cleaned missing values and standardized formats (e.g., pet types, dates).

      * Created derived fields (e.g., diagnosis category, monthly trends).

      * Joined datasets (e.g., visits, medications, pets).

  * Loaded cleaned tables into BigQuery for analysis and Looker Studio reporting.

  * Validated data integrity through record counts, date range checks, and sample spot-checks.

  ## **Dashboard:**
  
   [Looker Studio Link](https://lookerstudio.google.com/reporting/4c6c0aa6-9a1c-4dfd-935f-617b6e84a238)


  ## **Insights:**

 1.Top Diagnoses by Record Count (Bar Chart)**
  
  * Highlights the most common medical conditions treated.
  * Identifies high-demand services driving clinic workload.
  * Useful for staffing, treatment planning, and inventory management.

 2. Diagnoses by Pet Type (Stacked Bar Chart):**
  
 * Shows diagnosis distribution across dog, cat, hamster, and unknown pet types.
 * Reveals species-specific health trends and condition prevalence.
 * Informs species-targeted care and medication stocking.

  3. Medication Spending by Pet Type (Pie Chart):**
  
 * Breaks down total spending across different pet types.
 * Dogs account for the highest medication costs (41.5%).
 * Helps prioritize budgeting and supplier negotiation by species demand.

 4. Medication Cost Over Time by Pet Type (Line Chart):**
 
 * Tracks medication expenditure trends over time for each pet type.
 * Detects seasonal or cyclical patterns in veterinary care.
 * Supports forecasting and resource allocation.

 5. Medication Cost vs Record Count by Diagnosis (Combo Chart)**
 
 * Compares volume of cases (bars) to total cost impact (line) per diagnosis.
 * Identifies high-cost, high-frequency conditions like Cancer and Fleas.
 * Aids in strategic decisions on pricing, prevention, and procurement.

  ## **Recommendations:**

 * Prioritize inventory and procurement for high-frequency diagnoses like Hypothyroidism and Arthritis.
 * Implement cost-control strategies for high-expense conditions such as Cancer and Fleas.
 * Tailor services and wellness plans for dogs, which account for the highest medication spending.
 * Leverage seasonal trends in medication usage to improve forecasting and operational planning.

