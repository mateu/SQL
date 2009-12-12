insert into mxhunter_schools (name) values('Indiana');
insert into mxhunter_schools (name) values('Montana');
insert into mxhunter_schools (name) values('Catalunya');
insert into mxhunter_schools (name) values('Steep_Path');
insert into mxhunter_schools (name) values('Wide_Path');

insert into mxhunter_teachers (name) values('Yeti');
insert into mxhunter_teachers (name) values('Ali');
insert into mxhunter_teachers (name) values('Pele');
insert into mxhunter_teachers (name) values('Jose');
insert into mxhunter_teachers (name) values('Surya');

insert into mxhunter_students (name) values('Jo');
insert into mxhunter_students (name) values('Xavi');
insert into mxhunter_students (name) values('Pooh');
insert into mxhunter_students (name) values('Carles');
insert into mxhunter_students (name) values('Mari-Juana');

insert into mxhunter_admins (year, season, grade) values (2007, 'fall', 1);
insert into mxhunter_admins (year, season, grade) values (2007, 'fall', 2);
insert into mxhunter_admins (year, season, grade) values (2008, 'spring', 1);
insert into mxhunter_admins (year, season, grade) values (2008, 'spring', 2);
insert into mxhunter_admins (year, season, grade) values (2008, 'fall', 1);

insert into mxhunter_questions () values();
insert into mxhunter_questions () values();
insert into mxhunter_questions () values();
insert into mxhunter_questions () values();
insert into mxhunter_questions () values();

insert into mxhunter_answers (question_id, score) values(1, 1);
insert into mxhunter_answers (question_id, score) values(1, 0);
insert into mxhunter_answers (question_id, score) values(1, 0);
insert into mxhunter_answers (question_id, score) values(2, 0);
insert into mxhunter_answers (question_id, score) values(2, 1);
 

insert into mxhunter_questions2admins (question_id, admin_id) values (1, 1);
insert into mxhunter_questions2admins (question_id, admin_id) values (2, 2);
insert into mxhunter_questions2admins (question_id, admin_id) values (3, 3);
insert into mxhunter_questions2admins (question_id, admin_id) values (4, 4);
insert into mxhunter_questions2admins (question_id, admin_id) values (1, 5);

insert into mxhunter_classes (school_id, teacher_id, admin_id) values (1, 1, 1);
insert into mxhunter_classes (school_id, teacher_id, admin_id) values (1, 1, 2);
insert into mxhunter_classes (school_id, teacher_id, admin_id) values (2, 2, 1);
insert into mxhunter_classes (school_id, teacher_id, admin_id) values (2, 3, 1);
insert into mxhunter_classes (school_id, teacher_id, admin_id) values (1, 1, 5);

insert into mxhunter_students2classes (school_id, teacher_id, admin_id, student_id) values (1, 1, 1, 1);
insert into mxhunter_students2classes (school_id, teacher_id, admin_id, student_id) values (1, 1, 2, 2);
insert into mxhunter_students2classes (school_id, teacher_id, admin_id, student_id) values (2, 2, 1, 3);
insert into mxhunter_students2classes (school_id, teacher_id, admin_id, student_id) values (2, 3, 1, 4);
insert into mxhunter_students2classes (school_id, teacher_id, admin_id, student_id) values (1, 1, 5, 1);

insert into mxhunter_answers_given (answer_id, question_id, admin_id, student_id) values (1, 1, 1, 1);
insert into mxhunter_answers_given (answer_id, question_id, admin_id, student_id) values (1, 2, 1, 1);
insert into mxhunter_answers_given (answer_id, question_id, admin_id, student_id) values (1, 3, 1, 1);
insert into mxhunter_answers_given (answer_id, question_id, admin_id, student_id) values (1, 1, 5, 1);
insert into mxhunter_answers_given (answer_id, question_id, admin_id, student_id) values (1, 2, 5, 1);







