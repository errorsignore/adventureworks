with source_data as(
    SELECT
    stateprovinceid
    ,countryregioncode
    ,name




    from {{source('adventureworks', 'person_stateprovince')}}
)

select * from source_data