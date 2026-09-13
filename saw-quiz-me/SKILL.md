---
name: saw-quiz-me
description: Documents recent session changes and generates a self-contained, interactive HTML documentation & recall quiz under .docs/recall/ for knowledge retention.
---

# Knowledge Retention & Recall Quiz Skill (`saw-quiz-me`)

## Goal
To synthesize recent session activities (features, refactorings, bug fixes, architecture decisions) into a standalone, interactive HTML document inside `.docs/recall/` featuring technical documentation and a 5 to 10 question self-assessment quiz with immediate feedback.

---

## Workflow Steps

**Agent Instructions**: Execute the following steps sequentially in the user's current project workspace.

### 1. Analyze Recent Changes
- Review recent session context, `git status`, `git diff`, and modified files.
- Identify:
  - New features, API endpoints, refactorings, or database updates.
  - Core architectural decisions and trade-offs made.
  - Critical edge cases, algorithms, and bug fixes addressed.

### 2. Ensure Directory Structure & Gitignore
- Check if `.docs/` directory exists in the workspace root. If missing, create `.docs/`.
- Check if `.docs/recall/` exists inside `.docs/`. If missing, create `.docs/recall/`.
- Ensure `.docs/` is listed in the workspace `.gitignore` to prevent committing local self-assessment files.

### 3. Generate Interactive HTML Documentation & Quiz
Create a single, standalone HTML file inside `.docs/recall/` named:
`recall_<topic>_<timestamp>.html` (or `recall_<timestamp>.html`).

#### Document Requirements:
1. **Self-Contained & Offline**: All styles (CSS) and logic (JavaScript) must be embedded inline. Do NOT use external CDNs or remote dependencies.
2. **Strictly No Emojis**: Do not use emojis anywhere in the HTML, headings, buttons, questions, or explanations.
3. **Design System (Crisp Light Mode)**:
   - Body Background: `#f8fafc`
   - Card Background: `#ffffff`
   - Borders: `#e2e8f0`
   - Primary Text: `#0f172a`
   - Muted Text: `#475569`
   - Accent Primary: `#0284c7`
   - Accent Hover: `#0369a1`
   - Success: `#16a34a` (background `#f0fdf4`, border `#bbf7d0`)
   - Error: `#dc2626` (background `#fef2f2`, border `#fecaca`)
   - Font Family: `system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif`
4. **Header & Navigation**:
   - Application title, session topic, generation timestamp.
   - Tab toggles to switch between "Documentation" and "Recall Quiz" views.
5. **Documentation Section**:
   - Summary of accomplishments during the session.
   - List of modified files, components, and data structures.
   - Code snippets and technical implementation details.
6. **Recall Quiz Section (5 to 10 Questions)**:
   - Formulate 5 to 10 multiple-choice questions testing technical comprehension of the session's work.
   - Prepend choices with uppercase letters: `A.`, `B.`, `C.`, `D.`.
   - **Even Choice Distribution**: Ensure the correct answer positions are evenly distributed across A, B, C, and D.
   - **Immediate Per-Question Feedback**: When a user clicks an option:
     - Instantly mark the clicked option as correct or incorrect.
     - Highlight the correct option in green.
     - Reveal a dedicated explanation box immediately below that question explaining why the answer is correct.
     - Disable further option clicking for that question.
     - Update a live score indicator (e.g., "Score: 4 / 5").

---

### 4. Finalization & Report
- Output a concise Caveman confirmation report to the user.
- Provide a clickable markdown link to the generated HTML file:
  `[recall_filename.html](file:///path/to/.docs/recall/recall_filename.html)`
- Provide quick instructions on opening the file in a web browser.
