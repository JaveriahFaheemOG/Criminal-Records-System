Create Database Criminal_Record
use Criminal_Record


CREATE TABLE Adress(
	Address_ID INT PRIMARY KEY,
    Street VARCHAR(100),
    City VARCHAR(50),
    States VARCHAR(50),
    Postal_Code VARCHAR(10),
    Country VARCHAR(50)
);

CREATE TABLE Criminal (
    Criminal_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
	Alias VARCHAR(50),
    CNIC VARCHAR(20) UNIQUE,
    Date_of_Birth DATE,
    Phone_Number VARCHAR(20),
    Previous_Conviction TEXT,
	addresss_ID INT,
	FOREIGN KEY (addresss_ID) REFERENCES Adress(Address_ID),
	Crime_ID INT,
	FOREIGN KEY (Crime_ID) REFERENCES Crime(Crime_ID),
	Record_ID INT,
	FOREIGN KEY (Record_ID) REFERENCES Criminal_Record(Record_ID),
	File_IDs INT
	FOREIGN KEY (File_IDs) REFERENCES Case_File(File_IDs),
);

CREATE TABLE Victim (
    Victim_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    CNIC VARCHAR(20) UNIQUE,
    Date_of_Birth DATE,
    Relation_to_Criminal VARCHAR(50),
    Inquiry_Severity VARCHAR(50),
    Victim_Status VARCHAR(50),
    Emotional_Trauma TEXT,
    Contact INT,
    Statement_to_Police TEXT,
	addresss_ID INT,
	FOREIGN KEY (addresss_ID) REFERENCES Adress(Address_ID)
);
alter table victim
alter column Contact numeric(12);

CREATE TABLE Witnesss (
    Witness_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    CNIC VARCHAR(20) UNIQUE,
    Date_of_Birth DATE,
    Witness_Status VARCHAR(50),
    Emotional_Trauma VARCHAR(50),
    Contact_Details INT,
    Statement_to_Police TEXT,
	addresss_ID INT,
	FOREIGN KEY (addresss_ID) REFERENCES Adress(Address_ID)
);


alter table Witnesss
alter column Contact_Details numeric(12);

CREATE TABLE Crime (
    Crime_ID INT PRIMARY KEY,
    Description TEXT,
    Crime_Type VARCHAR(50),
    Date_of_Crime DATE,
    Location_of_Crime VARCHAR(255),
    Weapon_Used TEXT,
    Time_of_Crime_Reported DATETIME,
    Targeted_At TEXT,
    No_of_Witness INT
);

CREATE TABLE Arrest (
    Arrest_ID INT PRIMARY KEY,
    Arrest_Warrant_Description TEXT,
    Datetime_of_Arrest DATETIME,
    Location_of_Arrest VARCHAR(255),
	Criminal_ID INT,
	FOREIGN KEY (Criminal_ID) REFERENCES Criminal(Criminal_ID),
	Officer_ID INT,
	FOREIGN KEY (Officer_ID) REFERENCES Officer(Officer_ID)
);

CREATE TABLE Criminal_Record (
    Record_ID INT PRIMARY KEY,
    Statuss VARCHAR(50),
    Parole_Status VARCHAR(50),
    Probation_Status VARCHAR(50),
    Date_Recorded DATE,
    Date_List_Updated DATE,
    Habitual_Offender BIT DEFAULT 0,
    No_of_Previous_Convictions INT,
	Court_ID INT,
	FOREIGN KEY (Court_ID) REFERENCES Court(Court_ID)
);

CREATE TABLE Officer (
    Officer_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Badge_Number VARCHAR(20) UNIQUE,
    CNIC VARCHAR(20) UNIQUE,
    Ranks VARCHAR(50),
    Phone_Numbers TEXT,
    Specialization TEXT,
    Date_of_Birth DATE,
    Nationality VARCHAR(50),
	addresss_ID INT,
	FOREIGN KEY (addresss_ID) REFERENCES Adress(Address_ID),
	Agency_ID INT,
	FOREIGN KEY (Agency_ID) REFERENCES Law_Enforcement_Agency(Agency_ID)
);

CREATE TABLE Law_Enforcement_Agency (
    Agency_ID INT PRIMARY KEY,
    Agency_Type VARCHAR(50),
    Agency_Name VARCHAR(100),
    Contact_Number VARCHAR(20),
    Branches INT,
    Number_of_Officers INT,
    Chief_Officer VARCHAR(100)
);

CREATE TABLE Case_File (
    File_IDs INT PRIMARY KEY,
    Case_Number VARCHAR(50) UNIQUE,
    Case_Status VARCHAR(50),
    Date_Opened DATE,
    Date_Closed DATE,
    Final_Verdict TEXT,
    Attribute TEXT,
    Appeal_Status TEXT,
	Agency_ID INT,
	FOREIGN KEY (Agency_ID) REFERENCES Law_Enforcement_Agency(Agency_ID),
	Judge_ID INT,
	FOREIGN KEY (Judge_ID) REFERENCES Judge(Judge_ID)
);

CREATE TABLE Court (
    Court_ID INT PRIMARY KEY,
    Court_Type VARCHAR(50),
    Court_Level VARCHAR(50),
    Court_Name VARCHAR(100),
    Contact_Number VARCHAR(20),
    No_of_Judges INT,
);

SELECT CONSTRAINT_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'Court' AND COLUMN_NAME = 'Judge_ID';
select * from Judge;
ALTER TABLE Court
DROP CONSTRAINT FK__Court__Judge_ID__4AB81AF0;  -- Replace FK_Cart_ProductId with the actual name
alter table court
drop column judge_ID;
select * from Court;
delete from Court;

CREATE TABLE Judge (
    Judge_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    CNIC VARCHAR(20) UNIQUE,
    Qualification TEXT,
    Specialization TEXT,
    Contact_Details TEXT,
    Cases_Handled INT,
	Court_ID INT,
	FOREIGN KEY (Court_ID) REFERENCES Court(Court_ID)
);

CREATE TABLE Legal_Proceedings (
    Proceedings_ID INT PRIMARY KEY,
    Evidence_Presented TEXT,
    Hearing_Date DATE,
    Judgement TEXT,
    Sentence TEXT,
    Sentence_Length INT,
    Parole_Eligibility BIT DEFAULT 0,
    Date_of_Release DATE,
    Bail_Granted BIT DEFAULT 0,
	Court_ID INT,
	FOREIGN KEY (Court_ID) REFERENCES Court(Court_ID)
);

