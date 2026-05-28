from django.forms import ModelForm
from django import forms  # On importe forms pour avoir accès au PasswordInput
from django.utils.translation import gettext_lazy as _
from . import models

class JoueurForm(ModelForm):
    password = forms.CharField(
        widget=forms.PasswordInput(),
        label=_('Mot de passe')
    )
    class Meta:
        model = models.Joueur
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
        model = models.Commentaire
        fields = ['note', 'commentaire']
        labels = {
            'note': _('Note globale /20'),
            'commentaire': _('Votre avis détaillé'),
        }
