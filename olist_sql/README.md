# Olist SQL Analysis

## Database
SQL Server

## Structure

### 01_data_modeling.sql
- Created analytical view `v_products`
- Created order-level revenue view `v_order_revenue`

### 02_revenue_analysis.sql
- Revenue by category
- Revenue per order
- Revenue split by delivery status

### 03_delivery_impact.sql
- Late delivery rate (~8%)
- Late vs On-time revenue comparison
- Late vs On-time review score analysis

## Key Insights

- Late orders represent ~8% of delivered orders.
- Late orders generate higher average revenue (172.7 vs 158.7).
- Customer satisfaction drops significantly for late deliveries (2.57 vs 4.29).
- Higher-value orders appear more prone to delivery delays.
