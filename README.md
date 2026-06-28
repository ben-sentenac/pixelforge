# PixelForge

> A modular Bash prompt framework focused on clean architecture, extensibility and learning.

PixelForge is not just another Bash prompt.

It is an educational project that demonstrates how to design a maintainable software architecture using only Bash.

The goal is to build a prompt engine that remains simple, modular and easy to extend while following software engineering best practices.

---

# Philosophy

PixelForge follows a simple principle:

```
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

Every feature must preserve the overall architecture.

Small increments are preferred over large rewrites.

Documentation is considered part of the code.

---

# Goals

PixelForge aims to demonstrate that even a Bash project can be designed like a modern software system.

Core objectives:

* modular architecture;
* clear separation of responsibilities;
* reusable components;
* clean Theme API;
* extensible Widget API;
* educational codebase.

---

# Architecture

PixelForge is built around a rendering pipeline.

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
ANSI Engine
        │
        ▼
Prompt
```

Each layer has exactly one responsibility.

---

# Project Structure

```text
pixelforge/

docs/
src/

src/
├── ansi/
├── core/
├── layouts/
├── providers/
├── skins/
└── widgets/
```

Each module exposes a single public entry point:

```
index.sh
```

---

# Core Concepts

## Providers

Providers collect information from the operating system.

Examples:

* current user;
* hostname;
* current directory;
* Git repository state.

Providers never perform rendering.

---

## Render Model

The Render Model stores structured data.

Example:

```
git.branch
git.dirty
cwd.home
user.name
```

It acts as the boundary between data collection and presentation.

---

## Widgets

Widgets transform Render Model data into visual output.

Widgets:

* never access the operating system;
* never modify the Render Model;
* only render data.

---

## Layouts

Layouts decide how widgets are assembled.

They contain no business logic.

---

## Themes

Themes define the visual identity.

A theme provides:

* icons;
* spacing;
* semantic colors.

Themes never contain rendering logic.

---

## ANSI Engine

ANSI sequences are isolated from widgets.

Themes map semantic colors to ANSI tokens.

Widgets never manipulate escape sequences directly.

---

# Documentation

PixelForge documentation is considered part of the project.

Main documents:

* Architecture
* Lifecycle
* Theme API
* Widget API
* Engineering Checklist
* Coding Style
* ADRs

---

# Engineering Principles

* One responsibility per module.
* One responsibility per file.
* Architecture before features.
* Simplicity before abstraction.
* Data before rendering.
* Documentation before extension.

---

# Current Status

Current architecture includes:

* Core Engine
* Theme Engine
* ANSI Engine
* Render Model
* Theme API
* Widget API
* Module System (`index.sh`)

Future work includes:

* additional themes;
* new widgets;
* automated tests;
* configuration system.

---

# Roadmap

Planned themes:

* Cyber
* GameBoy
* Matrix
* Amber

Future widgets:

* Node.js
* Docker
* Kubernetes
* Battery
* Network
* Time

---

# Contributing

PixelForge follows a strict engineering workflow.

Every contribution should:

* preserve the architecture;
* remain small and focused;
* update the documentation when necessary;
* follow the coding style.

---

# License

MIT
