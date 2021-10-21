with source_data as(
    SELECT
    creditcardid
    ,cardtype as cartao_de_credito




    from {{source('adventureworks', 'sales_creditcard')}}
)

select * from source_data