CREATE TABLE Parole_Release (
    Parole_ID INT PRIMARY KEY,
    Parole_Date DATE,
    Violations BIT DEFAULT 0,
    Terms_of_Parole TEXT,
    Parole_Eligibility TEXT,
    Parole_Status VARCHAR(50),
    Parole_Officer_Assigned VARCHAR(100),
    Final_Date_of_Release DATE,
	Proceedings_ID INT,
	FOREIGN KEY (Proceedings_ID) REFERENCES Legal_Proceedings(Proceedings_ID)
);

CREATE TABLE Crime_Victim (
    Crime_Victim_ID INT PRIMARY KEY, -- Unique ID for the record
    Crime_ID INT, -- Foreign key referencing the Crime table
    Victim_ID INT, -- Foreign key referencing the Victim table
    FOREIGN KEY (Crime_ID) REFERENCES Crime(Crime_ID),
    FOREIGN KEY (Victim_ID) REFERENCES Victim(Victim_ID),
	File_IDs INT,
	FOREIGN KEY (File_IDs) REFERENCES Case_File(File_IDs)
);

CREATE TABLE Crime_Witness (
    Crime_Witness_ID INT PRIMARY KEY, -- Unique identifier for the record
    Crime_ID INT, -- Foreign key referencing the Crime table
    Witness_ID INT, -- Foreign key referencing the Witness table
    FOREIGN KEY (Crime_ID) REFERENCES Crime(Crime_ID),
    FOREIGN KEY (Witness_ID) REFERENCES Witnesss(Witness_ID),
	File_IDs INT,
	FOREIGN KEY (File_IDs) REFERENCES Case_File(File_IDs)
);

-- Insert data into Address table id start from 1-40
INSERT INTO Adress (Address_ID, Street, City, States, Postal_Code, Country) VALUES
(1, 'Mall Road', 'Lahore', 'Punjab', '54000', 'Pakistan'),
(2, 'Clifton', 'Karachi', 'Sindh', '75600', 'Pakistan'),
(3, 'F-10 Markaz', 'Islamabad', 'Islamabad Capital Territory', '44000', 'Pakistan'),
(4, 'Satellite Town', 'Rawalpindi', 'Punjab', '46000', 'Pakistan'),
(5, 'University Road', 'Peshawar', 'Khyber Pakhtunkhwa', '25000', 'Pakistan'),
(6, 'Jinnah Road', 'Quetta', 'Balochistan', '87300', 'Pakistan'),
(7, 'Iqbal Town', 'Faisalabad', 'Punjab', '38000', 'Pakistan'),
(8, 'Gulistan-e-Johar', 'Karachi', 'Sindh', '75290', 'Pakistan'),
(9, 'Bahria Town', 'Rawalpindi', 'Punjab', '46000', 'Pakistan'),
(10, 'Main Boulevard', 'Lahore', 'Punjab', '54000', 'Pakistan'),
(11, 'Mall Road', 'Multan', 'Punjab', '60000', 'Pakistan'),
(12, 'GT Road', 'Gujranwala', 'Punjab', '52250', 'Pakistan'),
(13, 'Shahrah-e-Faisal', 'Karachi', 'Sindh', '75500', 'Pakistan'),
(14, 'Abbot Road', 'Lahore', 'Punjab', '54000', 'Pakistan'),
(15, 'Ring Road', 'Peshawar', 'Khyber Pakhtunkhwa', '25000', 'Pakistan');

INSERT INTO Adress (Address_ID, Street, City, States, Postal_Code, Country) VALUES
(16, 'Bazar Road', 'Hyderabad', 'Sindh', '71000', 'Pakistan'),
(17, 'Jinnah Avenue', 'Islamabad', 'Islamabad Capital Territory', '44000', 'Pakistan'),
(18, 'Chowk Yadgar', 'Peshawar', 'Khyber Pakhtunkhwa', '25000', 'Pakistan'),
(19, 'Mall Road', 'Sialkot', 'Punjab', '51310', 'Pakistan'),
(20, 'Cantt Area', 'Abbottabad', 'Khyber Pakhtunkhwa', '22010', 'Pakistan'),
(21, 'Railway Road', 'Gujrat', 'Punjab', '50700', 'Pakistan'),
(22, 'Airport Road', 'Quetta', 'Balochistan', '87300', 'Pakistan'),
(23, 'Circular Road', 'Bahawalpur', 'Punjab', '63100', 'Pakistan'),
(24, 'M.A. Jinnah Road', 'Sukkur', 'Sindh', '65200', 'Pakistan'),
(25, 'College Road', 'Mardan', 'Khyber Pakhtunkhwa', '23200', 'Pakistan');

INSERT INTO Adress (Address_ID, Street, City, States, Postal_Code, Country) VALUES
(26, '34-B Block C', 'Karachi', 'Sindh', '75000', 'Pakistan'),
(27, '56-C Shahrah-e-Faisal', 'Lahore', 'Punjab', '54000', 'Pakistan'),
(28, '19-A Ali Town', 'Islamabad', 'Islamabad Capital Territory', '44000', 'Pakistan'),
(29, '72-B Gulshan-e-Iqbal', 'Faisalabad', 'Punjab', '38000', 'Pakistan'),
(30, '9-2 Jinnah Road', 'Peshawar', 'Khyber Pakhtunkhwa', '25000', 'Pakistan'),
(31, '55-A Model Town', 'Rawalpindi', 'Punjab', '46000', 'Pakistan'),
(32, '87-B Sadiqabad', 'Multan', 'Punjab', '60000', 'Pakistan'),
(33, '12-F Liberty Market', 'Lahore', 'Punjab', '53000', 'Pakistan'),
(34, '10-D Jamshed Road', 'Karachi', 'Sindh', '74400', 'Pakistan'),
(35, '44-C Commercial Market', 'Gujranwala', 'Punjab', '52200', 'Pakistan');

