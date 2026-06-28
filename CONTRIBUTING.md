# Contributing to PixelForge

Thank you for your interest in contributing to PixelForge.

PixelForge is a modular Bash prompt framework focused on clean architecture, extensibility and learning.

This project values clarity, small increments and documentation-driven development.

---

# Philosophy

PixelForge follows a simple workflow:

```text
Understand
        ↓
Design
        ↓
Document
        ↓
Implement
        ↓
Review
```

Contributions should preserve the architecture and keep the project easy to understand.

---

# Before Contributing

Before changing the code, please read:

* `README.md`
* `docs/architecture.md`
* `docs/coding-style.md`
* `docs/engineering-checklist.md`
* `docs/theme-api.md`
* `docs/widget-api.md`

For architectural decisions, read:

* `docs/adr/`

---

# Development Rules

Every contribution should follow these rules:

* keep changes small and focused;
* avoid unnecessary abstractions;
* preserve the separation of responsibilities;
* update documentation when behavior or architecture changes;
* prefer readability over cleverness;
* avoid external dependencies unless clearly justified.

---

# Architecture Rules

PixelForge is organized into modules.

Each module exposes a single public entry point:

```text
index.sh
```

Do not source internal module files directly from another module.

Use module entry points instead.

Example:

```bash
source "${PIXELFORGE_ROOT}/src/widgets/index.sh"
```

---

# Providers

Providers collect data.

They may read the system or execute commands.

They must:

* write data to the Render Model;
* never render output;
* never use theme tokens;
* never print prompt content.

---

# Widgets

Widgets render data.

They must:

* read only from the Render Model;
* never execute system commands;
* never modify the Render Model;
* never hardcode icons, colors or spacing;
* use Theme API tokens.

A widget exposes exactly one public function:

```bash
pf_widget_<name>_render
```

Private helpers must use:

```bash
_pf_widget_<name>_*
```

---

# Themes

Themes define visual identity.

A theme may provide:

* icons;
* spacing;
* semantic colors;
* optional visual tokens.

Themes should not contain business logic.

---

# Branching

Use focused branches.

Recommended branch names:

```text
feat/<feature-name>
refactor/<area-name>
docs/<topic>
fix/<bug-name>
```

Examples:

```text
feat/gameboy-theme
refactor/theme-loader
docs/widget-api
fix/git-sync-indicators
```

---

# Commit Style

Use short and explicit commit messages.

Recommended format:

```text
type(scope): message
```

Examples:

```text
feat(theme): add gameboy skin
refactor(core): introduce module indexes
docs(api): document widget lifecycle
fix(git): correct ahead indicator rendering
```

---

# Pull Request Checklist

Before merging, verify:

* [ ] the prompt still loads;
* [ ] the change is small and focused;
* [ ] the architecture remains coherent;
* [ ] documentation is updated when needed;
* [ ] shell scripts remain readable;
* [ ] no unnecessary dependency was introduced.

For manual validation:

```bash
source pixelforge.sh
```

Then test the prompt in:

* a normal directory;
* a Git repository;
* a dirty Git repository.

---

# Documentation

Documentation is part of the project.

Update documentation when changing:

* architecture;
* public APIs;
* theme tokens;
* widget conventions;
* lifecycle behavior.

Use ADRs for important architectural decisions.

---

# Code Style

PixelForge targets Bash.

General rules:

* use `#!/usr/bin/env bash`;
* use `local` for local variables;
* quote variable expansions;
* prefer clear functions;
* keep one responsibility per file;
* avoid hidden side effects.

See `docs/coding-style.md` for details.

---

# Design Rule

Before adding a feature, ask:

```text
Does this fit naturally into the existing architecture?
```

If the answer is no, reconsider the design before coding.

---

# Project Goal

PixelForge is not only a prompt.

It is a learning project about Bash, rendering pipelines, modular architecture and maintainable software design.

Contributions should help preserve that goal.
