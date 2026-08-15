# SkillGraph Explorer

A graph-powered career recommendation and skill-learning platform built using **FastAPI, React, and CognoDB**.

SkillGraph Explorer uses a graph data model to connect **skills, career roles, companies, prerequisites, and related skills**. Users can explore career opportunities based on their skills and discover the learning path required for a selected role.

---

## Ã°Å¸Å¡â‚¬ Features

### 1. Skill Explorer

Users can select a skill from the available skill graph.

The application displays:

* Skill category
* Career roles associated with the skill
* Companies hiring for those roles

### 2. Career Recommendations

For a selected skill, SkillGraph identifies suitable career opportunities.

Example:

**Machine Learning Ã¢â€ â€™ AI/ML Engineer**

Companies:

* DataSphere
* CloudWorks

### 3. Related Skills

The application identifies skills connected through graph relationships.

Example:

**Machine Learning Ã¢â€ â€™ Deep Learning**

This allows users to explore related technologies and expand their skill set.

### 4. Skill Gap Analysis

Users can select a career role to view the skills required for that role and their prerequisites.

Example:

**AI/ML Engineer**

* Python
* Statistics
* Pandas
* Machine Learning
* Deep Learning

### 5. Learning Path

The application generates a structured learning path based on the graph's prerequisite relationships.

Learning stages are categorized as:

* **Foundation**
* **Core**
* **Advanced**

Example:

1. Python Ã¢â‚¬â€ Foundation
2. Statistics Ã¢â‚¬â€ Foundation
3. Pandas Ã¢â‚¬â€ Core
4. Machine Learning Ã¢â‚¬â€ Core
5. Deep Learning Ã¢â‚¬â€ Advanced

---

## Ã°Å¸Â§Â  Graph Model

The project uses a graph-based data model with the following entities:

```text
Role
Skill
Company
```

Main relationships:

```text
Role Ã¢â€â‚¬Ã¢â€â‚¬REQUIRESÃ¢â€â‚¬Ã¢â€â‚¬> Skill

Skill Ã¢â€â‚¬Ã¢â€â‚¬PREREQUISITE_OFÃ¢â€â‚¬Ã¢â€â‚¬> Skill

Skill Ã¢â€â‚¬Ã¢â€â‚¬RELATED_TOÃ¢â€â‚¬Ã¢â€â‚¬> Skill

Company Ã¢â€â‚¬Ã¢â€â‚¬HIRES_FORÃ¢â€â‚¬Ã¢â€â‚¬> Role
```

This graph structure allows the application to derive relationships instead of relying only on static lists.

---

## Ã°Å¸Ââ€”Ã¯Â¸Â Architecture

```text
                 Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â
                 Ã¢â€â€š      React UI        Ã¢â€â€š
                 Ã¢â€â€š      Frontend        Ã¢â€â€š
                 Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ
                            Ã¢â€â€š
                            Ã¢â€â€š HTTP / REST
                            Ã¢â€“Â¼
                 Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â
                 Ã¢â€â€š       FastAPI        Ã¢â€â€š
                 Ã¢â€â€š       Backend        Ã¢â€â€š
                 Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ
                            Ã¢â€â€š
                            Ã¢â€â€š Cypher Queries
                            Ã¢â€“Â¼
                 Ã¢â€Å’Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Â
                 Ã¢â€â€š       CognoDB        Ã¢â€â€š
                 Ã¢â€â€š    Knowledge Graph   Ã¢â€â€š
                 Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€â‚¬Ã¢â€Ëœ
```

---

## Ã°Å¸â€ºÂ Ã¯Â¸Â Technologies Used

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
* Axios-compatible REST APIs

### Database / Graph

* CognoDB
* Cypher

### Development Tools

* Visual Studio Code
* Git
* GitHub

---

## Ã°Å¸â€œÂ Project Structure

```text
SkillGraph - WEXA AI/
Ã¢â€â€š
Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ backend/
Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ db.py
Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ main.py
Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ run_cypher.py
Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ test_connection.py
Ã¢â€â€š   Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬ verify_graph.py
Ã¢â€â€š
Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ cypher/
Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ 01_constraints.cypher
Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ 02_seed_data.cypher
Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ 03_verify_graph.cypher
Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ 04_role_recommendations.cypher
Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ 05_skill_gap.cypher
Ã¢â€â€š   Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬ 06_related_skills.cypher
Ã¢â€â€š
Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ frontend/
Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ src/
Ã¢â€â€š   Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ App.jsx
Ã¢â€â€š   Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ App.css
Ã¢â€â€š   Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ index.css
Ã¢â€â€š   Ã¢â€â€š   Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬ main.jsx
Ã¢â€â€š   Ã¢â€â€š
Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ package.json
Ã¢â€â€š   Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬ vite.config.js
Ã¢â€â€š
Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ .env
Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ .env.example
Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬ README.md
```

