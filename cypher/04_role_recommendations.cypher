// Find roles and companies connected to a given skill

MATCH (s:Skill {name: "Python"})
      <-[:REQUIRES]-
      (r:Role)
      <-[:HIRES_FOR]-
      (c:Company)
RETURN s.name AS skill,
       r.name AS role,
       c.name AS company
ORDER BY role, company;