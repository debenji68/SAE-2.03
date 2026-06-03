from django.shortcuts import render, redirect, get_object_or_404

from .models import Categorie, Auteur, Jeu
from ludotheque.models import Joueur, Commentaire, ListeJeux# CORRECTION ICI : On importe TOUS les formulaires (les leurs ET les tiens)
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
    return render(request, 'ludotheque/jeux/liste.html', {'jeux': jeux})


def ajouter_jeu(request):
    if request.method == 'POST':
        form = JeuForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('liste_jeux')
    else:
        form = JeuForm()
    return render(request, 'ludotheque/jeux/form.html', {'form': form,'titre': 'Ajouter un jeu'})


def modifier_jeu(request, id):
    jeu = get_object_or_404(Jeu, pk=id)
    if request.method == 'POST':
        form = JeuForm(request.POST, request.FILES, instance=jeu)
        if form.is_valid():
            form.save()
            return redirect('liste_jeux')
    else:
        form = JeuForm(instance=jeu)
    return render(request, 'ludotheque/jeux/form.html', {'form': form,'titre': 'Modifier un jeu'})


def supprimer_jeu(request, id):
    jeu = get_object_or_404(Jeu, pk=id)
    if request.method == 'POST':
        jeu.delete()
        return redirect('liste_jeux')
    return render(request, 'ludotheque/jeux/supprimer.html', {'jeu': jeu})


def joueur_creer(request):
    if request.method == "POST":
        form = JoueurForm(request.POST)
        if form.is_valid():
            nouveau_joueur = form.save()
            ListeJeux.objects.create(joueur=nouveau_joueur)
            return redirect('joueur_liste')
    else:
        form = JoueurForm()
    return render(request, 'ludotheque/joueur/joueur_form.html', {'form': form, 'action': 'Créer'})


def joueur_liste(request):
    joueurs = Joueur.objects.all()
    return render(request, 'ludotheque/joueur/joueur_liste.html', {'joueurs': joueurs})


def joueur_modifier(request, pk):
    joueur = get_object_or_404(Joueur, pk=pk)
    if request.method == "POST":
        form = JoueurForm(request.POST, instance=joueur)
        if form.is_valid():
            form.save()
            return redirect('joueur_liste')
    else:
        form = JoueurForm(instance=joueur)
    return render(request, 'ludotheque/joueur/joueur_form.html', {'form': form, 'action': 'Modifier'})


def joueur_supprimer(request, pk):
    joueur = get_object_or_404(Joueur, pk=pk)
    if request.method == "POST":
        joueur.delete()
        return redirect('joueur_liste')
    return render(request, 'ludotheque/joueur/joueur_confirmer_suppression.html', {'joueur': joueur})



def commentaire_creer(request, jeu_id, joueur_id):
    jeu = get_object_or_404(Jeu, id=jeu_id)
    joueur = get_object_or_404(Joueur, id=joueur_id)

    if request.method == "POST":
        form = CommentaireForm(request.POST)
        if form.is_valid():
            commentaire = form.save(commit=False)
            commentaire.jeu = jeu
            commentaire.joueur = joueur
            commentaire.save()
            return redirect('detail_jeu', pk=jeu.id)

    form = CommentaireForm()
    return render(request, 'ludotheque/joueur/commentaire_form.html', {'form': form, 'jeu': jeu})


def commentaire_supprimer(request, pk):
    commentaire = get_object_or_404(Commentaire, pk=pk)
    jeu_id = commentaire.jeu.id
    commentaire.delete()
    return redirect('detail_jeu', pk=jeu_id)


def ma_liste_jeux(request, joueur_id):
    joueur = get_object_or_404(Joueur, id=joueur_id)
    liste_complete = get_object_or_404(ListeJeux, joueur=joueur)
    jeux_de_la_liste = liste_complete.jeux.all()
    return render(request, 'ludotheque/joueur/ma_liste.html', {'joueur': joueur,'jeux': jeux_de_la_liste})


def ajouter_jeu_liste(request, joueur_id, jeu_id):
    joueur = get_object_or_404(Joueur, id=joueur_id)
    jeu = get_object_or_404(Jeu, id=jeu_id)
    liste_complete = get_object_or_404(ListeJeux, joueur=joueur)

    liste_complete.jeux.add(jeu)
    return redirect('ma_liste_jeux', joueur_id=joueur.id)


def retirer_jeu_liste(request, joueur_id, jeu_id):
    joueur = get_object_or_404(Joueur, id=joueur_id)
    jeu = get_object_or_404(Jeu, id=jeu_id)
    liste_complete = get_object_or_404(ListeJeux, joueur=joueur)

    liste_complete.jeux.remove(jeu)
    return redirect('ma_liste_jeux', joueur_id=joueur.id)