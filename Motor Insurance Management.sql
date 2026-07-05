create database motor_insurance;
use motor_insurance;
 -- / Customer
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Gender VARCHAR(10),
    DOB DATE,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Pincode VARCHAR(10)
);
-- /Agent
CREATE TABLE Agent (
    Agent_ID INT PRIMARY KEY AUTO_INCREMENT,
    Agent_Name VARCHAR(100),
    Gender VARCHAR(10),
    DOB DATE,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(200),
    Branch_ID INT,
    Joining_Date DATE,
    Commission DECIMAL(10,2),
    Experience_Years INT,
    Status VARCHAR(20)
);
 -- /Branch
CREATE TABLE Branch (
    Branch_ID INT PRIMARY KEY AUTO_INCREMENT,
    Branch_Name VARCHAR(100),
    Manager_Name VARCHAR(100),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Pincode VARCHAR(10),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Opening_Date DATE,
    Status VARCHAR(20)
);
-- / Vehicle_Type
CREATE TABLE Vehicle_Type (
    VehicleType_ID INT PRIMARY KEY AUTO_INCREMENT,
    Vehicle_Type VARCHAR(50),
    Fuel_Type VARCHAR(30),
    Seating_Capacity INT,
    Wheels INT,
    Commercial_Use VARCHAR(20),
    Description VARCHAR(200),
    Status VARCHAR(20)
);
-- /Vehicle
CREATE TABLE Vehicle (
    Vehicle_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    VehicleType_ID INT,
    Registration_No VARCHAR(30),
    Brand VARCHAR(50),
    Model VARCHAR(50),
    Manufacture_Year YEAR,
    Engine_No VARCHAR(50),
    Chassis_No VARCHAR(50),
    Color VARCHAR(30),
    FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY(VehicleType_ID) REFERENCES Vehicle_Type(VehicleType_ID)
);
-- / Policy_Type
CREATE TABLE Policy_Type (
    PolicyType_ID INT PRIMARY KEY AUTO_INCREMENT,
    Policy_Name VARCHAR(100),
    Coverage_Amount DECIMAL(12,2),
    Premium_Rate DECIMAL(10,2),
    Policy_Duration INT,
    Roadside_Assistance VARCHAR(10),
    Zero_Depreciation VARCHAR(10),
    Personal_Accident_Cover VARCHAR(10),
    Description VARCHAR(200)
);
-- / Insurance_Policy
CREATE TABLE Insurance_Policy (
    Policy_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Vehicle_ID INT,
    PolicyType_ID INT,
    Agent_ID INT,
    Policy_Number VARCHAR(50),
    Start_Date DATE,
    End_Date DATE,
    Premium DECIMAL(12,2),
    Status VARCHAR(20),
    FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY(Vehicle_ID) REFERENCES Vehicle(Vehicle_ID),
    FOREIGN KEY(PolicyType_ID) REFERENCES Policy_Type(PolicyType_ID),
    FOREIGN KEY(Agent_ID) REFERENCES Agent(Agent_ID)
);
-- / Premium_Payment
CREATE TABLE Premium_Payment (
    Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Policy_ID INT,
    Payment_Date DATE,
    Amount DECIMAL(12,2),
    GST DECIMAL(10,2),
    Discount DECIMAL(10,2),
    Payment_Mode VARCHAR(30),
    Transaction_ID VARCHAR(50),
    Bank_Name VARCHAR(100),
    Payment_Status VARCHAR(30),
    FOREIGN KEY(Policy_ID) REFERENCES Insurance_Policy(Policy_ID)
);
-- / Claim_Status
CREATE TABLE Claim_Status (
    Status_ID INT PRIMARY KEY AUTO_INCREMENT,
    Status_Name VARCHAR(50),
    Description VARCHAR(200),
    Updated_By VARCHAR(100),
    Updated_Date DATE,
    Remarks VARCHAR(200)
);
-- / Claim
CREATE TABLE Claim (
    Claim_ID INT PRIMARY KEY AUTO_INCREMENT,
    Policy_ID INT,
    Status_ID INT,
    Claim_Date DATE,
    Claim_Amount DECIMAL(12,2),
    Approved_Amount DECIMAL(12,2),
    Description VARCHAR(200),
    FOREIGN KEY(Policy_ID) REFERENCES Insurance_Policy(Policy_ID),
    FOREIGN KEY(Status_ID) REFERENCES Claim_Status(Status_ID)
);
-- /Accident
CREATE TABLE Accident (
    Accident_ID INT PRIMARY KEY AUTO_INCREMENT,
    Vehicle_ID INT,
    Accident_Date DATE,
    Accident_Time TIME,
    Location VARCHAR(100),
    Police_Report_No VARCHAR(50),
    Damage_Level VARCHAR(50),
    Description VARCHAR(200),
    FOREIGN KEY(Vehicle_ID) REFERENCES Vehicle(Vehicle_ID)
);
-- /Surveyor
CREATE TABLE Surveyor (
    Surveyor_ID INT PRIMARY KEY AUTO_INCREMENT,
    Surveyor_Name VARCHAR(100),
    Qualification VARCHAR(100),
    Experience_Years INT,
    License_No VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(200),
    Joining_Date DATE,
    Status VARCHAR(20)
);
-- / Inspection
CREATE TABLE Inspection (
    Inspection_ID INT PRIMARY KEY AUTO_INCREMENT,
    Claim_ID INT,
    Surveyor_ID INT,
    Inspection_Date DATE,
    Inspection_Time TIME,
    Damage_Level VARCHAR(50),
    Estimated_Cost DECIMAL(12,2),
    Report VARCHAR(200),
    FOREIGN KEY(Claim_ID) REFERENCES Claim(Claim_ID),
    FOREIGN KEY(Surveyor_ID) REFERENCES Surveyor(Surveyor_ID)
);
-- / Garage
CREATE TABLE Garage (
    Garage_ID INT PRIMARY KEY AUTO_INCREMENT,
    Garage_Name VARCHAR(100),
    Owner_Name VARCHAR(100),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Rating DECIMAL(2,1),
    Status VARCHAR(20)
);
-- / Repair
CREATE TABLE Repair (
    Repair_ID INT PRIMARY KEY AUTO_INCREMENT,
    Garage_ID INT,
    Vehicle_ID INT,
    Repair_Date DATE,
    Completion_Date DATE,
    Repair_Type VARCHAR(100),
    Parts_Replaced VARCHAR(200),
    Repair_Cost DECIMAL(12,2),
    Warranty_Months INT,
    FOREIGN KEY(Garage_ID) REFERENCES Garage(Garage_ID),
    FOREIGN KEY(Vehicle_ID) REFERENCES Vehicle(Vehicle_ID)
);
-- / Employee
CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY AUTO_INCREMENT,
    Branch_ID INT,
    Employee_Name VARCHAR(100),
    Gender VARCHAR(10),
    Designation VARCHAR(50),
    Salary DECIMAL(10,2),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Joining_Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY(Branch_ID) REFERENCES Branch(Branch_ID)
);
-- / Nominee
CREATE TABLE Nominee (
    Nominee_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Nominee_Name VARCHAR(100),
    Relationship VARCHAR(50),
    DOB DATE,
    Aadhaar_No VARCHAR(20),
    Phone VARCHAR(15),
    Address VARCHAR(200),
    FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID)
);
-- / Document
CREATE TABLE Document (
    Document_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Document_Name VARCHAR(100),
    Document_Number VARCHAR(50),
    Document_Type VARCHAR(50),
    Issue_Date DATE,
    Upload_Date DATE,
    Expiry_Date DATE,
    FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID)
);
-- / Login
CREATE TABLE Login (
    Login_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Username VARCHAR(50),
    Password VARCHAR(100),
    Role VARCHAR(30),
    Last_Login DATETIME,
    Account_Status VARCHAR(20),
    Security_Question VARCHAR(200),
    FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID)
);
-- Audit_Log
CREATE TABLE Audit_Log (
    Log_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_Name VARCHAR(100),
    User_Role VARCHAR(50),
    Action_Performed VARCHAR(100),
    Table_Name VARCHAR(100),
    Action_Date DATETIME,
    Description VARCHAR(200)
);

INSERT INTO Customer
(Customer_ID, First_Name, Last_Name, Gender, DOB, Phone, Email, Address, City, State, Pincode)
VALUES
(1,'Rahul','Sharma','Male','1995-05-12','9876543210','rahul.sharma@gmail.com','12 MG Road','Mumbai','Maharashtra','400001'),
(2,'Priya','Patel','Female','1998-08-20','9876543211','priya.patel@gmail.com','45 Ring Road','Ahmedabad','Gujarat','380001'),
(3,'Arjun','Reddy','Male','1994-02-18','9876543212','arjun.reddy@gmail.com','21 Park Street','Hyderabad','Telangana','500001'),
(4,'Sneha','Iyer','Female','1996-11-10','9876543213','sneha.iyer@gmail.com','88 Anna Nagar','Chennai','Tamil Nadu','600001'),
(5,'Vikram','Singh','Male','1992-07-15','9876543214','vikram.singh@gmail.com','34 Civil Lines','Jaipur','Rajasthan','302001'),
(6,'Anjali','Verma','Female','1997-04-11','9876543215','anjali.verma@gmail.com','56 Green Park','New Delhi','Delhi','110001'),
(7,'Karan','Mehta','Male','1993-12-30','9876543216','karan.mehta@gmail.com','18 Lake View','Pune','Maharashtra','411001'),
(8,'Pooja','Nair','Female','1999-03-21','9876543217','pooja.nair@gmail.com','11 Beach Road','Kochi','Kerala','682001'),
(9,'Amit','Joshi','Male','1991-09-09','9876543218','amit.joshi@gmail.com','90 Residency Road','Bengaluru','Karnataka','560001'),
(10,'Neha','Kapoor','Female','1995-01-25','9876543219','neha.kapoor@gmail.com','25 Model Town','Ludhiana','Punjab','141001'),
(11,'Rohit','Yadav','Male','1996-06-16','9876543220','rohit.yadav@gmail.com','14 Main Road','Lucknow','Uttar Pradesh','226001'),
(12,'Meera','Das','Female','1998-02-22','9876543221','meera.das@gmail.com','5 Station Road','Kolkata','West Bengal','700001'),
(13,'Suresh','Kumar','Male','1990-05-18','9876543222','suresh.kumar@gmail.com','10 Gandhi Road','Coimbatore','Tamil Nadu','641001'),
(14,'Divya','Rao','Female','1997-08-29','9876543223','divya.rao@gmail.com','7 Temple Street','Mysuru','Karnataka','570001'),
(15,'Manoj','Gupta','Male','1994-10-14','9876543224','manoj.gupta@gmail.com','16 Nehru Colony','Bhopal','Madhya Pradesh','462001'),
(16,'Kavya','Menon','Female','1998-12-11','9876543225','kavya.menon@gmail.com','2 Hill View','Thiruvananthapuram','Kerala','695001'),
(17,'Nitin','Shah','Male','1992-03-15','9876543226','nitin.shah@gmail.com','61 Market Road','Surat','Gujarat','395001'),
(18,'Asha','Kulkarni','Female','1993-07-19','9876543227','asha.kulkarni@gmail.com','17 Shivaji Nagar','Nagpur','Maharashtra','440001'),
(19,'Ramesh','Pillai','Male','1991-11-08','9876543228','ramesh.pillai@gmail.com','44 River Side','Kozhikode','Kerala','673001'),
(20,'Lakshmi','Krishnan','Female','1996-09-27','9876543229','lakshmi.krishnan@gmail.com','3 Flower Garden','Madurai','Tamil Nadu','625001'),
(21,'Deepak','Mishra','Male','1995-04-09','9876543230','deepak.mishra@gmail.com','9 College Road','Patna','Bihar','800001'),
(22,'Ritu','Agarwal','Female','1999-05-17','9876543231','ritu.agarwal@gmail.com','20 New Market','Indore','Madhya Pradesh','452001'),
(23,'Harish','Naidu','Male','1994-01-13','9876543232','harish.naidu@gmail.com','33 Railway Colony','Visakhapatnam','Andhra Pradesh','530001'),
(24,'Shalini','Bose','Female','1997-03-06','9876543233','shalini.bose@gmail.com','12 Lake Town','Kolkata','West Bengal','700048'),
(25,'Ajay','Chauhan','Male','1993-06-20','9876543234','ajay.chauhan@gmail.com','55 Airport Road','Chandigarh','Chandigarh','160001'),
(26,'Nisha','Saxena','Female','1998-10-01','9876543235','nisha.saxena@gmail.com','29 Ashok Nagar','Kanpur','Uttar Pradesh','208001'),
(27,'Sanjay','Pandey','Male','1992-08-08','9876543236','sanjay.pandey@gmail.com','70 MG Colony','Varanasi','Uttar Pradesh','221001'),
(28,'Rekha','Jain','Female','1995-12-22','9876543237','rekha.jain@gmail.com','8 Residency Area','Udaipur','Rajasthan','313001'),
(29,'Mohan','Bhat','Male','1991-02-11','9876543238','mohan.bhat@gmail.com','40 Garden City','Mangaluru','Karnataka','575001'),
(30,'Swathi','Ramesh','Female','1997-11-30','9876543239','swathi.ramesh@gmail.com','15 Lake Colony','Vijayawada','Andhra Pradesh','520001'); 

