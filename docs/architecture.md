# PixelForge Architecture

Version: 0.1

This document describes the overall architecture of PixelForge.

It is the architectural source of truth for the project.

Implementation details belong to the source code.

Design decisions belong to the ADRs.

---

# Overview

PixelForge is built as a layered rendering engine.

Its primary objective is to separate data collection from presentation.

```text
Operating System
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
ANSI Engine
        │
        ▼
Prompt (PS1)
```

Each layer has a single responsibility.

---

# Module Architecture

The project is organized into independent modules.

```text
src/
├── ansi/
├── core/
├── layouts/
├── providers/
├── skins/
└── widgets/
```

Each module exposes a single public entry point:

```text
index.sh
```

External modules must never source internal files directly.

Instead, they load the module through its `index.sh`.

Example:

```bash
source src/widgets/index.sh
```

---

# Rendering Pipeline

Every prompt refresh follows the same execution flow.

```text
pf_prompt_update
        │
        ▼
pf_engine_render
        │
        ▼
Bootstrap Components
        │
        ▼
Providers
        │
        ▼
Render Model
        │
        ▼
Layout
        │
        ▼
Widgets
        │
        ▼
Theme
        │
        ▼
Prompt
```

The pipeline is deterministic.

Each layer only communicates with the next one.

---

# Core Module

The Core module orchestrates the rendering process.

Responsibilities:

* initialization;
* prompt rendering;
* registry management;
* theme loading;
* renderer orchestration.

The Core module never collects system data.

---

# Providers

Providers are responsible for collecting data.

Examples:

* current user;
* hostname;
* current working directory;
* Git repository state.

Providers write structured values into the Render Model.

Providers never perform rendering.

---

# Render Model

The Render Model is the boundary between data collection and presentation.

It stores structured values.

Example:

```text
user.name
host.name
cwd.home
git.branch
git.dirty
```

The Render Model contains data only.

No presentation logic belongs here.

---

# Widgets

Widgets transform Render Model data into visual output.

Widgets:

* read the Render Model;
* never access the operating system;
* never modify stored data;
* never communicate with providers.

Each widget exposes exactly one public function.

Example:

```bash
pf_widget_git_render
```

Helper functions remain private.

---

# Layouts

Layouts compose widgets.

Responsibilities:

* determine widget order;
* build the final prompt structure.

Layouts never collect data.

Layouts never contain business logic.

---

# Theme Engine

The Theme Engine loads the active skin.

A skin defines the visual identity of the prompt.

Current theme tokens include:

* icons;
* spacing;
* semantic colors.

Themes contain no rendering logic.

---

# ANSI Engine

ANSI escape sequences are isolated from the rendering layer.

Widgets never manipulate ANSI sequences directly.

Instead:

```text
Widget
        │
        ▼
Theme Token
        │
        ▼
ANSI Token
```

This separation allows themes to remain independent from ANSI implementation details.

---

# Module System

Each directory is considered an independent module.

Every module exposes a single entry point:

```text
index.sh
```

This allows internal implementations to evolve without affecting external modules.

Current modules:

* core
* ansi
* providers
* widgets
* layouts

---

# Dependency Rules

Dependencies always point in one direction.

```text
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
ANSI
```

No layer may depend on a higher layer.

Examples:

Providers never know widgets.

Widgets never know providers.

Themes never know the operating system.

---

# Architectural Principles

PixelForge follows a small set of architectural rules.

* One responsibility per module.
* One responsibility per file.
* Data before presentation.
* Simplicity before abstraction.
* Architecture before features.
* Documentation before extension.

These principles guide every architectural decision.

---

# Extensibility

The architecture is designed to support future extensions without modifying existing layers.

Examples:

New providers.

New widgets.

New layouts.

New themes.

Additional ANSI capabilities.

Each extension should integrate into the existing architecture instead of changing it.

---

# Summary

PixelForge is designed as a modular rendering framework.

The architecture separates:

* data collection;
* data storage;
* rendering;
* visual identity.

This separation keeps the project simple, maintainable and extensible while preserving a clear educational value.
