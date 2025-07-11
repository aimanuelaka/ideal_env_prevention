# 🔐 Politique de Sécurité Git – Projet Lambda

Ce projet utilise **Git Hooks** via [Pre-commit](https://pre-commit.com) et [Talisman](https://github.com/thoughtworks/talisman) pour garantir la qualité et la sécurité du code **dès le poste développeur**.

## ✅ Objectifs

- Empêcher la fuite de secrets (clés API, mots de passe)
- Standardiser le formatage et la qualité du code
- Appliquer une sécurité proactive (Shift-left)
- Réduire les coûts de conformité (PCI-DSS, RGPD)

## 🛠 Outils intégrés

| Outil      | Rôle                                         |
|------------|----------------------------------------------|
| Talisman   | Détecte les secrets ou fichiers sensibles    |
| Gitleaks   | Détection de secrets connus (regex)          |
| Black      | Formatage automatique du code Python         |
| Yamllint   | Validation syntaxique YAML                   |

## 🚀 Installation

```bash
bash install-precommit.sh
