# ADR-0007 — Theme Configuration Contract

* Status: Accepted
* Date: 2026-06-29

---

# Context

Originally, a PixelForge skin was composed of three required files:

```text
icons.sh
palette.sh
spacing.sh
```

As the project evolved, skins needed to define more than visual tokens.

The introduction of multiple layouts demonstrated that some properties describe the behavior of a skin rather than its appearance.

For example:

```bash
PF_LAYOUT="minimal"
```

This information does not belong to the rendering engine.

It belongs to the skin itself.

---

# Decision

Every skin must provide a required `config.sh` file.

The structure of a skin becomes:

```text
src/skins/<skin>/
├── config.sh
├── icons.sh
├── palette.sh
└── spacing.sh
```

Optional files remain:

```text
src/skins/<skin>/
├── init.sh
├── borders.sh
└── terminal.sh
```

The rendering engine loads `config.sh` before any other theme file.

---

# Responsibilities

`config.sh` defines the capabilities of a skin.

Examples include:

* selected layout;
* feature flags;
* future theme capabilities.

Example:

```bash
PF_LAYOUT="minimal"
```

The configuration file contains no rendering logic.

It only declares configuration values.

---

# Consequences

Advantages:

* every skin exposes the same contract;
* layout selection becomes part of the skin;
* the rendering engine remains independent from specific skins;
* future configuration options have a dedicated location.

Trade-offs:

* one additional file is required for every skin;
* existing skins must be updated to include `config.sh`.

---

# Alternatives Considered

## Store configuration in `spacing.sh`

Rejected.

Spacing files should only define spacing-related tokens.

Mixing configuration and presentation would reduce cohesion.

---

## Store configuration inside the rendering engine

Rejected.

The rendering engine must remain generic.

A skin is responsible for describing its own capabilities.

---

## Make `config.sh` optional

Rejected.

Every skin should expose the same structure.

A mandatory configuration file provides a consistent API and simplifies maintenance.

---

# Rationale

A PixelForge skin is a self-contained module.

It should explicitly declare both:

* its visual identity;
* its configuration.

Making `config.sh` mandatory establishes a clear and extensible contract for every present and future skin.
