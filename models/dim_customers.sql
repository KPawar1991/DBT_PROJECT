{{ config(
    materialized='incremental',
    unique_key='customer_id'
) }}

select
    customer_id,
    initcap(first_name || ' ' || last_name) as full_name,
    email,
    created_at,
    dbt_valid_from,
    dbt_valid_to
from {{ ref('customers_snapshot') }}

{% if is_incremental() %}
    -- Only take new or updated rows
    where dbt_valid_from > (select max(dbt_valid_from) from {{ this }})
{% endif %}
