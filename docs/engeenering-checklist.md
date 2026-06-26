# Engineering Checklist

Version : 0.1

Ce document définit les critères de qualité de PixelForge.

Une fonctionnalité n'est considérée comme terminée que lorsque cette checklist est respectée.

---

# Philosophy

PixelForge est un projet d'apprentissage.

Chaque évolution doit respecter les principes suivants :

* comprendre avant de coder ;
* documenter avant d'étendre ;
* mesurer la complexité avant d'abstraire ;
* petits incréments ;
* architecture avant fonctionnalités ;
* simplicité avant optimisation.

---

# Architecture

Chaque modification doit préserver l'architecture validée.

## Général

* [ ] Une responsabilité par fichier.
* [ ] Une responsabilité par couche.
* [ ] Aucun couplage inutile entre les couches.
* [ ] Aucune duplication importante de logique.
* [ ] Aucune dépendance circulaire.

---

# Engine

L'Engine orchestre uniquement le pipeline.

* [ ] Ne contient aucune logique métier.
* [ ] Ne collecte aucune donnée système.
* [ ] Ne réalise aucun affichage.

---

# Providers

Les providers collectent les données.

* [ ] Aucun affichage.
* [ ] Aucun echo destiné au prompt.
* [ ] Aucun printf destiné au prompt.
* [ ] Aucun code de présentation.
* [ ] Ne remplissent que le Render Model.
* [ ] Une seule responsabilité par provider.

---

# Render Model

Le Render Model représente l'état courant du prompt.

* [ ] Données uniquement.
* [ ] Aucune logique métier.
* [ ] Aucune mise en forme.

---

# Widgets

Les widgets affichent les données.

* [ ] Lisent uniquement le Render Model.
* [ ] N'exécutent aucune commande système.
* [ ] Ne modifient jamais le Render Model.
* [ ] Ne connaissent pas les providers.

---

# Layouts

Les layouts composent les widgets.

* [ ] Aucun accès système.
* [ ] Aucune collecte de données.
* [ ] Aucune logique métier.

---

# Skins

Les skins définissent l'identité visuelle.

* [ ] Icônes.
* [ ] Couleurs.
* [ ] Séparateurs.
* [ ] Espacements.

Ils ne doivent contenir aucune logique.

---

# Bash

Chaque fichier Bash respecte les conventions suivantes.

* [ ] shellcheck ne signale aucun problème critique.
* [ ] Variables locales déclarées avec local.
* [ ] Variables globales limitées au strict nécessaire.
* [ ] Fonctions courtes et lisibles.
* [ ] Variables correctement protégées par des guillemets.
* [ ] Aucun code mort.
* [ ] Aucun commentaire obsolète.

---

# Documentation

Toute évolution significative doit être documentée.

* [ ] La documentation reste synchronisée avec le code.
* [ ] L'architecture est mise à jour si nécessaire.
* [ ] Les nouvelles API sont documentées.

---

# Tests

Les fonctionnalités doivent pouvoir être vérifiées.

* [ ] Aucun comportement régressif connu.
* [ ] Les cas d'erreur sont pris en compte.
* [ ] Les comportements attendus sont documentés.

---

# Before Merging

Avant de considérer une évolution comme terminée :

* [ ] Le code est lisible.
* [ ] Les responsabilités sont respectées.
* [ ] Les conventions Bash sont respectées.
* [ ] L'architecture reste cohérente.
* [ ] La documentation est à jour.
* [ ] La fonctionnalité est validée manuellement.

---

> Une fonctionnalité n'est terminée que lorsqu'elle est simple, compréhensible, documentée et cohérente avec l'architecture de PixelForge.
