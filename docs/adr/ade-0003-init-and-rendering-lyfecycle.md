# ADR-0003 — Initialization and Rendering Lifecycle

Status: Accepted

Date: 2026-06-26

## Context

PixelForge is loaded once by Bash, but the prompt must be refreshed every time a new prompt is displayed.

Some data is stable during a shell session.

Examples:

* active skin;
* configuration;
* required files.

Other data is dynamic.

Examples:

* current directory;
* Git state;
* dirty state;
* ahead / behind state.

Initially, computing the prompt only once caused stale values after commands such as `cd`.

## Decision

PixelForge separates initialization and rendering.

Initialization is handled by:

```bash
pf_initialize
```

Rendering is handled by:

```bash
pf_prompt_update
```

`pf_prompt_update` is connected to Bash through:

```bash
PROMPT_COMMAND="pf_prompt_update"
```

Rule:

```text
Stable data belongs to initialization.
Dynamic data belongs to rendering.
```

## Consequences

Benefits:

* the prompt updates correctly after directory changes;
* the skin is not reloaded at every render;
* the lifecycle is explicit;
* performance is easier to reason about.

Trade-offs:

* contributors must understand the difference between initialization and rendering;
* dynamic features must not be added to initialization by mistake.

This decision defines the lifecycle of PixelForge.
