--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg110+2)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg110+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.users (id, email, first_name, last_name, password, role, username) FROM stdin;
1	admin1@example.com	Admin	Lima	$2a$10$IRnroz6ZARdXHNupVTSXAOVWW35Rkn/ZRU8lwTpTTZqcsW4m5uZHa	ADMIN	admin1
2	admin2@example.com	Admin	Lima	$2a$10$sf1QRLebS7AJAWPsvUUbpeU4iljQwvHKGgWLmCZiUK85F/yL3boF.	ADMIN	admin2
\.


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.admins (id) FROM stdin;
1
2
\.


--
-- Data for Name: container_images; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.container_images (id, url) FROM stdin;
1	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649229/cleanflow/zjqx3drdn1ryuhvz7cod.jpg
2	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649230/cleanflow/y6itmowgzezmj90gbcdt.jpg
3	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649231/cleanflow/lvocuxnrrcuviy7ebh3c.jpg
4	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649233/cleanflow/id4x4p9zccewtghbsb8s.jpg
5	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649234/cleanflow/wido9seg4jbzljxji2v0.avif
6	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649236/cleanflow/borx3swcq9s3bcjfypxl.avif
7	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649237/cleanflow/vfeg5wke7ogtdfytmsyp.avif
8	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649238/cleanflow/g9jbu6dnqvsugkbutunh.jpg
9	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649239/cleanflow/j3idedjguqxsoaljrr7j.jpg
10	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649240/cleanflow/lz3bsntsxm0rb3cpu09h.jpg
11	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649242/cleanflow/gfqatkmbkam2p0m7exsm.webp
12	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649243/cleanflow/lvasolmdot6m05me3wtr.jpg
13	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649244/cleanflow/wplgfd2jo4cgi8piwda9.jpg
14	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649246/cleanflow/ugoqybvqsmfhpz3xifmy.jpg
\.


