with source_data as(
    SELECT
    productmodelid
    ,name as modelo_produto




    from {{source('adventureworks', 'production_productmodel')}}
)

select * from source_data