with source_data as(
    SELECT
    salesreasonid
    ,name as motivo
    ,reasontype as razaomotivo

    from {{source('adventureworks', 'sales_salesreason')}}
)

select * from source_data