INSERT INTO Adress (Address_ID, Street, City, States, Postal_Code, Country) VALUES
(36, 'Park Road', 'Karachi', 'Sindh', '74400', 'Pakistan'),
(37, 'Faisal Avenue', 'Islamabad', 'Islamabad Capital Territory', '44000', 'Pakistan'),
(38, 'Market Street', 'Lahore', 'Punjab', '54000', 'Pakistan'),
(39, 'Shahrah-e-Faisal', 'Karachi', 'Sindh', '75350', 'Pakistan'),
(40, 'DHA Phase 6', 'Lahore', 'Punjab', '54792', 'Pakistan');

-- Insert data into Victim table id start from 41-50 and address id 1-10
INSERT INTO Victim (Victim_ID, First_Name, Last_Name, CNIC, Date_of_Birth, Relation_to_Criminal, Inquiry_Severity, Victim_Status, Emotional_Trauma, Contact, Statement_to_Police, addresss_ID) VALUES
(41, 'Ayesha', 'Ali', '42201-1234567-2', '1995-07-11', 'Wife', 'High', 'Critical', 'Severe PTSD', 92300123456, 'Provided crucial details.', 1),
(42, 'Hamid', 'Raza', '61101-2234567-3', '1988-12-21', 'Brother', 'Moderate', 'Stable', 'Minor depression', 92302123456, 'Saw the suspect last.', 2),
(43, 'Kiran', 'Malik', '11101-3334567-4', '1990-03-15', 'Neighbor', 'High', 'Stable', 'Nightmares', 92303123456, 'Identified the criminal.', 3),
(44, 'Nadia', 'Khan', '52101-4434567-5', '1985-05-23', 'Friend', 'Critical', 'Deceased', 'N/A', 92304123456, 'No statement available.', 4),
(45, 'Hassan', 'Ahmed', '33101-5534567-6', '2000-01-30', 'Son', 'High', 'Stable', 'Mild anxiety', 92305123456, 'Confirmed details of crime.', 5),
(46, 'Zainab', 'Iqbal', '42101-6634567-7', '1997-09-19', 'Daughter', 'Moderate', 'Critical', 'Severe PTSD', 92306123456, 'Provided additional evidence.', 6),
(47, 'Umair', 'Shah', '61101-7734567-8', '1992-11-13', 'Business Partner', 'Low', 'Stable', 'No trauma', 92307123456, 'Had minimal interaction.', 7),
(48, 'Sara', 'Farooq', '51101-8834567-9', '1999-04-17', 'Colleague', 'Moderate', 'Critical', 'Acute stress', 92308123456, 'Helped confirm identity.', 8),
(49, 'Kamran', 'Naeem', '31101-9934567-1', '1993-02-22', 'Friend', 'Low', 'Stable', 'None', 92309123456, 'Offered support.', 9),
(50, 'Mina', 'Kashif', '13101-1034567-2', '1990-08-01', 'Spouse', 'High', 'Critical', 'Depression', 92310123456, 'Identified suspect.', 10);

-- Insert data into Witnesss table id start from 51-60 and address id 11-20
INSERT INTO Witnesss (Witness_ID, First_Name, Last_Name, CNIC, Date_of_Birth, Witness_Status, Emotional_Trauma, Contact_Details, Statement_to_Police, addresss_ID) VALUES
(51, 'Ahmed', 'Raza', '61101-1234567-3', '1985-08-17', 'Active', 'None', 923111112345, 'Saw the suspect fleeing.', 11),
(52, 'Hafeez', 'Khan', '42101-2234567-4', '1990-04-10', 'Inactive', 'None', 923122212345, 'Provided historical details.', 12),
(53, 'Mehmood', 'Ali', '11101-3334567-5', '1978-11-09', 'Critical', 'Moderate', 923133312345, 'Recognized the weapon.', 13),
(54, 'Usman', 'Malik', '33101-4434567-6', '1982-06-30', 'Active', 'None', 923144412345, 'Provided an eyewitness account.', 14),
(55, 'Javed', 'Iqbal', '52101-5534567-7', '1995-01-12', 'Critical', 'Severe', 923155512345, 'Identified the suspect.', 15),
(56, 'Hassan', 'Farooq', '42101-6634567-8', '1992-09-27', 'Inactive', 'Mild', 923166612345, 'Confirmed the time of crime.', 16),
(57, 'Bilal', 'Shah', '61101-7734567-9', '1989-03-15', 'Active', 'None', 923177712345, 'Recognized the vehicle.', 17),
(58, 'Kamran', 'Naeem', '51101-8834567-1', '1987-12-22', 'Critical', 'Mild', 923188812345, 'Noticed unusual activity.', 18),
(59, 'Muneeb', 'Hassan', '31101-9934567-2', '1991-05-06', 'Inactive', 'None', 923199912345, 'Offered secondary evidence.', 19),
(60, 'Irfan', 'Kashif', '13101-1034567-3', '1983-02-03', 'Active', 'None', 923200012345, 'Helped identify additional details.', 20);

-- Insert data into Crime table id start from 61-70 
INSERT INTO Crime (Crime_ID, Description, Crime_Type, Date_of_Crime, Location_of_Crime, Weapon_Used, Time_of_Crime_Reported, Targeted_At, No_of_Witness) VALUES
(61, 'A bank robbery was reported in the city center.', 'Robbery', '2024-01-12', 'Jinnah Avenue, Islamabad', 'Firearms', '2024-01-12 14:30:00', 'Bank employees', 3),
(62, 'A vehicle hijacking occurred near a busy intersection.', 'Hijacking', '2024-02-05', 'Mall Road, Lahore', 'Knives', '2024-02-05 20:45:00', 'A family returning home', 2),
(63, 'A domestic dispute escalated into a violent altercation.', 'Assault', '2024-03-22', 'Golimar, Karachi', 'Blunt object', '2024-03-22 10:15:00', 'Spouse', 1),
(64, 'A political gathering was attacked by unknown assailants.', 'Terrorism', '2024-04-18', 'Karkhano Market, Peshawar', 'Explosives', '2024-04-18 17:00:00', 'Attendees at a rally', 12),
(65, 'A targeted killing was reported in a residential area.', 'Murder', '2024-05-30', 'Satellite Town, Quetta', 'Pistol', '2024-05-30 22:20:00', 'A local businessman', 0),
(66, 'A shoplifting incident occurred at a local store.', 'Theft', '2024-06-11', 'Main Market, Sialkot', 'None', '2024-06-11 12:50:00', 'Store owner', 4),
(67, 'An arson case involving a warehouse was reported.', 'Arson', '2024-07-04', 'Industrial Area, Faisalabad', 'Gasoline', '2024-07-04 03:30:00', 'Warehouse property', 5),
(68, 'A cybercrime case was filed for fraudulent transactions.', 'Cybercrime', '2024-08-15', 'Clifton, Karachi', 'Computer', '2024-08-15 11:00:00', 'Online shoppers', 0),
(69, 'A street fight broke out between rival gangs.', 'Public Disturbance', '2024-09-09', 'Railway Road, Gujranwala', 'Iron rods', '2024-09-09 19:40:00', 'Bystanders', 7),
(70, 'A kidnapping case was reported involving a child.', 'Kidnapping', '2024-10-21', 'Gulberg, Lahore', 'Rope', '2024-10-21 15:10:00', 'A young boy', 2);

