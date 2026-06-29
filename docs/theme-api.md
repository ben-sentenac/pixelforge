# Theme API

The Theme API defines the visual identity and behavior of a PixelForge skin.

Themes customize the appearance of the framework without modifying the core architecture.

Widgets and layouts must never hardcode colors, icons or spacing. They only consume theme tokens.

## Responsibilities

A theme is responsible for:

* visual configuration;
* color palette;
* icons;
* spacing;
* optional lifecycle hooks.

Themes never collect system information.

They only define how information is presented.

---

# Skin Structure

Every skin must provide the following files:

```text
src/skins/<skin>/
├── config.sh
├── icons.sh
├── palette.sh
└── spacing.sh
```

Optional files:

```text
src/skins/<skin>/
├── init.sh
├── borders.sh
└── terminal.sh
```

---

# Configuration

`config.sh` defines the behavior of the skin.

Example:

```bash
PF_LAYOUT="minimal"
```

The layout is selected by the rendering engine.

---

# Lifecycle Hooks

Themes may expose lifecycle hooks.

Currently supported:

```bash
pf_theme_on_initialize()
```

This hook is executed once when PixelForge is initialized.

Typical use cases include:

* startup banner;
* welcome message;
* terminal initialization.

---

# Theme Tokens

## Icons

```text
PF_ICON_LOGO
PF_ICON_USER
PF_ICON_HOST
PF_ICON_CWD
PF_ICON_GIT
PF_ICON_PROMPT
```

---

## Spacing

```text
PF_ICON_GAP
PF_SEPARATOR
```

---

## Colors

```text
PF_COLOR_PRIMARY
PF_COLOR_SECONDARY
PF_COLOR_SUCCESS
PF_COLOR_WARNING
PF_COLOR_ERROR
PF_COLOR_MUTED
PF_COLOR_RESET
```

---

# Design Rules

A theme:

* defines appearance;
* may define initialization behavior;
* selects a layout through `PF_LAYOUT`.

A theme must never:

* execute providers;
* modify the render model;
* change the rendering engine;
* contain business logic.
