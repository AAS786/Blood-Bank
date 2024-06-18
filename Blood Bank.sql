CREATE TABLE Donors (
    DonorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BloodGroup VARCHAR(5),
    Age INT,
    Gender VARCHAR(10),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255)
);


CREATE TABLE MainBranch (
    MainBranchID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(255),
    ContactNumber VARCHAR(15)
);


CREATE TABLE Helpers (
    HelperID INT PRIMARY KEY,
    MainBranchID INT,
    FirstName VARCHAR(10),
	LastName VARCHAR(10),
    Role VARCHAR(100),
    ContactNumber VARCHAR(15),
    FOREIGN KEY (MainBranchID) REFERENCES MainBranch(MainBranchID)
);


CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(100),
    ContactNumber VARCHAR(15)
);


CREATE TABLE SubBranch (
    SubBranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Location VARCHAR(255)
);

-- Add new column HelperContactNumber to Doctors_SubBranch table
ALTER TABLE SubBranch
ADD HelperContactNumber VARCHAR(15);
UPDATE SubBranch
SET HelperContactNumber = '9876543210'
WHERE SubBranchID = 1;

UPDATE SubBranch
SET HelperContactNumber = '9876543211' 
WHERE SubBranchID = 2;

UPDATE SubBranch
SET HelperContactNumber = '9876543212' 
WHERE SubBranchID = 3;


-- Creating the table for doctors assigned to sub-branches
CREATE TABLE Doctors_SubBranch (
    DoctorID INT,
    SubBranchID INT,
    PRIMARY KEY (DoctorID, SubBranchID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (SubBranchID) REFERENCES SubBranch(SubBranchID)
);


CREATE TABLE Helpers_Doctors (
    HelperID INT PRIMARY KEY,
    DoctorID INT,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);


-- Creating the Donor_Branch table
CREATE TABLE Donor_Branch (
    DonorID INT,
    SubBranchID INT,
    PRIMARY KEY (DonorID, SubBranchID),
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID),
    FOREIGN KEY (SubBranchID) REFERENCES SubBranch(SubBranchID)
);





INSERT INTO Donors (DonorID, FirstName, LastName, BloodGroup, Age, Gender, ContactNumber, Email, Address)
VALUES
(1, 'Rahul', 'Gupta', 'O+', 35, 'Male', '9876543210', 'rahul@example.com', '123 Main St, New Delhi'),
(2, 'Priya', 'Sharma', 'A-', 28, 'Female', '9876543211', 'priya@example.com', '456 Park Ave, Mumbai'),
(3, 'Amit', 'Patel', 'B+', 45, 'Male', '9876543212', 'amit@example.com', '789 Elm St, Kolkata'),
(4, 'Sneha', 'Singh', 'AB+', 22, 'Female', '9876543213', 'sneha@example.com', '101 Oak St, Bangalore'),
(5, 'Ravi', 'Joshi', 'O-', 31, 'Male', '9876543214', 'ravi@example.com', '222 Pine St, Chennai'),
(6, 'Anita', 'Kumar', 'A+', 40, 'Female', '9876543215', 'anita@example.com', '333 Cedar St, Hyderabad'),
(7, 'Raj', 'Verma', 'B-', 29, 'Male', '9876543216', 'raj@example.com', '444 Maple St, Pune'),
(8, 'Neha', 'Agarwal', 'AB-', 37, 'Female', '9876543217', 'neha@example.com', '555 Birch St, Jaipur'),
(9, 'Vikas', 'Yadav', 'O+', 25, 'Male', '9876543218', 'vikas@example.com', '666 Elm St, Ahmedabad'),
(10, 'Pooja', 'Das', 'A-', 33, 'Female', '9876543219', 'pooja@example.com', '777 Oak St, Surat'),
(11, 'Rahul', 'Shah', 'B+', 27, 'Male', '9876543220', 'rahul2@example.com', '888 Maple St, Lucknow'),
(12, 'Sunita', 'Rao', 'AB+', 39, 'Female', '9876543221', 'sunita@example.com', '999 Pine St, Chandigarh'),
(13, 'Amit', 'Singh', 'O-', 32, 'Male', '9876543222', 'amit2@example.com', '123 Cedar St, Patna'),
(14, 'Divya', 'Mishra', 'A+', 36, 'Female', '9876543223', 'divya@example.com', '456 Birch St, Nagpur'),
(15, 'Manoj', 'Gandhi', 'B-', 41, 'Male', '9876543224', 'manoj@example.com', '789 Maple St, Indore'),
(16, 'Shweta', 'Thakur', 'AB-', 24, 'Female', '9876543225', 'shweta@example.com', '101 Pine St, Varanasi'),
(17, 'Rajesh', 'Khan', 'O+', 30, 'Male', '9876543226', 'rajesh@example.com', '222 Cedar St, Bhopal'),
(18, 'Preeti', 'Sharma', 'A-', 26, 'Female', '9876543227', 'preeti@example.com', '333 Birch St, Ludhiana'),
(19, 'Vivek', 'Reddy', 'B+', 38, 'Male', '9876543228', 'vivek@example.com', '444 Maple St, Coimbatore'),
(20, 'Anjali', 'Rajput', 'AB+', 23, 'Female', '9876543229', 'anjali@example.com', '555 Oak St, Amritsar');

