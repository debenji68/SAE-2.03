# SAE-2.03
Interface de gestion d'une ludothèque

# 🎲 Gestion de Ludothèque - SAÉ RT3 Informatique

Ce projet a été réalisé dans le cadre de la compétence **RT3 (Programmer)**. L'objectif est de concevoir et déployer une solution web complète (Django/Python) hébergée sur une VM Linux pour la gestion conviviale d'une ludothèque.

## 👥 L'Équipe (Groupe 4)
*   **Étudiant A** : Création et mises en place des CRUDS joueurs, commentaires et liste personel. Création et configuration de la VM web et de la VM BDD.
*   **Étudiant B** : Création et mises en places des CRUDS jeux, catégories et auteurs.
*   **Étudiant C** : Création de la Base de Donnée MySQL et conception du site web (Html/CSS).
*   **Étudiant D** : Algorithmique (Stats, Moyennes), Import CSV et Génération de fiches.

---

## 🚀 Fonctionnalités
Le site permet de gérer l'ensemble des données d'une ludothèque avec les fonctionnalités suivantes :
- **Authentification** : Inscription et connexion (Profils Particulier ou Professionnel).
- **Catalogue Complet (CRUD)** : Consultation, insertion et modification des jeux, auteurs et catégories.
- **Aspect Social** : Système de commentaires et notation sur les jeux.
- **Algorithmes Avancés** : 
    - Calcul automatique de la moyenne des notes par type d'usager.
    - Mise en avant des commentaires "Top" (meilleure note) et "Flop" (pire note).
- **Importation de données** : Ajout massif de jeux via un fichier CSV/JSON (création automatique des auteurs si inexistants).
- **Reporting** : Génération d'une fiche récapitulative par joueur.
