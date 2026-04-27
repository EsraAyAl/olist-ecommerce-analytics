# Olist E-Commerce Python EDA

## Goal
Explore delivery performance and customer satisfaction using the Olist e-commerce dataset.

## Tools
Python (pandas, numpy, matplotlib)

## What I did
- Loaded and profiled multiple tables (orders, order_items, payments, reviews, etc.)
- Validated data grain differences (orders vs order_items)
- Engineered features: delivery_days, late_delivery
- Calculated late delivery rate (~8%)
- Analyzed customer satisfaction impact:
  - On-time avg review ≈ 4.29
  - Late avg review ≈ 2.57

## Key Insight
Late deliveries significantly reduce customer satisfaction (review score drops ~1.7 points).
