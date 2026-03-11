# ExecPlan: Combine Latest Agent Guidance into `dot_codex/AGENTS.md`

## Checklist

- [x] Identify the latest 10 `/home/kevin/coding` directories with `AGENTS.md` or `agent.md`.
- [x] Review source instruction files and any explicitly referenced `AGENTS-BASE.md` files.
- [x] Define deterministic filtering rules that keep repo-agnostic guidance and exclude project-specific material.
- [x] Generate `dot_codex/AGENTS.md` from the filtered source fragments.
- [x] Verify the generated file contents and record the results.

## Assumptions

- “Latest 10” is determined by the mtime of each matching `AGENTS.md` or `agent.md` under `/home/kevin/coding`.
- Only the generated file in this repo should change; source repos stay untouched.
- If `AGENTS.md` explicitly points at `AGENTS-BASE.md`, include the base file in the generated output.
- Project-specific rules should be excluded from the generated result, not removed from source files.

## Review Notes

- The source set is: `upwork`, `zoo-blog`, `Kevin-Mok`, `spotify-library-intelligence-dashboard`, `portfolio-site`, `quit-weed`, `nomar-stocks`, `stb-mkt-all/prod-fix`, `stb-mkt-all/production`, and `stb-mkt-all/history`.
- `quit-weed` contributes `AGENTS-BASE.md` because its `AGENTS.md` explicitly points to that base file.
- `AGENTS.repo.md`, `CLAUDE.md`, and override files were intentionally excluded from the generated output.
- Verification completed with:
  - `git status --short`
  - `rg -n "^## Source:|^### Source File:|Prime Directive|PR Checklist|What "Done" Looks Like" dot_codex/AGENTS.md`
  - `rg -n "Rare NFT Sniper|expo start|Red-DiscordBot|docs/TODO.md|NTC Launch TODO|LaunchPass|NEXT_PUBLIC_|brainrot|interaction\.response|guild/channel IDs|Listing IDs|Discord interaction glue" dot_codex/AGENTS.md`
- The positive grep confirmed all 10 source sections plus expected general guidance headings.
- The negative grep returned no matches for the screened project-specific strings.
