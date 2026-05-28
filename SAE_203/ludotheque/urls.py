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
]