INSERT INTO Agent
(Agent_ID, Agent_Name, Gender, DOB, Phone, Email, Address, Branch_ID, Joining_Date, Commission, Experience_Years, Status)
VALUES
(1,'Rakesh Kumar','Male','1988-05-12','9876500001','rakesh.kumar@insurance.com','MG Road, Mumbai',1,'2018-01-15',5.50,8,'Active'),
(2,'Priya Sharma','Female','1990-08-21','9876500002','priya.sharma@insurance.com','FC Road, Pune',2,'2019-03-20',6.00,7,'Active'),
(3,'Amit Patel','Male','1987-11-10','9876500003','amit.patel@insurance.com','CG Road, Ahmedabad',3,'2017-07-18',5.75,9,'Active'),
(4,'Neha Singh','Female','1992-02-15','9876500004','neha.singh@insurance.com','Anna Salai, Chennai',4,'2020-01-10',6.20,5,'Active'),
(5,'Rahul Verma','Male','1989-09-05','9876500005','rahul.verma@insurance.com','Banjara Hills, Hyderabad',5,'2018-11-01',5.90,8,'Active'),
(6,'Anjali Mehta','Female','1991-04-16','9876500006','anjali.mehta@insurance.com','MG Road, Bengaluru',6,'2019-06-12',6.10,6,'Active'),
(7,'Suresh Nair','Male','1986-12-20','9876500007','suresh.nair@insurance.com','Marine Drive, Kochi',7,'2016-09-15',5.80,10,'Active'),
(8,'Kavya Reddy','Female','1993-07-25','9876500008','kavya.reddy@insurance.com','Jubilee Hills, Hyderabad',8,'2021-02-18',6.30,4,'Active'),
(9,'Vikram Rao','Male','1985-03-14','9876500009','vikram.rao@insurance.com','Civil Lines, Nagpur',9,'2015-08-01',5.60,11,'Active'),
(10,'Pooja Iyer','Female','1994-10-30','9876500010','pooja.iyer@insurance.com','Anna Nagar, Chennai',10,'2022-04-20',6.00,3,'Active'),
(11,'Arun Kumar','Male','1988-06-11','9876500011','arun.kumar@insurance.com','Hazratganj, Lucknow',11,'2018-05-16',5.85,8,'Active'),
(12,'Divya Nair','Female','1992-08-28','9876500012','divya.nair@insurance.com','MG Road, Kochi',12,'2020-10-01',6.25,5,'Active'),
(13,'Manoj Gupta','Male','1987-01-19','9876500013','manoj.gupta@insurance.com','AB Road, Indore',13,'2017-03-25',5.95,9,'Active'),
(14,'Sneha Patel','Female','1991-12-08','9876500014','sneha.patel@insurance.com','Ring Road, Surat',14,'2019-12-10',6.15,6,'Active'),
(15,'Kiran Reddy','Male','1989-09-22','9876500015','kiran.reddy@insurance.com','Beach Road, Vizag',15,'2018-07-14',5.70,8,'Active'),
(16,'Harish Joshi','Male','1986-05-18','9876500016','harish.joshi@insurance.com','Civil Lines, Jaipur',16,'2016-04-18',5.65,10,'Active'),
(17,'Meera Das','Female','1993-11-27','9876500017','meera.das@insurance.com','Park Street, Kolkata',17,'2021-01-11',6.35,4,'Active'),
(18,'Naveen Singh','Male','1990-02-09','9876500018','naveen.singh@insurance.com','Main Road, Ranchi',18,'2019-09-09',5.90,7,'Active'),
(19,'Lakshmi Menon','Female','1994-06-15','9876500019','lakshmi.menon@insurance.com','MG Road, Trivandrum',19,'2022-02-14',6.10,3,'Active'),
(20,'Ajay Yadav','Male','1988-10-12','9876500020','ajay.yadav@insurance.com','Fraser Road, Patna',20,'2018-08-08',5.75,8,'Active'),
(21,'Ritu Agarwal','Female','1992-04-05','9876500021','ritu.agarwal@insurance.com','Sector 17, Chandigarh',21,'2020-06-21',6.20,5,'Active'),
(22,'Deepak Mishra','Male','1987-07-13','9876500022','deepak.mishra@insurance.com','Rajpur Road, Dehradun',22,'2017-11-30',5.85,9,'Active'),
(23,'Nisha Kapoor','Female','1995-09-18','9876500023','nisha.kapoor@insurance.com','Model Town, Ludhiana',23,'2023-01-05',6.40,2,'Active'),
(24,'Sanjay Pandey','Male','1986-03-24','9876500024','sanjay.pandey@insurance.com','Janpath, Bhubaneswar',24,'2016-06-12',5.95,10,'Active'),
(25,'Swathi Krishnan','Female','1991-05-29','9876500025','swathi.krishnan@insurance.com','KK Nagar, Madurai',25,'2019-05-19',6.15,6,'Active'),
(26,'Mohan Bhat','Male','1989-08-07','9876500026','mohan.bhat@insurance.com','Mall Road, Shimla',26,'2018-02-28',5.80,8,'Active'),
(27,'Rekha Jain','Female','1993-01-17','9876500027','rekha.jain@insurance.com','MI Road, Jaipur',27,'2021-09-01',6.30,4,'Active'),
(28,'Harsha Naidu','Male','1988-11-03','9876500028','harsha.naidu@insurance.com','MG Road, Vijayawada',28,'2017-08-25',5.90,9,'Active'),
(29,'Ashok Chandra','Male','1985-04-09','9876500029','ashok.chandra@insurance.com','Beach Road, Goa',29,'2015-12-15',5.70,11,'Active'),
(30,'Shalini Bose','Female','1994-12-20','9876500030','shalini.bose@insurance.com','Salt Lake, Kolkata',30,'2022-07-10',6.25,3,'Active'); 

INSERT INTO Branch
(Branch_ID, Branch_Name, Manager_Name, Address, City, State, Pincode, Phone, Email, Opening_Date, Status)
VALUES
(1,'Mumbai Central Branch','Rajesh Kumar','MG Road','Mumbai','Maharashtra','400001','0224001001','mumbai@motorinsure.com','2015-01-10','Active'),
(2,'Pune Branch','Priya Sharma','FC Road','Pune','Maharashtra','411001','0204001002','pune@motorinsure.com','2016-03-15','Active'),
(3,'Ahmedabad Branch','Amit Patel','CG Road','Ahmedabad','Gujarat','380001','0794001003','ahmedabad@motorinsure.com','2016-05-20','Active'),
(4,'Hyderabad Branch','Neha Reddy','Banjara Hills','Hyderabad','Telangana','500001','0404001004','hyderabad@motorinsure.com','2017-01-18','Active'),
(5,'Chennai Branch','Suresh Iyer','Anna Salai','Chennai','Tamil Nadu','600001','0444001005','chennai@motorinsure.com','2017-04-12','Active'),
(6,'Bengaluru Branch','Kiran Rao','MG Road','Bengaluru','Karnataka','560001','0804001006','bengaluru@motorinsure.com','2018-02-05','Active'),
(7,'Kochi Branch','Anjali Nair','Marine Drive','Kochi','Kerala','682001','04844001007','kochi@motorinsure.com','2018-06-11','Active'),
(8,'Jaipur Branch','Rahul Singh','MI Road','Jaipur','Rajasthan','302001','01414001008','jaipur@motorinsure.com','2018-10-20','Active'),
(9,'Delhi Branch','Pooja Verma','Connaught Place','New Delhi','Delhi','110001','0114001009','delhi@motorinsure.com','2019-01-08','Active'),
(10,'Lucknow Branch','Arun Kumar','Hazratganj','Lucknow','Uttar Pradesh','226001','05224001010','lucknow@motorinsure.com','2019-03-15','Active'),
(11,'Kolkata Branch','Meera Das','Park Street','Kolkata','West Bengal','700001','0334001011','kolkata@motorinsure.com','2019-07-01','Active'),
(12,'Nagpur Branch','Vikram Joshi','Civil Lines','Nagpur','Maharashtra','440001','07124001012','nagpur@motorinsure.com','2020-01-05','Active'),
(13,'Indore Branch','Manoj Gupta','AB Road','Indore','Madhya Pradesh','452001','07314001013','indore@motorinsure.com','2020-04-18','Active'),
(14,'Bhopal Branch','Sneha Jain','MP Nagar','Bhopal','Madhya Pradesh','462001','07554001014','bhopal@motorinsure.com','2020-08-10','Active'),
(15,'Surat Branch','Deepak Shah','Ring Road','Surat','Gujarat','395001','02614001015','surat@motorinsure.com','2020-11-22','Active'),
(16,'Patna Branch','Ajay Mishra','Fraser Road','Patna','Bihar','800001','06124001016','patna@motorinsure.com','2021-01-18','Active'),
(17,'Ranchi Branch','Ritu Sinha','Main Road','Ranchi','Jharkhand','834001','06514001017','ranchi@motorinsure.com','2021-03-25','Active'),
(18,'Bhubaneswar Branch','Harish Mohanty','Janpath','Bhubaneswar','Odisha','751001','06744001018','bhubaneswar@motorinsure.com','2021-06-10','Active'),
(19,'Coimbatore Branch','Lakshmi Krishnan','Avinashi Road','Coimbatore','Tamil Nadu','641001','04224001019','coimbatore@motorinsure.com','2021-09-12','Active'),
(20,'Madurai Branch','Naveen Kumar','KK Nagar','Madurai','Tamil Nadu','625001','04524001020','madurai@motorinsure.com','2022-01-15','Active'),
(21,'Mysuru Branch','Shalini Rao','Sayyaji Rao Road','Mysuru','Karnataka','570001','08214001021','mysuru@motorinsure.com','2022-03-20','Active'),
(22,'Chandigarh Branch','Rakesh Sharma','Sector 17','Chandigarh','Chandigarh','160001','01724001022','chandigarh@motorinsure.com','2022-05-25','Active'),
(23,'Dehradun Branch','Divya Rawat','Rajpur Road','Dehradun','Uttarakhand','248001','01354001023','dehradun@motorinsure.com','2022-08-08','Active'),
(24,'Goa Branch','Mohan Naik','Panjim','Goa','Goa','403001','08324001024','goa@motorinsure.com','2022-10-18','Active'),
(25,'Visakhapatnam Branch','Kavya Reddy','Beach Road','Visakhapatnam','Andhra Pradesh','530001','08914001025','vizag@motorinsure.com','2023-01-05','Active'),
(26,'Vijayawada Branch','Sanjay Rao','MG Road','Vijayawada','Andhra Pradesh','520001','08664001026','vijayawada@motorinsure.com','2023-03-15','Active'),
(27,'Kanpur Branch','Ashok Gupta','Mall Road','Kanpur','Uttar Pradesh','208001','05124001027','kanpur@motorinsure.com','2023-05-10','Active'),
(28,'Varanasi Branch','Rekha Singh','Lanka','Varanasi','Uttar Pradesh','221001','05424001028','varanasi@motorinsure.com','2023-07-20','Active'),
(29,'Udaipur Branch','Swathi Mehta','Fateh Sagar Road','Udaipur','Rajasthan','313001','02944001029','udaipur@motorinsure.com','2023-10-01','Active'),
(30,'Mangaluru Branch','Harsha Shetty','Balmatta','Mangaluru','Karnataka','575001','08244001030','mangaluru@motorinsure.com','2024-01-15','Active');

