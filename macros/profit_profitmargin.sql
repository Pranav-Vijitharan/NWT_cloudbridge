{% macro profit_profitmargin(o, od, p) %}

  (
    ROUND({{od}}.netsales - ({{p}}.unitcost * {{od}}.quantity),2)
  ) AS profit,

  (
    ROUND((({{od}}.netsales - ({{p}}.unitcost * {{od}}.quantity))/{{od}}.netsales) * 100, 2)
  ) AS profitMargin

{% endmacro %}