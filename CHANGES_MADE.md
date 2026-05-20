# Changes Made - 4th, 5th, 6th, 7th Semester Support & 8th Sem Removal

## Summary
- ✅ Added **4th, 5th, 6th, 7th semester** subjects for ALL branches (AIDS, AIML, ISE, CSDS, CSML, EC, CIVIL)
- ✅ Removed **8th semester** from the system
- ✅ Updated UI to reflect 7 semesters instead of 8

## Files Modified

### 1. **frontend/index.html**
- Changed semesters count from **8** to **7** in the hero stats section

### 2. **database_setup.sql**
- **Updated semesters insert**: Removed `(4,8)` from semester list (removed semester 8)
- **Added 150 new subjects** across 4 semesters (4th, 5th, 6th, 7th) for all 7 branches:
  - **4th Semester**: 7 subjects per branch (70+ subject IDs)
  - **5th Semester**: 5 subjects per branch (116+ subject IDs)
  - **6th Semester**: 5 subjects per branch (151+ subject IDs)
  - **7th Semester**: 5 subjects per branch (186+ subject IDs)

## Database Structure

### Subject ID Ranges:
- **1st Year (Sem 1-2)**: IDs 35-69 (CSE, EEE)
- **3rd Semester**: IDs 1-34
- **4th Semester**: IDs 70-115 (AIDS, AIML, ISE, CSDS, CSML, EC, CIVIL)
- **5th Semester**: IDs 116-150
- **6th Semester**: IDs 151-185
- **7th Semester**: IDs 186-220

### Subjects Per Branch (Semesters 4-7):

#### 4th Semester (7 subjects each):
- AIDS, AIML, ISE, CSDS, CSML: ADA, AI, BIO, DBMS, DMS, UHV, MICROCONTROLLER
- EC: AC, CT, DLD, EMT, UHV, MATLAB (6 subjects)
- CIVIL: BM, FM, HHM, MOS, UHV (5 subjects)

#### 5th Semester (5 subjects each):
- AIDS, AIML, ISE, CSDS, CSML: BDA, CN, CS, ML, Professional Elective
- EC: CS, MμC, PE, SP, Professional Elective
- CIVIL: DRS, EE, GE, TE, Professional Elective

#### 6th Semester (5 subjects each):
- AIDS, AIML, ISE, CSDS, CSML: CC, DM, DL, NLP, Professional Elective
- EC: AP, DSP, PS, WC, Professional Elective
- CIVIL: CT, HE, IE, WSS, Professional Elective

#### 7th Semester (5 subjects each):
- AIDS, AIML, ISE, CSDS, CSML: BT, IP, IoTA, QC, Professional Elective
- EC: VLSI, WSN, RFM, PTD, Professional Elective
- CIVIL: AE, BE, EEng, RE, Professional Elective

## Next Steps

### To Activate These Changes:
1. **Backup current database**
2. **Run the updated SQL scripts**:
   ```bash
   mysql -u root -p < database_setup.sql
   ```
3. **Add question paper files** to the folder structure:
   - `question_papers/4SEM/{session}/{BRANCH}/`
   - `question_papers/5SEM/{session}/{BRANCH}/`
   - `question_papers/6SEM/{session}/{BRANCH}/`
   - `question_papers/7SEM/{session}/{BRANCH}/`
4. **Run `insert_4-7sem_papers.sql`** (need to create with actual file paths)

### To Add Question Papers:
Create `insert_4-7sem_papers.sql` with INSERT statements following this format:
```sql
INSERT INTO question_papers (subject_id, exam_session, file_path) VALUES
(70,'Dec24-Jan25','C:/Users/user/OneDrive/Desktop/CMRIT-PYQB/question_papers/4SEM/Dec24-Jan25/AIDS/ADA.pdf'),
-- ... more entries
```

## Frontend (No changes needed)
The frontend JavaScript dynamically handles:
- Loading semesters from the API based on selected year
- The dropdown automatically shows semesters 1-7 for years 2-4
- No hardcoded semester values

## Backend (No changes needed)
The API endpoints (`/api/semesters/{year_id}/`) dynamically fetch semesters from the database.
