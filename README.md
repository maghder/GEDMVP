# GEDMVP — NOVAREG

Prototype de démonstration utilisant un organisme fictif nommé **NOVAREG**.

Le MVP illustre la chaîne suivante :

**Bureau d'Ordre → qualification métier → instruction → validation → mise à jour automatique d'un référentiel structuré → retour Bureau d'Ordre → préparation Data Platform.**

## Objectif

Le projet vise à démontrer :

- la séparation des responsabilités entre le Bureau d'Ordre et le métier ;
- la qualification d'un acte par le métier après réception du courrier ;
- une validation stricte avant toute modification du référentiel ;
- la mise à jour automatique du référentiel après validation ;
- la traçabilité entre courrier, acte métier, décision et donnée ;
- l'exposition de données structurées vers une future Data Platform.

## Stack du prototype

- Directus 12.3.1
- PostgreSQL sur Neon
- Render pour héberger Directus
- GitHub pour versionner la configuration
- Stockage documentaire persistant à ajouter dans une étape ultérieure

## Règle de confidentialité

Le projet utilise exclusivement :

- des noms fictifs ;
- des entreprises fictives ;
- des codes fictifs ;
- des documents fictifs ;
- des données de démonstration.

Ne jamais déposer dans ce dépôt :

- un mot de passe ;
- une chaîne de connexion réelle ;
- une donnée institutionnelle réelle ;
- un document professionnel réel ;
- une donnée personnelle réelle.

## Architecture fonctionnelle

```text
Courrier entrant
      ↓
Bureau d'Ordre
      ↓
Enregistrement + scan
      ↓
Transmission au métier
      ↓
Qualification de l'acte
      ↓
Instruction
      ↓
Validation métier
      ↓
Automatisation Directus
      ↓
Référentiel unique
      ↓
Décision
      ↓
Retour Bureau d'Ordre
      ↓
Courrier départ / clôture
```

## Déploiement

### 1. Créer la base PostgreSQL sur Neon

Créer un projet PostgreSQL puis récupérer la chaîne de connexion au format :

```text
postgresql://USER:PASSWORD@HOST/DATABASE?sslmode=require
```

### 2. Déployer Directus sur Render

Dans Render :

1. Cliquer sur **New +**
2. Choisir **Blueprint**
3. Connecter le dépôt GitHub `GEDMVP`
4. Render détecte automatiquement `render.yaml`
5. Renseigner :
   - `DB_CONNECTION_STRING` : chaîne de connexion Neon
   - `ADMIN_EMAIL` : adresse d'administration du MVP
   - `ADMIN_PASSWORD` : mot de passe fort réservé au MVP
6. Lancer le déploiement.

`SECRET` est généré automatiquement par Render.

### 3. Première connexion

À la fin du déploiement, Render fournit une URL du type :

```text
https://novareg-gedmvp.onrender.com
```

Ouvrir cette URL et se connecter avec `ADMIN_EMAIL` et `ADMIN_PASSWORD`.

## Collections prévues

Le modèle métier sera créé dans Directus avec les collections suivantes :

1. `REF_EAR`
2. `REF_Intermediaires`
3. `REL_Intermediaire_EAR`
4. `BO_Courriers`
5. `DOS_Actes`

## Profils prévus

- `BO`
- `METIER_INSTRUCTEUR`
- `METIER_VALIDATEUR`
- `ADMIN_MVP`

## Actes de démonstration

Le MVP couvrira uniquement trois cas fictifs :

1. Nouvel agrément
2. Changement d'adresse
3. Changement de qualité Agent → Courtier

## Limitation temporaire

Le stockage documentaire persistant n'est pas encore configuré.

La première étape consiste à valider :

- Directus ;
- PostgreSQL ;
- le modèle de données ;
- les rôles ;
- les workflows ;
- les tableaux de bord.

Le stockage des PDF et scans sera ajouté ensuite via un stockage objet compatible S3.
