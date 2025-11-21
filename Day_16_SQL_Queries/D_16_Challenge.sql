-- D_16_Challenge_Question: Find all patients who were admitted to services that had at least one week where patients were refused 
-- AND the average patient satisfaction for that service was below the overall hospital average satisfaction. 
-- Show patient_id, name, service, and their personal satisfaction score.

SELECT p.patient_id, p.name AS Patient_Name, p.service, p.satisfaction
 FROM patients p
 WHERE p.service IN ( SELECT service FROM services_weekly
        WHERE patients_refused > 0 GROUP BY service )
AND p.service IN ( SELECT service FROM patients
        GROUP BY service 
        HAVING AVG(satisfaction) < (SELECT AVG(satisfaction) FROM patients ) );
