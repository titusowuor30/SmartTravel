''' /BookTicketApp/urls.py '''

from BookTicketApp.views import *
from authentication.views import *
from django.urls import path

urlpatterns=[
	path('',index, name='index'),
	path('search',search, name='search'),
	path('destination_list/<str:region_name>/',destination_list, name='destination_list'),
	path('destination_list/destination_details/<str:region_name>/<str:dest_name>/',destination_details, name='destination_details'),
	path('destination_details/<str:dest_name>/',destination_details, name='destination_details'),
	path('book_ticket/',book_ticket,name='book-ticket'),
	path('bookingdataadd/',bookingdataadd,name='bookdataadd'),
	path('booking_history/', booking_history,name='bookhistory'),
	path('delete/',delete,name='delete-book'),
	path('feedback/',feedback,name='feedback-fbook'),
    path('add/feedback/',addfeedback,name='feedback-add'),

    path('book-tour/',book_tour, name='book_tour'),
]