---

## Ã°Å¸â€Å’ API Endpoints

The FastAPI backend exposes the following endpoints:

### Get Skills

```text
GET /skills
```

Returns the available skills in the graph.

### Get Roles

```text
GET /roles
```

Returns available career roles.

### Career Recommendations

```text
GET /recommendations/{skill_name}
```

Returns career roles and companies related to a selected skill.

### Skill Gap

```text
GET /skill-gap/{role_name}
```

Returns the skills required for a selected role and their prerequisites.

### Related Skills

```text
GET /related-skills/{skill_name}
```

Returns skills connected to the selected skill.

### Learning Path

```text
GET /learning-path/{role_name}
```

Returns an ordered learning path for preparing for the selected role.

---

## Ã¢Å¡â„¢Ã¯Â¸Â Setup

### 1. Clone the repository

```bash
git clone <your-github-repository-url>
cd "SkillGraph - WEXA AI"
```

### 2. Configure environment variables

Create a `.env` file using `.env.example` as a reference.

Add the required CognoDB connection details.

**Do not commit secrets or API keys to GitHub.**

---

## Ã¢â€“Â¶Ã¯Â¸Â Run the Backend

Open a terminal in the `backend` directory:

```powershell
cd backend
```

If the Python environment is already configured:

```powershell
python -m uvicorn main:app --reload
```

The backend will run at:

```text
http://127.0.0.1:8000
```

FastAPI documentation:

```text
http://127.0.0.1:8000/docs
```

---

## Ã¢â€“Â¶Ã¯Â¸Â Run the Frontend

Open another terminal:

```powershell
cd frontend
```

Install dependencies if required:

```powershell
npm install
```

Start the development server:

```powershell
npm run dev
```

Open the URL shown by Vite, normally:

```text
http://localhost:5173/
```

---

## Ã°Å¸Â§Âª Example User Flow

1. Open SkillGraph Explorer.
2. Select **Machine Learning**.
3. View recommended career opportunities.
4. View companies hiring for the recommended role.
5. Explore related skills such as **Deep Learning**.
6. Select **AI/ML Engineer** under Skill Gap Analysis.
7. Review required skills and prerequisites.
8. View the generated Learning Path.
9. Follow the Foundation Ã¢â€ â€™ Core Ã¢â€ â€™ Advanced progression.

---

## Ã°Å¸â€œÅ  Example Graph Relationships

For the AI/ML Engineer role:

```text
AI/ML Engineer
      Ã¢â€â€š
      Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ REQUIRES Ã¢â€â‚¬Ã¢â€â‚¬> Python
      Ã¢â€â€š
      Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ REQUIRES Ã¢â€â‚¬Ã¢â€â‚¬> Statistics
      Ã¢â€â€š
      Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ REQUIRES Ã¢â€â‚¬Ã¢â€â‚¬> Pandas
      Ã¢â€â€š
      Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ REQUIRES Ã¢â€â‚¬Ã¢â€â‚¬> Machine Learning
      Ã¢â€â€š
      Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬ REQUIRES Ã¢â€â‚¬Ã¢â€â‚¬> Deep Learning
```

Prerequisite relationships:

```text
Python Ã¢â€â‚¬Ã¢â€â‚¬> Pandas

Python Ã¢â€â‚¬Ã¢â€â‚¬> Machine Learning
Statistics Ã¢â€â‚¬Ã¢â€â‚¬> Machine Learning

Machine Learning Ã¢â€â‚¬Ã¢â€â‚¬> Deep Learning
```

These relationships are used to generate the learning path shown in the application.

---

## Ã°Å¸â€Â Security

Environment-specific credentials are stored through environment variables.

The `.env` file should remain local and should **not** be committed to the repository.

The `.env.example` file can be used to document the required configuration without exposing secrets.

---

## Ã°Å¸Å½Â¯ Project Objective

The goal of SkillGraph Explorer is to demonstrate how a graph database can power intelligent career exploration.

Instead of treating skills, jobs, companies, and learning resources as independent records, the application represents them as interconnected graph entities.

This enables relationship-based queries such as:

* Which careers match this skill?
* Which companies hire for those careers?
* What skills are related?
* What prerequisites are required?
* What should I learn first?
* What is the learning path for a target role?

---

## Ã°Å¸â€˜Â©Ã¢â‚¬ÂÃ°Å¸â€™Â» Project

**SkillGraph Explorer**

Built as part of the WEXA AI assessment.

**Focus:** Graph-based career recommendations and personalized skill development.
