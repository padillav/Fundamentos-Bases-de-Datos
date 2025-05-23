--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

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

--
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campus (idcampus, nombrecampus, direccioncampus) FROM stdin;
1	Campus Central	Av. Universidad 123
2	Campus Norte	Calle Técnica 456
3	Campus Sur	Calle Sur 200
4	Campus Este	Av. Oriente 300
5	Campus Oeste	Bulevar Poniente 400
6	Campus Virtual	https://virtual.universidad.edu
7	Campus Internacional	Av. Global 500
8	Campus Experimental	Zona Rural 1
9	Campus Central II	Calle Reforma 110
10	Campus Científico	Parque Científico 2
11	Campus Empresarial	Av. Negocios 10
12	Campus Salud	Av. Médica 100
\.


--
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carreras (idcarrera, nombrecarrera, titulootorgado) FROM stdin;
1	Ingeniería en Sistemas	Ingeniero en Sistemas
2	Psicología	Licenciado en Psicología
3	Administración de Empresas	Licenciado en Administración
4	Ingeniería Industrial	Ingeniero Industrial
5	Química	Licenciado en Química
6	Física	Licenciado en Física
7	Biología	Licenciado en Biología
8	Derecho	Licenciado en Derecho
9	Artes Plásticas	Licenciado en Artes
10	Historia	Licenciado en Historia
11	Lenguas Modernas	Licenciado en Lenguas
12	Economía	Licenciado en Economía
13	Pedagogía	Licenciado en Educación
\.


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamentos (iddepartamento, nombredepartamento, edificio) FROM stdin;
1	Ingeniería	Edificio A
2	Ciencias Sociales	Edificio B
3	Administración	Edificio C
4	Matemáticas	Edificio D
5	Química	Edificio E
6	Física	Edificio F
7	Biología	Edificio G
8	Derecho	Edificio H
9	Artes	Edificio I
10	Historia	Edificio J
11	Idiomas	Edificio K
12	Economía	Edificio L
13	Filosofía	Edificio M
14	Educación	Edificio N
\.


--
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos (idcurso, iddepartamento, nombrecurso, descripcion, creditos, semestre, idcampus) FROM stdin;
1	1	Estructura de Datos	Curso sobre estructuras fundamentales	6	3	1
2	2	Psicología General	Introducción a la Psicología	5	1	2
3	3	Contabilidad I	Conceptos básicos de contabilidad	4	1	1
4	1	Álgebra Lineal	Estudio de matrices y vectores	6	1	1
5	2	Óptica	Fundamentos de la luz y visión	5	2	2
6	3	Química Orgánica	Composición de compuestos orgánicos	6	2	3
7	4	Derecho Penal	Introducción al derecho penal	4	3	4
8	5	Dibujo Artístico	Técnicas básicas de dibujo	3	1	5
9	6	México Colonial	Historia de México virreinal	4	4	6
10	7	Inglés Avanzado	Perfeccionamiento del idioma inglés	4	5	7
11	8	Macroeconomía	Estudio de la economía global	5	3	8
12	9	Lógica Formal	Introducción a la lógica y razonamiento	4	1	9
13	10	Didáctica General	Métodos de enseñanza	5	2	10
\.


--
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profesores (idprofesor, iddepartamento, nombre_profesor, apellido_profesor, titulo, email) FROM stdin;
1	1	Carlos	Ramírez	Dr. en Ciencias Computacionales	cramirez@uni.edu
2	2	Ana	López	Mtra. en Psicología	alopez@uni.edu
3	3	Jorge	Gómez	Lic. en Administración	jgomez@uni.edu
4	4	Laura	Ruiz	Dra. en Matemáticas	lruiz@uni.edu
5	5	Pablo	Mendoza	Mtro. en Física	pmendoza@uni.edu
6	6	Diana	Silva	Mtra. en Química	dsilva@uni.edu
7	7	Raúl	Fernández	Lic. en Derecho	rfernandez@uni.edu
8	8	Claudia	Herrera	Mtra. en Historia del Arte	cherrera@uni.edu
9	9	Sergio	Cano	Lic. en Historia	scano@uni.edu
10	10	Beatriz	Nava	Mtra. en Lingüística	bnava@uni.edu
11	11	Tomás	Reyes	Mtro. en Economía	treyes@uni.edu
12	12	Patricia	Torres	Lic. en Filosofía	ptorres@uni.edu
13	1	Javier	Morales	Dr. en Computación	jmorales@uni.edu
\.


--
-- Data for Name: cursosprofesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursosprofesores (idcursoprofesor, idcurso, idprofesor) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	8	8
9	9	9
10	10	10
11	11	11
12	12	12
13	13	13
\.