INSERT INTO Vehicle_Type
(VehicleType_ID, Vehicle_Type, Fuel_Type, Seating_Capacity, Wheels, Commercial_Use, Description, Status)
VALUES
(1,'Motorcycle','Petrol',2,2,'No','Standard motorcycle','Active'),
(2,'Scooter','Petrol',2,2,'No','Gearless scooter','Active'),
(3,'Electric Scooter','Electric',2,2,'No','Battery-powered scooter','Active'),
(4,'Hatchback','Petrol',5,4,'No','Small family car','Active'),
(5,'Sedan','Petrol',5,4,'No','Premium sedan car','Active'),
(6,'SUV','Diesel',7,4,'No','Sports Utility Vehicle','Active'),
(7,'MUV','Diesel',7,4,'No','Multi Utility Vehicle','Active'),
(8,'Luxury Car','Petrol',5,4,'No','Luxury segment vehicle','Active'),
(9,'Electric Car','Electric',5,4,'No','Electric passenger car','Active'),
(10,'Pickup Truck','Diesel',2,4,'Yes','Light commercial vehicle','Active'),
(11,'Mini Truck','Diesel',2,4,'Yes','Goods transport vehicle','Active'),
(12,'Truck','Diesel',2,6,'Yes','Heavy goods vehicle','Active'),
(13,'Container Truck','Diesel',2,10,'Yes','Long-distance cargo vehicle','Active'),
(14,'School Bus','Diesel',40,6,'Yes','Student transportation','Active'),
(15,'City Bus','Diesel',50,6,'Yes','Public transport bus','Active'),
(16,'Tourist Bus','Diesel',45,6,'Yes','Tourist coach','Active'),
(17,'Van','Diesel',8,4,'No','Passenger van','Active'),
(18,'Ambulance','Diesel',5,4,'Yes','Emergency vehicle','Active'),
(19,'Police Vehicle','Diesel',5,4,'Yes','Law enforcement vehicle','Active'),
(20,'Fire Engine','Diesel',6,6,'Yes','Fire rescue vehicle','Active'),
(21,'Auto Rickshaw','CNG',3,3,'Yes','Passenger auto','Active'),
(22,'Cargo Auto','CNG',2,3,'Yes','Goods auto','Active'),
(23,'Tractor','Diesel',2,4,'Yes','Agricultural vehicle','Active'),
(24,'Road Roller','Diesel',1,4,'Yes','Construction equipment','Active'),
(25,'Bulldozer','Diesel',1,8,'Yes','Earth moving vehicle','Active'),
(26,'Crane','Diesel',2,8,'Yes','Heavy lifting vehicle','Active'),
(27,'Water Tanker','Diesel',2,6,'Yes','Water supply vehicle','Active'),
(28,'Garbage Truck','Diesel',3,6,'Yes','Waste collection vehicle','Active'),
(29,'Fuel Tanker','Diesel',2,10,'Yes','Fuel transportation vehicle','Active'),
(30,'Tow Truck','Diesel',2,6,'Yes','Vehicle recovery truck','Active');

INSERT INTO Vehicle
(Customer_ID, VehicleType_ID, Registration_No, Brand, Model, Manufacture_Year, Engine_No, Chassis_No, Color)
VALUES
(1,1,'TN01AB1001','Maruti','Swift',2021,'ENG1001','CHS1001','White'),
(2,2,'TN02AB1002','Hyundai','i20',2022,'ENG1002','CHS1002','Black'),
(3,3,'TN03AB1003','Honda','City',2020,'ENG1003','CHS1003','Silver'),
(4,4,'TN04AB1004','Toyota','Innova',2023,'ENG1004','CHS1004','Grey'),
(5,5,'TN05AB1005','Tata','Nexon',2022,'ENG1005','CHS1005','Blue'),
(6,1,'TN06AB1006','Mahindra','XUV300',2021,'ENG1006','CHS1006','Red'),
(7,2,'TN07AB1007','Kia','Seltos',2023,'ENG1007','CHS1007','White'),
(8,3,'TN08AB1008','Renault','Kwid',2020,'ENG1008','CHS1008','Yellow'),
(9,4,'TN09AB1009','Nissan','Magnite',2022,'ENG1009','CHS1009','Orange'),
(10,5,'TN10AB1010','Skoda','Slavia',2024,'ENG1010','CHS1010','Black'),
(11,1,'TN11AB1011','Volkswagen','Virtus',2023,'ENG1011','CHS1011','Silver'),
(12,2,'TN12AB1012','MG','Hector',2022,'ENG1012','CHS1012','White'),
(13,3,'TN13AB1013','Ford','EcoSport',2020,'ENG1013','CHS1013','Blue'),
(14,4,'TN14AB1014','Jeep','Compass',2021,'ENG1014','CHS1014','Grey'),
(15,5,'TN15AB1015','Audi','A4',2024,'ENG1015','CHS1015','Black'),
(16,1,'TN16AB1016','BMW','320d',2023,'ENG1016','CHS1016','White'),
(17,2,'TN17AB1017','Mercedes','C-Class',2022,'ENG1017','CHS1017','Silver'),
(18,3,'TN18AB1018','Volvo','XC40',2021,'ENG1018','CHS1018','Blue'),
(19,4,'TN19AB1019','Hyundai','Verna',2024,'ENG1019','CHS1019','Red'),
(20,5,'TN20AB1020','Honda','Amaze',2023,'ENG1020','CHS1020','Brown'),
(21,1,'TN21AB1021','Maruti','Baleno',2022,'ENG1021','CHS1021','White'),
(22,2,'TN22AB1022','Toyota','Fortuner',2021,'ENG1022','CHS1022','Black'),
(23,3,'TN23AB1023','Tata','Punch',2024,'ENG1023','CHS1023','Grey'),
(24,4,'TN24AB1024','Mahindra','Scorpio',2023,'ENG1024','CHS1024','Green'),
(25,5,'TN25AB1025','Kia','Carens',2022,'ENG1025','CHS1025','Blue'),
(26,1,'TN26AB1026','Renault','Triber',2021,'ENG1026','CHS1026','Silver'),
(27,2,'TN27AB1027','Nissan','Sunny',2020,'ENG1027','CHS1027','White'),
(28,3,'TN28AB1028','Skoda','Kushaq',2024,'ENG1028','CHS1028','Black'),
(29,4,'TN29AB1029','MG','Astor',2023,'ENG1029','CHS1029','Red'),
(30,5,'TN30AB1030','Hyundai','Creta',2022,'ENG1030','CHS1030','Blue'); 

INSERT INTO Policy_Type
(Policy_Name, Coverage_Amount, Premium_Rate, Policy_Duration, Roadside_Assistance, Zero_Depreciation, Personal_Accident_Cover, Description)
VALUES
('Third Party',500000,3000,1,'No','No','Yes','Third-party liability insurance'),
('Comprehensive',1000000,8000,1,'Yes','Yes','Yes','Complete vehicle protection'),
('Zero Depreciation',1200000,9500,1,'Yes','Yes','Yes','No depreciation deduction'),
('Commercial Vehicle',1500000,12000,1,'Yes','No','Yes','Commercial vehicle coverage'),
('Electric Vehicle',1800000,9000,1,'Yes','Yes','Yes','Insurance for electric vehicles'),
('Premium Plan',2000000,15000,2,'Yes','Yes','Yes','Premium insurance plan'),
('Basic Plan',400000,2500,1,'No','No','Yes','Basic insurance'),
('Family Protection',800000,6000,1,'Yes','No','Yes','Family accident cover'),
('Gold Policy',2500000,18000,2,'Yes','Yes','Yes','Gold insurance package'),
('Silver Policy',1200000,7000,1,'Yes','No','Yes','Silver insurance package'),
('Bronze Policy',600000,4000,1,'No','No','Yes','Bronze insurance package'),
('Luxury Car Policy',5000000,30000,2,'Yes','Yes','Yes','Luxury vehicle protection'),
('SUV Policy',2200000,16000,2,'Yes','Yes','Yes','SUV insurance'),
('Sedan Policy',1500000,9000,1,'Yes','No','Yes','Sedan insurance'),
('Hatchback Policy',800000,5000,1,'Yes','No','Yes','Hatchback insurance'),
('Bike Premium',300000,2500,1,'Yes','No','Yes','Premium bike insurance'),
('Bike Basic',200000,1800,1,'No','No','Yes','Basic bike insurance'),
('Taxi Insurance',1800000,13000,1,'Yes','No','Yes','Taxi vehicle coverage'),
('School Bus Policy',3000000,22000,2,'Yes','Yes','Yes','School bus insurance'),
('Truck Insurance',4000000,28000,2,'Yes','No','Yes','Heavy truck insurance'),
('Mini Truck Policy',1800000,14000,1,'Yes','No','Yes','Mini truck insurance'),
('Van Insurance',1200000,8500,1,'Yes','No','Yes','Van insurance'),
('Tourist Vehicle',2500000,17000,2,'Yes','Yes','Yes','Tourist vehicle policy'),
('Corporate Fleet',8000000,50000,3,'Yes','Yes','Yes','Fleet insurance'),
('Agricultural Vehicle',1500000,9000,2,'Yes','No','Yes','Farm vehicle insurance'),
('Special Cover',3500000,24000,2,'Yes','Yes','Yes','Special insurance package'),
('Ultimate Plan',10000000,70000,5,'Yes','Yes','Yes','Maximum coverage'),
('Economy Plan',500000,2800,1,'No','No','Yes','Economy insurance'),
('Smart Plan',1000000,6500,1,'Yes','Yes','Yes','Smart coverage plan'),
('Platinum Policy',6000000,40000,3,'Yes','Yes','Yes','Platinum insurance package');

INSERT INTO Insurance_Policy
(Customer_ID, Vehicle_ID, PolicyType_ID, Agent_ID, Policy_Number, Start_Date, End_Date, Premium, Status)
VALUES
(1,1,1,1,'POL10001','2025-01-01','2026-01-01',3000.00,'Active'),
(2,2,2,2,'POL10002','2025-01-05','2026-01-05',8000.00,'Active'),
(3,3,3,3,'POL10003','2025-01-10','2026-01-10',9500.00,'Active'),
(4,4,4,4,'POL10004','2025-01-15','2026-01-15',12000.00,'Expired'),
(5,5,5,5,'POL10005','2025-01-20','2026-01-20',9000.00,'Active'),
(6,6,6,6,'POL10006','2025-01-25','2026-01-25',15000.00,'Active'),
(7,7,7,7,'POL10007','2025-02-01','2026-02-01',2500.00,'Pending'),
(8,8,8,8,'POL10008','2025-02-05','2026-02-05',6000.00,'Active'),
(9,9,9,9,'POL10009','2025-02-10','2026-02-10',18000.00,'Active'),
(10,10,10,10,'POL10010','2025-02-15','2026-02-15',7000.00,'Cancelled'),
(11,11,11,11,'POL10011','2025-02-20','2026-02-20',4000.00,'Active'),
(12,12,12,12,'POL10012','2025-02-25','2026-02-25',30000.00,'Active'),
(13,13,13,13,'POL10013','2025-03-01','2026-03-01',16000.00,'Pending'),
(14,14,14,14,'POL10014','2025-03-05','2026-03-05',9000.00,'Active'),
(15,15,15,15,'POL10015','2025-03-10','2026-03-10',5000.00,'Expired'),
(16,16,16,16,'POL10016','2025-03-15','2026-03-15',2500.00,'Active'),
(17,17,17,17,'POL10017','2025-03-20','2026-03-20',1800.00,'Active'),
(18,18,18,18,'POL10018','2025-03-25','2026-03-25',13000.00,'Pending'),
(19,19,19,19,'POL10019','2025-04-01','2026-04-01',22000.00,'Active'),
(20,20,20,20,'POL10020','2025-04-05','2026-04-05',28000.00,'Active'),
(21,21,21,21,'POL10021','2025-04-10','2026-04-10',14000.00,'Expired'),
(22,22,22,22,'POL10022','2025-04-15','2026-04-15',8500.00,'Active'),
(23,23,23,23,'POL10023','2025-04-20','2026-04-20',17000.00,'Pending'),
(24,24,24,24,'POL10024','2025-04-25','2027-04-25',50000.00,'Active'),
(25,25,25,25,'POL10025','2025-05-01','2027-05-01',9000.00,'Active'),
(26,26,26,26,'POL10026','2025-05-05','2027-05-05',24000.00,'Cancelled'),
(27,27,27,27,'POL10027','2025-05-10','2030-05-10',70000.00,'Active'),
(28,28,28,28,'POL10028','2025-05-15','2026-05-15',2800.00,'Pending'),
(29,29,29,29,'POL10029','2025-05-20','2026-05-20',6500.00,'Active'),
(30,30,30,30,'POL10030','2025-05-25','2028-05-25',40000.00,'Active');

