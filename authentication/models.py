from django.db import models

from django.db import models
from django.contrib.auth.models import User

class TMSUser(models.Model):
	user = models.OneToOneField(User,on_delete=models.CASCADE,related_name='TMuser')
	mobileno = models.CharField(max_length=15)

	def __str__(self):
		return self.user.username

	class Meta:
		verbose_name_plural='Travel Users'
