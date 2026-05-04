-- ============================================
-- CMRIT-PYQB Database Setup (MySQL)
-- Matches folder: question_papers/{SEM}/{session}/{BRANCH}/{file}.pdf
-- ============================================

CREATE DATABASE IF NOT EXISTS cmrit_pyqb;
USE cmrit_pyqb;

-- ─── 0. DROP EXISTING TABLES (if they exist) ───
-- Drop in reverse order of dependencies

DROP TABLE IF EXISTS question_papers;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS semesters;
DROP TABLE IF EXISTS years;
DROP TABLE IF EXISTS branches;

-- ─── 1. CREATE TABLES ───

CREATE TABLE branches (
    branch_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_name VARCHAR(100),
    branch_code VARCHAR(10)
);

CREATE TABLE years (
    year_id INT AUTO_INCREMENT PRIMARY KEY,
    year_name VARCHAR(20)
);

CREATE TABLE semesters (
    semester_id INT AUTO_INCREMENT PRIMARY KEY,
    year_id INT,
    semester_number INT,
    FOREIGN KEY (year_id) REFERENCES years(year_id)
);

CREATE TABLE subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_id INT,
    semester_id INT,
    subject_name VARCHAR(150),
    subject_code VARCHAR(20),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id),
    FOREIGN KEY (semester_id) REFERENCES semesters(semester_id)
);

