{{ config(materialized='table') }}

with transportadora as (
    select *
    from {{ref('stg_purchasing_shipmethod')}}
)

    , transformed as(
        select
            row_number() over (order by t.shipmethodid) as transportadora_sk -- auto-incremental surrogate key
            ,t.shipmethodid
            ,t.name as transportadora


        from transportadora t
    ) 

    select * from transformed