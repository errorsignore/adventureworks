{{ config(materialized='table') }}

with products as (
    select *
    from {{ref('stg_production_product')}}
)

    , transformed as(
        select
            row_number() over (order by p.productid) as product_sk -- auto-incremental surrogate key
            ,p.productid
            ,p.name as produto
            ,psc.name as subcategoria
            ,pc.name as categoria
            ,pm.name as modelo_produto


        from products p
        left join {{ref ('stg_production_productsubcategory')}} psc on psc.productsubcategoryid = p.productsubcategoryid
        left join {{ref ('stg_production_productcategory')}} pc on pc.productcategoryid = psc.productcategoryid
        left join {{ref ('stg_production_productmodel')}} pm on pm.productmodelid = p.productmodelid

    ) 

    select * from transformed