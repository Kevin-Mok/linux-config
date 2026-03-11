# AGENTS.md

Combined repo-agnostic agent guidance generated from the 10 latest `/home/kevin/coding` directories that contain `AGENTS.md` or `agent.md`.

Project-specific rules, commands, paths, and feature guidance were excluded from the generated output. Retained text is copied verbatim from the selected source fragments.

## Source Order

1. `upwork`
2. `zoo-blog`
3. `Kevin-Mok`
4. `spotify-library-intelligence-dashboard`
5. `portfolio-site`
6. `quit-weed`
7. `nomar-stocks`
8. `stb-mkt-all/prod-fix`
9. `stb-mkt-all/production`
10. `stb-mkt-all/history`

---

## Source: `upwork`

### Source File: `/home/kevin/coding/upwork/AGENTS.md`

_Selection note: Excluded the user-specific workflow preferences subsection._

# AGENTS.md

Reusable instructions for AI assistants.

Use this as the shared cross-repository baseline, then add repository-specific constraints in `AGENTS.repo.md`.

---

## Required Reading and Precedence

Apply instruction layers in this order:

1. `AGENTS.md` (this file, shared baseline)
2. `AGENTS.repo.md` (repository-specific strict additions)
3. `AGENTS.override.local.md` (optional local strict additions; untracked)

Precedence rules:

- Lower layers may only add stricter constraints or local specialization.
- Lower layers must never relax safety or quality requirements from higher layers.
- Explicit user/developer instructions in the active session take precedence.

For non-trivial tasks (3+ steps, multi-file changes, or architecture decisions):

- Use Plan Mode when available.
- Create and maintain an ExecPlan per `.agent/PLANS.md` (or `PLANS.md` where that is canonical).
- Store ExecPlans at `plans/<task-slug>.md` unless instructed otherwise.

---

## 0) Prime Directive

- **Do not break production behavior** unless explicitly asked.
- Prefer **small, safe, reversible** changes.
- Default to minimal diffs — avoid "drive-by refactors" in feature commits.
- **Surgical precision** — touch only what is needed. Don't remove comments you don't understand, don't clean up orthogonal code, don't delete things that seem unused without asking.

---

## 1) Workflow Orchestration

### 1.1 Plan Mode Default

- Enter plan mode for ANY non-trivial task (3+ steps or architectural decisions).
- If something goes sideways, STOP and re-plan immediately — don't keep pushing.
- Use plan mode for verification steps, not just building.
- Write detailed specs upfront to reduce ambiguity.

### 1.2 Subagent Strategy

- Use subagents liberally to keep main context window clean.
- Offload research, exploration, and parallel analysis to subagents.
- For complex problems, throw more compute at it via subagents.
- One task per subagent for focused execution.

### 1.3 Self-Improvement Loop

- After ANY correction from the user: update `tasks/lessons.md` with the pattern.
- Write rules for yourself that prevent the same mistake.
- Ruthlessly iterate on these lessons until mistake rate drops.
- Review lessons at session start for relevant project.

### 1.4 Verification Before Done

- Never mark a task complete without proving it works.
- Diff behavior between main and your changes when relevant.
- Ask yourself: "Would a staff engineer approve this?"
- Run tests, check logs, and demonstrate correctness.

### 1.5 Demand Elegance (Balanced)

- For non-trivial changes: pause and ask "is there a more elegant way?"
- If a fix feels hacky: "Knowing everything I know now, implement the elegant solution."
- Skip this for simple, obvious fixes — don't over-engineer.
- Challenge your own work before presenting it.

### 1.6 Autonomous Bug Fixing

- When given a bug report: just fix it. Don't ask for hand-holding.
- Point at logs, errors, failing tests — then resolve them.
- Zero context switching required from the user.
- Go fix failing CI tests without being told how.

---

## 2) Task Management

1. **Plan First**: Write a plan with checkable items in the active ExecPlan (`plans/<task-slug>.md`) or inline for small tasks.
2. **Verify Plan**: Check in before starting implementation.
3. **Track Progress**: Mark items complete as you go.
4. **Explain Changes**: High-level summary at each step.
5. **Document Results**: Add a review section to the active ExecPlan or final task summary.
6. **Capture Lessons**: If the project uses `tasks/lessons.md`, update it after corrections.

> **Note:** These are guidelines — adapt to project structure and active repository conventions.

---

## 3) Problem-Solving Approach

For non-trivial tasks, use recursive decomposition.

### 3.1 Assumption Surfacing

Before implementation, explicitly state assumptions:

```text
My assumptions:
1. [Assumption about requirements]
2. [Assumption about existing behavior]
3. [Assumption about scope]

Proceeding with implementation. Let me know if any assumptions are wrong.
```

### 3.2 Confusion Management

When encountering inconsistencies or unclear requirements:

1. **STOP** — don't push through confusion.
2. **Name it** — "I'm confused because X says Y but Z suggests W."
3. **Wait** — ask for clarification before proceeding.
4. **Never assume** — guessing leads to wasted work and bugs.

### 3.3 Push Back When Warranted

You are not a yes-machine. When you see problems:

- Point out issues directly: "This approach has a problem: [specific issue]."
- Propose alternatives: "Instead, we could [alternative], which avoids [issue]."
- Accept override: if the user insists, proceed with their choice.
- Don't be sycophantic — "Of course!" to bad ideas helps no one.

### Process (Recursive Decomposition)

1. **Decompose** — break the problem into independent subcomponents. Identify top-level structure first.
2. **Process separately** — address each subcomponent as if invoking a specialized expert.
3. **Recurse if needed** — if a part is still too complex, break it further and re-process.
4. **Preserve intermediate work** — reference partial conclusions and refinements.
5. **Integrate** — synthesize all parts into a unified solution. Avoid unsubstantiated leaps.

### Strict Rules

- Do NOT attempt single-pass answers for complex tasks.
- Pause and refine ambiguous/incomplete parts before advancing.
- Prioritize structure and verification over speed.
- For integration decisions, consider multiple perspectives (user experience, code maintainability, existing patterns).

### Core Principles

- **Simplicity First**: make every change as simple as possible. Impact minimal code.
- **No Laziness**: find root causes. No temporary fixes. Senior developer standards.
- **Minimal Impact**: changes should only touch what's necessary. Avoid introducing bugs.

### Atomic Reasoning Structure

For tasks requiring precise, verifiable outputs, use atomic decomposition:

```text
<atomic_context>
[Role/persona + background knowledge + persistent rules]
</atomic_context>

<atomic_task>
[Single, clear objective. One focused goal only.]
</atomic_task>

<atomic_constraints>
- [Hard limits, formats, verification rules]
- [e.g., No hallucinations; max length X; must match existing patterns]
</atomic_constraints>

<atomic_variables>
{{variable1}}: [description or value]
{{variable2}}: [etc.]
</atomic_variables>

<atomic_process>
1. Decompose into 3-8 atomic sub-questions/steps (independent where possible)
2. Solve each atom individually with high accuracy
3. Verify each atom's output against constraints
4. Integrate into unified solution (resolve dependencies, synthesize)
5. Recurse on any unresolved atom if needed
</atomic_process>
```

Output format:

- Atomic decomposition list (brief bullets)
- Solved atoms (numbered)
- Final synthesized solution

---

## 4) Workflow Principles

### 4.1 Read Before You Write

- Read relevant files before modifying (use Read tool, not assumptions).
- Check project roadmap, active plans, and relevant docs for current priorities.
- Infer patterns from existing code before introducing new ones.

### 4.2 Make Changes in Small Commits

