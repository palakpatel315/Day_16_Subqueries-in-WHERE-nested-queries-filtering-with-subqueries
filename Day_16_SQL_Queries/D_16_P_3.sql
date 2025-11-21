-- D_16_P_3. Show patients from services where total admitted patients exceed 1000.

SELECT p.patient_id,
       p.name AS patient_Name,
       p.service
FROM patients p
WHERE p.service IN (
    SELECT service FROM services_weekly 
    GROUP BY service
    HAVING SUM(patients_admitted) >1000) ;