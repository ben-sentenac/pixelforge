# Coding Style

Version : 0.1

Ce document définit les conventions de développement de PixelForge.

L'objectif n'est pas seulement d'obtenir un code fonctionnel, mais un code simple, lisible et maintenable.

---

# Philosophy

Le code est lu beaucoup plus souvent qu'il n'est écrit.

La priorité est donc :

Lisibilité

↓

Compréhension

↓

Maintenabilité

↓

Performance

Une solution simple est toujours préférée à une solution ingénieuse.

---

# General Principles

Toujours :

* écrire un code explicite ;
* privilégier les fonctions courtes ;
* limiter les effets de bord ;
* documenter les choix importants ;
* respecter la séparation des responsabilités.

Éviter :

* les optimisations prématurées ;
* les abstractions inutiles ;
* les variables globales non justifiées ;
* les fonctions "fourre-tout".

---

# File Organization

Chaque fichier possède une responsabilité unique.

Ordre recommandé :

```text
Header

Constants

Global variables

Private functions

Public API
```

Les dépendances sont regroupées au début du fichier.

---

# Naming

## Public Functions

Les fonctions publiques utilisent le préfixe :

```bash
pf_
```

Exemples :

```bash
pf_initialize
pf_theme_load
pf_engine_render
pf_provider_git
pf_widget_git
```

---

## Private Functions

Les fonctions internes utilisent :

```bash
_pf_
```

Exemples :

```bash
_pf_parse_git_branch
_pf_normalize_path
```

Elles ne doivent jamais être appelées depuis un autre module.

---

## Global Variables

Les variables globales utilisent :

```text
PF_
```

Exemples :

```bash
PF_VERSION
PF_SKIN
PF_LAYOUT
PF_RENDER_MODEL
```

---

## Local Variables

Toujours utiliser :

```bash
local
```

Exemple :

```bash
local branch
local cwd
local depth
```

Les variables locales doivent avoir la portée la plus réduite possible.

---

# Functions

Une fonction réalise une seule action.

Elle doit être :

* courte ;
* explicite ;
* facilement testable.

Si une fonction nécessite plusieurs commentaires pour être comprise, elle doit probablement être découpée.

---

# Bash Practices

Toujours :

```bash
local variable

[[ ... ]]

$(...)

return
```

Préférer :

```bash
case
```

à une longue succession de `if`.

Toujours protéger les expansions :

```bash
"$variable"
```

Éviter :

```bash
$variable
```

lorsque le contenu peut contenir des espaces.

---

# Error Handling

Une fonction :

* retourne un code d'erreur ;
* n'interrompt jamais brutalement le programme.

Utiliser :

```bash
return 0
return 1
```

Réserver :

```bash
exit
```

au point d'entrée du programme.

Les erreurs doivent être explicites et compréhensibles.

---

# Output

Chaque couche possède son propre rôle.

Providers :

* ne produisent aucun affichage.

Widgets :

* construisent l'affichage.

Layouts :

* assemblent les widgets.

L'Engine :

* orchestre uniquement.

---

# Render Model

Toutes les données transitent par le Render Model.

Un widget ne doit jamais exécuter une commande système.

Un provider ne doit jamais produire de texte destiné au prompt.

---

# Theme API

Aucune icône, couleur ou séparateur ne doit être codé en dur dans les widgets.

Toujours utiliser les tokens du thème.

Exemple :

```bash
PF_ICON_USER
PF_ICON_GIT
PF_SEPARATOR
```

---

# Comments

Les commentaires expliquent une intention.

Ils ne décrivent pas le code.

À éviter :

```bash
# Increment i
((i++))
```

Préférer :

```bash
# Git peut retourner HEAD en mode detached.
```

Supprimer les commentaires devenus obsolètes.

---

# Documentation

Toute nouvelle API publique doit être documentée.

Toute évolution architecturale doit mettre à jour la documentation correspondante.

La documentation fait partie du code.

---

# Project Rule

Avant d'ajouter une nouvelle fonctionnalité, se poser systématiquement les questions suivantes :

* Est-elle cohérente avec l'architecture ?
* Peut-elle réutiliser une couche existante ?
* Introduit-elle une responsabilité supplémentaire ?
* Peut-elle être plus simple ?
* Le code restera-t-il compréhensible dans un an ?

Si la réponse est non, revoir la conception avant de coder.

---

# Golden Rules

Comprendre avant de coder.

Documenter avant d'étendre.

Une responsabilité par couche.

Une responsabilité par fichier.

Les données avant le rendu.

Les widgets ne connaissent pas le système.

Les providers ne connaissent pas l'interface.

Le moteur orchestre, il ne décide pas.

La simplicité est une fonctionnalité.

# Compatibility

PixelForge cible Bash.

Le projet évite volontairement les dépendances externes.

Les fonctionnalités doivent privilégier :

- les builtins Bash ;
- les commandes POSIX lorsque c'est possible ;
- un nombre minimal de processus externes.

Toute commande externe utilisée doit être justifiée par un gain significatif en simplicité ou en lisibilité.
