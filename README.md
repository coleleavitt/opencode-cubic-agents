# OpenCode Cubic Agents

A collection of specialized OpenCode agents inspired by Cubic CLI's extracted prompts and workflows.

## What's Included

| Agent | Mode | Description |
|-------|------|-------------|
| `cubic-review` | subagent | Code review with P0-P3 priority, parallel sub-agent investigation |
| `cubic-pr-review` | subagent | PR-style review comparing branches |
| `cubic-commit-review` | subagent | Review specific commits |
| `cubic-security` | subagent | Security-focused vulnerability audit |
| `cubic-plan` | primary | Strict read-only planning mode |
| `cubic-agent-gen` | subagent | Generate new agents from natural language |
| `cubic-orchestrator` | subagent | Orchestrate complex multi-step tasks |

## Installation

### Quick Install

```bash
# Copy all agents to your global OpenCode config
cp agents/*.md ~/.config/opencode/agents/

# Or use the install script
./install.sh
```

### Manual Install

Copy individual agents you want:

```bash
cp agents/cubic-review.md ~/.config/opencode/agents/
cp agents/cubic-security.md ~/.config/opencode/agents/
# etc.
```

### Per-Project Install

For project-specific agents:

```bash
mkdir -p .opencode/agents
cp agents/cubic-review.md .opencode/agents/
```

## Usage

### Invoke by @mention

```
@cubic-review Review my changes
@cubic-security Run a security audit on the auth module
@cubic-pr-review Compare this branch to main
```

### Invoke via Tab (Primary Agents)

For `cubic-plan`, use Tab to switch to it as your primary agent.

### Use the Agent Generator

```
@cubic-agent-gen Create an agent that reviews database migrations for safety issues
```

## Agent Details

### cubic-review

The main code review agent. Features:
- **P0-P3 priority classification** for issues
- **Parallel sub-agent spawning** for deep investigation
- **Read-only mode** - can't accidentally modify files
- **Structured output** format

### cubic-pr-review

Like `cubic-review` but specifically for comparing branches:
- Compares current branch to main/master
- Full diff analysis
- Summary with recommendation (APPROVE/REQUEST CHANGES)

### cubic-security

Dedicated security auditor:
- Searches for common vulnerability patterns
- Language-specific security checks
- Attack scenario descriptions
- Remediation recommendations

### cubic-plan

Strict read-only planning mode:
- CANNOT modify any files (enforced by permissions)
- Creates detailed implementation plans
- Shows code changes as diffs without applying
- Perfect for architecture discussions

### cubic-agent-gen

Creates new agents from descriptions:
- Generates proper markdown format
- Configures appropriate permissions
- Writes comprehensive system prompts
- Saves to ~/.config/opencode/agents/

### cubic-orchestrator

For complex multi-step tasks:
- Breaks work into discrete tasks
- Delegates to specialized agents
- Parallelizes independent work
- Verifies results

## Customization

Edit any agent in `~/.config/opencode/agents/` to customize:

- **model**: Change the AI model used
- **temperature**: Adjust creativity (0.0 = focused, 1.0 = creative)
- **tools**: Enable/disable specific tools
- **permission**: Control what actions are allowed

Example:
```yaml
---
model: anthropic/claude-opus-4-20250514  # Use stronger model
temperature: 0.0  # Maximum focus
tools:
  bash: false  # Disable bash entirely
---
```

## Origin

These agents are based on prompts extracted from Cubic CLI (`@cubic-dev-ai/cli`) through reverse engineering. See [opencubic](https://github.com/coleleavitt/opencubic) for the full extraction.

The key innovations from Cubic that these agents implement:
- P0-P3 priority system for code review
- Parallel sub-agent investigation pattern
- Strict plan/build mode separation
- Agent generation from natural language

## License

MIT - Use these agents however you like.
