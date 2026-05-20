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
(1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(4,7);
-- semester_id: 1=Sem1, 2=Sem2, 3=Sem3, 4=Sem4, 5=Sem5, 6=Sem6, 7=Sem7

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

-- === 4th Semester — AIML (2), semester_id=4 — subject_id 77-83 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(2,4,'Analysis & Design of Algorithms','ADA'),
(2,4,'Artificial Intelligence','AI'),
(2,4,'Biology for Engineers','BIO'),
(2,4,'Database Management Systems','DBMS'),
(2,4,'Discrete Mathematical Structures','DMS'),
(2,4,'Universal Human Values','UHV'),
(2,4,'Microcontroller','MICROCONTROLLER');

-- === 4th Semester — ISE (3), semester_id=4 — subject_id 84-90 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(3,4,'Analysis & Design of Algorithms','ADA'),
(3,4,'Artificial Intelligence','AI'),
(3,4,'Biology for Engineers','BIO'),
(3,4,'Database Management Systems','DBMS'),
(3,4,'Discrete Mathematical Structures','DMS'),
(3,4,'Universal Human Values','UHV'),
(3,4,'Microcontroller','MICROCONTROLLER');

-- === 4th Semester — CSDS (4), semester_id=4 — subject_id 91-97 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(4,4,'Analysis & Design of Algorithms','ADA'),
(4,4,'Artificial Intelligence','AI'),
(4,4,'Biology for Engineers','BIO'),
(4,4,'Database Management Systems','DBMS'),
(4,4,'Discrete Mathematical Structures','DMS'),
(4,4,'Universal Human Values','UHV'),
(4,4,'Microcontroller','MICROCONTROLLER');

-- === 4th Semester — CSML (5), semester_id=4 — subject_id 98-104 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(5,4,'Analysis & Design of Algorithms','ADA'),
(5,4,'Artificial Intelligence','AI'),
(5,4,'Biology for Engineers','BIO'),
(5,4,'Database Management Systems','DBMS'),
(5,4,'Discrete Mathematical Structures','DMS'),
(5,4,'Universal Human Values','UHV'),
(5,4,'Microcontroller','MICROCONTROLLER');

-- === 4th Semester — EC (6), semester_id=4 — subject_id 105-109 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(6,4,'Analysis & Design of Algorithms','ADA'),
(6,4,'Biology for Engineers','BIO'),
(6,4,'Database Management Systems','DBMS'),
(6,4,'Discrete Mathematical Structures','DMS'),
(6,4,'Microcontroller','MICROCONTROLLER');

-- === 4th Semester — CIVIL (7), semester_id=4 — subject_id 110-114 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(7,4,'Analysis & Design of Algorithms','ADA'),
(7,4,'Biology for Engineers','BIO'),
(7,4,'Database Management Systems','DBMS'),
(7,4,'Discrete Mathematical Structures','DMS'),
(7,4,'Microcontroller','MICROCONTROLLER');

-- === 5th Semester — AIDS (1), semester_id=5 — subject_id 116-120 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(1,5,'Big Data Analytics','BDA'),
(1,5,'Computer Networks','CN'),
(1,5,'Cybersecurity','CS'),
(1,5,'Machine Learning','ML'),
(1,5,'Professional Elective','PE');

-- === 5th Semester — AIML (2), semester_id=5 — subject_id 121-125 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(2,5,'Big Data Analytics','BDA'),
(2,5,'Computer Networks','CN'),
(2,5,'Cybersecurity','CS'),
(2,5,'Machine Learning','ML'),
(2,5,'Professional Elective','PE');

-- === 5th Semester — ISE (3), semester_id=5 — subject_id 126-130 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(3,5,'Big Data Analytics','BDA'),
(3,5,'Computer Networks','CN'),
(3,5,'Cybersecurity','CS'),
(3,5,'Machine Learning','ML'),
(3,5,'Professional Elective','PE');

-- === 5th Semester — CSDS (4), semester_id=5 — subject_id 131-135 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(4,5,'Big Data Analytics','BDA'),
(4,5,'Computer Networks','CN'),
(4,5,'Cybersecurity','CS'),
(4,5,'Machine Learning','ML'),
(4,5,'Professional Elective','PE');

-- === 5th Semester — CSML (5), semester_id=5 — subject_id 136-140 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(5,5,'Big Data Analytics','BDA'),
(5,5,'Computer Networks','CN'),
(5,5,'Cybersecurity','CS'),
(5,5,'Machine Learning','ML'),
(5,5,'Professional Elective','PE');

-- === 5th Semester — EC (6), semester_id=5 — subject_id 141-153 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(6,5,'Digital Communication','DC'),
(6,5,'Digital Signal Processing','DSP'),
(6,5,'Electromagnetic Waves','EMW'),
(6,5,'Environmental Studies and E-Waste Management','ESEM'),
(6,5,'Information Theory & Coding','ITC'),
(6,5,'Intelligent Systems and Machine Learning','ISML'),
(6,5,'Principles of Communication Systems','PCS'),
(6,5,'Research Methodology and IPR','RMIPR'),
(6,5,'Satellite and Optical Communication','SOC'),
(6,5,'Technological Innovation and Management','TIM'),
(6,5,'Theory of Computation','TC'),
(6,5,'Verilog HDL','VHDL'),
(6,5,'Professional Elective','PE');

-- === 5th Semester — CIVIL (7), semester_id=5 — subject_id 154-167 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(7,5,'Analysis of Indeterminate Structures','AIS'),
(7,5,'Basic Geotechnical Engineering','BGE'),
(7,5,'Construction Management & Entrepreneurship','CME'),
(7,5,'Design of RC Structural Elements','DRCSE'),
(7,5,'Environmental Studies','ES'),
(7,5,'Geotechnical Engineering','GE'),
(7,5,'Highway Engineering','HE'),
(7,5,'Hydrology and Water Resources Engineering','HWRE'),
(7,5,'Municipal Wastewater Engineering','MWE'),
(7,5,'Quality Control and Quality Assurance','QCQA'),
(7,5,'Research Methodology and IPR','RMIPR'),
(7,5,'Theory of Computation','TC'),
(7,5,'Transportation Engineering','TE'),
(7,5,'Professional Elective','PE');

-- === 6th Semester — AIDS (1), semester_id=6 — subject_id 169-173 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(1,6,'Cloud Computing','CC'),
(1,6,'Data Mining','DM'),
(1,6,'Deep Learning','DL'),
(1,6,'Natural Language Processing','NLP'),
(1,6,'Professional Elective','PE');

-- === 6th Semester — AIML (2), semester_id=6 — subject_id 174-178 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(2,6,'Cloud Computing','CC'),
(2,6,'Data Mining','DM'),
(2,6,'Deep Learning','DL'),
(2,6,'Natural Language Processing','NLP'),
(2,6,'Professional Elective','PE');

-- === 6th Semester — ISE (3), semester_id=6 — subject_id 179-183 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(3,6,'Cloud Computing','CC'),
(3,6,'Data Mining','DM'),
(3,6,'Deep Learning','DL'),
(3,6,'Natural Language Processing','NLP'),
(3,6,'Professional Elective','PE');

-- === 6th Semester — CSDS (4), semester_id=6 — subject_id 184-188 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(4,6,'Cloud Computing','CC'),
(4,6,'Data Mining','DM'),
(4,6,'Deep Learning','DL'),
(4,6,'Natural Language Processing','NLP'),
(4,6,'Professional Elective','PE');

-- === 6th Semester — CSML (5), semester_id=6 — subject_id 189-193 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(5,6,'Cloud Computing','CC'),
(5,6,'Data Mining','DM'),
(5,6,'Deep Learning','DL'),
(5,6,'Natural Language Processing','NLP'),
(5,6,'Professional Elective','PE');

-- === 6th Semester — EC (6), semester_id=6 — subject_id 194-204 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(6,6,'Cryptography','CRYPT'),
(6,6,'Data Structures Using C++','DSCPP'),
(6,6,'Digital Communication','DC'),
(6,6,'Embedded Systems','ES'),
(6,6,'Microwave and Antennas','MA'),
(6,6,'Non-Conventional Energy Sources','NCES'),
(6,6,'Operating System','OS'),
(6,6,'Renewable Energy Resources','RER'),
(6,6,'Research Methodology & IPR','RMIPR'),
(6,6,'Technological Innovation Management and Entrepreneurship','TIME'),
(6,6,'Professional Elective','PE');

-- === 6th Semester — CIVIL (7), semester_id=6 — subject_id 205-213 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(7,6,'Applied Geotechnical Engineering','AGE'),
(7,6,'Concrete Technology','CT'),
(7,6,'Construction Management and Entrepreneurship','CME'),
(7,6,'Design of Steel Structural Elements','DSSE'),
(7,6,'Hydrology and Irrigation Engineering','HIE'),
(7,6,'Programming in JAVA','PJ'),
(7,6,'Railways, Harbors, Tunneling and Airports','RHTA'),
(7,6,'Renewable Energy Resources','RER'),
(7,6,'Professional Elective','PE');

-- === 7th Semester — AIDS (1), semester_id=7 — subject_id 214-218 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(1,7,'Blockchain Technology','BT'),
(1,7,'Image Processing','IP'),
(1,7,'IoT Applications','IoTA'),
(1,7,'Quantum Computing','QC'),
(1,7,'Professional Elective','PE');

-- === 7th Semester — AIML (2), semester_id=7 — subject_id 219-223 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(2,7,'Blockchain Technology','BT'),
(2,7,'Image Processing','IP'),
(2,7,'IoT Applications','IoTA'),
(2,7,'Quantum Computing','QC'),
(2,7,'Professional Elective','PE');

-- === 7th Semester — ISE (3), semester_id=7 — subject_id 224-228 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(3,7,'Blockchain Technology','BT'),
(3,7,'Image Processing','IP'),
(3,7,'IoT Applications','IoTA'),
(3,7,'Quantum Computing','QC'),
(3,7,'Professional Elective','PE');

-- === 7th Semester — CSDS (4), semester_id=7 — subject_id 229-233 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(4,7,'Blockchain Technology','BT'),
(4,7,'Image Processing','IP'),
(4,7,'IoT Applications','IoTA'),
(4,7,'Quantum Computing','QC'),
(4,7,'Professional Elective','PE');

-- === 7th Semester — CSML (5), semester_id=7 — subject_id 234-238 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(5,7,'Blockchain Technology','BT'),
(5,7,'Image Processing','IP'),
(5,7,'IoT Applications','IoTA'),
(5,7,'Quantum Computing','QC'),
(5,7,'Professional Elective','PE');

-- === 7th Semester — EC (6), semester_id=7 — subject_id 239-246 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(6,7,'Advanced VLSI','AVLSI'),
(6,7,'Computer Communication Networks','CCN'),
(6,7,'Digital Image Processing','DIP'),
(6,7,'Electric Vehicles','EV'),
(6,7,'Multimedia Communication','MC'),
(6,7,'Network Security','NS'),
(6,7,'Optical & Wireless Communication','OWC'),
(6,7,'Research Methodology and IPR','RMIPR');

-- === 7th Semester — CIVIL (7), semester_id=7 — subject_id 247-254 ===
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(7,7,'Air Pollution and Control','APC'),
(7,7,'Design of RCC and Steel Structures','DRCSS'),
(7,7,'E-waste Management','EWM'),
(7,7,'Electric Vehicles','EV'),
(7,7,'Pavement Materials and Construction','PMC'),
(7,7,'Quantity Survey and Contract Management','QSCM'),
(7,7,'Urban Transport Planning','UTP'),
(7,7,'Professional Elective','PE');

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
-- 4SEM — June-Jul24 (All branches)
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(70,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/AIDS/ADA.pdf'),
(72,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/AIDS/BIO.pdf'),
(73,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/AIDS/DBMS.pdf'),
(74,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/AIDS/DMS.pdf'),
(75,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/AIDS/UHV.pdf'),
(77,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/AIML/ADA.pdf'),
(79,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/AIML/BIO.pdf'),
(80,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/AIML/DBMS.pdf'),
(81,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/AIML/DMS.pdf'),
(82,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/AIML/UHV.pdf'),
(84,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/ISE/ADA.pdf'),
(86,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/ISE/BIO.pdf'),
(87,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/ISE/DBMS.pdf'),
(88,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/ISE/DMS.pdf'),
(89,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/ISE/UHV.pdf'),
(91,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/CSDS/ADA.pdf'),
(93,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/CSDS/BIO.pdf'),
(94,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/CSDS/DBMS.pdf'),
(95,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/CSDS/DMS.pdf'),
(96,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/CSDS/UHV.pdf'),
(98,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/CSML/ADA.pdf'),
(100,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/CSML/BIO.pdf'),
(101,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/CSML/DBMS.pdf'),
(102,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/CSML/DMS.pdf'),
(103,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/CSML/UHV.pdf'),
(105,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/EC/ADA.pdf'),
(107,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/EC/BIO.pdf'),
(108,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/EC/DBMS.pdf'),
(109,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/EC/DMS.pdf'),
(110,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/CIVIL/ADA.pdf'),
(112,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/CIVIL/BIO.pdf'),
(113,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/CIVIL/DBMS.pdf'),
(114,'June-Jul24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-Jul24/CIVIL/DMS.pdf');

-- =============================================
-- 4SEM — Dec24-Jan25 (AIDS)
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(70,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/Dec24-Jan25/AIDS/ADA.pdf'),
(72,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/Dec24-Jan25/AIDS/BIO.pdf'),
(73,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/Dec24-Jan25/AIDS/DBMS.pdf'),
(74,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/Dec24-Jan25/AIDS/DMS.pdf'),
(76,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/Dec24-Jan25/AIDS/MICROCONTROLLER.pdf');

-- =============================================
-- 4SEM — June-July25 (All branches)
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(70,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIDS/ADA.pdf'),
(71,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIDS/AI.pdf'),
(72,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIDS/BIO.pdf'),
(73,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIDS/DBMS.pdf'),
(74,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIDS/DMS.pdf'),
(76,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIDS/MICROCONTROLLER.pdf'),
(75,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIDS/UHV.pdf'),
(77,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIML/ADA.pdf'),
(78,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIML/AI.pdf'),
(79,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIML/BIO.pdf'),
(80,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIML/DBMS.pdf'),
(81,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIML/DMS.pdf'),
(83,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIML/MICROCONTROLLER.pdf'),
(82,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/AIML/UHV.pdf'),
(84,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/ISE/ADA.pdf'),
(85,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/ISE/AI.pdf'),
(86,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/ISE/BIO.pdf'),
(87,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/ISE/DBMS.pdf'),
(88,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/ISE/DMS.pdf'),
(90,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/ISE/MICROCONTROLLER.pdf'),
(89,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/ISE/UHV.pdf'),
(91,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CSDS/ADA.pdf'),
(92,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CSDS/AI.pdf'),
(93,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CSDS/BIO.pdf'),
(94,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CSDS/DBMS.pdf'),
(95,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CSDS/DMS.pdf'),
(97,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CSDS/MICROCONTROLLER.pdf'),
(96,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CSDS/UHV.pdf'),
(98,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CSML/ADA.pdf'),
(99,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CSML/AI.pdf'),
(100,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CSML/BIO.pdf'),
(101,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CSML/DBMS.pdf'),
(102,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CSML/DMS.pdf'),
(104,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CSML/MICROCONTROLLER.pdf'),
(103,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CSML/UHV.pdf'),
(105,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/EC/ADA.pdf'),
(106,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/EC/BIO.pdf'),
(108,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/EC/DBMS.pdf'),
(109,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/EC/DMS.pdf'),
(110,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CIVIL/ADA.pdf'),
(111,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CIVIL/BIO.pdf'),
(113,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CIVIL/DBMS.pdf'),
(114,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/June-July25/CIVIL/DMS.pdf');

-- =============================================
-- 5SEM — June-July25 / AIDS, AIML, CSDS, CSML, ISE
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(116,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIDS/Automata Theory and compiler Design  .pdf'),
(116,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIDS/BCS502 Computer Networks  .pdf'),
(116,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIDS/Cloud Computing .pdf'),
(116,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIDS/Computer Networks  .pdf'),
(117,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIDS/Database Management Systems .pdf'),
(117,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIDS/Environmental Studies and E-Waste Management.pdf'),
(118,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIDS/Principles of Artificial Intelligence  .pdf'),
(119,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIDS/Research Methodology & Intellectual Property Rights  .pdf'),
(119,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIDS/Research Methodology and IPR  .pdf'),
(120,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIDS/Software Engineering and Project Management  .pdf'),
(120,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIDS/Theory of Computation .pdf'),
(121,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIML/Automata Theory and compiler Design  .pdf'),
(121,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIML/BCS502 Computer Networks  .pdf'),
(121,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIML/Cloud Computing .pdf'),
(122,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIML/Computer Networks  .pdf'),
(122,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIML/Database Management Systems .pdf'),
(123,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIML/Environmental Studies and E-Waste Management.pdf'),
(123,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIML/Information Retrival  .pdf'),
(124,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIML/Principles of Artificial Intelligence  .pdf'),
(124,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIML/Research Methodology & Intellectual Property Rights  .pdf'),
(125,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIML/Research Methodology and IPR  .pdf'),
(125,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIML/Software Engineering and Project Management  .pdf'),
(125,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/AIML/Theory of Computation .pdf'),
(131,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSDS/Automata Theory and compiler Design  .pdf'),
(131,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSDS/BCS502 Computer Networks  .pdf'),
(131,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSDS/Cloud Computing .pdf'),
(132,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSDS/Computer Networks  .pdf'),
(132,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSDS/Database Management Systems .pdf'),
(133,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSDS/Environmental Studies and E-Waste Management.pdf'),
(133,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSDS/NoSQL Databases .pdf'),
(134,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSDS/Principles of Artificial Intelligence  .pdf'),
(134,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSDS/Research Methodology & Intellectual Property Rights  .pdf'),
(135,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSDS/Research Methodology and IPR  .pdf'),
(135,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSDS/Software Engineering and Project Management  .pdf'),
(135,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSDS/Theory of Computation .pdf'),
(136,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSML/Automata Theory and compiler Design  .pdf'),
(136,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSML/BCS502 Computer Networks  .pdf'),
(137,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSML/Cloud Computing .pdf'),
(137,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSML/Computer Networks  .pdf'),
(138,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSML/Database Management Systems .pdf'),
(138,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSML/Environmental Studies and E-Waste Management.pdf'),
(139,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSML/Principles of Artificial Intelligence  .pdf'),
(139,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSML/Research Methodology & Intellectual Property Rights  .pdf'),
(140,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSML/Research Methodology and IPR  .pdf'),
(140,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSML/Software Engineering and Project Management  .pdf'),
(140,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CSML/Theory of Computation .pdf'),
(126,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/ISE/Automata Theory and compiler Design  .pdf'),
(126,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/ISE/BCS502 Computer Networks  .pdf'),
(126,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/ISE/Cloud Computing .pdf'),
(127,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/ISE/Computer Networks  .pdf'),
(127,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/ISE/Database Management Systems .pdf'),
(128,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/ISE/Environmental Studies and E-Waste Management.pdf'),
(128,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/ISE/Principles of Artificial Intelligence  .pdf'),
(129,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/ISE/Research Methodology & Intellectual Property Rights  .pdf'),
(129,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/ISE/Research Methodology and IPR  .pdf'),
(130,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/ISE/Software Engineering and Project Management  .pdf'),
(130,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/ISE/Theory of Computation .pdf');

-- =============================================
-- 5SEM — June-July24 / EC
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(142,'June-July24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July24/EC/Digital Signal Processing.pdf'),
(143,'June-July24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July24/EC/Electromagnetic Waves.pdf'),
(145,'June-July24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July24/EC/Information Theory & Coding.pdf'),
(147,'June-July24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July24/EC/Principles of Communication Systems.pdf'),
(152,'June-July24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July24/EC/Verilog HDL.pdf');

-- =============================================
-- 5SEM — June-July25 / EC
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(142,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/EC/BEC502 Digital Signal Processing.pdf'),
(142,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/EC/Digital Signal Processing.pdf'),
(143,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/EC/Electromagnetic Waves.pdf'),
(143,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/EC/Electromagnetic Waves-1.pdf'),
(141,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/EC/Digital Communication.pdf'),
(144,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/EC/Environmental Studies and E-Waste Management.pdf'),
(145,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/EC/Information Theory & Coding.pdf'),
(146,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/EC/Intelligent Systems and Machine Learning Algorithms.pdf'),
(147,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/EC/Principles of Communication Systems.pdf'),
(148,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/EC/Research Methodology & Intellectual Property Rights.pdf'),
(148,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/EC/Research Methodology and IPR.pdf'),
(149,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/EC/Satllite and Optical Communication.pdf'),
(150,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/EC/Technological Innovation and Management Entrpreneurship.pdf'),
(150,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/EC/Technological Innovation Management & Entrepreneurship.pdf'),
(151,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/EC/Theory of Computation.pdf'),
(152,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/EC/Verilog HDL.pdf');

-- =============================================
-- 5SEM — June-July25 / CIVIL
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(158,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CIVIL/Environmental Studies and E-Waste Management.pdf'),
(164,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CIVIL/Research Methodology & Intellectual Property Rights.pdf'),
(164,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CIVIL/Research Methodology and IPR.pdf'),
(165,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/5SEM/June-July25/CIVIL/Theory of Computation.pdf');

-- =============================================
-- 6SEM — June-July24 / EC
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(195,'June-July24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July24/EC/Data Structures Using C++.pdf'),
(196,'June-July24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July24/EC/Digital Communication.pdf'),
(197,'June-July24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July24/EC/Embedded Systems.pdf'),
(198,'June-July24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July24/EC/Microwave and Antennas.pdf'),
(200,'June-July24','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July24/EC/Operating System.pdf');

-- =============================================
-- 6SEM — Dec24-Jan25 / EC
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(194,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/EC/Cryptography.pdf'),
(195,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/EC/Data Structures Using C++.pdf'),
(196,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/EC/Digital Communication.pdf'),
(197,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/EC/Embedded Systems.pdf'),
(198,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/EC/Microwave and Antennas.pdf'),
(199,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/EC/Non-Conventional Energy Sources.pdf'),
(200,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/EC/Operating System.pdf'),
(201,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/EC/Renewable Energy Resources.pdf'),
(202,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/EC/Research Methodology & Intellectual Property Rights.pdf'),
(203,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/EC/Technological Innovation Management and Entrepreneurship.pdf');

-- =============================================
-- 6SEM — Dec24-Jan25 / CIVIL
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(211,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/CIVIL/Traffic Engineering.pdf');

-- =============================================
-- 6SEM — Dec24-Jan25 / AIDS, AIML, CSDS, CSML, ISE
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(169,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/AIDS/Data Science and its Applications.pdf'),
(169,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/AIDS/Introduction to Cyber Security.pdf'),
(170,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/AIDS/Introduction to Data Structures .pdf'),
(170,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/AIDS/Natural Language Processing.pdf'),
(171,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/AIDS/Programming in JAVA.pdf'),
(171,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/AIDS/Renewable Energy Resources.pdf'),
(174,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/AIML/Data Science and its Applications.pdf'),
(174,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/AIML/Introduction to Cyber Security.pdf'),
(175,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/AIML/Introduction to Data Structures .pdf'),
(175,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/AIML/Natural Language Processing.pdf'),
(176,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/AIML/Programming in JAVA.pdf'),
(176,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/AIML/Renewable Energy Resources.pdf'),
(184,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/CSDS/Data Science and its Applications.pdf'),
(184,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/CSDS/Introduction to Cyber Security.pdf'),
(185,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/CSDS/Introduction to Data Structures .pdf'),
(185,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/CSDS/Natural Language Processing.pdf'),
(186,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/CSDS/Programming in JAVA.pdf'),
(186,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/CSDS/Renewable Energy Resources.pdf'),
(189,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/CSML/Data Science and its Applications.pdf'),
(189,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/CSML/Introduction to Cyber Security.pdf'),
(190,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/CSML/Introduction to Data Structures .pdf'),
(190,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/CSML/Natural Language Processing.pdf'),
(191,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/CSML/Programming in JAVA.pdf'),
(191,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/CSML/Renewable Energy Resources.pdf'),
(179,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/ISE/Data Science and its Applications.pdf'),
(179,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/ISE/Introduction to Cyber Security.pdf'),
(180,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/ISE/Introduction to Data Structures .pdf'),
(180,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/ISE/Natural Language Processing.pdf'),
(181,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/ISE/Programming in JAVA.pdf'),
(181,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/Dec24-Jan25/ISE/Renewable Energy Resources.pdf'),
(169,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIDS/Big Data Analytics.pdf'),
(169,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIDS/Consumer Electronics.pdf'),
(170,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIDS/Data Science and its Applications.pdf'),
(170,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIDS/Data Structures Using C++ .pdf'),
(171,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIDS/Machine Learning.pdf'),
(171,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIDS/Natural Language Processing.pdf'),
(172,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIDS/Programming in JAVA.pdf'),
(172,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIDS/Renewable Energy Power plants.pdf'),
(173,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIDS/Software Engineering and Project Management.pdf'),
(173,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIDS/Technologies of Renewable Energy Sources.pdf'),
(174,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIML/Big Data Analytics.pdf'),
(174,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIML/Consumer Electronics.pdf'),
(175,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIML/Data Science and its Applications.pdf'),
(175,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIML/Data Structures Using C++ .pdf'),
(176,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIML/Machine Learning.pdf'),
(176,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIML/Natural Language Processing.pdf'),
(177,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIML/Programming in JAVA.pdf'),
(177,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIML/Renewable Energy Power plants.pdf'),
(178,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIML/Software Engineering and Project Management.pdf'),
(178,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/AIML/Technologies of Renewable Energy Sources.pdf'),
(184,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSDS/Big Data Analytics.pdf'),
(184,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSDS/Consumer Electronics.pdf'),
(185,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSDS/Data Science and its Applications.pdf'),
(185,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSDS/Data Structures Using C++ .pdf'),
(186,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSDS/Machine Learning.pdf'),
(186,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSDS/Natural Language Processing.pdf'),
(187,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSDS/Programming in JAVA.pdf'),
(187,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSDS/Renewable Energy Power plants.pdf'),
(188,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSDS/Software Engineering and Project Management.pdf'),
(188,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSDS/Technologies of Renewable Energy Sources.pdf'),
(189,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSML/Big Data Analytics.pdf'),
(189,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSML/Consumer Electronics.pdf'),
(190,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSML/Data Science and its Applications.pdf'),
(190,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSML/Data Structures Using C++ .pdf'),
(191,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSML/Machine Learning.pdf'),
(191,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSML/Natural Language Processing.pdf'),
(192,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSML/Programming in JAVA.pdf'),
(192,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSML/Renewable Energy Power plants.pdf'),
(193,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSML/Software Engineering and Project Management.pdf'),
(193,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/CSML/Technologies of Renewable Energy Sources.pdf'),
(179,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/ISE/Big Data Analytics.pdf'),
(179,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/ISE/Consumer Electronics.pdf'),
(180,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/ISE/Data Science and its Applications.pdf'),
(180,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/ISE/Data Structures Using C++ .pdf'),
(181,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/ISE/Machine Learning.pdf'),
(181,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/ISE/Natural Language Processing.pdf'),
(182,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/ISE/Programming in JAVA.pdf'),
(182,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/ISE/Renewable Energy Power plants.pdf'),
(183,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/ISE/Software Engineering and Project Management.pdf'),
(183,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/6SEM/June-July25/ISE/Technologies of Renewable Energy Sources.pdf');

-- =============================================
-- 7SEM — Dec24-Jan25 / AIDS, AIML, CSDS, CSML, ISE
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(214,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/AIDS/Cloud Computing.pdf'),
(214,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/AIDS/Data Visualization.pdf'),
(215,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/AIDS/Database Management Systems.pdf'),
(215,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/AIDS/Deep Learning.pdf'),
(216,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/AIDS/Environmental Protection and Management.pdf'),
(216,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/AIDS/Internet of Things.pdf'),
(217,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/AIDS/Research Methodology and IPR.pdf'),
(219,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/AIML/Cloud Computing.pdf'),
(219,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/AIML/Data Visualization.pdf'),
(220,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/AIML/Database Management Systems.pdf'),
(220,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/AIML/Deep Learning.pdf'),
(221,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/AIML/Environmental Protection and Management.pdf'),
(221,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/AIML/Internet of Things.pdf'),
(222,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/AIML/Research Methodology and IPR.pdf'),
(229,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/CSDS/Cloud Computing.pdf'),
(229,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/CSDS/Data Visualization.pdf'),
(230,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/CSDS/Database Management Systems.pdf'),
(230,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/CSDS/Deep Learning.pdf'),
(231,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/CSDS/Environmental Protection and Management.pdf'),
(231,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/CSDS/Internet of Things.pdf'),
(232,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/CSDS/Research Methodology and IPR.pdf'),
(234,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/CSML/Cloud Computing.pdf'),
(234,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/CSML/Data Visualization.pdf'),
(235,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/CSML/Database Management Systems.pdf'),
(235,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/CSML/Deep Learning.pdf'),
(236,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/CSML/Environmental Protection and Management.pdf'),
(236,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/CSML/Internet of Things.pdf'),
(237,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/CSML/Research Methodology and IPR.pdf'),
(224,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/ISE/Cloud Computing.pdf'),
(224,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/ISE/Data Visualization.pdf'),
(225,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/ISE/Database Management Systems.pdf'),
(225,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/ISE/Deep Learning.pdf'),
(226,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/ISE/Environmental Protection and Management.pdf'),
(226,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/ISE/Internet of Things.pdf'),
(227,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/ISE/Research Methodology and IPR.pdf');

-- =============================================
-- 7SEM — Dec25-Jan26 / AIDS
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(214,'Dec25-Jan26','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec25-Jan26/AIDS/Data Security & Privacy.pdf'),
(214,'Dec25-Jan26','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec25-Jan26/AIDS/Deep Learning & Reinforcement Learning.pdf'),
(215,'Dec25-Jan26','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec25-Jan26/AIDS/E-waste Management.pdf'),
(215,'Dec25-Jan26','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec25-Jan26/AIDS/Social Network Analysis.pdf'),
(216,'Dec25-Jan26','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec25-Jan26/AIDS/Statistical Machine Learning for Data Science.pdf');

-- =============================================
-- 7SEM — June-July25 / AIDS, AIML, CSDS, CSML, ISE
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(214,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/AIDS/Cloud Computing.pdf'),
(214,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/AIDS/Data Visualization.pdf'),
(215,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/AIDS/Deep Learning.pdf'),
(215,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/AIDS/Internet of Things.pdf'),
(219,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/AIML/Cloud Computing.pdf'),
(219,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/AIML/Data Visualization.pdf'),
(220,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/AIML/Deep Learning.pdf'),
(220,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/AIML/Internet of Things.pdf'),
(229,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/CSDS/Cloud Computing.pdf'),
(229,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/CSDS/Data Visualization.pdf'),
(230,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/CSDS/Deep Learning.pdf'),
(230,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/CSDS/Internet of Things.pdf'),
(234,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/CSML/Cloud Computing.pdf'),
(234,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/CSML/Data Visualization.pdf'),
(235,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/CSML/Deep Learning.pdf'),
(235,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/CSML/Internet of Things.pdf'),
(224,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/ISE/Cloud Computing.pdf'),
(224,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/ISE/Data Visualization.pdf'),
(225,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/ISE/Deep Learning.pdf'),
(225,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/ISE/Internet of Things.pdf');

-- =============================================
-- 7SEM — Dec24-Jan25 / EC
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(239,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/EC/Advanced VLSI.pdf'),
(240,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/EC/Computer Communication Networks.pdf'),
(241,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/EC/Digital Image Processing.pdf'),
(242,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/EC/Electric Vehicles.pdf'),
(243,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/EC/Multimedia Communication.pdf'),
(244,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/EC/Network Security.pdf'),
(245,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/EC/Optical & Wireless Communication.pdf'),
(246,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec24-Jan25/EC/Research Methodology and IPR.pdf');

-- =============================================
-- 7SEM — Dec25-Jan26 / EC
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(244,'Dec25-Jan26','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec25-Jan26/EC/Computer and Network Security.pdf'),
(240,'Dec25-Jan26','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec25-Jan26/EC/Computer Networks and Protocols.pdf'),
(240,'Dec25-Jan26','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec25-Jan26/EC/Introduction to DBMS.pdf'),
(198,'Dec25-Jan26','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec25-Jan26/EC/Microwave Engineering and Antenna Theory.pdf'),
(199,'Dec25-Jan26','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec25-Jan26/EC/Non-Conventional Energy Resources.pdf'),
(240,'Dec25-Jan26','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec25-Jan26/EC/Radar Communication.pdf'),
(245,'Dec25-Jan26','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/Dec25-Jan26/EC/Wireless Communication Systems.pdf');

-- =============================================
-- 7SEM — June-July25 / EC
-- =============================================
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(239,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/EC/Advanced VLSI.pdf'),
(242,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/EC/Electric Vehicles.pdf'),
(247,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/EC/Environmental Protection and Management.pdf'),
(240,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/EC/Introduction to AI and ML.pdf'),
(243,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/EC/Multimedia Communication.pdf'),
(244,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/EC/Network Security.pdf'),
(245,'June-July25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/7SEM/June-July25/EC/Optical & Wireless Communication.pdf');
