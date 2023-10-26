-- Data Loading for Date_Dim using Bulk Loading
INSERT ALL
    INTO Date_Dim (date_id, calendar_date, day_of_week, month, quarter, year)
    VALUES (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Sunday', 'January', 'Q1', 2023)
    
    INTO Date_Dim (date_id, calendar_date, day_of_week, month, quarter, year)
    VALUES (2, TO_DATE('2023-01-02', 'YYYY-MM-DD'), 'Monday', 'January', 'Q1', 2023)
    
    -- Add more rows as needed
    
    INTO Date_Dim (date_id, calendar_date, day_of_week, month, quarter, year)
    VALUES (N, TO_DATE('2023-MM-DD', 'YYYY-MM-DD'), 'DayOfWeek', 'Month', 'Quarter', 2023)
SELECT * FROM dual;
