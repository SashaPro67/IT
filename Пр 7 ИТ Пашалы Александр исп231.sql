
\restrict HevbfSdYTCNQbcSbBTiu3Nfy2CsyIYshqHa9xAXs0MWO981XaD2eUJp7AtKvhtG
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.disciplines (
    discipline_id integer NOT NULL,
    discipline_name character varying(100) NOT NULL,
    hours integer NOT NULL,
    CONSTRAINT disciplines_hours_check CHECK ((hours > 0))
);


ALTER TABLE public.disciplines OWNER TO postgres;

CREATE SEQUENCE public.disciplines_discipline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.disciplines_discipline_id_seq OWNER TO postgres;

ALTER SEQUENCE public.disciplines_discipline_id_seq OWNED BY public.disciplines.discipline_id;

CREATE TABLE public.grades (
    grade_id integer NOT NULL,
    student_id integer NOT NULL,
    discipline_id integer NOT NULL,
    grade integer NOT NULL,
    grade_date date NOT NULL,
    CONSTRAINT grades_grade_check CHECK (((grade >= 2) AND (grade <= 5)))
);


ALTER TABLE public.grades OWNER TO postgres;

CREATE SEQUENCE public.grades_grade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grades_grade_id_seq OWNER TO postgres;



ALTER SEQUENCE public.grades_grade_id_seq OWNED BY public.grades.grade_id;



