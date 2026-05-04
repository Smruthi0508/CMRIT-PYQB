/* ============================================
   CMRIT-PYQB — Frontend Logic
   ============================================ */

const API = "http://127.0.0.1:8000/api";

// DOM references
const branchSelect   = document.getElementById("branch");
const yearSelect     = document.getElementById("year");
const semesterSelect = document.getElementById("semester");
const subjectSelect  = document.getElementById("subject");
const papersSection  = document.getElementById("papers-section");
const papersList     = document.getElementById("papers");
const papersCount    = document.getElementById("papers-count");
const emptyState     = document.getElementById("empty-state");
const noPapersFound  = document.getElementById("no-papers-found");

// Stat counters
const statBranches = document.getElementById("stat-branches");

// ── Header scroll effect ──
window.addEventListener("scroll", () => {
    const header = document.getElementById("header");
    if (header) {
        header.classList.toggle("header--scrolled", window.scrollY > 40);
    }
});

// ── Load stats on page load ──
window.addEventListener("load", () => {
    fetch(`${API}/branches/`)
        .then(res => res.json())
        .then(data => {
            if (statBranches) statBranches.textContent = data.length;
        })
        .catch(() => {
            console.error("Error loading branches count");
        });
});

// ── Helper: reset a <select> to disabled with a placeholder ──
function resetSelect(selectEl, placeholder) {
    selectEl.innerHTML = `<option value="">${placeholder}</option>`;
    selectEl.disabled = true;
}

// ── Helper: highlight the active finder card ──
function setCardActive(cardId) {
    document.querySelectorAll(".finder__card").forEach(c =>
        c.classList.remove("finder__card--active")
    );
    const card = document.getElementById(cardId);
    if (card) card.classList.add("finder__card--active");
}

// ── Helper: show / hide papers section ──
function showPapers() {
    if (papersSection) papersSection.style.display = "block";
    if (emptyState) emptyState.style.display = "none";
    if (noPapersFound) noPapersFound.style.display = "none";
}

function hidePapers() {
    if (papersSection) papersSection.style.display = "none";
    if (emptyState) emptyState.style.display = "block";
    if (noPapersFound) noPapersFound.style.display = "none";
    if (papersList) papersList.innerHTML = "";
    if (papersCount) papersCount.textContent = "0 papers found";
}

function showNoPapersFound() {
    if (papersSection) papersSection.style.display = "none";
    if (emptyState) emptyState.style.display = "none";
    if (noPapersFound) noPapersFound.style.display = "block";
    if (papersList) papersList.innerHTML = "";
}

// ============================================
// 1. Load Years on page load
// ============================================
// Years are hardcoded in HTML, so no need to fetch

// ============================================
// 1B. Year change → enable Branch selection (filtered by year)
// ============================================
yearSelect.addEventListener("change", function () {
    const yearId = this.value;

    console.log("Year changed - yearId:", yearId);

    // Reset downstream and papers count
    resetSelect(branchSelect, "Loading...");
    resetSelect(semesterSelect, "Select year first");
    resetSelect(subjectSelect, "Select semester first");
    hidePapers();

    if (!yearId) {
        resetSelect(branchSelect, "Select year first");
        return;
    }

    // Load branches filtered by year
    fetch(`${API}/branches-year/${yearId}/`)
        .then(res => {
            console.log("Branches-year response status:", res.status);
            return res.json();
        })
        .then(data => {
            console.log("Branches data:", data);
            if (data.length === 0) {
                resetSelect(branchSelect, "No branches available");
                return;
            }
            let html = '<option value="">Select Branch</option>';
            data.forEach(b => {
                html += `<option value="${b.branch_id}">${b.branch_name} (${b.branch_code})</option>`;
            });
            branchSelect.innerHTML = html;
            branchSelect.disabled = false;
            setCardActive("card-branch");
        })
        .catch(error => {
            console.error("Error loading branches:", error);
            resetSelect(branchSelect, "Failed to load");
        });
});

