# AGENTS.md

Project-specific instructions for AI assistants working in the `linux-config` codebase.

> Base rules live in `AGENTS-BASE.md`.
> This file adds repo-local rules and does not loosen base safety constraints.

---

## 0) Prime Directive

- Do not break daily desktop workflows unless explicitly asked.
- Prefer small, safe, reversible changes.
- Default to minimal diffs and avoid drive-by refactors.

---

## 1) Repo Scope

- This repo is a chezmoi-managed Linux dotfiles/configuration repo.
- Do not treat this as a web app or Next.js project.
- If older instructions mention `portfolio-site`, resume pipelines, or `docs/TODO.md`, treat that as stale context.

---

## 2) Canonical References

Start with `README.md`, then inspect the exact files you touch.

Common source paths:
- `aliases/key_aliases.tmpl`
- `aliases/key_dirs.tmpl`
- `aliases/key_files.tmpl`
- `scripts/executable_sync-shortcuts`
- `dot_config/fish/config.fish.tmpl`
- `dot_config/fish/functions/*`
- `dot_config/chezmoi/chezmoi-template.toml.tmpl`

---

## 3) Chezmoi Conventions

- Preserve chezmoi naming patterns (`dot_*`, `private_*`, `.tmpl`, `executable_*`).
- Keep templating logic intact; do not collapse host conditionals into one machine's values.
- Validate target-path intent for template edits (what lands in `$HOME` after `chezmoi apply`).
- Avoid introducing host-specific absolute paths unless a nearby established pattern requires it.

---

## 4) Workflow

- Read before write; infer intent from nearby code and README conventions.
- Keep one change focused on one intent.
- Ask before removing seemingly unused aliases, functions, scripts, or template branches.
- Update docs in the same change when behavior/workflow changes.

---

## 5) Verification

Use the smallest relevant checks first.

For alias shortcut workflow changes:

```fish
./scripts/executable_sync-shortcuts
```

For mGBA template sync changes:

```fish
./dot_config/mgba/update-mgba-config.fish
```

If a check cannot run, state exactly what was skipped and why.

---

## 6) Shell Command Style

- Provide shell commands in Fish syntax by default.
- Use `fish` fenced blocks unless a different shell is explicitly requested.
- If Bash syntax is required, label it clearly.

---

## 7) Commit + Push Policy

- When an agent creates a commit, push that commit in the same task unless the user explicitly says not to push yet.
- Default push target is `origin` on the active branch (for `main`, use `git push origin main`).
- Keep commit subject lines at or under 80 characters.
- Put meaningful detail in the commit body for non-trivial changes.

---

## 8) PR Checklist

- Test steps included and runnable
- Conventional commit suggested
- No unnecessary churn

PR sections to include in output:
- Summary
- Why
- What changed
- Risks / edge cases
- How to test
- Rollback plan

---

## 9) Done Output Format For Agents

For coding tasks, return:

1. Atomic plan
2. Cursor prompt
3. Test plan (exact commands + manual checks)
4. Docs updates (when relevant)
5. Conventional commit suggestion
6. Additional validation notes (if any)
