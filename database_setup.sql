-- ============================================
-- CMRIT-PYQB Database Setup (MySQL)
-- Reference SQL Commands
-- ============================================

-- ─── 1. CREATE DATABASE ───
CREATE DATABASE cmrit_pyqb;
USE cmrit_pyqb;

-- ─── 2. CREATE TABLES ───

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
    exam_year INT,
    file_path VARCHAR(255),
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

-- ─── 3. INSERT BRANCHES ───

INSERT INTO branches (branch_name, branch_code) VALUES
('Artificial Intelligence & Data Science','AIDS'),
('Artificial Intelligence & Machine Learning','AIML'),
('Information Science & Engineering','IS'),
('Computer Science & Data Science','CSDS'),
('Computer Science & Machine Learning','CSML'),
('Electronics and Communication','EC'),
('Civil Engineering','CIVIL');

-- branch_id: AIDS=1, AIML=2, IS=3, CSDS=4, CSML=5, EC=6, CIVIL=7

-- ─── 4. INSERT YEARS ───

INSERT INTO years (year_name) VALUES
('1st Year'),('2nd Year'),('3rd Year'),('4th Year');

-- year_id: 1st=1, 2nd=2, 3rd=3, 4th=4

-- ─── 5. INSERT SEMESTERS ───

INSERT INTO semesters (year_id, semester_number) VALUES
(1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(4,7),(4,8);

-- semester_id: Sem1=1, Sem2=2, Sem3=3, Sem4=4, Sem5=5, Sem6=6, Sem7=7, Sem8=8

-- ─── 6. INSERT SUBJECTS (2nd Year, 3rd Semester = semester_id 3) ───

-- AIDS (branch_id=1) — 5 subjects
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(1, 3, 'Digital Design & Computer Organization', 'DDCO'),
(1, 3, 'Data Structures & Algorithms', 'DSA'),
(1, 3, 'Java Programming', 'JAVA'),
(1, 3, 'Mathematics', 'MATHS'),
(1, 3, 'Operating Systems', 'OS');
-- subject_id: DDCO=1, DSA=2, JAVA=3, MATHS=4, OS=5

-- AIML (branch_id=2) — 5 subjects
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(2, 3, 'Digital Design & Computer Organization', 'DDCO'),
(2, 3, 'Data Structures & Algorithms', 'DSA'),
(2, 3, 'Java Programming', 'JAVA'),
(2, 3, 'Mathematics', 'MATHS'),
(2, 3, 'Operating Systems', 'OS');
-- subject_id: 6,7,8,9,10

-- ISE (branch_id=3) — 5 subjects
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(3, 3, 'Digital Design & Computer Organization', 'DDCO'),
(3, 3, 'Data Structures & Algorithms', 'DSA'),
(3, 3, 'Java Programming', 'JAVA'),
(3, 3, 'Mathematics', 'MATHS'),
(3, 3, 'Operating Systems', 'OS');
-- subject_id: 11,12,13,14,15

-- CSDS (branch_id=4) — 5 subjects
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(4, 3, 'Digital Design & Computer Organization', 'DDCO'),
(4, 3, 'Data Structures & Algorithms', 'DSA'),
(4, 3, 'Java Programming', 'JAVA'),
(4, 3, 'Mathematics', 'MATHS'),
(4, 3, 'Operating Systems', 'OS');
-- subject_id: 16,17,18,19,20

-- CSML (branch_id=5) — 5 subjects
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(5, 3, 'Digital Design & Computer Organization', 'DDCO'),
(5, 3, 'Data Structures & Algorithms', 'DSA'),
(5, 3, 'Java Programming', 'JAVA'),
(5, 3, 'Mathematics', 'MATHS'),
(5, 3, 'Operating Systems', 'OS');
-- subject_id: 21,22,23,24,25

-- EC (branch_id=6) — 6 subjects
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(6, 3, 'Computer Organization & Architecture', 'COA'),
(6, 3, 'Digital System Design using Verilog', 'DSDV'),
(6, 3, 'Electronic Principles and Circuits', 'EPC'),
(6, 3, 'Mathematics', 'MATHS'),
(6, 3, 'Network Analysis', 'NA'),
(6, 3, 'MATLAB', 'MATLAB');
-- subject_id: 26,27,28,29,30,31

-- CIVIL (branch_id=7) — 3 subjects
INSERT INTO subjects (branch_id, semester_id, subject_name, subject_code) VALUES
(7, 3, 'Engineering Geology', 'EG'),
(7, 3, 'Engineering Survey', 'ES'),
(7, 3, 'Strength of Materials', 'SOM');
-- subject_id: 32,33,34

-- ─── 7. INSERT QUESTION PAPERS ───

-- === AIDS (branch_id=1) ===
-- Dec23-Jan24 (exam_year=2023)
INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(1, 2023, '/question_papers/Dec23-Jan24/AIDS/DDCO.pdf'),
(2, 2023, '/question_papers/Dec23-Jan24/AIDS/DSA.pdf'),
(3, 2023, '/question_papers/Dec23-Jan24/AIDS/JAVA.pdf'),
(4, 2023, '/question_papers/Dec23-Jan24/AIDS/MATHS.pdf'),
(5, 2023, '/question_papers/Dec23-Jan24/AIDS/OS.pdf');

-- Dec24-Jan25 (exam_year=2024)
INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(1, 2024, '/question_papers/Dec24-Jan25/AIDS/DDCO.pdf'),
(2, 2024, '/question_papers/Dec24-Jan25/AIDS/DSA.pdf'),
(3, 2024, '/question_papers/Dec24-Jan25/AIDS/JAVA.pdf'),
(4, 2024, '/question_papers/Dec24-Jan25/AIDS/MATHS.pdf'),
(5, 2024, '/question_papers/Dec24-Jan25/AIDS/OS.pdf');

-- June-July25 (exam_year=2025)
INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(1, 2025, '/question_papers/June-July25/AIDS/DDCO.pdf'),
(2, 2025, '/question_papers/June-July25/AIDS/DSA.pdf'),
(3, 2025, '/question_papers/June-July25/AIDS/JAVA.pdf'),
(4, 2025, '/question_papers/June-July25/AIDS/MATHS.pdf'),
(5, 2025, '/question_papers/June-July25/AIDS/OS.pdf');

-- === AIML (branch_id=2) ===
INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(6, 2023, '/question_papers/Dec23-Jan24/AIML/DDCO.pdf'),
(7, 2023, '/question_papers/Dec23-Jan24/AIML/DSA.pdf'),
(8, 2023, '/question_papers/Dec23-Jan24/AIML/JAVA.pdf'),
(9, 2023, '/question_papers/Dec23-Jan24/AIML/MATHS.pdf'),
(10, 2023, '/question_papers/Dec23-Jan24/AIML/OS.pdf');

INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(6, 2024, '/question_papers/Dec24-Jan25/AIML/DDCO.pdf'),
(7, 2024, '/question_papers/Dec24-Jan25/AIML/DSA.pdf'),
(8, 2024, '/question_papers/Dec24-Jan25/AIML/JAVA.pdf'),
(9, 2024, '/question_papers/Dec24-Jan25/AIML/MATHS.pdf'),
(10, 2024, '/question_papers/Dec24-Jan25/AIML/OS.pdf');

INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(6, 2025, '/question_papers/June-July25/AIML/DDCO.pdf'),
(7, 2025, '/question_papers/June-July25/AIML/DSA.pdf'),
(8, 2025, '/question_papers/June-July25/AIML/JAVA.pdf'),
(9, 2025, '/question_papers/June-July25/AIML/MATHS.pdf'),
(10, 2025, '/question_papers/June-July25/AIML/OS.pdf');

-- === ISE (branch_id=3) ===
INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(11, 2023, '/question_papers/Dec23-Jan24/ISE/DDCO.pdf'),
(12, 2023, '/question_papers/Dec23-Jan24/ISE/DSA.pdf'),
(13, 2023, '/question_papers/Dec23-Jan24/ISE/JAVA.pdf'),
(14, 2023, '/question_papers/Dec23-Jan24/ISE/MATHS.pdf'),
(15, 2023, '/question_papers/Dec23-Jan24/ISE/OS.pdf');

INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(11, 2024, '/question_papers/Dec24-Jan25/ISE/DDCO.pdf'),
(12, 2024, '/question_papers/Dec24-Jan25/ISE/DSA.pdf'),
(13, 2024, '/question_papers/Dec24-Jan25/ISE/JAVA.pdf'),
(14, 2024, '/question_papers/Dec24-Jan25/ISE/MATHS.pdf'),
(15, 2024, '/question_papers/Dec24-Jan25/ISE/OS.pdf');

INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(11, 2025, '/question_papers/June-July25/ISE/DDCO.pdf'),
(12, 2025, '/question_papers/June-July25/ISE/DSA.pdf'),
(13, 2025, '/question_papers/June-July25/ISE/JAVA.pdf'),
(14, 2025, '/question_papers/June-July25/ISE/MATHS.pdf'),
(15, 2025, '/question_papers/June-July25/ISE/OS.pdf');

-- === CSDS (branch_id=4) ===
INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(16, 2023, '/question_papers/Dec23-Jan24/CSDS/DDCO.pdf'),
(17, 2023, '/question_papers/Dec23-Jan24/CSDS/DSA.pdf'),
(18, 2023, '/question_papers/Dec23-Jan24/CSDS/JAVA.pdf'),
(19, 2023, '/question_papers/Dec23-Jan24/CSDS/MATHS.pdf'),
(20, 2023, '/question_papers/Dec23-Jan24/CSDS/OS.pdf');

INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(16, 2024, '/question_papers/Dec24-Jan25/CSDS/DDCO.pdf'),
(17, 2024, '/question_papers/Dec24-Jan25/CSDS/DSA.pdf'),
(18, 2024, '/question_papers/Dec24-Jan25/CSDS/JAVA.pdf'),
(19, 2024, '/question_papers/Dec24-Jan25/CSDS/MATHS.pdf'),
(20, 2024, '/question_papers/Dec24-Jan25/CSDS/OS.pdf');

INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(16, 2025, '/question_papers/June-July25/CSDS/DDCO.pdf'),
(17, 2025, '/question_papers/June-July25/CSDS/DSA.pdf'),
(18, 2025, '/question_papers/June-July25/CSDS/JAVA.pdf'),
(19, 2025, '/question_papers/June-July25/CSDS/MATHS.pdf'),
(20, 2025, '/question_papers/June-July25/CSDS/OS.pdf');

-- === CSML (branch_id=5) ===
INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(21, 2023, '/question_papers/Dec23-Jan24/CSML/DDCO.pdf'),
(22, 2023, '/question_papers/Dec23-Jan24/CSML/DSA.pdf'),
(23, 2023, '/question_papers/Dec23-Jan24/CSML/JAVA.pdf'),
(24, 2023, '/question_papers/Dec23-Jan24/CSML/MATHS.pdf'),
(25, 2023, '/question_papers/Dec23-Jan24/CSML/OS.pdf');

INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(21, 2024, '/question_papers/Dec24-Jan25/CSML/DDCO.pdf'),
(22, 2024, '/question_papers/Dec24-Jan25/CSML/DSA.pdf'),
(23, 2024, '/question_papers/Dec24-Jan25/CSML/JAVA.pdf'),
(24, 2024, '/question_papers/Dec24-Jan25/CSML/MATHS.pdf'),
(25, 2024, '/question_papers/Dec24-Jan25/CSML/OS.pdf');

INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(21, 2025, '/question_papers/June-July25/CSML/DDCO.pdf'),
(22, 2025, '/question_papers/June-July25/CSML/DSA.pdf'),
(23, 2025, '/question_papers/June-July25/CSML/JAVA.pdf'),
(24, 2025, '/question_papers/June-July25/CSML/MATHS.pdf'),
(25, 2025, '/question_papers/June-July25/CSML/OS.pdf');

-- === EC (branch_id=6) ===
-- Dec23-Jan24 (5 subjects: COA, DSDV, EPC, MATHS, NA)
INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(26, 2023, '/question_papers/Dec23-Jan24/EC/COA.pdf'),
(27, 2023, '/question_papers/Dec23-Jan24/EC/DSDV.pdf'),
(28, 2023, '/question_papers/Dec23-Jan24/EC/EPC.pdf'),
(29, 2023, '/question_papers/Dec23-Jan24/EC/MATHS.pdf'),
(30, 2023, '/question_papers/Dec23-Jan24/EC/NA.pdf');

-- Dec24-Jan25 (6 subjects: + MATLAB)
INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(26, 2024, '/question_papers/Dec24-Jan25/EC/COA.pdf'),
(27, 2024, '/question_papers/Dec24-Jan25/EC/DSDV.pdf'),
(28, 2024, '/question_papers/Dec24-Jan25/EC/EPC.pdf'),
(29, 2024, '/question_papers/Dec24-Jan25/EC/MATHS.pdf'),
(30, 2024, '/question_papers/Dec24-Jan25/EC/NA.pdf'),
(31, 2024, '/question_papers/Dec24-Jan25/EC/MATLAB.pdf');

-- June-July25 (6 subjects, full names used)
INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(26, 2025, '/question_papers/June-July25/EC/COA.pdf'),
(27, 2025, '/question_papers/June-July25/EC/Digital System Design using Verilog.pdf'),
(28, 2025, '/question_papers/June-July25/EC/Electronic Principles and Circuits.pdf'),
(29, 2025, '/question_papers/June-July25/EC/MATHS.pdf'),
(30, 2025, '/question_papers/June-July25/EC/Network Analysis.pdf'),
(31, 2025, '/question_papers/June-July25/EC/MATLAB.pdf');

-- === CIVIL (branch_id=7) — only Dec24-Jan25 ===
INSERT INTO question_papers (subject_id, exam_year, file_path) VALUES
(32, 2024, '/question_papers/Dec24-Jan25/CIVIL/Engineering Geology.pdf'),
(33, 2024, '/question_papers/Dec24-Jan25/CIVIL/Engineering Survey.pdf'),
(34, 2024, '/question_papers/Dec24-Jan25/CIVIL/Strength of Materials.pdf');
