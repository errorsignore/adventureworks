with source_data as(
    SELECT
    businessentityid
    ,persontype
    ,firstname
    ,middlename
    ,lastname


    from {{source('adventureworks', 'person_person')}}
)

select * from source_data