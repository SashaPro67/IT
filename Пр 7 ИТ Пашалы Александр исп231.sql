--
-- PostgreSQL database dump
--

\restrict HevbfSdYTCNQbcSbBTiu3Nfy2CsyIYshqHa9xAXs0MWO981XaD2eUJp7AtKvhtG

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-07 14:54:34

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

--
-- TOC entry 236 (class 1259 OID 24807)
-- Name: disciplines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplines (
    discipline_id integer NOT NULL,
    discipline_name character varying(100) NOT NULL,
    hours integer NOT NULL,
    CONSTRAINT disciplines_hours_check CHECK ((hours > 0))
);


ALTER TABLE public.disciplines OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 24806)
-- Name: disciplines_discipline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disciplines_discipline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.disciplines_discipline_id_seq OWNER TO postgres;

--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 235
-- Name: disciplines_discipline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disciplines_discipline_id_seq OWNED BY public.disciplines.discipline_id;


--
-- TOC entry 240 (class 1259 OID 24848)
-- Name: grades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grades (
    grade_id integer NOT NULL,
    student_id integer NOT NULL,
    discipline_id integer NOT NULL,
    grade integer NOT NULL,
    grade_date date NOT NULL,
    CONSTRAINT grades_grade_check CHECK (((grade >= 2) AND (grade <= 5)))
);


ALTER TABLE public.grades OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 24847)
-- Name: grades_grade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grades_grade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grades_grade_id_seq OWNER TO postgres;

--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 239
-- Name: grades_grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grades_grade_id_seq OWNED BY public.grades.grade_id;


--
-- TOC entry 230 (class 1259 OID 24766)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    group_id integer NOT NULL,
    group_name character varying(20) NOT NULL,
    specialty character varying(100) NOT NULL,
    admission_year integer NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24765)
-- Name: groups_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_group_id_seq OWNER TO postgres;

--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 229
-- Name: groups_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_group_id_seq OWNED BY public.groups.group_id;


--
-- TOC entry 238 (class 1259 OID 24820)
-- Name: lessons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lessons (
    lesson_id integer NOT NULL,
    group_id integer NOT NULL,
    discipline_id integer NOT NULL,
    teacher_id integer NOT NULL,
    lesson_date date NOT NULL,
    lesson_type character varying(30) NOT NULL
);


ALTER TABLE public.lessons OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 24819)
-- Name: lessons_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lessons_lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lessons_lesson_id_seq OWNER TO postgres;

--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 237
-- Name: lessons_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lessons_lesson_id_seq OWNED BY public.lessons.lesson_id;


--
-- TOC entry 232 (class 1259 OID 24779)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    middle_name character varying(50),
    birth_date date NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 24778)
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_student_id_seq OWNER TO postgres;

--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 231
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- TOC entry 234 (class 1259 OID 24796)
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    teacher_id integer NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    department character varying(100) NOT NULL
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 24795)
-- Name: teachers_teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_teacher_id_seq OWNER TO postgres;

--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 233
-- Name: teachers_teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_teacher_id_seq OWNED BY public.teachers.teacher_id;


--
-- TOC entry 220 (class 1259 OID 24701)
-- Name: Группы; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Группы" (
    group_id integer NOT NULL,
    group_name character varying(20) NOT NULL,
    specialty character varying(100),
    admission_year integer
);


ALTER TABLE public."Группы" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24700)
-- Name: Группы_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Группы_group_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Группы_group_id_seq" OWNER TO postgres;

--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 219
-- Name: Группы_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Группы_group_id_seq" OWNED BY public."Группы".group_id;


--
-- TOC entry 226 (class 1259 OID 24734)
-- Name: Дисциплины; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Дисциплины" (
    discipline_id integer NOT NULL,
    discipline_name character varying(100),
    hours integer,
    CONSTRAINT "Дисциплины_hours_check" CHECK ((hours > 0))
);


ALTER TABLE public."Дисциплины" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24733)
-- Name: Дисциплины_discipline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Дисциплины_discipline_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Дисциплины_discipline_id_seq" OWNER TO postgres;

--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 225
-- Name: Дисциплины_discipline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Дисциплины_discipline_id_seq" OWNED BY public."Дисциплины".discipline_id;


