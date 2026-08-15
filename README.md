# SkillGraph Explorer

A graph-powered career recommendation and skill-learning platform built using **FastAPI, React, and CognoDB**.

SkillGraph Explorer connects **skills, career roles, companies, prerequisites, and related skills** using a graph-based data model.

## Features

### 1. Skill Explorer

Users can select a skill and view:

* Skill category
* Related career opportunities
* Companies hiring for those roles

### 2. Career Recommendations

The application recommends suitable career roles based on the selected skill.

Example:

**JavaScript → Frontend Developer**

### 3. Related Skills

Users can explore skills connected through graph relationships.

Example:

**JavaScript → React**

### 4. Skill Gap Analysis

Users can select a career role and view the skills required for that role and their prerequisites.

Example:

**AI/ML Engineer**

* Python
* Statistics
* Pandas
* Machine Learning
* Deep Learning

### 5. Learning Path

The application generates an ordered learning path based on prerequisite relationships.

Learning levels:

* Foundation
* Core
* Advanced

## Technologies Used

### Frontend

* React
* Vite
* JavaScript
* Axios
* Lucide React
* CSS

### Backend

* Python
* FastAPI
* Uvicorn

### Database / Graph

* CognoDB
* Cypher

### Development Tools

* Visual Studio Code
* Git
* GitHub

## Project Structure

```text
SkillGraph - WEXA AI/
├── backend/
│   ├── db.py
│   ├── main.py
│   ├── run_cypher.py
│   ├── test_connection.py
│   └── verify_graph.py
│
├── cypher/
│   ├── 01_constraints.cypher
│   ├── 02_seed_data.cypher
│   ├── 03_verify_graph.cypher
│   ├── 04_role_recommendations.cypher
│   ├── 05_skill_gap.cypher
│   └── 06_related_skills.cypher
│
├── frontend/
│   ├── public/
│   └── src/
│       ├── App.css
│       ├── App.jsx
│       ├── index.css
│       └── main.jsx
│
├── .env.example
├── .gitignore
└── README.md
```

## Setup

### 1. Clone the repository

```bash
git clone <your-github-repository-url>
cd "SkillGraph - WEXA AI"
```

### 2. Configure environment variables

Create a `.env` file using `.env.example` as a reference.

Add the required CognoDB connection details.

**Do not commit secrets, passwords, or API keys to GitHub.**

## Run Backend

Open a terminal in the `backend` directory:

```powershell
cd backend
python -m uvicorn main:app --reload
```

Backend:

```text
http://127.0.0.1:8000
```

FastAPI documentation:

```text
http://127.0.0.1:8000/docs
```

## Run Frontend

Open another terminal:

```powershell
cd frontend
npm install
npm run dev
```

Open the URL shown by Vite:

```text
http://localhost:5173/
```

## Example User Flow

1. Open SkillGraph Explorer.
2. Select a skill such as **JavaScript** or **Machine Learning**.
3. View recommended career opportunities.
4. View companies hiring for the recommended role.
5. Explore related skills.
6. Select a role under **Skill Gap Analysis**.
7. Review required skills and prerequisites.
8. View the generated **Learning Path**.
9. Follow the Foundation → Core → Advanced progression.

## Assessment

**SkillGraph Explorer** was built as part of the **WEXA AI Software Engineer (Full-Stack / Web) assessment**.

**Focus:** Graph-based career recommendations and personalized skill development.
