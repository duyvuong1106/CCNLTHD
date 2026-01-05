from ckeditor.fields import RichTextField
from cloudinary.models import CloudinaryField
from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    pass

class Category(models.Model):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name


class BaseModel(models.Model):
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    active = models.BooleanField(default=True)


    class Meta:
        abstract = True

class Course(BaseModel):
    subject = models.CharField(max_length=255)
    description = models.TextField(null=True)
    image = CloudinaryField(null=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)

    def __str__(self):
        return self.subject

class Lesson(BaseModel):
    subject = models.CharField(max_length=255)
    content = RichTextField()
    image = CloudinaryField(null=True)
    course = models.ForeignKey(Course, on_delete=models.RESTRICT)

    def __str__(self):
        return self.subject



