{{ config(materialized='table') }}

with produtos as(
    select 
    product_sk,
    productid,
    from {{ref('dim_products')}}
), employees as(
    select 
    employee_sk
    ,businessentityid
    from {{ref('dim_employees')}}
), transportadora as(
    select 
    shipmethodid
    ,transportadora_sk
    from {{ref('dim_transportadora')}}
), customers as(
    select 
    customerid
    ,customer_sk
    from {{ref('dim_customer')}}
), fornecedor as(
    select 
    productid
    ,fornecedor_sk
    from {{ref('dim_fornecedor')}}
)

, orders_with_sk as(
    select 
    so.salesorderid as id_do_pedido
    ,so.orderdate as data_da_venda
    ,so.duedate as prazo_da_venda
    ,so.shipdate as envio_da_venda
    ,ad.city as cidade
    ,sp.name as estado
    ,cr.name as pais
    ,t.transportadora_sk
    ,e.employee_sk
    ,p.product_sk
    ,c.customer_sk
    ,f.fornecedor_sk
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

    left join transportadora t on t.shipmethodid = so.shipmethodid
    left join employees e on e.businessentityid = so.salespersonid
    left join customers c on c.customerid = so.customerid
    left join produtos p on p.productid = sod.productid
    left join fornecedor f on f.productid = sod.productid
)

select * from orders_with_sk