with source_data as(
    SELECT
    salesorderid
    ,salesorderdetailid
    ,productid
    ,orderqty
    ,unitprice





    from {{source('adventureworks', 'sales_orderdetail')}}
)

select * from source_data