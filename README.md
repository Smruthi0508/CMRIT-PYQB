# CMRIT-PYQB - Previous Year Question Bank Portal

CMRIT-PYQB is a centralized web-based platform that provides CMRIT engineering students with organized, easy access to previous year question papers. The system intelligently structures question papers by **Year → Branch → Semester → Subject**, allowing students to quickly find and download exam papers for exam preparation.

---

## 📌 About This Project

### Problem Statement
Engineering students at CMRIT struggle to find previous year question papers during exam preparation. These resources are typically scattered across:
- Senior batches
- Messaging groups (WhatsApp, Telegram, etc.)
- Multiple unorganized sources
- Offline storage

### Solution
**CMRIT-PYQB** provides a **centralized, structured, and searchable academic repository** where:
- Students can browse papers by year, branch, semester, and subject
- Papers are organized hierarchically for easy navigation
- Downloadable PDF question papers are readily available
- The system is simple, fast, and user-friendly

---

## ✨ Key Features

- 🎯 **Hierarchical Navigation** — Browse by Year → Branch → Semester → Subject
- 📚 **Complete Coverage** — Papers for 1st to 4th year and all engineering branches
- 🔍 **Multiple Exam Sessions** — Access papers from Dec-Jan, June-July, and other sessions
- ⚡ **Fast & Responsive** — Clean UI with quick paper access
- 📥 **Direct Downloads** — One-click PDF download of question papers
- 📊 **Real-time Stats** — See available branches and semesters at a glance
- 🎨 **Modern Design** — Beautiful, intuitive interface for easy navigation

---

## 🛠 Technology Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | HTML5, CSS3, JavaScript (Vanilla) |
| **Backend** | Python, Django Framework |
| **Database** | MySQL |
| **Tools** | Git, GitHub, VS Code, MySQL Workbench |

---

## 🏗 System Architecture

```
┌─────────────────┐
│  User (Student) │
└────────┬────────┘
         │
┌────────▼────────────────────────┐
│ Frontend (HTML/CSS/JavaScript)  │
│  • Paper Finder UI              │
│  • Dynamic Dropdowns            │
│  • Download Management          │
└────────┬───────────────────────┘
         │ (HTTP REST API Calls)
┌────────▼────────────────────────┐
│  Backend (Django REST API)      │
│  • GET /api/branches-year/      │
│  • GET /api/semesters/          │
│  • GET /api/subjects-year/      │
│  • GET /api/papers/             │
└────────┬───────────────────────┘
         │ (SQL Queries)
┌────────▼────────────────────────┐
│  MySQL Database                 │
│  • Branches, Years, Semesters   │
│  • Subjects, Question Papers    │
└────────┬───────────────────────┘
         │ (File Path References)
┌────────▼────────────────────────┐
│  Question Papers Storage        │
│  (PDF files organized by year)  │
└────────────────────────────────┘
```

---

## 🔄 Data Flow & Navigation Hierarchy

The system uses an intelligent cascading filter system:

```
User selects YEAR
      ↓
[API filters branches by year]
      ↓
User selects BRANCH
      ↓
[API filters semesters for that year]
      ↓
User selects SEMESTER
      ↓
[API filters subjects for that branch & semester]
      ↓
User selects SUBJECT
      ↓
[API retrieves all question papers for that subject]
      ↓
User DOWNLOADS Paper
```

### Year-Based Filtering
- **1st Year**: Only CSE & EEE branches
- **2nd-4th Year**: All engineering branches (AIDS, AIML, CIVIL, CSDS, CSML, EC, ISE, etc.)

---

## 📁 Project Structure

```
CMRIT-PYQB/
│
├── backend/                           # Django Application
│   └── django_project/
│       ├── manage.py                  # Django management script
│       ├── django_project/
│       │   ├── settings.py            # Django configuration
│       │   ├── urls.py                # Main URL router
│       │   ├── wsgi.py                # WSGI deployment
│       │   └── __init__.py
│       └── pyqb/                      # Main app (Paper Question Bank)
│           ├── models.py              # Database models
│           ├── views.py               # API endpoints/views
│           ├── urls.py                # App URL patterns
│           ├── apps.py
│           └── __init__.py
│
├── frontend/                          # Frontend (HTML/CSS/JS)
│   ├── index.html                     # Main page
│   ├── style.css                      # Styling
│   └── script.js                      # JavaScript logic
│
├── question_papers/                   # PDF Storage (organized)
│   ├── 1-YEAR/
│   │   ├── Dec-Jan24/
│   │   ├── Dec-Jan25/
│   │   ├── Jan-Feb23/
│   │   ├── June-July23/
│   │   ├── June-July24/
│   │   └── June-July25/
│   │       ├── CSE/
│   │       └── EEE/
│   │
│   ├── 3SEM/, 4SEM/, 5SEM/, 6SEM/    # Higher semesters
│   │   ├── [Sessions]/
│   │   │   ├── AIDS/
│   │   │   ├── AIML/
│   │   │   ├── CIVIL/
│   │   │   ├── CSDS/
│   │   │   ├── CSML/
│   │   │   ├── EC/
│   │   │   └── ISE/
│
├── database_setup.sql                 # Database initialization
├── insert_1year_papers.sql            # Sample data insertion
└── README.md                          # Documentation (this file)
```

---

## 📊 Database Schema

### Tables Overview

#### `branches` Table
```sql
branch_id (PK)  → branch_name (VARCHAR)  → branch_code (VARCHAR)
```
Stores all engineering branches at CMRIT.

#### `years` Table
```sql
year_id (PK)  →  year_name (VARCHAR)
```
Stores academic years (1st Year, 2nd Year, etc.).

#### `semesters` Table
```sql
semester_id (PK)  →  year_id (FK)  →  semester_number (INT)
```
Stores semesters linked to years.

