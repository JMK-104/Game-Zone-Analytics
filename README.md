# Game-Zone-Analytics
---
## Background
GameZone is a consumer electronics retailer specializing in gaming consoles, computer hardware, and related accessories, selling its products across multiple geographic regions through a mix of marketing channels.

The objective of this analysis is to understand historical revenue performance, identify key drivers of growth and decline, and assess how products, regions, and marketing channels contributed to overall business outcomes. This goal is to provide insights that may boost and/or stabilize revenue and improve product performance.

Insights and recommendations are provided in the following key areas:

-  Sales & Trends Overview

-  Product Performance & Revenue Concentration Analysis

-  Regional Performance Analysis

-  Marketing Channel Effectiveness Analysis

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

### Sales & Trends Overview

- Monthly revenue exhibits recurring spikes in September and December across both 2019 and 2020, with a pre-pandemic high reaching $166K in December 2019, and a mid-pandemic high of $496K in December 2020. These patterns are consistent with back-to-school and holiday promotional periods.
- Following a December 2019 dip in sales, likely a sign of a post-holiday reset, a sharp and sustained increase in activity begins in January 2020, continuing through a peak in December 2020, indicating a structural shift rather than normal seasonality.
- The January 2020 inflection point is observed across nearly all products and regions, suggesting a company-wide macro event as the primary driver of growth. YoY revenue grew ~160% during this period, rising from $1.40M in 2019 to $3.63M in 2020.

The chart below shows monthly revenue throughout the dataset, highlighting the outsized effect of the January 2020  macro event.
![Monthly Revenue](Tableau/images/monthly_revenue.png)

### Product Performance & Revenue Concentration

- Prior to the January 2020 event, Average Order Value (AOV) remained relatively steady with a low in January 2019 of $215.11, and a high in February 2019 of $251.67. Going into 2020, however, AOV increased sharply starting in December 2019, and increased steadily afterwards with a 2020 low of $280.76 and a high of $333.16
- Revenue is highly concentrated among four products: Monitor, Switch, PS5, and IdeaPad, which together account for ~96% of total revenue.
- The 2020 Macro Event saw the PlayStation's contribution to total revenue increase from 16.16% in 2019 to 29.87% in 2020, bringing in $225.8K in 2019 and $1.09M in 2020. Because more people were staying home due to pandemic guidelines, they likely had more time and desire to purchase more PlayStations.
- Conversely, the Nintendo Switch saw its revenue contribution decrease from 33.08% in 2019 to 24.78% in 2020, with the Switch contributing $462.26K in 2019, and $900.62K in 2020. This shift is likely also connected to pandemic regulations. If more people were staying home, they likely had less desire to purchase a portable gaming system.
- The Dell Gaming Mouse and the Razer Pro Gaming Headset were by far the lowest-selling items in the product portfolio. Neither product sold any units in 2019, whereas in 2020, the Gaming mouse brought in $24,969 in revenue, while the Headset brought in only $764. Both products were impacted by the pandemic surge, but still contributed the least to total revenue.

Below is a revenue concentration graph highlighting the impact that the four highest-selling products have on total revenue.

![Revenue Concentraion](Tableau/images/revenue_share_by_product.png)

### Regional Performance

- North America and EMEA are the primary contributors to total revenue, with North America contributing 54.79% of total revenue and EMEA contributing 32.93%.

![Revenue By Region](Tableau/images/revenue_by_region.png)

- All regions display a synchronised spike in activity beginning in January 2020, reinforcing the presence of a macro-level, company-wide demand shift.
- Seasonal spikes in September and December are visible across regions, with the largest impact observed in North America and EMEA.

Below is a chart highlighting the impact of the Jan 2020 macro event, and its impact on revenue split by region

![Regional Performance](Tableau/images/regional_performance.png)

### Marketing Channel Effectiveness

- The Direct marketing channel dominates revenue contribution compared to all other channels, making up 86% of all traffic across all regions, while bringing in $4.81M in total revenue
- Following the January 2020 Macro Event, Direct revenue grew at a substantially faster rate than other channels. This pattern was observed across all regions, but was significantly more pronounced in North America and EMEA.
- The increased share of Direct traffic suggests a rise in high-intent customer behavior, potentially influenced by lockdown-related changes.

![Regiona Marketing Channel](Tableau/images/region_marketing_channel.png)

---
## Recommendations

Based on the uncovered insights, the following recommendations have been provided:

#### **Finance Team Recommendations**
- Incorporate seasonality and macro-event adjustments into forecasting models, explicitly accounting for recurring September and December spikes and structural demand shifts similar to the January 2020 inflection.
- Strengthen regional financial oversight by prioritizing North America and EMEA in revenue forecasting, budgeting, and variance analysis, given their combined contribution of ~88% of total revenue.
- Track product–region–channel dependency metrics to identify combinations (e.g., PS5–NA–Direct) that could disproportionately affect topline performance during downturns.

#### **Product Team Recommendations**
- Diversify the product portfolio over time to reduce reliance on a small number of SKUs and improve resilience against post-seasonal or post-macro-event demand normalization.
- Consider discontinuing low-selling items. Consider selling through low-selling items such as the Dell Gaming Mouse and the Razer Headset, which together contributed ~0.6% of total revenue. Consider bundling these products with higher-selling items before discontinuing.
- Reassess the long-term role of portable gaming products like the Nintendo Switch, whose revenue share declined during sustained at-home demand, to ensure alignment with evolving customer behavior.

#### **Marketing Team Recommendations**
- Continue prioritizing the Direct channel, which accounts for 86% of traffic and $4.81M in revenue, while ensuring the infrastructure can support traffic surges during peak periods.
- Capitalize on high-intent customer behavior by optimizing Direct landing pages, checkout flows, and retargeting strategies, especially in North America and EMEA.
- Align campaign timing with proven seasonal peaks, focusing promotional spend around September and December when revenue uplift is consistently observed.
- Test diversification strategies across secondary channels to reduce over-dependence on Direct traffic and improve channel mix resilience ahead of future demand shifts.
