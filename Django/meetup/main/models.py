from django.db import models

class Location(models.Model):
	latitude = models.DecimalField(max_digits=10, decimal_places=6)
	longtitude = models.DecimalField(max_digits=10, decimal_places=6)

class Person(models.Model):
	first_name = models.CharField(max_length=64)
	last_name = models.CharField(max_length=64)
	email = models.CharField(max_length=128)
	phone = models.CharField(max_length=16)
	sign_up_time = models.DateTimeField()
	location = models.ForeignKey(Location)
	location_last_updated = models.DateTimeField()
	def __unicode__(self):
		return self.first_name + ' ' + self.last_name

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