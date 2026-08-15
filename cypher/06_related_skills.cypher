// Find skills related to a given skill

MATCH (s:Skill {name: "Python"})
      -[:RELATED_TO]-
      (related:Skill)
RETURN s.name AS skill,
       related.name AS related_skill
ORDER BY related_skill;