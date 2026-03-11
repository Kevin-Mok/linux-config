# ExecPlan: Canonicalize And Dedupe `dot_codex/AGENTS.md`

## Checklist

- [x] Extract the additive guidance and provenance details that must survive the rewrite.
- [x] Rewrite `dot_codex/AGENTS.md` into a single canonical, self-contained instruction document.
- [x] Update `AGENTS.repo.md` so it explicitly points to `dot_codex/AGENTS.md` as authoritative.
- [x] Verify the final headings, provenance, and preserved additive rules with exact searches.

## Assumptions

- `dot_codex/AGENTS.md` is the Codex source of truth for this repo.
- Root `AGENTS.md` remains in the repo, but overlapping Codex guidance should be merged into and governed by `dot_codex/AGENTS.md`.
- Provenance must be preserved compactly, not by keeping full per-source dumps.

## Review Notes

- `dot_codex/AGENTS.md` was rewritten from a 2636-line per-source dump into a 484-line canonical document with one copy of each major section.
- The rewrite preserved the repo-local bug-report addendum, source order, and a compact provenance appendix for all 10 source repos.
- The additive rules from `upwork`, `zoo-blog`, and the three `stb-mkt-all/*` sources were merged into the canonical sections with inline source tags.
- `AGENTS.repo.md` now explicitly states that `dot_codex/AGENTS.md` is authoritative when overlapping wording exists.
- Verification completed with:
  - `wc -l dot_codex/AGENTS.md AGENTS.repo.md plans/dedupe-dot-codex-agents.md`
  - `rg -n '^## Required Reading and Precedence$|^## 0\) Prime Directive$|^## 1\) Workflow Orchestration$|^## 2\) Task Management$|^## 6\) PR Checklist$' dot_codex/AGENTS.md`
  - `rg -n '^## Source:' dot_codex/AGENTS.md`
  - `rg -n 'split them into individual commits by concern|push the active remote/branch after each successful commit|Commit pushed to remote|nested \`AGENTS\.md\` files|schema drift|over roughly 1000 lines|log/' dot_codex/AGENTS.md AGENTS.repo.md`
  - `rg -n '^## Source Order$|^## Provenance$|upwork|zoo-blog|stb-mkt-all/prod-fix|stb-mkt-all/production|stb-mkt-all/history' dot_codex/AGENTS.md`
