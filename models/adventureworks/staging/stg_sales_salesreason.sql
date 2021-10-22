with source_data as(
    SELECT
    salesreasonid
    ,name
    ,reasontype

    from {{source('adventureworks', 'sales_salesreason')}}
)

select * from source_data