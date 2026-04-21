from django.urls import path
from . import views

urlpatterns = [
    path('branches/', views.get_branches),
    path('semesters/<int:year_id>/', views.get_semesters),
    path('subjects/<int:branch_id>/<int:semester_id>/', views.get_subjects),
    path('papers/<int:subject_id>/', views.get_papers),
]