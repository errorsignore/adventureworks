with source_data as(
    SELECT
    businessentityid
    ,productid




    from {{source('adventureworks', 'purchasing_productvendor')}}
)

select * from source_data