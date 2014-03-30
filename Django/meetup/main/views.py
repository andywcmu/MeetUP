from django.shortcuts import render
from django.http import HttpResponse
from main.models import *
from django.core import serializers

# manipulate person data in database.
# if person_id == None and request.method = 'POST', create new person
# otherwise modify person data
def person_data(request, person_id=None):
	if (request.method == 'GET'):
		if person_id == None:
			print ("cannot get without person_id")
			return HttpResponse(status=502)

		# get user data
		person = Person.objects.filter(pk=person_id)
		if person is None:
			print ("cannot get person " + person_id)
			return HttpResponse(status=502)

		# transform it into json format
		json_user = serializers.serialize("json", person, indent=2)
		return HttpResponse(json_user, mimetype="application/json")

	elif (request.method == 'POST'):
		first_name 						= request.REQUEST.get("first_name", "")
		last_name 						= request.REQUEST.get("last_name", "")
		email 								= request.REQUEST.get("email", "")
		phone 								= request.REQUEST.get("phone", "")
		sign_up_time 					= request.REQUEST.get("sign_up_time", "")
		location_latitude			= request.REQUEST.get("location_latitude", "")
		location_longtitude   = request.REQUEST.get("location_longtitude", "")
		location_last_updated = request.REQUEST.get("location_last_updated", "")

		# create new person
		if person_id == None:
			location = Location.object.create (latitude=location_latitude,
																	       longtitude=location_longtitude)

			Person.objects.create (first_name=first_name,
														 last_name=last_name,
														 email=email,
														 phone=phone,
														 sign_up_time=sign_up_time,
														 location=location,
														 location_last_updated=location_last_updated)

		# modify person
		else:
			try:
				person = Person.objects.get(pk=person_id)
			except:
				print ("cannot get person " + person_id)
				return HttpResponse(status=502)

			# modify data
			person.first_name						 = first_name
			person.last_name 						 = last_name
			person.email 								 = email
			person.phone 								 = phone
			person.sign_up_time					 = sign_up_time
			person.location.latitude 		 = location_latitude
			person.location.longtitude 	 = location_longtitude
			person.location_last_updated = location_last_updated
			person.save()
			
		return HttpResponse(status=200)

	else:
		print ("invalid request type")
		return HttpResponse(status=502)
