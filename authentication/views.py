''' /loginmodule/views.py '''

from django.shortcuts import render,redirect
from django.http import HttpResponseRedirect
from django.contrib import auth
from django.template.context_processors import csrf
from BookTicketApp.models import PackageDetails
from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.contrib import auth
from django.template.context_processors import csrf
from .models import TMSUser
from django.contrib.auth.models import User

def signup(request):
    c={}
    c.update(csrf(request))
    return render(request,'auth/signup.html',c)

def adduserinfo(request):
	uname=request.POST.get('username','')
	pwd=request.POST.get('password','')
	cpwd=request.POST.get('cpassword','')
	emailid=request.POST.get('emailid','')
	mno=request.POST.get('mobileno','')
	if(pwd==cpwd):
		if(len(pwd)>8):
			u=User.objects.create_user(username=uname,password=pwd,email=emailid)
			print(u)
			u.TMSUser = TMSUser(user=u,mobileno=mno)
			u.TMSUser.save()
			u.save()
			return HttpResponseRedirect('auth/login')
		else:
			return render(request,'auth/signup.html',{"error1":"password length is lessthan 8"})
	else:
		return render(request,'auth/signup.html',{"error2":"password doesn't match enter again"})


def home(request):
	c={}
	c.update(csrf(request))
	request.session['temp'] = "xyz"
	c['packs'] = PackageDetails.objects.all()
	return render(request,'home.html',c)

def login(request):
		c={}
		c.update(csrf(request))
		return render(request,'auth/login.html',c)

def auth_view(request):
	username = request.POST.get('username','')
	password = request.POST.get('password','')
	user = auth.authenticate(username=username, password=password)
	if user is not None:
		auth.login(request, user)
		return redirect('index')
	else:
		return render(request,'auth/login.html',{"error":"Username or Password Invalid"})

def logout(request):
	auth.logout(request)
	return render(request, 'auth/logout.html')

def aboutus(request):
	request.session['temp'] = "xyz"
	return render(request,'aboutus.html')
