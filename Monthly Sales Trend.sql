SELECT
    TO_CHAR(d.calendar_date, 'YYYY-MM') AS month,
    SUM(sf.sales_amount) AS monthly_sales
FROM
    Date_Dim d
JOIN
    Sales_Fact sf ON d.date_id = sf.date_id
GROUP BY
    TO_CHAR(d.calendar_date, 'YYYY-MM')
ORDER BY
    month;
