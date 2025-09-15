% Prolog database for Student - Teacher - Subject Code

% Format: teaches(Teacher, SubjectCode).
%         enrolled(Student, SubjectCode).

% Teacher and Subject assignments
teaches('Dr.Ram', cs101).
teaches('Prof.Anita', cs102).
teaches('Dr.Kiran', cs103).

% Student enrollments
enrolled('Arun', cs101).
enrolled('Divya', cs101).
enrolled('Karthik', cs102).
enrolled('Priya', cs103).
enrolled('Meena', cs102).

% Rule: find teacher of a student
student_teacher(Student, Teacher) :-
    enrolled(Student, SubjectCode),
    teaches(Teacher, SubjectCode).

% Rule: find subject code for a student
student_subject(Student, SubjectCode) :-
    enrolled(Student, SubjectCode).
