from django.urls import path
from . import views

urlpatterns = [
    path('', views.accueil, name='accueil'),

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

    path('joueurs/', views.joueur_liste, name='joueur_liste'),
    path('joueurs/nouveau/', views.joueur_creer, name='joueur_creer'),
    path('joueurs/<int:pk>/modifier/', views.joueur_modifier, name='joueur_modifier'),
    path('joueurs/<int:pk>/supprimer/', views.joueur_supprimer, name='joueur_supprimer'),
    path('joueurs/<int:joueur_id>/liste/', views.ma_liste_jeux, name='ma_liste_jeux'),
    path('joueurs/<int:joueur_id>/retirer/<int:jeu_id>/', views.retirer_jeu_liste, name='retirer_jeu_liste'),
    path('jeux/<int:jeu_id>/joueur/<int:joueur_id>/commentaire/', views.commentaire_creer, name='commentaire_creer'),
]