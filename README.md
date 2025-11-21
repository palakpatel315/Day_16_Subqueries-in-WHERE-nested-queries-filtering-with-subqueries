

# 📘 21 Days SQL Challenge – Day 16  
### **Topic:** Subqueries in WHERE Clause  

---

## 🎯 Objective  
Day 16 focused on learning how to use **subqueries inside the WHERE clause** to filter data based on dynamic conditions.  
The goal was to understand how SQL can answer multi-layered questions by nesting queries.

---

## 🧠 Key Learnings  

- Understood how **subqueries** work inside `WHERE` to return filtered results.  
- Learned the difference between:
  - **Single-value subqueries** (used with =, >, <)  
  - **Multi-value subqueries** using `IN` and `NOT IN`  
  - **EXISTS / NOT EXISTS** for checking row existence  
- Practiced writing **correlated subqueries** referencing the outer query.  
- Learned how subqueries help compare values with:
  - Overall dataset averages  
  - Aggregated metrics from other tables  
- Strengthened understanding of when to use **IN vs EXISTS** for performance.  
- Understood NULL issues with `NOT IN` and how to avoid them.

---

## 🧩 Daily Challenge  

### **Question:**  
Find all patients who were admitted to services that had:  
1️⃣ At least **one week with patient refusals**  
2️⃣ **Average patient satisfaction below the hospital-wide average**  

Show: `patient_id`, `name`, `service`, and `patient_satisfaction`.

---

### ✅ **SQL Query Used**

```sql
SELECT p.patient_id,
       p.name AS Patient_Name,
       p.service,
       p.satisfaction
 FROM patients p
 WHERE p.service IN ( SELECT service FROM services_weekly
        WHERE patients_refused > 0 GROUP BY service )
AND p.service IN ( SELECT service FROM patients
        GROUP BY service 
        HAVING AVG(satisfaction) < (SELECT AVG(satisfaction) FROM patients ) );

```

## 📸 **SQL Queries**

![Check_SQL Query File](https://github.com/palakpatel315/Day_16_Subqueries-in-WHERE-nested-queries-filtering-with-subqueries/tree/main/Day_16_SQL_Queries)


---
Thank you [Indian Data Club](https://www.linkedin.com/company/indian-data-club/posts/?feedView=all) for starting this challenge and [DPDzero](https://www.linkedin.com/company/dpdzero/) the title sponsor of this challenge

---

## 👩‍💻 **About Me**
**Palak Patel**  
*Aspiring Data Analyst | Skilled in SQL, Power BI, Excel*  
📍 Passionate about turning data into insights and solving real-world business problems.  

🔗 [Connect with me on LinkedIn](https://www.linkedin.com/in/palak-patel-0711242a0/)

---
