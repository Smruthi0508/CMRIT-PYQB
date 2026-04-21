from django.http import JsonResponse
from .models import Branch, Semester, Subject, QuestionPaper

def get_branches(request):
    return JsonResponse(list(Branch.objects.values()), safe=False)

def get_semesters(request, year_id):
    return JsonResponse(
        list(Semester.objects.filter(year_id=year_id).values()),
        safe=False
    )

def get_subjects(request, branch_id, semester_id):
    return JsonResponse(
        list(Subject.objects.filter(branch_id=branch_id, semester_id=semester_id).values()),
        safe=False
    )

def get_papers(request, subject_id):
    return JsonResponse(
        list(QuestionPaper.objects.filter(subject_id=subject_id).values()),
        safe=False
    )