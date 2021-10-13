''' /BookTicketApp/views.py '''
from django.contrib import messages
from django.shortcuts import render,redirect
from django.http import HttpResponseRedirect
from django.template.context_processors import csrf
from django.contrib.auth.decorators import login_required
from BookTicketApp.models import *
from authentication.models import *
from django.utils.timezone import datetime
from django.utils.crypto import get_random_string

# index page
def index(request):
     dest_regions = Destination.objects.all()
     dest1 = Destination.objects.all().order_by('-region__region_name')[:4]
     dest_count=len(Destination.objects.filter().values('dest_name').distinct())
     return render(request, 'destinations/index.html', {'dest_regions': dest_regions, 'dest1': dest1,'dest_count':dest_count})

def book_tour(request):
    tour_reservation=Tour_reservation()
    tour_reservation.user=request.user.TMuser
    tour_reservation.tour_ticket=get_random_string(length=6)
    tour_reservation.tour_site=request.POST.get('tour_site')
    print(request.POST)
    tour_reservation.full_name=request.POST.get('full_name')
    tour_reservation.phone_number=request.POST.get('phone_no')
    tour_reservation.id_number=request.POST.get('id_no')
    tour_reservation.save()
    message=f"Hello,{request.user.username}. Your tour reservation at {tour_reservation.tour_site} ticket numbber:{tour_reservation.tour_ticket} was successful!" \
            f"\nPlease book a transport ticket to the site below!"
    return render(request,'destinations/feedback.html',locals())

@login_required
def destination_list(request,region_name):
    dest_regions = Destination.objects.all().filter(region__region_name=region_name)
    request.session['region_name']=region_name
    return render(request,'destinations/travel_destination.html',{'dest_regions': dest_regions})


def destination_details(request,dest_name):
    dest = Destination.objects.get(dest_name=dest_name)
    price = dest.price
    request.session['price'] = price
    request.session['city'] = dest_name
    request.session['tour_site']=dest_name
    return render(request,'destinations/destination_details.html',{'dest':dest})

def search(request):
    try:
        place1 = request.POST.get('query')
        dest = Destination.objects.get(dest_name=place1)
        return render(request, 'destinations/destination_details.html', {'dest': dest})
    except:
        messages.info(request, 'Place not found')
        return redirect('index')

@login_required
def book_ticket(request):
    c={}
    source=Source.objects.all()
    dests=Destination.objects.all()
    packs=PackageDetails.objects.all()
    c.update(csrf(request))
    request.session['temp']="xyz"
    request.session['full_name']=request.user.username
    randomid=get_random_string(length=6)
    return render(request,'book_ticket.html',locals())

@login_required
def bookingdataadd(request):
    bookingid=request.POST.get('bookingid','')
    source1=request.POST.get('source','')
    destination1=request.POST.get('destination','')
    package1=request.POST.get('package','')
    date=request.POST.get('date','')
    no_of_person=request.POST.get('person','')
    amt=PackageDetails.objects.get(pname=package1).amount
    total_amount=int(no_of_person)*int(amt)
    request.session['total_amount']=total_amount
    s=TMSBooking(booking_id=bookingid,amount=total_amount,source=source1,destination=destination1,
                 package=PackageDetails.objects.get(pname=package1),departure_date=date,
                 no_of_person=no_of_person,tmsuser=TMSUser.objects.get(user=request.user))
    if(source1!=destination1):
        s.save()
        request.session['package']=package1
        request.session['nop'] = no_of_person
        request.session['source']=source1
        request.session['destination']=destination1
        request.session['date']=date
        return redirect('calcamnt')
    else:
        request.session['error3']="Source and Destination can't be same"
        return HttpResponseRedirect('book-ticket')

@login_required
def booking_history(request):
    request.session['temp']="abc"
    c={}
    c['today']=datetime.today().date()
    c['bookings'] = TMSBooking.objects.filter(tmsuser=request.user.TMuser)
    return render(request,'booking_history.html',c)

def delete(request):
    TMSBooking.objects.filter(booking_id=request.POST.get('cancel')).delete()
    return redirect('booking-history')

@login_required
def feedback(request):
    return render(request,'feedback.html')


def addfeedback(request):
    if request.method == 'POST':
        comment = request.POST.get('feedback','')
        rating = request.POST.get('rating','')
        f = feedback()
        f.tmsuser = TMSUser.objects.get(user=request.user)
        f.rating = rating
        f.comment = comment
        f.save()
    return render(request, 'home.html')
