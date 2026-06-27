# Widget API

Version: 0.1

This document defines the architecture, lifecycle and conventions of widgets in PixelForge.

A widget is responsible for rendering information already collected by the engine.

Widgets never collect system data.

They only transform structured data from the Render Model into visual output.

---

# Widget Lifecycle

Each prompt rendering follows this pipeline:

```text
Provider
        │
        ▼
Render Model
        │
        ▼
Widget
        │
        ▼
Layout
        │
        ▼
Theme
        │
        ▼
PS1
```

The widget is part of the rendering layer.

---

# Responsibilities

A widget:

* reads the Render Model;
* formats data;
* builds visual output;
* returns a formatted string.

A widget never:

* executes system commands;
* modifies the Render Model;
* accesses providers;
* hardcodes icons;
* hardcodes colors;
* hardcodes spacing.

---

# Public API

Every widget exposes exactly one public function.

Example:

```bash
pf_widget_git_render
```

This function is called by the active layout.

No other public API should exist.

---

# Private API

Widgets may define private helper functions.

Naming convention:

```bash
_pf_widget_<name>_<helper>
```

Example:

```bash
_pf_widget_git_is_available
_pf_widget_git_branch
_pf_widget_git_dirty_marker
_pf_widget_git_sync_indicators
_pf_widget_git_build_output
```

Private helpers must never be called outside their widget.

---

# Recommended Structure

A complex widget should follow this structure:

```text
Availability check

↓

Private helpers

↓

Build output

↓

Render
```

Example:

```text
_pf_widget_git_is_available()

↓

_pf_widget_git_branch()

↓

_pf_widget_git_dirty_marker()

↓

_pf_widget_git_sync_indicators()

↓

_pf_widget_git_build_output()

↓

pf_widget_git_render()
```

This structure keeps each function focused on a single responsibility.

---

# Build Output Pattern

When a widget grows beyond a few lines, rendering should be delegated to a dedicated function.

Example:

```bash
_pf_widget_git_build_output()
```

Responsibilities:

* assemble the visual representation;
* compose icons, text and colors;
* return a formatted string.

The render function becomes:

```bash
pf_widget_git_render() {
    if ! _pf_widget_git_is_available; then
        return
    fi

    printf "%s\n" "$(_pf_widget_git_build_output)"
}
```

---

# Render Model

Widgets read data exclusively from the Render Model.

Examples:

```text
git.branch
git.dirty
cwd.home
user.name
host.name
```

Widgets must never access the operating system directly.

---

# Theme API

Widgets must consume theme tokens.

Icons:

```text
PF_ICON_USER
PF_ICON_HOST
PF_ICON_CWD
PF_ICON_GIT
```

Spacing:

```text
PF_ICON_GAP
```

Semantic colors:

```text
PF_COLOR_PRIMARY
PF_COLOR_SECONDARY
PF_COLOR_SUCCESS
PF_COLOR_WARNING
PF_COLOR_ERROR
PF_COLOR_MUTED
PF_COLOR_RESET
```

Widgets never use ANSI escape sequences directly.

---

# Output Rules

A widget builds a string.

The layout decides where that string is displayed.

This separation allows the same widget to be reused in different layouts.

---

# Error Handling

Widgets should fail silently.

If required data is missing:

```bash
return
```

Rendering must never stop the prompt engine.

---

# Design Principles

A widget should be:

* simple;
* deterministic;
* side-effect free;
* easy to read;
* easy to extend.

Small helper functions are preferred over large rendering functions.

---

# Example

```text
Git Provider
        │
        ▼
Render Model
        │
        ▼
Git Widget
        │
        ├── branch()
        ├── dirty_marker()
        ├── sync_indicators()
        ├── build_output()
        ▼
Layout
        ▼
PS1
```

The Git widget is the reference implementation for future widgets.

New widgets should follow the same architecture whenever appropriate.

`A widget transforms data into presentation. Nothing more.
