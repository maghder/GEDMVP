# NOVAREG — GEDMVP

Prototype fictif de démonstration :

**Bureau d'Ordre → qualification métier → instruction → validation → mise à jour automatique du référentiel → retour Bureau d'Ordre → préparation Data Platform.**

## Hébergement du MVP

Le prototype est exécuté dans **GitHub Codespaces** et utilise une base PostgreSQL externe **Neon**.

Aucune installation locale n'est nécessaire.

## 1. Secrets GitHub Codespaces

Dans le dépôt GitHub :

**Settings → Secrets and variables → Codespaces → New repository secret**

Créer exactement ces quatre secrets :

- `DB_CONNECTION_STRING`
- `ADMIN_EMAIL`
- `ADMIN_PASSWORD`
- `DIRECTUS_SECRET`

### DB_CONNECTION_STRING
Coller la chaîne PostgreSQL Neon complète.

### DIRECTUS_SECRET
Utiliser une longue valeur aléatoire réservée au MVP.

Ne jamais enregistrer ces valeurs dans les fichiers du dépôt.

## 2. Créer le Codespace

Dans la page du dépôt :

**Code → Codespaces → Create codespace on main**

GitHub construira automatiquement l'environnement défini dans :

`.devcontainer/devcontainer.json`

## 3. Démarrer Directus

Dans le terminal du Codespace :

```bash
./scripts/start-directus.sh
```

Attendre le démarrage de Directus.

## 4. Ouvrir l'application

Dans Codespaces :

1. Ouvrir l'onglet **PORTS**
2. Repérer le port **8055**
3. Cliquer sur l'icône d'ouverture dans le navigateur

L'URL ressemble à :

```text
https://NOM-DU-CODESPACE-8055.app.github.dev
```

## 5. Partage pour la démonstration

Pendant la construction, garder le port **Private**.

Pour une présentation :

**PORTS → clic droit sur 8055 → Port Visibility → Public**

Toute personne connaissant l'URL pourra alors atteindre la page Directus.
L'accès aux données reste protégé par l'authentification Directus.

Après la présentation, remettre le port en **Private**.

## 6. Persistance

La base métier est conservée dans Neon, même lorsque le Codespace s'arrête.

Les fichiers chargés directement dans le conteneur Directus ne doivent pas être considérés comme persistants.
Le stockage documentaire externe sera ajouté dans une étape ultérieure.

## Collections prévues

- `REF_EAR`
- `REF_Intermediaires`
- `REL_Intermediaire_EAR`
- `BO_Courriers`
- `DOS_Actes`

## Profils prévus

- `BO`
- `METIER_INSTRUCTEUR`
- `METIER_VALIDATEUR`
- `ADMIN_MVP`

## Données

Le prototype doit utiliser exclusivement des données et documents fictifs.
