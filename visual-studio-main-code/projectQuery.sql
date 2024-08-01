USE projectDatabase;

CREATE TABLE Admin (
    AdminID VARCHAR(255) PRIMARY KEY,
    AdminName VARCHAR(255),
    AdminEmail VARCHAR(255),
    AdminOffice VARCHAR(50),
    AdminPhone VARCHAR(15)
);
INSERT INTO Admin (AdminID, AdminName, AdminEmail, AdminOffice, AdminPhone) 
VALUES 
('A001', 'Ifrah', 'ifrah.qaiser@nu.edu.pk', 'Room 109', '0300-1234567');

CREATE TABLE Faculty (
    FacultyID VARCHAR(255) PRIMARY KEY,
    FacultyName VARCHAR(255),
    FacultyEmail VARCHAR(255),
    FacultyOffice VARCHAR(50),
    FacultyPhone VARCHAR(15)
);

INSERT INTO Faculty (FacultyID, FacultyName, FacultyEmail, FacultyOffice, FacultyPhone) 
VALUES 
('F001', 'Ayesha Khan', 'ayesha.khan@nu.edu.pk', 'Room 101', '0300-1234567'),
('F002', 'Muhammad Ali', 'muhammad.ali@nu.edu.pk', 'Room 102', '0301-2345678'),
('F003', 'Fatima Ahmed', 'fatima.ahmed@nu.edu.pk', 'Room 103', '0302-3456789'),
('F004', 'Ahmed Raza', 'ahmed.raza@nu.edu.pk', 'Room 104', '0303-4567890'),
('F005', 'Sara Ali', 'sara.ali@nu.edu.pk', 'Room 105', '0304-5678901'),
('F006', 'Omar Farooq', 'omar.farooq@nu.edu.pk', 'Room 106', '0305-6789012'),
('F007', 'Hina Mir', 'hina.mir@nu.edu.pk', 'Room 107', '0306-7890123'),
('F008', 'Asad Ullah', 'asad.ullah@nu.edu.pk', 'Room 108', '0307-8901234'),
('F009', 'Zara Noor', 'zara.noor@nu.edu.pk', 'Room 109', '0308-9012345'),
('F010', 'Bilal Khan', 'bilal.khan@nu.edu.pk', 'Room 110', '0309-0123456');


CREATE TABLE Students (
    StudentID VARCHAR(255) PRIMARY KEY,
    StudentName VARCHAR(255),
    StudentEmail VARCHAR(255),
    StudentContactNumber VARCHAR(15)
);

INSERT INTO Students (StudentID, StudentName, StudentEmail, StudentContactNumber) VALUES 
('S001', 'Ayesha Khan', 'ayesha.khan@email.com', '0300-1234567'),
('S002', 'Bilal Ahmed', 'bilal.ahmed@email.com', '0301-1234568'),
('S003', 'Hassan Ali', 'hassan.ali@email.com', '0302-1234569'),
('S004', 'Fatima Ijaz', 'fatima.ijaz@email.com', '0303-1234570'),
('S005', 'Umar Farooq', 'umar.farooq@email.com', '0304-1234571'),
('S006', 'Zara Noor', 'zara.noor@email.com', '0305-1234572'),
('S007', 'Ali Rehman', 'ali.rehman@email.com', '0306-1234573'),
('S008', 'Sana Mir', 'sana.mir@email.com', '0307-1234574'),
('S009', 'Fahad Mustafa', 'fahad.mustafa@email.com', '0308-1234575'),
('S010', 'Hira Mani', 'hira.mani@email.com', '0309-1234576');



