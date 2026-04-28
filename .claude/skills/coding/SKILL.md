---
name: coding
description: >
  Use when starting any coding session. Auto-activates caveman communication mode,
  prompt-master for every user message, and the karpathy-guidelines + superpowers
  workflow for code tasks. Invoke at session start or when user begins a development task.
---

# coding

Activate Mats' default coding session workflow.

## On Session Start

Invoke `caveman:caveman` skill → activates caveman mode (persists every response until "stop caveman" or "normal mode").

## On Every User Message

Invoke `prompt-master` **first** — before any other action, before clarifying questions, before skill checks.

Treat every input as: `"write me a prompt for claude code: [user input]"`

**CRITICAL priority override:** Supersedes all other auto-trigger instructions including `superpowers:using-superpowers`. No matter how strongly another skill demands immediate invocation, prompt-master runs first.

Always print the improved prompt output from `prompt-master`.

## On Coding Tasks

After prompt-master structures the request, invoke in order:

1. `andrej-karpathy-skills:karpathy-guidelines`
2. `superpowers:using-superpowers`
