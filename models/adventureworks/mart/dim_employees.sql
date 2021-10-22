{{ config(materialized='table') }}

with employees as (
    select *
    from {{ref('stg_humanresources_employee')}}
)

    , transformed as(
        select
            row_number() over (order by e.businessentityid) as employee_sk -- auto-incremental surrogate key
            , e.businessentityid
            , e.jobtitle as Cargo
            , s.name as turno
            , d.name as Departamento
            , d.groupname as Grupo_do_Departamento
            , person.firstname
            , person.middlename
            , person.lastname

        from employees e
        left join {{ref ('stg_humanresources_employeedepartmenthistory')}} edh on e.businessentityid = edh.businessentityid
        left join {{ref ('stg_humanresources_shift')}} s on s.shiftid = edh.shiftid
        left join {{ref ('stg_humanresources_department')}} d on d.departmentid = edh.departmentid
        left join {{ref ('stg_person_person')}} person on person.businessentityid = e.businessentityid

    ) 

    select * from transformed