INSERT INTO Premium_Payment
(Policy_ID, Payment_Date, Amount, GST, Discount, Payment_Mode, Transaction_ID, Bank_Name, Payment_Status)
VALUES
(1,'2025-01-01',3000,540,100,'UPI','TXN10001','SBI','Paid'),
(2,'2025-01-05',8000,1440,200,'Credit Card','TXN10002','HDFC','Paid'),
(3,'2025-01-10',9500,1710,250,'Net Banking','TXN10003','ICICI','Paid'),
(4,'2025-01-15',12000,2160,500,'Debit Card','TXN10004','Axis Bank','Paid'),
(5,'2025-01-20',9000,1620,300,'UPI','TXN10005','SBI','Paid'),
(6,'2025-01-25',15000,2700,500,'Cash','TXN10006','Indian Bank','Paid'),
(7,'2025-02-01',2500,450,50,'UPI','TXN10007','Canara Bank','Pending'),
(8,'2025-02-05',6000,1080,150,'Net Banking','TXN10008','HDFC','Paid'),
(9,'2025-02-10',18000,3240,700,'Credit Card','TXN10009','ICICI','Paid'),
(10,'2025-02-15',7000,1260,100,'Debit Card','TXN10010','SBI','Failed'),
(11,'2025-02-20',4000,720,50,'UPI','TXN10011','Axis Bank','Paid'),
(12,'2025-02-25',30000,5400,1000,'Net Banking','TXN10012','HDFC','Paid'),
(13,'2025-03-01',16000,2880,500,'Credit Card','TXN10013','ICICI','Pending'),
(14,'2025-03-05',9000,1620,200,'UPI','TXN10014','SBI','Paid'),
(15,'2025-03-10',5000,900,100,'Cash','TXN10015','Indian Bank','Paid'),
(16,'2025-03-15',2500,450,50,'Debit Card','TXN10016','Canara Bank','Paid'),
(17,'2025-03-20',1800,324,20,'UPI','TXN10017','SBI','Paid'),
(18,'2025-03-25',13000,2340,400,'Credit Card','TXN10018','HDFC','Pending'),
(19,'2025-04-01',22000,3960,800,'Net Banking','TXN10019','ICICI','Paid'),
(20,'2025-04-05',28000,5040,900,'UPI','TXN10020','Axis Bank','Paid'),
(21,'2025-04-10',14000,2520,300,'Debit Card','TXN10021','SBI','Paid'),
(22,'2025-04-15',8500,1530,200,'UPI','TXN10022','Indian Bank','Paid'),
(23,'2025-04-20',17000,3060,500,'Credit Card','TXN10023','HDFC','Pending'),
(24,'2025-04-25',50000,9000,2000,'Net Banking','TXN10024','ICICI','Paid'),
(25,'2025-05-01',9000,1620,250,'UPI','TXN10025','SBI','Paid'),
(26,'2025-05-05',24000,4320,800,'Debit Card','TXN10026','Axis Bank','Failed'),
(27,'2025-05-10',70000,12600,3000,'Credit Card','TXN10027','HDFC','Paid'),
(28,'2025-05-15',2800,504,50,'UPI','TXN10028','Canara Bank','Pending'),
(29,'2025-05-20',6500,1170,150,'Net Banking','TXN10029','ICICI','Paid'),
(30,'2025-05-25',40000,7200,1500,'Credit Card','TXN10030','SBI','Paid');

INSERT INTO Claim_Status
(Status_Name, Description, Updated_By, Updated_Date, Remarks)
VALUES
('Submitted','Claim submitted','Admin','2025-01-05','Waiting for verification'),
('Under Review','Documents under review','Manager','2025-01-06','Review started'),
('Approved','Claim approved','Manager','2025-01-07','Approved'),
('Rejected','Claim rejected','Admin','2025-01-08','Invalid documents'),
('Processing','Payment processing','Officer','2025-01-09','Processing'),
('Paid','Claim paid','Accounts','2025-01-10','Completed'),
('Pending','Awaiting documents','Officer','2025-01-11','Pending customer response'),
('Verified','Documents verified','Manager','2025-01-12','Verified'),
('Inspection','Vehicle inspection','Surveyor','2025-01-13','Inspection scheduled'),
('Completed','Claim closed','Admin','2025-01-14','Completed'),
('Submitted','Claim submitted','Admin','2025-01-15','Received'),
('Approved','Claim approved','Manager','2025-01-16','Approved'),
('Rejected','Claim rejected','Manager','2025-01-17','Duplicate claim'),
('Pending','Waiting approval','Officer','2025-01-18','Pending'),
('Processing','Claim processing','Officer','2025-01-19','In progress'),
('Verified','Verified','Surveyor','2025-01-20','Verified'),
('Paid','Amount transferred','Accounts','2025-01-21','Paid successfully'),
('Completed','Closed','Admin','2025-01-22','Completed'),
('Inspection','Vehicle inspected','Surveyor','2025-01-23','Minor damages'),
('Approved','Final approval','Manager','2025-01-24','Approved'),
('Submitted','New claim','Admin','2025-01-25','Received'),
('Pending','Pending review','Officer','2025-01-26','Awaiting manager'),
('Verified','Verified','Manager','2025-01-27','Verified'),
('Processing','Processing','Officer','2025-01-28','Payment initiated'),
('Paid','Payment done','Accounts','2025-01-29','Transferred'),
('Completed','Closed','Admin','2025-01-30','Closed'),
('Rejected','Rejected','Manager','2025-01-31','Policy expired'),
('Inspection','Inspection complete','Surveyor','2025-02-01','Approved'),
('Approved','Approved','Manager','2025-02-02','Ready for payment'),
('Completed','Successfully completed','Admin','2025-02-03','Finalized');

INSERT INTO Claim
(Policy_ID, Status_ID, Claim_Date, Claim_Amount, Approved_Amount, Description)
VALUES
(1,1,'2025-02-01',50000,45000,'Minor front bumper damage'),
(2,2,'2025-02-03',120000,110000,'Rear collision'),
(3,3,'2025-02-05',85000,80000,'Side door damage'),
(4,4,'2025-02-08',150000,0,'Claim rejected'),
(5,5,'2025-02-10',95000,90000,'Windshield replacement'),
(6,6,'2025-02-12',70000,70000,'Engine repair'),
(7,7,'2025-02-15',45000,0,'Pending verification'),
(8,8,'2025-02-17',60000,58000,'Tyre and wheel damage'),
(9,9,'2025-02-20',180000,170000,'Major accident'),
(10,10,'2025-02-22',40000,40000,'Scratch repair'),
(11,11,'2025-02-24',75000,70000,'Door replacement'),
(12,12,'2025-02-26',220000,210000,'Complete body repair'),
(13,13,'2025-03-01',90000,0,'Rejected documents'),
(14,14,'2025-03-03',100000,95000,'Roof damage'),
(15,15,'2025-03-05',65000,62000,'Headlight replacement'),
(16,16,'2025-03-07',50000,50000,'Mirror damage'),
(17,17,'2025-03-10',80000,78000,'Bumper replacement'),
(18,18,'2025-03-12',140000,135000,'Engine damage'),
(19,19,'2025-03-15',160000,155000,'Flood damage'),
(20,20,'2025-03-18',200000,195000,'Fire accident'),
(21,21,'2025-03-20',55000,53000,'Glass replacement'),
(22,22,'2025-03-22',125000,120000,'Side impact'),
(23,23,'2025-03-24',98000,95000,'Bonnet repair'),
(24,24,'2025-03-26',175000,170000,'Heavy accident'),
(25,25,'2025-03-28',88000,85000,'Front damage'),
(26,26,'2025-03-30',145000,0,'Policy expired'),
(27,27,'2025-04-02',250000,240000,'Luxury vehicle repair'),
(28,28,'2025-04-05',60000,58000,'Tyre replacement'),
(29,29,'2025-04-07',92000,90000,'Engine service'),
(30,30,'2025-04-10',300000,295000,'Complete vehicle repair');

INSERT INTO Accident
(Vehicle_ID, Accident_Date, Accident_Time, Location, Police_Report_No, Damage_Level, Description)
VALUES
(1,'2025-01-25','10:15:00','Chennai','PR1001','Minor','Front bumper hit'),
(2,'2025-01-28','11:30:00','Coimbatore','PR1002','Moderate','Rear collision'),
(3,'2025-02-01','09:45:00','Madurai','PR1003','Minor','Side scratch'),
(4,'2025-02-04','18:20:00','Salem','PR1004','Major','Truck collision'),
(5,'2025-02-06','15:00:00','Trichy','PR1005','Moderate','Glass broken'),
(6,'2025-02-08','12:10:00','Vellore','PR1006','Minor','Mirror damaged'),
(7,'2025-02-10','14:30:00','Erode','PR1007','Minor','Tyre burst'),
(8,'2025-02-12','19:15:00','Tirunelveli','PR1008','Major','Vehicle overturned'),
(9,'2025-02-15','08:45:00','Thanjavur','PR1009','Severe','Heavy collision'),
(10,'2025-02-17','17:20:00','Karur','PR1010','Minor','Parking accident'),
(11,'2025-02-20','13:00:00','Namakkal','PR1011','Moderate','Door damaged'),
(12,'2025-02-22','16:15:00','Dindigul','PR1012','Major','Engine damaged'),
(13,'2025-02-24','10:00:00','Cuddalore','PR1013','Minor','Scratch'),
(14,'2025-02-26','11:20:00','Kanchipuram','PR1014','Moderate','Roof damage'),
(15,'2025-03-01','09:30:00','Hosur','PR1015','Minor','Headlight broken'),
(16,'2025-03-03','20:00:00','Thoothukudi','PR1016','Major','Tree collision'),
(17,'2025-03-05','08:20:00','Nagapattinam','PR1017','Moderate','Front damage'),
(18,'2025-03-07','15:40:00','Tenkasi','PR1018','Minor','Wheel damage'),
(19,'2025-03-10','13:15:00','Virudhunagar','PR1019','Major','Flood affected'),
(20,'2025-03-12','18:10:00','Pudukkottai','PR1020','Severe','Fire accident'),
(21,'2025-03-15','10:45:00','Sivagangai','PR1021','Minor','Glass cracked'),
(22,'2025-03-17','14:00:00','Dharmapuri','PR1022','Moderate','Side collision'),
(23,'2025-03-20','16:30:00','Ariyalur','PR1023','Minor','Bonnet dent'),
(24,'2025-03-22','09:50:00','Perambalur','PR1024','Major','Bus collision'),
(25,'2025-03-25','12:30:00','Ramanathapuram','PR1025','Moderate','Front crash'),
(26,'2025-03-27','19:45:00','Mayiladuthurai','PR1026','Major','Bridge accident'),
(27,'2025-03-30','08:15:00','Chengalpattu','PR1027','Severe','Luxury car damaged'),
(28,'2025-04-02','15:25:00','Krishnagiri','PR1028','Minor','Tyre burst'),
(29,'2025-04-05','11:10:00','Ranipet','PR1029','Moderate','Engine issue'),
(30,'2025-04-08','17:45:00','Tiruppur','PR1030','Severe','Complete body damage');

