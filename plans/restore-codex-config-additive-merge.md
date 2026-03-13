# ExecPlan: Restore Codex Config Additively

## Checklist

- [x] Compare the committed and current `dot_codex/config.toml` content.
- [x] Restore deleted committed config content without removing current additions.
- [x] Record the user correction pattern in `tasks/lessons.md`.
- [x] Verify the final diff is additive-only and non-duplicative.

## Assumptions

- The current edited `dot_codex/config.toml` is the source of truth for new additions.
- The only committed content that must be restored is the deleted `developer_instructions` block.
- "Don't dupe content" means re-adding only missing committed content and not duplicating any current entries.

## Review Notes

- Restored the committed `developer_instructions` block in `dot_codex/config.toml` so the config no longer removes tracked content.
- Verified the remaining config diff is additive-only: two new trusted project entries and the expanded `status_line`.
- Confirmed the final config parses successfully with `tomllib`.