CREATE TABLE public.groups (
    group_id integer NOT NULL,
    group_name character varying(20) NOT NULL,
    specialty character varying(100) NOT NULL,
    admission_year integer NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;


CREATE SEQUENCE public.groups_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_group_id_seq OWNER TO postgres;



ALTER SEQUENCE public.groups_group_id_seq OWNED BY public.groups.group_id;


CREATE TABLE public.lessons (
    lesson_id integer NOT NULL,
    group_id integer NOT NULL,
    discipline_id integer NOT NULL,
    teacher_id integer NOT NULL,
    lesson_date date NOT NULL,
    lesson_type character varying(30) NOT NULL
);


ALTER TABLE public.lessons OWNER TO postgres;

CREATE SEQUENCE public.lessons_lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lessons_lesson_id_seq OWNER TO postgres;


ALTER SEQUENCE public.lessons_lesson_id_seq OWNED BY public.lessons.lesson_id;


CREATE TABLE public.students (
    student_id integer NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    middle_name character varying(50),
    birth_date date NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_student_id_seq OWNER TO postgres;


ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


CREATE TABLE public.teachers (
    teacher_id integer NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    department character varying(100) NOT NULL
);


ALTER TABLE public.teachers OWNER TO postgres;


CREATE SEQUENCE public.teachers_teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_teacher_id_seq OWNER TO postgres;


ALTER SEQUENCE public.teachers_teacher_id_seq OWNED BY public.teachers.teacher_id;


CREATE TABLE public."Группы" (
    group_id integer NOT NULL,
    group_name character varying(20) NOT NULL,
    specialty character varying(100),
    admission_year integer
);


ALTER TABLE public."Группы" OWNER TO postgres;

CREATE SEQUENCE public."Группы_group_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Группы_group_id_seq" OWNER TO postgres;


ALTER SEQUENCE public."Группы_group_id_seq" OWNED BY public."Группы".group_id;


CREATE TABLE public."Дисциплины" (
    discipline_id integer NOT NULL,
    discipline_name character varying(100),
    hours integer,
    CONSTRAINT "Дисциплины_hours_check" CHECK ((hours > 0))
);


ALTER TABLE public."Дисциплины" OWNER TO postgres;


CREATE SEQUENCE public."Дисциплины_discipline_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Дисциплины_discipline_id_seq" OWNER TO postgres;


ALTER SEQUENCE public."Дисциплины_discipline_id_seq" OWNED BY public."Дисциплины".discipline_id;


CREATE TABLE public."Занятия" (
    lesson_id integer NOT NULL,
    group_id integer,
    discipline_id integer,
    teacher_id integer,
    lesson_date date,
    lesson_type character varying(30)
);


ALTER TABLE public."Занятия" OWNER TO postgres;


CREATE SEQUENCE public."Занятия_lesson_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Занятия_lesson_id_seq" OWNER TO postgres;


ALTER SEQUENCE public."Занятия_lesson_id_seq" OWNED BY public."Занятия".lesson_id;


CREATE TABLE public."Преподаватели" (
    teacher_id integer NOT NULL,
    last_name character varying(50),
    first_name character varying(50),
    department character varying(100)
);


ALTER TABLE public."Преподаватели" OWNER TO postgres;


CREATE SEQUENCE public."Преподаватели_teacher_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Преподаватели_teacher_id_seq" OWNER TO postgres;


ALTER SEQUENCE public."Преподаватели_teacher_id_seq" OWNED BY public."Преподаватели".teacher_id;


CREATE TABLE public."Студенты" (
    student_id integer NOT NULL,
    last_name character varying(50),
    first_name character varying(50),
    middle_name character varying(50),
    birth_date date NOT NULL,
    group_id integer
);


ALTER TABLE public."Студенты" OWNER TO postgres;

CREATE SEQUENCE public."Студенты_student_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Студенты_student_id_seq" OWNER TO postgres;


ALTER SEQUENCE public."Студенты_student_id_seq" OWNED BY public."Студенты".student_id;



ALTER TABLE ONLY public.disciplines ALTER COLUMN discipline_id SET DEFAULT nextval('public.disciplines_discipline_id_seq'::regclass);



ALTER TABLE ONLY public.grades ALTER COLUMN grade_id SET DEFAULT nextval('public.grades_grade_id_seq'::regclass);



ALTER TABLE ONLY public.groups ALTER COLUMN group_id SET DEFAULT nextval('public.groups_group_id_seq'::regclass);



ALTER TABLE ONLY public.lessons ALTER COLUMN lesson_id SET DEFAULT nextval('public.lessons_lesson_id_seq'::regclass);



ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);



ALTER TABLE ONLY public.teachers ALTER COLUMN teacher_id SET DEFAULT nextval('public.teachers_teacher_id_seq'::regclass);



ALTER TABLE ONLY public."Группы" ALTER COLUMN group_id SET DEFAULT nextval('public."Группы_group_id_seq"'::regclass);


ALTER TABLE ONLY public."Дисциплины" ALTER COLUMN discipline_id SET DEFAULT nextval('public."Дисциплины_discipline_id_seq"'::regclass);



ALTER TABLE ONLY public."Занятия" ALTER COLUMN lesson_id SET DEFAULT nextval('public."Занятия_lesson_id_seq"'::regclass);


ALTER TABLE ONLY public."Преподаватели" ALTER COLUMN teacher_id SET DEFAULT nextval('public."Преподаватели_teacher_id_seq"'::regclass);



ALTER TABLE ONLY public."Студенты" ALTER COLUMN student_id SET DEFAULT nextval('public."Студенты_student_id_seq"'::regclass);


ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_discipline_name_key UNIQUE (discipline_name);


ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_pkey PRIMARY KEY (discipline_id);


ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (grade_id);



ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_group_name_key UNIQUE (group_name);


ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (group_id);



ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (lesson_id);



ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (teacher_id);



ALTER TABLE ONLY public."Группы"
    ADD CONSTRAINT "Группы_group_name_key" UNIQUE (group_name);


ALTER TABLE ONLY public."Группы"
    ADD CONSTRAINT "Группы_pkey" PRIMARY KEY (group_id);


ALTER TABLE ONLY public."Дисциплины"
    ADD CONSTRAINT "Дисциплины_pkey" PRIMARY KEY (discipline_id);



ALTER TABLE ONLY public."Занятия"
    ADD CONSTRAINT "Занятия_pkey" PRIMARY KEY (lesson_id);


ALTER TABLE ONLY public."Преподаватели"
    ADD CONSTRAINT "Преподаватели_pkey" PRIMARY KEY (teacher_id);



ALTER TABLE ONLY public."Студенты"
    ADD CONSTRAINT "Студенты_pkey" PRIMARY KEY (student_id);


ALTER TABLE ONLY public.grades
    ADD CONSTRAINT fk_grades_disciplines FOREIGN KEY (discipline_id) REFERENCES public.disciplines(discipline_id) ON UPDATE CASCADE ON DELETE RESTRICT;



ALTER TABLE ONLY public.grades
    ADD CONSTRAINT fk_grades_students FOREIGN KEY (student_id) REFERENCES public.students(student_id) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT fk_lessons_disciplines FOREIGN KEY (discipline_id) REFERENCES public.disciplines(discipline_id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT fk_lessons_groups FOREIGN KEY (group_id) REFERENCES public.groups(group_id) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT fk_lessons_teachers FOREIGN KEY (teacher_id) REFERENCES public.teachers(teacher_id) ON UPDATE CASCADE ON DELETE RESTRICT;


ALTER TABLE ONLY public.students
    ADD CONSTRAINT fk_students_groups FOREIGN KEY (group_id) REFERENCES public.groups(group_id) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE ONLY public."Занятия"
    ADD CONSTRAINT "Занятия_discipline_id_fkey" FOREIGN KEY (discipline_id) REFERENCES public."Дисциплины"(discipline_id) ON UPDATE CASCADE ON DELETE RESTRICT;


ALTER TABLE ONLY public."Занятия"
    ADD CONSTRAINT "Занятия_group_id_fkey" FOREIGN KEY (group_id) REFERENCES public."Группы"(group_id) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY public."Занятия"
    ADD CONSTRAINT "Занятия_teacher_id_fkey" FOREIGN KEY (teacher_id) REFERENCES public."Преподаватели"(teacher_id) ON UPDATE CASCADE ON DELETE RESTRICT;



ALTER TABLE ONLY public."Студенты"
    ADD CONSTRAINT "Студенты_group_id_fkey" FOREIGN KEY (group_id) REFERENCES public."Группы"(group_id) ON UPDATE CASCADE ON DELETE CASCADE;


\unrestrict HevbfSdYTCNQbcSbBTiu3Nfy2CsyIYshqHa9xAXs0MWO981XaD2eUJp7AtKvhtG
