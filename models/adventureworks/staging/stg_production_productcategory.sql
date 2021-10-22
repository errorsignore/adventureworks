with source_data as(
    SELECT
    productcategoryid
    ,name




    from {{source('adventureworks', 'production_productcategory')}}
)

select * from source_data