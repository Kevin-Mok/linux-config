# AGENTS-BASE.md

Reusable baseline instructions for AI assistants. Copy this file to any repo and layer project-specific rules in `AGENTS.md`.

---

## 0) Prime Directive

- Do not break production behavior unless explicitly asked.
- Prefer small, safe, reversible changes.
- Keep diffs minimal and avoid unrelated refactors.
- Do not delete or rewrite unclear code without asking.

---

## 1) Workflow

- Read relevant files before editing.
- Confirm assumptions from existing code and docs before implementation.
- If requirements conflict or are unclear, surface the conflict explicitly.
- For non-trivial tasks, create a short plan and verify each step.

---

## 2) Implementation Principles

- Follow existing project patterns before introducing new structure.
- Prefer explicit, readable code over clever abstractions.
- Keep one change focused on one intent.
- Ask before removing seemingly unused code, scripts, or configuration.

---

## 3) Verification

- Validate changes with the smallest relevant checks first.
- Run broader checks when risk justifies it.
- Report exactly what was validated and what was not.
- If checks cannot run, state why and what remains unverified.

---

## 4) Documentation

- If behavior changes, update docs in the same change.
- Keep run/setup/test notes accurate for the modified workflow.
- Call out non-obvious risks, caveats, and rollback steps for risky changes.

---

## 5) Commit Discipline

- Keep commits focused and logically atomic.
- Use Conventional Commits when creating commit messages.
- Keep commit subjects concise and use the body for meaningful detail.

---

## 6) Communication

- Be direct about risks, blockers, and tradeoffs.
- Use concrete file references when explaining changes.
- Do not guess silently; raise open questions early.