--
-- Data for Name: containers; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.containers (id, address_name, api_key, location, name, secret, container_image_id) FROM stdin;
1	Av. Palermo, Los Corales	30129463-553a-4e17-88a2-bc8e04d1b3fe	0101000020E6100000BABCB169784153C0C4532C90BE2628C0	Contenedor 1	$2a$10$wY8gCGqGrMQePSH62sCEUu2OCKH28UEHE8Jkk/aZ//4T7vT826d1e	1
2	Av. de las Américas, Los Corales	a94fa20f-1d0a-4924-889e-dfaf0364aebe	0101000020E61000001A3F25A87C4153C0E7785E16D62728C0	Contenedor 2	$2a$10$J7FiEAEfZueSakUC0VEUIe70DVzzElKC7UCnkD4zuynpXq1qDKQQy	2
3	Jr. Los Diamantes, Los Corales	f98262fd-18bb-49e6-bb11-8156e14c3b92	0101000020E6100000A0747EFA714153C0F36B04139A2828C0	Contenedor 3	$2a$10$C61W04AVQ9RsThMYZfrNhewNAxb/2mkC4l.DN9N2K7v.AEMTQbw8q	3
4	Jr. Los Diamantes, Manuel Toribio Ureta	08b173fb-6ae3-4bfd-8596-59a2be94e9ff	0101000020E6100000FBE356684F4153C016F88842FB2728C0	Contenedor 4	$2a$10$VKAAB7orERZaZPpjfMi.9uZbAUOPb9MiwksdcqWG7DjBnV9GnAIEC	4
5	Av. México, Juan Castro	dff98b67-de80-495d-9f37-74b59e57c990	0101000020E610000089BBF0A7704153C04B813AE53C2628C0	Contenedor 5	$2a$10$qfy6GnI7TDvJPXDSrFWi1.jrrAbovQ6AwW0tOQ5ZoV48ADV5HNleC	5
6	Juan Castro, Benito Pardo Figueroa	1218bfe8-f601-485d-ae39-d19f5ead2de3	0101000020E610000003B8D1764D4153C017A8D7609B2628C0	Contenedor 6	$2a$10$1RZMlD1zYAWT07iDoaeo4u6zIfpX/X2hWCU2DBfCWw34cDvBSWUnG	6
7	Av. de las Américas, Juan Castro	1be29782-d2d2-40b4-9f27-71930d5af942	0101000020E6100000C3B57D6F354153C084F78C4EF22628C0	Contenedor 7	$2a$10$PebK2CO/REYi1y1jFu0.Qu/frb4ukqu4odC1Dap1LQpy/fpUMCA7K	7
8	Av. de las Américas, Av. Parinacochas	6fa598b0-ae3d-43f0-8467-91168f0077e2	0101000020E610000023BDA93A144153C035B59AD9D52628C0	Contenedor 8	$2a$10$Vap00S8KKcuEG.HkXhynR.acZ1dMHRc0kHSYbjScT/zxwCb1wgmdG	8
9	Av. Palermo, Av. Canadá	848eb1cc-8343-437b-a5fc-2c43fa8b4178	0101000020E6100000CCA672AB7B4153C025EB5D52CC2928C0	Contenedor 9	$2a$10$RGQLObZgTsbTO0hE2Ispouori7cVzQNTcMMJBTLI5bOd7Uq6uJHyi	9
10	Av. Paseo de la República, Av. Canadá	cdac2d86-6243-4419-81b5-bb9f73754e12	0101000020E61000007CC8AD54AD4153C0ACB7373E372A28C0	Contenedor 10	$2a$10$3kteAouamyUItzZh.CiV0eivTNFYFAqX/lFvimoijhqn/C.R.ZxJm	10
11	Av. Nicolás Arriola, Av. Canadá	96ed0a59-86ec-414a-8e20-8d7b87d3e635	0101000020E6100000F5E58B33E84053C04E5FBA45AC2A28C0	Contenedor 11	$2a$10$yk.RwJTxQGEmec1KhhtuB..b9xf5QTZioGZBisvJ74HWMcsrRyWJm	11
12	Av. Santa Catalina, Av. San Eugenio	94a3423c-7df3-478e-97c6-6a0587e3e66d	0101000020E61000000724CCAF2E4153C0A9F90E65662B28C0	Contenedor 12	$2a$10$RQjjDNjvveFxJCcUK/QpjO8pary8OmyNYZ0dcsz6xVUeuJQxbpcHC	12
13	Av. Carlos Villarán, Av. Nicolás Arriola	5251b839-e17a-4022-8e11-79d573563cbf	0101000020E610000075FFAF6F124153C0C044651D382D28C0	Contenedor 13	$2a$10$8nASJ4pBPx57u1DC2nIKT.SXdvvReryuO0WKOW7PZmiDPH6NSUHoS	13
14	Av. Canadá, Jr. Victor Alzamora	37865572-fb04-4b32-9864-734e5ef18790	0101000020E61000000CFF7109CA4053C0DF68D083002B28C0	Contenedor 14	$2a$10$ORKUQu0462SgwdBAURH.i.dGUq8/J/sr2SlzA2cEttpu8YChdXq9W	14
\.


--
-- Data for Name: drivers; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.drivers (id) FROM stdin;
\.


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.metrics (id, air_quality_level, filling_level, is_alive, ppm, "timestamp", container_id) FROM stdin;
\.


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.routes (id, end_at, start_at, driver_id) FROM stdin;
\.


