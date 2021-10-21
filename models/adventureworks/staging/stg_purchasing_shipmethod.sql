with source_data as(
    SELECT
    shipmethodid
    ,name as transportadora




    from {{source('adventureworks', 'purchasing_shipmethod')}}
)

select * from source_data