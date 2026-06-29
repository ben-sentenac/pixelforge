# ADR-0004 — Theme API

Status: Accepted

Date: 2026-06-26

## Context

PixelForge aims to support several skins:

* cyber;
* gameboy;
* matrix;
* amber.

If widgets hardcode icons, colors or separators, every skin would require changes in widget code.

This would break the separation between rendering logic and visual identity.

## Decision

PixelForge introduces a Theme API.

Skins provide visual tokens.

Examples:

```bash
PF_ICON_USER
PF_ICON_HOST
PF_ICON_CWD
PF_ICON_GIT
PF_ICON_PROMPT
PF_ICON_LOGO
PF_SEPARATOR
PF_WIDGET_GAP
```

Widgets must use these tokens instead of hardcoded visual values.

## Consequences

Benefits:

* skins can change the visual identity without changing widgets;
* visual consistency is centralized;
* future skins become easier to add.

Trade-offs:

* every visual token must be named and documented;
* missing tokens must be detected early;
* widgets must avoid shortcuts and hardcoded icons.

This decision prepares PixelForge for multiple skins while preserving clean architecture.

Décision prise dans le cadre de la phase Foundation (v0.1.0-alpha). Toute remise en cause de cette décision devra faire l'objet d'un nouvel ADR.

## Superseded Evolution

This ADR originally defined the initial Theme API.

The Theme API was later extended by:

- ADR-0007 — Theme Configuration Contract

The introduction of `config.sh` formalizes the configuration layer of a theme without changing the responsibilities defined in this ADR.