--
-- TOC entry 228 (class 1259 OID 24743)
-- Name: Занятия; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Занятия" (
    lesson_id integer NOT NULL,
    group_id integer,
    discipline_id integer,
    teacher_id integer,
    lesson_date date,
    lesson_type character varying(30)
);


ALTER TABLE public."Занятия" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24742)
-- Name: Занятия_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Занятия_lesson_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Занятия_lesson_id_seq" OWNER TO postgres;

--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 227
-- Name: Занятия_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Занятия_lesson_id_seq" OWNED BY public."Занятия".lesson_id;


--
-- TOC entry 224 (class 1259 OID 24726)
-- Name: Преподаватели; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Преподаватели" (
    teacher_id integer NOT NULL,
    last_name character varying(50),
    first_name character varying(50),
    department character varying(100)
);


ALTER TABLE public."Преподаватели" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24725)
-- Name: Преподаватели_teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Преподаватели_teacher_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Преподаватели_teacher_id_seq" OWNER TO postgres;

--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 223
-- Name: Преподаватели_teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Преподаватели_teacher_id_seq" OWNED BY public."Преподаватели".teacher_id;


--
-- TOC entry 222 (class 1259 OID 24712)
-- Name: Студенты; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Студенты" (
    student_id integer NOT NULL,
    last_name character varying(50),
    first_name character varying(50),
    middle_name character varying(50),
    birth_date date NOT NULL,
    group_id integer
);


ALTER TABLE public."Студенты" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24711)
-- Name: Студенты_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Студенты_student_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Студенты_student_id_seq" OWNER TO postgres;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 221
-- Name: Студенты_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Студенты_student_id_seq" OWNED BY public."Студенты".student_id;


--
-- TOC entry 4783 (class 2604 OID 24810)
-- Name: disciplines discipline_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines ALTER COLUMN discipline_id SET DEFAULT nextval('public.disciplines_discipline_id_seq'::regclass);


--
-- TOC entry 4785 (class 2604 OID 24851)
-- Name: grades grade_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades ALTER COLUMN grade_id SET DEFAULT nextval('public.grades_grade_id_seq'::regclass);


--
-- TOC entry 4780 (class 2604 OID 24769)
-- Name: groups group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN group_id SET DEFAULT nextval('public.groups_group_id_seq'::regclass);


--
-- TOC entry 4784 (class 2604 OID 24823)
-- Name: lessons lesson_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons ALTER COLUMN lesson_id SET DEFAULT nextval('public.lessons_lesson_id_seq'::regclass);