#### `subjects` Table
```sql
subject_id (PK)  →  branch_id (FK)  →  semester_id (FK)  →  subject_name  →  subject_code
```
Stores subjects for each branch and semester combination.

#### `question_papers` Table
```sql
paper_id (PK)  →  subject_id (FK)  →  exam_session  →  file_path
```
Stores question paper metadata and file references.

---

## 🔌 API Endpoints

The Django backend provides RESTful API endpoints for the frontend:

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/api/branches/` | GET | Get all branches |
| `/api/branches-year/<year_id>/` | GET | Get branches filtered by year |
| `/api/semesters/<year_id>/` | GET | Get semesters for a specific year |
| `/api/subjects/<branch_id>/<semester_id>/` | GET | Get subjects for branch & semester |
| `/api/subjects-year/<branch_id>/<year_id>/` | GET | Get subjects for branch & year |
| `/api/papers/<subject_id>/` | GET | Get question papers for subject |

### Response Format (JSON)
```json
[
  {
    "paper_id": 1,
    "subject_id": 5,
    "exam_session": "Dec-Jan24",
    "file_path": "question_papers/1-YEAR/Dec-Jan24/CSE/paper1.pdf"
  }
]
```

---

## 🚀 Getting Started

### Prerequisites
- Python 3.8+
- MySQL Server
- Git
- VS Code (or any text editor)

### Installation & Setup

#### 1. Clone Repository
```bash
git clone <repository-url>
cd CMRIT-PYQB
```

#### 2. Database Setup
```bash
# Create MySQL database
mysql -u root -p < database_setup.sql

# Insert sample data (1st year papers)
mysql -u root -p cmrit_pyqb < insert_1year_papers.sql
```

#### 3. Backend Setup
```bash
cd backend/django_project

# Install Django
pip install django

# Configure database connection in settings.py if needed

# Run migrations
python manage.py migrate

# Start Django development server
python manage.py runserver
```
Server will run at: `http://127.0.0.1:8000`

#### 4. Frontend Setup
```bash
# Open frontend in browser
# Navigate to: frontend/index.html
# Or use Live Server extension in VS Code
```

---

## 📚 Supported Branches

The system supports all engineering branches at CMRIT:

| Branch Code | Branch Name | Available Years |
|-------------|------------|-----------------|
| CSE | Computer Science & Engineering | 1st - 4th |
| EEE | Electrical and Electronics Engineering | 1st - 4th |
| EC | Electronics & Communication | 2nd - 4th |
| CIVIL | Civil Engineering | 2nd - 4th |
| AIDS | Artificial Intelligence & Data Science | 2nd - 4th |
| AIML | Artificial Intelligence & Machine Learning | 2nd - 4th |
| ISE | Information Science & Engineering | 2nd - 4th |
| CSDS | Computer Science & Data Science | 2nd - 4th |
| CSML | Computer Science & Machine Learning | 2nd - 4th |

---

## 🗂 Exam Sessions Covered

The portal includes question papers from multiple exam sessions:
- December-January (Dec-Jan23, Dec-Jan24, Dec-Jan25, etc.)
- June-July (June-July23, June-July24, June-July25, etc.)
- January-February (where applicable)

---

## 🔒 How It Works

1. **Student navigates frontend** → Selects Year, Branch, Semester, Subject
2. **Frontend sends API request** → `GET /api/papers/<subject_id>/`
3. **Backend queries database** → Retrieves paper metadata from `question_papers` table
4. **Backend returns JSON** → Contains exam_session and file_path
5. **Frontend displays papers** → Lists all available papers for that subject
6. **Student downloads PDF** → PDF file is downloaded from the file system

---

## 🛠 Configuration

### Django Settings (backend/django_project/django_project/settings.py)
- Ensure `ALLOWED_HOSTS` includes frontend domain
- Configure `DATABASES` for MySQL connection
- Add CORS headers if frontend and backend are on different domains

### Frontend API URL (frontend/script.js)
```javascript
const API = "http://127.0.0.1:8000/api";
```
Update this if backend is hosted on a different server.

---

## 📈 Future Enhancements

- 🔐 User authentication and login system
- ⭐ Favorite/bookmark papers feature
- 💬 Comments and ratings on papers
- 🔍 Advanced search and filter options
- 📱 Mobile app version
- ☁️ Cloud storage integration
- 📊 Analytics dashboard for admin
- 🤖 AI-powered paper recommendations

---

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📝 License

This project is created for CMRIT students and is open for educational use.

---

## 👥 Team & Contact

**Project**: CMRIT Previous Year Question Bank Portal  
**Institution**: CMRIT, Bengaluru  
**Purpose**: To help engineering students access and prepare using previous year exam papers

---

## 📞 Support & Feedback

For issues, bugs, or feature requests, please open an issue on GitHub or contact the development team.

---

**Last Updated**: May 2026  
**Status**: Active & Maintained  
**Version**: 1.0
└── README.md
```

---

## 🚀 Installation Steps

**1. Install Python**

Download Python from [https://python.org](https://python.org)

**2. Clone the Repository**
```bash
git clone https://github.com/yourusername/CMRIT-PYQB.git
```

**3. Navigate to Project Folder**
```bash
cd CMRIT-PYQB
```

**4. Install Django**
```bash
pip install django
```

**5. Run the Server**
```bash
python manage.py runserver
```



---

## 🔮 Future Improvements

- Search functionality
- Admin panel for uploading question papers
- User authentication
- Filtering by academic year
- Mobile responsive interface

---

## 👥 Contributors

- **Smruthi**
- **Soujanya**

Department of Artificial Intelligence & Data Science
**CMR Institute of Technology**

---

## 📄 License

This project is developed for academic purposes.