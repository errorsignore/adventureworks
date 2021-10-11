{{ config(materialized='table') }}

with employees as (
    select *
    from {{ref('stg_humanresources_employee')}}
)

    , transformed as(
        select
            row_number() over (order by e.businessentityid) as business_sk -- auto-incremental surrogate key
            , e.businessentityid
            , edh.departmentid
            , edh.shiftid
            , s.name as turno
            , d.name
            , d.groupname
            , ph.rate
            , ph.payfrequency

        from employees e
        left join {{ref ('stg_humanresources_employeedepartmenthistory')}} edh on e.businessentityid = edh.businessentityid
        left join {{ref ('stg_humanresources_shift')}} s on s.shiftid = edh.shiftid
        left join {{ref ('stg_humanresources_department')}} d on d.departmentid = edh.departmentid
        left join {{ref ('stg_humanresources_employeepayhistory')}} ph on ph.businessentityid = e.businessentityid

    ) 

    select * from transformed