--
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes (idestudiante, nombre, apellido, fechanacimiento, direccion, email, idcarrera) FROM stdin;
1	Luis	Hernández	2000-05-10	Av. Siempre Viva 742	lhernandez@correo.com	1
2	María	Pérez	2001-08-15	Calle Luna 23	mperez@correo.com	2
3	Sofía	Martínez	2002-03-22	Calle Sol 19	smartinez@correo.com	3
4	Jorge	Luna	2000-01-20	Calle Río Bravo 10	jluna@correo.com	4
5	Carmen	Salas	2001-04-11	Av. Reforma 80	csalas@correo.com	5
6	Marco	Delgado	1999-12-05	Calle Norte 45	mdelgado@correo.com	6
7	Andrea	Mendoza	2002-07-19	Col. Centro 101	amendoza@correo.com	7
8	Luis	Reyes	2001-09-09	Av. Patria 77	lreyes@correo.com	8
9	Rosa	Vargas	2000-10-12	Calle Roble 23	rvargas@correo.com	9
10	Gabriel	Moreno	2002-03-18	Calle Cedros 56	gmoreno@correo.com	10
11	Isabel	Cruz	2000-06-25	Av. Chapultepec 34	icruz@correo.com	1
12	Daniel	Suárez	1999-08-14	Calle Norte 999	dsuarez@correo.com	2
13	Natalia	Paredes	2002-11-30	Zona Sur 23	nparedes@correo.com	3
\.


--
-- Data for Name: horarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.horarios (idhorario, idcurso, idaula, fechainicio, fechafin, horainicio, horafin) FROM stdin;
1	1	1	2025-08-01	2025-12-15	08:00:00	10:00:00
2	2	2	2025-08-01	2025-12-15	10:15:00	12:15:00
23	3	1	2025-08-01	2025-12-15	08:00:00	09:30:00
24	4	2	2025-08-01	2025-12-15	10:00:00	11:30:00
25	5	3	2025-08-01	2025-12-15	12:00:00	13:30:00
26	6	4	2025-08-01	2025-12-15	14:00:00	15:30:00
27	7	5	2025-08-01	2025-12-15	16:00:00	17:30:00
28	8	6	2025-08-01	2025-12-15	09:00:00	10:30:00
29	9	7	2025-08-01	2025-12-15	11:00:00	12:30:00
30	10	8	2025-08-01	2025-12-15	13:00:00	14:30:00
31	11	9	2025-08-01	2025-12-15	15:00:00	16:30:00
32	12	10	2025-08-01	2025-12-15	17:00:00	18:30:00
\.


--
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones (idinscripcion, idestudiante, idcurso, fechainscripcion, calificacion) FROM stdin;
1	1	1	2025-08-05	90
2	2	2	2025-08-05	85
3	3	3	2025-08-05	88
4	4	4	2025-08-15	91
5	5	5	2025-08-15	86
6	6	6	2025-08-15	89
7	7	7	2025-08-15	84
8	8	8	2025-08-15	90
9	9	9	2025-08-15	87
10	10	10	2025-08-15	93
11	11	11	2025-08-15	85
12	12	12	2025-08-15	88
13	13	1	2025-08-15	92
\.


--
-- Data for Name: programasestudio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programasestudio (idprograma, nombreprograma, descripcionprograma) FROM stdin;
1	Programa de Ingeniería	Plan 2024 Ingeniería
2	Programa de Psicología	Plan 2023 Psicología
3	Programa de Química	Plan de estudios de Química
4	Programa de Física	Plan de estudios de Física
5	Programa de Biología	Plan de estudios de Biología
6	Programa de Derecho	Plan de estudios de Derecho
7	Programa de Artes	Plan de estudios de Artes
8	Programa de Historia	Plan de estudios de Historia
9	Programa de Lenguas	Plan de estudios de Lenguas
10	Programa de Economía	Plan de estudios de Economía
11	Programa de Filosofía	Plan de estudios de Filosofía
12	Programa de Educación	Plan de estudios de Pedagogía
\.


--
-- Data for Name: programascursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programascursos (idprogramacurso, idprograma, idcurso) FROM stdin;
1	1	1
2	2	2
3	1	3
4	2	4
5	3	5
6	4	6
7	5	7
8	6	8
9	7	9
10	8	10
11	9	11
12	10	12
13	11	13
\.


--
-- Name: campus_idcampus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campus_idcampus_seq', 12, true);


--
-- Name: carreras_idcarrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_idcarrera_seq', 13, true);


--
-- Name: cursos_idcurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_idcurso_seq', 13, true);


--
-- Name: cursosprofesores_idcursoprofesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursosprofesores_idcursoprofesor_seq', 13, true);


--
-- Name: departamentos_iddepartamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_iddepartamento_seq', 14, true);


--
-- Name: estudiantes_idestudiante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_idestudiante_seq', 13, true);


--
-- Name: horarios_idhorario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horarios_idhorario_seq', 32, true);


--
-- Name: inscripciones_idinscripcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_idinscripcion_seq', 13, true);


--
-- Name: profesores_idprofesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesores_idprofesor_seq', 13, true);


--
-- Name: programascursos_idprogramacurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programascursos_idprogramacurso_seq', 13, true);


--
-- Name: programasestudio_idprograma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programasestudio_idprograma_seq', 12, true);


--
-- PostgreSQL database dump complete
--

