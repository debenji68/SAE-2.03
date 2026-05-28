from django.db import models

class Joueur(models.Model):
    username = models.CharField(max_length=100, unique=True)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    email = models.EmailField(max_length=50)
    password = models.CharField(max_length=255)
    TYPES_CHOICES = [
        ('particulier', 'Particulier'),
        ('professionnel', 'Professionnel'),
    ]
    type_joueur = models.CharField(max_length=20, choices=TYPES_CHOICES, default='particulier')

    def __str__(self):
        return self.username

class Commentaire(models.Model):
    jeu = models.ForeignKey('Jeu', on_delete=models.CASCADE, related_name='commentaires')
    joueur = models.ForeignKey('Joueur', on_delete=models.CASCADE, related_name='commentaires')
    note = models.PositiveIntegerField(blank=False)
    commentaire = models.TextField(null = True, blank = True)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Avis de {self.joueur.username} sur {self.jeu.titre} ({self.note}/20)"


class ListeJeux(models.Model):
    joueur = models.OneToOneField('Joueur', on_delete=models.CASCADE, related_name='ma_liste')
    jeux = models.ManyToManyField('Jeu', blank=True, related_name='dans_les_listes')
    date_creation = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Liste de jeux de {self.joueur.username}"