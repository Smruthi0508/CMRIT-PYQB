from django.urls import path
from . import views

urlpatterns = [
    path('branches/', views.get_branches),
    path('branches-year/<int:year_id>/', views.get_branches_by_year),
    path('semesters/<int:year_id>/', views.get_semesters),
    path('subjects/<int:branch_id>/<int:semester_id>/', views.get_subjects),
    path('subjects-year/<int:branch_id>/<int:year_id>/', views.get_subjects_by_year),
    path('papers/<int:subject_id>/', views.get_papers),
]