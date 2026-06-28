# ADR-0006 — Module Entry Points

**Status**

Accepted

---

## Context

During the development of PixelForge, the architecture has progressively become modular.

Each layer of the framework (`core`, `providers`, `widgets`, `layouts`, `ansi`, etc.) is composed of multiple files, each with a single responsibility.

Without a strict convention, other modules could directly import internal files from a module, for example:

```bash
source "$PIXELFORGE_ROOT/src/core/renderer.sh"
source "$PIXELFORGE_ROOT/src/core/bootstrap.sh"
```

This approach has several drawbacks:

* strong coupling between modules;
* exposure of internal structure;
* difficulty in reorganizing files;
* duplication of dependencies;
* risk of missing a required file during loading.

As PixelForge grows, this situation would make changes more costly and risky.

---

## Decision

Each module exposes a single entry point named:

```text
index.sh
```

Other modules must never import internal files directly.

They must only import the module’s entry point.

Example:

```bash
source "$PIXELFORGE_ROOT/src/core/index.sh"
source "$PIXELFORGE_ROOT/src/providers/index.sh"
source "$PIXELFORGE_ROOT/src/widgets/index.sh"
source "$PIXELFORGE_ROOT/src/layouts/index.sh"
source "$PIXELFORGE_ROOT/src/ansi/index.sh"
```

The `index.sh` file is responsible only for assembling the module.

It:

* sources internal files;
* respects the loading order;
* does not implement any business logic.

Business logic remains in specialized files.

For example:

```text
core/
├── index.sh
├── bootstrap.sh
├── renderer.sh
├── engine.sh
├── prompt.sh
└── ...
```

where:

* `engine.sh` contains the engine;
* `renderer.sh` contains rendering logic;
* `bootstrap.sh` initializes components;
* `index.sh` assembles the module.

---

## Consequences

### Advantages

The single entry point:

* reduces coupling between modules;
* hides internal structure;
* simplifies internal refactoring;
* streamlines dependency loading;
* improves architectural readability;
* aligns PixelForge with architectures used in other ecosystems (Node.js packages, Go modules, Python libraries, etc.).

Consumers of a module no longer depend on its internal implementation.

They depend only on its entry interface.

---

### Drawbacks

This convention introduces an additional file per module.

However, this cost is minimal compared to the maintainability benefits.

---

## Alternatives Considered

### Direct File Imports

Example:

```bash
source renderer.sh
source bootstrap.sh
source engine.sh
```

This solution creates strong coupling and makes internal reorganizations difficult.

Decision rejected.

---

### Single File per Module

Merging all module files into a single file.

This approach simplifies loading but quickly harms readability and separation of concerns.

Decision rejected.

---

## Associated Rules

Every new module must follow these rules:

* expose a single `index.sh`;
* never expose internal files directly;
* keep `index.sh` free of business logic;
* place all logic in specialized files.

---

## Impact on Architecture

This decision formalizes the PixelForge module system.

It ensures that a module’s internal structure can evolve without affecting its consumers.

It contributes to maintaining a stable, modular, and extensible architecture over the long term.