INSERT INTO Surveyor
(Surveyor_Name, Qualification, Experience_Years, License_No, Phone, Email, Address, Joining_Date, Status)
VALUES
('Arun Kumar','B.E Mechanical',5,'LIC1001','9876500001','arun1@gmail.com','Chennai','2021-01-10','Active'),
('Ravi Kumar','B.Tech Auto',7,'LIC1002','9876500002','ravi2@gmail.com','Coimbatore','2020-03-15','Active'),
('Suresh Babu','Diploma Auto',4,'LIC1003','9876500003','suresh3@gmail.com','Madurai','2022-06-01','Active'),
('Manoj Kumar','B.E Mechanical',10,'LIC1004','9876500004','manoj4@gmail.com','Salem','2018-08-20','Active'),
('Karthik Raj','B.Tech Auto',6,'LIC1005','9876500005','karthik5@gmail.com','Trichy','2019-07-18','Active'),
('Vignesh','Diploma Auto',8,'LIC1006','9876500006','vignesh6@gmail.com','Erode','2017-02-12','Active'),
('Hari Prasad','B.E Mechanical',9,'LIC1007','9876500007','hari7@gmail.com','Vellore','2016-11-21','Active'),
('Prakash','MBA Insurance',5,'LIC1008','9876500008','prakash8@gmail.com','Karur','2021-05-10','Active'),
('Ajith','B.Tech Auto',11,'LIC1009','9876500009','ajith9@gmail.com','Tiruppur','2015-09-14','Active'),
('Deepak','B.E Mechanical',12,'LIC1010','9876500010','deepak10@gmail.com','Hosur','2014-12-11','Active'),
('Mohan','Diploma Auto',4,'LIC1011','9876500011','mohan11@gmail.com','Namakkal','2022-04-05','Active'),
('Saravanan','MBA',6,'LIC1012','9876500012','saravanan12@gmail.com','Dindigul','2020-01-09','Active'),
('Rajesh','B.E Mechanical',7,'LIC1013','9876500013','rajesh13@gmail.com','Cuddalore','2019-10-01','Active'),
('Senthil','B.Tech Auto',8,'LIC1014','9876500014','senthil14@gmail.com','Kanchipuram','2018-06-18','Active'),
('Bala','Diploma',5,'LIC1015','9876500015','bala15@gmail.com','Thanjavur','2021-08-15','Active'),
('Kiran','B.E Mechanical',9,'LIC1016','9876500016','kiran16@gmail.com','Thoothukudi','2017-01-12','Active'),
('Vinoth','MBA',6,'LIC1017','9876500017','vinoth17@gmail.com','Nagapattinam','2020-09-21','Active'),
('Naveen','B.Tech Auto',7,'LIC1018','9876500018','naveen18@gmail.com','Tenkasi','2019-03-13','Active'),
('Ashok','B.E Mechanical',10,'LIC1019','9876500019','ashok19@gmail.com','Virudhunagar','2016-07-19','Active'),
('Gokul','Diploma Auto',4,'LIC1020','9876500020','gokul20@gmail.com','Pudukkottai','2022-02-14','Active'),
('Sathish','MBA',8,'LIC1021','9876500021','sathish21@gmail.com','Sivagangai','2018-12-08','Active'),
('Kishore','B.E Mechanical',6,'LIC1022','9876500022','kishore22@gmail.com','Dharmapuri','2020-05-25','Active'),
('Ramesh','B.Tech Auto',5,'LIC1023','9876500023','ramesh23@gmail.com','Ariyalur','2021-11-30','Active'),
('Ganesh','Diploma',9,'LIC1024','9876500024','ganesh24@gmail.com','Perambalur','2017-04-28','Active'),
('Lokesh','MBA',7,'LIC1025','9876500025','lokesh25@gmail.com','Ramanathapuram','2019-09-15','Active'),
('Murugan','B.E Mechanical',11,'LIC1026','9876500026','murugan26@gmail.com','Mayiladuthurai','2015-08-11','Active'),
('Dinesh','B.Tech Auto',6,'LIC1027','9876500027','dinesh27@gmail.com','Chengalpattu','2020-10-20','Active'),
('Sanjay','Diploma',5,'LIC1028','9876500028','sanjay28@gmail.com','Krishnagiri','2021-06-12','Active'),
('Aravind','MBA',8,'LIC1029','9876500029','aravind29@gmail.com','Ranipet','2018-03-18','Active'),
('Praveen','B.E Mechanical',12,'LIC1030','9876500030','praveen30@gmail.com','Tiruppur','2014-01-05','Active');

INSERT INTO Inspection
(Claim_ID, Surveyor_ID, Inspection_Date, Inspection_Time, Damage_Level, Estimated_Cost, Report)
VALUES
(1,1,'2025-02-02','10:00:00','Minor',45000,'Front bumper damage'),
(2,2,'2025-02-04','11:00:00','Moderate',110000,'Rear body damaged'),
(3,3,'2025-02-06','09:30:00','Minor',80000,'Door damaged'),
(4,4,'2025-02-09','02:00:00','Major',145000,'Engine affected'),
(5,5,'2025-02-11','03:00:00','Moderate',90000,'Glass replacement'),
(6,6,'2025-02-13','10:30:00','Major',70000,'Engine repair'),
(7,7,'2025-02-16','01:15:00','Minor',40000,'Tyre damage'),
(8,8,'2025-02-18','11:45:00','Moderate',58000,'Wheel repair'),
(9,9,'2025-02-21','09:00:00','Severe',170000,'Major collision'),
(10,10,'2025-02-23','12:00:00','Minor',40000,'Scratch repair'),
(11,11,'2025-02-25','10:15:00','Moderate',70000,'Door replacement'),
(12,12,'2025-02-27','02:30:00','Severe',210000,'Body repair'),
(13,13,'2025-03-02','09:45:00','Major',85000,'Roof damage'),
(14,14,'2025-03-04','11:20:00','Moderate',95000,'Roof repair'),
(15,15,'2025-03-06','03:10:00','Minor',62000,'Headlight replacement'),
(16,16,'2025-03-08','10:40:00','Minor',50000,'Mirror replacement'),
(17,17,'2025-03-11','01:30:00','Moderate',78000,'Front bumper'),
(18,18,'2025-03-13','09:10:00','Major',135000,'Engine repair'),
(19,19,'2025-03-16','02:20:00','Severe',155000,'Flood damage'),
(20,20,'2025-03-19','11:10:00','Severe',195000,'Fire damage'),
(21,21,'2025-03-21','09:30:00','Minor',53000,'Glass repair'),
(22,22,'2025-03-23','10:45:00','Moderate',120000,'Side body repair'),
(23,23,'2025-03-25','12:30:00','Moderate',95000,'Bonnet repair'),
(24,24,'2025-03-27','03:00:00','Severe',170000,'Heavy damage'),
(25,25,'2025-03-29','10:20:00','Moderate',85000,'Front body'),
(26,26,'2025-03-31','01:00:00','Major',140000,'Policy expired'),
(27,27,'2025-04-03','09:40:00','Severe',240000,'Luxury repair'),
(28,28,'2025-04-06','11:30:00','Minor',58000,'Tyre replacement'),
(29,29,'2025-04-08','02:45:00','Moderate',90000,'Engine service'),
(30,30,'2025-04-11','10:10:00','Severe',295000,'Complete repair');

INSERT INTO Garage
(Garage_Name, Owner_Name, Address, City, State, Phone, Email, Rating, Status)
VALUES
('Speed Motors','Arun Kumar','Anna Nagar','Chennai','Tamil Nadu','9876501001','speed1@gmail.com',4.8,'Active'),
('Royal Garage','Ravi Kumar','RS Puram','Coimbatore','Tamil Nadu','9876501002','royal2@gmail.com',4.6,'Active'),
('City Auto Works','Suresh','KK Nagar','Madurai','Tamil Nadu','9876501003','city3@gmail.com',4.5,'Active'),
('Auto Care','Manoj','Hasthampatti','Salem','Tamil Nadu','9876501004','auto4@gmail.com',4.7,'Active'),
('Prime Garage','Karthik','Cantonment','Trichy','Tamil Nadu','9876501005','prime5@gmail.com',4.4,'Active'),
('Star Motors','Vignesh','Gandhipuram','Coimbatore','Tamil Nadu','9876501006','star6@gmail.com',4.3,'Active'),
('Elite Garage','Hari','Katpadi','Vellore','Tamil Nadu','9876501007','elite7@gmail.com',4.9,'Active'),
('Fast Track','Prakash','Bus Stand','Karur','Tamil Nadu','9876501008','fast8@gmail.com',4.5,'Active'),
('Perfect Auto','Ajith','Old Bus Stand','Tiruppur','Tamil Nadu','9876501009','perfect9@gmail.com',4.2,'Active'),
('Smart Garage','Deepak','Bagalur Road','Hosur','Tamil Nadu','9876501010','smart10@gmail.com',4.8,'Active'),
('Trust Motors','Mohan','Mohanur Road','Namakkal','Tamil Nadu','9876501011','trust11@gmail.com',4.5,'Active'),
('Victory Garage','Saravanan','Round Road','Dindigul','Tamil Nadu','9876501012','victory12@gmail.com',4.4,'Active'),
('Power Auto','Rajesh','Beach Road','Cuddalore','Tamil Nadu','9876501013','power13@gmail.com',4.6,'Active'),
('Wheel Care','Senthil','Gandhi Road','Kanchipuram','Tamil Nadu','9876501014','wheel14@gmail.com',4.3,'Active'),
('National Garage','Bala','Medical College Road','Thanjavur','Tamil Nadu','9876501015','national15@gmail.com',4.7,'Active'),
('Rapid Motors','Kiran','Harbour Road','Thoothukudi','Tamil Nadu','9876501016','rapid16@gmail.com',4.6,'Active'),
('Classic Garage','Vinoth','Main Road','Nagapattinam','Tamil Nadu','9876501017','classic17@gmail.com',4.5,'Active'),
('Premium Auto','Naveen','Court Road','Tenkasi','Tamil Nadu','9876501018','premium18@gmail.com',4.8,'Active'),
('Modern Garage','Ashok','Collector Office','Virudhunagar','Tamil Nadu','9876501019','modern19@gmail.com',4.4,'Active'),
('Best Motors','Gokul','Bus Stand','Pudukkottai','Tamil Nadu','9876501020','best20@gmail.com',4.5,'Active'),
('Sai Garage','Sathish','Main Road','Sivagangai','Tamil Nadu','9876501021','sai21@gmail.com',4.6,'Active'),
('SR Auto','Kishore','Pennagaram Road','Dharmapuri','Tamil Nadu','9876501022','sr22@gmail.com',4.4,'Active'),
('RK Motors','Ramesh','Market Road','Ariyalur','Tamil Nadu','9876501023','rk23@gmail.com',4.3,'Active'),
('SK Garage','Ganesh','Old Bus Stand','Perambalur','Tamil Nadu','9876501024','sk24@gmail.com',4.7,'Active'),
('Universal Motors','Lokesh','Main Street','Ramanathapuram','Tamil Nadu','9876501025','uni25@gmail.com',4.5,'Active'),
('Victory Auto','Murugan','Railway Road','Mayiladuthurai','Tamil Nadu','9876501026','victory26@gmail.com',4.6,'Active'),
('Elite Wheels','Dinesh','GST Road','Chengalpattu','Tamil Nadu','9876501027','elite27@gmail.com',4.8,'Active'),
('Speed Auto','Sanjay','Bangalore Road','Krishnagiri','Tamil Nadu','9876501028','speed28@gmail.com',4.4,'Active'),
('Galaxy Garage','Aravind','New Bus Stand','Ranipet','Tamil Nadu','9876501029','galaxy29@gmail.com',4.5,'Active'),
('Supreme Motors','Praveen','Avinashi Road','Tiruppur','Tamil Nadu','9876501030','supreme30@gmail.com',4.9,'Active');

