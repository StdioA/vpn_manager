from django.db import models


class Account(models.Model):
    name = models.CharField(max_length=64)
    phone_number = models.CharField(max_length=11)
    email = models.EmailField(max_length=64)
    password = models.CharField(max_length=64)
