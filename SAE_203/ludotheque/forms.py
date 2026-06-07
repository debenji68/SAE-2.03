from django.forms import ModelForm
from django import forms
from django.utils.translation import gettext_lazy as _
from . import models
from .models import Categorie, Auteur, Jeu, Joueur, Commentaire

class JoueurForm(ModelForm):
    password = forms.CharField(
        widget=forms.PasswordInput(),
        label=_('Mot de passe')
    )
    class Meta:
        model = Joueur
        fields = ['username', 'first_name', 'last_name', 'email', 'password', 'type_joueur']
        labels = {
            'username': _('Nom utilisateur'),
            'first_name': _('Prénom'),
            'last_name': _('Nom'),
            'email': _('Adresse Mail'),
            'type_joueur': _('Tye de joueur'),
        }

class CommentaireForm(ModelForm):
    class Meta:
        model = Commentaire
        fields = ['note', 'commentaire']
        labels = {
            'note': _('Note globale /20'),
            'commentaire': _('Votre avis détaillé'),
        }


class CategorieForm(forms.ModelForm):
    class Meta:
        model = Categorie
        fields = '__all__'


class AuteurForm(forms.ModelForm):
    class Meta:
        model = Auteur
        # Ajoute 'photo' ici :
        fields = ['nom', 'prenom', 'age', 'photo', 'biographie']
        widgets = {
            'biographie': forms.Textarea(attrs={'rows': 4}),
        }

class JeuForm(forms.ModelForm):
    class Meta:
        model = Jeu
        fields = '__all__'
