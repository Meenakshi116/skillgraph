from db import driver


query = """
MATCH (s:Skill {name: "Python"})
      -[:RELATED_TO]-
      (related:Skill)
RETURN s.name AS skill,
       related.name AS related_skill
ORDER BY related_skill
"""


with driver.session() as session:
    results = session.run(query)

    for record in results:
        print(
            record["skill"],
            "->",
            record["related_skill"]
        )