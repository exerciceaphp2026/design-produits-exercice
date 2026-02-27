# Comment augmenter la couverture des tests et stabiliser les deploiements ?

## Cibles

| Indicateur | Actuel | Cible 3 mois | Cible 6 mois |
|-----------|--------|--------------|--------------|
| Couverture de tests | 45% | 65% | 75% |
| Taux de rollback | Frequent | < 10% | < 5% |
| Incidents post-deploy | Non mesure | < 2/mois | < 1/mois |

Je ne vise pas 90%. 75% sur le code critique, c'est plus utile que 90% de tests superficiels.

---

## Augmenter la couverture de tests

Jamais de "sprint de tests". Ca ne marche pas et ca demotive. La couverture se construit de 3 facons :

**1. Regle du boy-scout : tout code touche doit etre teste.** Toute merge request doit couvrir a 80% le code nouveau ou modifie, et ne pas faire baisser la couverture globale. C'est mesure automatiquement dans la MR Gitlab. Cette regle seule fait monter la couverture mecaniquement.

**2. Tests cibles sur les zones a risque.** Je croise les 20 fichiers les plus modifies (`git log`) avec le rapport de couverture. Les fichiers tres modifies et peu testes, c'est la que les regressions arrivent. Les seniors testent les modules complexes, les juniors les modules plus simples -- bon moyen d'apprendre le codebase.

**3. Chaque bug corrige = un test ecrit AVANT la correction.** Zero exception. Ca empeche le bug de revenir et ca construit la couverture sur des cas reels.

**Focus specifique au projet :**
- Requetes SQL complexes : tests d'integration avec fixtures pseudonymisees
- Interoperabilite FHIR : tests de conformite sur les ressources echangees
- Export de donnees : tests sur les formats de sortie (CSV, FHIR bundles)

---

## Stabiliser les deploiements

Les causes probables des regressions et rollbacks :

| Cause | Correction |
|-------|------------|
| Merge sans validation automatique | Gate de tests obligatoire dans Gitlab CI |
| Pas d'environnement de staging | Namespace K8S dedie, deploy auto sur merge dans `develop` |
| Deploiements semi-manuels | ArgoCD full GitOps |
| Pas de smoke tests post-deploy | Suite minimale automatisee apres chaque deploy |
| Pas de deploiement progressif | Canary 10% du trafic via Argo Rollouts, rollout si OK |

### Par ordre de priorite

**Sprint 1-2 (fondations)** :
- Gate de tests dans la CI (2h de config, impact immediat)
- Coverage report automatique dans les MR (1h de config)
- Environnement de staging sur K8S (1-2j, on a deja K8S et ArgoCD)

**Sprint 3-4 (fiabilisation)** :
- Deploiement canary via Argo Rollouts (2-3j)
- Smoke tests post-deploy automatises (2j)
- Feature flags sur les features a risque -- simple table de config, pas d'outil complexe (1j)

**Sprint 5+ (optimisation)** :
- Tests de performance automatises (requetes critiques avec seuils)
- Environnements de review ephemeres par MR (ArgoCD ApplicationSets)

---

## Ce que ca donne concretement

**Mois 1** : Plus de merge sans tests. Staging operationnel. Pipeline complet. Couverture ~55%.

**Mois 3** : Canary en place. Smoke tests actifs. Couverture 65%. Rollbacks rares. L'equipe deploie 2-3 fois par semaine sans stress.

**Mois 6** : Couverture 75%. Le deploiement est un non-evenement. La dette technique baisse regulierement.

**L'objectif n'est pas la perfection technique. C'est que l'equipe retrouve confiance dans ce qu'elle livre.**
