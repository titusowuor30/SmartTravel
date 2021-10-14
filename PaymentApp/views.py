''' /PaymentApp/views.py '''

from django.shortcuts import render
from django.template.context_processors import csrf
from BookTicketApp.models import PackageDetails,TMSBooking
from django.contrib.auth.decorators import login_required
from authentication.models import TMSUser
from .models import TMSPayment
from django.contrib.auth.models import User
from django.contrib.sessions.models import Session
from django.http import HttpResponseRedirect
from django.utils.crypto import get_random_string
#mpesa api inte. imports
from django.http import HttpResponse, JsonResponse
import requests
from requests.auth import HTTPBasicAuth
import json
from . mpesa_credentials import MpesaAccessToken, LipanaMpesaPpassword
from django.views.decorators.csrf import csrf_exempt
from .models import MpesaPayment
import math

@login_required
def CalculateAmount(request):
    return render(request,'amount.html')

@login_required
def makepayment(request):
    c={}
    c.update(csrf(request))
    request.session['mode']=request.POST.get('mode','')
    return render(request,'payment_mode.html',c)



#django mpesa integration
def getAccessToken(request):
    consumer_key = 'uFyrYGiOZlGAThVxOX6MYygg4nBS1n9z'
    consumer_secret = 'AFy4MgcMPdbko3Uh'
    api_URL = 'https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials'
    r = requests.get(api_URL, auth=HTTPBasicAuth(consumer_key, consumer_secret))
    mpesa_access_token = json.loads(r.text)
    validated_mpesa_access_token = mpesa_access_token['access_token']
    return HttpResponse(validated_mpesa_access_token)   

#lipa na mpesa functio
@login_required
def lipa_na_mpesa_online(request):
    if request.method == 'POST':
        session_amnt = request.session.get('total_amount')
        f_amount=float(session_amnt)
        amount=math.floor(f_amount)
        phone = request.POST.get('phone')
        print(request.POST)
        print("\n\nphone:" + str(phone) + "\n\n")
        access_token = MpesaAccessToken.validated_mpesa_access_token
        api_url = "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest"
        headers = {"Authorization": "Bearer %s" % access_token}
        api_request = {
            "BusinessShortCode": LipanaMpesaPpassword.Business_short_code,
            "Password": LipanaMpesaPpassword.decode_password,
            "Timestamp": LipanaMpesaPpassword.lipa_time,
            "TransactionType": "CustomerPayBillOnline",
            "Amount": amount,
            "PartyA": phone,  # replace with your phone number to get stk push
            "PartyB": LipanaMpesaPpassword.Business_short_code,
            "PhoneNumber": phone,  # replace with your phone number to get stk push
            "CallBackURL": "https://sandbox.safaricom.co.ke/mpesa/",
            "AccountReference": "Travello",
            "TransactionDesc": "TDBSoft Travello Ltd"
        }
        response = requests.post(api_url, json=api_request, headers=headers)

        # save payment to database
        mode = request.session.get('mode')
        c = {}
        paymentid = LipanaMpesaPpassword.lipa_time
        request.session['paymentid'] = paymentid
        p = TMSPayment(payment_id=paymentid, amount=int(float(amount)), mode=mode, tmsuser=TMSUser.objects.get(user=request.user))
        p.save()
        print(api_request)
        booking_type=request.session.get('booking_type')
        print(booking_type)
        if booking_type == 'bus_booking':
           request.session['booking_type']=''
           return render(request,'buses/booking_details.html',locals())
        else:
            return render(request, 'bill.html',locals())



@csrf_exempt
def register_urls(request):
    access_token = MpesaAccessToken.validated_mpesa_access_token
    api_url = "https://sandbox.safaricom.co.ke/mpesa/c2b/v1/registerurl"
    headers = {"Authorization": "Bearer %s" % access_token}
    options = {"ShortCode": LipanaMpesaPpassword.Business_short_code,
               "ResponseType": "Completed",
               "ConfirmationURL": "http://192.168.43.110:8000/payment/bill/confirmation",
               "ValidationURL": "http://192.168.43.110:8000/payment/bill/validation"}
    response = requests.post(api_url, json=options, headers=headers)
    print("\n\noptions:"+str(options)+"\n\n")
    return HttpResponse(response.text)


@csrf_exempt
def call_back(request):
    pass

@csrf_exempt
def validation(request):
    context = {
        "ResultCode": 0,
        "ResultDesc": "Accepted"
    }
    return JsonResponse(dict(context))


@csrf_exempt
def confirmation(request):
    mpesa_body=request.body.decode('utf-8')
    mpesa_payment = json.loads(mpesa_body)
    payment = MpesaPayment(
        first_name=mpesa_payment['FirstName'],
        last_name=mpesa_payment['LastName'],
        middle_name=mpesa_payment['MiddleName'],
        description=mpesa_payment['TransID'],
        phone_number=mpesa_payment['MSISDN'],
        amount=mpesa_payment['TransAmount'],
        reference=mpesa_payment['BillRefNumber'],
        organization_balance=mpesa_payment['OrgAccountBalance'],
        type=mpesa_payment['TransactionType'],
    )
    print("\n\npay details:"+str(payment)+"\n\n")
    payment.save()
    context = {
        "ResultCode": 0,
        "ResultDesc": "Accepted"
    }
    return JsonResponse(dict(context))     


