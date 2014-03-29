# Initialize database
# MeetUp

from main.models import Location, Person, Event, UserEventData
from django.utils import timezone
from datetime import datetime
import pytz

# Create some locations
# Andy's House
l1 = Location(latitude=40.451891, longtitude=-79.950388)
l1.save()

# Create some users
u1 = Person(first_name='Andy',
            last_name='Wang',
            email='andywcmu@gmail.com',
            phone='(412)478-2331',
            sign_up_time=timezone.now(),
            location=l1,
            location_last_updated=timezone.now())
u1.save()

# Create some events
# e1 = Event(name='MeetUp meeting',
# 	       time=datetime(2014, 7, 27, 14, 00, 00, 00 pytz.EST),
# 	       location_name='Gates 7th floor',
# 	       location=Location(latitude=40.444046, logntitude=-79.944414),
# 	       )