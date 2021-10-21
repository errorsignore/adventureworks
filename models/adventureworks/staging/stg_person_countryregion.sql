with source_data as(
    SELECT
    countryregioncode
    ,name as pais




    from {{source('adventureworks', 'person_countryregion')}}
)

select * from source_data