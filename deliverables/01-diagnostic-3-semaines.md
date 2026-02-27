# Quelles analyses menez-vous et comment organisez-vous les 3 premieres semaines ?

J'arrive sur un projet en difficulte : 3 mois ecoules, 25% du budget consomme, 15% des fonctionnalites livrees. Avant de changer quoi que ce soit, je dois comprendre.

**Mon principe : les 3 premieres semaines, j'observe, j'ecoute, je diagnostique. Je n'agis que sur les urgences bloquantes.**

---

## Semaine 1 : Ecouter et comprendre

**Entretiens individuels** (1h chacun, tous les devs, en toute confidentialite). Je cherche a comprendre la charge reelle, les blocages quotidiens, ce qui marche, et le moral de chacun.

**Entretiens parties prenantes** :
- **DSN** : Attentes precises, contraintes politiques, marge de manoeuvre
- **Product Owner** : Priorites fonctionnelles, frustrations
- **2-3 utilisateurs cles** (medecins/chercheurs) : Usage reel, irritants
- **Ops / infra** : Etat du cluster K8S, incidents recents

**Audit technique rapide** (un scan, pas un audit complet) :
- Les 10 requetes SQL les plus lentes (`pg_stat_statements`)
- Pipeline CI/CD : historique des 30 derniers deploiements, taux d'echec
- Couverture de tests reelle (tests qui passent vs tests desactives)
- Les 120 tickets de dette : tri rapide en bloquant / structurant / cosmetique
- Coherence de l'architecture Django/FastAPI, points de fragilite

**Livrable** : document de diagnostic brut (carte des risques, top 5 problemes techniques, estimation de la velocite reelle).

---

## Semaine 2 : Analyser et prioriser

**Categorisation de la dette technique** :

| Categorie | Volume estime | Action |
|-----------|---------------|--------|
| **Bloquant** | ~15-20 tickets | Sprint en cours |
| **Structurant** | ~30-40 tickets | Budget de 20% par sprint |
| **Cosmetique** | ~60-70 tickets | Backlog, traite en opportunite |

**Plan de stabilisation en 3 axes** :
1. **Performance** : les requetes > 6s, c'est le probleme numero 1 visible par les utilisateurs
2. **Deploiements** : stabiliser la CI/CD pour arreter les rollbacks
3. **Equipe** : adresser les tensions

**Livrable** : plan de bataille (90 jours) partage avec le DSN -- objectifs mesurables a 30/60/90 jours, arbitrages proposes, risques majeurs.

---

## Semaine 3 : Cadrer et lancer

**Cadre de delivery** :
- Sprint de 2 semaines, decoupage 80% feature / 20% dette
- Definition of Done clarifiee : pas de merge sans tests, pas de deploy sans review

**Rituels** :

| Rituel | Frequence | Duree | Objectif |
|--------|-----------|-------|----------|
| Daily standup | Quotidien | 15 min | Deblocage |
| Sprint planning | Bi-hebdo | 2h | Engagement sprint |
| Sprint review | Bi-hebdo | 1h | Demo, feedback |
| Retro | Bi-hebdo | 1h | Amelioration continue |
| Comite delivery | Hebdo | 30 min | Arbitrages, risques |

**Premier sprint** : 1-2 quick wins performance, 1 action CI/CD (gate de tests avant merge), le reste en features prioritaires.

**Communication** :
- A l'equipe : "Voici ce que j'ai compris, ce qu'on va faire, et pourquoi"
- Au DSN : "Voici l'etat reel, mon plan, et ce dont j'ai besoin"
- Pas de promesse sur les delais tant que je n'ai pas vu un sprint complet tourner

---

## Ce que je ne fais PAS ces 3 premieres semaines

- Je ne reorganise pas l'equipe
- Je ne change pas l'architecture
- Je ne promets pas de dates
- Je ne blame personne

**L'objectif : comprendre la realite, construire la confiance, poser les bases d'un delivery maitrise.**
