from django.db import models

class Location(models.Model):
	latitude = models.DecimalField()
	longtitude = models.DecimalField()

class Person(models.Model):
	first_name = models.CharField(max_length=64)
	last_name = models.CharField(max_length=64)
	email = models.CharField(max_length=128)
	phone = models.CharField(max_length=16)
	sign_up_time = models.DateTimeField()
	location = models.ForeignKey(Location)
	location_last_updated = models.DateTimeField()

class Event(models.Model):
	name = models.CharField(max_length=128)
	time = models.DateTimeField()
	location_name = models.CharField(max_length=128)
	location = models.ForeignKey(Location)
	participants = models.ManyToManyField(Person, through='UserEventData')

class UserEventData(models.Model):
	person = models.ForeignKey(Person)
	group = models.ForeignKey(Event)
	edit_permission = models.BooleanField()




# Many-to-many relationship tutorial:
# https://docs.djangoproject.com/en/dev/topics/db/models/#many-to-many-relationships