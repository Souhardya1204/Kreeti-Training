-- Create database
create database schoolm_tutorial;

-- Select database
use schoolm_tutorial;

-- Create table

create table students (
  id SERIAL,
  name varchar(255) not null,
  city varchar(255),
  primary key (id)
);

create table classes (
  id SERIAL,
  name varchar(25) not null,
  section varchar(25) not null,
  primary key (id)
);

create table class_students (
  id SERIAL,
  roll int not null,
  class_id int not null,
  student_id int not null,
  primary key (id),
  foreign key (class_id) references classes(id),
  foreign key (student_id) references students(id)
);

create table class_tests (
  id SERIAL,
  name varchar(50) not null,
  total_marks int default 100,
  class_id int not null,
  primary key (id),
  foreign key (class_id) references classes(id),
  check (total_marks > 0)
);

create table marks (
  id SERIAL,
  class_test_id int not null,
  student_id int not null,
  marks int default 0,
  primary key (id),
  foreign key (class_test_id) references class_tests(id),
  foreign key (student_id) references students(id),
  check (marks >= 0)
);
