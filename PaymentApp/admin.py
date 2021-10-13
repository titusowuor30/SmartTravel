from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(TMSPayment)
admin.site.register(MpesaPayment)
admin.site.register(MpesaCallBacks)
admin.site.register(MpesaCalls)