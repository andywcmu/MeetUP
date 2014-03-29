from django.contrib import admin
from main.models import Person, Event, UserEventData

admin.site.register(Person)
admin.site.register(Event)
admin.site.register(UserEventData)