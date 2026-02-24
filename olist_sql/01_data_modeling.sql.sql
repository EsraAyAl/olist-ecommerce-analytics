CREATE VIEW dbo.v_products AS
SELECT
    p.*,
    t.product_category_name_english
FROM dbo.olist_products_dataset p
LEFT JOIN product_category_name_translation t
    ON p.product_category_name = t.product_category_name;

SELECT TOP 5 * FROM dbo.v_products;


CREATE VIEW dbo.v_order_revenue AS
SELECT
    oi.order_id,
    SUM(oi.price) AS items_revenue,
    SUM(oi.freight_value) AS freight_revenue,
    SUM(oi.price + oi.freight_value) AS total_revenue
FROM dbo.olist_order_items_dataset oi
GROUP BY oi.order_id;

SELECT TOP 5 * FROM dbo.v_order_revenue;