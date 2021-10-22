{{ config(materialized='table') }}

with produtos as(
    select 
    product_sk,
    product_id,
    from {{ref('dim_products')}}
), employees as(
    select 
    employee_sk,
    employee_id
    from {{ref('dim_employees')}}



, orders_with_sk as(
    select 
    so.salesorderid as id_do_pedido
    ,so.orderdate as data_do_pedido
    ,so.duedate as prazo_do_pedido
    ,so.shipdate as envio_do_pedido


    from {{ref('stg_sales_orders')}} so
    left join {{ref ('stg_sales_orderdetail')}} sod on sod.salesorderid = so.salesorderid

)

select * from orders_with_sk