with source_data as(
    SELECT
    creditcardid
    ,cardtype




    from {{source('adventureworks', 'sales_creditcard')}}
)

select * from source_data