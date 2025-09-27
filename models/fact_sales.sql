select
    o.order_id,
    o.order_date,
    o.amount,
    c.full_name as customer_name,
    p.product_name,
    p.price
from {{ source('raw','orders_raw') }} o
join {{ ref('dim_customers') }} c on o.customer_id = c.customer_id
left join {{ ref('products') }} p on o.order_id = p.product_id
