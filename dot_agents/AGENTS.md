# Agent Instructions

## AGENTS.md Files

- Write concise instructions optimized for agents; prefer bullets with explicit actions and conditions.
- Keep each `AGENTS.md` file under 300 lines.
- Do not repeat user-scoped `AGENTS.md` instructions in project-scoped `AGENTS.md` files.

## Code Conventions

### TypeScript, JavaScript, and Bun

- Prefer Bun over npm for package management and over Node.js for TypeScript/JavaScript execution.
- When adding dependencies, verify each package's latest release and use that version.
- Always validate TypeScript with Biome's linter and formatter.
- For Biome and Bun tools, prefer project-local or PATH-installed executables and project scripts; use `bunx` only when the tool is unavailable locally.
- Run one-off TypeScript/JavaScript inline with a quoted heredoc (`bun - <<'EOF'`); do not create temporary script files.

### Shell and Bash

- Prefer Bun for scripting and automation, including complex workflows.
- For complex shell scripts, prefer Bash over `sh`.
- Verify shell scripts with ShellCheck.

### Temporary Files

- Run Bun inside the sandbox using Bun's default temporary directory.
- If Bun cannot access its temporary directory, configure it to use a unique sandbox-writable directory; clean it afterward.
- Use unique names for temporary files and directories; clean up only those created by the script.
- Never delete `/tmp` or another broad path.

## Git Commits

- Format: Conventional Commits, `type(scope): description`.
- When committing, split changes by scope; push after creating all scoped commits.
- Allowed types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`.
- Subject: at most 110 characters; imperative mood; no final period.
- Prefer lowercase commit messages.

## GitHub

- Use GitHub CLI (`gh`) first; use GitHub MCP only when `gh` is unavailable or insufficient.

### GitHub Actions

- When creating or updating workflows, verify each action's latest release and use that version.
- Validate GitHub Actions workflows with `actionlint`.
