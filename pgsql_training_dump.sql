--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.20
-- Dumped by pg_dump version 9.5.20

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres_training; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres_training WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_India.1252' LC_CTYPE = 'English_India.1252';


ALTER DATABASE postgres_training OWNER TO postgres;

\connect postgres_training

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    department_id integer NOT NULL,
    department_name character varying(255) NOT NULL,
    department_intake integer NOT NULL
);


ALTER TABLE public.department OWNER TO postgres;

--
-- Name: department_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_department_id_seq OWNER TO postgres;

--
-- Name: department_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_department_id_seq OWNED BY public.department.department_id;


--
-- Name: deptoptionalcourserelation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deptoptionalcourserelation (
    courserelid integer NOT NULL,
    department_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.deptoptionalcourserelation OWNER TO postgres;

--
-- Name: deptoptionalcourserelation_courserelid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deptoptionalcourserelation_courserelid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deptoptionalcourserelation_courserelid_seq OWNER TO postgres;

--
-- Name: deptoptionalcourserelation_courserelid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deptoptionalcourserelation_courserelid_seq OWNED BY public.deptoptionalcourserelation.courserelid;


--
-- Name: optionalcourserelation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.optionalcourserelation (
    courserelid integer NOT NULL,
    student_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.optionalcourserelation OWNER TO postgres;

--
-- Name: optionalcourserelation_courserelid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.optionalcourserelation_courserelid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.optionalcourserelation_courserelid_seq OWNER TO postgres;

--
-- Name: optionalcourserelation_courserelid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.optionalcourserelation_courserelid_seq OWNED BY public.optionalcourserelation.courserelid;


--
-- Name: optionalcourses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.optionalcourses (
    course_id integer NOT NULL,
    course_name character varying(255)
);


ALTER TABLE public.optionalcourses OWNER TO postgres;

--
-- Name: optionalcourses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.optionalcourses_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.optionalcourses_course_id_seq OWNER TO postgres;

--
-- Name: optionalcourses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.optionalcourses_course_id_seq OWNED BY public.optionalcourses.course_id;


--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    student_id integer NOT NULL,
    student_name character varying(255) NOT NULL,
    department_id integer NOT NULL,
    date_of_birth date DEFAULT '2000-01-01'::date NOT NULL
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: student_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_student_id_seq OWNER TO postgres;

--
-- Name: student_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_student_id_seq OWNED BY public.student.student_id;


--
-- Name: department_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department ALTER COLUMN department_id SET DEFAULT nextval('public.department_department_id_seq'::regclass);


--
-- Name: courserelid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deptoptionalcourserelation ALTER COLUMN courserelid SET DEFAULT nextval('public.deptoptionalcourserelation_courserelid_seq'::regclass);


--
-- Name: courserelid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.optionalcourserelation ALTER COLUMN courserelid SET DEFAULT nextval('public.optionalcourserelation_courserelid_seq'::regclass);


--
-- Name: course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.optionalcourses ALTER COLUMN course_id SET DEFAULT nextval('public.optionalcourses_course_id_seq'::regclass);


--
-- Name: student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN student_id SET DEFAULT nextval('public.student_student_id_seq'::regclass);


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (department_id, department_name, department_intake) FROM stdin;
1	Electronics	60
2	Electrical	40
3	Mechanical	40
4	Civil	40
5	Communication	50
6	Information Technology	50
7	Computer Science	50
8	Artificial Intelligence	20
9	Chemical Engineering	30
10	BioMedical Engineering	30
11	General	50
\.


--
-- Name: department_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_department_id_seq', 11, true);


--
-- Data for Name: deptoptionalcourserelation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deptoptionalcourserelation (courserelid, department_id, course_id) FROM stdin;
1	4	2
2	2	3
3	7	4
4	7	5
5	7	6
6	3	2
7	1	3
8	2	7
9	11	1
10	11	8
\.


--
-- Name: deptoptionalcourserelation_courserelid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deptoptionalcourserelation_courserelid_seq', 10, true);


--
-- Data for Name: optionalcourserelation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.optionalcourserelation (courserelid, student_id, course_id) FROM stdin;
1	1	1
2	1	7
3	5	7
4	5	3
5	3	3
6	3	8
7	9	8
8	9	7
9	19	7
10	19	1
11	18	1
12	15	1
13	13	1
14	12	1
15	10	1
\.


--
-- Name: optionalcourserelation_courserelid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.optionalcourserelation_courserelid_seq', 15, true);


--
-- Data for Name: optionalcourses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.optionalcourses (course_id, course_name) FROM stdin;
1	Transforms
2	Basics of Civil and Mechanical
3	Circuit Design
4	OOPS
5	RDBMS
6	Graphics
7	Electrical Machines
8	Engineering Practices
\.


--
-- Name: optionalcourses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.optionalcourses_course_id_seq', 8, true);


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (student_id, student_name, department_id, date_of_birth) FROM stdin;
1	Ravi	2	1996-02-01
3	Raji	4	1995-04-03
4	Ram	5	1996-05-04
5	Sam	6	1997-06-05
6	Sanjay	7	1995-07-06
7	Rashid	8	1996-08-07
8	Roja	9	1997-09-08
9	Kavitha	10	1995-10-09
10	Sanjana	1	1996-11-10
11	Niranjan	2	1997-12-11
12	Santhosh	3	1995-01-12
13	Mani	4	1996-02-13
14	Abdul	5	1997-03-14
15	Anand	6	1995-04-15
16	Ajith	7	1996-05-16
17	Vijay	8	1997-06-17
18	Rubini	9	1995-07-18
19	Nandhu	10	1996-08-19
20	Madhu	1	1997-09-20
21	Moni	2	1995-10-21
22	Kani	3	1996-11-22
23	Arun	4	1997-12-23
\.


--
-- Name: student_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_student_id_seq', 23, true);


--
-- Name: department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (department_id);


--
-- Name: deptoptionalcourserelation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deptoptionalcourserelation
    ADD CONSTRAINT deptoptionalcourserelation_pkey PRIMARY KEY (courserelid);


--
-- Name: optionalcourserelation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.optionalcourserelation
    ADD CONSTRAINT optionalcourserelation_pkey PRIMARY KEY (courserelid);


--
-- Name: optionalcourses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.optionalcourses
    ADD CONSTRAINT optionalcourses_pkey PRIMARY KEY (course_id);


--
-- Name: student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);


--
-- Name: deptoptionalcourserelation_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deptoptionalcourserelation
    ADD CONSTRAINT deptoptionalcourserelation_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.optionalcourses(course_id);


--
-- Name: deptoptionalcourserelation_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deptoptionalcourserelation
    ADD CONSTRAINT deptoptionalcourserelation_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(department_id);


--
-- Name: optionalcourserelation_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.optionalcourserelation
    ADD CONSTRAINT optionalcourserelation_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.optionalcourses(course_id);


--
-- Name: optionalcourserelation_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.optionalcourserelation
    ADD CONSTRAINT optionalcourserelation_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(student_id);


--
-- Name: student_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(department_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

