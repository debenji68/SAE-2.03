from django.shortcuts import render, redirect, get_object_or_404

from .models import Categorie, Auteur, Jeu
from .forms import CategorieForm, AuteurForm, JeuForm


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