from django.shortcuts import render
from django.http import HttpResponse
from main.models import *
from django.core import serializers

def user_data(request, user_id=None):
	if (request.method == 'GET'):
		user = Person.objects.filter(pk=user_id)
		json_user = serializers.serialize("json", user, indent=2)
		return HttpResponse(json_user, mimetype="application/json")

	elif (request.method == 'POST'):
		return HttpResponse(status=200)

	else:
		print ("invalid request type")
		return HttpResponse(status=502)