CREATE TABLE LabDemonstrators (
    LDID VARCHAR(255) PRIMARY KEY,
    StudentID VARCHAR(255),
    RatePerHour INT,
    FacultyID VARCHAR(255),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
INSERT INTO LabDemonstrators (LDID, StudentID, RatePerHour, FacultyID) VALUES 
('S001', 'S001', 500, 'F001'),  -- This student is both a TA and an LD
('S002', 'S002', 500, 'F001'),
('S003', 'S003', 500, 'F005'),
('S004', 'S004', 500, 'F005'),  -- This student is both a TA and an LD
('S005', 'S005', 500, 'F003'),
('S006', 'S006', 500, 'F009');

CREATE TABLE Tasks (
    TaskID VARCHAR(255) PRIMARY KEY,
    TaskName VARCHAR(255),
    Details TEXT,
    Deadline DATE,
    Scene BIT,
	FacultyID VARCHAR(255),
	FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);
INSERT INTO Tasks (TaskID, TaskName, Details, Deadline, Scene, FacultyID) VALUES 
('T001', 'Checking Quizzes', 'Checking quizzes for the Computer Programming course', '2023-12-15', 0, 'F001'),
('T002', 'Assignment Demos', 'Conducting assignment demos for Data Structures', '2023-11-30', 0, 'F002'),
('T003', 'Assignment Grading', 'Grading assignments for Algorithms', '2023-12-10', 0, 'F003'),
('T004', 'Lab Preparation', 'Preparing lab materials for Operating Systems course', '2023-11-25', 0, 'F004'),
('T005', 'Quiz Creation', 'Creating quizzes for Database Management Systems', '2023-12-05', 0, 'F005'),
('T006', 'Research Assistance', 'Assisting in research for Machine Learning project', '2023-12-20', 0, 'F006'),
('T007', 'Software Installation', 'Handling software installation for the Programming Languages lab', '2023-11-28', 0, 'F007'),
('T008', 'Tutorial Sessions', 'Conducting tutorial sessions for Networking', '2023-12-08', 0, 'F008'),
('T009', 'Project Supervision', 'Supervising projects for Web Development course', '2023-12-18', 0, 'F009'),
('T010', 'Office Hours', 'Managing office hours for student queries in Artificial Intelligence', '2023-12-12', 0, 'F010');


CREATE TABLE TeacherAssistants (
    TAID VARCHAR(255) PRIMARY KEY,
    StudentID VARCHAR(255),
    RatePerStudent INT,
    TotalStudents INT,
    TaskID VARCHAR(255),
	FacultyID varchar(255),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
    FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID)
);

INSERT INTO TeacherAssistants (TAID, StudentID, RatePerStudent, TotalStudents, TaskID, FacultyID) VALUES 
('S001', 'S001', 250, 35, 'T001', 'F001'),
('S008', 'S008', 250, 40, 'T002', 'F002'),
('S007', 'S007', 250, 45, 'T003', 'F003'),
('S004', 'S004', 250, 50, 'T007', 'F007'),
('S009', 'S009', 250, 55, 'T005', 'F005'),
('S010', 'S010', 250, 30, 'T006', 'F006')



CREATE TABLE COURSE (
	COURSEID VARCHAR(255) PRIMARY KEY,
	COURSENAME VARCHAR(255),
	FacultyID VARCHAR(255),
	Details TEXT,
	CreditHours int,
	FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

INSERT INTO Course (COURSEID, COURSENAME, FacultyID) VALUES 
('CS101', 'Computer Programming', 'F001'),  -- Aligned with T001
('CS102', 'Data Structures', 'F002'),       -- Aligned with T002
('CS103', 'Algorithms', 'F003'),            -- Aligned with T003
('CS104', 'Operating Systems', 'F004'),     -- Aligned with T004
('CS105', 'Database Management Systems', 'F005'), -- Aligned with T005
('CS106', 'Machine Learning', 'F006'),      -- Aligned with T006
('CS107', 'Programming Languages', 'F007'), -- Aligned with T007
('CS108', 'Networking', 'F008'),            -- Aligned with T008
('CS109', 'Web Development', 'F009'),       -- Aligned with T009
('CS110', 'Artificial Intelligence', 'F010'); -- Aligned with T010

--SELECT
--    F.FacultyName, 
--    F.FacultyEmail, 
--    C.COURSENAME, 
--    TA.TAID, 
--    LD.LDID 
--FROM Faculty F
--LEFT JOIN Course C ON F.FacultyID = C.FacultyID
--LEFT JOIN TeacherAssistants TA ON F.FacultyID = TA.FacultyID
--LEFT JOIN LabDemonstrators LD ON F.FacultyID = LD.FacultyID;

--SELECT 
--    S.StudentName,
--    S.StudentEmail,
--    TA.TAID,
--	F.FacultyName,
--    C.CourseName
--	FROM Faculty F
--	INNER JOIN TeacherAssistants TA ON F.FacultyID = TA.FacultyID
--	INNER JOIN Students S ON TA.StudentID = S.StudentID
--	INNER JOIN Course C ON F.FacultyID = C.FacultyID
--	ORDER BY TA.TAID ASC;

CREATE TABLE Attendance (
    AttendanceID VARCHAR(255) PRIMARY KEY,
    AttendanceDate DATE,
    LDID VARCHAR(255),
    FacultyID VARCHAR(255),
    FOREIGN KEY (LDID) REFERENCES LabDemonstrators(LDID),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);
-- Sample Student Attendance Records
INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A001', '2023-11-01', 'S001', 'F001');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A002', '2023-11-02', 'S001', 'F001');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A003', '2023-11-03', 'S001', 'F001');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A004', '2023-11-04', 'S001', 'F001');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A005', '2023-11-05', 'S001', 'F001');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A006', '2023-11-06', 'S001', 'F001');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A007', '2023-11-07', 'S002', 'F002');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A008', '2023-11-08', 'S002', 'F002');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A009', '2023-11-09', 'S002', 'F002');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A010', '2023-11-10', 'S002', 'F002');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A011', '2023-11-11', 'S003', 'F003');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A012', '2023-11-12', 'S003', 'F003');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A013', '2023-11-13', 'S003', 'F003');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A014', '2023-11-14', 'S003', 'F003');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A015', '2023-11-15', 'S004', 'F004');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A016', '2023-11-16', 'S004', 'F004');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A017', '2023-11-17', 'S004', 'F004');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A018', '2023-11-18', 'S005', 'F005');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A019', '2023-11-19', 'S006', 'F006');

INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID)
VALUES ('A020', '2023-11-20', 'S006', 'F006');




--SELECT
--    LD.LDID AS LD_ID,
--    S.StudentName AS LD_Name,
--    F.FacultyName,
--    COUNT(A.AttendanceID) AS Number_of_Attendance_Days
--FROM
--    LabDemonstrators LD
--INNER JOIN
--    Students S ON LD.StudentID = S.StudentID
--INNER JOIN
--    Faculty F ON LD.FacultyID = F.FacultyID
--LEFT JOIN
--    Attendance A ON LD.LDID = A.LDID
--GROUP BY
--    LD.LDID, S.StudentName, F.FacultyName
--ORDER BY
--    LD.LDID;

SELECT LD.LDID, C.COURSENAME, COUNT(A.AttendanceID) AS AttendanceCount
FROM LabDemonstrators LD
INNER JOIN Students S ON LD.StudentID = S.StudentID
INNER JOIN Faculty F ON LD.FacultyID = F.FacultyID
LEFT JOIN Attendance A ON LD.LDID = A.LDID
LEFT JOIN Course C ON LD.FacultyID = C.FacultyID
WHERE LD.FacultyID = 'F004'
GROUP BY LD.LDID, C.COURSENAME
ORDER BY LD.LDID, C.COURSENAME;



SELECT TA.TAID, C.COURSENAME, T.TaskID, T.Details, T.Scene 
                                     FROM TeacherAssistants TA 
                                     INNER JOIN Course C ON TA.FacultyID = C.FacultyID 
                                     INNER JOIN Tasks T ON TA.TaskID = T.TaskID 
                                     WHERE TA.FacultyID = 'F001';
									 
SELECT * FROM TeacherAssistants WHERE TAID = 'S012' AND StudentID IN (SELECT StudentID FROM Students WHERE StudentName = 'S012');


select *
from Tasks


INSERT INTO Students (StudentID, StudentName, StudentEmail, StudentContactNumber) VALUES 
('S012', 'Muhammad Yahya', 'yahya@email.com', '0330-1212367');



ALTER TABLE Tasks
ADD TAID VARCHAR(255);

ALTER TABLE Tasks
ADD FOREIGN KEY (TAID) REFERENCES TeacherAssistants(TAID);

