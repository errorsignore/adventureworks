with source_data as(
    SELECT
    businessentityid
    ,name




    from {{source('adventureworks', 'purchasing_vendor')}}
)

select * from source_data