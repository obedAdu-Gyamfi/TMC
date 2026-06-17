# TMC Seminar — Practical Task Project

**Department of Mathematics | The Mathematics Community (TMC)**
**KNUST, Kumasi | June 2026**


---

## Overview

This task project consolidates everything covered in the TMC seminar across two modules:

| Module | Topic |
|--------|-------|
| 1 | Version Control Systems — Git & GitHub |
| 2 | Databases & SQL — PostgreSQL & Core Operations |

You will build a **student grade tracker** — a small but complete project that lives in a
Git repository and is backed by a PostgreSQL database. By the end, you will have a real
project on your GitHub profile.

---

## Prerequisites

Before starting, confirm the following are installed on your machine:

- [ ] Git (`git --version`)
- [ ] GitHub account + GitHub CLI (`gh --version`)
- [ ] PostgreSQL (`psql --version`)
- [ ] A terminal (Command Prompt, Git Bash, or Linux/macOS Terminal)

---

## Project Structure (what you will build)

```
grade_tracker/
├── README.md                  ← This file (update it as you go)
├── .gitignore                 ← Excludes credentials and OS clutter
└── sql/
    ├── 01_create.sql          ← Create the database and tables
    ├── 02_insert.sql          ← Populate with sample data
    ├── 03_query.sql           ← Run SELECT queries
    └── 04_update_delete.sql   ← Modify and remove records
```

---

## Module 1 Tasks — Git & GitHub

### Task 1.1 — Configure Git

Open your terminal and set your identity:

```bash
git config --global user.name  "Your Full Name"
git config --global user.email "your.email@st.knust.edu.gh"
```

Verify the configuration was saved:

```bash
git config --list
```

**✅ Deliverable:** Screenshot showing your name and email in `git config --list`.

---

### Task 1.2 — Initialise Your Repository

1. Create a project folder named `grade_tracker`
2. Navigate into it and initialise a Git repository:

```bash
mkdir grade_tracker
cd grade_tracker
git init
git status
```

3. Create a `README.md` file with a brief description of your project (2–3 sentences)
4. Create a `.gitignore` file containing:

```
.env
*.pgpass
.DS_Store
Thumbs.db
```

5. Stage and commit both files:

```bash
git add README.md .gitignore
git commit -m "Initial commit: add README and .gitignore"
```

**✅ Deliverable:** Output of `git log --oneline` showing your first commit.

---

### Task 1.3 — Build Commit History

As you complete Module 2 (SQL tasks), make one commit after each SQL file you create.
Use clear, descriptive commit messages following the examples below:

| After completing | Commit message to use |
|------------------|-----------------------|
| `sql/01_create.sql` | `Add schema: create grade_tracker database and tables` |
| `sql/02_insert.sql` | `Seed data: insert sample students and grades` |
| `sql/03_query.sql` | `Add SELECT queries for grade analysis` |
| `sql/04_update_delete.sql` | `Add UPDATE and DELETE examples` |

> **Rule:** Never commit all files at once with a vague message like `"done"`.
> Each commit should tell a story about *what changed and why*.

**✅ Deliverable:** Output of `git log --oneline` showing at least 5 commits.

---

### Task 1.4 — Push to GitHub

Use the GitHub CLI to create a public repository and push your project:

```bash
gh auth login
gh repo create grade_tracker \
    --public \
    --source=. \
    --remote=origin \
    --push
```

Verify the remote is linked:

```bash
git remote -v
```

**✅ Deliverable:** The URL of your public GitHub repository (e.g., `https://github.com/YourName/grade_tracker`).

---

### Task 1.5 — Bonus: Branching

Create a feature branch, make a change, and merge it back to `main`:

```bash
git checkout -b feature/add-bonus-query
```

Add a new file `sql/05_bonus.sql` with a query of your own design, then:

```bash
git add sql/05_bonus.sql
git commit -m "Bonus: add custom analysis query"
git checkout main
git merge feature/add-bonus-query
git push
```

**✅ Deliverable:** Screenshot of `git log --oneline --graph` showing the merge.

---

## Module 2 Tasks — SQL & PostgreSQL

### Task 2.1 — Create the Database and Tables

Inside `sql/01_create.sql`, write SQL to:

1. Create a database named `grade_tracker`
2. Connect to it with `\c grade_tracker`
3. Create a `students` table with these columns:

