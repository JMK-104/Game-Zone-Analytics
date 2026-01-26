# Game-Zone-Analytics
---
## Background
GameZone is a consumer electronics retailer specializing in gaming consoles, computer hardware, and related accessories, selling its products across multiple geographic regions through a mix of marketing channels.

The objective of this analysis is to understand historical revenue performance, identify key drivers of growth and decline, and assess how products, regions, and marketing channels contributed to overall business outcomes. This goal is to provide insights that may boost and/or stabilize revenue and improve product performance.

Insights and recommendations are provided in the following key areas:

-  Time-Series & Trend Analysis

-  Product Performance & Revenue Concentration Analysis

-  Regional Performance Analysis

-  Marketing Channel Effectiveness Analysis

-  Multi-Dimensional Driver & Decline Analysis

An interactive Tableau dashboard can be downloaded [here](Tableau/dashboard/game_zone_dashboard.twbx).

The SQL queries utilized to inspect and perform quality checks can be found [here](SQL/quality_checks).

The SQL queries utilized to clean, organize, and prepare the data for the dashboard can be found [here](SQL/ddl).


---
## Data Structure Overview

GameZone sales data consists of a single Excel file (.xlsx) containing 21,865 records. The original file can be found [here](Excel/dataset/gamezone-orders-data.xlsx).

After initial data cleaning steps were implemented in Excel, SQL was used to perform final cleaning and preparation for dashboard creation. The SQL queries used to create the data structure and prepare it for the dashboard can be found [here](SQL/ddl).

Below is an Entity Relationship Diagram showing the database structure used for this analysis. The database consists of three tables: fact_orders, dim_customers, and dim_products, with a total of 19,761 records.

![GameZone Data Structure](Tableau/images/gamezone_data_structure.png)


---
## Executive Summary

### Overview of Findings


Revenue performance shows a clear structural shift beginning in January 2020, with sustained growth through December 2020 and pronounced seasonal spikes in September and December across multiple years. 

A small set of products—particularly Monitor, Switch, PS5, and IdeaPad—drive a disproportionate share of total revenue, with North America and EMEA contributing the majority of regional performance and Direct marketing dominating channel mix. While pandemic-driven demand accelerated growth across all dimensions, revenue remains highly concentrated, with individual product–region–channel combinations materially impacting overall performance. 

The post–December 2020 decline highlights both seasonal normalization and concentration risk, underscoring the importance of diversification and targeted performance monitoring.

Below is a snapshot of the Tableau dashboard highlighting these patterns, with additional examples included throughout this report. The full interactive Tableau dashboard can be downloaded [here](Tableau/dashboard/game_zone_dashboard.twbx).


![GameZone Screenshot](Tableau/images/gamezone_dashboard_screenshot.png)

### Time-Series & Trends

- Monthly revenue exhibits recurring spikes in September and December across both 2019 and 2020, reaching highs of $166K in December 2019 and $496K in December 2020. These patterns are consistent with back-to-school and holiday promotional periods.
- A sharp and sustained increase in activity begins in January 2020, continuing through a peak in December 2020, indicating a structural shift rather than normal seasonality.
- The January 2020 inflection point is observed across nearly all products and regions, suggesting a company-wide macro event as the primary driver of growth. YoY revenue grew ~160% during this period.
- Revenue volatility increases following January 2020, reflecting amplified demand fluctuations during peak promotional and holiday periods.

  *Visualization*

### Product Performance & Revenue Concentration

- Revenue is highly concentrated among four products: Monitor, Switch, PS5, and IdeaPad, which together account for ~96% of total revenue.
- The January 2020 demand surge exaggerates product-level concentration. Revenue share of the four highest-selling products rose from 96.3% of total revenue to 97.1%.
- This concentration elevates revenue dependency risk, as overall performance is heavily influenced by a limited number of products.

Below is a revenue concentration graph highlighting the impact that the four highest-selling products have on total revenue.

![Revenue Concentraion](Tableau/images/revenue_share_by_product.png)
