with source_data as(
    SELECT
    salesorderid
    ,orderdate
    ,duedate
    ,shipdate
    ,customerid
    ,billtoaddressid
    ,shiptoaddressid
    ,shipmethodid
    ,creditcardid
    ,subtotal
    ,taxamt
    ,freight
    ,totaldue






    from {{source('adventureworks', 'sales_orders')}}
)

select * from source_data