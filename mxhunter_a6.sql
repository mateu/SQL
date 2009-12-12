# mateu x hunter
# mxhunter
# December 11, 2009
# Assignment 6

# Data Type Notes:
# names will be defined as type TEXT
# strings of known maximum length will be defined as VARCHAR(max_length).
# integer id fields of the entity tables are set to type INTEGER with 
# AUTO_INCREMENT.  This is a straight conversion of the ER model including
# foreign keys.

# Drop tables if they already exists
drop table if exists mxhunter_answers_given;
drop table if exists mxhunter_questions2admins;
drop table if exists mxhunter_students2classes;
drop table if exists mxhunter_classes;

drop table if exists mxhunter_admins;
drop table if exists mxhunter_answers;
drop table if exists mxhunter_questions;
drop table if exists mxhunter_schools;
drop table if exists mxhunter_teachers;
drop table if exists mxhunter_students;


# -- Define Entity Tables --#
# schools
create table mxhunter_schools (
	id integer NOT NULL AUTO_INCREMENT,
	name text NOT NULL,
	PRIMARY KEY(id)
)
;

# teachers
create table mxhunter_teachers (
	id integer NOT NULL AUTO_INCREMENT,
	name text NOT NULL,
	PRIMARY KEY(id)
)
;

# students
create table mxhunter_students (
	id integer NOT NULL AUTO_INCREMENT,
	name text NOT NULL,
	PRIMARY KEY(id)
)
;

# admins (tests administered)
create table mxhunter_admins (
	id integer NOT NULL AUTO_INCREMENT,
	year year(4) NOT NULL,
	season varchar(6) NOT NULL,
	grade integer NOT NULL,
	PRIMARY KEY(id)
)
;

# questions on the test (admin)
create table mxhunter_questions (
	id integer NOT NULL AUTO_INCREMENT,
	PRIMARY KEY(id)
)
;

# answers for questions
create table mxhunter_answers (
	id          integer NOT NULL AUTO_INCREMENT,
	question_id integer NOT NULL,
	score integer NOT NULL,
	PRIMARY KEY(id),
	CONSTRAINT answers_FK_question FOREIGN KEY(question_id) REFERENCES mxhunter_questions(id)
)
;

# -- Define Relational Tables - All have composite keys, i.e. multi-column #
# classes within a school
create table mxhunter_classes (
	school_id  integer NOT NULL,
	teacher_id integer NOT NULL,
	admin_id   integer NOT NULL,
	PRIMARY KEY(school_id, teacher_id, admin_id),
	CONSTRAINT classes_FK_school  FOREIGN KEY(school_id)  REFERENCES mxhunter_schools(id),
	CONSTRAINT classes_FK_teacher FOREIGN KEY(teacher_id) REFERENCES mxhunter_teachers(id),
	CONSTRAINT classes_FK_admin   FOREIGN KEY(admin_id)   REFERENCES mxhunter_admins(id)
)
;

# students assigned to classes
create table mxhunter_students2classes (
	student_id integer NOT NULL,
	teacher_id integer NOT NULL,
	school_id  integer NOT NULL,
	admin_id   integer NOT NULL,
	PRIMARY KEY(student_id, teacher_id, school_id, admin_id),
	CONSTRAINT classes_FK_student FOREIGN KEY(student_id) REFERENCES mxhunter_students(id),
	CONSTRAINT classes_FK_teacher FOREIGN KEY(teacher_id) REFERENCES mxhunter_teachers(id),
	CONSTRAINT classes_FK_school  FOREIGN KEY(school_id)  REFERENCES mxhunter_schools(id),
	CONSTRAINT classes_FK_admin   FOREIGN KEY(admin_id)   REFERENCES mxhunter_admins(id)
)
;

# questions that make up an admin
create table mxhunter_questions2admins (
	question_id integer NOT NULL,
	admin_id    integer NOT NULL,
	PRIMARY KEY(question_id, admin_id),
	CONSTRAINT questions2admins_FK_question FOREIGN KEY(question_id) REFERENCES mxhunter_questions(id),
	CONSTRAINT questions2admins_FK_admin    FOREIGN KEY(admin_id)    REFERENCES mxhunter_admins(id)
)
;

# answers given by a student for an admin
create table mxhunter_answers_given  (
	student_id  integer NOT NULL,
	admin_id    integer NOT NULL,
	question_id integer NOT NULL,
	answer_id   integer NOT NULL,
	PRIMARY KEY(student_id, admin_id, question_id, answer_id),
	CONSTRAINT answers_given_FK_student  FOREIGN KEY(student_id)  REFERENCES mxhunter_students(id),
	CONSTRAINT answers_given_FK_admin    FOREIGN KEY(admin_id)    REFERENCES mxhunter_admins(id),
	CONSTRAINT answers_given_FK_question FOREIGN KEY(question_id) REFERENCES mxhunter_questions(id),
	CONSTRAINT answers_given_FK_answer   FOREIGN KEY(answer_id)   REFERENCES mxhunter_answers(id)
)
;