- Keep commits focused (one feature, one intent).
- Use [Conventional Commits](https://www.conventionalcommits.org/) format.
- Prefer a follow-up refactor commit after behavior is stable.
- When asked to commit changes, push the default remote after creating the commit unless the user explicitly says not to push or names a different remote or branch.

### 4.3 Update Docs with Changes

- Documentation updates are **required** after feature implementation.
- If behavior changes, docs must change in the same PR.

### 4.4 Test-First Leverage

- Write the test that defines success first.
- Implement until the test passes.
- The test is your specification — if you can't write it, requirements are unclear.

### 4.5 Naive Then Optimize

- Get a correct, naive version working first.
- Optimize only after behavior is verified.
- Preserve behavior during optimization (tests should still pass).

### 4.6 Inline Planning for Small Tasks

For tasks too small for full plan mode but non-trivial:

```text
Plan:
1. [Step one]
2. [Step two]
3. [Verify by...]

Executing...
```

This keeps you on track without heavyweight ceremony.

---

## 5) Code Principles

### 5.1 Keep It Simple

- **Actively resist overcomplication** — simpler is almost always better.
- Avoid over-engineering — only add what's directly needed.
- Don't add comments to code you didn't change.
- Three similar lines beat premature abstraction.
- Don't design for hypothetical future requirements.

Self-check questions:

- "Would a new team member understand this immediately?"
- "Am I adding this because it's needed or because it's proper?"
- "Can I delete anything here and still meet requirements?"

### 5.2 Follow Existing Patterns

- Match the style of surrounding code.
- Use established project conventions before introducing new ones.
- When in doubt, find a similar feature and mirror its structure.

### 5.3 Type Safety (for typed languages)

- Define types/interfaces in the project's designated location.
- Run type checking before commits.
- Prefer explicit types over `any` or implicit inference for public APIs.

### 5.4 Dead Code Hygiene

After refactoring or removing features:

- Explicitly list code that appears unused.
- Ask before removing: "These appear unused after this change: [list]. Should I remove them?"
- Don't silently delete things that might have external callers or tests.

---

## 6) PR Checklist

Before merging:

- [ ] Type checking passes (if applicable)
- [ ] Documentation updated
- [ ] Tested manually or via automated tests
- [ ] Conventional commit message used
- [ ] No unnecessary churn or drive-by refactors

PR sections to include in output:

- Summary
- Why
- What changed
- Risks / edge cases
- How to test
- Rollback plan

---

## 7) What "Done" Looks Like

A feature is complete when:

1. **Implementation** — feature works as specified.
2. **Types** — interfaces/types added if applicable.
3. **Docs Updated** — relevant documentation reflects the change.
4. **Ready to Test** — another developer can verify it works.

---

## 8) Communication Standards

### 8.1 Be Direct About Problems

- State issues clearly: "This will cause X problem because Y."
- Don't soften bad news — clarity helps decisions.
- Quantify when possible: "~200ms latency" not "might be slower".

### 8.2 When Stuck, Say So

- "I'm stuck on X. I've tried A, B, C. None worked because [reasons]."
- Don't spin — surface blockers early.
- Propose next steps or ask for help.

### 8.3 Change Summary Format

After making changes, summarize clearly:

```text
CHANGES MADE:
- [What was added/modified]
- [Files affected]

DIDN'T TOUCH:
- [Related code left unchanged and why]

CONCERNS:
- [Any issues, risks, or follow-up items]
```

---

## 9) Failure Modes to Avoid

Quick reference — common mistakes of a hasty junior developer:

1. **Making wrong assumptions** without reading code or asking.
2. **Not managing confusion** and pushing through unclear requirements.
3. **Not seeking clarifications** and guessing instead.
4. **Not surfacing inconsistencies** when information conflicts.
5. **Not presenting tradeoffs** and hiding complexity from the user.
6. **Not pushing back** and agreeing to bad ideas to avoid friction.
7. **Sycophancy** such as "Of course!" to poor suggestions.
8. **Overcomplicating** with unnecessary abstraction.
9. **Bloating abstractions** by over-configuring for a hypothetical future.
10. **Not cleaning up** dead code after refactoring.
11. **Modifying orthogonal code** while fixing a focused bug.
12. **Removing without understanding** code that only appears unused.

---

## 10) Local Override Mechanism

Use optional local overrides only for stricter personal or machine-specific constraints.

- Template file: `AGENTS.override.template.md`
- Local file: `AGENTS.override.local.md`

`AGENTS.override.local.md` must remain untracked and must not weaken shared or repo rules.

---

## 11) Done Output Format for Agents

For coding tasks, return:

1. Atomic plan
2. Cursor prompt
3. Test plan (exact commands + manual checks)
4. Docs updates (when relevant)
5. Conventional commit suggestion
6. Additional validation notes (if any)

---

## Source: `zoo-blog`

### Source File: `/home/kevin/coding/zoo-blog/AGENTS.md`

_Selection note: Retained the full shared baseline file._

# AGENTS.md

Reusable instructions for AI assistants.

Use this as the shared cross-repository baseline, then add repository-specific constraints in `AGENTS.repo.md`.

---

## Required Reading and Precedence

Apply instruction layers in this order:

1. `AGENTS.md` (this file, shared baseline)
2. `AGENTS.repo.md` (repository-specific strict additions)
3. `AGENTS.override.local.md` (optional local strict additions; untracked)

Precedence rules:

- Lower layers may only add stricter constraints or local specialization.
- Lower layers must never relax safety or quality requirements from higher layers.
- Explicit user/developer instructions in the active session take precedence.

For non-trivial tasks (3+ steps, multi-file changes, or architecture decisions):

- Use Plan Mode when available.
- Create and maintain an ExecPlan per `.agent/PLANS.md` (or `PLANS.md` where that is canonical).
- Store ExecPlans at `plans/<task-slug>.md` unless instructed otherwise.

---

## 0) Prime Directive

- **Do not break production behavior** unless explicitly asked.
- Prefer **small, safe, reversible** changes.
- Default to minimal diffs — avoid "drive-by refactors" in feature commits.
- **Surgical precision** — touch only what is needed. Don't remove comments you don't understand, don't clean up orthogonal code, don't delete things that seem unused without asking.

---

## 1) Workflow Orchestration

### 1.1 Plan Mode Default

- Enter plan mode for ANY non-trivial task (3+ steps or architectural decisions).
- If something goes sideways, STOP and re-plan immediately — don't keep pushing.
- Use plan mode for verification steps, not just building.
- Write detailed specs upfront to reduce ambiguity.

### 1.2 Subagent Strategy

- Use subagents liberally to keep main context window clean.
- Offload research, exploration, and parallel analysis to subagents.
- For complex problems, throw more compute at it via subagents.
- One task per subagent for focused execution.

### 1.3 Self-Improvement Loop

- After ANY correction from the user: update `tasks/lessons.md` with the pattern.
- Write rules for yourself that prevent the same mistake.
- Ruthlessly iterate on these lessons until mistake rate drops.
- Review lessons at session start for relevant project.

### 1.4 Verification Before Done

- Never mark a task complete without proving it works.
- Diff behavior between main and your changes when relevant.
- Ask yourself: "Would a staff engineer approve this?"
- Run tests, check logs, and demonstrate correctness.

### 1.5 Demand Elegance (Balanced)

- For non-trivial changes: pause and ask "is there a more elegant way?"
- If a fix feels hacky: "Knowing everything I know now, implement the elegant solution."
- Skip this for simple, obvious fixes — don't over-engineer.
- Challenge your own work before presenting it.

### 1.6 Autonomous Bug Fixing

- When given a bug report: just fix it. Don't ask for hand-holding.
- Point at logs, errors, failing tests — then resolve them.
- Zero context switching required from the user.
- Go fix failing CI tests without being told how.

---

## 2) Task Management

1. **Plan First**: Write a plan with checkable items in the active ExecPlan (`plans/<task-slug>.md`) or inline for small tasks.
2. **Verify Plan**: Check in before starting implementation.
3. **Track Progress**: Mark items complete as you go.
4. **Explain Changes**: High-level summary at each step.
5. **Document Results**: Add a review section to the active ExecPlan or final task summary.
6. **Capture Lessons**: If the project uses `tasks/lessons.md`, update it after corrections.

> **Note:** These are guidelines — adapt to project structure and active repository conventions.

---

## 3) Problem-Solving Approach

For non-trivial tasks, use recursive decomposition.

### 3.1 Assumption Surfacing

Before implementation, explicitly state assumptions:

```text
My assumptions:
1. [Assumption about requirements]
2. [Assumption about existing behavior]
3. [Assumption about scope]

Proceeding with implementation. Let me know if any assumptions are wrong.
```

### 3.2 Confusion Management

When encountering inconsistencies or unclear requirements:

1. **STOP** — don't push through confusion.
2. **Name it** — "I'm confused because X says Y but Z suggests W."
3. **Wait** — ask for clarification before proceeding.
4. **Never assume** — guessing leads to wasted work and bugs.

### 3.3 Push Back When Warranted

You are not a yes-machine. When you see problems:

- Point out issues directly: "This approach has a problem: [specific issue]."
- Propose alternatives: "Instead, we could [alternative], which avoids [issue]."
- Accept override: if the user insists, proceed with their choice.
- Don't be sycophantic — "Of course!" to bad ideas helps no one.

### Process (Recursive Decomposition)

1. **Decompose** — break the problem into independent subcomponents. Identify top-level structure first.
2. **Process separately** — address each subcomponent as if invoking a specialized expert.
3. **Recurse if needed** — if a part is still too complex, break it further and re-process.
4. **Preserve intermediate work** — reference partial conclusions and refinements.
5. **Integrate** — synthesize all parts into a unified solution. Avoid unsubstantiated leaps.

### Strict Rules

- Do NOT attempt single-pass answers for complex tasks.
- Pause and refine ambiguous/incomplete parts before advancing.
- Prioritize structure and verification over speed.
- For integration decisions, consider multiple perspectives (user experience, code maintainability, existing patterns).

### Core Principles

- **Simplicity First**: make every change as simple as possible. Impact minimal code.
- **No Laziness**: find root causes. No temporary fixes. Senior developer standards.
- **Minimal Impact**: changes should only touch what's necessary. Avoid introducing bugs.

### Atomic Reasoning Structure

For tasks requiring precise, verifiable outputs, use atomic decomposition:

```text
<atomic_context>
[Role/persona + background knowledge + persistent rules]
</atomic_context>

<atomic_task>
[Single, clear objective. One focused goal only.]
</atomic_task>

<atomic_constraints>
- [Hard limits, formats, verification rules]
- [e.g., No hallucinations; max length X; must match existing patterns]
</atomic_constraints>

<atomic_variables>
{{variable1}}: [description or value]
{{variable2}}: [etc.]
</atomic_variables>

<atomic_process>
1. Decompose into 3-8 atomic sub-questions/steps (independent where possible)
2. Solve each atom individually with high accuracy
3. Verify each atom's output against constraints
4. Integrate into unified solution (resolve dependencies, synthesize)
5. Recurse on any unresolved atom if needed
</atomic_process>
```

Output format:

- Atomic decomposition list (brief bullets)
- Solved atoms (numbered)
- Final synthesized solution

---

## 4) Workflow Principles

### 4.1 Read Before You Write

- Read relevant files before modifying (use Read tool, not assumptions).
- Check project roadmap, active plans, and relevant docs for current priorities.
- Infer patterns from existing code before introducing new ones.

### 4.2 Make Changes in Small Commits

- Keep commits focused (one feature, one intent).
- If unrelated changes exist, split them into individual commits by concern; never bundle unrelated work in a single commit.
- Use [Conventional Commits](https://www.conventionalcommits.org/) format.
- Prefer a follow-up refactor commit after behavior is stable.
- After each successful commit, push it in the same task by default (`git push` to the active remote/branch), unless the user explicitly asks not to push.

### 4.3 Update Docs with Changes

- Documentation updates are **required** after feature implementation.
- If behavior changes, docs must change in the same PR.

### 4.4 Test-First Leverage

- Write the test that defines success first.
- Implement until the test passes.
- The test is your specification — if you can't write it, requirements are unclear.

### 4.5 Naive Then Optimize

- Get a correct, naive version working first.
- Optimize only after behavior is verified.
- Preserve behavior during optimization (tests should still pass).

### 4.6 Inline Planning for Small Tasks

For tasks too small for full plan mode but non-trivial:

```text
Plan:
1. [Step one]
2. [Step two]
3. [Verify by...]

Executing...
```

This keeps you on track without heavyweight ceremony.

---

## 5) Code Principles

### 5.1 Keep It Simple

- **Actively resist overcomplication** — simpler is almost always better.
- Avoid over-engineering — only add what's directly needed.
- Don't add comments to code you didn't change.
- Three similar lines beat premature abstraction.
- Don't design for hypothetical future requirements.

Self-check questions:

- "Would a new team member understand this immediately?"
- "Am I adding this because it's needed or because it's proper?"
- "Can I delete anything here and still meet requirements?"

### 5.2 Follow Existing Patterns

- Match the style of surrounding code.
- Use established project conventions before introducing new ones.
- When in doubt, find a similar feature and mirror its structure.

### 5.3 Type Safety (for typed languages)

- Define types/interfaces in the project's designated location.
- Run type checking before commits.
- Prefer explicit types over `any` or implicit inference for public APIs.

### 5.4 Dead Code Hygiene

After refactoring or removing features:

- Explicitly list code that appears unused.
- Ask before removing: "These appear unused after this change: [list]. Should I remove them?"
- Don't silently delete things that might have external callers or tests.

---

## 6) PR Checklist

Before merging:

- [ ] Type checking passes (if applicable)
- [ ] Documentation updated
- [ ] Tested manually or via automated tests
- [ ] Conventional commit message used
- [ ] Commit pushed to remote
- [ ] No unnecessary churn or drive-by refactors

PR sections to include in output:

- Summary
- Why
- What changed
- Risks / edge cases
- How to test
- Rollback plan

---

## 7) What "Done" Looks Like

A feature is complete when:

1. **Implementation** — feature works as specified.
2. **Types** — interfaces/types added if applicable.
3. **Docs Updated** — relevant documentation reflects the change.
4. **Ready to Test** — another developer can verify it works.

---

## 8) Communication Standards

### 8.1 Be Direct About Problems

- State issues clearly: "This will cause X problem because Y."
- Don't soften bad news — clarity helps decisions.
- Quantify when possible: "~200ms latency" not "might be slower".

### 8.2 When Stuck, Say So

- "I'm stuck on X. I've tried A, B, C. None worked because [reasons]."
- Don't spin — surface blockers early.
- Propose next steps or ask for help.

### 8.3 Change Summary Format

After making changes, summarize clearly:

```text
CHANGES MADE:
- [What was added/modified]
- [Files affected]

DIDN'T TOUCH:
- [Related code left unchanged and why]

CONCERNS:
- [Any issues, risks, or follow-up items]
```

---

## 9) Failure Modes to Avoid

Quick reference — common mistakes of a hasty junior developer:

1. **Making wrong assumptions** without reading code or asking.
2. **Not managing confusion** and pushing through unclear requirements.
3. **Not seeking clarifications** and guessing instead.
4. **Not surfacing inconsistencies** when information conflicts.
5. **Not presenting tradeoffs** and hiding complexity from the user.
6. **Not pushing back** and agreeing to bad ideas to avoid friction.
7. **Sycophancy** such as "Of course!" to poor suggestions.
8. **Overcomplicating** with unnecessary abstraction.
9. **Bloating abstractions** by over-configuring for a hypothetical future.
10. **Not cleaning up** dead code after refactoring.
11. **Modifying orthogonal code** while fixing a focused bug.
12. **Removing without understanding** code that only appears unused.

---

## 10) Local Override Mechanism

Use optional local overrides only for stricter personal or machine-specific constraints.

- Template file: `AGENTS.override.template.md`
- Local file: `AGENTS.override.local.md`

`AGENTS.override.local.md` must remain untracked and must not weaken shared or repo rules.

---

## 11) Done Output Format for Agents

For coding tasks, return:

1. Atomic plan
2. Cursor prompt
3. Test plan (exact commands + manual checks)
4. Docs updates (when relevant)
5. Conventional commit suggestion
6. Additional validation notes (if any)

---

## Source: `Kevin-Mok`

### Source File: `/home/kevin/coding/Kevin-Mok/AGENTS.md`

_Selection note: Retained the full shared baseline file._

# AGENTS.md

Reusable instructions for AI assistants.

Use this as the shared cross-repository baseline, then add repository-specific constraints in `AGENTS.repo.md`.

---

## Required Reading and Precedence

Apply instruction layers in this order:

1. `AGENTS.md` (this file, shared baseline)
2. `AGENTS.repo.md` (repository-specific strict additions)
3. `AGENTS.override.local.md` (optional local strict additions; untracked)

Precedence rules:

- Lower layers may only add stricter constraints or local specialization.
- Lower layers must never relax safety or quality requirements from higher layers.
- Explicit user/developer instructions in the active session take precedence.

For non-trivial tasks (3+ steps, multi-file changes, or architecture decisions):

- Use Plan Mode when available.
- Create and maintain an ExecPlan per `.agent/PLANS.md` (or `PLANS.md` where that is canonical).
- Store ExecPlans at `plans/<task-slug>.md` unless instructed otherwise.

---

## 0) Prime Directive

- **Do not break production behavior** unless explicitly asked.
- Prefer **small, safe, reversible** changes.
- Default to minimal diffs — avoid "drive-by refactors" in feature commits.
- **Surgical precision** — touch only what is needed. Don't remove comments you don't understand, don't clean up orthogonal code, don't delete things that seem unused without asking.

---

## 1) Workflow Orchestration

### 1.1 Plan Mode Default

- Enter plan mode for ANY non-trivial task (3+ steps or architectural decisions).
- If something goes sideways, STOP and re-plan immediately — don't keep pushing.
- Use plan mode for verification steps, not just building.
- Write detailed specs upfront to reduce ambiguity.

### 1.2 Subagent Strategy

- Use subagents liberally to keep main context window clean.
- Offload research, exploration, and parallel analysis to subagents.
- For complex problems, throw more compute at it via subagents.
- One task per subagent for focused execution.

### 1.3 Self-Improvement Loop

- After ANY correction from the user: update `tasks/lessons.md` with the pattern.
- Write rules for yourself that prevent the same mistake.
- Ruthlessly iterate on these lessons until mistake rate drops.
- Review lessons at session start for relevant project.

### 1.4 Verification Before Done

- Never mark a task complete without proving it works.
- Diff behavior between main and your changes when relevant.
- Ask yourself: "Would a staff engineer approve this?"
- Run tests, check logs, and demonstrate correctness.

### 1.5 Demand Elegance (Balanced)

- For non-trivial changes: pause and ask "is there a more elegant way?"
- If a fix feels hacky: "Knowing everything I know now, implement the elegant solution."
- Skip this for simple, obvious fixes — don't over-engineer.
- Challenge your own work before presenting it.

### 1.6 Autonomous Bug Fixing

- When given a bug report: just fix it. Don't ask for hand-holding.
- Point at logs, errors, failing tests — then resolve them.
- Zero context switching required from the user.
- Go fix failing CI tests without being told how.

---

## 2) Task Management

1. **Plan First**: Write a plan with checkable items in the active ExecPlan (`plans/<task-slug>.md`) or inline for small tasks.
2. **Verify Plan**: Check in before starting implementation.
3. **Track Progress**: Mark items complete as you go.
4. **Explain Changes**: High-level summary at each step.
5. **Document Results**: Add a review section to the active ExecPlan or final task summary.
6. **Capture Lessons**: If the project uses `tasks/lessons.md`, update it after corrections.

> **Note:** These are guidelines — adapt to project structure and active repository conventions.

---

## 3) Problem-Solving Approach

For non-trivial tasks, use recursive decomposition.

### 3.1 Assumption Surfacing

Before implementation, explicitly state assumptions:

```text
My assumptions:
1. [Assumption about requirements]
2. [Assumption about existing behavior]
3. [Assumption about scope]

Proceeding with implementation. Let me know if any assumptions are wrong.
```

### 3.2 Confusion Management

When encountering inconsistencies or unclear requirements:

1. **STOP** — don't push through confusion.
2. **Name it** — "I'm confused because X says Y but Z suggests W."
3. **Wait** — ask for clarification before proceeding.
4. **Never assume** — guessing leads to wasted work and bugs.

### 3.3 Push Back When Warranted

You are not a yes-machine. When you see problems:

- Point out issues directly: "This approach has a problem: [specific issue]."
- Propose alternatives: "Instead, we could [alternative], which avoids [issue]."
- Accept override: if the user insists, proceed with their choice.
- Don't be sycophantic — "Of course!" to bad ideas helps no one.

### Process (Recursive Decomposition)

1. **Decompose** — break the problem into independent subcomponents. Identify top-level structure first.
2. **Process separately** — address each subcomponent as if invoking a specialized expert.
3. **Recurse if needed** — if a part is still too complex, break it further and re-process.
4. **Preserve intermediate work** — reference partial conclusions and refinements.
5. **Integrate** — synthesize all parts into a unified solution. Avoid unsubstantiated leaps.

### Strict Rules

- Do NOT attempt single-pass answers for complex tasks.
- Pause and refine ambiguous/incomplete parts before advancing.
- Prioritize structure and verification over speed.
- For integration decisions, consider multiple perspectives (user experience, code maintainability, existing patterns).

### Core Principles

- **Simplicity First**: make every change as simple as possible. Impact minimal code.
- **No Laziness**: find root causes. No temporary fixes. Senior developer standards.
- **Minimal Impact**: changes should only touch what's necessary. Avoid introducing bugs.

### Atomic Reasoning Structure

For tasks requiring precise, verifiable outputs, use atomic decomposition:

```text
<atomic_context>
[Role/persona + background knowledge + persistent rules]
</atomic_context>

<atomic_task>
[Single, clear objective. One focused goal only.]
</atomic_task>

<atomic_constraints>
- [Hard limits, formats, verification rules]
- [e.g., No hallucinations; max length X; must match existing patterns]
</atomic_constraints>

<atomic_variables>
{{variable1}}: [description or value]
{{variable2}}: [etc.]
</atomic_variables>

<atomic_process>
1. Decompose into 3-8 atomic sub-questions/steps (independent where possible)
2. Solve each atom individually with high accuracy
3. Verify each atom's output against constraints
4. Integrate into unified solution (resolve dependencies, synthesize)
5. Recurse on any unresolved atom if needed
</atomic_process>
```

Output format:

- Atomic decomposition list (brief bullets)
- Solved atoms (numbered)
- Final synthesized solution

---

## 4) Workflow Principles

### 4.1 Read Before You Write

- Read relevant files before modifying (use Read tool, not assumptions).
- Check project roadmap, active plans, and relevant docs for current priorities.
- Infer patterns from existing code before introducing new ones.

### 4.2 Make Changes in Small Commits

- Keep commits focused (one feature, one intent).
- Use [Conventional Commits](https://www.conventionalcommits.org/) format.
- Prefer a follow-up refactor commit after behavior is stable.

### 4.3 Update Docs with Changes

- Documentation updates are **required** after feature implementation.
- If behavior changes, docs must change in the same PR.

### 4.4 Test-First Leverage

- Write the test that defines success first.
- Implement until the test passes.
- The test is your specification — if you can't write it, requirements are unclear.

### 4.5 Naive Then Optimize

- Get a correct, naive version working first.
- Optimize only after behavior is verified.
- Preserve behavior during optimization (tests should still pass).

### 4.6 Inline Planning for Small Tasks

For tasks too small for full plan mode but non-trivial:

```text
Plan:
1. [Step one]
2. [Step two]
3. [Verify by...]

Executing...
```

This keeps you on track without heavyweight ceremony.

---

## 5) Code Principles

### 5.1 Keep It Simple

- **Actively resist overcomplication** — simpler is almost always better.
- Avoid over-engineering — only add what's directly needed.
- Don't add comments to code you didn't change.
- Three similar lines beat premature abstraction.
- Don't design for hypothetical future requirements.

Self-check questions:

- "Would a new team member understand this immediately?"
- "Am I adding this because it's needed or because it's proper?"
- "Can I delete anything here and still meet requirements?"

### 5.2 Follow Existing Patterns

- Match the style of surrounding code.
- Use established project conventions before introducing new ones.
- When in doubt, find a similar feature and mirror its structure.

### 5.3 Type Safety (for typed languages)

- Define types/interfaces in the project's designated location.
- Run type checking before commits.
- Prefer explicit types over `any` or implicit inference for public APIs.

### 5.4 Dead Code Hygiene

After refactoring or removing features:

- Explicitly list code that appears unused.
- Ask before removing: "These appear unused after this change: [list]. Should I remove them?"
- Don't silently delete things that might have external callers or tests.

---

## 6) PR Checklist

Before merging:

- [ ] Type checking passes (if applicable)
- [ ] Documentation updated
- [ ] Tested manually or via automated tests
- [ ] Conventional commit message used
- [ ] No unnecessary churn or drive-by refactors

PR sections to include in output:

- Summary
- Why
- What changed
- Risks / edge cases
- How to test
- Rollback plan

---

## 7) What "Done" Looks Like

A feature is complete when:

1. **Implementation** — feature works as specified.
2. **Types** — interfaces/types added if applicable.
3. **Docs Updated** — relevant documentation reflects the change.
4. **Ready to Test** — another developer can verify it works.

---

## 8) Communication Standards

### 8.1 Be Direct About Problems

- State issues clearly: "This will cause X problem because Y."
- Don't soften bad news — clarity helps decisions.
- Quantify when possible: "~200ms latency" not "might be slower".

### 8.2 When Stuck, Say So

- "I'm stuck on X. I've tried A, B, C. None worked because [reasons]."
- Don't spin — surface blockers early.
- Propose next steps or ask for help.

### 8.3 Change Summary Format

After making changes, summarize clearly:

```text
CHANGES MADE:
- [What was added/modified]
- [Files affected]

DIDN'T TOUCH:
- [Related code left unchanged and why]

CONCERNS:
- [Any issues, risks, or follow-up items]
```

---

## 9) Failure Modes to Avoid

Quick reference — common mistakes of a hasty junior developer:

1. **Making wrong assumptions** without reading code or asking.
2. **Not managing confusion** and pushing through unclear requirements.
3. **Not seeking clarifications** and guessing instead.
4. **Not surfacing inconsistencies** when information conflicts.
5. **Not presenting tradeoffs** and hiding complexity from the user.
6. **Not pushing back** and agreeing to bad ideas to avoid friction.
7. **Sycophancy** such as "Of course!" to poor suggestions.
8. **Overcomplicating** with unnecessary abstraction.
9. **Bloating abstractions** by over-configuring for a hypothetical future.
10. **Not cleaning up** dead code after refactoring.
11. **Modifying orthogonal code** while fixing a focused bug.
12. **Removing without understanding** code that only appears unused.

---

## 10) Local Override Mechanism

Use optional local overrides only for stricter personal or machine-specific constraints.

- Template file: `AGENTS.override.template.md`
- Local file: `AGENTS.override.local.md`

`AGENTS.override.local.md` must remain untracked and must not weaken shared or repo rules.

---

## 11) Done Output Format for Agents

For coding tasks, return:

1. Atomic plan
2. Cursor prompt
3. Test plan (exact commands + manual checks)
4. Docs updates (when relevant)
5. Conventional commit suggestion
6. Additional validation notes (if any)

---

## Source: `spotify-library-intelligence-dashboard`

### Source File: `/home/kevin/coding/spotify-library-intelligence-dashboard/AGENTS.md`

_Selection note: Retained the full shared baseline file._

# AGENTS.md

Reusable instructions for AI assistants.

Use this as the shared cross-repository baseline, then add repository-specific constraints in `AGENTS.repo.md`.

---

## Required Reading and Precedence

Apply instruction layers in this order:

1. `AGENTS.md` (this file, shared baseline)
2. `AGENTS.repo.md` (repository-specific strict additions)
3. `AGENTS.override.local.md` (optional local strict additions; untracked)

Precedence rules:

- Lower layers may only add stricter constraints or local specialization.
- Lower layers must never relax safety or quality requirements from higher layers.
- Explicit user/developer instructions in the active session take precedence.

For non-trivial tasks (3+ steps, multi-file changes, or architecture decisions):

- Use Plan Mode when available.
- Create and maintain an ExecPlan per `.agent/PLANS.md` (or `PLANS.md` where that is canonical).
- Store ExecPlans at `plans/<task-slug>.md` unless instructed otherwise.

---

## 0) Prime Directive

- **Do not break production behavior** unless explicitly asked.
- Prefer **small, safe, reversible** changes.
- Default to minimal diffs — avoid "drive-by refactors" in feature commits.
- **Surgical precision** — touch only what is needed. Don't remove comments you don't understand, don't clean up orthogonal code, don't delete things that seem unused without asking.

---

## 1) Workflow Orchestration

### 1.1 Plan Mode Default

- Enter plan mode for ANY non-trivial task (3+ steps or architectural decisions).
- If something goes sideways, STOP and re-plan immediately — don't keep pushing.
- Use plan mode for verification steps, not just building.
- Write detailed specs upfront to reduce ambiguity.

### 1.2 Subagent Strategy

- Use subagents liberally to keep main context window clean.
- Offload research, exploration, and parallel analysis to subagents.
- For complex problems, throw more compute at it via subagents.
- One task per subagent for focused execution.

### 1.3 Self-Improvement Loop

- After ANY correction from the user: update `tasks/lessons.md` with the pattern.
- Write rules for yourself that prevent the same mistake.
- Ruthlessly iterate on these lessons until mistake rate drops.
- Review lessons at session start for relevant project.

### 1.4 Verification Before Done

- Never mark a task complete without proving it works.
- Diff behavior between main and your changes when relevant.
- Ask yourself: "Would a staff engineer approve this?"
- Run tests, check logs, and demonstrate correctness.

### 1.5 Demand Elegance (Balanced)

- For non-trivial changes: pause and ask "is there a more elegant way?"
- If a fix feels hacky: "Knowing everything I know now, implement the elegant solution."
- Skip this for simple, obvious fixes — don't over-engineer.
- Challenge your own work before presenting it.

### 1.6 Autonomous Bug Fixing

- When given a bug report: just fix it. Don't ask for hand-holding.
- Point at logs, errors, failing tests — then resolve them.
- Zero context switching required from the user.
- Go fix failing CI tests without being told how.

---

## 2) Task Management

1. **Plan First**: Write a plan with checkable items in the active ExecPlan (`plans/<task-slug>.md`) or inline for small tasks.
2. **Verify Plan**: Check in before starting implementation.
3. **Track Progress**: Mark items complete as you go.
4. **Explain Changes**: High-level summary at each step.
5. **Document Results**: Add a review section to the active ExecPlan or final task summary.
6. **Capture Lessons**: If the project uses `tasks/lessons.md`, update it after corrections.

> **Note:** These are guidelines — adapt to project structure and active repository conventions.

---

## 3) Problem-Solving Approach

For non-trivial tasks, use recursive decomposition.

### 3.1 Assumption Surfacing

Before implementation, explicitly state assumptions:

```text
My assumptions:
1. [Assumption about requirements]
2. [Assumption about existing behavior]
3. [Assumption about scope]

Proceeding with implementation. Let me know if any assumptions are wrong.
```

### 3.2 Confusion Management

When encountering inconsistencies or unclear requirements:

1. **STOP** — don't push through confusion.
2. **Name it** — "I'm confused because X says Y but Z suggests W."
3. **Wait** — ask for clarification before proceeding.
4. **Never assume** — guessing leads to wasted work and bugs.

### 3.3 Push Back When Warranted

You are not a yes-machine. When you see problems:

- Point out issues directly: "This approach has a problem: [specific issue]."
- Propose alternatives: "Instead, we could [alternative], which avoids [issue]."
- Accept override: if the user insists, proceed with their choice.
- Don't be sycophantic — "Of course!" to bad ideas helps no one.

### Process (Recursive Decomposition)

1. **Decompose** — break the problem into independent subcomponents. Identify top-level structure first.
2. **Process separately** — address each subcomponent as if invoking a specialized expert.
3. **Recurse if needed** — if a part is still too complex, break it further and re-process.
4. **Preserve intermediate work** — reference partial conclusions and refinements.
5. **Integrate** — synthesize all parts into a unified solution. Avoid unsubstantiated leaps.

### Strict Rules

- Do NOT attempt single-pass answers for complex tasks.
- Pause and refine ambiguous/incomplete parts before advancing.
- Prioritize structure and verification over speed.
- For integration decisions, consider multiple perspectives (user experience, code maintainability, existing patterns).

### Core Principles

- **Simplicity First**: make every change as simple as possible. Impact minimal code.
- **No Laziness**: find root causes. No temporary fixes. Senior developer standards.
- **Minimal Impact**: changes should only touch what's necessary. Avoid introducing bugs.

### Atomic Reasoning Structure

For tasks requiring precise, verifiable outputs, use atomic decomposition:

```text
<atomic_context>
[Role/persona + background knowledge + persistent rules]
</atomic_context>

<atomic_task>
[Single, clear objective. One focused goal only.]
</atomic_task>

<atomic_constraints>
- [Hard limits, formats, verification rules]
- [e.g., No hallucinations; max length X; must match existing patterns]
</atomic_constraints>

<atomic_variables>
{{variable1}}: [description or value]
{{variable2}}: [etc.]
</atomic_variables>

<atomic_process>
1. Decompose into 3-8 atomic sub-questions/steps (independent where possible)
2. Solve each atom individually with high accuracy
3. Verify each atom's output against constraints
4. Integrate into unified solution (resolve dependencies, synthesize)
5. Recurse on any unresolved atom if needed
</atomic_process>
```

Output format:

- Atomic decomposition list (brief bullets)
- Solved atoms (numbered)
- Final synthesized solution

---

## 4) Workflow Principles

### 4.1 Read Before You Write

- Read relevant files before modifying (use Read tool, not assumptions).
- Check project roadmap, active plans, and relevant docs for current priorities.
- Infer patterns from existing code before introducing new ones.

### 4.2 Make Changes in Small Commits

- Keep commits focused (one feature, one intent).
- Use [Conventional Commits](https://www.conventionalcommits.org/) format.
- Prefer a follow-up refactor commit after behavior is stable.

### 4.3 Update Docs with Changes

- Documentation updates are **required** after feature implementation.
- If behavior changes, docs must change in the same PR.

### 4.4 Test-First Leverage

- Write the test that defines success first.
- Implement until the test passes.
- The test is your specification — if you can't write it, requirements are unclear.

### 4.5 Naive Then Optimize

- Get a correct, naive version working first.
- Optimize only after behavior is verified.
- Preserve behavior during optimization (tests should still pass).

### 4.6 Inline Planning for Small Tasks

For tasks too small for full plan mode but non-trivial:

```text
Plan:
1. [Step one]
2. [Step two]
3. [Verify by...]

Executing...
```

This keeps you on track without heavyweight ceremony.

---

## 5) Code Principles

### 5.1 Keep It Simple

- **Actively resist overcomplication** — simpler is almost always better.
- Avoid over-engineering — only add what's directly needed.
- Don't add comments to code you didn't change.
- Three similar lines beat premature abstraction.
- Don't design for hypothetical future requirements.

Self-check questions:

- "Would a new team member understand this immediately?"
- "Am I adding this because it's needed or because it's proper?"
- "Can I delete anything here and still meet requirements?"

### 5.2 Follow Existing Patterns

- Match the style of surrounding code.
- Use established project conventions before introducing new ones.
- When in doubt, find a similar feature and mirror its structure.

### 5.3 Type Safety (for typed languages)

- Define types/interfaces in the project's designated location.
- Run type checking before commits.
- Prefer explicit types over `any` or implicit inference for public APIs.

### 5.4 Dead Code Hygiene

After refactoring or removing features:

- Explicitly list code that appears unused.
- Ask before removing: "These appear unused after this change: [list]. Should I remove them?"
- Don't silently delete things that might have external callers or tests.

---

## 6) PR Checklist

Before merging:

- [ ] Type checking passes (if applicable)
- [ ] Documentation updated
- [ ] Tested manually or via automated tests
- [ ] Conventional commit message used
- [ ] No unnecessary churn or drive-by refactors

PR sections to include in output:

- Summary
- Why
- What changed
- Risks / edge cases
- How to test
- Rollback plan

---

## 7) What "Done" Looks Like

A feature is complete when:

1. **Implementation** — feature works as specified.
2. **Types** — interfaces/types added if applicable.
3. **Docs Updated** — relevant documentation reflects the change.
4. **Ready to Test** — another developer can verify it works.

---

## 8) Communication Standards

### 8.1 Be Direct About Problems

- State issues clearly: "This will cause X problem because Y."
- Don't soften bad news — clarity helps decisions.
- Quantify when possible: "~200ms latency" not "might be slower".

### 8.2 When Stuck, Say So

- "I'm stuck on X. I've tried A, B, C. None worked because [reasons]."
- Don't spin — surface blockers early.
- Propose next steps or ask for help.

### 8.3 Change Summary Format

After making changes, summarize clearly:

```text
CHANGES MADE:
- [What was added/modified]
- [Files affected]

DIDN'T TOUCH:
- [Related code left unchanged and why]

CONCERNS:
- [Any issues, risks, or follow-up items]
```

---

## 9) Failure Modes to Avoid

Quick reference — common mistakes of a hasty junior developer:

1. **Making wrong assumptions** without reading code or asking.
2. **Not managing confusion** and pushing through unclear requirements.
3. **Not seeking clarifications** and guessing instead.
4. **Not surfacing inconsistencies** when information conflicts.
5. **Not presenting tradeoffs** and hiding complexity from the user.
6. **Not pushing back** and agreeing to bad ideas to avoid friction.
7. **Sycophancy** such as "Of course!" to poor suggestions.
8. **Overcomplicating** with unnecessary abstraction.
9. **Bloating abstractions** by over-configuring for a hypothetical future.
10. **Not cleaning up** dead code after refactoring.
11. **Modifying orthogonal code** while fixing a focused bug.
12. **Removing without understanding** code that only appears unused.

---

## 10) Local Override Mechanism

Use optional local overrides only for stricter personal or machine-specific constraints.

- Template file: `AGENTS.override.template.md`
- Local file: `AGENTS.override.local.md`

`AGENTS.override.local.md` must remain untracked and must not weaken shared or repo rules.

---

## 11) Done Output Format for Agents

For coding tasks, return:

1. Atomic plan
2. Cursor prompt
3. Test plan (exact commands + manual checks)
4. Docs updates (when relevant)
5. Conventional commit suggestion
6. Additional validation notes (if any)

---

## Source: `portfolio-site`

### Source File: `/home/kevin/coding/portfolio-site/AGENTS.md`

_Selection note: Retained the full shared baseline file._

# AGENTS.md

Reusable instructions for AI assistants.

Use this as the shared cross-repository baseline, then add repository-specific constraints in `AGENTS.repo.md`.

---

## Required Reading and Precedence

Apply instruction layers in this order:

1. `AGENTS.md` (this file, shared baseline)
2. `AGENTS.repo.md` (repository-specific strict additions)
3. `AGENTS.override.local.md` (optional local strict additions; untracked)

Precedence rules:

- Lower layers may only add stricter constraints or local specialization.
- Lower layers must never relax safety or quality requirements from higher layers.
- Explicit user/developer instructions in the active session take precedence.

For non-trivial tasks (3+ steps, multi-file changes, or architecture decisions):

- Use Plan Mode when available.
- Create and maintain an ExecPlan per `.agent/PLANS.md` (or `PLANS.md` where that is canonical).
- Store ExecPlans at `plans/<task-slug>.md` unless instructed otherwise.

---

## 0) Prime Directive

- **Do not break production behavior** unless explicitly asked.
- Prefer **small, safe, reversible** changes.
- Default to minimal diffs — avoid "drive-by refactors" in feature commits.
- **Surgical precision** — touch only what is needed. Don't remove comments you don't understand, don't clean up orthogonal code, don't delete things that seem unused without asking.

---

## 1) Workflow Orchestration

### 1.1 Plan Mode Default

- Enter plan mode for ANY non-trivial task (3+ steps or architectural decisions).
- If something goes sideways, STOP and re-plan immediately — don't keep pushing.
- Use plan mode for verification steps, not just building.
- Write detailed specs upfront to reduce ambiguity.

### 1.2 Subagent Strategy

- Use subagents liberally to keep main context window clean.
- Offload research, exploration, and parallel analysis to subagents.
- For complex problems, throw more compute at it via subagents.
- One task per subagent for focused execution.

### 1.3 Self-Improvement Loop

- After ANY correction from the user: update `tasks/lessons.md` with the pattern.
- Write rules for yourself that prevent the same mistake.
- Ruthlessly iterate on these lessons until mistake rate drops.
- Review lessons at session start for relevant project.

### 1.4 Verification Before Done

- Never mark a task complete without proving it works.
- Diff behavior between main and your changes when relevant.
- Ask yourself: "Would a staff engineer approve this?"
- Run tests, check logs, and demonstrate correctness.

### 1.5 Demand Elegance (Balanced)

- For non-trivial changes: pause and ask "is there a more elegant way?"
- If a fix feels hacky: "Knowing everything I know now, implement the elegant solution."
- Skip this for simple, obvious fixes — don't over-engineer.
- Challenge your own work before presenting it.

### 1.6 Autonomous Bug Fixing

- When given a bug report: just fix it. Don't ask for hand-holding.
- Point at logs, errors, failing tests — then resolve them.
- Zero context switching required from the user.
- Go fix failing CI tests without being told how.

---

## 2) Task Management

1. **Plan First**: Write a plan with checkable items in the active ExecPlan (`plans/<task-slug>.md`) or inline for small tasks.
2. **Verify Plan**: Check in before starting implementation.
3. **Track Progress**: Mark items complete as you go.
4. **Explain Changes**: High-level summary at each step.
5. **Document Results**: Add a review section to the active ExecPlan or final task summary.
6. **Capture Lessons**: If the project uses `tasks/lessons.md`, update it after corrections.

> **Note:** These are guidelines — adapt to project structure and active repository conventions.

---

## 3) Problem-Solving Approach

For non-trivial tasks, use recursive decomposition.

### 3.1 Assumption Surfacing

Before implementation, explicitly state assumptions:

```text
My assumptions:
1. [Assumption about requirements]
2. [Assumption about existing behavior]
3. [Assumption about scope]

Proceeding with implementation. Let me know if any assumptions are wrong.
```

### 3.2 Confusion Management

When encountering inconsistencies or unclear requirements:

1. **STOP** — don't push through confusion.
2. **Name it** — "I'm confused because X says Y but Z suggests W."
3. **Wait** — ask for clarification before proceeding.
4. **Never assume** — guessing leads to wasted work and bugs.

### 3.3 Push Back When Warranted

You are not a yes-machine. When you see problems:

- Point out issues directly: "This approach has a problem: [specific issue]."
- Propose alternatives: "Instead, we could [alternative], which avoids [issue]."
- Accept override: if the user insists, proceed with their choice.
- Don't be sycophantic — "Of course!" to bad ideas helps no one.

### Process (Recursive Decomposition)

1. **Decompose** — break the problem into independent subcomponents. Identify top-level structure first.
2. **Process separately** — address each subcomponent as if invoking a specialized expert.
3. **Recurse if needed** — if a part is still too complex, break it further and re-process.
4. **Preserve intermediate work** — reference partial conclusions and refinements.
5. **Integrate** — synthesize all parts into a unified solution. Avoid unsubstantiated leaps.

### Strict Rules

- Do NOT attempt single-pass answers for complex tasks.
- Pause and refine ambiguous/incomplete parts before advancing.
- Prioritize structure and verification over speed.
- For integration decisions, consider multiple perspectives (user experience, code maintainability, existing patterns).

### Core Principles

- **Simplicity First**: make every change as simple as possible. Impact minimal code.
- **No Laziness**: find root causes. No temporary fixes. Senior developer standards.
- **Minimal Impact**: changes should only touch what's necessary. Avoid introducing bugs.

### Atomic Reasoning Structure

For tasks requiring precise, verifiable outputs, use atomic decomposition:

```text
<atomic_context>
[Role/persona + background knowledge + persistent rules]
</atomic_context>

<atomic_task>
[Single, clear objective. One focused goal only.]
</atomic_task>

<atomic_constraints>
- [Hard limits, formats, verification rules]
- [e.g., No hallucinations; max length X; must match existing patterns]
</atomic_constraints>

<atomic_variables>
{{variable1}}: [description or value]
{{variable2}}: [etc.]
</atomic_variables>

<atomic_process>
1. Decompose into 3-8 atomic sub-questions/steps (independent where possible)
2. Solve each atom individually with high accuracy
3. Verify each atom's output against constraints
4. Integrate into unified solution (resolve dependencies, synthesize)
5. Recurse on any unresolved atom if needed
</atomic_process>
```

Output format:

- Atomic decomposition list (brief bullets)
- Solved atoms (numbered)
- Final synthesized solution

---

## 4) Workflow Principles

### 4.1 Read Before You Write

- Read relevant files before modifying (use Read tool, not assumptions).
- Check project roadmap, active plans, and relevant docs for current priorities.
- Infer patterns from existing code before introducing new ones.

### 4.2 Make Changes in Small Commits

- Keep commits focused (one feature, one intent).
- Use [Conventional Commits](https://www.conventionalcommits.org/) format.
- Prefer a follow-up refactor commit after behavior is stable.

### 4.3 Update Docs with Changes

- Documentation updates are **required** after feature implementation.
- If behavior changes, docs must change in the same PR.

### 4.4 Test-First Leverage

- Write the test that defines success first.
- Implement until the test passes.
- The test is your specification — if you can't write it, requirements are unclear.

### 4.5 Naive Then Optimize

- Get a correct, naive version working first.
- Optimize only after behavior is verified.
- Preserve behavior during optimization (tests should still pass).

### 4.6 Inline Planning for Small Tasks

For tasks too small for full plan mode but non-trivial:

```text
Plan:
1. [Step one]
2. [Step two]
3. [Verify by...]

Executing...
```

This keeps you on track without heavyweight ceremony.

---

## 5) Code Principles

### 5.1 Keep It Simple

- **Actively resist overcomplication** — simpler is almost always better.
- Avoid over-engineering — only add what's directly needed.
- Don't add comments to code you didn't change.
- Three similar lines beat premature abstraction.
- Don't design for hypothetical future requirements.

Self-check questions:

- "Would a new team member understand this immediately?"
- "Am I adding this because it's needed or because it's proper?"
- "Can I delete anything here and still meet requirements?"

### 5.2 Follow Existing Patterns

- Match the style of surrounding code.
- Use established project conventions before introducing new ones.
- When in doubt, find a similar feature and mirror its structure.

### 5.3 Type Safety (for typed languages)

- Define types/interfaces in the project's designated location.
- Run type checking before commits.
- Prefer explicit types over `any` or implicit inference for public APIs.

### 5.4 Dead Code Hygiene

After refactoring or removing features:

- Explicitly list code that appears unused.
- Ask before removing: "These appear unused after this change: [list]. Should I remove them?"
- Don't silently delete things that might have external callers or tests.

---

## 6) PR Checklist

Before merging:

- [ ] Type checking passes (if applicable)
- [ ] Documentation updated
- [ ] Tested manually or via automated tests
- [ ] Conventional commit message used
- [ ] No unnecessary churn or drive-by refactors

PR sections to include in output:

- Summary
- Why
- What changed
- Risks / edge cases
- How to test
- Rollback plan

---

## 7) What "Done" Looks Like

A feature is complete when:

1. **Implementation** — feature works as specified.
2. **Types** — interfaces/types added if applicable.
3. **Docs Updated** — relevant documentation reflects the change.
4. **Ready to Test** — another developer can verify it works.

---

## 8) Communication Standards

### 8.1 Be Direct About Problems

- State issues clearly: "This will cause X problem because Y."
- Don't soften bad news — clarity helps decisions.
- Quantify when possible: "~200ms latency" not "might be slower".

### 8.2 When Stuck, Say So

- "I'm stuck on X. I've tried A, B, C. None worked because [reasons]."
- Don't spin — surface blockers early.
- Propose next steps or ask for help.

### 8.3 Change Summary Format

After making changes, summarize clearly:

```text
CHANGES MADE:
- [What was added/modified]
- [Files affected]

DIDN'T TOUCH:
- [Related code left unchanged and why]

CONCERNS:
- [Any issues, risks, or follow-up items]
```

---

## 9) Failure Modes to Avoid

Quick reference — common mistakes of a hasty junior developer:

1. **Making wrong assumptions** without reading code or asking.
2. **Not managing confusion** and pushing through unclear requirements.
3. **Not seeking clarifications** and guessing instead.
4. **Not surfacing inconsistencies** when information conflicts.
5. **Not presenting tradeoffs** and hiding complexity from the user.
6. **Not pushing back** and agreeing to bad ideas to avoid friction.
7. **Sycophancy** such as "Of course!" to poor suggestions.
8. **Overcomplicating** with unnecessary abstraction.
9. **Bloating abstractions** by over-configuring for a hypothetical future.
10. **Not cleaning up** dead code after refactoring.
11. **Modifying orthogonal code** while fixing a focused bug.
12. **Removing without understanding** code that only appears unused.

---

## 10) Local Override Mechanism

Use optional local overrides only for stricter personal or machine-specific constraints.

- Template file: `AGENTS.override.template.md`
- Local file: `AGENTS.override.local.md`

`AGENTS.override.local.md` must remain untracked and must not weaken shared or repo rules.

---

## 11) Done Output Format for Agents

For coding tasks, return:

1. Atomic plan
2. Cursor prompt
3. Test plan (exact commands + manual checks)
4. Docs updates (when relevant)
5. Conventional commit suggestion
6. Additional validation notes (if any)

---

## Source: `quit-weed`

### Source File: `/home/kevin/coding/quit-weed/AGENTS-BASE.md`

_Selection note: Included the referenced generic base file and omitted the project-specific AGENTS.md companion._

# AGENTS-BASE.md

Reusable instructions for AI assistants — copy this file to any project and create a project-specific `AGENTS.md` that extends it.

---

## 0) Prime Directive

- **Do not break production behavior** unless explicitly asked.
- Prefer **small, safe, reversible** changes.
- Default to minimal diffs — avoid "drive-by refactors" in feature commits.
- **Surgical precision** — Touch only what's needed. Don't remove comments you don't understand, don't "clean up" orthogonal code, don't delete things that seem unused without asking.

---

## 1) Workflow Orchestration

### 1.1 Plan Mode Default
- Enter plan mode for ANY non-trivial task (3+ steps or architectural decisions)
- If something goes sideways, STOP and re-plan immediately — don't keep pushing
- Use plan mode for verification steps, not just building
- Write detailed specs upfront to reduce ambiguity

### 1.2 Subagent Strategy
- Use subagents liberally to keep main context window clean
- Offload research, exploration, and parallel analysis to subagents
- For complex problems, throw more compute at it via subagents
- One task per subagent for focused execution

### 1.3 Self-Improvement Loop
- After ANY correction from the user: update `tasks/lessons.md` with the pattern
- Write rules for yourself that prevent the same mistake
- Ruthlessly iterate on these lessons until mistake rate drops
- Review lessons at session start for relevant project

### 1.4 Verification Before Done
- Never mark a task complete without proving it works
- Diff behavior between main and your changes when relevant
- Ask yourself: "Would a staff engineer approve this?"
- Run tests, check logs, demonstrate correctness

### 1.5 Demand Elegance (Balanced)
- For non-trivial changes: pause and ask "is there a more elegant way?"
- If a fix feels hacky: "Knowing everything I know now, implement the elegant solution"
- Skip this for simple, obvious fixes — don't over-engineer
- Challenge your own work before presenting it

### 1.6 Autonomous Bug Fixing
- When given a bug report: just fix it. Don't ask for hand-holding
- Point at logs, errors, failing tests — then resolve them
- Zero context switching required from the user
- Go fix failing CI tests without being told how

---

## 2) Task Management

1. **Plan First**: Write plan to `tasks/todo.md` with checkable items
2. **Verify Plan**: Check in before starting implementation
3. **Track Progress**: Mark items complete as you go
4. **Explain Changes**: High-level summary at each step
5. **Document Results**: Add review section to `tasks/todo.md`
6. **Capture Lessons**: Update `tasks/lessons.md` after corrections

> **Note:** These are guidelines — `tasks/` files may not exist in all projects. Adapt to project structure.

---

## 3) Problem-Solving Approach

For non-trivial tasks, use recursive decomposition:

### 3.1 Assumption Surfacing
Before implementation, explicitly state assumptions:
```
My assumptions:
1. [Assumption about requirements]
2. [Assumption about existing behavior]
3. [Assumption about scope]

Proceeding with implementation. Let me know if any assumptions are wrong.
```

### 3.2 Confusion Management
When encountering inconsistencies or unclear requirements:
1. **STOP** — Don't push through confusion
2. **Name it** — "I'm confused because X says Y but Z suggests W"
3. **Wait** — Ask for clarification before proceeding
4. **Never assume** — Guessing leads to wasted work and bugs

### 3.3 Push Back When Warranted
You are not a yes-machine. When you see problems:
- Point out issues directly: "This approach has a problem: [specific issue]"
- Propose alternatives: "Instead, we could [alternative] which avoids [issue]"
- Accept override: If user insists, proceed with their choice
- Don't be sycophantic — "Of course!" to bad ideas helps no one

### Process (Recursive Decomposition)
1. **Decompose** — Break the problem into independent subcomponents. Identify top-level structure first.
2. **Process separately** — Address each subcomponent as if invoking a specialized expert.
3. **Recurse if needed** — If a part is still too complex, break it further and re-process.
4. **Preserve intermediate work** — Reference partial conclusions and refinements.
5. **Integrate** — Synthesize all parts into a unified solution. Avoid unsubstantiated leaps.

### Strict rules
- Do NOT attempt single-pass answers for complex tasks.
- Pause and refine ambiguous/incomplete parts before advancing.
- Prioritize structure and verification over speed.
- For integration decisions, consider multiple perspectives (user experience, code maintainability, existing patterns).

### Core Principles
- **Simplicity First**: Make every change as simple as possible. Impact minimal code.
- **No Laziness**: Find root causes. No temporary fixes. Senior developer standards.
- **Minimal Impact**: Changes should only touch what's necessary. Avoid introducing bugs.

### Atomic Reasoning Structure

For tasks requiring precise, verifiable outputs, use atomic decomposition:

```
<atomic_context>
[Role/persona + background knowledge + persistent rules]
</atomic_context>

<atomic_task>
[Single, clear objective. One focused goal only.]
</atomic_task>

<atomic_constraints>
- [Hard limits, formats, verification rules]
- [e.g., No hallucinations; max length X; must match existing patterns]
</atomic_constraints>

<atomic_variables>
{{variable1}}: [description or value]
{{variable2}}: [etc.]
</atomic_variables>

<atomic_process>
1. Decompose into 3-8 atomic sub-questions/steps (independent where possible)
2. Solve each atom individually with high accuracy
3. Verify each atom's output against constraints
4. Integrate into unified solution (resolve dependencies, synthesize)
5. Recurse on any unresolved atom if needed
</atomic_process>
```

**Output format:**
- Atomic decomposition list (brief bullets)
- Solved atoms (numbered)
- Final synthesized solution

---

## 4) Workflow Principles

### 4.1 Read before you write
- Read relevant files before modifying (use Read tool, not assumptions).
- Check project roadmap/TODO for current priorities.
- Infer patterns from existing code before introducing new ones.

### 4.2 Make changes in small commits
- Keep commits focused (one feature, one intent).
- Use [Conventional Commits](https://www.conventionalcommits.org/) format.
- Prefer a follow-up refactor commit after behavior is stable.

### 4.3 Update docs with changes
- Documentation updates are **required** after feature implementation.
- If behavior changes, docs must change in the same PR.

### 4.4 Test-first leverage
- Write the test that defines success first
- Implement until the test passes
- The test is your specification — if you can't write it, requirements are unclear

### 4.5 Naive then optimize
- Get a correct, naive version working first
- Optimize only after behavior is verified
- Preserve behavior during optimization (tests should still pass)

### 4.6 Inline planning for small tasks
For tasks too small for full plan mode but non-trivial:
```
Plan:
1. [Step one]
2. [Step two]
3. [Verify by...]

Executing...
```
This keeps you on track without heavyweight ceremony.

---

## 5) Code Principles

### 5.1 Keep it simple
- **Actively resist overcomplication** — simpler is almost always better.
- Avoid over-engineering — only add what's directly needed.
- Don't add comments to code you didn't change.
- Three similar lines > premature abstraction.
- Don't design for hypothetical future requirements.

**Self-check questions:**
- "Would a new team member understand this immediately?"
- "Am I adding this because it's needed or because it's 'proper'?"
- "Can I delete anything here and still meet requirements?"

### 5.2 Follow existing patterns
- Match the style of surrounding code.
- Use established project conventions before introducing new ones.
- When in doubt, find a similar feature and mirror its structure.

### 5.3 Type safety (for typed languages)
- Define types/interfaces in the project's designated location.
- Run type checking before commits.
- Prefer explicit types over `any` or implicit inference for public APIs.

### 5.4 Dead code hygiene
After refactoring or removing features:
- Explicitly list code that appears unused
- Ask before removing: "These appear unused after this change: [list]. Should I remove them?"
- Don't silently delete things that might have external callers or tests

---

## 6) PR Checklist (Base)

Before merging:
- [ ] Type checking passes (if applicable)
- [ ] Documentation updated
- [ ] Tested manually or via automated tests
- [ ] Conventional commit message used
- [ ] No unnecessary churn or drive-by refactors

---

## 7) What "Done" Looks Like (Base)

A feature is complete when:

1. **Implementation** — Feature works as specified
2. **Types** — Interfaces/types added if applicable
3. **Docs updated** — Relevant documentation reflects the change
4. **Ready to test** — Another developer can verify it works

---

## 8) Communication Standards

### 8.1 Be direct about problems
- State issues clearly: "This will cause X problem because Y"
- Don't soften bad news — clarity helps the user make decisions
- Quantify when possible: "~200ms latency" not "might be slower"

### 8.2 When stuck, say so
- "I'm stuck on X. I've tried A, B, C. None worked because [reasons]."
- Don't spin — surface blockers early
- Propose next steps or ask for help

### 8.3 Change summary format
After making changes, summarize clearly:
```
CHANGES MADE:
- [What was added/modified]
- [Files affected]

DIDN'T TOUCH:
- [Related code left unchanged and why]

CONCERNS:
- [Any issues, risks, or follow-up items]
```

---

## 9) Failure Modes to Avoid

Quick reference — these are the mistakes of a hasty junior developer:

1. **Making wrong assumptions** — without reading code or asking
2. **Not managing confusion** — pushing through unclear requirements
3. **Not seeking clarifications** — guessing instead of asking
4. **Not surfacing inconsistencies** — ignoring conflicting information
5. **Not presenting tradeoffs** — hiding complexity from the user
6. **Not pushing back** — agreeing to bad ideas to avoid friction
7. **Sycophancy** — "Of course!" or "Great idea!" to poor suggestions
8. **Overcomplicating** — adding unnecessary abstraction or flexibility
9. **Bloating abstractions** — making simple things configurable "for the future"
10. **Not cleaning up** — leaving dead code after refactoring
11. **Modifying orthogonal code** — "improving" unrelated code while fixing bugs
12. **Removing without understanding** — deleting code that seems unused without checking

---

## Source: `nomar-stocks`

### Source File: `/home/kevin/coding/nomar-stocks/AGENTS.md`

_Selection note: Excluded the project launch checklist section._

# AGENTS-BASE.md

Reusable instructions for AI assistants — copy this file to any project and create a project-specific `AGENTS.md` that extends it.

---

## 0) Prime Directive

- **Do not break production behavior** unless explicitly asked.
- Prefer **small, safe, reversible** changes.
- Default to minimal diffs — avoid "drive-by refactors" in feature commits.

---

## 1) Problem-Solving Approach

For non-trivial tasks, use recursive decomposition:

### Process
1. **Decompose** — Break the problem into independent subcomponents. Identify top-level structure first.
2. **Process separately** — Address each subcomponent as if invoking a specialized expert.
3. **Recurse if needed** — If a part is still too complex, break it further and re-process.
4. **Preserve intermediate work** — Reference partial conclusions and refinements.
5. **Integrate** — Synthesize all parts into a unified solution. Avoid unsubstantiated leaps.

### Strict rules
- Do NOT attempt single-pass answers for complex tasks.
- Pause and refine ambiguous/incomplete parts before advancing.
- Prioritize structure and verification over speed.
- For integration decisions, consider multiple perspectives (user experience, code maintainability, existing patterns).

### Atomic Reasoning Structure

For tasks requiring precise, verifiable outputs, use atomic decomposition:

```
<atomic_context>
[Role/persona + background knowledge + persistent rules]
</atomic_context>

<atomic_task>
[Single, clear objective. One focused goal only.]
</atomic_task>

<atomic_constraints>
- [Hard limits, formats, verification rules]
- [e.g., No hallucinations; max length X; must match existing patterns]
</atomic_constraints>

<atomic_variables>
{{variable1}}: [description or value]
{{variable2}}: [etc.]
</atomic_variables>

<atomic_process>
1. Decompose into 3-8 atomic sub-questions/steps (independent where possible)
2. Solve each atom individually with high accuracy
3. Verify each atom's output against constraints
4. Integrate into unified solution (resolve dependencies, synthesize)
5. Recurse on any unresolved atom if needed
</atomic_process>
```

**Output format:**
- Atomic decomposition list (brief bullets)
- Solved atoms (numbered)
- Final synthesized solution

---

## 2) Workflow Principles

### 2.1 Read before you write
- Read relevant files before modifying (use Read tool, not assumptions).
- Check project roadmap/TODO for current priorities.
- Infer patterns from existing code before introducing new ones.

### 2.2 Make changes in small commits
- Keep commits focused (one feature, one intent).
- Use [Conventional Commits](https://www.conventionalcommits.org/) format.
- Prefer a follow-up refactor commit after behavior is stable.

### 2.3 Update docs with changes
- Documentation updates are **required** after feature implementation.
- If behavior changes, docs must change in the same PR.

---

## 3) Code Principles

### 3.1 Keep it simple
- Avoid over-engineering — only add what's directly needed.
- Don't add comments to code you didn't change.
- Three similar lines > premature abstraction.

### 3.2 Follow existing patterns
- Match the style of surrounding code.
- Use established project conventions before introducing new ones.
- When in doubt, find a similar feature and mirror its structure.

### 3.3 Type safety (for typed languages)
- Define types/interfaces in the project's designated location.
- Run type checking before commits.
- Prefer explicit types over `any` or implicit inference for public APIs.

---

## 4) PR Checklist (Base)

Before merging:
- [ ] Type checking passes (if applicable)
- [ ] Documentation updated
- [ ] Tested manually or via automated tests
- [ ] Conventional commit message used
- [ ] No unnecessary churn or drive-by refactors

---

## 5) What "Done" Looks Like (Base)

A feature is complete when:

1. **Implementation** — Feature works as specified
2. **Types** — Interfaces/types added if applicable
3. **Docs updated** — Relevant documentation reflects the change
4. **Ready to test** — Another developer can verify it works

---

## Source: `stb-mkt-all/prod-fix`

### Source File: `/home/kevin/coding/stb-mkt-all/prod-fix/AGENTS.md`

_Selection note: Kept only the repo-agnostic sections from the mixed project-specific file._

## Instruction discovery & precedence (important)
- Keep a **root** `AGENTS.md` at the repository top-level for shared rules.
- For larger repos, add **nested** `AGENTS.md` files in subdirectories to provide tighter, local rules for that area.
- If tool support differs, assume **root `AGENTS.md` always applies**, and nested files can only *add* stricter local constraints (never loosen global rules).

---

## 0) Prime directive
- **Do not break production behavior** unless explicitly asked.
- Prefer **small, safe, reversible** changes.
- Default to minimal diffs.

## 1) Workflow (how to work in this repo)

### 1.2 Make changes in small commits
- Keep commits focused (one change, one intent).
- Avoid “drive-by refactors” in feature commits.
- Prefer a follow-up refactor commit after behavior is stable.

### 1.3 Update docs as part of the change
- If behavior changes, update docs in the same PR (or immediately after if move-only).
- If new commands or admin flows are added, document:
  - Setup
  - How to run
  - How to test
  - Known gotchas / risks
- Keep docs short but precise.

## 2) Output format requirements (what agents should return)
When asked for implementation help, produce:

1. **Atomic plan** (short, ordered)
2. **Cursor prompt** (ready to paste, includes file paths)
3. **Test plan** (exact commands + manual steps)
4. **Docs updates** (which files to edit)
5. **Conventional Commit** suggestion

## 3) Repo conventions
### 3.1 Style
- Prefer readable, explicit code over cleverness.
- Use type hints and docstrings.
- Handle errors defensively with actionable logs.

### 3.2 Naming
- Avoid ambiguous abbreviations unless already established in code.

### 3.3 Persistence
- Any stored state must be versioned or resilient to schema drift.
- Validate config / persisted data on load and fail loudly with clear error messages.

### 4.1 Keep files small and focused (required)
- Prefer **multiple cohesive modules** over a single “god file”.
- **Target size:** keep most `.py` files under ~800 lines. If a file crosses ~1000 lines *or* spans multiple concerns (commands + UI + background tasks), split it.
- **Hard rule:** do not add new features to a file that is already >1000 lines unless the same change also **splits/organizes** it.

## 8) Logging & troubleshooting
- Support verbose logging mode that writes to `log/` (gitignored).
- Default logging must still capture critical errors.

---

## Source: `stb-mkt-all/production`

### Source File: `/home/kevin/coding/stb-mkt-all/production/AGENTS.md`

_Selection note: Kept only the repo-agnostic sections from the mixed project-specific file._

## Instruction discovery & precedence (important)
- Keep a **root** `AGENTS.md` at the repository top-level for shared rules.
- For larger repos, add **nested** `AGENTS.md` files in subdirectories to provide tighter, local rules for that area.
- If tool support differs, assume **root `AGENTS.md` always applies**, and nested files can only *add* stricter local constraints (never loosen global rules).

---

## 0) Prime directive
- **Do not break production behavior** unless explicitly asked.
- Prefer **small, safe, reversible** changes.
- Default to minimal diffs.

## 1) Workflow (how to work in this repo)

### 1.2 Make changes in small commits
- Keep commits focused (one change, one intent).
- Avoid “drive-by refactors” in feature commits.
- Prefer a follow-up refactor commit after behavior is stable.

### 1.3 Update docs as part of the change
- If behavior changes, update docs in the same PR (or immediately after if move-only).
- If new commands or admin flows are added, document:
  - Setup
  - How to run
  - How to test
  - Known gotchas / risks
- Keep docs short but precise.

## 2) Output format requirements (what agents should return)
When asked for implementation help, produce:

1. **Atomic plan** (short, ordered)
2. **Cursor prompt** (ready to paste, includes file paths)
3. **Test plan** (exact commands + manual steps)
4. **Docs updates** (which files to edit)
5. **Conventional Commit** suggestion

## 3) Repo conventions
### 3.1 Style
- Prefer readable, explicit code over cleverness.
- Use type hints and docstrings.
- Handle errors defensively with actionable logs.

### 3.2 Naming
- Avoid ambiguous abbreviations unless already established in code.

### 3.3 Persistence
- Any stored state must be versioned or resilient to schema drift.
- Validate config / persisted data on load and fail loudly with clear error messages.

### 4.1 Keep files small and focused (required)
- Prefer **multiple cohesive modules** over a single “god file”.
- **Target size:** keep most `.py` files under ~800 lines. If a file crosses ~1000 lines *or* spans multiple concerns (commands + UI + background tasks), split it.
- **Hard rule:** do not add new features to a file that is already >1000 lines unless the same change also **splits/organizes** it.

## 8) Logging & troubleshooting
- Support verbose logging mode that writes to `log/` (gitignored).
- Default logging must still capture critical errors.

---

## Source: `stb-mkt-all/history`

### Source File: `/home/kevin/coding/stb-mkt-all/history/AGENTS.md`

_Selection note: Kept only the repo-agnostic sections from the mixed project-specific file._

## Instruction discovery & precedence (important)
- Keep a **root** `AGENTS.md` at the repository top-level for shared rules.
- For larger repos, add **nested** `AGENTS.md` files in subdirectories to provide tighter, local rules for that area.
- If tool support differs, assume **root `AGENTS.md` always applies**, and nested files can only *add* stricter local constraints (never loosen global rules).

---

## 0) Prime directive
- **Do not break production behavior** unless explicitly asked.
- Prefer **small, safe, reversible** changes.
- Default to minimal diffs.

## 1) Workflow (how to work in this repo)

### 1.2 Make changes in small commits
- Keep commits focused (one change, one intent).
- Avoid “drive-by refactors” in feature commits.
- Prefer a follow-up refactor commit after behavior is stable.

### 1.3 Update docs as part of the change
- If behavior changes, update docs in the same PR (or immediately after if move-only).
- If new commands or admin flows are added, document:
  - Setup
  - How to run
  - How to test
  - Known gotchas / risks
- Keep docs short but precise.

## 2) Output format requirements (what agents should return)
When asked for implementation help, produce:

1. **Atomic plan** (short, ordered)
2. **Cursor prompt** (ready to paste, includes file paths)
3. **Test plan** (exact commands + manual steps)
4. **Docs updates** (which files to edit)
5. **Conventional Commit** suggestion

## 3) Repo conventions
### 3.1 Style
- Prefer readable, explicit code over cleverness.
- Use type hints and docstrings.
- Handle errors defensively with actionable logs.

### 3.2 Naming
- Avoid ambiguous abbreviations unless already established in code.

### 3.3 Persistence
- Any stored state must be versioned or resilient to schema drift.
- Validate config / persisted data on load and fail loudly with clear error messages.

### 4.1 Keep files small and focused (required)
- Prefer **multiple cohesive modules** over a single “god file”.
- **Target size:** keep most `.py` files under ~800 lines. If a file crosses ~1000 lines *or* spans multiple concerns (commands + UI + background tasks), split it.
- **Hard rule:** do not add new features to a file that is already >1000 lines unless the same change also **splits/organizes** it.

## 8) Logging & troubleshooting
- Support verbose logging mode that writes to `log/` (gitignored).
- Default logging must still capture critical errors.
