# PixelForge

> A modular Bash prompt engine inspired by pixel art, retro terminals and clean software architecture.

PixelForge is not just another Bash theme.

It is a learning project designed to understand how modern software architecture principles can be applied to shell scripting.

The project explores:

* Bash programming
* PS1 and PROMPT_COMMAND
* ANSI escape sequences
* UTF-8 rendering
* Prompt architecture
* Software design
* Separation of responsibilities
* Documentation-driven development

The philosophy is the same as the Linux Engineering Book:

```text
Understand
↓

Experiment
↓

Document
↓

Test
↓

Use
↓

Improve
```

---

# Goals

PixelForge aims to build a prompt engine that is:

* modular;
* maintainable;
* extensible;
* fun to customize;
* pleasant to study.

The project favors clarity over cleverness.

---

# Features

Current features include:

* modular rendering pipeline;
* provider/widget architecture;
* Render Model;
* Theme API;
* configurable layouts;
* configurable skins;
* Git integration;
* dynamic prompt updates using PROMPT_COMMAND.

Future versions will introduce:

* ANSI color palettes;
* additional themes;
* optional widgets;
* performance improvements;
* automated testing.

---

# Architecture

PixelForge follows a layered architecture.

```text
PROMPT_COMMAND
        │
        ▼
pf_prompt_update()
        │
        ▼
Engine
        │
        ▼
Registry
        │
        ▼
Providers
        │
        ▼
Render Model
        │
        ▼
Widgets
        │
        ▼
Layouts
        │
        ▼
Theme
        │
        ▼
PS1
```

Each layer has a single responsibility.

---

# Project Structure

```text
src/
├── core/
├── providers/
├── widgets/
├── layouts/
├── skins/
└── utils/
```

The complete architecture is documented in:

* docs/architecture.md

---

# Getting Started

Clone the repository.

```bash
git clone <repository>
```

Load PixelForge:

```bash
source pixelforge.sh
```

The prompt will automatically refresh through:

```bash
PROMPT_COMMAND
```

---

# Documentation

The project documentation is located in `docs/`.

Core documents include:

* architecture.md
* lifecycle.md
* theme-api.md
* principles.md
* engineering-checklist.md
* coding-style.md
* adr/

The documentation is considered the source of truth.

---

# Roadmap

Current priorities:

* Theme API completion
* ANSI color system
* additional layouts
* additional skins
* testing
* ShellCheck integration

---

# License

MIT
