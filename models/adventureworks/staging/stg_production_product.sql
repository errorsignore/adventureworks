with source_data as(
    SELECT
    productid
    ,name
    ,productsubcategoryid
    ,productmodelid



    from {{source('adventureworks', 'production_product')}}
)

select * from source_data