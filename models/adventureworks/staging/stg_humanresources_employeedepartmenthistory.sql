with source_data as(
    SELECT
    businessentityid
    ,departmentid
    ,shiftid
    ,enddate


    
    from {{source('adventureworks', 'humanresources_employeedepartmenthistory')}}
)

select * from source_data
where enddate is null