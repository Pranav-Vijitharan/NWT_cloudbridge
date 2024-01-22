{% macro calculate_profit(o, od, p) %}
  (
    ({{ o }}.REVENUE - {{ od }}.DISCOUNTAMOUNT - {{ o }}.FREIGHT - {{ p }}.UNITCOST)
  ) AS profit,
  (
    ({{ o }}.REVENUE - {{ od }}.DISCOUNTAMOUNT - {{ o }}.FREIGHT - {{ p }}.UNITCOST) /
    NULLIF({{ o }}.REVENUE, 0) * 100
  ) AS profitMargin
{% endmacro %}