UPDATE Crime
SET Location_of_Crime = 
    CASE 
        WHEN Location_of_Crime LIKE '%Islamabad%' THEN 'Islamabad'
        WHEN Location_of_Crime LIKE '%Lahore%' THEN 'Lahore'
        WHEN Location_of_Crime LIKE '%Karachi%' THEN 'Karachi'
        WHEN Location_of_Crime LIKE '%Peshawar%' THEN 'Peshawar'
        WHEN Location_of_Crime LIKE '%Quetta%' THEN 'Quetta'
        WHEN Location_of_Crime LIKE '%Sialkot%' THEN 'Sialkot'
        WHEN Location_of_Crime LIKE '%Faisalabad%' THEN 'Faisalabad'
        WHEN Location_of_Crime LIKE '%Gujranwala%' THEN 'Gujranwala'
        ELSE Location_of_Crime -- For any city not listed explicitly
    END;

-- Insert data into judge table id start from 71-80
INSERT INTO Judge (Judge_ID, First_Name, Last_Name, CNIC, Qualification, Specialization, Contact_Details, Cases_Handled,Court_ID) VALUES
(71, 'Asghar', 'Ali', '42101-1234567-1', 'LLB, LLM', 'Criminal Law', '923111112345', 125,81),
(72, 'Farooq', 'Hassan', '61101-2234567-2', 'LLB, LLM', 'Family Law', '923122212345', 98,82),
(73, 'Naeem', 'Iqbal', '32101-3334567-3', 'LLB', 'Corporate Law', '923133312345', 76,83),
(74, 'Irfan', 'Raza', '42101-4434567-4', 'LLB, PhD', 'Human Rights', '923144412345', 134,84),
(75, 'Hameed', 'Shah', '52101-5534567-5', 'LLB, LLM', 'Constitutional Law', '923155512345', 105,85),
(76, 'Shahid', 'Kamal', '31101-6634567-6', 'LLB', 'Environmental Law', '923166612345', 65,86),
(77, 'Kamran', 'Javed', '61101-7734567-7', 'LLB, LLM', 'International Law', '923177712345', 88,87),
(78, 'Rizwan', 'Haq', '51101-8834567-8', 'LLB', 'Civil Law', '923188812345', 142,88),
(79, 'Tariq', 'Zafar', '11101-9934567-9', 'LLB', 'Tax Law', '923199912345', 72,89),
(80, 'Fahad', 'Malik', '13101-1034567-0', 'LLB, LLM', 'Criminal Law', '923200012345', 119,90);

-- Insert data into court table id start from 81-90
INSERT INTO Court (Court_ID, Court_Type, Court_Level, Court_Name, Contact_Number, No_of_Judges) VALUES
(81, 'Civil Court', 'District', 'District Court Islamabad', '051-1234567', 15),
(82, 'Criminal Court', 'District', 'District Court Lahore', '042-2345678', 12),
(83, 'Family Court', 'District', 'Family Court Karachi', '021-3456789', 10),
(84, 'High Court', 'Provincial', 'Sindh High Court', '021-4567890', 40),
(85, 'Tax Court', 'Specialized', 'Federal Tax Tribunal Islamabad', '051-5678901', 8),
(86, 'Environmental Court', 'Specialized', 'Punjab Environmental Tribunal', '042-6789012', 6),
(87, 'Supreme Court', 'Federal', 'Supreme Court of Pakistan', '051-7890123', 20),
(88, 'Customs Court', 'Specialized', 'Customs Tribunal Karachi', '021-8901234', 5),
(89, 'Labour Court', 'District', 'Labour Court Multan', '061-9012345', 8),
(90, 'Anti-Terrorism Court', 'Specialized', 'Anti-Terrorism Court Rawalpindi', '051-0123456', 7);

-- Insert data into Legal_Proceedings table id start from 91-100
INSERT INTO Legal_Proceedings (Proceedings_ID, Evidence_Presented, Hearing_Date, Judgement, Sentence, Sentence_Length, Parole_Eligibility, Date_of_Release, Bail_Granted, Court_ID) VALUES
(91, 'Witness testimony, fingerprints, CCTV footage', '2024-01-15', 'Guilty', 'Imprisonment', 5, 1, '2029-01-15', 0, 81),
(92, 'Forensic evidence, witness statements', '2024-02-10', 'Not Guilty', 'None', 0, 1, NULL, 1, 82),
(93, 'DNA evidence, confession', '2024-03-20', 'Guilty', 'Death Sentence', 0, 0, NULL, 0, 83),
(94, 'Photographs, alibi evidence', '2024-04-25', 'Guilty', 'Imprisonment', 10, 1, '2034-04-25', 0, 84),
(95, 'Electronic records, witness testimony', '2024-05-18', 'Not Guilty', 'None', 0, 1, NULL, 1, 85),
(96, 'Surveillance video, fingerprints', '2024-06-12', 'Guilty', 'Imprisonment', 8, 0, '2032-06-12', 1, 86),
(97, 'Confession, circumstantial evidence', '2024-07-07', 'Guilty', 'Imprisonment', 6, 0, '2030-07-07', 1, 87),
(98, 'Eyewitnesses, forensic evidence', '2024-08-30', 'Guilty', 'Imprisonment', 4, 1, '2028-08-30', 1, 88),
(99, 'Video footage, electronic records', '2024-09-15', 'Not Guilty', 'None', 0, 1, NULL, 1, 89),
(100, 'DNA samples, fingerprints', '2024-10-10', 'Guilty', 'Imprisonment', 7, 0, '2031-10-10', 0, 90);

