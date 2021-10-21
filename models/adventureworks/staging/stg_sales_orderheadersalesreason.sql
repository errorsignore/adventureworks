with source_data as(
    SELECT
    salesorderid
    ,salesreasonid





    from {{source('adventureworks', 'sales_orderheadersalesreason')}}
)

select * from source_data