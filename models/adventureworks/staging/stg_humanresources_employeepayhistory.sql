with source_data as(
    SELECT
    businessentityid
    ,ratechangedate
    ,rate
    ,payfrequency




    from {{source('adventureworks', 'humanresources_employeepayhistory')}}
)

select * from source_data