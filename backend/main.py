from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from db import driver

app = FastAPI(title="SkillGraph API")

app.add_middleware(
    CORSMiddleware,
       allow_origins=[

    "http://localhost:5173",
"http://127.0.0.1:5173",
"https://skillgraph-frontend-u32z.onrender.com"

],

    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def root():
    return {"message": "SkillGraph API is running"}


@app.get("/health")
def health():
    try:
        driver.verify_connectivity()

        return {
            "status": "healthy",
            "database": "connected"
        }

    except Exception as e:
        return {
            "status": "unhealthy",
            "database": "disconnected",
            "error": str(e)
        }


@app.get("/roles")
def get_roles():
    query = """
    MATCH (r:Role)
    RETURN r.name AS name,
           r.category AS category,
           r.description AS description
    ORDER BY r.name
    """

    with driver.session() as session:
        result = session.run(query)
        return [record.data() for record in result]


@app.get("/skills")
def get_skills():
    query = """
    MATCH (s:Skill)
    RETURN s.name AS name,
           s.category AS category,
           s.difficulty AS difficulty
    ORDER BY s.name
    """

    with driver.session() as session:
        result = session.run(query)
        return [record.data() for record in result]


@app.get("/recommendations/{skill_name:path}")
def get_recommendations(skill_name: str):
    query = """
    MATCH (s:Skill)
    WHERE toLower(s.name) = toLower($skill_name)

    OPTIONAL MATCH (r:Role)-[:REQUIRES]->(s)
    OPTIONAL MATCH (c:Company)-[:HIRES_FOR]->(r)

    RETURN s.name AS skill,
           r.name AS role,
           collect(DISTINCT c.name) AS companies
    ORDER BY r.name
    """

    with driver.session() as session:
        result = list(
            session.run(
                query,
                skill_name=skill_name
            )
        )

    if not result or all(record["role"] is None for record in result):
        raise HTTPException(
            status_code=404,
            detail=f"Skill '{skill_name}' not found"
        )

    return [
        record.data()
        for record in result
        if record["role"] is not None
    ]


@app.get("/skill-gap/{role_name:path}")
def get_skill_gap(role_name: str):
    query = """
    MATCH (r:Role)-[:REQUIRES]->(s:Skill)
    WHERE toLower(r.name) = toLower($role_name)

   OPTIONAL MATCH (p:Skill)-[:PREREQUISITE_OF]->(s)

    RETURN r.name AS role,
           s.name AS required_skill,
           collect(DISTINCT p.name) AS prerequisites
    ORDER BY s.name
    """

    with driver.session() as session:
        result = list(
            session.run(
                query,
                role_name=role_name
            )
        )

    if not result:
        raise HTTPException(
            status_code=404,
            detail=f"Role '{role_name}' not found"
        )

    return [record.data() for record in result]


@app.get("/learning-path/{role_name:path}")
def get_learning_path(role_name: str):

    query = """
    MATCH (r:Role)
    WHERE toLower(r.name) = toLower($role_name)

    MATCH (r)-[:REQUIRES]->(s:Skill)

    OPTIONAL MATCH (p:Skill)-[:PREREQUISITE_OF]->(s)

    RETURN r.name AS role,
           s.name AS skill,
           collect(DISTINCT p.name) AS prerequisites
    """

    with driver.session() as session:
        result = list(
            session.run(
                query,
                role_name=role_name
            )
        )

    if not result:
        raise HTTPException(
            status_code=404,
            detail=f"Learning path for role '{role_name}' not found"
        )

    skills = []

    for record in result:
        skills.append({
            "role": record["role"],
            "skill": record["skill"],
            "prerequisites": record["prerequisites"]
        })

    skill_map = {
        item["skill"]: item
        for item in skills
    }

    ordered = []
    added = set()

    def add_skill(skill_name):
        if skill_name in added:
            return

        if skill_name not in skill_map:
            return

        item = skill_map[skill_name]

        for prerequisite in item["prerequisites"]:
            add_skill(prerequisite)

        if skill_name not in added:
            ordered.append(item)
            added.add(skill_name)

    for item in skills:
        add_skill(item["skill"])

    return ordered


@app.get("/related-skills/{skill_name:path}")
def get_related_skills(skill_name: str):

    query = """
    MATCH (s:Skill)
    WHERE toLower(s.name) = toLower($skill_name)

    OPTIONAL MATCH (s)-[:RELATED_TO]-(related:Skill)

    RETURN s.name AS skill,
           collect(DISTINCT related.name) AS related_skills
    """

    with driver.session() as session:
        result = session.run(
            query,
            skill_name=skill_name
        ).single()

    if not result:
        raise HTTPException(
            status_code=404,
            detail=f"Skill '{skill_name}' not found"
        )

    return {
        "skill": result["skill"],
        "related_skills": [
            skill
            for skill in result["related_skills"]
            if skill is not None
        ]
    }
