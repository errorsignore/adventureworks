with source_data as(
    SELECT
    productmodelid
    ,name




    from {{source('adventureworks', 'production_productmodel')}}
)

select * from source_data