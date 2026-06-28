## Theme API
### Icon Metrics Normalization

Priority: Low (post v0.1.0-alpha)

### Problem

Certain Unicode icons do not occupy the same visual width across fonts and terminals.

For example:

👤 benoit
🖥️ devbox

The monitor emoji (🖥️) currently requires an additional trailing space in the Cyber theme to preserve alignment.

This is a rendering concern rather than an icon definition concern.

## Goal

Design a generic mechanism allowing themes to normalize icon rendering without embedding spacing inside icon definitions.

## Possible approaches include:

icon width metadata for exemple ICON_WIDTH=3;
icon rendering helper;
theme metrics API;
layout-aware icon normalization.

## Decision

No architectural change before v0.1.0-alpha.

The current workaround (trailing space in PF_ICON_HOST) is intentionally kept until multiple themes validate the need for a generalized solution.
