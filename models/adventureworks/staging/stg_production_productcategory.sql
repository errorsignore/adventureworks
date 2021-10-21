with source_data as(
    SELECT
    productcategoryid
    ,name as categoria




    from {{source('adventureworks', 'production_productcategory')}}
)

select * from source_data