--
-- Data for Name: points; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.points (id, latitude, longitude, "timestamp", route_id) FROM stdin;
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.reports (id, content, "timestamp", container_id, user_id) FROM stdin;
1	La recolección nocturna funciona mejor para mi zona.	2026-05-13 00:14:14.10089	1	1
2	Sería ideal agregar separación para plástico y vidrio.	2026-05-13 00:14:14.11863	1	1
3	El contenedor cercano al parque siempre está limpio.	2026-05-13 00:14:14.128971	1	1
4	La app me avisó correctamente cuándo pasó el camión.	2026-05-13 00:14:15.577315	1	1
5	A veces dejan basura fuera del contenedor aunque haya espacio.	2026-05-13 00:14:16.821972	1	1
6	El servicio ha mejorado bastante desde que implementaron la app.	2026-05-13 00:14:17.911761	2	1
7	Me gustaría ver el nivel de llenado en tiempo real.	2026-05-13 00:14:19.744961	2	1
8	Noté menos basura en las calles desde que pusieron estos contenedores.	2026-05-13 00:14:19.776627	2	1
9	El sensor dejó de actualizarse por unas horas.	2026-05-13 00:14:22.210941	2	1
10	Muy útil que esté cerca de mi casa.	2026-05-13 00:14:22.248516	2	1
11	La recolección fue puntual esta semana.	2026-05-13 00:14:22.27446	2	1
12	En las noches suele haber mal olor alrededor.	2026-05-13 00:14:23.639168	2	1
13	En las noches suele haber mal olor alrededor.	2026-05-13 00:14:25.688227	3	1
14	El contenedor siempre está limpio y lo vacían a tiempo.	2026-05-13 00:14:25.711833	3	1
15	Hubo basura acumulada después del feriado.	2026-05-13 00:14:25.732604	3	1
16	La tapa estaba rota pero la repararon rápido.	2026-05-13 00:14:25.758042	3	1
17	El contenedor siempre está limpio y lo vacían a tiempo.	2026-05-13 00:14:25.78266	3	1
18	Muy útil que esté cerca de mi casa.	2026-05-13 00:14:26.786018	3	1
19	El sistema ayuda bastante a evitar desbordes.	2026-05-13 00:14:28.653319	3	1
20	El contenedor cercano al parque siempre está limpio.	2026-05-13 00:14:29.841485	4	1
21	La tapa estaba rota pero la repararon rápido.	2026-05-13 00:14:29.869258	4	1
22	La app me avisó correctamente cuándo pasó el camión.	2026-05-13 00:14:31.746082	4	1
23	La app me avisó correctamente cuándo pasó el camión.	2026-05-13 00:14:33.869331	5	1
24	Sería ideal agregar separación para plástico y vidrio.	2026-05-13 00:14:35.630507	5	1
25	A veces el GPS del chofer se queda congelado.	2026-05-13 00:14:36.621269	5	1
26	La app muestra correctamente la ruta del chofer.	2026-05-13 00:14:36.652388	5	1
27	El camión tardó demasiado en llegar hoy.	2026-05-13 00:14:38.647218	5	1
28	Sería bueno que tuviera una tapa más resistente.	2026-05-13 00:14:39.596203	5	1
29	Sería bueno agregar cámaras de seguridad cerca.	2026-05-13 00:14:41.864982	5	1
30	El sensor marcaba lleno aunque todavía había espacio.	2026-05-13 00:14:41.913281	6	1
31	La recolección nocturna funciona mejor para mi zona.	2026-05-13 00:14:43.321473	6	1
32	La recolección nocturna funciona mejor para mi zona.	2026-05-13 00:14:43.352188	6	1
33	El sensor parece funcionar bien porque casi nunca está saturado.	2026-05-13 00:14:43.379701	6	1
34	El mantenimiento ha mejorado bastante comparado al mes pasado.	2026-05-13 00:14:43.407083	7	1
35	En las noches suele haber mal olor alrededor.	2026-05-13 00:14:46.034055	7	1
36	El contenedor estaba completamente lleno esta mañana.	2026-05-13 00:14:47.097695	7	1
37	El sensor parece funcionar bien porque casi nunca está saturado.	2026-05-13 00:14:47.116545	7	1
38	El servicio ha mejorado bastante desde que implementaron la app.	2026-05-13 00:14:47.132977	7	1
39	El sistema ayuda bastante a evitar desbordes.	2026-05-13 00:14:47.147805	7	1
40	El olor disminuyó bastante desde que cambiaron el horario.	2026-05-13 00:14:47.162975	7	1
41	La tapa estaba rota pero la repararon rápido.	2026-05-13 00:14:48.932334	7	1
42	Sería bueno agregar cámaras de seguridad cerca.	2026-05-13 00:14:48.95091	8	1
43	Algunas personas siguen dejando bolsas fuera del contenedor.	2026-05-13 00:14:51.191881	8	1
44	Sería ideal agregar separación para plástico y vidrio.	2026-05-13 00:14:51.220428	8	1
45	El contenedor estuvo lleno durante dos días seguidos.	2026-05-13 00:14:53.95943	8	1
46	El contenedor estuvo lleno durante dos días seguidos.	2026-05-13 00:14:56.426549	8	1
47	Me gustaría ver el nivel de llenado en tiempo real.	2026-05-13 00:14:56.463492	8	1
48	El servicio ha mejorado bastante desde que implementaron la app.	2026-05-13 00:14:56.485949	8	1
49	El contenedor estaba completamente lleno esta mañana.	2026-05-13 00:14:58.353808	9	1
50	El área alrededor del contenedor está más limpia ahora.	2026-05-13 00:15:00.278198	9	1
51	El contenedor estuvo lleno durante dos días seguidos.	2026-05-13 00:15:00.306953	9	1
52	La app muestra correctamente la ruta del chofer.	2026-05-13 00:15:02.047445	9	1
53	Me gustaría ver el nivel de llenado en tiempo real.	2026-05-13 00:15:04.076221	9	1
54	El sensor parece funcionar bien porque casi nunca está saturado.	2026-05-13 00:15:06.351241	9	1
55	Sería bueno agregar cámaras de seguridad cerca.	2026-05-13 00:15:06.364397	10	1
56	El olor disminuyó bastante desde que cambiaron el horario.	2026-05-13 00:15:06.375638	10	1
57	Muy útil que esté cerca de mi casa.	2026-05-13 00:15:07.468932	11	1
58	Me gustaría ver el nivel de llenado en tiempo real.	2026-05-13 00:15:09.517345	11	1
59	El chofer pasó más temprano de lo habitual hoy.	2026-05-13 00:15:09.541854	11	1
60	Hubo basura acumulada después del feriado.	2026-05-13 00:15:09.564414	11	1
61	El contenedor siempre está limpio y lo vacían a tiempo.	2026-05-13 00:15:10.61397	11	1
62	El mantenimiento ha mejorado bastante comparado al mes pasado.	2026-05-13 00:15:11.949036	11	1
63	Me sorprendió lo rápido que respondieron al reporte.	2026-05-13 00:15:11.98303	12	1
64	Muy útil que esté cerca de mi casa.	2026-05-13 00:15:14.511846	12	1
65	Algunas personas siguen dejando bolsas fuera del contenedor.	2026-05-13 00:15:16.370244	12	1
66	El sistema de notificaciones funciona excelente.	2026-05-13 00:15:16.384716	12	1
67	La recolección fue puntual esta semana.	2026-05-13 00:15:17.397585	12	1
68	La recolección fue puntual esta semana.	2026-05-13 00:15:18.427019	12	1
69	El contenedor cercano al parque siempre está limpio.	2026-05-13 00:15:18.454021	12	1
70	El sensor dejó de actualizarse por unas horas.	2026-05-13 00:15:18.477835	12	1
71	La tapa estaba rota pero la repararon rápido.	2026-05-13 00:15:20.365765	12	1
72	El sensor parece funcionar bien porque casi nunca está saturado.	2026-05-13 00:15:22.40566	12	1
73	Noté menos basura en las calles desde que pusieron estos contenedores.	2026-05-13 00:15:24.365634	13	1
74	La experiencia general con el servicio ha sido positiva.	2026-05-13 00:15:25.293553	13	1
75	Sería útil recibir alertas antes de que el contenedor se llene.	2026-05-13 00:15:25.310459	13	1
76	Sería bueno agregar cámaras de seguridad cerca.	2026-05-13 00:15:26.215503	14	1
77	La app me avisó correctamente cuándo pasó el camión.	2026-05-13 00:15:28.467788	14	1
78	El contenedor siempre está limpio y lo vacían a tiempo.	2026-05-13 00:15:30.407797	14	1
\.


