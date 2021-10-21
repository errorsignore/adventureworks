with source_data as(
    SELECT
    stateprovinceid
    ,countryregioncode
    ,name as estado




    from {{source('adventureworks', 'person_stateprovince')}}
)

select * from source_data