// ============================================
// 2. Branch change → load Semesters or Subjects (for 1st year)
// ============================================
branchSelect.addEventListener("change", function () {
    const branchId = this.value;
    const yearId = yearSelect.value;

    console.log("Branch changed - branchId:", branchId, "yearId:", yearId);

    // Reset downstream and papers count
    resetSelect(semesterSelect, "Loading...");
    resetSelect(subjectSelect, "Select semester first");
    hidePapers();

    if (!branchId || !yearId) {
        resetSelect(semesterSelect, "Select branch first");
        return;
    }

    // ✓ Check if 1st year (yearId === "1")
    if (yearId === "1") {
        console.log("Loading subjects for 1st year (combined semesters)");
        // For 1st Year: disable semester selection and load subjects for all semesters (1 & 2)
        semesterSelect.innerHTML = '<option value="">Not applicable for 1st Year</option>';
        semesterSelect.disabled = true;

        setCardActive("card-subject");

        fetch(`${API}/subjects-year/${branchId}/${yearId}/`)
            .then(res => {
                console.log("Subjects-year response status:", res.status);
                return res.json();
            })
            .then(data => {
                console.log("Subjects data:", data);
                if (data.length === 0) {
                    resetSelect(subjectSelect, "No subjects found");
                    showNoPapersFound();
                    return;
                }
                let html = '<option value="">Select Subject</option>';
                data.forEach(s => {
                    html += `<option value="${s.subject_id}">${s.subject_name} (${s.subject_code})</option>`;
                });
                subjectSelect.innerHTML = html;
                subjectSelect.disabled = false;
                hidePapers();
            })
            .catch(error => {
                console.error("Error loading subjects by year:", error);
                resetSelect(subjectSelect, "Failed to load");
            });
    } else {
        console.log("Loading semesters for year:", yearId);
        // For other years: enable semester selection
        setCardActive("card-semester");

        fetch(`${API}/semesters/${yearId}/`)
            .then(res => {
                console.log("Semesters response status:", res.status);
                return res.json();
            })
            .then(data => {
                console.log("Semesters data:", data);
                let html = '<option value="">Select Semester</option>';
                data.forEach(s => {
                    html += `<option value="${s.semester_id}">Semester ${s.semester_number}</option>`;
                });
                semesterSelect.innerHTML = html;
                semesterSelect.disabled = false;
            })
            .catch(error => {
                console.error("Error loading semesters:", error);
                resetSelect(semesterSelect, "Failed to load");
            });
    }
});

// ============================================
// 3. Semester change → load Subjects
// ============================================
semesterSelect.addEventListener("change", function () {
    const branchId   = branchSelect.value;
    const semesterId = this.value;

    console.log("Semester changed - branchId:", branchId, "semesterId:", semesterId);

    // Reset downstream and papers count
    resetSelect(subjectSelect, "Loading...");
    hidePapers();

    if (!semesterId || !branchId) {
        resetSelect(subjectSelect, "Select branch & semester");
        return;
    }

    setCardActive("card-subject");

    fetch(`${API}/subjects/${branchId}/${semesterId}/`)
        .then(res => {
            console.log("Subjects response status:", res.status);
            return res.json();
        })
        .then(data => {
            console.log("Subjects data:", data);
            if (data.length === 0) {
                resetSelect(subjectSelect, "No subjects found");
                showNoPapersFound();
                return;
            }
            let html = '<option value="">Select Subject</option>';
            data.forEach(s => {
                html += `<option value="${s.subject_id}">${s.subject_name} (${s.subject_code})</option>`;
            });
            subjectSelect.innerHTML = html;
            subjectSelect.disabled = false;
            hidePapers();
        })
        .catch(error => {
            console.error("Error loading subjects:", error);
            resetSelect(subjectSelect, "Failed to load");
        });
});

// ============================================
// 4. Subject change → load Question Papers
// ============================================
subjectSelect.addEventListener("change", function () {
    const subjectId = this.value;

    if (!subjectId) {
        hidePapers();
        return;
    }

    console.log("Fetching papers for subject_id:", subjectId);

    fetch(`${API}/papers/${subjectId}/`)
        .then(res => {
            console.log("Response status:", res.status);
            if (!res.ok) {
                throw new Error(`HTTP error! status: ${res.status}`);
            }
            return res.json();
        })
        .then(data => {
            console.log("Papers data received:", data);
            
            if (data.length === 0) {
                const countText = "0 papers found";
                if (papersCount) papersCount.textContent = countText;
                showNoPapersFound();
                return;
            }

            // Update papers count dynamically
            const countText = `${data.length} paper${data.length > 1 ? 's' : ''} found`;
            if (papersCount) papersCount.textContent = countText;

            console.log(`Updating papers count: ${data.length} papers found`);

            let html = "";
            data.forEach((p, index) => {
                console.log(`Paper ${index}:`, p);
                html += `
                <div class="paper-item">
                    <div class="paper-item__info">
                        <div class="paper-item__icon">📄</div>
                        <div>
                            <div class="paper-item__year">Exam Session: ${p.exam_session || 'N/A'}</div>
                            <div class="paper-item__meta">Question Paper</div>
                        </div>
                    </div>
                    <a href="${p.file_path}" target="_blank" class="paper-item__download">
                        ↓ Download
                    </a>
                </div>`;
            });
            papersList.innerHTML = html;
            showPapers();
        })
        .catch(error => {
            console.error("Error fetching papers:", error);
            papersList.innerHTML = `
                <div style="text-align:center; padding:40px; color:#ef4444;">
                    Error loading papers: ${error.message}. Check browser console for details.
                </div>`;
            showPapers();
        });
});