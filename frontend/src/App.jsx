import { useEffect, useState } from "react";
import axios from "axios";
import {
  Network,
  Briefcase,
  Award,
  AlertCircle,
  Target,
  Link2,
  BookOpen,
} from "lucide-react";

 const API_BASE = "https://skillgraph-backend-fonz.onrender.com";

function App() {
  const [skills, setSkills] = useState([]);
  const [selectedSkill, setSelectedSkill] = useState("");
  const [recommendations, setRecommendations] = useState([]);

  const [relatedSkills, setRelatedSkills] = useState([]);
  const [relatedLoading, setRelatedLoading] = useState(false);
  const [relatedError, setRelatedError] = useState("");

  const [roles, setRoles] = useState([]);
  const [selectedRole, setSelectedRole] = useState("");
  const [skillGap, setSkillGap] = useState([]);

  const [learningPath, setLearningPath] = useState([]);
  const [learningLoading, setLearningLoading] = useState(false);
  const [learningError, setLearningError] = useState("");

  const [loading, setLoading] = useState(false);
  const [gapLoading, setGapLoading] = useState(false);
  const [error, setError] = useState("");
  const [gapError, setGapError] = useState("");

  useEffect(() => {
    loadSkills();
    loadRoles();
  }, []);

  async function loadSkills() {
    try {
      const response = await axios.get(`${API_BASE}/skills`);
      setSkills(response.data);

      if (response.data.length > 0) {
        selectSkill(response.data[0].name);
      }
    } catch (err) {
      setError("Could not connect to the SkillGraph backend.");
    }
  }

  async function loadRoles() {
    try {
      const response = await axios.get(`${API_BASE}/roles`);
      setRoles(response.data);
    } catch (err) {
      setGapError("Could not load roles.");
    }
  }

  async function selectSkill(skillName) {
    setSelectedSkill(skillName);
    setLoading(true);
    setError("");

    setRelatedLoading(true);
    setRelatedError("");
    setRelatedSkills([]);

    try {
      const response = await axios.get(
        `${API_BASE}/recommendations/${encodeURIComponent(skillName)}`
      );

      setRecommendations(response.data);
    } catch (err) {
      setRecommendations([]);
      setError("Could not load recommendations.");
    } finally {
      setLoading(false);
    }

    try {
      const response = await axios.get(
        `${API_BASE}/related-skills/${encodeURIComponent(skillName)}`
      );

      setRelatedSkills(response.data.related_skills || []);
    } catch (err) {
      setRelatedSkills([]);
      setRelatedError("Could not load related skills.");
    } finally {
      setRelatedLoading(false);
    }
  }

  async function selectRole(roleName) {
    setSelectedRole(roleName);
    setGapError("");
    setSkillGap([]);
    setLearningError("");
    setLearningPath([]);

    if (!roleName) {
      return;
    }

    setGapLoading(true);
    setLearningLoading(true);

    try {
      const response = await axios.get(
        `${API_BASE}/skill-gap/${encodeURIComponent(roleName)}`
      );

      setSkillGap(response.data);
    } catch (err) {
      setSkillGap([]);
      setGapError("Could not load skill-gap information.");
    } finally {
      setGapLoading(false);
    }

    try {
      const response = await axios.get(
        `${API_BASE}/learning-path/${encodeURIComponent(roleName)}`
      );

      setLearningPath(response.data);
    } catch (err) {
      setLearningPath([]);
      setLearningError("Could not load learning path.");
    } finally {
      setLearningLoading(false);
    }
  }

  function getLearningLevel(item) {
    const skill = item.skill.toLowerCase();

    if (skill === "deep learning") {
      return "Advanced";
    }

    if (skill === "machine learning") {
      return "Core";
    }

    if (!item.prerequisites || item.prerequisites.length === 0) {
      return "Foundation";
    }

    return "Core";
  }

  return (
    <div className="app">
      <header className="header">
        <Network size={36} className="heading-icon" />

        <div>
          <h1>SkillGraph Explorer</h1>
          <p>Graph-powered career recommendations</p>
        </div>
      </header>

      {error && (
        <div className="error">
          <AlertCircle size={20} />
          {error}
        </div>
      )}

      <main className="layout">
        <aside className="sidebar">
          <h2 className="section-heading">
            <Award size={20} />
            Select a Skill
          </h2>

          <div className="skill-list">
            {skills.map((skill) => (
              <button
                key={skill.name}
                className={
                  selectedSkill === skill.name
                    ? "skill-button active"
                    : "skill-button"
                }
                onClick={() => selectSkill(skill.name)}
              >
                {skill.name}
                <small>{skill.category}</small>
              </button>
            ))}
          </div>
        </aside>

        <section className="content">
          <h2 className="section-heading main-heading">
            <Briefcase size={24} />
            Career Opportunities
          </h2>

          {selectedSkill && (
            <p className="selected">
              Recommendations for <strong>{selectedSkill}</strong>
            </p>
          )}

          {loading && (
            <div className="message">
              Loading recommendations from CognoDB...
            </div>
          )}

          {!loading && recommendations.length === 0 && !error && (
            <div className="message">No recommendations found.</div>
          )}

          <div className="cards">
            {recommendations.map((recommendation) => (
              <div className="card" key={recommendation.role}>
                <h3>{recommendation.role}</h3>

                <p>Companies hiring:</p>

                <div className="companies">
                  {recommendation.companies.map((company) => (
                    <span key={company}>{company}</span>
                  ))}
                </div>
              </div>
            ))}
          </div>

          <section className="related-section">
            <h2 className="section-heading main-heading">
              <Link2 size={24} />
              Related Skills
            </h2>

            <p className="gap-description">
              Explore skills connected to <strong>{selectedSkill}</strong>.
            </p>

            {relatedLoading && (
              <div className="message">
                Loading related skills from CognoDB...
              </div>
            )}

            {relatedError && (
              <div className="error">
                <AlertCircle size={20} />
                {relatedError}
              </div>
            )}

            {!relatedLoading &&
              !relatedError &&
              relatedSkills.length === 0 && (
                <div className="message">
                  No related skills found for this skill.
                </div>
              )}

            {!relatedLoading && relatedSkills.length > 0 && (
              <div className="related-skills">
                {relatedSkills.map((skill) => (
                  <button
                    key={skill}
                    className="related-skill-button"
                    onClick={() => selectSkill(skill)}
                  >
                    <Link2 size={16} />
                    {skill}
                  </button>
                ))}
              </div>
            )}
          </section>

          <section className="skill-gap-section">
            <h2 className="section-heading main-heading">
              <Target size={24} />
              Skill Gap Analysis
            </h2>

            <p className="gap-description">
              Select a role to see its required skills and prerequisites.
            </p>

            <div className="role-selector">
              
              <select
                id="role-select"
                value={selectedRole}
                onChange={(e) => selectRole(e.target.value)}
              >
                <option value="">Choose a role</option>

                {roles.map((role) => (
                  <option key={role.name} value={role.name}>
                    {role.name}
                  </option>
                ))}
              </select>
            </div>

            {gapLoading && (
              <div className="message">
                Loading skill-gap information from CognoDB...
              </div>
            )}

            {gapError && (
              <div className="error">
                <AlertCircle size={20} />
                {gapError}
              </div>
            )}

            {!gapLoading && selectedRole && skillGap.length > 0 && (
              <div className="gap-cards">
                {skillGap.map((item, index) => (
                  <div
                    className="gap-card"
                    key={`${item.required_skill}-${index}`}
                  >
                    <h3>{item.required_skill}</h3>

                    <p>
                      <strong>Prerequisites:</strong>{" "}
                      {item.prerequisites.length > 0
                        ? item.prerequisites.join(", ")
                        : "None"}
                    </p>
                  </div>
                ))}
              </div>
            )}
          </section>

          <section className="learning-section">
            <h2 className="section-heading main-heading">
              <BookOpen size={24} />
              Learning Path
            </h2>

            <p className="gap-description">
              Follow these skills in order to prepare for the selected role.
            </p>

            {learningLoading && (
              <div className="message">
                Loading learning path from CognoDB...
              </div>
            )}

            {learningError && (
              <div className="error">
                <AlertCircle size={20} />
                {learningError}
              </div>
            )}

            {!learningLoading &&
              !learningError &&
              selectedRole &&
              learningPath.length > 0 && (
                <div className="learning-path">
                  {learningPath.map((item, index) => {
                    const level = getLearningLevel(item);

                    return (
                      <div
                        className="learning-step"
                        key={`${item.skill}-${index}`}
                      >
                        <div className="step-number">{index + 1}</div>

                        <div className="step-content">
                          <div className="step-top">
                            <span className={`level-badge ${level.toLowerCase()}`}>
                              {level}
                            </span>
                          </div>

                          <h3>{item.skill}</h3>

                          <p>
                            <strong>Prerequisites:</strong>{" "}
                            {item.prerequisites.length > 0
                              ? item.prerequisites.join(", ")
                              : "None"}
                          </p>
                        </div>
                      </div>
                    );
                  })}
                </div>
              )}
          </section>
        </section>
      </main>
    </div>
  );
}

export default App;