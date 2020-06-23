from django.contrib.gis.db import models


class Position(models.Model):
    point = models.PointField()