-- Insert data into Parole_Release table id start from 101-110
INSERT INTO Parole_Release (Parole_ID, Parole_Date, Violations, Terms_of_Parole, Parole_Eligibility, Parole_Status, Parole_Officer_Assigned, Final_Date_of_Release, Proceedings_ID) VALUES
(101, '2024-11-01', 0, 'Report to parole officer every month, avoid criminal activities', 'Eligible', 'Active', 'John Smith', '2029-11-01', 91),
(102, '2024-12-05', 1, 'Stay within jurisdiction, regular drug tests', 'Eligible', 'Violated terms', 'Sarah Khan', '2028-12-05', 92),
(103, '2025-01-10', 0, 'Complete community service, no alcohol consumption', 'Eligible', 'Active', 'Ali Raza', '2030-01-10', 93),
(104, '2025-02-15', 0, 'Regular counseling, avoid contact with known criminals', 'Eligible', 'Active', 'Bilal Shah', '2031-02-15', 94),
(105, '2025-03-22', 0, 'House arrest for 6 months, weekly check-ins', 'Eligible', 'Active', 'Nina Zafar', '2032-03-22', 95),
(106, '2025-04-30', 1, 'No contact with victims, attend anger management sessions', 'Eligible', 'Violated terms', 'Rashid Farooq', '2030-04-30', 96),
(107, '2025-05-25', 0, 'No contact with co-defendants, report any legal issues', 'Eligible', 'Active', 'Sana Mir', '2032-05-25', 97),
(108, '2025-06-18', 0, 'Complete vocational training, no alcohol or drug use', 'Eligible', 'Active', 'Qasim Ali', '2031-06-18', 98),
(109, '2025-07-05', 0, 'Stay in contact with parole officer, refrain from criminal environments', 'Eligible', 'Active', 'Khalid Javed', '2030-07-05', 99),
(110, '2025-08-20', 0, 'Complete education program, avoid violent situations', 'Eligible', 'Active', 'Tariq Malik', '2032-08-20', 100);

-- Insert data into Criminal_Record table id start from 111-120
INSERT INTO Criminal_Record (Record_ID, Statuss, Parole_Status, Probation_Status, Date_Recorded, Date_List_Updated, Habitual_Offender, No_of_Previous_Convictions, Court_ID) VALUES
(111, 'Active', 'Granted', 'Under Probation', '2024-01-15', '2024-01-20', 0, 2, 81),
(112, 'Inactive', 'Denied', 'Not Applicable', '2024-02-10', '2024-02-15', 1, 0, 82),
(113, 'Active', 'Granted', 'Under Probation', '2024-03-05', '2024-03-10', 0, 1, 83),
(114, 'Inactive', 'Denied', 'Not Applicable', '2024-04-01', '2024-04-05', 1, 3, 84),
(115, 'Active', 'Granted', 'Under Probation', '2024-05-20', '2024-05-25', 0, 0, 85),
(116, 'Inactive', 'Granted', 'Under Probation', '2024-06-10', '2024-06-15', 0, 2, 86),
(117, 'Active', 'Granted', 'Under Probation', '2024-07-22', '2024-07-25', 1, 4, 87),
(118, 'Inactive', 'Denied', 'Not Applicable', '2024-08-13', '2024-08-18', 0, 1, 88),
(119, 'Active', 'Granted', 'Under Probation', '2024-09-05', '2024-09-10', 0, 0, 89),
(120, 'Inactive', 'Denied', 'Not Applicable', '2024-10-10', '2024-10-15', 1, 5, 90);

-- Insert data into Law_Enforcement_Agency table id start from 121-130
INSERT INTO Law_Enforcement_Agency (Agency_ID, Agency_Type, Agency_Name, Contact_Number, Branches, Number_of_Officers, Chief_Officer) VALUES
(121, 'Police', 'Punjab Police', '042-111-222222', 20, 15000, 'Shahid Mehmood'),
(122, 'Police', 'Sindh Police', '021-111-333333', 25, 12000, 'Ali Raza'),
(123, 'Federal', 'FIA (Federal Investigation Agency)', '051-111-444444', 10, 8000, 'Imran Khan'),
(124, 'Police', 'KPK Police', '091-111-555555', 15, 10000, 'Asad Umar'),
(125, 'Paramilitary', 'Rangers', '021-111-666666', 5, 5000, 'Samiullah Khan'),
(126, 'Police', 'Balochistan Police', '081-111-777777', 8, 3000, 'Fazal Ur Rehman'),
(127, 'Special', 'Anti-Narcotics Force', '051-111-888888', 3, 2500, 'Raza Abbas'),
(128, 'Police', 'Islamabad Police', '051-111-999999', 7, 6000, 'Sanaullah Khan'),
(129, 'Federal', 'Customs Enforcement', '021-111-000000', 4, 3500, 'Kashif Ali'),
(130, 'Police', 'Azad Jammu and Kashmir Police', '05822-111111', 2, 2000, 'Zahid Khan');

-- Insert data into Case_File table id start from 131-140
INSERT INTO Case_File (File_IDs, Case_Number, Case_Status, Date_Opened, Date_Closed, Final_Verdict, Attribute, Appeal_Status, Agency_ID, Judge_ID) VALUES
(131, 'CF12345', 'Open', '2024-01-15', NULL, 'Pending', 'Robbery', 'Not appealed', 121, 71),
(132, 'CF12346', 'Closed', '2024-02-10', '2024-03-01', 'Guilty', 'Homicide', 'Appealed', 122, 72),
(133, 'CF12347', 'Open', '2024-03-05', NULL, 'Pending', 'Drug trafficking', 'Not appealed', 123, 73),
(134, 'CF12348', 'Closed', '2024-04-01', '2024-04-15', 'Not guilty', 'Assault', 'Not appealed', 124, 74),
(135, 'CF12349', 'Open', '2024-05-02', NULL, 'Pending', 'Theft', 'Not appealed', 125, 75),
(136, 'CF12350', 'Closed', '2024-06-12', '2024-06-25', 'Guilty', 'Fraud', 'Not appealed', 126, 76),
(137, 'CF12351', 'Open', '2024-07-20', NULL, 'Pending', 'Bribery', 'Appealed', 127, 77),
(138, 'CF12352', 'Closed', '2024-08-18', '2024-09-05', 'Guilty', 'Corruption', 'Not appealed', 128, 78),
(139, 'CF12353', 'Open', '2024-09-25', NULL, 'Pending', 'Kidnapping', 'Appealed', 129, 79),
(140, 'CF12354', 'Closed', '2024-10-30', '2024-11-10', 'Acquitted', 'Murder', 'Not appealed', 130, 80);

