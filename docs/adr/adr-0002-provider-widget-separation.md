# ADR-0002 — Provider / Widget Separation

Status: Accepted

Date: 2026-06-26

## Context

A prompt component can be seen as both a data source and a visual element.

For example, Git needs to:

* detect whether the current directory is inside a repository;
* read the current branch;
* detect dirty state;
* display the result.

If this is implemented in a single function, the code becomes harder to test, harder to theme and harder to maintain.

## Decision

PixelForge separates providers and widgets.

Providers:

* collect data;
* may read the system;
* may execute commands;
* write only to the Render Model;
* never render prompt output.

Widgets:

* read the Render Model;
* decide whether they should appear;
* render text;
* never execute system commands.

## Consequences

Benefits:

* clear separation of responsibilities;
* easier theming;
* easier debugging;
* future widgets can reuse provider data.

Trade-offs:

* more files;
* slightly more ceremony;
* requires consistent naming conventions.

This decision is mandatory for all future components.

Décision prise dans le cadre de la phase Foundation (v0.1.0-alpha). Toute remise en cause de cette décision devra faire l'objet d'un nouvel ADR.
