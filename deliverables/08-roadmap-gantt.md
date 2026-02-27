# Proposez une roadmap technique sur 6 mois au format Gantt

## Hypotheses

- Mois 1 = Mois 4 du projet (on reprend le controle apres 3 mois passes)
- Sprints de 2 semaines, equipe de 9 devs + 2 renforts temporaires (mois 1-3)
- Allocation par sprint : 70% features / 20% dette technique / 10% buffer

---

## Gantt - Vue grandes etapes

Les sections reprennent les chantiers evoques dans les reponses precedentes : diagnostic (Q1), qualite et deploiements (Q2), equipe (Q3), architecture (Q4), delivery feature (Q5-Q6), reporting et pilotage (Q7).

```mermaid
gantt
    title Roadmap 6 mois - Grandes etapes
    dateFormat  YYYY-MM-DD
    axisFormat  %b

    section Diagnostic et cadrage (Q1)
    Entretiens + audit technique          :diag1, 2026-04-01, 1w
    Plan de bataille 90 jours             :diag2, 2026-04-08, 1w
    Mise en place rituels et cadre delivery :diag3, 2026-04-14, 1w

    section Qualite et deploiements (Q2)
    Pipeline CI/CD + staging K8S          :qual1, 2026-04-01, 3w
    Deploiement canary + smoke tests      :qual2, 2026-04-22, 3w
    Couverture tests 45% → 65%            :qual3, 2026-04-01, 12w
    Couverture tests 65% → 75%            :qual4, 2026-07-01, 12w

    section Equipe et organisation (Q3)
    Accompagnement individuel             :team1, 2026-04-08, 6w
    Bilan equipe + ajustements            :team2, 2026-05-20, 2w
    Onboarding et fin mission renforts    :team3, 2026-04-01, 13w

    section Architecture (Q4)
    Premier ADR Django/FastAPI            :archi1, 2026-04-14, 2w
    Migration module pilote FastAPI       :archi2, 2026-05-01, 6w
    Bilan et decision suite migration     :milestone, archi3, 2026-06-15, 0d

    section Delivery feature (Q5-Q6)
    Release 1 - Requetage base + visu + CSV   :r1, 2026-04-14, 5w
    RELEASE 1 EN PROD                         :milestone, m1, 2026-05-18, 0d
    Release 2 - Requetage avance + FHIR + Excel :r2, 2026-05-18, 6w
    RELEASE 2 EN PROD                         :milestone, m2, 2026-07-01, 0d
    Release 3 - Dashboards + scale x3         :r3, 2026-07-01, 10w
    RELEASE 3 EN PROD                         :milestone, m3, 2026-09-10, 0d

    section Performance
    Audit SQL + optimisation index        :perf1, 2026-04-01, 4w
    Cache + read replica                  :perf2, 2026-05-01, 5w
    Tests de charge et scale x3           :perf3, 2026-08-01, 5w

    section Dette technique
    Tickets bloquants (20)                :dette1, 2026-04-08, 4w
    Tickets structurants (30)             :dette2, 2026-05-06, 8w
    Tickets restants (budget 20%/sprint)  :dette3, 2026-07-01, 10w

    section Reporting et pilotage (Q7)
    Dashboard et metriques DORA           :rep1, 2026-04-14, 3w
    Reporting operationnel continu        :rep2, 2026-05-01, 20w
```

---

## Jalons cles

| Jalon | Date cible | Ce qu'on valide |
|-------|-----------|-----------------|
| Cadre delivery en place | Mi-avril | Rituels, CI/CD, staging, plan 90j |
| Release 1 en prod | Mi-mai | Requetage de base, visu, export CSV |
| Bilan equipe | Fin mai | Accompagnement individuel : ca marche ou escalade |
| Decision architecture FastAPI | Mi-juin | Module pilote mesure, decision suite migration |
| Couverture 65% | Fin juin | Mesure automatisee |
| Release 2 en prod | Debut juillet | Requetage complet, FHIR, exports |
| Fin mission renforts | Fin juillet | Transfert de competences fait |
| Release 3 en prod | Mi-septembre | Dashboards, scale x3, plateforme complete |
| Couverture 75% | Fin septembre | Mesure automatisee |

---

## Points de controle (Go / No-Go)

| Date | Decision | Critere |
|------|----------|---------|
| Fin avril | Go Release 1 | CI/CD stable, perf ameliorees, equipe cadree |
| Mi-mai | Go Release 2 | Release 1 en prod sans incident |
| Debut juillet | Go Release 3 | Release 2 en prod, FHIR OK |
| Debut aout | Go scale x3 | Tests de charge OK, monitoring OK |

Chaque Go/No-Go est une decision partagee avec le DSN.

---

**Cette roadmap est une boussole, pas un plan fige. Le detail s'affine sprint apres sprint, mais les grands jalons et les chantiers sont poses.**
