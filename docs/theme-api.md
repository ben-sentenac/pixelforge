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
