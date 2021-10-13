'''/PaymentApp/urls.py'''

from PaymentApp.views import *
from django.urls import path

urlpatterns=[
	path('CalculateAmount/',CalculateAmount,name='calcamnt'),
	path('makepayment/',makepayment,name='pay'),
	path('bill/',lipa_na_mpesa_online,name='bill'),
    path('access/token',getAccessToken, name='get_mpesa_access_token'),

	# register, confirmation, validation and callback urls
    path('c2b/register',register_urls, name="register_mpesa_validation"),
    path('c2b/confirmation',confirmation, name="confirmation"),
    path('c2b/validation',validation, name="validation"),
    path('c2b/callback',call_back, name="call_back"),
]