--
-- Data for Name: report_images; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.report_images (id, path, report_id) FROM stdin;
1	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649254/cleanflow/qgqdnfd5rfcpicw3s4f9.jpg	4
2	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649256/cleanflow/jgxbhjwm0k3roai1ebuy.jpg	5
3	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649257/cleanflow/gjzquv1s4ivlbotqnykx.jpg	6
4	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649258/cleanflow/b528uyr86fqjxfqgg1hh.jpg	7
5	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649260/cleanflow/rxljmbwbixir7uimpmgk.jpg	9
6	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649261/cleanflow/jmoxalokrryvzt5fanjf.jpg	9
7	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649263/cleanflow/nogjwemow5iqmomv4b8s.jpg	12
8	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649264/cleanflow/hstehulmgiup4kvortb6.jpg	13
9	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649265/cleanflow/xidnwcupntpv4oadmidu.jpg	13
10	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649266/cleanflow/y1qnh9p9ex3sz1o1p3bt.jpg	18
11	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649267/cleanflow/njybij03zudolwcdk1jl.jpg	19
12	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649268/cleanflow/jmoykvj1nlwo2mkfusvz.jpg	19
13	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649269/cleanflow/ftd7ing7zbhjdflmrjnb.jpg	20
14	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649270/cleanflow/jqhixet8kmxvnb95gbzq.jpg	22
15	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649271/cleanflow/ghegupmnxqttxx4zhjd9.jpg	22
16	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649272/cleanflow/ak9gdn2nqzbnmpxielhp.jpg	23
17	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649273/cleanflow/mnmyqwcjyjdmmo9vlmsa.jpg	23
18	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649274/cleanflow/xjwadcshwjhkhi750vnm.jpg	24
19	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649275/cleanflow/ts8ubwnhx4fdrgznbzym.jpg	24
20	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649276/cleanflow/vqgjujdheeuodzitfzy1.jpg	25
21	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649277/cleanflow/bw0dcxiujwpnfcwiyjla.jpg	27
22	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649278/cleanflow/jkrtzktrlexbknbtozdu.jpg	27
23	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649279/cleanflow/tojbxtoospf0zyhxikmg.jpg	28
24	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649280/cleanflow/gbpwwjrxkwj9eihyn70k.jpg	29
25	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649281/cleanflow/a8h1dltqywzhynj4v2wq.jpg	29
26	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649282/cleanflow/c9gezdb9kvhhkehngbe3.jpg	31
27	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649284/cleanflow/imzgxmrdl7zb0lb34bru.jpg	35
28	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649285/cleanflow/wzrwzgc6caflgr3surss.jpg	35
29	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649286/cleanflow/hdr2kcetwihczkykupwq.jpg	36
30	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649287/cleanflow/xsrxbme3qblhnrxibvlx.jpg	41
31	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649288/cleanflow/o0yrt5xdnonsv9p1cpb9.jpg	41
32	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649289/cleanflow/k0wnnqholx8ylh6zije9.jpg	43
33	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649290/cleanflow/vjg4ucktrqkoopsksai6.jpg	43
34	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649292/cleanflow/o3waw9fccvzckyxkb8pg.jpg	45
35	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649293/cleanflow/oliifbuemuazb7jbluts.jpg	45
36	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649294/cleanflow/ydeqpwlmfqt8jvfdsm7e.jpg	46
37	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649296/cleanflow/pac4uluhdstiiiuixa7y.jpg	46
38	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649297/cleanflow/wklfvn8rw0rlwv247vll.jpg	49
39	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649298/cleanflow/pnm6s7lvnj8u3oqv9dqw.jpg	49
40	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649298/cleanflow/ddqqmnmps4rwaw3krwdl.jpg	50
41	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649299/cleanflow/yy5v1vvrlaqvnis7ekax.jpg	50
42	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649300/cleanflow/jcerhjk7jz1gwstc5ayu.jpg	52
43	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649301/cleanflow/mdzln4avvgysdn4nehub.jpg	52
44	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649302/cleanflow/py2crxbl0j3abtitzzkm.jpg	53
45	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649303/cleanflow/g7m4vo5nuuqsa8vjg5f1.jpg	53
46	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649304/cleanflow/mr8weusgljwwikf9ewg9.jpg	54
47	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649305/cleanflow/he0t10jwlpperj4erfx6.jpg	54
48	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649307/cleanflow/xakbdr6phutyqndgossl.jpg	57
49	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649308/cleanflow/op8ni3zibduo0kg8poqb.jpg	58
50	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649309/cleanflow/qwehntcbjqx3xvpt65ja.jpg	58
51	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649310/cleanflow/vb6mrpsdjabdrachwkvh.jpg	61
52	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649311/cleanflow/huiv9otve7b5kde6iyqs.jpg	62
53	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649312/cleanflow/cxylxtds30lvihjmyy2u.jpg	64
54	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649313/cleanflow/hlffs9vgrjipek6b3stg.jpg	64
55	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649315/cleanflow/orkueiu0mk7hr8sm9htt.jpg	65
56	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649316/cleanflow/jr4d4igxpwvwb5uxqpt2.jpg	65
57	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649317/cleanflow/b46dmuafoarqmwe6syse.jpg	67
58	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649317/cleanflow/exvlh7nmguo2fdmzco1u.jpg	68
59	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649319/cleanflow/gocetgfatmef0goq5q10.jpg	71
60	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649320/cleanflow/n28pwboat0cel5jfyjo7.jpg	71
61	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649321/cleanflow/b2uch6ohzpjmyxbhlzqk.jpg	72
62	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649322/cleanflow/jt4wfkxozgncfbwm2t28.jpg	72
63	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649323/cleanflow/fkefcr3tspmewxelueya.jpg	73
64	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649324/cleanflow/qg9ocnj0woj9z0tnzlok.jpg	73
65	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649325/cleanflow/q5zaf3e4rybqnt1hvxjr.jpg	74
66	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649325/cleanflow/pns37gkr1q0uv0lgz2tw.jpg	76
67	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649326/cleanflow/ctpky8dai88lmqnfze4u.jpg	77
68	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649327/cleanflow/ffh8zmvaa6ardqigzsrd.jpg	77
69	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649329/cleanflow/zzg448mp2rtbxroiden9.jpg	78
70	https://res.cloudinary.com/drpvxaxr2/image/upload/v1778649330/cleanflow/hnxdaqsobrisu9t6rb3l.jpg	78
\.


