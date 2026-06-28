# Changelog

All notable changes to this project will be documented in this file.

The format is inspired by *Keep a Changelog*.

## [0.1.0-alpha] - 2026-06-28

### Added

* Modular project architecture.
* Core rendering engine.
* Render Model.
* Theme Engine.
* ANSI Engine.
* Theme API.
* Widget API.
* Module entry points (`index.sh`).
* Cyber theme.
* User widget.
* Host widget.
* Current working directory widget.
* Git widget with semantic colors.
* Project documentation.
* Architecture Decision Records (ADRs).

### Changed

* Introduced modular loading through `index.sh`.
* Refactored theme loading into a dedicated Theme Engine.
* Introduced semantic color tokens.
* Refactored Git widget using the `build_output()` pattern.

### Documentation

* Added architecture documentation.
* Added lifecycle documentation.
* Added Theme API.
* Added Widget API.
* Added coding style guide.
* Added engineering checklist.
* Added ADR documentation.

---

## Road to 0.2

Planned work:

* GameBoy theme.
* Matrix theme.
* Additional widgets.
* Configuration system.
* Automated tests.
* ShellCheck integration.
* CI pipeline.
