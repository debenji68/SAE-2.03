from django import forms
from .models import Categorie, Auteur, Jeu


class CategorieForm(forms.ModelForm):
    class Meta:
        model = Categorie
        fields = '__all__'


class AuteurForm(forms.ModelForm):
    class Meta:
        model = Auteur
        fields = '__all__'


class JeuForm(forms.ModelForm):
    class Meta:
        model = Jeu
        fields = '__all__'