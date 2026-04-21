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

// Stat counters
const statBranches = document.getElementById("stat-branches");
const statPapers   = document.getElementById("stat-papers");

// ── Header scroll effect ──
window.addEventListener("scroll", () => {
    const header = document.getElementById("header");
    if (header) {
        header.classList.toggle("header--scrolled", window.scrollY > 40);
    }
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
}

function hidePapers() {
    if (papersSection) papersSection.style.display = "none";
    if (emptyState) emptyState.style.display = "block";
    if (papersList) papersList.innerHTML = "";
}

// ============================================
// 1. Load Branches on page load
// ============================================
fetch(`${API}/branches/`)
    .then(res => res.json())
    .then(data => {
        let html = '<option value="">Select Branch</option>';
        data.forEach(b => {
            html += `<option value="${b.branch_id}">${b.branch_name} (${b.branch_code})</option>`;
        });
        branchSelect.innerHTML = html;

        // Update stat
        if (statBranches) statBranches.textContent = data.length;
    })
    .catch(() => {
        branchSelect.innerHTML = '<option value="">Failed to load</option>';
    });

// ============================================
// 2. Year change → load Semesters
// ============================================
yearSelect.addEventListener("change", function () {
    const yearId = this.value;

    // Reset downstream
    resetSelect(semesterSelect, "Loading...");
    resetSelect(subjectSelect, "Select semester first");
    hidePapers();

    if (!yearId) {
        resetSelect(semesterSelect, "Select year first");
        return;
    }

    setCardActive("card-semester");

    fetch(`${API}/semesters/${yearId}/`)
        .then(res => res.json())
        .then(data => {
            let html = '<option value="">Select Semester</option>';
            data.forEach(s => {
                html += `<option value="${s.semester_id}">Semester ${s.semester_number}</option>`;
            });
            semesterSelect.innerHTML = html;
            semesterSelect.disabled = false;   // ← enable the dropdown
        })
        .catch(() => {
            resetSelect(semesterSelect, "Failed to load");
        });
});

// ============================================
// 3. Semester change → load Subjects
// ============================================
semesterSelect.addEventListener("change", function () {
    const branchId   = branchSelect.value;
    const semesterId = this.value;

    // Reset downstream
    resetSelect(subjectSelect, "Loading...");
    hidePapers();

    if (!semesterId || !branchId) {
        resetSelect(subjectSelect, "Select branch & semester");
        return;
    }

    setCardActive("card-subject");

    fetch(`${API}/subjects/${branchId}/${semesterId}/`)
        .then(res => res.json())
        .then(data => {
            if (data.length === 0) {
                resetSelect(subjectSelect, "No subjects found");
                return;
            }
            let html = '<option value="">Select Subject</option>';
            data.forEach(s => {
                html += `<option value="${s.subject_id}">${s.subject_name} (${s.subject_code})</option>`;
            });
            subjectSelect.innerHTML = html;
            subjectSelect.disabled = false;   // ← enable the dropdown
        })
        .catch(() => {
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

    fetch(`${API}/papers/${subjectId}/`)
        .then(res => res.json())
        .then(data => {
            if (data.length === 0) {
                papersList.innerHTML = `
                    <div style="text-align:center; padding:40px; color:#64748b;">
                        No question papers available for this subject yet.
                    </div>`;
                if (papersCount) papersCount.textContent = "0 papers found";
                showPapers();
                return;
            }

            if (papersCount) papersCount.textContent = `${data.length} paper${data.length > 1 ? 's' : ''} found`;

            let html = "";
            data.forEach(p => {
                html += `
                <div class="paper-item">
                    <div class="paper-item__info">
                        <div class="paper-item__icon">📄</div>
                        <div>
                            <div class="paper-item__year">Exam Year: ${p.exam_year}</div>
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

            // Update stat
            if (statPapers) statPapers.textContent = data.length;
        })
        .catch(() => {
            papersList.innerHTML = `
                <div style="text-align:center; padding:40px; color:#ef4444;">
                    Error loading papers. Please try again.
                </div>`;
            showPapers();
        });
});