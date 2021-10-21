with source_data as(
    SELECT
    addressid
    ,city as cidade
    ,stateprovinceid




    from {{source('adventureworks', 'person_address')}}
)

select * from source_data