INSERT INTO Repair
(Garage_ID, Vehicle_ID, Repair_Date, Completion_Date, Repair_Type, Parts_Replaced, Repair_Cost, Warranty_Months)
VALUES
(1,1,'2025-02-03','2025-02-06','Bumper Repair','Front Bumper',45000,12),
(2,2,'2025-02-05','2025-02-09','Body Repair','Rear Door',110000,12),
(3,3,'2025-02-07','2025-02-10','Door Repair','Left Door',80000,6),
(4,4,'2025-02-10','2025-02-15','Engine Repair','Engine Parts',145000,24),
(5,5,'2025-02-12','2025-02-15','Glass Repair','Windshield',90000,12),
(6,6,'2025-02-14','2025-02-18','Engine Service','Filters',70000,12),
(7,7,'2025-02-17','2025-02-19','Tyre Change','Tyres',40000,24),
(8,8,'2025-02-19','2025-02-22','Wheel Repair','Wheel Rim',58000,12),
(9,9,'2025-02-22','2025-02-28','Complete Repair','Multiple Parts',170000,24),
(10,10,'2025-02-24','2025-02-25','Paint Work','Paint',40000,6),
(11,11,'2025-02-26','2025-03-01','Door Replacement','Door',70000,12),
(12,12,'2025-02-28','2025-03-05','Body Repair','Body Kit',210000,24),
(13,13,'2025-03-03','2025-03-06','Roof Repair','Roof Panel',85000,12),
(14,14,'2025-03-05','2025-03-08','Roof Repair','Roof',95000,12),
(15,15,'2025-03-07','2025-03-09','Headlight Change','Headlight',62000,12),
(16,16,'2025-03-09','2025-03-10','Mirror Change','Mirror',50000,6),
(17,17,'2025-03-12','2025-03-15','Bumper Repair','Bumper',78000,12),
(18,18,'2025-03-14','2025-03-18','Engine Repair','Engine',135000,24),
(19,19,'2025-03-17','2025-03-21','Flood Repair','Electrical Parts',155000,24),
(20,20,'2025-03-20','2025-03-26','Fire Damage Repair','Complete Wiring',195000,24),
(21,21,'2025-03-22','2025-03-24','Glass Repair','Side Glass',53000,6),
(22,22,'2025-03-24','2025-03-28','Body Repair','Side Panel',120000,12),
(23,23,'2025-03-26','2025-03-29','Bonnet Repair','Bonnet',95000,12),
(24,24,'2025-03-28','2025-04-03','Major Repair','Multiple Parts',170000,24),
(25,25,'2025-03-30','2025-04-02','Front Repair','Front Body',85000,12),
(26,26,'2025-04-01','2025-04-05','Engine Repair','Engine Kit',140000,24),
(27,27,'2025-04-04','2025-04-10','Luxury Repair','Premium Parts',240000,36),
(28,28,'2025-04-07','2025-04-09','Tyre Repair','Tyres',58000,12),
(29,29,'2025-04-09','2025-04-12','Engine Service','Oil Filter',90000,12),
(30,30,'2025-04-12','2025-04-20','Complete Repair','All Major Parts',295000,36);


INSERT INTO Employee
(Branch_ID, Employee_Name, Gender, Designation, Salary, Phone, Email, Joining_Date, Status)
VALUES
(1,'Arun Kumar','Male','Branch Manager',65000,'9876502001','arun1@gmail.com','2021-01-10','Active'),
(2,'Ravi Kumar','Male','Assistant Manager',55000,'9876502002','ravi2@gmail.com','2021-02-15','Active'),
(3,'Priya Sharma','Female','Insurance Officer',42000,'9876502003','priya3@gmail.com','2022-03-01','Active'),
(4,'Karthik Raj','Male','Sales Executive',35000,'9876502004','karthik4@gmail.com','2023-04-12','Active'),
(5,'Divya Lakshmi','Female','Customer Executive',32000,'9876502005','divya5@gmail.com','2022-05-18','Active'),
(6,'Suresh Babu','Male','Insurance Officer',45000,'9876502006','suresh6@gmail.com','2020-06-10','Active'),
(7,'Anitha Devi','Female','Accountant',48000,'9876502007','anitha7@gmail.com','2019-07-08','Active'),
(8,'Vignesh Kumar','Male','Sales Executive',36000,'9876502008','vignesh8@gmail.com','2021-08-16','Active'),
(9,'Meena Rani','Female','HR Executive',50000,'9876502009','meena9@gmail.com','2018-09-20','Active'),
(10,'Prakash','Male','Insurance Officer',43000,'9876502010','prakash10@gmail.com','2022-10-05','Active'),
(11,'Deepak','Male','Cashier',30000,'9876502011','deepak11@gmail.com','2023-01-15','Active'),
(12,'Saravanan','Male','Branch Manager',70000,'9876502012','saravanan12@gmail.com','2017-02-14','Active'),
(13,'Naveen','Male','Assistant Manager',56000,'9876502013','naveen13@gmail.com','2019-03-25','Active'),
(14,'Kavitha','Female','Insurance Officer',44000,'9876502014','kavitha14@gmail.com','2020-04-12','Active'),
(15,'Rajesh','Male','Sales Executive',34000,'9876502015','rajesh15@gmail.com','2022-05-20','Active'),
(16,'Bala','Male','Customer Executive',33000,'9876502016','bala16@gmail.com','2021-06-30','Active'),
(17,'Harini','Female','HR Executive',51000,'9876502017','harini17@gmail.com','2018-07-22','Active'),
(18,'Ajith','Male','Accountant',47000,'9876502018','ajith18@gmail.com','2019-08-11','Active'),
(19,'Mohan','Male','Insurance Officer',42000,'9876502019','mohan19@gmail.com','2020-09-14','Active'),
(20,'Sindhu','Female','Sales Executive',36000,'9876502020','sindhu20@gmail.com','2023-10-01','Active'),
(21,'Ashok','Male','Customer Executive',32000,'9876502021','ashok21@gmail.com','2022-11-19','Active'),
(22,'Vinoth','Male','Insurance Officer',46000,'9876502022','vinoth22@gmail.com','2021-12-15','Active'),
(23,'Keerthana','Female','Cashier',31000,'9876502023','keerthana23@gmail.com','2023-01-20','Active'),
(24,'Ganesh','Male','Assistant Manager',57000,'9876502024','ganesh24@gmail.com','2019-02-14','Active'),
(25,'Preethi','Female','HR Executive',52000,'9876502025','preethi25@gmail.com','2018-03-18','Active'),
(26,'Lokesh','Male','Insurance Officer',43000,'9876502026','lokesh26@gmail.com','2020-04-25','Active'),
(27,'Aravind','Male','Sales Executive',35000,'9876502027','aravind27@gmail.com','2021-05-30','Active'),
(28,'Sanjana','Female','Customer Executive',33000,'9876502028','sanjana28@gmail.com','2022-06-12','Active'),
(29,'Praveen','Male','Branch Manager',72000,'9876502029','praveen29@gmail.com','2017-07-07','Active'),
(30,'Nisha','Female','Insurance Officer',45000,'9876502030','nisha30@gmail.com','2023-08-10','Active');

INSERT INTO Nominee
(Customer_ID, Nominee_Name, Relationship, DOB, Aadhaar_No, Phone, Address)
VALUES
(1,'Ramesh Kumar','Father','1970-05-12','123412341001','9876510001','Chennai'),
(2,'Lakshmi Devi','Mother','1972-03-15','123412341002','9876510002','Coimbatore'),
(3,'Priya Sharma','Wife','1995-07-20','123412341003','9876510003','Madurai'),
(4,'Karthik Raj','Brother','1998-09-10','123412341004','9876510004','Salem'),
(5,'Anitha','Sister','1997-06-11','123412341005','9876510005','Trichy'),
(6,'Vijay Kumar','Father','1969-08-14','123412341006','9876510006','Vellore'),
(7,'Meena','Mother','1975-02-28','123412341007','9876510007','Erode'),
(8,'Suresh','Brother','1994-10-01','123412341008','9876510008','Karur'),
(9,'Divya','Wife','1996-12-12','123412341009','9876510009','Namakkal'),
(10,'Arun','Father','1968-01-18','123412341010','9876510010','Dindigul'),
(11,'Bala','Brother','1993-04-09','123412341011','9876510011','Cuddalore'),
(12,'Kavitha','Mother','1974-05-21','123412341012','9876510012','Kanchipuram'),
(13,'Rajesh','Father','1971-06-16','123412341013','9876510013','Thanjavur'),
(14,'Harini','Wife','1998-03-07','123412341014','9876510014','Thoothukudi'),
(15,'Ganesh','Brother','1992-08-30','123412341015','9876510015','Nagapattinam'),
(16,'Naveen','Father','1967-11-11','123412341016','9876510016','Tenkasi'),
(17,'Sindhu','Mother','1973-09-22','123412341017','9876510017','Virudhunagar'),
(18,'Lokesh','Brother','1994-01-01','123412341018','9876510018','Pudukkottai'),
(19,'Praveen','Father','1970-07-19','123412341019','9876510019','Sivagangai'),
(20,'Nisha','Wife','1997-04-14','123412341020','9876510020','Dharmapuri'),
(21,'Keerthana','Mother','1976-05-26','123412341021','9876510021','Ariyalur'),
(22,'Ajith','Brother','1991-09-09','123412341022','9876510022','Perambalur'),
(23,'Preethi','Wife','1996-02-13','123412341023','9876510023','Ramanathapuram'),
(24,'Ashok','Father','1969-12-20','123412341024','9876510024','Mayiladuthurai'),
(25,'Sanjana','Mother','1975-10-15','123412341025','9876510025','Chengalpattu'),
(26,'Vinoth','Brother','1993-11-18','123412341026','9876510026','Krishnagiri'),
(27,'Aravind','Father','1968-06-22','123412341027','9876510027','Ranipet'),
(28,'Mohan','Brother','1994-07-08','123412341028','9876510028','Tiruppur'),
(29,'Harish','Father','1972-08-12','123412341029','9876510029','Chennai'),
(30,'Riya','Wife','1998-03-25','123412341030','9876510030','Coimbatore');

INSERT INTO Document
(Customer_ID, Document_Name, Document_Number, Document_Type, Issue_Date, Upload_Date, Expiry_Date)
VALUES
(1,'Aadhaar Card','AAD1001','Identity','2018-01-10','2025-01-05','2038-01-10'),
(2,'Driving License','DL1002','License','2020-02-15','2025-01-06','2030-02-15'),
(3,'PAN Card','PAN1003','Identity','2017-03-12','2025-01-07','2047-03-12'),
(4,'RC Book','RC1004','Vehicle','2021-04-10','2025-01-08','2036-04-10'),
(5,'Insurance Copy','INS1005','Insurance','2025-01-01','2025-01-09','2026-01-01'),
(6,'Aadhaar Card','AAD1006','Identity','2018-05-15','2025-01-10','2038-05-15'),
(7,'Driving License','DL1007','License','2019-06-20','2025-01-11','2029-06-20'),
(8,'PAN Card','PAN1008','Identity','2016-07-18','2025-01-12','2046-07-18'),
(9,'RC Book','RC1009','Vehicle','2020-08-22','2025-01-13','2035-08-22'),
(10,'Insurance Copy','INS1010','Insurance','2025-01-02','2025-01-14','2026-01-02'),
(11,'Aadhaar Card','AAD1011','Identity','2018-09-15','2025-01-15','2038-09-15'),
(12,'Driving License','DL1012','License','2020-10-11','2025-01-16','2030-10-11'),
(13,'PAN Card','PAN1013','Identity','2017-11-09','2025-01-17','2047-11-09'),
(14,'RC Book','RC1014','Vehicle','2021-12-05','2025-01-18','2036-12-05'),
(15,'Insurance Copy','INS1015','Insurance','2025-01-03','2025-01-19','2026-01-03'),
(16,'Aadhaar Card','AAD1016','Identity','2018-01-18','2025-01-20','2038-01-18'),
(17,'Driving License','DL1017','License','2019-02-16','2025-01-21','2029-02-16'),
(18,'PAN Card','PAN1018','Identity','2016-03-14','2025-01-22','2046-03-14'),
(19,'RC Book','RC1019','Vehicle','2020-04-12','2025-01-23','2035-04-12'),
(20,'Insurance Copy','INS1020','Insurance','2025-01-04','2025-01-24','2026-01-04'),
(21,'Aadhaar Card','AAD1021','Identity','2018-05-11','2025-01-25','2038-05-11'),
(22,'Driving License','DL1022','License','2019-06-09','2025-01-26','2029-06-09'),
(23,'PAN Card','PAN1023','Identity','2017-07-07','2025-01-27','2047-07-07'),
(24,'RC Book','RC1024','Vehicle','2021-08-05','2025-01-28','2036-08-05'),
(25,'Insurance Copy','INS1025','Insurance','2025-01-05','2025-01-29','2026-01-05'),
(26,'Aadhaar Card','AAD1026','Identity','2018-09-03','2025-01-30','2038-09-03'),
(27,'Driving License','DL1027','License','2020-10-01','2025-02-01','2030-10-01'),
(28,'PAN Card','PAN1028','Identity','2017-11-15','2025-02-02','2047-11-15'),
(29,'RC Book','RC1029','Vehicle','2021-12-20','2025-02-03','2036-12-20'),
(30,'Insurance Copy','INS1030','Insurance','2025-01-06','2025-02-04','2026-01-06');


