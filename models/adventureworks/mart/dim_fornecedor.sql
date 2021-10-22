{{ config(materialized='table') }}

with fornecedor as (
    select *
    from {{ref('stg_purchasing_vendor')}}
)

    , transformed as(
        select
            row_number() over (order by f.businessentityid) as fornecedor_sk -- auto-incremental surrogate key
            ,pv.productid
            ,f.name as fornecedor


        from fornecedor f
        left join {{ref ('stg_purchasing_productvendor')}} pv on pv.businessentityid = f.businessentityid
        left join {{ref ('stg_production_product')}} product on product.productid = pv.productid
    ) 

    select * from transformed