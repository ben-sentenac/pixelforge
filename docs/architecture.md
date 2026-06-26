# PixelForge Architecture

## 1. Vision

PixelForge is a modular Bash prompt engine inspired by retro computers, pixel art and classic developer workstations.

The project is primarily a learning laboratory.

Its purpose is to understand how a modern shell prompt works by building every layer from scratch, without relying on heavy frameworks or hidden abstractions.

PixelForge is designed around software engineering principles rather than visual customization alone.

The project values simplicity, maintainability and explicit design over feature count.

---

# 2. Philosophy

PixelForge follows a simple development philosophy.

```
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

Core principles:

* understand before coding;
* document before extending;
* small incremental changes;
* one responsibility per component;
* explicit code over clever code;
* composition over duplication;
* architecture before optimization;
* avoid unnecessary abstractions.

The objective is not to build features as quickly as possible.

The objective is to build a prompt engine that remains understandable after years of evolution.

---

# 3. Goals

PixelForge aims to:

* learn advanced Bash scripting;
* understand shell prompt internals;
* explore ANSI escape sequences;
* build a modular rendering engine;
* experiment with software architecture;
* remain dependency free whenever possible;
* keep startup time minimal;
* serve as an educational project.

---

# 4. Non-goals

PixelForge is **not** intended to become:

* another Starship clone;
* a shell framework;
* a plugin marketplace;
* a feature race;
* a benchmarking project;
* a replacement for existing shell environments.

The project intentionally prioritizes learning and architecture over feature quantity.

---

# 5. High-Level Architecture

The rendering pipeline is organized into several independent layers.

```
Bash

    │

PROMPT_COMMAND

    │

Prompt

    │

Engine

    │

Providers

    │

Render Model

    │

Widgets

    │

Layout

    │

Skin

    │

PS1
```

Each layer owns exactly one responsibility.

No layer should bypass another.

---

# 6. Layer Responsibilities

## Engine

The engine orchestrates the rendering process.

Responsibilities:

* initialize rendering;
* execute providers;
* invoke layouts;
* produce the final prompt.

The engine never contains business logic.

---

## Providers

Providers collect information from the operating system.

Examples:

* current user;
* hostname;
* current working directory;
* Git repository;
* Node.js version.

Providers only populate the Render Model.

Providers never display anything.

---

## Render Model

The Render Model stores structured information collected by providers.

Examples:

```
user.name

host.name

cwd.home

git.branch

git.dirty
```

The Render Model acts as the single source of runtime data during prompt rendering.

---

## Widgets

Widgets render one specific concept.

Examples:

* User widget
* Git widget
* Current directory widget

Widgets consume data from the Render Model.

Widgets never execute external commands.

---

## Layouts

Layouts compose widgets.

A layout decides:

* ordering;
* grouping;
* spacing;
* overall structure.

Layouts never collect data.

---

## Skins

Skins define visual identity.

Responsibilities:

* colors;
* icons;
* separators;
* decorative elements.

A skin never changes the logical structure of the prompt.

---

# 7. Rendering Pipeline

Every prompt rendering follows the same sequence.

```
PROMPT_COMMAND

↓

Prompt Update

↓

Engine

↓

Providers

↓

Render Model

↓

Widgets

↓

Layout

↓

Skin

↓

PS1
```

Each stage consumes the output of the previous stage.

---

# 8. Project Structure

```
pixelforge/

docs/

src/

    ansi/

    core/

    providers/

    widgets/

    layouts/

    skins/

    utils/

tests/

examples/
```

Every directory has a single responsibility.

---

# 9. Design Principles

PixelForge follows these engineering principles.

## Single Responsibility

Each file should have one purpose.

## Separation of Concerns

Data collection, rendering and styling remain independent.

## Explicit over Implicit

Avoid hidden behavior.

Prefer readable code over clever tricks.

## Composition over Duplication

Build larger behaviors by assembling small components.

## Data First

Providers produce data.

Widgets consume data.

Layouts compose widgets.

Skins decorate widgets.

---

# 10. Public Internal API

Current public engine API.

```
pf_engine_render()

pf_prompt_update()

pf_model_set()

pf_model_get()

pf_model_has()

pf_model_clear()

pf_register_component()

pf_registered_components()

pf_clear_components()
```

These functions form the internal contract of the engine.

---

# 11. Coding Conventions

Public functions

```
pf_function()
```

Private functions

```
_pf_function()
```

Global variables

```
PF_VARIABLE
```

Local variables

```
local value
```

Rules:

* use `local` whenever possible;
* avoid global mutable state;
* keep functions small;
* avoid side effects;
* comment intent rather than implementation.

---

# 12. Future Evolution

The architecture intentionally leaves room for future extensions.

Potential additions include:

* automatic provider discovery;
* multiple layouts;
* multiple skins;
* theme API;
* provider capabilities;
* caching layer;
* asynchronous providers;
* plugin loading.

These features should only be introduced when justified by real use cases.

Premature abstraction should always be avoided.

---

# 13. Architecture Rule

The following rule takes precedence over every implementation detail.

> Providers collect data.
>
> The Render Model stores data.
>
> Widgets render data.
>
> Layouts compose widgets.
>
> Skins define visual identity.
>
> The Engine orchestrates everything.

Any new feature must respect this separation of responsibilities.

If a feature requires breaking this rule, the architecture should be reviewed before implementation.