INSERT INTO Login
(Customer_ID, Username, Password, Role, Last_Login, Account_Status, Security_Question)
VALUES
(1,'customer01','Pass@123','Customer','2025-06-01 09:15:20','Active','What is your pet name?'),
(2,'customer02','Pass@123','Customer','2025-06-02 10:20:15','Active','What is your birth place?'),
(3,'customer03','Pass@123','Customer','2025-06-03 11:30:45','Active','What is your favourite color?'),
(4,'customer04','Pass@123','Customer','2025-06-04 12:10:05','Active','What is your school name?'),
(5,'customer05','Pass@123','Customer','2025-06-05 09:40:30','Active','What is your mother s maiden name?'),
(6,'customer06','Pass@123','Customer','2025-06-06 08:50:20','Inactive','What is your pet name?'),
(7,'customer07','Pass@123','Customer','2025-06-07 01:15:10','Active','What is your favourite food?'),
(8,'customer08','Pass@123','Customer','2025-06-08 02:45:55','Active','What is your birth place?'),
(9,'customer09','Pass@123','Customer','2025-06-09 03:20:40','Locked','What is your first school?'),
(10,'customer10','Pass@123','Customer','2025-06-10 10:35:22','Active','What is your favourite movie?'),
(11,'customer11','Pass@123','Customer','2025-06-11 09:25:12','Active','What is your pet name?'),
(12,'customer12','Pass@123','Customer','2025-06-12 08:45:18','Active','What is your favourite sport?'),
(13,'customer13','Pass@123','Customer','2025-06-13 11:10:30','Inactive','What is your birth city?'),
(14,'customer14','Pass@123','Customer','2025-06-14 02:40:15','Active','What is your favourite teacher?'),
(15,'customer15','Pass@123','Customer','2025-06-15 03:50:45','Active','What is your nickname?'),
(16,'customer16','Pass@123','Customer','2025-06-16 04:15:55','Active','What is your favourite book?'),
(17,'customer17','Pass@123','Customer','2025-06-17 09:30:40','Active','What is your favourite game?'),
(18,'customer18','Pass@123','Customer','2025-06-18 10:20:25','Locked','What is your birth place?'),
(19,'customer19','Pass@123','Customer','2025-06-19 08:10:50','Active','What is your favourite actor?'),
(20,'customer20','Pass@123','Customer','2025-06-20 11:40:35','Active','What is your pet name?'),
(21,'customer21','Pass@123','Customer','2025-06-21 12:15:05','Active','What is your favourite song?'),
(22,'customer22','Pass@123','Customer','2025-06-22 01:45:20','Inactive','What is your favourite food?'),
(23,'customer23','Pass@123','Customer','2025-06-23 02:30:45','Active','What is your birth city?'),
(24,'customer24','Pass@123','Customer','2025-06-24 09:55:18','Active','What is your first school?'),
(25,'customer25','Pass@123','Customer','2025-06-25 10:25:50','Active','What is your pet name?'),
(26,'customer26','Pass@123','Customer','2025-06-26 03:15:40','Active','What is your favourite sport?'),
(27,'customer27','Pass@123','Customer','2025-06-27 04:10:22','Locked','What is your favourite movie?'),
(28,'customer28','Pass@123','Customer','2025-06-28 11:50:35','Active','What is your birth place?'),
(29,'customer29','Pass@123','Customer','2025-06-29 08:35:40','Active','What is your favourite color?'),
(30,'customer30','Pass@123','Customer','2025-06-30 09:45:10','Active','What is your mother s maiden name?');

INSERT INTO Audit_Log
(User_Name, User_Role, Action_Performed, Table_Name, Action_Date, Description)
VALUES
('Admin','Administrator','INSERT','Customer','2025-06-01 09:00:00','New customer record created'),
('Admin','Administrator','UPDATE','Vehicle','2025-06-02 10:15:00','Vehicle details updated'),
('Manager','Manager','INSERT','Insurance_Policy','2025-06-03 11:20:00','New insurance policy created'),
('Officer','Employee','UPDATE','Premium_Payment','2025-06-04 12:10:00','Premium payment updated'),
('Customer01','Customer','LOGIN','Login','2025-06-05 09:30:00','Customer logged in'),
('Admin','Administrator','DELETE','Document','2025-06-06 02:45:00','Old document removed'),
('Manager','Manager','INSERT','Claim','2025-06-07 11:40:00','New claim submitted'),
('Surveyor1','Surveyor','UPDATE','Inspection','2025-06-08 03:20:00','Inspection report updated'),
('Officer','Employee','INSERT','Repair','2025-06-09 10:50:00','Repair details added'),
('Customer02','Customer','LOGIN','Login','2025-06-10 08:30:00','Customer logged in'),
('Admin','Administrator','UPDATE','Garage','2025-06-11 09:45:00','Garage details updated'),
('Manager','Manager','INSERT','Surveyor','2025-06-12 11:10:00','New surveyor added'),
('Officer','Employee','UPDATE','Employee','2025-06-13 12:00:00','Employee salary updated'),
('Customer03','Customer','LOGOUT','Login','2025-06-14 04:15:00','Customer logged out'),
('Admin','Administrator','INSERT','Branch','2025-06-15 10:25:00','New branch created'),
('Manager','Manager','UPDATE','Policy_Type','2025-06-16 09:40:00','Policy premium revised'),
('Officer','Employee','INSERT','Premium_Payment','2025-06-17 01:30:00','Payment received'),
('Customer04','Customer','LOGIN','Login','2025-06-18 11:20:00','Customer logged in'),
('Surveyor2','Surveyor','INSERT','Inspection','2025-06-19 02:10:00','Inspection completed'),
('Admin','Administrator','DELETE','Claim','2025-06-20 03:00:00','Duplicate claim deleted'),
('Manager','Manager','UPDATE','Claim_Status','2025-06-21 10:30:00','Claim approved'),
('Officer','Employee','INSERT','Nominee','2025-06-22 09:20:00','Nominee added'),
('Customer05','Customer','LOGIN','Login','2025-06-23 08:45:00','Customer logged in'),
('Admin','Administrator','UPDATE','Customer','2025-06-24 12:15:00','Customer phone updated'),
('Manager','Manager','INSERT','Vehicle','2025-06-25 01:25:00','New vehicle registered'),
('Officer','Employee','UPDATE','Repair','2025-06-26 11:55:00','Repair completed'),
('Customer06','Customer','LOGOUT','Login','2025-06-27 04:35:00','Customer logged out'),
('Admin','Administrator','INSERT','Audit_Log','2025-06-28 02:40:00','Audit log generated'),
('Manager','Manager','UPDATE','Insurance_Policy','2025-06-29 10:10:00','Policy renewed'),
('Customer07','Customer','LOGIN','Login','2025-06-30 09:00:00','Customer logged in');


-- /1: Customer Policy Details
CREATE VIEW vw_CustomerPolicyDetails AS
SELECT
    c.Customer_ID,
    CONCAT(c.First_Name,' ',c.Last_Name) AS Customer_Name,
    ip.Policy_Number,
    pt.Policy_Name,
    ip.Start_Date,
    ip.End_Date,
    ip.Premium,
    ip.Status
FROM Customer c
JOIN Insurance_Policy ip
ON c.Customer_ID = ip.Customer_ID
JOIN Policy_Type pt
ON ip.PolicyType_ID = pt.PolicyType_ID;


SELECT * FROM vw_CustomerPolicyDetails;


-- /View 2: Branch Premium Collection
CREATE VIEW vw_BranchPremiumCollection AS
SELECT
    b.Branch_Name,
    COUNT(ip.Policy_ID) AS TotalPolicies,
    SUM(pp.Amount) AS TotalCollection,
    ROUND(AVG(pp.Amount),2) AS AverageCollection
FROM Branch b
JOIN Agent a
ON b.Branch_ID=a.Branch_ID
JOIN Insurance_Policy ip
ON a.Agent_ID=ip.Agent_ID
JOIN Premium_Payment pp
ON ip.Policy_ID=pp.Policy_ID
GROUP BY b.Branch_Name;


SELECT * FROM vw_BranchPremiumCollection;

-- /Index 1
CREATE INDEX idx_customer_phone
ON Customer(Phone);
-- / Index 2
CREATE INDEX idx_policy_status
ON Insurance_Policy(Status);

-- /Function 1 : Calculate GST
DELIMITER $$

CREATE FUNCTION fn_CalculateGST
(
Amount DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)

DETERMINISTIC

BEGIN

RETURN Amount*0.18;

END$$

DELIMITER ;


SELECT fn_CalculateGST(50000);


-- /Function 2 : Customer Age
DELIMITER $$

CREATE FUNCTION fn_CustomerAge
(
DOB DATE
)

RETURNS INT

DETERMINISTIC

BEGIN

RETURN TIMESTAMPDIFF(YEAR,DOB,CURDATE());

END$$

DELIMITER ;


SELECT
Customer_ID,
First_Name,
fn_CustomerAge(DOB)
FROM Customer;


-- /Function 3 : Premium Discount
DELIMITER $$

CREATE FUNCTION fn_Discount
(
Premium DECIMAL(10,2)
)

RETURNS DECIMAL(10,2)

DETERMINISTIC

BEGIN

IF Premium>=50000 THEN
RETURN Premium*0.10;

ELSEIF Premium>=20000 THEN
RETURN Premium*0.05;

ELSE
RETURN Premium*0.02;

END IF;

END$$

DELIMITER ;


SELECT
Policy_Number,
Premium,
fn_Discount(Premium) AS Discount
FROM Insurance_Policy;

 -- /Procedure 1 : Customer Policies
DELIMITER $$

CREATE PROCEDURE sp_CustomerPolicies
(
IN cid INT
)

BEGIN

SELECT
c.First_Name,
c.Last_Name,
ip.Policy_Number,
pt.Policy_Name,
ip.Premium
FROM Customer c
JOIN Insurance_Policy ip
ON c.Customer_ID=ip.Customer_ID
JOIN Policy_Type pt
ON ip.PolicyType_ID=pt.PolicyType_ID
WHERE c.Customer_ID=cid;

END$$

DELIMITER ;

-- /Execute

CALL sp_CustomerPolicies(1);


-- /Procedure 2 : Branch Premium Report
DELIMITER $$

CREATE PROCEDURE sp_BranchPremium
()

BEGIN

SELECT
b.Branch_Name,
SUM(pp.Amount) AS TotalPremium
FROM Branch b
JOIN Agent a
ON b.Branch_ID=a.Branch_ID
JOIN Insurance_Policy ip
ON a.Agent_ID=ip.Agent_ID
JOIN Premium_Payment pp
ON ip.Policy_ID=pp.Policy_ID
GROUP BY b.Branch_Name;

END$$

DELIMITER ;

-- /Execute

CALL sp_BranchPremium();


-- / Procedure 3 : Claim Details
DELIMITER $$

