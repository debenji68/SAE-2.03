from django.shortcuts import render, redirect, get_object_or_404
from django.db.models import Avg

from .models import Categorie, Auteur, Jeu, Joueur, Commentaire, ListeJeux
from .forms import CategorieForm, AuteurForm, JeuForm, JoueurForm, CommentaireForm


def accueil(request):
    # .order_by('?') dit à la base de données de trier aléatoirement
    # .first() prend le tout premier élément du résultat
    jeu_aleatoire = Jeu.objects.order_by('?').first()
    auteur_aleatoire = Auteur.objects.order_by('?').first()
    categorie_aleatoire = Categorie.objects.order_by('?').first()
    commentaire_aleatoire = Commentaire.objects.order_by('?').first()

    # On envoie ces variables au template HTML
    context = {
        'jeu_choisi': jeu_aleatoire,
        'auteur_choisi': auteur_aleatoire,
        'categorie_choisie': categorie_aleatoire,
        'commentaire_choisi': commentaire_aleatoire,
    }

    return render(request, 'ludotheque/accueil.html', context)


# ============================================================
# PAGES DE DÉTAIL ACCESSIBLES DEPUIS LA SÉLECTION ALÉATOIRE
# ============================================================

def jeux_par_auteur(request, id):
    # Tous les jeux écrits par un auteur donné
    auteur = get_object_or_404(Auteur, pk=id)
    jeux = Jeu.objects.filter(auteur=auteur)
    return render(request, 'ludotheque/jeux/par_auteur.html', {
        'auteur': auteur,
        'jeux': jeux,
    })


def jeux_par_categorie(request, id):
    # Tous les jeux d'une catégorie donnée
    categorie = get_object_or_404(Categorie, pk=id)
    jeux = Jeu.objects.filter(categorie=categorie)
    return render(request, 'ludotheque/jeux/par_categorie.html', {
        'categorie': categorie,
        'jeux': jeux,
    })


def fiche_jeu(request, id):
    # Fiche détaillée d'un jeu + ses commentaires
    jeu = get_object_or_404(Jeu, pk=id)
    commentaires = jeu.commentaires.select_related('joueur').all()
    return render(request, 'ludotheque/jeux/fiche.html', {
        'jeu': jeu,
        'commentaires': commentaires,
    })


def commentaires_joueur(request, id):
    # Tous les commentaires écrits par un joueur donné
    joueur = get_object_or_404(Joueur, pk=id)
    commentaires = Commentaire.objects.filter(joueur=joueur).select_related('jeu')
    return render(request, 'ludotheque/commentaires/par_joueur.html', {
        'joueur': joueur,
        'commentaires': commentaires,
    })


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
    joueurs = Joueur.objects.all()

