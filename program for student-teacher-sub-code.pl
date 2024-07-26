% Facts
% student(StudentName, TeacherName, SubjectCode)
student('KISHORE', 'Mr. Smith', 'MATH101').
student('DAYA', 'Mrs. Johnson', 'ENG202').
student('AKASH', 'Mr. Smith', 'MATH101').
student('JUDE', 'Mr. White', 'SCI303').
student('RAVI', 'Mrs. Johnson', 'ENG202').

% Rules
% Find the teacher of a given student
find_teacher(Student, Teacher) :-
    student(Student, Teacher, _).

% Find the subject code associated with a given student
find_subject_code(Student, SubjectCode) :-
    student(Student, _, SubjectCode).

% Find all students of a given teacher
find_students_of_teacher(Teacher, Students) :-
    findall(Student, student(Student, Teacher, _), Students).

% Find all students taking a specific subject
find_students_of_subject(SubjectCode, Students) :-
    findall(Student, student(Student, _, SubjectCode), Students).

% Add a new student-teacher-subject association
add_student(Student, Teacher, SubjectCode) :-
    assertz(student(Student, Teacher, SubjectCode)).

% Remove a student from the database
remove_student(Student) :-
    retract(student(Student, _, _)).