CREATE PROCEDURE sp_ClaimDetails
(
IN pid INT
)

BEGIN

SELECT
Policy_ID,
Claim_Amount,
Approved_Amount,
Description
FROM Claim
WHERE Policy_ID=pid;

END$$

DELIMITER ;

-- / Execute

CALL sp_ClaimDetails(5);


-- / Trigger 1 : Audit Policy Insert
DELIMITER $$

CREATE TRIGGER trg_Policy_Insert

AFTER INSERT

ON Insurance_Policy

FOR EACH ROW

BEGIN

INSERT INTO Audit_Log
(
User_Name,
User_Role,
Action_Performed,
Table_Name,
Action_Date,
Description
)

VALUES
(
'SYSTEM',
'ADMIN',
'INSERT',
'Insurance_Policy',
NOW(),
CONCAT('Policy Created : ',NEW.Policy_Number)
);

END$$

DELIMITER ;


-- /Trigger 2 : Audit Claim Insert
DELIMITER $$

CREATE TRIGGER trg_Claim_Insert

AFTER INSERT

ON Claim

FOR EACH ROW

BEGIN

INSERT INTO Audit_Log
(
User_Name,
User_Role,
Action_Performed,
Table_Name,
Action_Date,
Description
)

VALUES
(
'SYSTEM',
'CLAIM',
'INSERT',
'Claim',
NOW(),
CONCAT('Claim Added : ',NEW.Claim_ID)
);

END$$

DELIMITER ;


-- /Transaction 1 : Premium Payment
START TRANSACTION;

UPDATE Premium_Payment

SET Amount=Amount+500

WHERE Payment_ID=1;

SAVEPOINT Payment_Update;

UPDATE Insurance_Policy

SET Premium=Premium+500

WHERE Policy_ID=1;

COMMIT;


-- /Transaction 2 : Rollback Example
START TRANSACTION;
UPDATE Employee
SET Salary=Salary+5000

WHERE Employee_ID=5;

SAVEPOINT Salary_Update;

UPDATE Employee

SET Salary=Salary+10000

WHERE Employee_ID=10;

ROLLBACK TO Salary_Update;

COMMIT;


-- / 1.Find total premium collected by each branch.
SELECT
    b.Branch_ID,
    b.Branch_Name,
    COUNT(ip.Policy_ID) AS Total_Policies,
    SUM(pp.Amount) AS Total_Premium,
    ROUND(AVG(pp.Amount),2) AS Average_Premium
FROM Branch b
JOIN Agent a
ON b.Branch_ID=a.Branch_ID
JOIN Insurance_Policy ip
ON a.Agent_ID=ip.Agent_ID
JOIN Premium_Payment pp
ON ip.Policy_ID=pp.Policy_ID
WHERE pp.Payment_Status='Paid'
GROUP BY b.Branch_ID,b.Branch_Name
HAVING SUM(pp.Amount)>50000
ORDER BY Total_Premium DESC;

-- / 2.Top customers based on premium payment.
SELECT
c.Customer_ID,
CONCAT(c.First_Name,' ',c.Last_Name) AS Customer_Name,
COUNT(ip.Policy_ID) AS Policies,
SUM(pp.Amount) AS Total_Paid
FROM Customer c
JOIN Insurance_Policy ip
ON c.Customer_ID=ip.Customer_ID
JOIN Premium_Payment pp
ON ip.Policy_ID=pp.Policy_ID
WHERE pp.Payment_Status='Paid'
GROUP BY c.Customer_ID,Customer_Name
HAVING SUM(pp.Amount)>10000
ORDER BY Total_Paid DESC;

-- /3. Agents generating highest premium.
SELECT
a.Agent_ID,
a.Agent_Name,
COUNT(ip.Policy_ID) TotalPolicies,
SUM(pp.Amount) TotalCollection,
ROUND(AVG(pp.Amount),2) AveragePremium
FROM Agent a
JOIN Insurance_Policy ip
ON a.Agent_ID=ip.Agent_ID
JOIN Premium_Payment pp
ON ip.Policy_ID=pp.Policy_ID
GROUP BY a.Agent_ID,a.Agent_Name
HAVING COUNT(ip.Policy_ID)>=2
ORDER BY TotalCollection DESC;


-- / 4.Vehicle-wise insurance report.
SELECT
vt.Vehicle_Type,
COUNT(v.Vehicle_ID) TotalVehicles,
COUNT(ip.Policy_ID) PoliciesIssued,
SUM(pp.Amount) PremiumCollected
FROM Vehicle_Type vt
JOIN Vehicle v
ON vt.VehicleType_ID=v.VehicleType_ID
JOIN Insurance_Policy ip
ON v.Vehicle_ID=ip.Vehicle_ID
JOIN Premium_Payment pp
ON ip.Policy_ID=pp.Policy_ID
GROUP BY vt.Vehicle_Type
HAVING SUM(pp.Amount)>10000;

-- / 5.Pending claims.
SELECT
c.Claim_ID,
cs.Status_Name,
ip.Policy_Number,
CONCAT(cu.First_Name,' ',cu.Last_Name) Customer_Name,
c.Claim_Amount,
DATEDIFF(CURDATE(),c.Claim_Date) DaysPending
FROM Claim c
JOIN Claim_Status cs
ON c.Status_ID=cs.Status_ID
JOIN Insurance_Policy ip
ON c.Policy_ID=ip.Policy_ID
JOIN Customer cu
ON ip.Customer_ID=cu.Customer_ID
WHERE cs.Status_Name='Pending';

-- / 6.Branch employee salary report.
SELECT
b.Branch_Name,
COUNT(e.Employee_ID) Employees,
SUM(e.Salary) TotalSalary,
MAX(e.Salary) HighestSalary,
MIN(e.Salary) LowestSalary,
ROUND(AVG(e.Salary),2) AverageSalary
FROM Branch b
JOIN Employee e
ON b.Branch_ID=e.Branch_ID
GROUP BY b.Branch_Name
HAVING SUM(e.Salary)>50000;

 -- / 7.Garage repair report.
SELECT
g.Garage_Name,
COUNT(r.Repair_ID) Repairs,
SUM(r.Repair_Cost) TotalRepairCost,
ROUND(AVG(r.Repair_Cost),2) AvgRepair
FROM Garage g
JOIN Repair r
ON g.Garage_ID=r.Garage_ID
GROUP BY g.Garage_Name
ORDER BY TotalRepairCost DESC;


-- /8. Business Scenario
-- /Claim approval summary.
SELECT
YEAR(Claim_Date) Year,
COUNT(Claim_ID) TotalClaims,
SUM(Claim_Amount) ClaimedAmount,
SUM(Approved_Amount) ApprovedAmount
FROM Claim
GROUP BY YEAR(Claim_Date)
HAVING COUNT(Claim_ID)>=1;


-- /9. Business Scenario
-- / Monthly premium collection.
SELECT
YEAR(Payment_Date) Year,
MONTH(Payment_Date) Month,
COUNT(Payment_ID) Payments,
SUM(Amount) TotalCollection
FROM Premium_Payment
GROUP BY YEAR(Payment_Date),MONTH(Payment_Date)
ORDER BY Year,Month;


-- /10. Business Scenario

SELECT
ip.Policy_Number,
CONCAT(c.First_Name,' ',c.Last_Name) Customer,
a.Agent_Name,
vt.Vehicle_Type,
pt.Policy_Name,
ip.Premium
FROM Insurance_Policy ip
JOIN Customer c
ON ip.Customer_ID=c.Customer_ID
JOIN Agent a
ON ip.Agent_ID=a.Agent_ID
JOIN Vehicle v
ON ip.Vehicle_ID=v.Vehicle_ID
JOIN Vehicle_Type vt
ON v.VehicleType_ID=vt.VehicleType_ID
JOIN Policy_Type pt
ON ip.PolicyType_ID=pt.PolicyType_ID
WHERE ip.Status='Active';


-- /11. Customers having more than one policy
SELECT
Customer_ID,
COUNT(*) TotalPolicies
FROM Insurance_Policy
GROUP BY Customer_ID
HAVING COUNT(*)>1;


-- /12. Highest claim amount
SELECT
MAX(Claim_Amount) HighestClaim,
MIN(Claim_Amount) LowestClaim,
AVG(Claim_Amount) AverageClaim
FROM Claim;


-- /13. Customer age calculation
SELECT
Customer_ID,
CONCAT(First_Name,' ',Last_Name) Customer,
TIMESTAMPDIFF(YEAR,DOB,CURDATE()) Age
FROM Customer
WHERE TIMESTAMPDIFF(YEAR,DOB,CURDATE())>=18;


-- /14. Vehicle manufacturing report
SELECT
Manufacture_Year,
COUNT(*) Vehicles
FROM Vehicle
GROUP BY Manufacture_Year
ORDER BY Manufacture_Year DESC;


-- /15. Surveyor inspection report
SELECT
s.Surveyor_Name,
COUNT(i.Inspection_ID) TotalInspection,
SUM(i.Estimated_Cost) TotalEstimate
FROM Surveyor s
JOIN Inspection i
ON s.Surveyor_ID=i.Surveyor_ID
GROUP BY s.Surveyor_Name;


-- /16. Policy expiry report
SELECT
Policy_Number,
End_Date,
DATEDIFF(End_Date,CURDATE()) RemainingDays
FROM Insurance_Policy
WHERE End_Date>=CURDATE();


-- /17. Claim percentage approval
SELECT
Claim_ID,
Claim_Amount,
Approved_Amount,
ROUND((Approved_Amount/Claim_Amount)*100,2) ApprovalPercentage
FROM Claim;


-- /18. Payment status report
SELECT
Payment_Status,
COUNT(*) TotalPayments,
SUM(Amount) TotalAmount
FROM Premium_Payment
GROUP BY Payment_Status;


-- /19. Customer vehicle report using LEFT JOIN
SELECT
CONCAT(c.First_Name,' ',c.Last_Name) Customer,
v.Registration_No,
vt.Vehicle_Type
FROM Customer c
LEFT JOIN Vehicle v
ON c.Customer_ID=v.Customer_ID
LEFT JOIN Vehicle_Type vt
ON v.VehicleType_ID=vt.VehicleType_ID;
 
 
 -- /20. Comprehensive Business Report (Large Query)
SELECT
b.Branch_Name,
a.Agent_Name,
CONCAT(c.First_Name,' ',c.Last_Name) AS Customer_Name,
vt.Vehicle_Type,
pt.Policy_Name,
COUNT(ip.Policy_ID) AS TotalPolicies,
SUM(pp.Amount) AS TotalPremium,
SUM(IFNULL(cl.Claim_Amount,0)) AS TotalClaimAmount,
SUM(IFNULL(cl.Approved_Amount,0)) AS ApprovedClaim,
ROUND(AVG(pp.Amount),2) AS AvgPremium,
MAX(pp.Amount) AS HighestPremium,
MIN(pp.Amount) AS LowestPremium,
CASE
WHEN SUM(pp.Amount)>=100000 THEN 'Excellent'
WHEN SUM(pp.Amount)>=50000 THEN 'Good'
ELSE 'Average'
END AS BusinessStatus
FROM Branch b
JOIN Agent a
ON b.Branch_ID=a.Branch_ID
JOIN Insurance_Policy ip
ON a.Agent_ID=ip.Agent_ID
JOIN Customer c
ON ip.Customer_ID=c.Customer_ID
JOIN Vehicle v
ON ip.Vehicle_ID=v.Vehicle_ID
JOIN Vehicle_Type vt
ON v.VehicleType_ID=vt.VehicleType_ID
JOIN Policy_Type pt
ON ip.PolicyType_ID=pt.PolicyType_ID
JOIN Premium_Payment pp
ON ip.Policy_ID=pp.Policy_ID
LEFT JOIN Claim cl
ON ip.Policy_ID=cl.Policy_ID
WHERE pp.Payment_Status='Paid'
GROUP BY
b.Branch_Name,
a.Agent_Name,
Customer_Name,
vt.Vehicle_Type,
pt.Policy_Name
HAVING SUM(pp.Amount)>5000
ORDER BY TotalPremium DESC; 



