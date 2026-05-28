from django.db import models


class Categorie(models.Model):
    nom = models.CharField(max_length=100)
    descriptif = models.TextField()

    def __str__(self):
        return self.nom


class Auteur(models.Model):
    nom = models.CharField(max_length=100)
    prenom = models.CharField(max_length=100)
    age = models.IntegerField()
    photo = models.ImageField(upload_to='auteurs/', blank=True, null=True)

    def __str__(self):
        return f"{self.prenom} {self.nom}"


class Jeu(models.Model):
    titre = models.CharField(max_length=200)
    annee_sortie = models.IntegerField()
    photo_boite = models.ImageField(upload_to='jeux/', blank=True, null=True)
    editeur = models.CharField(max_length=150)

    auteur = models.ForeignKey(Auteur, on_delete=models.CASCADE)
    categorie = models.ForeignKey(Categorie, on_delete=models.CASCADE)

    def __str__(self):
        return self.titre