-- Insert data into Officer table id start from 141-150 ADDress id  21-30
INSERT INTO Officer (Officer_ID, First_Name, Last_Name, Badge_Number, CNIC, Ranks, Phone_Numbers, Specialization, Date_of_Birth, Nationality, addresss_ID, Agency_ID) VALUES
(141, 'Ali', 'Shah', 'B12345', '61101-1122334-1', 'Inspector', '923112345678', 'Criminal Investigation', '1985-03-15', 'Pakistani', 21, 121),
(142, 'Hassan', 'Khan', 'B12346', '42101-1122335-2', 'Sub Inspector', '923122345678', 'Anti-Terrorism', '1990-05-20', 'Pakistani', 22, 122),
(143, 'Ahmed', 'Raza', 'B12347', '11101-1122336-3', 'Constable', '923133345678', 'Traffic Control', '1992-08-25', 'Pakistani', 23, 123),
(144, 'Muneeb', 'Hassan', 'B12348', '52101-1122337-4', 'Assistant Sub Inspector', '923144456789', 'Forensic Analysis', '1988-01-30', 'Pakistani', 24, 124),
(145, 'Javed', 'Iqbal', 'B12349', '61101-1122338-5', 'Inspector', '923155567890', 'Cyber Crime', '1986-09-14', 'Pakistani', 25, 125),
(146, 'Usman', 'Ali', 'B12350', '42101-1122339-6', 'Sub Inspector', '923166678901', 'Homicide Investigation', '1989-04-09', 'Pakistani', 26, 126),
(147, 'Kamran', 'Shah', 'B12351', '11101-1122340-7', 'Constable', '923177789012', 'Public Safety', '1993-07-22', 'Pakistani', 27, 127),
(148, 'Bilal', 'Khan', 'B12352', '52101-1122341-8', 'Assistant Sub Inspector', '923188890123', 'Narcotics Control', '1991-12-05', 'Pakistani', 28, 128),
(149, 'Tariq', 'Malik', 'B12353', '61101-1122342-9', 'Inspector', '923199901234', 'Counter-Terrorism', '1984-02-18', 'Pakistani', 29, 129),
(150, 'Irfan', 'Farooq', 'B12354', '42101-1122343-0', 'Sub Inspector', '923200012345', 'Criminal Intelligence', '1990-06-30', 'Pakistani', 30, 130);

-- Insert data into Criminal table id start from 151-160 adddress 31-40
INSERT INTO Criminal (Criminal_ID, First_Name, Last_Name, Alias, CNIC, Date_of_Birth, Phone_Number, Previous_Conviction, addresss_ID, Crime_ID, Record_ID, File_IDs) VALUES
(151, 'Sohail', 'Khan', 'Shani', '61101-4567890-1', '1985-05-15', '923100112345', 'Theft', 31, 61, 111, 131),
(152, 'Nashit', 'Ali', 'Nash', '42101-5678901-2', '1990-02-20', '923100223456', 'Assault', 32, 62, 112, 132),
(153, 'Amir', 'Siddiqui', 'Siddy', '11101-6789012-3', '1982-07-30', '923100334567', 'Fraud', 33, 63, 113, 133),
(154, 'Shahbaz', 'Ahmed', 'Shah', '52101-7890123-4', '1987-01-18', '923100445678', 'Robbery', 34, 64, 114, 134),
(155, 'Zeeshan', 'Iqbal', 'Zee', '43101-8901234-5', '1993-11-07', '923100556789', 'Arson', 35, 65, 115, 135),
(156, 'Tariq', 'Javed', 'Tariq Bhai', '61101-9012345-6', '1980-12-02', '923100667890', 'Kidnapping', 36, 66, 116, 136),
(157, 'Bilal', 'Shah', 'Billa', '42101-0123456-7', '1995-09-15', '923100778901', 'Smuggling', 37, 67, 117, 137),
(158, 'Hamza', 'Nawaz', 'Hami', '53101-1234567-8', '1990-03-03', '923100889012', 'Drug Trafficking', 38, 68, 118, 138),
(159, 'Yasir', 'Farooq', 'Yas', '42101-2345678-9', '1988-06-25', '923100990123', 'Murder', 39, 69, 119, 139),
(160, 'Kashif', 'Raza', 'Kashi', '61101-3456789-0', '1992-08-11', '923101100234', 'Theft', 40, 70, 120, 140);

-- Insert data into Arrest table id start from 161-170
INSERT INTO Arrest (Arrest_ID, Arrest_Warrant_Description, Datetime_of_Arrest, Location_of_Arrest, Criminal_ID, Officer_ID) VALUES
(161, 'Warrant issued for bank robbery suspect', '2024-01-14 09:30:00', 'Jinnah Avenue, Islamabad', 151, 141),
(162, 'Arrested for a domestic violence case', '2024-02-07 14:20:00', 'Mall Road, Lahore', 152, 142),
(163, 'Warrant for vehicle hijacking suspect', '2024-03-12 18:45:00', 'Golimar, Karachi', 153, 143),
(164, 'Suspect involved in political terrorism', '2024-04-20 11:10:00', 'Karkhano Market, Peshawar', 154, 144),
(165, 'Arrested for the murder of a businessman', '2024-05-25 23:00:00', 'Satellite Town, Quetta', 155, 145),
(166, 'Shoplifting incident suspect', '2024-06-13 15:30:00', 'Main Market, Sialkot', 156, 146),
(167, 'Arson suspect arrested in warehouse fire', '2024-07-05 02:00:00', 'Industrial Area, Faisalabad', 157, 147),
(168, 'Cybercrime suspect arrested for fraud', '2024-08-16 10:00:00', 'Clifton, Karachi', 158, 148),
(169, 'Gang fight participant arrested', '2024-09-10 19:00:00', 'Railway Road, Gujranwala', 159, 149),
(170, 'Kidnapping case, suspect arrested', '2024-10-23 14:30:00', 'Gulberg, Lahore', 160, 150);

