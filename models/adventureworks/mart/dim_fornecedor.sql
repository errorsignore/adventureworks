{{ config(materialized='table') }}

with fornecedor as (
    select *
    from {{ref('stg_purchasing_vendor')}}
)

    , transformed as(
        select
            row_number() over (order by f.businessentityid) as fornecedor_sk -- auto-incremental surrogate key
            ,f.businessentityid
            ,f.name as fornecedor


        from fornecedor f
    ) 

    select * from transformed