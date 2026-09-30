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

## MCP

- Prefer MDN MCP for HTML, CSS, JavaScript, Web API documentation, and browser compatibility; fall back to web search when MDN MCP is unavailable or insufficient.
- Prefer GoDoc MCP for Go package and API documentation; fall back to web search when GoDoc MCP is unavailable or insufficient.
- Prefer Cloudflare documentation MCP (`cloudflare-docs`) for Cloudflare product and API documentation; fall back to web search when it is unavailable or insufficient.
- Use Context7 MCP for current library, framework, SDK, API, CLI, and cloud service documentation, even for familiar tools; prefer it over web search.
- Use the registered Firefox DevTools MCP (`firefox-devtools`) when inspecting or debugging pages in an existing Firefox session.
- Use the registered Chrome DevTools MCP (`chrome-devtools`) when inspecting or debugging pages in an existing Chrome session via CDP.

### Context7

- Use for API syntax, configuration, migrations, library-specific debugging, setup, and CLI usage.
- Skip for refactoring, scripts from scratch, business logic debugging, code review, and general programming concepts.

1. Call `resolve-library-id` with the library name and documentation question; skip only when the user supplies an exact `/org/project` ID.
2. Select by name match, relevance, snippet count, source reputation (High/Medium preferred), and benchmark score. Retry alternate names or queries if needed; use version-specific IDs for requested versions.
3. Call `query-docs` with the selected ID and a specific question. Query each concept separately unless asking how concepts interact.
4. Answer from the fetched documentation.

## Browser Automation Setup

- Do not launch or restart browsers; ask the user to prepare the browser session.
- Use registered MCP tools; Codex manages MCP server startup.
- Verify attachment with the browser MCP's `list_pages` tool.

### Firefox: Marionette and WebDriver BiDi

- Ask the user to quit Firefox normally, then start it from a desktop terminal with `firefox --marionette --remote-debugging-port 9223`; both flags are required.
- For Snap Firefox, have the user run `snap run firefox --marionette --remote-debugging-port 9223` outside the agent sandbox. Snap's PID namespace mismatch can cause the `cannot create transient scope` / `kernel thread, refusing` error.
- Marionette uses port `2828`; WebDriver BiDi uses `9223` to avoid Chrome's `9222`. The registered MCP attaches with `--connect-existing`.

### Chrome: CDP

- Ask the user to open Chrome 144+, enable remote debugging at `chrome://inspect/#remote-debugging`, and allow the debugging connection prompt.
- The registered MCP attaches to the running Chrome session via CDP with `--autoConnect`.
