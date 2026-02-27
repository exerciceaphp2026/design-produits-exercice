# La deadline ne peut pas bouger. Le scope non plus. Que faites-vous ?

Deadline fixe. Scope fixe. Projet en retard. Sacrifier la qualite sur une plateforme de donnees patients, c'est non.

**Ma conviction : quand on dit "le scope ne bouge pas", ca signifie que les objectifs metier ne bougent pas. La facon d'atteindre ces objectifs est toujours negociable.**

---

## 5 leviers

### 1. Negocier le "comment", pas le "quoi"

Je m'assois avec le PO et les utilisateurs cles pour definir le MVP de chaque feature :

| Feature | Version complete | Version MVP (meme valeur metier) |
|---------|-----------------|----------------------------------|
| Requetage | 15 types de filtres | 5 filtres les plus utilises + requete SQL pour le reste |
| Visualisation | 8 graphiques interactifs | 3 graphiques essentiels + export pour analyse externe |
| Export | 6 formats | 3 formats (CSV, FHIR, Excel) -- couvrent 90% des usages |

On livre 100% de la valeur metier avec 60-70% de l'effort.

### 2. Paralleliser les flux de travail

Je reorganise l'equipe en flux autonomes :
- **Flux A** (2 seniors) : Requetage + Performance
- **Flux B** (1 senior + 2 confirmes) : Visualisation + Export
- **Flux C** (1 confirme + 1 senior) : Infra + Qualite + FHIR
- **Flux D** (2 juniors + support senior) : Frontend

Chaque flux a un lead, un objectif clair, et avance en parallele.

### 3. Renforts cibles

Pas de recrutement massif (loi de Brooks), mais 2 renforts temporaires sur des perimetres isoles :
- 1 dev senior FastAPI (freelance, 3-4 mois) → debloque le moteur de requetage
- 1 DevOps/SRE (mi-temps, 2-3 mois) → stabilise CI/CD et monitoring

Cout : ~15-20% du budget restant. C'est un investissement.

### 4. Eliminer le gaspillage

| Gaspillage | Action |
|-----------|--------|
| Reunions inutiles | Audit, suppression du superflu |
| Specs floues → allers-retours | Definition of Ready stricte |
| Code reviews qui trainent | Review dans la demi-journee |
| Context-switching | WIP limit : max 2 taches/dev |
| Attente de validation metier | PO disponible chaque jour |

Estimation conservatrice : 15-20% de capacite effective recuperee.

### 5. Livrer incrementalement

3 releases, chacune deployable et utilisable :
- **Release 1 (M1-2)** : Requetage de base, visu simple, export CSV, stabilisation CI/CD
- **Release 2 (M3-4)** : Requetage avance, 3 types de visu, export FHIR + Excel, interop FHIR
- **Release 3 (M5-6)** : Dashboards perso, requetes predefinies, scale x3

Si la deadline arrive et que R3 n'est pas 100% terminee, on a quand meme une plateforme fonctionnelle en production.

---

## La conversation avec le DSN

Je ne vais pas le voir en disant "on est en retard". J'y vais avec un plan : "Le scope fonctionnel sera livre. Voici comment. Le risque residuel est sur les features les moins prioritaires de R3 -- si on doit arbitrer, voici lesquelles. Je propose qu'on valide ensemble."

Le DSN veut de la visibilite et du controle, pas des mauvaises surprises.

**La seule chose que je refuse de negocier : la qualite et la securite des donnees patients. C'est une ligne rouge absolue.**
