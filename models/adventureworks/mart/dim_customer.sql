{{ config(materialized='table') }}

with customers as (
    select *
    from {{ref('stg_sales_customer')}}
)

    , transformed as(
        select
            row_number() over (order by c.customerid) as customer_sk -- auto-incremental surrogate key
            ,c.customerid
            ,person.firstname
            ,person.middlename
            ,person.lastname
            ,store.name as revendedor



        from customers c
        left join {{ref ('stg_person_person')}} person on person.businessentityid = c.personid
        left join {{ref ('stg_sales_store')}} store on store.businessentityid = c.storeid
        

    ) 

    select * from transformed