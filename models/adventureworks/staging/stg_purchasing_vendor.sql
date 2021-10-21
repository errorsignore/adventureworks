with source_data as(
    SELECT
    businessentityid
    ,name as fornecedor




    from {{source('adventureworks', 'purchasing_vendor')}}
)

select * from source_data