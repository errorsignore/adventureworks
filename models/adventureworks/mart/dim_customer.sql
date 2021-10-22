{{ config(materialized='table') }}

with customers as (
    select *
    from {{ref('stg_sales_customer')}}
)

    , transformed as(
        select
            row_number() over (order by c.customerid) as customer_sk -- auto-incremental surrogate key
            

        from customers c
        

    ) 

    select * from transformed