select
    o.order_id,
    o.order_date,
    o.amount,
    c.full_name as customer_name
from {{ source('raw', 'orders_raw') }} o
join {{ ref('dim_customers') }} c
    on o.customer_id = c.customer_id
