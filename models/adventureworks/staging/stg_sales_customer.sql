with source_data as(
    SELECT
    customerid
    ,personid
    ,storeid





    from {{source('adventureworks', 'sales_customer')}}
)

select * from source_data