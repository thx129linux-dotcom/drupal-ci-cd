# Drupal CI/CD avec Jenkins et Docker

## Présentation

Ce projet a pour objectif de démontrer la mise en place d'une chaîne **CI/CD** complète autour de **Drupal**, **Docker** et **Jenkins**.

L'application est conteneurisée avec Docker, versionnée avec Git/GitHub et déployée automatiquement grâce à un pipeline Jenkins.

---

# Technologies utilisées

* Drupal 11
* Docker
* Docker Compose
* Jenkins
* Git / GitHub
* MariaDB
* Linux (Ubuntu)

---

# Architecture

```text
GitHub
   │
git push
   │
   ▼
Jenkins
   │
   ├── Checkout du code
   ├── Build Docker
   ├── Tests
   ├── Déploiement
   └── Vérification
          │
          ▼
Docker Compose
   │
   ├── Drupal
   └── MariaDB
```

---

# Structure du projet

```text
drupal-ci-cd/
│
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
├── README.md
├── .gitignore
└── web/
```

---

# Installation

## Cloner le projet

```bash
git clone git@github.com:thx129linux-dotcom/drupal-ci-cd.git
cd drupal-ci-cd
```

## Construire les conteneurs

Docker Compose V2 :

```bash
docker compose up -d --build
```

Docker Compose V1 :

```bash
docker-compose up -d --build
```

---

# Accès à Drupal

```
http://localhost:8082
```

Paramètres de connexion à la base :

| Paramètre | Valeur |
| --------- | ------ |
| Database  | drupal |
| Username  | drupal |
| Password  | drupal |
| Host      | db     |

---

# Pipeline Jenkins

Le pipeline est défini dans le fichier `Jenkinsfile`.

Il réalise les étapes suivantes :

1. Checkout du dépôt Git.
2. Vérification de Docker.
3. Construction de l'image Docker.
4. Déploiement avec Docker Compose.
5. Vérification des conteneurs.

---

# CI/CD

Le pipeline peut être déclenché :

* manuellement avec **Build Now** ;
* automatiquement via un **Webhook GitHub**.

Flux de travail :

```text
Développeur
     │
git push
     │
     ▼
GitHub
     │
Webhook
     │
     ▼
Jenkins
     │
Checkout
     │
Build
     │
Deploy
     │
Docker Compose
     │
Drupal disponible
```

---

# Améliorations possibles

Ce projet peut être enrichi avec :

* PHP_CodeSniffer (qualité du code)
* PHPUnit (tests automatisés)
* SonarQube (analyse de qualité)
* Trivy (scan de sécurité Docker)
* OWASP Dependency-Check
* Prometheus
* Grafana
* Déploiement sur un serveur distant
* Kubernetes

---

# Compétences démontrées

Ce projet met en œuvre :

* Gestion de versions avec Git.
* Hébergement du code sur GitHub.
* Création d'images Docker.
* Orchestration avec Docker Compose.
* Mise en place d'un pipeline Jenkins.
* Déploiement continu (CI/CD).
* Administration Linux.
* Gestion d'une base de données MariaDB.
* Déploiement d'une application Drupal.

---

# Ce que j'ai appris

Au cours de ce projet, j'ai appris à :

* créer une infrastructure Docker pour Drupal ;
* automatiser le déploiement avec Jenkins ;
* utiliser GitHub comme dépôt central ;
* comprendre le fonctionnement d'une chaîne CI/CD ;
* diagnostiquer des erreurs de build, de Git et de Docker ;
* reproduire un workflow proche d'un environnement professionnel.

---

# Évolutions prévues

Les prochaines étapes sont :

* automatiser les tests avant le déploiement ;
* publier les images Docker dans un registre ;
* déployer sur un serveur distant via SSH ;
* superviser l'application avec Prometheus et Grafana ;
* migrer le déploiement vers Kubernetes.

---

# Auteur

Projet réalisé dans le cadre d'un apprentissage des pratiques DevOps et CI/CD avec Drupal, Docker et Jenkins.