INSERT INTO MainBranch (MainBranchID, Name, Location, ContactNumber)
VALUES (1, 'LifeSaver Drive', 'Kolkata', '033-654-2747');


INSERT INTO Helpers (HelperID, MainBranchID, FirstName, LastName, Role, ContactNumber)
VALUES 
(1, 1, 'Rajesh', 'Patel', 'Compounder', '9876543210'),
(2, 1, 'Neha', 'Sharma', 'Volunteer', '9876543211'),
(3, 1, 'Ramesh', 'Singh', 'Nurse', '9876543212'),
(4, 1, 'Priya', 'Gupta', 'Volunteer', '9876543213'),
(5, 1, 'Sanjay', 'Kumar', 'Compounder', '9876543214');

INSERT INTO Doctors VALUES 
(1, 'Dr. Manoj', 'Sharma', 'Hematologist (Blood Cancer)', '9876543220'),
(2, 'Dr. Priyanka', 'Verma', 'Endocrinologist (Diabetes)', '9876543221'),
(3, 'Dr. Rahul', 'Singh', 'Cardiovascular Hematologist', '9876543222'),
(4, 'Dr. Sneha', 'Patil', 'Hematologist (Thrombophilia)', '9876543223'),
(5, 'Dr. Rohan', 'Mehta', 'Hematologist (Hemophilia)', '9876543224'),
(6, 'Dr. Nisha', 'Gupta', 'Endocrinologist (Thyroid Disorders)', '9876543225');



INSERT INTO SubBranch 
VALUES 
(1, 'LifeSaver Drive_1', 'Howrah'),
(2, 'LifeSaver Drive_2', 'Salt Lake City'),
(3, 'LifeSaver Drive_3', 'New Town');


-- Inserting data into the Doctors_SubBranch table
INSERT INTO Doctors_SubBranch
VALUES 
(1, 2), -- Doctor 1 assigned to SubBranch A
(2, 1), -- Doctor 2 assigned to SubBranch A
(3, 1), -- Doctor 3 assigned to SubBranch B
(4, 2), -- Doctor 4 assigned to SubBranch B
(5, 3), -- Doctor 5 assigned to SubBranch C
(6, 3); -- Doctor 6 assigned to SubBranch C

