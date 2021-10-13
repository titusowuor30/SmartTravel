''' /BookTicketApp/models.py '''

from django.db import models
from authentication.models import TMSUser

class Destination(models.Model):
    region=models.ForeignKey('Regions',on_delete=models.CASCADE,related_name='destinations',default=1)
    dest_id = models.AutoField(primary_key=True)
    days = models.IntegerField(default=5)
    price = models.IntegerField(default=20000)
    rating = models.IntegerField(default=5)
    dest_name = models.CharField(max_length=25)
    img1=models.ImageField(upload_to='pics')
    img2 = models.ImageField(upload_to='pics')
    desc = models.TextField()
    day1= models.CharField(max_length=200)
    day2 = models.CharField(max_length=200)
    day3 = models.CharField(max_length=200)
    day4 = models.CharField(max_length=200)
    day5 = models.CharField(max_length=200)
    day6 = models.CharField(max_length=200)

    def __str__(self):
        return self.dest_name
    class Meta:
        verbose_name_plural='Destinations'


class Regions(models.Model):
    region_name= models.CharField(max_length=20)
    img1 = models.ImageField(upload_to='pics',default='pics/salafy_1.png')

    def __str__(self):
        return self.region_name
    class Meta:
        verbose_name_plural='Destination Regions'

    def region_dest_count(self):
       return self.destination_set.count()

class PackageDetails(models.Model):
    pname = models.CharField(max_length=20,primary_key=True,default="business class")
    amount = models.CharField(max_length=5)

    def __str__(self):
        return self.pname

class TMSBooking(models.Model):
    booking_id=models.CharField(max_length=6,primary_key=True)
    tmsuser = models.ForeignKey(TMSUser,on_delete=models.CASCADE,null=True)
    source = models.CharField(max_length=20)
    destination = models.CharField(max_length=20)
    package = models.ForeignKey(PackageDetails,on_delete=models.CASCADE,null=True)
    departure_date = models.DateField()
    no_of_person = models.PositiveIntegerField(default=0)
    amount=models.PositiveIntegerField()

    def __str__(self):
        return self.booking_id

class feedback(models.Model):
    tmsuser = models.ForeignKey(TMSUser, on_delete=models.CASCADE, null=True)
    rating=models.IntegerField(default=1,max_length=1)
    comment=models.TextField(max_length=255,default='realyy cool!')

    def __str__(self):
        return self.tmsuser.username


class Source(models.Model):
    name=models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Tour_reservation(models.Model):
    user=models.ForeignKey(TMSUser,on_delete=models.CASCADE,related_name='reservations')
    source=models.ForeignKey(Source,on_delete=models.CASCADE,related_name='reservations',blank=True,null=True)
    full_name=models.CharField(max_length=100,blank=True,null=True)
    id_number=models.CharField(max_length=10,blank=True,null=True)
    phone_number=models.CharField(max_length=15,blank=True,null=True)
    tour_site=models.CharField(max_length=200)
    tour_ticket=models.CharField(max_length=200)

    def __str__(self):
        return self.tour_site

    class Meta:
        verbose_name_plural='Tour reservations'