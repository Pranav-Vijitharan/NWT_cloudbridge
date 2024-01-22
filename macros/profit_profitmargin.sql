{% macro markup() %}
(ordersellingprice-NULLIF(ordercostprice, 0))/NULLIF(ordercostprice, 0)
{% endmacro %}