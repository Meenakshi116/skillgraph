from pathlib import Path

from db import driver


PROJECT_ROOT = Path(__file__).resolve().parent.parent
CYPHER_DIR = PROJECT_ROOT / "cypher"


def run_cypher_file(file_name):
    file_path = CYPHER_DIR / file_name
    cypher = file_path.read_text(encoding="utf-8")

    statements = [
        statement.strip()
        for statement in cypher.split(";")
        if statement.strip()
    ]

    with driver.session() as session:
        for statement in statements:
            session.run(statement).consume()


if __name__ == "__main__":
    run_cypher_file("01_constraints.cypher")
    run_cypher_file("02_seed_data.cypher")
    print("Database initialized successfully.")