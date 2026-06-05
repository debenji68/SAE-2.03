from django.shortcuts import render, redirect, get_object_or_404

from .models import Categorie, Auteur, Jeu, Joueur, Commentaire
from .forms import CategorieForm, AuteurForm, JeuForm, JoueurForm, CommentaireForm


def accueil(request):
    return render(request, 'ludotheque/accueil.html')


def liste_categories(request):
    categories = Categorie.objects.all()
    return render(request, 'ludotheque/categories/liste.html', {
        'categories': categories
    })


def ajouter_categorie(request):
    if request.method == 'POST':
        form = CategorieForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('liste_categories')
    else:
        form = CategorieForm()
    return render(request, 'ludotheque/categories/form.html', {
        'form': form,
        'titre': 'Ajouter une catégorie'
    })


def modifier_categorie(request, id):
    categorie = get_object_or_404(Categorie, pk=id)
    if request.method == 'POST':
        form = CategorieForm(request.POST, instance=categorie)
        if form.is_valid():
            form.save()
            return redirect('liste_categories')
    else:
        form = CategorieForm(instance=categorie)
    return render(request, 'ludotheque/categories/form.html', {
        'form': form,
        'titre': 'Modifier une catégorie'
    })


def supprimer_categorie(request, id):
    categorie = get_object_or_404(Categorie, pk=id)
    if request.method == 'POST':
        categorie.delete()
        return redirect('liste_categories')
    return render(request, 'ludotheque/categories/supprimer.html', {
        'categorie': categorie
    })



def liste_auteurs(request):
    auteurs = Auteur.objects.all()
    return render(request, 'ludotheque/auteurs/liste.html', {
        'auteurs': auteurs
    })


def ajouter_auteur(request):
    if request.method == 'POST':
        form = AuteurForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('liste_auteurs')
    else:
        form = AuteurForm()
    return render(request, 'ludotheque/auteurs/form.html', {
        'form': form,
        'titre': 'Ajouter un auteur'
    })


def modifier_auteur(request, id):
    auteur = get_object_or_404(Auteur, pk=id)
    if request.method == 'POST':
        form = AuteurForm(request.POST, request.FILES, instance=auteur)
        if form.is_valid():
            form.save()
            return redirect('liste_auteurs')
    else:
        form = AuteurForm(instance=auteur)
    return render(request, 'ludotheque/auteurs/form.html', {
        'form': form,
        'titre': 'Modifier un auteur'
    })


def supprimer_auteur(request, id):
    auteur = get_object_or_404(Auteur, pk=id)
    if request.method == 'POST':
        auteur.delete()
        return redirect('liste_auteurs')
    return render(request, 'ludotheque/auteurs/supprimer.html', {
        'auteur': auteur
    })



def liste_jeux(request):
    jeux = Jeu.objects.all()
    return render(request, 'ludotheque/jeux/liste.html', {
        'jeux': jeux
    })


def ajouter_jeu(request):
    if request.method == 'POST':
        form = JeuForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('liste_jeux')
    else:
        form = JeuForm()
    return render(request, 'ludotheque/jeux/form.html', {
        'form': form,
        'titre': 'Ajouter un jeu'
    })


def modifier_jeu(request, id):
    jeu = get_object_or_404(Jeu, pk=id)
    if request.method == 'POST':
        form = JeuForm(request.POST, request.FILES, instance=jeu)
        if form.is_valid():
            form.save()
            return redirect('liste_jeux')
    else:
        form = JeuForm(instance=jeu)
    return render(request, 'ludotheque/jeux/form.html', {
        'form': form,
        'titre': 'Modifier un jeu'
    })


def supprimer_jeu(request, id):
    jeu = get_object_or_404(Jeu, pk=id)
    if request.method == 'POST':
        jeu.delete()
        return redirect('liste_jeux')
    return render(request, 'ludotheque/jeux/supprimer.html', {
        'jeu': jeu
    })


def liste_joueurs(request):
    joueurs = Joueur.objects.all()
    return render(request, 'ludotheque/joueurs/liste.html', {
        'joueurs': joueurs
    })


def ajouter_joueur(request):
    if request.method == 'POST':
        form = JoueurForm(request.POST)
        if form.is_valid():
            joueur = form.save(commit=False)
            joueur.password = form.cleaned_data['password']
            joueur.save()
            return redirect('liste_joueurs')
    else:
        form = JoueurForm()
    return render(request, 'ludotheque/joueurs/form.html', {
        'form': form,
        'titre': 'Ajouter un joueur'
    })


def modifier_joueur(request, id):
    joueur = get_object_or_404(Joueur, pk=id)
    if request.method == 'POST':
        form = JoueurForm(request.POST, instance=joueur)
        if form.is_valid():
            form.save()
            return redirect('liste_joueurs')
    else:
        form = JoueurForm(instance=joueur)
    return render(request, 'ludotheque/joueurs/form.html', {
        'form': form,
        'titre': 'Modifier un joueur'
    })


def supprimer_joueur(request, id):
    joueur = get_object_or_404(Joueur, pk=id)
    if request.method == 'POST':
        joueur.delete()
        return redirect('liste_joueurs')
    return render(request, 'ludotheque/joueurs/supprimer.html', {
        'joueur': joueur
    })


def fiche_joueur(request, id):
    joueur = get_object_or_404(Joueur, pk=id)
    return render(request, 'ludotheque/joueurs/fiche.html', {
        'joueur': joueur
    })


def liste_commentaires(request):
    commentaires = Commentaire.objects.select_related('joueur', 'jeu').all()
    return render(request, 'ludotheque/commentaires/liste.html', {
        'commentaires': commentaires
    })


def ajouter_commentaire(request):
    if request.method == 'POST':
        form = CommentaireForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('liste_commentaires')
    else:
        form = CommentaireForm()
    return render(request, 'ludotheque/commentaires/form.html', {
        'form': form,
        'titre': 'Ajouter un commentaire'
    })


def modifier_commentaire(request, id):
    commentaire = get_object_or_404(Commentaire, pk=id)
    if request.method == 'POST':
        form = CommentaireForm(request.POST, instance=commentaire)
        if form.is_valid():
            form.save()
            return redirect('liste_commentaires')
    else:
        form = CommentaireForm(instance=commentaire)
    return render(request, 'ludotheque/commentaires/form.html', {
        'form': form,
        'titre': 'Modifier un commentaire'
    })


def supprimer_commentaire(request, id):
    commentaire = get_object_or_404(Commentaire, pk=id)
    if request.method == 'POST':
        commentaire.delete()
        return redirect('liste_commentaires')
    return render(request, 'ludotheque/commentaires/supprimer.html', {
        'commentaire': commentaire
    })