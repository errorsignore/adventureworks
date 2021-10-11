with source_data as(
    SELECT
    shiftid
    ,name




    from {{source('adventureworks', 'humanresources_shift')}}
)

select * from source_data