| Column | Type | Constraint |
|--------|------|------------|
| `id` | `SERIAL` | `PRIMARY KEY` |
| `fullname` | `VARCHAR(100)` | `NOT NULL` |
| `email` | `VARCHAR(150)` | `NOT NULL`, `UNIQUE` |
| `level` | `INTEGER` | — |
| `enrolled` | `BOOLEAN` | `DEFAULT TRUE` |

4. Create a `grades` table with these columns:

| Column | Type | Constraint |
|--------|------|------------|
| `id` | `SERIAL` | `PRIMARY KEY` |
| `student_id` | `INTEGER` | `NOT NULL` |
| `course` | `VARCHAR(100)` | `NOT NULL` |
| `score` | `NUMERIC(5,2)` | — |
| `semester` | `VARCHAR(20)` | — |

Run it in `psql`:

```bash
psql -U postgres -f sql/01_create.sql
```

**✅ Deliverable:** Output of `\dt` showing both tables exist.

---

### Task 2.2 — Insert Sample Data

Inside `sql/02_insert.sql`, insert:

- At least **5 students** into the `students` table
- At least **10 grade records** into the `grades` table (each student should have at least one)

Use both single-row and multi-row `INSERT` syntax to demonstrate both approaches.

**✅ Deliverable:** Output of `SELECT COUNT(*) FROM students;` and `SELECT COUNT(*) FROM grades;`.

---

### Task 2.3 — Query the Data

Inside `sql/03_query.sql`, write the following queries (add a comment above each one explaining what it does):

1. Select all columns from `students`
2. Select only `fullname` and `level` from `students`, ordered alphabetically
3. Select students who are currently enrolled (`enrolled = TRUE`)
4. Select all grades where the score is above **70**
5. Count how many students are in each level using `GROUP BY`
6. Calculate the **average score per course** using `AVG()` and `GROUP BY`
7. Find the **highest and lowest score** in the entire `grades` table using `MAX()` and `MIN()`

**✅ Deliverable:** Paste the output of Query 6 (average score per course) into your README.

---

### Task 2.4 — Update and Delete Records

Inside `sql/04_update_delete.sql`:

1. Update the `enrolled` status of one student to `FALSE`
2. Update the score of one grade record
3. Insert a temporary test record, then delete it
4. After each operation, write a `SELECT` query to confirm the change

> ⚠️ **Always use a `WHERE` clause with `UPDATE` and `DELETE`.**
> Without it, every row in the table is affected.

**✅ Deliverable:** The SQL for your `DELETE` statement and the confirming `SELECT` showing the row is gone.

---

## Marking Scheme

| Task | Description | Marks |
|------|-------------|-------|
| 1.1 | Git configuration | 5 |
| 1.2 | Repository initialisation and first commit | 10 |
| 1.3 | Meaningful commit history (5+ commits) | 15 |
| 1.4 | Push to GitHub with correct remote | 10 |
| 2.1 | Create database and both tables (DDL) | 15 |
| 2.2 | Insert sample data (DML — INSERT) | 10 |
| 2.3 | Seven SELECT queries with comments | 20 |
| 2.4 | UPDATE and DELETE with confirmations | 10 |
| **Total** | | **95** |
| 1.5 *(Bonus)* | Branching and merge | 10 |

---

## Submission Instructions

1. Ensure all your SQL files are committed and pushed to your GitHub repository
2. Update your `README.md` to include:
   - Your full name and student ID
   - Your GitHub repository URL
   - The output of Query 6 from Task 2.3 (pasted as a code block)
3. Submit your **GitHub repository URL** via the TMC submission form by the deadline

> **Repository must be public** so it can be reviewed. Private repositories will not be marked.

---

## Tips for Success

- **Commit early and often.** You can always revert to a previous commit if something breaks.
- **Write comments in your SQL.** Use `--` to explain what each query does — it shows understanding.
- **Test each SQL file before committing.** Run it in `psql` first, fix any errors, then stage and commit.
- **Use `git status` constantly.** It tells you exactly what Git sees at any moment.
- **Don't store passwords in your files.** That is what `.gitignore` and `.env` files are for.

---

## Resources

| Resource | Link |
|----------|------|
| Seminar slides & demo files | `github.com/obedAdu-Gyamfi/TMC` |
| PostgreSQL documentation | `postgresql.org` |
| pgAdmin (GUI for PostgreSQL) | `pgadmin.org/download` |
| psql cheatsheet | `obedadu-gyamfi.github.io/.../psql-cheatsheet.html` |
| Contact | `adugyamfiobed.tpp3@gmail.com` |

---

*Department of Mathematics | The Mathematics Community (TMC) | KNUST, Kumasi*