--
-- Data for Name: residents; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.residents (latitude, longitude, id) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: user_viewports; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.user_viewports (id, active, last_seen, viewport, user_id) FROM stdin;
2	t	2026-05-13 09:19:21.976455	0103000020E61000000100000005000000CF93D5D5D24153C0393FD87B692E28C0CF93D59B864053C0393FD87B692E28C0CF93D59B864053C0D0DE9481662328C0CF93D5D5D24153C0D0DE9481662328C0CF93D5D5D24153C0393FD87B692E28C0	1
1	t	2026-05-13 00:27:45.027297	0103000020E610000001000000050000001D7968E7B34153C075B3122AEA2E28C01C7968CD834053C075B3122AEA2E28C01C7968CD834053C036F6B9B8BD2428C01D7968E7B34153C036F6B9B8BD2428C01D7968E7B34153C075B3122AEA2E28C0	2
\.


--
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: dbuser
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: dbuser
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: dbuser
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: dbuser
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: dbuser
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: dbuser
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- Name: container_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.container_images_id_seq', 14, true);


--
-- Name: containers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.containers_id_seq', 14, true);


--
-- Name: metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.metrics_id_seq', 1, false);


--
-- Name: points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.points_id_seq', 1, false);


--
-- Name: report_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.report_images_id_seq', 70, true);


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.reports_id_seq', 78, true);


--
-- Name: routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.routes_id_seq', 1, false);


--
-- Name: user_viewports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.user_viewports_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: topology_id_seq; Type: SEQUENCE SET; Schema: topology; Owner: dbuser
--

SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

