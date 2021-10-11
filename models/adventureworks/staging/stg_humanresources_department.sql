with source_data as(
    SELECT
    departmentid	
    , name
    , groupname

    from {{source('adventureworks', 'humanresources_department')}}
)

select * from source_data