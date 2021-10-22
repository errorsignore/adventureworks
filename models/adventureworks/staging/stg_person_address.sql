with source_data as(
    SELECT
    addressid
    ,city
    ,stateprovinceid




    from {{source('adventureworks', 'person_address')}}
)

select * from source_data