-- Insert data into Arrest table id start from 171-180
INSERT INTO Crime_Victim (Crime_Victim_ID, Crime_ID, Victim_ID, File_IDs) VALUES
(171, 61, 41, 131),
(172, 62, 42, 132),
(173, 63, 43, 133),
(174, 64, 44, 134),
(175, 65, 45, 135),
(176, 66, 46, 136),
(177, 67, 47, 137),
(178, 68, 48, 138),
(179, 69, 49, 139),
(180, 70, 50, 140);

-- Insert data into Crime_Witness table id start from 181-190
INSERT INTO Crime_Witness (Crime_Witness_ID, Crime_ID, Witness_ID, File_IDs) VALUES
(181, 61, 51, 131),
(182, 62, 52, 132),
(183, 63, 53, 133),
(184, 64, 54, 134),
(185, 65, 55, 135),
(186, 66, 56, 136),
(187, 67, 57, 137),
(188, 68, 58, 138),
(189, 69, 59, 139),
(190, 70, 60, 140);

--1. List all criminals and their associated addresses.--
SELECT Criminal_ID, First_Name, Last_Name, a.Street, a.City, a.Country
FROM Criminal
JOIN Adress a ON Criminal.addresss_ID = a.Address_ID;

--2. Count the number of crimes committed in each city.
SELECT a.City, COUNT(cr.Crime_ID) AS Crime_Count
FROM Crime cr
JOIN Adress a ON cr.Location_of_Crime = a.City
GROUP BY a.City
ORDER BY Crime_Count DESC;

--3. Find victims who have reported severe trauma.
SELECT Victim_ID, First_Name, Last_Name, Emotional_Trauma
FROM Victim
WHERE Emotional_Trauma LIKE '%severe%';

--4. List all crimes reported with more than 3 witnesses.
SELECT Crime_ID, Crime_Type, Description, No_of_Witness
FROM Crime
WHERE No_of_Witness > 3;

--5. Find the top 5 crimes based on the number of witnesses.
SELECT top 5 Crime_ID, Crime_Type, No_of_Witness
FROM Crime
ORDER BY No_of_Witness DESC;

--6. Get the total number of arrests made for each crime type.
SELECT cr.Crime_Type, COUNT(ar.Arrest_ID) AS Arrest_Count
FROM Crime cr
JOIN Criminal c ON cr.Crime_ID = c.Crime_ID
JOIN Arrest ar ON c.Criminal_ID = ar.Criminal_ID
GROUP BY cr.Crime_Type;

--7. Retrieve all witnesses who belong to a specific province.
SELECT w.Witness_ID, w.First_Name, w.Last_Name, a.States
FROM Witnesss w
JOIN Adress a ON w.addresss_ID = a.Address_ID
WHERE a.States = 'Punjab'; 

--8. List criminals with tgheir previos  convictions.
SELECT Criminal_ID, First_Name, Last_Name, Previous_Conviction
FROM Criminal 
WHERE Previous_Conviction IS NOT NULL;

--9. Identify the most common type of crime committed.
SELECT top 1 Crime_Type, COUNT(Crime_ID) AS Crime_Count
FROM Crime
GROUP BY Crime_Type
ORDER BY Crime_Count DESC;

--10. Identify the crime which has no witness.
SELECT Crime_Type, Crime_ID
FROM Crime
WHERE No_of_Witness = 0;

--11. Find the age of all victims of today.
SELECT Victim_ID, First_Name, Last_Name, FLOOR(DATEDIFF(DAY, Date_of_Birth, GETDATE()) / 365) AS Age
FROM Victim;

--12. Retrieve all criminal records with associated crime and case file information.
SELECT c.Criminal_ID, c.First_Name, cr.Crime_Type, cf.File_IDs
FROM Criminal c
JOIN Crime cr ON c.Crime_ID = cr.Crime_ID
JOIN Case_File cf ON c.File_IDs = cf.File_IDs;

--13. List all crimes that occurred after a specific date.
SELECT Crime_ID, Crime_Type, Date_of_Crime
FROM Crime
WHERE Date_of_Crime > '2024-01-01';

--14. Find the total number of victims and witnesses in the database.
SELECT 
(SELECT COUNT(*) FROM Victim) AS Total_Victims,
(SELECT COUNT(*) FROM Witnesss) AS Total_Witnesses;

--15. List all arrests along with their corresponding crimes and judgments.
SELECT ar.Arrest_ID, cr.Crime_Type, lg.Judgement,cr.Description
FROM Arrest ar
JOIN Criminal c ON ar.Criminal_ID = c.Criminal_ID
JOIN Crime cr ON c.Crime_ID = cr.Crime_ID
JOIN Criminal_Record cre on cre.Record_ID=c.Record_ID
JOIN Court cor ON cor.Court_ID=cre.Court_ID
JOIN Legal_Proceedings lg ON lg.Court_ID=cor.Court_ID;

--16. Get the total number of criminals linked to each crime type.
SELECT cr.Crime_Type, COUNT(c.Criminal_ID) AS Criminal_Count
FROM Crime cr
JOIN Criminal c ON cr.Crime_ID = c.Crime_ID
GROUP BY cr.Crime_Type;

--17. Find the address details of all witnesses who reported trauma.
SELECT w.Witness_ID, w.First_Name, w.Emotional_Trauma, a.Street, a.City, a.Country
FROM Witnesss w
JOIN Adress a ON w.addresss_ID = a.Address_ID
WHERE w.Emotional_Trauma IS NOT NULL;

--18. Retrieve the youngest victim and their details.
SELECT top 1 Victim_ID, First_Name, Last_Name, Date_of_Birth
FROM Victim
ORDER BY Date_of_Birth DESC;

--19. List all criminals and their corresponding victims.
SELECT Criminal_ID, concat(c.First_Name,' ', c.Last_Name) AS Criminal_Name, concat(v.First_Name,' ',v.Last_Name) AS Victim_Name
FROM Criminal c
JOIN Crime_Victim cv ON c.Crime_ID = cv.Crime_ID
join Victim v on v.Victim_ID = cv.Victim_ID;

