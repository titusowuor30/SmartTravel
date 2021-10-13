
from .views import *
#from django.contrib.auth import views as auth_views
from django.urls import path

urlpatterns=[
    path('',home,name='home'),
    path('login/',login,name='login'),
    path('logout/',logout,name='logout'),
    path('auth/',auth_view,name='auth'),
    path('aboutus/',aboutus,name='about'),
    path('signup/',signup,name='signup'),
	path('adduserinfo/',adduserinfo,name='adduserinfo'),
]