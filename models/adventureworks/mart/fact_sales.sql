{{ config(materialized='table') }}

with produtos as(
    select 
    product_sk,
    productid,
    from {{ref('dim_products')}}
), employees as(
    select 
    employee_sk
    from {{ref('dim_employees')}}

)

, orders_with_sk as(
    select 
    so.salesorderid as id_do_pedido
    ,so.orderdate as data_do_pedido
    ,so.duedate as prazo_do_pedido
    ,so.shipdate as envio_do_pedido
    ,ad.city as cidade
    ,sp.name as estado
    ,cr.name as pais
    ,sr.name as motivo
    ,sr.reasontype as razaomotivo
    ,credit.cardtype as cartao_de_credito
    ,sod.orderqty as quantidade_do_pedido
    ,sod.unitprice as preco_unitario

    


    from {{ref('stg_sales_orders')}} so
    left join {{ref ('stg_sales_orderdetail')}} sod on sod.salesorderid = so.salesorderid
    left join {{ref ('stg_sales_orderheadersalesreason')}} sohr on sohr.salesorderid = so.salesorderid
    left join {{ref ('stg_sales_salesreason')}} sr on sr.salesreasonid = sohr.salesreasonid
    left join {{ref ('stg_person_address')}} ad on so.billtoaddressid = ad.addressid
    left join {{ref ('stg_person_stateprovince')}} sp on sp.stateprovinceid = ad.stateprovinceid
    left join {{ref ('stg_person_countryregion')}} cr on sp.countryregioncode = cr.countryregioncode
    left join {{ref ('stg_sales_creditcard')}} credit on credit.creditcardid = so.creditcardid

    

)

select * from orders_with_sk