-- Inserting data into the Helpers_Doctors table
INSERT INTO Helpers_Doctors (HelperID, DoctorID)
VALUES 
(1, 2), -- Helper 1 assigned to Doctor 1
(2, 1), -- Helper 2 assigned to Doctor 2
(3, 3), -- Helper 3 assigned to Doctor 3
(4, 4), -- Helper 4 assigned to Doctor 4
(5, 5), -- Helper 5 assigned to Doctor 5
(6, 6); -- Helper 6 assigned to Doctor 6

-- Inserting values into the Donor_Branch table
INSERT INTO Donor_Branch (DonorID, SubBranchID)
VALUES 
(1, 1), -- Donor 1 assigned to SubBranch 1
(2, 1), -- Donor 2 assigned to SubBranch 1
(3, 1), -- Donor 3 assigned to SubBranch 1
(4, 2), -- Donor 4 assigned to SubBranch 2
(5, 2), -- Donor 5 assigned to SubBranch 2
(6, 2), -- Donor 6 assigned to SubBranch 2
(7, 3), -- Donor 7 assigned to SubBranch 3
(8, 3), -- Donor 8 assigned to SubBranch 3
(9, 3); -- Donor 9 assigned to SubBranch 3



SELECT * FROM Donors;
SELECT * FROM MainBranch;
SELECT * FROM Helpers;
SELECT * FROM Doctors;

SELECT * FROM SubBranch;
SELECT * FROM Doctors_SubBranch;
SELECT * FROM Helpers_Doctors;
SELECT * FROM Donor_Branch;

----Desc -----
Desc MainBranch;
Desc Helpers;
Desc Doctors;

Desc SubBranch;
Desc Doctors_SubBranch;
Desc Helpers_Doctors;
Desc Donor_Branch;


----Some Related Quary problems ----------------

--Find the FirstNmae,and LastName whose blood group is AB-

SELECT FirstName,LastName,Age
FROM Donors
WHERE BloodGRoup='AB-'

--Find the names of donors, their blood group,Age, the names of the doctor and helper, 
- and the sub-branch name where the blood group is O+.

SELECT
    d.DonorID,
    d.FirstName AS DonorFirstName,
    d.LastName AS DonorLastName,
    d.BloodGroup AS DonorBloodGroup,
    d.Age AS DonorAge,
    dr.FirstName AS DoctorFirstName,
    dr.LastName AS DoctorLastName,
    h.FirstName AS HelperFirstName,
    h.LastName AS HelperLastName,
    sb.BranchName AS SubBranchName
FROM
    Donors d
JOIN
    Donor_Branch db ON d.DonorID = db.DonorID
JOIN
    SubBranch sb ON db.SubBranchID = sb.SubBranchID
JOIN
    Doctors_SubBranch dsb ON db.SubBranchID = dsb.SubBranchID
JOIN
    Doctors dr ON dsb.DoctorID = dr.DoctorID
JOIN
    Helpers_Doctors hd ON dr.DoctorID = hd.DoctorID
JOIN
    Helpers h ON hd.HelperID = h.HelperID
WHERE
    d.BloodGroup = 'O+';

--Find all donor names, ages, blood groups, and their 
-- assigned doctor names along with the branch they are assigned to.

SELECT
    d.FirstName AS DonorFirstName,
    d.LastName AS DonorLastName,
    d.Age AS DonorAge,
    d.BloodGroup AS DonorBloodGroup,
    dr.FirstName AS DoctorFirstName,
    dr.LastName AS DoctorLastName,
    sb.BranchName AS AssignedBranch
FROM
    Donors d
JOIN
    Donor_Branch db ON d.DonorID = db.DonorID
JOIN
    SubBranch sb ON db.SubBranchID = sb.SubBranchID
JOIN
    Doctors_SubBranch dsb ON db.SubBranchID = dsb.SubBranchID
JOIN
    Doctors dr ON dsb.DoctorID = dr.DoctorID;


--Find Doctor FirstName,Specialization,Contactnum and their helpers,and their contactnumber in asc order

