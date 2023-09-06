{% snapshot scd_raw_listings %}

{{
   config(
       target_schema='dev',
       unique_key='id',
       strategy='timestamp',
       updated_at='updated_at',
       invalidate_hard_deletes=True 
   )
}}
/* invalidate_hard_deletes for dbt to track delete statements */
select * FROM {{ source('airbnb', 'listings') }}

{% endsnapshot %}