# PARTIE ALGORITHMIQUE AMAURY :

    for jeu in jeux:
        #1) Moyenne des notes par type de joueur
        # On groupe les commentaires du jeu par type de joueur,
        # puis on calcule la moyenne SQL (Avg) pour chaque groupe.
        moyennes = (
            Commentaire.objects
            .filter(jeu=jeu)
            .values('joueur__type_joueur')        # regroupe par type
            .annotate(moyenne=Avg('note'))         # moyenne par groupe
        )
        # On transforme le résultat en dictionnaire simple :
        dico_moyennes = {
            ligne['joueur__type_joueur']: round(ligne['moyenne'], 2)
            for ligne in moyennes
        }
        jeu.moyenne_particulier = dico_moyennes.get('particulier')
        jeu.moyenne_professionnel = dico_moyennes.get('professionnel')

        #2) Commentaire avec la note la plus HAUTE (top)
        jeu.meilleur_commentaire = (
            Commentaire.objects
            .filter(jeu=jeu)
            .order_by('-note', '-date')         # note décroissante
            .first()
        )

        #3) Commentaire avec la note la plus BASSE (flop)
        jeu.pire_commentaire = (
            Commentaire.objects
            .filter(jeu=jeu)
            .order_by('note', '-date')             # note croissante
            .first()
        )

    return render(request, 'ludotheque/jeux/liste.html', {
        'jeux': jeux,
        'joueurs': joueurs,
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


def ma_liste_jeux(request, id):
    joueur = get_object_or_404(Joueur, pk=id)

    # Créer la liste si elle n'existe pas encore
    liste, created = ListeJeux.objects.get_or_create(joueur=joueur)

    if request.method == 'POST':
        jeu_id = request.POST.get('jeu_id')
        if jeu_id:
            jeu = get_object_or_404(Jeu, pk=jeu_id)
            liste.jeux.add(jeu)
        return redirect('ma_liste_jeux', id=joueur.id)

    # Jeux pas encore dans la liste (pour le formulaire d'ajout)
    jeux_disponibles = Jeu.objects.exclude(id__in=liste.jeux.all())

    return render(request, 'ludotheque/liste_jeux/ma_liste.html', {
        'joueur': joueur,
        'liste': liste,
        'jeux_disponibles': jeux_disponibles,
    })


def retirer_jeu_liste(request, joueur_id, jeu_id):
    joueur = get_object_or_404(Joueur, pk=joueur_id)
    jeu = get_object_or_404(Jeu, pk=jeu_id)

    liste = get_object_or_404(ListeJeux, joueur=joueur)
    liste.jeux.remove(jeu)

    return redirect('ma_liste_jeux', id=joueur.id)


def commenter_jeu(request, jeu_id):
    jeu = get_object_or_404(Jeu, pk=jeu_id)

    if request.method == 'POST':
        joueur_id = request.POST.get('joueur_id')
        note = request.POST.get('note')
        commentaire_texte = request.POST.get('commentaire', '')

        joueur = get_object_or_404(Joueur, pk=joueur_id)

        Commentaire.objects.create(
            jeu=jeu,
            joueur=joueur,
            note=note,
            commentaire=commentaire_texte,
        )

    return redirect('liste_jeux')


def ajouter_jeu_liste_depuis_jeux(request, jeu_id):
    jeu = get_object_or_404(Jeu, pk=jeu_id)

    if request.method == 'POST':
        joueur_id = request.POST.get('joueur_id')
        joueur = get_object_or_404(Joueur, pk=joueur_id)

        liste, created = ListeJeux.objects.get_or_create(joueur=joueur)
        liste.jeux.add(jeu)

    return redirect('liste_jeux')



# IMPORT DE JEUX VIA UN FICHIER CSV AMAURY
# Permet d'insérer plusieurs jeux d'un coup à partir d'un fichier CSV.
# Si l'auteur indiqué n'existe pas encore, il est créé automatiquement
# à partir de son nom et son prénom.
# Le format attendu est décrit en préambule de la page de chargement.
import csv
import io


def importer_jeux_csv(request):
    # Variables qui serviront à afficher le bilan de l'import dans la page
    resultat = None
    erreurs = []
    nb_jeux = 0
    nb_auteurs = 0

    if request.method == 'POST' and request.FILES.get('fichier_csv'):
        fichier = request.FILES['fichier_csv']

        # Vérification basique de l'extension
        if not fichier.name.endswith('.csv'):
            erreurs.append("Le fichier doit avoir l'extension .csv")
        else:
            # Décodage du fichier en texte (utf-8-sig gère le BOM d'Excel)
            try:
                donnees = fichier.read().decode('utf-8-sig')
            except UnicodeDecodeError:
                donnees = None
                erreurs.append("Le fichier doit être encodé en UTF-8.")

            if donnees is not None:
                # DictReader lit chaque ligne sous forme de dictionnaire
                # en se basant sur la ligne d'en-tête du CSV.
                lecteur = csv.DictReader(io.StringIO(donnees))

                # Colonnes obligatoires dans le fichier
                colonnes_attendues = {
                    'titre', 'annee_sortie', 'editeur',
                    'auteur_nom', 'auteur_prenom', 'categorie'
                }
                colonnes_fichier = set(lecteur.fieldnames or [])

                if not colonnes_attendues.issubset(colonnes_fichier):
                    manquantes = colonnes_attendues - colonnes_fichier
                    erreurs.append(
                        "Colonnes manquantes dans le fichier : "
                        + ", ".join(manquantes)
                    )
                else:
                    # On parcourt chaque ligne (numéro 2 = 1re ligne de données,
                    # car la ligne 1 est l'en-tête)
                    for numero, ligne in enumerate(lecteur, start=2):
                        try:
                            titre = ligne['titre'].strip()
                            annee = int(ligne['annee_sortie'].strip())
                            editeur = ligne['editeur'].strip()
                            auteur_nom = ligne['auteur_nom'].strip()
                            auteur_prenom = ligne['auteur_prenom'].strip()
                            categorie_nom = ligne['categorie'].strip()

                            # On refuse les lignes avec un champ vide
                            if not all([titre, editeur, auteur_nom,
                                        auteur_prenom, categorie_nom]):
                                raise ValueError("un champ obligatoire est vide")

                            #Création automatique de l'auteur si besoin
                            # get_or_create : récupère l'auteur s'il existe déjà
                            # (même nom + prénom), sinon le crée. L'âge est mis
                            # à 0 par défaut car non fourni dans le fichier.
                            auteur, auteur_cree = Auteur.objects.get_or_create(
                                nom=auteur_nom,
                                prenom=auteur_prenom,
                                defaults={'age': 0},
                            )
                            if auteur_cree:
                                nb_auteurs += 1

                            #Récupère ou crée la catégorie
                            categorie, _ = Categorie.objects.get_or_create(
                                nom=categorie_nom,
                                defaults={'descriptif': ''},
                            )

                            #Création du jeu
                            Jeu.objects.create(
                                titre=titre,
                                annee_sortie=annee,
                                editeur=editeur,
                                auteur=auteur,
                                categorie=categorie,
                            )
                            nb_jeux += 1

                        except ValueError as e:
                            erreurs.append(f"Ligne {numero} ignorée : {e}")

                    resultat = (
                        f"{nb_jeux} jeu(x) importé(s), "
                        f"{nb_auteurs} auteur(s) créé(s) automatiquement."
                    )

    return render(request, 'ludotheque/jeux/importer_csv.html', {
        'resultat': resultat,
        'erreurs': erreurs,
    })