# Comment replanifiez-vous le reste a faire, les activites des equipes, le budget ?

## Point de depart

| Indicateur | Valeur |
|-----------|--------|
| Temps ecoule | 3 mois (~25%) |
| Budget consomme | 25% |
| Fonctionnalites livrees | 15% |
| Temps restant | ~9 mois |
| Budget restant | 75% |

**Constat** : au rythme actuel (5%/mois), on livrerait 60% du scope en 12 mois. Il faut doubler la vitesse effective.

---

## 1. Reste a faire

**Inventaire** : lister toutes les features non livrees, estimer en T-shirt sizing (S/M/L/XL), prioriser. Evaluer l'avancement reel des features en cours. Categoriser les 120 tickets de dette (bloquant / structurant / cosmetique).

**Capacite realiste** : 9 devs, sprints de 2 semaines, ~7 jours productifs par dev par sprint. Avec 20% dette + 10% buffer = ~44 j/h de feature par sprint. Sur 9 mois (18 sprints) : ~800 j/h. Avec renforts (+2 ETP, 3 mois) : ~920 j/h.

**Decoupage en 3 releases** :
- **Release 1 (M4-M5)** : Requetage de base, visu simple, export CSV, CI/CD stable (~35% scope, ~300 j/h)
- **Release 2 (M6-M7)** : Requetage avance, 3 visu, export FHIR/Excel, interop FHIR (~30% scope, ~350 j/h)
- **Release 3 (M8-M9)** : Dashboards perso, requetes predefinies, scale x3 (~20% scope, ~270 j/h)

---

## 2. Organisation des equipes

4 flux de travail dedies (cf. Q5) :

| Flux | Equipe | Perimetre |
|------|--------|-----------|
| A | 2 seniors (+ renfort FastAPI) | Requetage + Performance |
| B | 1 senior + 2 confirmes | Visualisation + Export |
| C | 1 confirme + 1 senior (+ renfort DevOps) | Infra + Qualite + FHIR |
| D | 2 juniors (support senior) | Frontend |

**Roles cles** : je pilote le delivery, le PO priorise et valide, 2 tech leads (back + front) arbitrent les choix techniques. Les externes sont repartis comme les internes, mais chaque module critique a au moins 1 interne qui le connait.

---

## 3. Budget

**Situation actuelle (hypothese)** :

| Poste | Initial | Consomme | Reste |
|-------|---------|----------|-------|
| Equipe interne | 50% | 12.5% | 37.5% |
| Prestataires externes | 35% | 10% | 25% |
| Infra + licences | 10% | 2% | 8% |
| Marge | 5% | 0.5% | 4.5% |

**Reallocation** : renforts temporaires (8%), outillage monitoring (2%), formation (1%). Ca depasse de ~8%. Pistes d'economies : fin de contrat d'un presta si non-performance averee (~6%), optimisation infra K8S (~2%), reduction de la duree des renforts si le plan avance bien.

**Je presente au DSN 2 scenarios** :
- **Scenario A** (recommande) : renforts + optimisations = budget a 100%, scope complet
- **Scenario B** (degrade) : sans renforts = budget a 95%, scope reduit de 10-15%

---

## 4. Ceremonies de pilotage

| Ceremonie | Frequence | Objectif |
|-----------|-----------|----------|
| Backlog refinement | Hebdo, 1h | Estimer, decouper |
| Sprint planning | Bi-hebdo, 2h | Engagement equipe |
| Release planning | Toutes les 6 semaines | Valider le contenu de la release |
| Budget review | Mensuel | Suivi consomme vs planifie |
| Comite de pilotage | Mensuel | Arbitrages avec le DSN |

---

Le plan sera faux dans le detail -- tous les plans le sont. Mais le cadre de suivi permet de s'adapter sprint apres sprint.
