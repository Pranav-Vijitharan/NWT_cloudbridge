{% macro calculate_profit(o, od, p) %}
  (
    ({{ od }}.REVENUE - {{ od }}.DISCOUNTAMOUNT - {{ o }}.FREIGHT - {{ p }}.UNITCOST)
  ) AS profit,
  (
    ({{ od }}.REVENUE - {{ od }}.DISCOUNTAMOUNT - {{ o }}.FREIGHT - {{ p }}.UNITCOST) /
    NULLIF({{ od }}.REVENUE, 0) * 100
  ) AS profitMargin
{% endmacro %}