# Theme API

The Theme API provides visual tokens to widgets and layouts.

Widgets must not hardcode colors, icons or separators.

## Responsibilities

The Theme API exposes:

- color tokens;
- icon tokens;
- spacing tokens;
- separators.

## Skins

A skin defines a visual identity.

Each skin may provide:

```text
src/skins/<skin>/
├── palette.sh
├── icons.sh
└── spacing.sh
``
Rule

Widgets do not know the visual style.

They only use tokens.

### Theme Tokens

## Icons

PF_ICON_LOGO
PF_ICON_USER
PF_ICON_HOST
PF_ICON_CWD
PF_ICON_GIT
PF_ICON_PROMPT

## Spacing

PF_ICON_GAP
PF_SEPARATOR

## Colors (future)

PF_COLOR_PRIMARY
PF_COLOR_SECONDARY
PF_COLOR_SUCCESS
PF_COLOR_WARNING
PF_COLOR_ERROR
PF_COLOR_MUTED