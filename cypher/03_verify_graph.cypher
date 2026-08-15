// 2+ hop traversal:
// Role -> Required Skill -> Prerequisite Skill

MATCH (role:Role {name: "AI/ML Engineer"})
      -[:REQUIRES]->
      (skill:Skill)
      -[:PREREQUISITE_OF]->
      (nextSkill:Skill)
RETURN role.name AS role,
       skill.name AS required_skill,
       nextSkill.name AS next_skill;