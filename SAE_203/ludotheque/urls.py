from django.urls import path
from . import views

urlpatterns = [
    path('', views.accueil, name='accueil'),

    # Pages de détail depuis la sélection aléatoire (reroll)
    path('auteurs/<int:id>/jeux/', views.jeux_par_auteur, name='jeux_par_auteur'),
    path('categories/<int:id>/jeux/', views.jeux_par_categorie, name='jeux_par_categorie'),
    path('jeux/<int:id>/fiche/', views.fiche_jeu, name='fiche_jeu'),
    path('joueurs/<int:id>/commentaires/', views.commentaires_joueur, name='commentaires_joueur'),

    # Catégories
    path('categories/', views.liste_categories, name='liste_categories'),
    path('categories/ajouter/', views.ajouter_categorie, name='ajouter_categorie'),
    path('categories/modifier/<int:id>/', views.modifier_categorie, name='modifier_categorie'),
    path('categories/supprimer/<int:id>/', views.supprimer_categorie, name='supprimer_categorie'),

    # Auteurs
    path('auteurs/', views.liste_auteurs, name='liste_auteurs'),
    path('auteurs/ajouter/', views.ajouter_auteur, name='ajouter_auteur'),
    path('auteurs/modifier/<int:id>/', views.modifier_auteur, name='modifier_auteur'),
    path('auteurs/supprimer/<int:id>/', views.supprimer_auteur, name='supprimer_auteur'),

    # Jeux
    path('jeux/', views.liste_jeux, name='liste_jeux'),
    path('jeux/ajouter/', views.ajouter_jeu, name='ajouter_jeu'),
    path('jeux/modifier/<int:id>/', views.modifier_jeu, name='modifier_jeu'),
    path('jeux/supprimer/<int:id>/', views.supprimer_jeu, name='supprimer_jeu'),
    path('jeux/importer-csv/', views.importer_jeux_csv, name='importer_jeux_csv'),
    path('jeux/<int:jeu_id>/commenter/', views.commenter_jeu, name='commenter_jeu'),
    path('jeux/<int:jeu_id>/ajouter-liste/', views.ajouter_jeu_liste_depuis_jeux, name='ajouter_jeu_liste_depuis_jeux'),


    # Joueurs
    path('joueurs/', views.liste_joueurs, name='liste_joueurs'),
    path('joueurs/ajouter/', views.ajouter_joueur, name='ajouter_joueur'),
    path('joueurs/modifier/<int:id>/', views.modifier_joueur, name='modifier_joueur'),
    path('joueurs/supprimer/<int:id>/', views.supprimer_joueur, name='supprimer_joueur'),
    path('joueurs/<int:id>/', views.fiche_joueur, name='fiche_joueur'),
    path('joueurs/<int:id>/liste/', views.ma_liste_jeux, name='ma_liste_jeux'),
    path('joueurs/<int:joueur_id>/liste/retirer/<int:jeu_id>/', views.retirer_jeu_liste, name='retirer_jeu_liste'),

    # Commentaires
    path('commentaires/', views.liste_commentaires, name='liste_commentaires'),
    path('commentaires/ajouter/', views.ajouter_commentaire, name='ajouter_commentaire'),
    path('commentaires/modifier/<int:id>/', views.modifier_commentaire, name='modifier_commentaire'),
    path('commentaires/supprimer/<int:id>/', views.supprimer_commentaire, name='supprimer_commentaire'),
]