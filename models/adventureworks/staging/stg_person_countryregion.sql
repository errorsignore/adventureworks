with source_data as(
    SELECT
    countryregioncode
    ,name




    from {{source('adventureworks', 'person_countryregion')}}
)

select * from source_data