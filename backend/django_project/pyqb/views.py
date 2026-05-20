from django.http import JsonResponse
from django.db.models import Subquery
from .models import Branch, Semester, Subject, QuestionPaper
import json

def get_branches(request):
    return JsonResponse(list(Branch.objects.values()), safe=False)

def get_branches_by_year(request, year_id):
    """
    Get branches filtered by year:
    - 1st Year (year_id=1): Only CSE (8) and EEE (9)
    - Other Years (2,3,4): All branches except CSE and EEE
    """
    if year_id == 1:
        # 1st year: Only CSE and EEE
        branches = Branch.objects.filter(branch_id__in=[8, 9]).values()
    else:
        # 2nd, 3rd, 4th year: All except CSE and EEE
        branches = Branch.objects.exclude(branch_id__in=[8, 9]).values()
    
    return JsonResponse(list(branches), safe=False)

def get_semesters(request, year_id):
    return JsonResponse(
        list(Semester.objects.filter(year_id=year_id).values()),
        safe=False
    )

def get_subjects(request, branch_id, semester_id):
    # Only return subjects that have at least one question paper
    subjects = Subject.objects.filter(
        branch_id=branch_id,
        semester_id=semester_id,
        subject_id__in=Subquery(QuestionPaper.objects.filter(
            subject__branch_id=branch_id,
            subject__semester_id=semester_id
        ).values_list('subject_id', flat=True).distinct())
    ).values()
    return JsonResponse(list(subjects), safe=False)

def get_subjects_by_year(request, branch_id, year_id):
    """Get subjects for a specific branch and year (combines all semesters for that year) - only subjects with papers"""
    subjects = Subject.objects.filter(
        branch_id=branch_id,
        semester__year_id=year_id,
        subject_id__in=Subquery(QuestionPaper.objects.filter(
            subject__branch_id=branch_id,
            subject__semester__year_id=year_id
        ).values_list('subject_id', flat=True).distinct())
    ).values('subject_id', 'subject_name', 'subject_code').distinct()
    return JsonResponse(list(subjects), safe=False)

def get_papers(request, subject_id):
    try:
        papers = QuestionPaper.objects.filter(subject_id=subject_id).values('paper_id', 'exam_session', 'file_path', 'subject_id')
        papers_list = list(papers)
        print(f"Papers found for subject_id {subject_id}: {papers_list}")  # Debug log
        return JsonResponse(papers_list, safe=False)
    except Exception as e:
        print(f"Error in get_papers: {str(e)}")  # Debug log
        return JsonResponse({"error": str(e)}, status=500)