--20. Count the number of crimes reported per year.
SELECT YEAR(Date_of_Crime) AS Crime_Year, COUNT(Crime_ID) AS Total_Crimes
FROM Crime
GROUP BY YEAR(Date_of_Crime)
ORDER BY Crime_Year DESC;

--21. Find crimes involving a specific weapon.
SELECT c.Crime_ID, c.Description, c.Crime_Type, c.Weapon_Used
FROM Crime c
where CONVERT(VARCHAR(MAX), c.Weapon_Used) = 'Explosives';

--22. Retrieve detailed information about crimes, criminals, victims, witnesses, and their addresses.
SELECT 
    cr.Crime_ID, cr.Crime_Type, cr.Description, 
    c.Criminal_ID, c.First_Name AS Criminal_Name, 
    v.Victim_ID, v.First_Name AS Victim_Name, 
	 w.Witness_ID, w.First_Name AS Witness_Name,
    a.City, a.Street
FROM Crime cr
JOIN Criminal c ON cr.Crime_ID = c.Crime_ID
JOIN Crime_Victim cv ON cv.Crime_ID=c.Crime_ID
JOIN Victim v ON v.Victim_ID=cv.Victim_ID
JOIN Crime_Witness cw ON cw.Crime_ID=c.Crime_ID
JOIN Witnesss w ON w.Witness_ID=cw.Witness_ID
JOIN Adress a ON a.Address_ID=c.addresss_ID;

--23. List all arrests, related crimes, criminals, and their case files.
SELECT 
    ar.Arrest_ID, 
    cr.Crime_ID, cr.Crime_Type, cr.Description, 
    c.Criminal_ID, c.First_Name AS Criminal_Name, 
    cf.File_IDs
FROM Arrest ar
JOIN Criminal c ON c.Criminal_ID=ar.Criminal_ID
JOIN Crime cr ON cr.Crime_ID=c.Crime_ID
JOIN Case_File cf ON cf.File_IDs=c.File_IDs;

--24. Find the number of criminals per city involved in each type of crime.
SELECT 
    a.City, cr.Crime_Type, COUNT(c.Criminal_ID) AS Criminal_Count
FROM Criminal c
JOIN Adress a ON c.addresss_ID = a.Address_ID
JOIN Crime cr ON c.Crime_ID = cr.Crime_ID
JOIN Criminal_Record r ON c.Record_ID = r.Record_ID
GROUP BY a.City, cr.Crime_Type
ORDER BY Criminal_Count DESC;

--25. Get details of all witnesses who testified in cases involving specific criminals.
SELECT 
    w.Witness_ID, w.First_Name AS Witness_Name, 
    c.Criminal_ID, c.First_Name AS Criminal_Name, 
    cr.Crime_Type, a.City AS Witness_City
FROM Witnesss w
JOIN Crime_Witness cw ON cw.Witness_ID=w.Witness_ID
JOIN Crime cr ON cr.Crime_ID=cw.Crime_ID
JOIN Criminal c ON c.Crime_ID=cr.Crime_ID
JOIN Adress a ON a.Address_ID=c.addresss_ID
WHERE c.Criminal_ID IN (151, 152);

--26. List all crimes, their associated criminals, victims, and addresses, including witness count.
SELECT 
    cr.Crime_ID, cr.Crime_Type, cr.Description, cr.No_of_Witness,
    c.Criminal_ID, c.First_Name AS Criminal_Name, 
    v.Victim_ID, v.First_Name AS Victim_Name,
    a.City, a.Street
FROM Crime cr
JOIN Criminal c ON cr.Crime_ID = c.Crime_ID
JOIN Crime_Victim cv ON cv.Crime_ID=c.Crime_ID
JOIN Victim v ON v.Victim_ID=cv.Victim_ID
JOIN Adress a ON a.Address_ID=v.addresss_ID
;

--27. Find criminals involved in crimes with severe inquiry and the witnesses who testified.
SELECT 
    c.Criminal_ID, c.First_Name AS Criminal_Name, 
    cr.Crime_Type, v.Inquiry_Severity, 
    w.Witness_ID, w.First_Name AS Witness_Name
FROM Criminal c
JOIN Crime cr ON c.Crime_ID = cr.Crime_ID
JOIN Crime_Victim cv ON cv.Crime_ID=cr.Crime_ID
JOIN Victim v ON v.Victim_ID=cv.Victim_ID
JOIN Adress a ON a.Address_ID= v.addresss_ID
JOIN Crime_Witness cw ON cw.Crime_ID=cr.Crime_ID
JOIN Witnesss w ON w.Witness_ID=cw.Witness_ID
WHERE v.Inquiry_Severity = 'Critical';

--28. Retrieve all criminal records linked to crimes with specific victims and case files.
SELECT 
    r.Record_ID, r.Parole_Status, 
    c.Criminal_ID, c.First_Name AS Criminal_Name, 
    cr.Crime_ID, cr.Crime_Type, 
    v.Victim_ID, v.First_Name AS Victim_Name, 
    cf.File_IDs
FROM Criminal_Record r
JOIN Criminal c ON r.Record_ID = c.Record_ID
JOIN Crime cr ON c.Crime_ID = cr.Crime_ID
JOIN Crime_Victim cv ON cv.Crime_ID=cr.Crime_ID
JOIN Victim v ON v.Victim_ID=cv.Victim_ID
JOIN Case_File cf ON c.File_IDs = cf.File_IDs;

--29. Find victims and witnesses connected to criminals from a specific city.
SELECT 
    v.Victim_ID, v.First_Name AS Victim_Name, 
	w.Witness_ID, w.First_Name AS Witness_Name, 
	c.Criminal_ID, c.First_Name AS Criminal_Name, 
    a.States AS Criminal_City
FROM Victim v
JOIN Adress a ON v.addresss_ID = a.Address_ID
JOIN Crime_Victim cv ON cv.Victim_ID=v.Victim_ID
JOIN Criminal c ON c.Crime_ID=cv.Crime_ID
JOIN Crime_Witness cw ON cw.Crime_ID=c.Crime_ID
JOIN Witnesss w ON w.Witness_ID=cw.Witness_ID
WHERE a.States = 'Punjab'; 
