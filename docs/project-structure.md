# Project Structure

## Purpose

This document defines the organization of the PixelForge repository.

Its purpose is to ensure that the project remains consistent as it grows by clearly defining the responsibility of every directory.

Every new file, script, document or module should naturally fit into this structure.

When in doubt, this document is the reference.

---

# Repository Overview

```text
pixelforge/
├── .github/
├── docs/
├── examples/
├── scripts/
├── src/
├── tests/
├── LICENSE
├── README.md
├── CHANGELOG.md
├── CONTRIBUTING.md
├── ROADMAP.md
└── pixelforge.sh
```

Each directory has a single responsibility.

---

# Root Files

## README.md

Project presentation.

Contains:

* project overview;
* quick start;
* installation;
* architecture overview;
* links to documentation.

It should stay concise.

---

## ROADMAP.md

Defines the long-term evolution of PixelForge.

It answers:

> Where is the project going?

The roadmap contains planned features only.

Implementation details belong elsewhere.

---

## CHANGELOG.md

Lists released changes.

It reflects what has been delivered.

It never contains future work.

---

## CONTRIBUTING.md

Defines contribution guidelines.

Examples:

* coding conventions;
* commit messages;
* review process;
* development workflow.

---

## LICENSE

Project license.

---

# docs/

Contains every technical document.

No implementation lives here.

Documentation is organized by category.

```text
docs/
├── adr/
├── design/
├── notes/
├── tickets/
└── *.md
```

---

## docs/adr/

Architecture Decision Records.

Each ADR documents a permanent architectural decision.

Examples:

* Render Model
* Theme API
* Widget API
* Module Entry Points

An ADR should only be created once the decision has been validated.

---

## docs/design/

Architecture explorations.

Contains design proposals before implementation.

Typical contents:

* diagrams;
* experiments;
* API proposals;
* alternative designs.

Documents in this directory are exploratory.

Nothing here is considered final.

---

## docs/notes/

Technical notes.

Notes capture knowledge acquired during development.

Examples:

* implementation ideas;
* prototypes;
* experiments;
* research.

Notes may eventually disappear after integration.

---

## docs/tickets/

Technical work items.

A ticket describes:

* a problem;
* an improvement;
* technical debt;
* future work.

Tickets may eventually become:

* an implementation;
* an ADR;
* both.

---

# scripts/

Project tooling.

Examples:

```text
scripts/
├── check.sh
├── format.sh
├── shellcheck.sh
└── smoke.sh
```

Scripts automate development tasks.

They should remain independent and composable.

---

# src/

Framework implementation.

Only production code belongs here.

Architecture:

```text
src/
├── ansi/
├── core/
├── layouts/
├── providers/
├── skins/
├── utils/
└── widgets/
```

Each module exposes a single public entry point:

```text
index.sh
```

Internal files must never be sourced directly outside their module.

---

## ansi/

ANSI abstraction layer.

Responsible for:

* colors;
* styles;
* escape sequences.

---

## core/

Framework engine.

Responsible for:

* initialization;
* rendering;
* registry;
* theme loading;
* prompt updates.

---

## providers/

System data collection.

Providers may:

* execute commands;
* read the operating system;
* populate the Render Model.

Providers never render output.

---

## widgets/

Presentation layer.

Widgets:

* read the Render Model;
* generate visual output;
* never execute system commands.

---

## layouts/

Arrange widgets.

Layouts decide where widgets appear.

They never collect data.

---

## skins/

Visual identity.

A skin defines:

* icons;
* colors;
* spacing;
* borders (future);
* terminal capabilities (future).

A skin never contains business logic.

---

## utils/

Shared utilities.

Only reusable helpers belong here.

---

# tests/

Automated tests.

Tests validate:

* behaviour;
* architecture;
* regressions.

Tests should never duplicate implementation.

---

# examples/

Small examples demonstrating PixelForge features.

Examples are educational.

They are not part of the framework itself.

---

# Repository Principles

Every directory has one responsibility.

Every file has one responsibility.

Architecture comes before features.

Documentation comes before extension.

Prefer explicit organization over implicit conventions.

Small, understandable modules are preferred over large generic files.

---

# Development Workflow

Every significant change follows this lifecycle:

```text
ROADMAP
    ↓
Ticket
    ↓
Design (optional)
    ↓
ADR
    ↓
Implementation
    ↓
Documentation
    ↓
Tests
    ↓
Release
```

This workflow keeps architectural decisions explicit and preserves the long-term maintainability of PixelForge.
