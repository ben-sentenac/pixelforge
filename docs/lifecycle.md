# PixelForge Lifecycle

PixelForge has two main lifecycle phases.

## 1. Initialization

Initialization runs once when PixelForge is sourced.

It prepares stable runtime state.

Responsibilities:

- load configuration;
- load the selected skin;
- initialize context;
- validate required files;
- fail early when required assets are missing.

Initialization entrypoint:

```bash
pf_initialize


. Rendering

Rendering runs before each prompt display through PROMPT_COMMAND.

Responsibilities:

clear the render model;
register enabled providers;
execute providers;
populate the render model;
render widgets through the active layout;
update PS1.

Rendering entrypoint:

pf_prompt_update
Rule

Initialization must not depend on the current directory.

Rendering may depend on the current directory.

This distinction keeps PixelForge predictable and avoids reloading stable assets on every prompt.
