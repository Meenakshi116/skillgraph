// ============================================================
// SkillGraph - Seed Data
// ============================================================

// ------------------------------------------------------------
// Roles
// ------------------------------------------------------------

MERGE (r:Role {
    name: "Software Engineer",
    category: "Software Development",
    description: "Builds and maintains software applications."
});

MERGE (r:Role {
    name: "Frontend Developer",
    category: "Software Development",
    description: "Builds web user interfaces."
});

MERGE (r:Role {
    name: "Backend Developer",
    category: "Software Development",
    description: "Builds APIs and server-side applications."
});

MERGE (r:Role {
    name: "Data Analyst",
    category: "Data",
    description: "Analyzes data to support business decisions."
});

MERGE (r:Role {
    name: "AI/ML Engineer",
    category: "Artificial Intelligence",
    description: "Builds and deploys machine learning solutions."
});


// ------------------------------------------------------------
// Skills
// ------------------------------------------------------------

MERGE (s:Skill {
    name: "Python",
    category: "Programming",
    difficulty: "Beginner"
});

MERGE (s:Skill {
    name: "JavaScript",
    category: "Programming",
    difficulty: "Beginner"
});

MERGE (s:Skill {
    name: "React",
    category: "Frontend",
    difficulty: "Intermediate"
});

MERGE (s:Skill {
    name: "SQL",
    category: "Database",
    difficulty: "Beginner"
});

MERGE (s:Skill {
    name: "Git",
    category: "Developer Tools",
    difficulty: "Beginner"
});

MERGE (s:Skill {
    name: "Statistics",
    category: "Mathematics",
    difficulty: "Intermediate"
});

MERGE (s:Skill {
    name: "Pandas",
    category: "Data Science",
    difficulty: "Intermediate"
});

MERGE (s:Skill {
    name: "Machine Learning",
    category: "Artificial Intelligence",
    difficulty: "Advanced"
});

MERGE (s:Skill {
    name: "Deep Learning",
    category: "Artificial Intelligence",
    difficulty: "Advanced"
});

MERGE (s:Skill {
    name: "REST APIs",
    category: "Backend",
    difficulty: "Intermediate"
});


// ------------------------------------------------------------
// Companies
// ------------------------------------------------------------

MERGE (c:Company {
    name: "TechNova",
    industry: "Technology"
});

MERGE (c:Company {
    name: "DataSphere",
    industry: "Data & Analytics"
});

MERGE (c:Company {
    name: "CloudWorks",
    industry: "Cloud Software"
});


// ------------------------------------------------------------
// Role -> Skill
// ------------------------------------------------------------

MATCH (r:Role {name: "Software Engineer"})
MATCH (s:Skill {name: "Python"})
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:Role {name: "Software Engineer"})
MATCH (s:Skill {name: "SQL"})
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:Role {name: "Software Engineer"})
MATCH (s:Skill {name: "Git"})
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:Role {name: "Software Engineer"})
MATCH (s:Skill {name: "REST APIs"})
MERGE (r)-[:REQUIRES]->(s);


MATCH (r:Role {name: "Frontend Developer"})
MATCH (s:Skill {name: "JavaScript"})
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:Role {name: "Frontend Developer"})
MATCH (s:Skill {name: "React"})
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:Role {name: "Frontend Developer"})
MATCH (s:Skill {name: "Git"})
MERGE (r)-[:REQUIRES]->(s);


MATCH (r:Role {name: "Backend Developer"})
MATCH (s:Skill {name: "Python"})
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:Role {name: "Backend Developer"})
MATCH (s:Skill {name: "SQL"})
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:Role {name: "Backend Developer"})
MATCH (s:Skill {name: "REST APIs"})
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:Role {name: "Backend Developer"})
MATCH (s:Skill {name: "Git"})
MERGE (r)-[:REQUIRES]->(s);


