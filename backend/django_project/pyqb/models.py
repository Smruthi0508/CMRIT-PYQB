from django.db import models

class Branch(models.Model):
    branch_id = models.AutoField(primary_key=True)
    branch_name = models.CharField(max_length=100)
    branch_code = models.CharField(max_length=10)

    class Meta:
        db_table = 'branches'


class Year(models.Model):
    year_id = models.AutoField(primary_key=True)
    year_name = models.CharField(max_length=20)

    class Meta:
        db_table = 'years'


class Semester(models.Model):
    semester_id = models.AutoField(primary_key=True)
    year = models.ForeignKey(Year, on_delete=models.CASCADE)
    semester_number = models.IntegerField()

    class Meta:
        db_table = 'semesters'


class Subject(models.Model):
    subject_id = models.AutoField(primary_key=True)
    branch = models.ForeignKey(Branch, on_delete=models.CASCADE)
    semester = models.ForeignKey(Semester, on_delete=models.CASCADE)
    subject_name = models.CharField(max_length=150)
    subject_code = models.CharField(max_length=20)

    class Meta:
        db_table = 'subjects'


class QuestionPaper(models.Model):
    paper_id = models.AutoField(primary_key=True)
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    exam_year = models.IntegerField()
    file_path = models.CharField(max_length=255)

    class Meta:
        db_table = 'question_papers'