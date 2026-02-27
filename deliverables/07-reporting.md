# Comment structurez-vous le reporting ?

Le reporting repond a 3 questions : ou en est-on ? Quels sont les risques ? De quelles decisions a-t-on besoin ?

**Principe : chaque audience a un reporting adapte a ses decisions.**

---

## Niveau 1 : Equipe (quotidien / sprint)

**Daily standup** (15 min) : synchronisation, pas reporting. Chaque dev dit ce qu'il a fait, ce qu'il fait, ce qui le bloque.

**Metriques de sprint** (automatisees via Gitlab/Jira) : burndown, velocite sur les 6 derniers sprints, WIP par dev (cible < 2), cycle time, taux de completion. Ces metriques sont pour l'equipe, pas pour le management.

---

## Niveau 2 : Comite delivery (hebdo, 30 min, DM + PO + Tech Leads)

**Agenda fixe :**

1. **Dashboard projet (5 min)** -- statut scope/delai/budget en vert/orange/rouge avec tendance, metriques cles du sprint (points completes, couverture tests, temps de requete, deploys et rollbacks)

2. **Risques et blocages (10 min)** -- chaque risque a un owner, une action, une echeance. Pas de risque "a surveiller" sans plan

3. **Decisions a prendre (10 min)** -- arbitrages presentes avec contexte, options, et ma recommandation. Decision prise seance tenante si possible

4. **Actions (5 min)** -- recap, owners, echeances. Suivi d'une semaine sur l'autre

---

## Niveau 3 : Comite de pilotage (mensuel, 45 min, DM + DSN + PO)

**Rapport executif (1 page, envoye 24h avant)** : statut global, avancement scope/budget/delai, faits marquants du mois, risques majeurs, decisions requises, previsions mois suivant.

**Agenda** : revue du rapport (10 min), demo si release livree (10 min), risques et arbitrages (15 min), projection (10 min).

**Regle** : le DSN ne decouvre jamais un probleme en comite de pilotage. Si c'est urgent, je l'appelle avant.

---

## Metriques suivies

**DORA** :

| Metrique | Cible M3 | Cible M6 |
|----------|----------|----------|
| Frequence de deploiement | 2-3/sem | 3-5/sem |
| Lead time (commit → prod) | < 3 jours | < 1 jour |
| Taux d'echec des deploys | < 10% | < 5% |
| MTTR | < 2h | < 30 min |

**Specifiques projet** : couverture de tests (65% M3, 75% M6), temps de requete P95 (< 3s M3, < 2s M6), tickets de dette (< 80 M3, < 50 M6), bus factor (>= 2 par module).

---

## Outillage

Gitlab Issues/Jira pour le board, Gitlab CI pour les metriques de couverture et DORA, Grafana + Prometheus pour le monitoring applicatif. Rapport executif en template Markdown versionne. Pas d'achat d'outil supplementaire.

**Le meilleur reporting est celui qui rend les bonnes decisions evidentes.**
