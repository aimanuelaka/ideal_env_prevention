#!/bin/bash

echo "🔧 Installation de Pre-commit et configuration des hooks..."

# 1. Installer pre-commit
pip3 --version

# 1. Installer pre-commit
pip3 install pre-commit || { echo "❌ pip manquant !"; exit 1; }

# 2. Installer talisman (Linux/Mac - sinon installe manuellement depuis GitHub)
if ! command -v talisman &> /dev/null; then
  echo "⏬ Talisman non détecté. Installation via Brew..."
  if command -v brew &> /dev/null; then
    brew install talisman
  else
    echo "⚠️ Installez Talisman manuellement depuis : https://github.com/thoughtworks/talisman"
  fi
fi

# 3. Créer le fichier pre-commit config
cat <<EOF > .pre-commit-config.yaml
repos:
  - repo: https://github.com/psf/black
    rev: 24.3.0
    hooks:
      - id: black

  - repo: https://github.com/adrienverge/yamllint
    rev: v1.35.1
    hooks:
      - id: yamllint
        entry: yamllint
        language: python

  - repo: https://github.com/zricethezav/gitleaks
    rev: v8.18.2
    hooks:
      - id: gitleaks
        stages: [commit]

  - repo: local
    hooks:
      - id: talisman
        name: talisman
        entry: talisman --githook pre-commit
        language: system
        types: [file]

EOF

# 4. Installer les hooks
pre-commit install
pre-commit autoupdate

echo "✅ Pre-commit et Talisman configurés avec succès !"
