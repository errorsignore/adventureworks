with source_data as(
    SELECT
    businessentityid
    ,name

    from {{source('adventureworks', 'sales_store')}}
)

select * from source_data