CREATE TABLE question_papers (
    paper_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_id INT,
    exam_session VARCHAR(30),
    file_path VARCHAR(500),
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

-- ─── 2. INSERT BRANCHES ───
-- 1=AIDS, 2=AIML, 3=ISE, 4=CSDS, 5=CSML, 6=EC, 7=CIVIL, 8=CSE, 9=EEE

INSERT INTO branches (branch_name, branch_code) VALUES
('Artificial Intelligence & Data Science','AIDS'),
('Artificial Intelligence & Machine Learning','AIML'),
('Information Science & Engineering','ISE'),
('Computer Science & Data Science','CSDS'),
('Computer Science & Machine Learning','CSML'),
('Electronics and Communication','EC'),
('Civil Engineering','CIVIL'),
('Computer Science & Engineering','CSE'),
('Electrical & Electronics Engineering','EEE');

-- ─── 3. INSERT YEARS & SEMESTERS ───

INSERT INTO years (year_name) VALUES
('1st Year'),('2nd Year'),('3rd Year'),('4th Year');

INSERT INTO semesters (year_id, semester_number) VALUES
(1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(4,7),(4,8);
-- semester_id: 1=Sem1, 2=Sem2, 3=Sem3, 4=Sem4, 5=Sem5, 6=Sem6, 7=Sem7, 8=Sem8

-- ─── 4. INSERT SUBJECTS ───

-- === 3rd Semester (semester_id=3) ===

-- AIDS (1) — subject_id 1-5
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(1,3,'Digital Design & Computer Organization','DDCO'),
(1,3,'Data Structures & Algorithms','DSA'),
(1,3,'Java Programming','JAVA'),
(1,3,'Mathematics','MATHS'),
(1,3,'Operating Systems','OS');

-- AIML (2) — subject_id 6-10
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(2,3,'Digital Design & Computer Organization','DDCO'),
(2,3,'Data Structures & Algorithms','DSA'),
(2,3,'Java Programming','JAVA'),
(2,3,'Mathematics','MATHS'),
(2,3,'Operating Systems','OS');

-- ISE (3) — subject_id 11-15
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(3,3,'Digital Design & Computer Organization','DDCO'),
(3,3,'Data Structures & Algorithms','DSA'),
(3,3,'Java Programming','JAVA'),
(3,3,'Mathematics','MATHS'),
(3,3,'Operating Systems','OS');

-- CSDS (4) — subject_id 16-20
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(4,3,'Digital Design & Computer Organization','DDCO'),
(4,3,'Data Structures & Algorithms','DSA'),
(4,3,'Java Programming','JAVA'),
(4,3,'Mathematics','MATHS'),
(4,3,'Operating Systems','OS');

-- CSML (5) — subject_id 21-25
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(5,3,'Digital Design & Computer Organization','DDCO'),
(5,3,'Data Structures & Algorithms','DSA'),
(5,3,'Java Programming','JAVA'),
(5,3,'Mathematics','MATHS'),
(5,3,'Operating Systems','OS');

-- EC (6) — subject_id 26-31
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(6,3,'Computer Organization & Architecture','COA'),
(6,3,'Digital System Design using Verilog','DSDV'),
(6,3,'Electronic Principles and Circuits','EPC'),
(6,3,'Mathematics','MATHS'),
(6,3,'Network Analysis','NA'),
(6,3,'MATLAB','MATLAB');

-- CIVIL (7) — subject_id 32-34
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(7,3,'Engineering Geology','EG'),
(7,3,'Engineering Survey','ES'),
(7,3,'Strength of Materials','SOM');

-- === 1st Year — CSE (8), Semester 1 (semester_id=1) — subject_id 35-43 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(8,1,'Mathematics-I','MATH1'),
(8,1,'Applied Physics','PHY'),
(8,1,'Introduction to C Programming','CPROG'),
(8,1,'Introduction to Electrical Engineering','IEE'),
(8,1,'Communicative English','CE'),
(8,1,'Indian Constitution','IC'),
(8,1,'Innovation and Design Thinking','IDT'),
(8,1,'Scientific Foundations of Health','SFH'),
(8,1,'Samskrutika Kannada','SK');

-- === 1st Year — CSE (8), Semester 2 (semester_id=2) — subject_id 44-51 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(8,2,'Mathematics-II','MATH2'),
(8,2,'Applied Chemistry','CHEM'),
(8,2,'Introduction to Python Programming','PYTHON'),
(8,2,'Introduction to Electronics & Communication','IEC'),
(8,2,'Introduction to Internet of Things','IOT'),
(8,2,'Principles of Programming Using C','POP'),
(8,2,'Professional Writing Skills in English','PWS'),
(8,2,'Balake Kannada','BK');

-- === 1st Year — EEE (9), Semester 1 (semester_id=1) — subject_id 52-60 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(9,1,'Mathematics-I','MATH1'),
(9,1,'Applied Physics','PHY'),
(9,1,'Introduction to C Programming','CPROG'),
(9,1,'Introduction to Electrical Engineering','IEE'),
(9,1,'Communicative English','CE'),
(9,1,'Indian Constitution','IC'),
(9,1,'Innovation and Design Thinking','IDT'),
(9,1,'Scientific Foundations of Health','SFH'),
(9,1,'Samskrutika Kannada','SK');

-- === 1st Year — EEE (9), Semester 2 (semester_id=2) — subject_id 61-69 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(9,2,'Mathematics-II','MATH2'),
(9,2,'Chemistry','CHEM'),
(9,2,'Introduction to Python Programming','PYTHON'),
(9,2,'Basic Electronics','BE'),
(9,2,'Introduction to Internet of Things','IOT'),
(9,2,'Principles of Programming Using C','POP'),
(9,2,'Professional Writing Skills in English','PWS'),
(9,2,'Balake Kannada','BK'),
(9,2,'Elements of Electrical Engineering','ELE');

-- === 4th Semester — AIDS (1), semester_id=4 — subject_id 70-76 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(1,4,'Analysis & Design of Algorithms','ADA'),
(1,4,'Artificial Intelligence','AI'),
(1,4,'Biology for Engineers','BIO'),
(1,4,'Database Management Systems','DBMS'),
(1,4,'Discrete Mathematical Structures','DMS'),
(1,4,'Universal Human Values','UHV'),
(1,4,'Microcontroller','MICROCONTROLLER');

-- ─── 5. INSERT QUESTION PAPERS ───
-- Path format: C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/{SEM}/{session}/{BRANCH}/{filename}

-- =============================================
-- 3SEM — Dec23-Jan24
-- =============================================

-- AIDS
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(1,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/AIDS/DDCO.pdf'),
(2,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/AIDS/DSA.pdf'),
(3,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/AIDS/JAVA.pdf'),
(4,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/AIDS/MATHS.pdf'),
(5,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/AIDS/OS.pdf');

-- AIML
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(6,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/AIML/DDCO.pdf'),
(7,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/AIML/DSA.pdf'),
(8,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/AIML/JAVA.pdf'),
(9,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/AIML/MATHS.pdf'),
(10,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/AIML/OS.pdf');

-- ISE
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(11,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/ISE/DDCO.pdf'),
(12,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/ISE/DSA.pdf'),
(13,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/ISE/JAVA.pdf'),
(14,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/ISE/MATHS.pdf'),
(15,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/ISE/OS.pdf');

-- CSDS
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(16,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/CSDS/DDCO.pdf'),
(17,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/CSDS/DSA.pdf'),
(18,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/CSDS/JAVA.pdf'),
(19,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/CSDS/MATHS.pdf'),
(20,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/CSDS/OS.pdf');

-- CSML
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(21,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/CSML/DDCO.pdf'),
(22,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/CSML/DSA.pdf'),
(23,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/CSML/JAVA.pdf'),
(24,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/CSML/MATHS.pdf'),
(25,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/CSML/OS.pdf');

-- EC (5 subjects, no MATLAB in this session)
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(26,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/EC/COA.pdf'),
(27,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/EC/DSDV.pdf'),
(28,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/EC/EPC.pdf'),
(29,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/EC/MATHS.pdf'),
(30,'Dec23-Jan24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec23-Jan24/EC/NA.pdf');

-- =============================================
-- 3SEM — Dec24-Jan25
-- =============================================

-- AIDS
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(1,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/AIDS/DDCO.pdf'),
(2,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/AIDS/DSA.pdf'),
(3,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/AIDS/JAVA.pdf'),
(4,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/AIDS/MATHS.pdf'),
(5,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/AIDS/OS.pdf');

-- AIML
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(6,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/AIML/DDCO.pdf'),
(7,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/AIML/DSA.pdf'),
(8,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/AIML/JAVA.pdf'),
(9,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/AIML/MATHS.pdf'),
(10,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/AIML/OS.pdf');

-- ISE
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(11,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/ISE/DDCO.pdf'),
(12,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/ISE/DSA.pdf'),
(13,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/ISE/JAVA.pdf'),
(14,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/ISE/MATHS.pdf'),
(15,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/ISE/OS.pdf');

-- CSDS
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(16,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/CSDS/DDCO.pdf'),
(17,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/CSDS/DSA.pdf'),
(18,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/CSDS/JAVA.pdf'),
(19,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/CSDS/MATHS.pdf'),
(20,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/CSDS/OS.pdf');

-- CSML
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(21,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/CSML/DDCO.pdf'),
(22,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/CSML/DSA.pdf'),
(23,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/CSML/JAVA.pdf'),
(24,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/CSML/MATHS.pdf'),
(25,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/CSML/OS.pdf');

-- EC (6 subjects, includes MATLAB)
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(26,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/EC/COA.pdf'),
(27,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/EC/DSDV.pdf'),
(28,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/EC/EPC.pdf'),
(29,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/EC/MATHS.pdf'),
(30,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/EC/NA.pdf'),
(31,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/EC/MATLAB.pdf');

-- CIVIL
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(32,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/CIVIL/Engineering Geology.pdf'),
(33,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/CIVIL/Engineering Survey.pdf'),
(34,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/Dec24-Jan25/CIVIL/Strength of Materials.pdf');

-- =============================================
-- 3SEM — June-July25
-- =============================================

-- AIDS
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(1,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/AIDS/DDCO.pdf'),
(2,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/AIDS/DSA.pdf'),
(3,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/AIDS/JAVA.pdf'),
(4,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/AIDS/MATHS.pdf'),
(5,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/AIDS/OS.pdf');

-- AIML
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(6,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/AIML/DDCO.pdf'),
(7,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/AIML/DSA.pdf'),
(8,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/AIML/JAVA.pdf'),
(9,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/AIML/MATHS.pdf'),
(10,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/AIML/OS.pdf');

-- ISE
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(11,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/ISE/DDCO.pdf'),
(12,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/ISE/DSA.pdf'),
(13,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/ISE/JAVA.pdf'),
(14,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/ISE/MATHS.pdf'),
(15,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/ISE/OS.pdf');

-- CSDS
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(16,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/CSDS/DDCO.pdf'),
(17,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/CSDS/DSA.pdf'),
(18,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/CSDS/JAVA.pdf'),
(19,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/CSDS/MATHS.pdf'),
(20,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/CSDS/OS.pdf');

-- CSML
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(21,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/CSML/DDCO.pdf'),
(22,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/CSML/DSA.pdf'),
(23,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/CSML/JAVA.pdf'),
(24,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/CSML/MATHS.pdf'),
(25,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/CSML/OS.pdf');

-- EC (6 subjects, full names)
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(26,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/EC/COA.pdf'),
(27,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/EC/Digital System Design using Verilog.pdf'),
(28,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/EC/Electronic Principles and Circuits.pdf'),
(29,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/EC/MATHS.pdf'),
(30,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/EC/Network Analysis.pdf'),
(31,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/3SEM/June-July25/EC/MATLAB.pdf');

-- =============================================
-- 4SEM — June-Jul24 (common papers, no branch subfolder — mapped to AIDS)
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(70,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/ADA.pdf'),
(71,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/AI.pdf'),
(72,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/BIO.pdf'),
(73,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/DBMS.pdf'),
(74,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/DMS.pdf'),
(75,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/UHV.pdf');

-- =============================================
-- 4SEM — Dec24-Jan25 / AIDS
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(70,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/Dec24-Jan25/AIDS/ADA.pdf'),
(72,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/Dec24-Jan25/AIDS/BIO.pdf'),
(73,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/Dec24-Jan25/AIDS/DBMS.pdf'),
(74,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/Dec24-Jan25/AIDS/DMS.pdf'),
(76,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/Dec24-Jan25/AIDS/MICROCONTROLLER.pdf');

-- =============================================
-- 4SEM — June-July25 / AIDS
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(70,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIDS/ADA.pdf'),
(71,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIDS/AI.pdf'),
(72,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIDS/BIO.pdf'),
(73,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIDS/DBMS.pdf'),
(74,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIDS/DMS.pdf'),
(76,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIDS/MICROCONTROLLER.pdf'),
(75,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIDS/UHV.pdf');
