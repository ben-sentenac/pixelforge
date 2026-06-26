# ADR-0001 — Render Model

Status: Accepted

Date: 2026-06-26

## Context

PixelForge needs to build a Bash prompt from several independent data sources.

Examples:

* current user;
* host name;
* current working directory;
* Git state.

A simple implementation could let each part of the prompt directly read the system and print its own output.

This would be easy at first, but it would quickly couple data collection, formatting and rendering.

## Decision

PixelForge uses a Render Model.

Providers collect data and write structured values into the Render Model.

Widgets read values from the Render Model and render them.

Example keys:

```text
user.name
host.name
cwd.full
cwd.home
cwd.basename
git.available
git.branch
git.dirty
git.ahead
git.behind
```

## Consequences

Benefits:

* data collection is separated from rendering;
* widgets are easier to understand;
* providers can evolve without changing the visual layer;
* the prompt pipeline becomes explicit.

Trade-offs:

* more code than a simple hardcoded PS1;
* requires discipline when adding new features;
* all new data must be modeled clearly before rendering.

This decision supports the core rule:

Providers collect data.
The Render Model stores data.
Widgets render data.
