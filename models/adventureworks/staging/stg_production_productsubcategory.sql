with source_data as(
    SELECT
    productsubcategoryid
    ,productcategoryid
    ,name




    from {{source('adventureworks', 'production_productsubcategory')}}
)

select * from source_data