SELECT 
    dr.FirstName AS DoctorFirstName,
    dr.Specialization,
    dr.ContactNumber AS DoctorContactNumber,
    h.FirstName AS HelperFirstName,
    h.ContactNumber AS HelperContactNumber
FROM 
    Doctors AS dr
INNER JOIN
    Helpers_Doctors AS hd ON dr.DoctorID = hd.DoctorID
INNER JOIN
    Helpers AS h ON hd.HelperID = h.HelperID
ORDER BY
    dr.FirstName ASC;

--Find the total number of donors in each blood group:

SELECT BloodGroup, COUNT(*) AS TotalDonors
FROM Donors
GROUP BY BloodGroup;

--Find the average age of donors for each blood group:

SELECT BloodGroup, AVG(Age) AS AverageAge
FROM Donors
GROUP BY BloodGroup;


--Find the sub-branches with the highest number of donors:

SELECT sb.BranchName, COUNT(*) AS TotalDonors
FROM SubBranch sb
JOIN Donor_Branch db ON sb.SubBranchID = db.SubBranchID
GROUP BY sb.BranchName
ORDER BY TotalDonors DESC;


--Find 5 max age doner name

SELECT  * FROM Donors
ORDER BY DonorID DESC
	limit 5;


--Name and Bloodgroup who has rare blood

SELECT FirstName,LastName,BloodGroup
FROM Donors
WHERE BloodGroup NOT IN ('A+', 'B+', 'AB+', 'O+')
ORDER BY DonorID DESC;


--Retrieve SubBranches with Helper Contact Numbers in Howrah:

SELECT SubBranchID, BranchName, Location, HelperContactNumber
FROM SubBranch;


--Update Helper Contact Number for a Specific SubBranch:

UPDATE SubBranch
SET HelperContactNumber = '9876543213'
WHERE SubBranchID = 3;


--Retrieve the details of doctors along with their associated sub-branches.

SELECT 
    d.DoctorID, 
    d.FirstName AS DoctorFirstName, 
    d.LastName AS DoctorLastName, 
    d.Specialization, 
    sb.BranchName, 
    sb.Location
FROM 
    Doctors d
INNER JOIN 
    Doctors_SubBranch ds ON d.DoctorID = ds.DoctorID
INNER JOIN 
    SubBranch sb ON ds.SubBranchID = sb.SubBranchID;


-- List all donors along with their associated sub-branch locations

SELECT 
    d.FirstName AS DonorFirstName, 
    d.LastName AS DonorLastName, 
    d.BloodGroup, 
    sb.Location
FROM 
    Donors d
INNER JOIN 
    Donor_Branch db ON d.DonorID = db.DonorID
INNER JOIN 
    SubBranch sb ON db.SubBranchID = sb.SubBranchID;


-- To find donors with a specific name pattern using LIKE:

SELECT
    DonorID,
    FirstName,
    LastName,
    BloodGroup,
    Age
FROM
    Donors
WHERE
    FirstName LIKE 'A%'; -- Finds donors whose first name starts with 'A'


-- To find donors within a certain age range using BETWEEN:

SELECT
    DonorID,
    FirstName,
    LastName,
    BloodGroup,
    Age
FROM
    Donors
WHERE
    Age BETWEEN 25 AND 30; -- Finds donors whose age is between 18 and 30


-- To find donors with specific blood groups using IN:

SELECT
    DonorID,
    FirstName,
    LastName,
    BloodGroup,
    Age
FROM
    Donors
WHERE
    BloodGroup IN ('O+', 'A+', 'B+'); -- Finds donors with blood groups O+, A+, or B+


-- To find doctors with a specific specialization using LIKE:

SELECT
    DoctorID,
    FirstName,
    LastName,
    Specialization,
    ContactNumber
FROM
    Doctors
WHERE
    Specialization LIKE '%Endocrinologist%'; -- Finds doctors with 'Cardiology' in their specialization


