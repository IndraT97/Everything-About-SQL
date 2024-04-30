CREATE DATABASE IF NOT EXISTS Health_Care; 
USE Health_Care;

CREATE TABLE Patients (
    PatientID INT ,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    BloodType VARCHAR(5)
);

CREATE TABLE Hospitals (
    HospitalID INT PRIMARY KEY,
    HospitalName VARCHAR(100)
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(200)
);

CREATE TABLE Insurances (
    InsuranceID INT PRIMARY KEY,
    InsuranceProvider VARCHAR(100)
);

CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY,
    MedicationName VARCHAR(100)
);

CREATE TABLE PatientAdmission (
    AdmissionID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    HospitalID INT,
    InsuranceID INT,
    MedicationID INT,
    AdmissionType VARCHAR(50),
    MedicalCondition VARCHAR(100),
    DateOfAdmission DATE,
    DischargeDate DATE,
    RoomNumber VARCHAR(10),
    BillingAmount DECIMAL(10, 2),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID),
    FOREIGN KEY (InsuranceID) REFERENCES Insurances(InsuranceID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
);
