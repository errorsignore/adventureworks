with source_data as(
    SELECT
    productid
    ,name as produto
    ,productsubcategoryid
    ,productmodelid



    from {{source('adventureworks', 'production_product')}}
)

select * from source_data