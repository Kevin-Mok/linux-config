# ExecPlan: Commit Plan Docs With Related Work

## Checklist

- [x] Confirm which Codex config surface supports a persistent instruction for this behavior.
- [x] Add a persistent Codex instruction to keep `plans/*.md` changes with the related work.
- [x] Verify the config change and record the resulting behavior.

## Assumptions

- The requested behavior should apply through the tracked `~/.codex/config.toml` managed by this repo.
- "Always commit plans docs with work of the plan" means plan document changes belong in the same related commit(s), not a later cleanup commit.
- The correct supported config key is `developer_instructions`, not `instructions` or `model_instructions_file`.

## Review Notes

- Official Codex config docs were checked to avoid using an unsupported key.
- `dot_codex/config.toml` now sets `developer_instructions` so Codex receives a persistent instruction to commit `plans/` document changes with the related implementation or documentation work.
- Verification completed with:
  - `python3 -c 'import pathlib, tomllib; tomllib.loads(pathlib.Path("dot_codex/config.toml").read_text()); print("TOML OK")'`
  - `sed -n '1,40p' dot_codex/config.toml`
  - `sed -n '1,200p' plans/commit-plan-docs-with-related-work.md`