MATCH (r:Role {name: "Data Analyst"})
MATCH (s:Skill {name: "Python"})
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:Role {name: "Data Analyst"})
MATCH (s:Skill {name: "SQL"})
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:Role {name: "Data Analyst"})
MATCH (s:Skill {name: "Pandas"})
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:Role {name: "Data Analyst"})
MATCH (s:Skill {name: "Statistics"})
MERGE (r)-[:REQUIRES]->(s);


MATCH (r:Role {name: "AI/ML Engineer"})
MATCH (s:Skill {name: "Python"})
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:Role {name: "AI/ML Engineer"})
MATCH (s:Skill {name: "Statistics"})
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:Role {name: "AI/ML Engineer"})
MATCH (s:Skill {name: "Pandas"})
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:Role {name: "AI/ML Engineer"})
MATCH (s:Skill {name: "Machine Learning"})
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:Role {name: "AI/ML Engineer"})
MATCH (s:Skill {name: "Deep Learning"})
MERGE (r)-[:REQUIRES]->(s);


// ------------------------------------------------------------
// Skill prerequisites
// ------------------------------------------------------------

MATCH (a:Skill {name: "Python"})
MATCH (b:Skill {name: "Pandas"})
MERGE (a)-[:PREREQUISITE_OF]->(b);

MATCH (a:Skill {name: "Python"})
MATCH (b:Skill {name: "Machine Learning"})
MERGE (a)-[:PREREQUISITE_OF]->(b);

MATCH (a:Skill {name: "Statistics"})
MATCH (b:Skill {name: "Machine Learning"})
MERGE (a)-[:PREREQUISITE_OF]->(b);

MATCH (a:Skill {name: "Machine Learning"})
MATCH (b:Skill {name: "Deep Learning"})
MERGE (a)-[:PREREQUISITE_OF]->(b);

MATCH (a:Skill {name: "JavaScript"})
MATCH (b:Skill {name: "React"})
MERGE (a)-[:PREREQUISITE_OF]->(b);

MATCH (a:Skill {name: "Python"})
MATCH (b:Skill {name: "REST APIs"})
MERGE (a)-[:PREREQUISITE_OF]->(b);


// ------------------------------------------------------------
// Related skills
// ------------------------------------------------------------

MATCH (a:Skill {name: "SQL"})
MATCH (b:Skill {name: "Pandas"})
MERGE (a)-[:RELATED_TO]->(b);

MATCH (a:Skill {name: "Python"})
MATCH (b:Skill {name: "SQL"})
MERGE (a)-[:RELATED_TO]->(b);

MATCH (a:Skill {name: "JavaScript"})
MATCH (b:Skill {name: "React"})
MERGE (a)-[:RELATED_TO]->(b);

MATCH (a:Skill {name: "Machine Learning"})
MATCH (b:Skill {name: "Deep Learning"})
MERGE (a)-[:RELATED_TO]->(b);


// ------------------------------------------------------------
// Company -> Role
// ------------------------------------------------------------

MATCH (c:Company {name: "TechNova"})
MATCH (r:Role {name: "Software Engineer"})
MERGE (c)-[:HIRES_FOR]->(r);

MATCH (c:Company {name: "TechNova"})
MATCH (r:Role {name: "Frontend Developer"})
MERGE (c)-[:HIRES_FOR]->(r);

MATCH (c:Company {name: "TechNova"})
MATCH (r:Role {name: "Backend Developer"})
MERGE (c)-[:HIRES_FOR]->(r);

MATCH (c:Company {name: "DataSphere"})
MATCH (r:Role {name: "Data Analyst"})
MERGE (c)-[:HIRES_FOR]->(r);

MATCH (c:Company {name: "DataSphere"})
MATCH (r:Role {name: "AI/ML Engineer"})
MERGE (c)-[:HIRES_FOR]->(r);

MATCH (c:Company {name: "CloudWorks"})
MATCH (r:Role {name: "Backend Developer"})
MERGE (c)-[:HIRES_FOR]->(r);

MATCH (c:Company {name: "CloudWorks"})
MATCH (r:Role {name: "AI/ML Engineer"})
MERGE (c)-[:HIRES_FOR]->(r);