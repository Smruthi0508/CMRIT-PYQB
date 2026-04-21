const branches = ["CSE", "ISE"];
const years = ["1st Year", "2nd Year"];
const semesters = ["Sem 3", "Sem 4"];

const subjects = {
    "Sem 3": ["Data Structures"],
    "Sem 4": ["OS"]
};

const papers = {
    "Data Structures": ["2023.pdf"],
    "OS": ["2022.pdf"]
};

const branchList = document.getElementById("branchList");

// Load branches
branches.forEach(b => {
    let div = document.createElement("div");
    div.className = "card";
    div.textContent = b;
    div.onclick = loadYears;
    branchList.appendChild(div);
});

function loadYears() {
    yearList.innerHTML = "";
    years.forEach(y => {
        let div = document.createElement("div");
        div.className = "card";
        div.textContent = y;
        div.onclick = loadSemesters;
        yearList.appendChild(div);
    });
}

function loadSemesters() {
    semList.innerHTML = "";
    semesters.forEach(s => {
        let div = document.createElement("div");
        div.className = "card";
        div.textContent = s;
        div.onclick = () => loadSubjects(s);
        semList.appendChild(div);
    });
}

function loadSubjects(sem) {
    subjectList.innerHTML = "";
    subjects[sem].forEach(sub => {
        let div = document.createElement("div");
        div.className = "card";
        div.textContent = sub;
        div.onclick = () => loadPapers(sub);
        subjectList.appendChild(div);
    });
}

function loadPapers(sub) {
    qpList.innerHTML = "";
    papers[sub].forEach(p => {
        let div = document.createElement("div");
        div.className = "card";
        div.innerHTML = p;
        qpList.appendChild(div);
    });
}

function searchData() {
    const input = document.getElementById("searchBox").value.toLowerCase();
    const results = document.getElementById("searchResults");

    results.innerHTML = "";

    for (let sem in subjects) {
        subjects[sem].forEach(sub => {
            if (sub.toLowerCase().includes(input)) {
                let div = document.createElement("div");
                div.className = "card";
                div.textContent = sub;
                results.appendChild(div);
            }
        });
    }
}