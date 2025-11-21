-- D_16_P_1. Find patients who are in services with above-average staff count.

SELECT p.patient_id,
       p.name AS patient_Name,
       p.service
FROM patients p
WHERE p.service IN (
    SELECT service FROM staff
    GROUP BY service
    HAVING COUNT(staff_id) > ( SELECT AVG(Staff_Count)
            FROM ( SELECT COUNT(staff_id) AS Staff_Count
                FROM staff GROUP BY service
            ) AS x ) );
