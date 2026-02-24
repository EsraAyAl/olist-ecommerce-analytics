-- Late vs Ontime review score query
SELECT
    CASE 
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 'Late'
        ELSE 'On Time'
    END AS delivery_status,

    AVG(CAST(rv.review_score AS float)) AS avg_review_score

FROM dbo.olist_orders_dataset o
LEFT JOIN dbo.olist_order_reviews_dataset rv
    ON o.order_id = rv.order_id

WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL

GROUP BY
    CASE 
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 'Late'
        ELSE 'On Time'
    END;

-- Freight comparison query
SELECT
    CASE 
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 'Late'
        ELSE 'On Time'
    END AS delivery_status,

    AVG(r.items_revenue) AS avg_items_revenue,
    AVG(r.freight_revenue) AS avg_freight_revenue,
    AVG(r.total_revenue) AS avg_total_revenue

FROM dbo.olist_orders_dataset o
JOIN dbo.v_order_revenue r
    ON o.order_id = r.order_id

WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL

GROUP BY
    CASE 
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 'Late'
        ELSE 'On Time'
    END;

-- Revenue per Order by Delivery Performance
SELECT
    CASE 
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 'Late'
        ELSE 'On Time'
    END AS delivery_status,

    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(r.total_revenue) AS total_revenue,
    AVG(r.total_revenue) AS avg_revenue_per_order

FROM dbo.olist_orders_dataset o
JOIN dbo.v_order_revenue r
    ON o.order_id = r.order_id

WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL

GROUP BY
    CASE 
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 'Late'
        ELSE 'On Time'
    END;

