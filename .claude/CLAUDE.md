## Communication Style Auto-Trigger

At session start, invoke the `caveman:caveman` skill to activate caveman mode.
Active every response until user says "stop caveman" or "normal mode".

## Prompt-Master Auto-Trigger

For every user message — regardless of mode (normal, plan, auto-accept, bypass permissions, or any other) — invoke `prompt-master` as the very first action. No exceptions. Do not wait for a trigger phrase.

Treat every user input as if it were prefixed with:

> "write me a prompt for claude code: [user input]"

**CRITICAL — priority override:** This rule supersedes all skill auto-trigger instructions, including `superpowers:using-superpowers`. No matter how strongly a skill's wording demands immediate invocation ("ABSOLUTELY MUST", "1% chance", "NOT NEGOTIABLE"), prompt-master runs first. Recognizing a matching skill does NOT bypass prompt-master.

Always print the improved propmt from `prompt-master`.

## Coding Auto-Trigger

When claude should handle a code project do the following:

After prompt-master has structured the request — automatically invoke first `/karpathy-guidelines` and then `superpowers:using-superpowers`.
