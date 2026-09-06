# GEDMVP — Directus

MVP de démonstration de la chaîne :

**Bureau d'Ordre → qualification métier → instruction → validation → mise à jour automatique du référentiel → retour BO → préparation Data Platform.**

## Stack

- Directus 12.3.1
- PostgreSQL sur Neon
- Render pour héberger Directus
- GitHub pour versionner la configuration

## Sécurité

Ne jamais déposer dans ce dépôt :
- mot de passe ;
- chaîne de connexion réelle ;
- donnée ACAPS réelle ;
- document ACAPS réel.

Le MVP utilise uniquement des données fictives.

## Déploiement

### 1. Neon
Créer un projet PostgreSQL et copier la chaîne de connexion au format :

```text
postgresql://USER:PASSWORD@HOST/DATABASE?sslmode=require
```

### 2. Render
Dans Render :

1. New +
2. Blueprint
3. Connecter le dépôt GitHub `GEDMVP`
4. Render détecte `render.yaml`
5. Renseigner :
   - `DB_CONNECTION_STRING` : chaîne Neon
   - `ADMIN_EMAIL` : email admin du MVP
   - `ADMIN_PASSWORD` : mot de passe fort
6. Lancer le déploiement.

`SECRET` est généré automatiquement.

### 3. Connexion
À la fin du déploiement, ouvrir l'URL fournie par Render et se connecter avec les identifiants administrateur.

## Modèle à créer ensuite

1. `REF_EAR`
2. `REF_Intermediaires`
3. `REL_Intermediaire_EAR`
4. `BO_Courriers`
5. `DOS_Actes`

Rôles :
- `BO`
- `AGREMENT_INSTRUCTEUR`
- `AGREMENT_VALIDATEUR`

## Limitation temporaire
Le stockage des PDF n'est pas encore persistant sur le plan gratuit Render.
Nous ajouterons ensuite un stockage objet compatible S3.
