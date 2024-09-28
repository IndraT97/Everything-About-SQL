-- Number of distinct patients

SELECT COUNT(DISTINCT PatientID) AS NumberOfDistinctPatients 
FROM Patients;

-- Group patients by gender

SELECT Gender, COUNT(*) AS NumberOfPatients 
FROM Patients 
GROUP BY Gender;

-- Group patients by BloodType 

SELECT BloodType, COUNT(*) AS NumberOfPatients 
FROM Patients 
GROUP BY BloodType
ORDER BY NumberOfPatients DESC;

-- Group patients by Medical Condition

SELECT MedicalCondition, COUNT(*) AS NumberOfPatients 
FROM PatientAdmission 
GROUP BY MedicalCondition
ORDER BY 2 DESC;

-- Group patients by Insurance Provider 

SELECT InsuranceProvider, COUNT(*) AS NumberOfPatients 
FROM Insurances i
JOIN PatientAdmission pa ON i.InsuranceID = pa.InsuranceID
GROUP BY InsuranceProvider
ORDER BY 2 DESC;

-- Group patients by Medication

SELECT MedicationName, COUNT(*) AS NumberOfPatients FROM Medications m
JOIN PatientAdmission pa ON m.MedicationID = pa.MedicationID
GROUP BY MedicationName
ORDER BY 2 DESC;

-- SQL query to show the distribution of medical conditions across different genders

SELECT MedicalCondition, Gender, COUNT(*) AS NumberOfPatients
FROM Patients
JOIN PatientAdmission 
ON Patients.PatientID = PatientAdmission.PatientID
GROUP BY medicalCondition, Gender
ORDER BY 3 DESC;

-- -- Top 5 hospitals with the highest total billing amounts and create a bar chart to display these amounts

SELECT HospitalID, SUM(BillingAmount) AS TotalBilling
FROM PatientAdmission
GROUP BY HospitalID
ORDER BY TotalBilling DESC
lIMIT 5;

-- Number of doctors whose last names start with the letter ‘W’ 

SELECT COUNT(*) AS NumberOfDoctors
FROM Doctors
Where SUBSTRING_INDEX(NAME, ' ', -1) 
LIKE 'W%';

-- Number of patients grouped by the duration of their hospital stay

SELECT DATEDIFF(DischargeDate, DateOfAdmission) AS StayDuration, COUNT(*) AS NumberOfPatients
FROM PatientAdmission
GROUP BY StayDuration
ORDER BY StayDuration;

-- Average billing amount for Medical Condition among Males & Females 

SELECT MedicalCondition, Gender, round(AVG(BillingAmount),2) AS AverageBilling
FROM PatientAdmission
JOIN Patients ON PatientAdmission.PatientID = Patients.PatientID
GROUP BY MedicalCondition, Gender
ORDER BY AverageBilling DESC;
