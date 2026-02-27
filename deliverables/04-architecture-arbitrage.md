# Certains developpeurs veulent reecrire toute la stack back-end, il y a des desaccords d'architecture, comment reagissez-vous ?

**Ma reponse courte : non, on ne reecrit pas. Mais on ne balaye pas les arguments sous le tapis non plus.**

---

## Pourquoi la reecriture est un piege ici

| Facteur | Reecriture complete | Refactoring progressif |
|---------|-------------------|----------------------|
| Risque | Tres eleve | Maitrise |
| Delai | +6-12 mois minimum | Continu |
| Valeur metier pendant le chantier | Zero | Continue a chaque sprint |
| Budget | Hors cadre | Integre (20% dette/sprint) |
| Regression | Tres probable | Controlee par les tests |

La reecriture complete est presque toujours une erreur strategique quand le projet est en retard, le budget contraint, la plateforme en production, et l'equipe en tension.

Ce que je dis a l'equipe : "Je comprends la frustration. Mais reecrire le back-end, c'est 6 mois minimum ou on ne livre rien, avec un projet deja en retard. En revanche, on va ameliorer systematiquement ce qu'on touche, et prendre les bonnes decisions d'architecture pour la suite."

---

## Mon approche : migration progressive (Strangler Fig Pattern)

Au lieu de reecrire, on enveloppe et remplace progressivement :

1. Les **nouveaux modules** sont ecrits en FastAPI si c'est justifie techniquement
2. Les **modules existants** sont migres vers FastAPI **quand on les touche** pour une feature ou un fix
3. L'ingress K8S route le trafic vers Django ou FastAPI selon l'endpoint
4. Aucun big bang. La migration se fait sur 12-18 mois, transparente pour les utilisateurs

**Criteres de choix Django vs FastAPI :**
- CRUD simple avec admin → Django (on garde)
- API haute performance, requetes complexes → FastAPI (async natif)
- Module avec beaucoup de logique existante → Django (risque de regression)
- Interop FHIR (I/O bound) → FastAPI

---

## Structurer les debats : Architecture Decision Records (ADR)

Les desaccords se reglent aujourd'hui par la force de conviction. Je mets en place les ADR : un document court (1 page) par decision d'architecture, avec contexte, options, avantages/inconvenients, et decision.

**Regles du jeu :**
- Tout le monde peut proposer un ADR, senior ou junior
- Les arguments sont factuels : benchmarks, contraintes projet (pas "je prefere X")
- Delai de decision : 1 semaine max
- Si pas de consensus, le Delivery Manager tranche et assume
- Une decision prise est respectee par tous. On peut la revisiter avec un nouvel ADR, pas en la sabotant

Pour le dev senior contestataire, ce cadre lui donne un espace legitime d'expression et des criteres objectifs, mais aussi des limites claires.

---

## Plan d'action

**Semaine 3-4** : Lancer le premier ADR "Strategie de coexistence Django/FastAPI". Le dev senior contestataire est invite a co-rediger. Identifier les 3-5 modules candidats a la migration.

**Mois 2-3** : Migrer un premier module pilote vers FastAPI (petit, bien delimite, a forte valeur). Le dev senior contestataire peut le porter. Mesurer performance, temps de dev, couverture de tests avant/apres.

**Mois 4+** : Decider de la suite sur la base des resultats reels. Si FastAPI apporte les gains attendus, on continue la migration progressive. Sinon, on ajuste.

**Le vrai enjeu n'est pas "Django vs FastAPI". C'est d'avoir un cadre ou les desaccords techniques se transforment en decisions eclairees, pas en conflits.**
