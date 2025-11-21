-- D_16_P_2. List staff who work in services that had any week with patient satisfaction below 70.

SELECT s.staff_id, s.staff_name, s.service
FROM staff s
WHERE service IN (
    SELECT DISTINCT service
    FROM services_weekly
    WHERE patient_satisfaction <70 );