{{
    config(
        materialized = "table"
    )
}}
{{ dbt_date.get_date_dimension('1996-07-04', '2000-12-31') }}