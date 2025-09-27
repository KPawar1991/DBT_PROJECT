{% snapshot customers_snapshot %}

{{
  config(
    target_schema='public',
    unique_key='customer_id',
    strategy='check',
    check_cols=['email']
  )
}}

select
    customer_id,
    first_name,
    last_name,
    email,
    created_at
from {{ source('raw','customers_raw') }}

{% endsnapshot %}
