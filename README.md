# PixelForge

PixelForge is a small Bash terminal theme inspired by pixel art, retro consoles, and old-school developer workstations.

The goal is not only to make the terminal look fun, but also to understand how Bash prompts, ANSI escape sequences, colors, and shell customization work.

## Goals

- Build a custom Bash prompt step by step.
- Understand ANSI colors and escape sequences.
- Keep the prompt fast and readable.
- Avoid unnecessary dependencies.
- Support simple theme variants.
- Use the project as a learning lab for Linux shell customization.

## Philosophy

PixelForge follows a simple approach:

Understand
Experiment
Document
Test
Use daily
Improve later

No big rewrite.
Small increments.
Readable Bash.
Fast startup.
No magic.

## Project structure

```text
pixelforge/
│
├── src/
│   ├── core/
│   │   ├── engine.sh
│   │   ├── registry.sh
│   │   ├── renderer.sh
│   │   └── config.sh
│   │
│   ├── components/
│   │   ├── user.sh
│   │   ├── host.sh
│   │   ├── cwd.sh
│   │   ├── git.sh
│   │   ├── prompt.sh
│   │   └── ...
│   │
│   ├── ansi/
│   │   ├── colors.sh
│   │   ├── cursor.sh
│   │   └── unicode.sh
│   │
│   ├── layouts/
│   │
│   ├── skins/
│   │
│   └── utils/
│
├── tests/
│
├── docs/
│
└── screenshots/

## architecture moteur

Configuration
      │
      ▼
 Bootstrap
      │
      ▼
 Registry
      │
      ▼
 Components
      │
      ▼
 Render Model
      │
      ▼
 Layout
      │
      ▼
 Terminal

 ## architecture globale

 Bash
 │
 ▼
PROMPT_COMMAND
 │
 ▼
pf_prompt_update()
 │
 ▼
pf_engine_render()
 │
 ▼
Bootstrap
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
Layout
 │
 ▼
PS1