INSERT INTO Tasks (TaskID, TaskName, Details, Deadline, Scene, FacultyID, TAID) VALUES 
('T033', 'Checking Quizzes', 'Checking quizzes for the Computer Programming course', '2023-12-15', 0, 'F001', 'S001'),
('T034', 'Assignment Demos', 'Conducting assignment demos for Data Structures', '2023-11-30', 0, 'F001', 'S001'),
('T035', 'Assignment Grading', 'Grading assignments for Algorithms', '2023-12-10', 0, 'F001', 'S003'),
('T036', 'Lab Preparation', 'Preparing lab materials for Operating Systems course', '2023-11-25', 0, 'F001', 'S001'),
('T037', 'Quiz Creation', 'Creating quizzes for Database Management Systems', '2023-12-05', 0, 'F001', 'S001'),
('T038', 'Research Assistance', 'Assisting in research for Machine Learning project', '2023-12-20', 0, 'F001', 'S001'),
('T039', 'Software Installation', 'Handling software installation for the Programming Languages lab', '2023-11-28', 0, 'F001', 'S001'),
('T040', 'Tutorial Sessions', 'Conducting tutorial sessions for Networking', '2023-12-08', 0, 'F001', 'S001'),
('T041', 'Project Supervision', 'Supervising projects for Web Development course', '2023-12-18', 0, 'F001', 'S001'),
('T042', 'Office Hours', 'Managing office hours for student queries in Artificial Intelligence', '2023-12-12', 0, 'F001', 'S001');


CREATE TABLE StudentFeedback (
    FeedbackID INT PRIMARY KEY IDENTITY(1,1),
    StudentID VARCHAR(255),
    FacultyID VARCHAR(255),
    FeedbackText TEXT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

--CREATE TABLE Payment (
--    PaymentID INT PRIMARY KEY IDENTITY(1,1), -- auto increment key
--    LDID VARCHAR(255) NULL,
--    TAID VARCHAR(255) NULL,
--    TotalPayment DECIMAL(10, 2),
--    PaymentDate DATETIME DEFAULT GETDATE(), -- default getdate for Insert date
--    ProcessedBy VARCHAR(255),
--    FOREIGN KEY (LDID) REFERENCES LabDemonstrators(LDID),
--    FOREIGN KEY (TAID) REFERENCES TeacherAssistants(TAID),
--    FOREIGN KEY (ProcessedBy) REFERENCES Admin(AdminID)
--);

--ALTER TABLE Payment
--DROP CONSTRAINT FK__Payment__LDID__5629CD9C

--ALTER TABLE Payment
--DROP CONSTRAINT FK__Payment__TAID__571DF1D5



-- Audit Trail (Bonus)
CREATE TABLE AdminLog (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    Message VARCHAR(255),
    LogTime DATETIME
);

-- TA
CREATE OR ALTER TRIGGER trg_TA_AfterInsert
ON TeacherAssistants
AFTER INSERT
AS
BEGIN
    INSERT INTO AdminLog (Message, LogTime)
    SELECT 'TA inserted', GETDATE()
    FROM inserted;
END;


CREATE OR ALTER TRIGGER trg_TA_AfterDelete
ON TeacherAssistants
AFTER DELETE
AS
BEGIN
    INSERT INTO AdminLog (Message, LogTime)
    SELECT 'TA deleted', GETDATE()
    FROM deleted;
END;

-- LD
CREATE OR ALTER TRIGGER trg_LD_AfterInsert
ON LabDemonstrators
AFTER INSERT
AS
BEGIN
    INSERT INTO AdminLog (Message, LogTime)
    SELECT 'LD inserted', GETDATE()
    FROM inserted;
END;

CREATE OR ALTER TRIGGER trg_LD_AfterDelete
ON LabDemonstrators
AFTER DELETE
AS
BEGIN
    INSERT INTO AdminLog (Message, LogTime)
    SELECT 'LD deleted', GETDATE()
    FROM deleted;
END;


CREATE TABLE PaymentLog (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    TotalPayment DECIMAL(10, 2),
    ProcessedBy VARCHAR(255), -- foreign key to Admin table
    ActionTaken VARCHAR(50),
    LogDate DATETIME DEFAULT GETDATE(), -- Date and time of the log entry
    FOREIGN KEY (ProcessedBy) REFERENCES Admin(AdminID)
);

CREATE OR ALTER TRIGGER trg_AfterInsertPayment
ON Payment
AFTER INSERT
AS
BEGIN
    INSERT INTO PaymentLog (TotalPayment, ProcessedBy, ActionTaken)
    SELECT TotalPayment, ProcessedBy, 'Payment Processed'
    FROM inserted;
END;

select * from PaymentLog;
select * from AdminLog;

select * from Payment;
select * from LabDemonstrators;
select * from Attendance;
select * from Students;
select * from TeacherAssistants;
select * from Faculty;
select * from StudentFeedback;

