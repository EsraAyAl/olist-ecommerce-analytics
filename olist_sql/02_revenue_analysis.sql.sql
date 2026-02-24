-- Revenue by Category (English)
SELECT
    COALESCE(vp.product_category_name_english, 'unknown') AS category_english,
    COUNT(DISTINCT oi.order_id) AS orders,
    COUNT(*) AS order_item_rows,
    SUM(oi.price) AS revenue_items,
    SUM(oi.freight_value) AS revenue_freight,
    SUM(oi.price + oi.freight_value) AS revenue_total
FROM dbo.olist_order_items_dataset AS oi
LEFT JOIN dbo.v_products AS vp
    ON oi.product_id = vp.product_id
GROUP BY COALESCE(vp.product_category_name_english, 'unknown')
ORDER BY revenue_total DESC;

-- Late vs On-time revenue
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

-- Revenue per Order
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