--
-- TOC entry 4781 (class 2604 OID 24782)
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- TOC entry 4782 (class 2604 OID 24799)
-- Name: teachers teacher_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN teacher_id SET DEFAULT nextval('public.teachers_teacher_id_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 24704)
-- Name: Группы group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Группы" ALTER COLUMN group_id SET DEFAULT nextval('public."Группы_group_id_seq"'::regclass);


--
-- TOC entry 4778 (class 2604 OID 24737)
-- Name: Дисциплины discipline_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Дисциплины" ALTER COLUMN discipline_id SET DEFAULT nextval('public."Дисциплины_discipline_id_seq"'::regclass);


--
-- TOC entry 4779 (class 2604 OID 24746)
-- Name: Занятия lesson_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Занятия" ALTER COLUMN lesson_id SET DEFAULT nextval('public."Занятия_lesson_id_seq"'::regclass);


--
-- TOC entry 4777 (class 2604 OID 24729)
-- Name: Преподаватели teacher_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Преподаватели" ALTER COLUMN teacher_id SET DEFAULT nextval('public."Преподаватели_teacher_id_seq"'::regclass);


--
-- TOC entry 4776 (class 2604 OID 24715)
-- Name: Студенты student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Студенты" ALTER COLUMN student_id SET DEFAULT nextval('public."Студенты_student_id_seq"'::regclass);


--
-- TOC entry 4810 (class 2606 OID 24818)
-- Name: disciplines disciplines_discipline_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_discipline_name_key UNIQUE (discipline_name);


--
-- TOC entry 4812 (class 2606 OID 24816)
-- Name: disciplines disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_pkey PRIMARY KEY (discipline_id);


--
-- TOC entry 4816 (class 2606 OID 24859)
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (grade_id);


--
-- TOC entry 4802 (class 2606 OID 24777)
-- Name: groups groups_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_group_name_key UNIQUE (group_name);


--
-- TOC entry 4804 (class 2606 OID 24775)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (group_id);


--
-- TOC entry 4814 (class 2606 OID 24831)
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (lesson_id);


--
-- TOC entry 4806 (class 2606 OID 24789)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- TOC entry 4808 (class 2606 OID 24805)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (teacher_id);


--
-- TOC entry 4790 (class 2606 OID 24710)
-- Name: Группы Группы_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Группы"
    ADD CONSTRAINT "Группы_group_name_key" UNIQUE (group_name);


--
-- TOC entry 4792 (class 2606 OID 24708)
-- Name: Группы Группы_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Группы"
    ADD CONSTRAINT "Группы_pkey" PRIMARY KEY (group_id);


--
-- TOC entry 4798 (class 2606 OID 24741)
-- Name: Дисциплины Дисциплины_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Дисциплины"
    ADD CONSTRAINT "Дисциплины_pkey" PRIMARY KEY (discipline_id);


--
-- TOC entry 4800 (class 2606 OID 24749)
-- Name: Занятия Занятия_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Занятия"
    ADD CONSTRAINT "Занятия_pkey" PRIMARY KEY (lesson_id);


--
-- TOC entry 4796 (class 2606 OID 24732)
-- Name: Преподаватели Преподаватели_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Преподаватели"
    ADD CONSTRAINT "Преподаватели_pkey" PRIMARY KEY (teacher_id);


--
-- TOC entry 4794 (class 2606 OID 24719)
-- Name: Студенты Студенты_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Студенты"
    ADD CONSTRAINT "Студенты_pkey" PRIMARY KEY (student_id);


--
-- TOC entry 4825 (class 2606 OID 24865)
-- Name: grades fk_grades_disciplines; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT fk_grades_disciplines FOREIGN KEY (discipline_id) REFERENCES public.disciplines(discipline_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4826 (class 2606 OID 24860)
-- Name: grades fk_grades_students; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT fk_grades_students FOREIGN KEY (student_id) REFERENCES public.students(student_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4822 (class 2606 OID 24837)
-- Name: lessons fk_lessons_disciplines; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT fk_lessons_disciplines FOREIGN KEY (discipline_id) REFERENCES public.disciplines(discipline_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4823 (class 2606 OID 24832)
-- Name: lessons fk_lessons_groups; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT fk_lessons_groups FOREIGN KEY (group_id) REFERENCES public.groups(group_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4824 (class 2606 OID 24842)
-- Name: lessons fk_lessons_teachers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT fk_lessons_teachers FOREIGN KEY (teacher_id) REFERENCES public.teachers(teacher_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4821 (class 2606 OID 24790)
-- Name: students fk_students_groups; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT fk_students_groups FOREIGN KEY (group_id) REFERENCES public.groups(group_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4818 (class 2606 OID 24755)
-- Name: Занятия Занятия_discipline_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Занятия"
    ADD CONSTRAINT "Занятия_discipline_id_fkey" FOREIGN KEY (discipline_id) REFERENCES public."Дисциплины"(discipline_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4819 (class 2606 OID 24750)
-- Name: Занятия Занятия_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Занятия"
    ADD CONSTRAINT "Занятия_group_id_fkey" FOREIGN KEY (group_id) REFERENCES public."Группы"(group_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4820 (class 2606 OID 24760)
-- Name: Занятия Занятия_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Занятия"
    ADD CONSTRAINT "Занятия_teacher_id_fkey" FOREIGN KEY (teacher_id) REFERENCES public."Преподаватели"(teacher_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4817 (class 2606 OID 24720)
-- Name: Студенты Студенты_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Студенты"
    ADD CONSTRAINT "Студенты_group_id_fkey" FOREIGN KEY (group_id) REFERENCES public."Группы"(group_id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2026-10-07 14:54:34

--
-- PostgreSQL database dump complete
--

\unrestrict HevbfSdYTCNQbcSbBTiu3Nfy2CsyIYshqHa9xAXs0MWO981XaD2eUJp7AtKvhtG

