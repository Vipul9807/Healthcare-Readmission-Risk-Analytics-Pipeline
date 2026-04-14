CREATE DATABASE hospital_db;

USE hospital_db;

# BASIC CHECK THE DATA HAS BEEN IMPORTED CORRECTLY OT NOT FROM PYTHON.

SELECT 
    *
FROM
    hospital_readmission_data
LIMIT 100;

# READMISSION OVERVIEW 

-- QUESTION : What is the overall readmission rate (%)?

SELECT 
    ROUND(
        (SUM(CASE WHEN readmitted IN ('<30', '>30') THEN 1 ELSE 0 END) * 100.0) 
        / COUNT(*), 
    2) AS Overall_Readmission_rate_Percentage
FROM 
	hospital_readmission_data;
    
-- QUESTION : What % of patients are readmitted within 30 days?

SELECT 
	ROUND(
    (SUM(CASE WHEN readmitted IN ('<30') THEN 1 ELSE 0 END) * 100)
    / COUNT(*),
    2) AS Percentage_of_Patients_Readmitted_in_30_days
FROM 
	hospital_readmission_data;

-- 46.09% of patients are readmitted, with 11.16% occurring within 30 days, indicating potential gaps in post-discharge care 
-- and early-stage patient monitoring.

# Patient Risk Drivers (Who is at Risk?)

-- QUESTION : Which patient segments are most likely to be readmitted?

SELECT 
    CASE 
        WHEN age IN ('[0-30)') THEN 'Young'
        WHEN age IN ('[30-50)') THEN 'Adult'
        WHEN age IN ('[50-70]') THEN 'Active Seniors'
        ELSE 'Senior'
    END AS age_group,
    gender,
    race,
    has_diabetes,
    number_diagnoses,
    COUNT(*) AS total_patients,
    SUM(CASE
        WHEN readmitted IN ('<30' , '>30') THEN 1
        ELSE 0
    END) AS readmitted_patients,
    ROUND((SUM(CASE
                WHEN readmitted IN ('<30' , '>30') THEN 1
                ELSE 0
            END) * 100.0) / COUNT(*),
            2) AS readmission_rate_percentage
FROM
    hospital_readmission_data
GROUP BY age , gender , race , has_diabetes , number_diagnoses
HAVING COUNT(*) >= 30
ORDER BY readmission_rate_percentage DESC
LIMIT 20;

-- Readmission risk is concentrated within specific patient segments defined by age group, diabetes status, and diagnosis, 
-- with elderly diabetic patients emerging as the highest-risk cohort.

# Clinical Complexity & Treatment Impact (Why it Happens?)

-- QUESTION : How does clinical complexity and treatment influence readmission risk?

SELECT 
    num_conditions,
    medication_level,
    insulin,
    COUNT(*) AS total_patients,
    SUM(CASE
        WHEN readmitted IN ('<30' , '>30') THEN 1
        ELSE 0
    END) AS readmitted_patients,
    ROUND((SUM(CASE
                WHEN readmitted IN ('<30' , '>30') THEN 1
                ELSE 0
            END) * 100.0) / COUNT(*),
            2) AS readmission_rate_percentage
FROM
    hospital_readmission_data
GROUP BY num_conditions, medication_level, insulin
HAVING COUNT(*) >= 30
ORDER BY readmission_rate_percentage DESC
LIMIT 15;

-- Patients with higher comorbidity burden, intensive medication usage, and insulin treatment exhibit elevated readmission rates, 
-- indicating that clinical complexity and treatment intensity are key drivers of readmissions.

# Utilization & Operational Factors (System-Level Drivers)

-- QUESTION : How do hospital utilization patterns influence readmissions?

SELECT 
    number_outpatient + number_inpatient + number_emergency AS total_visits,
    time_in_hospital,
    CASE
        WHEN number_inpatient > 1 THEN 'Repeated Admission'
        ELSE 'Single Admission'
    END AS admission_type,
    COUNT(*) AS total_patients,
    SUM(CASE
        WHEN readmitted IN ('<30' , '>30') THEN 1
        ELSE 0
    END) AS readmitted_patients,
    ROUND((SUM(CASE
                WHEN readmitted IN ('<30' , '>30') THEN 1
                ELSE 0
            END) * 100.0) / COUNT(*),
            2) AS readmission_rate_percentage
FROM
    hospital_readmission_data
GROUP BY total_visits , time_in_hospital , admission_type
HAVING COUNT(*) >= 30
ORDER BY readmission_rate_percentage DESC
LIMIT 15;

-- Patients with higher hospital utilization, longer lengths of stay, and repeated admissions exhibit significantly higher readmission 
-- rates, indicating persistent clinical instability and gaps in care continuity.

-- High-Risk Patient Segmentation

-- QUESTION : What combination of factors defines the highest-risk patients?

SELECT 
    CASE
        WHEN age IN ('[0-30)' , '[30-50)') THEN 'Young'
        WHEN age IN ('[50-70)') THEN 'Adult'
        ELSE 'Elder'
    END AS age_group,
    has_diabetes,
    medication_level,
    num_conditions,
    COUNT(*) AS total_patients,
    SUM(CASE
        WHEN readmitted IN ('<30' , '>30') THEN 1
        ELSE 0
    END) AS readmitted_patients,
    ROUND((SUM(CASE
                WHEN readmitted IN ('<30' , '>30') THEN 1
                ELSE 0
            END) * 100.0) / COUNT(*),
            2) AS readmission_rate_percentage
FROM
    hospital_readmission_data
GROUP BY age_group , has_diabetes , medication_level , num_conditions
HAVING COUNT(*) >= 30
ORDER BY readmission_rate_percentage DESC
LIMIT 20;

-- High-risk patients are concentrated among elderly diabetic individuals with higher medication burden and multiple conditions, 
-- indicating a clear target segment for intervention.



	