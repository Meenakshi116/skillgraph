// Find required skills and their prerequisites for a role

MATCH (r:Role {name: "AI/ML Engineer"})
      -[:REQUIRES]->
      (skill:Skill)
OPTIONAL MATCH (skill)-[:PREREQUISITE_OF]->(prerequisite:Skill)
RETURN r.name AS role,
       skill.name AS required_skill,
       prerequisite.name AS prerequisite_skill
ORDER BY required_skill, prerequisite_skill;