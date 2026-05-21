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
-- Data for Name: actual_container; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.actual_container (id, container_id) FROM stdin;
1	2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.users (id, email, first_name, last_name, password, role, username, enabled) FROM stdin;
5	driver4@example.com	Pamela	Driver	$2a$10$uFbunJb8AoTTMghVc9gWl.vWpAWSOhvHotphLAa/5hHdF/UfQfJWW	DRIVER	driver4	t
3	driver2@example.com	María	Driver	$2a$10$MoRUk57mM.Sk9UkRvtMNnuEyOvF3uCgs6tXqsQzzT6123NqKOdsgq	DRIVER	driver2	t
6	driver5@example.com	Alma	Driver	$2a$10$wed3tiycOjcArTVNAGg8/.Avo32acE3xcXb4EqKY6DhbSwgT2/QJC	DRIVER	driver5	t
4	driver3@example.com	Carlos	Driver	$2a$10$kRyevS0bLqA8mrsRmd.Yg.0uVc.rOvpuO09dUwX3BOBQSQQkViL36	DRIVER	driver3	t
2	driver1@example.com	Juan	Driver	$2a$10$Jy7F6EvKnOJh4IuMgl9Hh.4sYHxldhW9vOKIiGzR9A9hSlaE4MGCC	DRIVER	driver1	t
1	admin1@example.com	Admin	San Isidro	$2a$10$V/H82VltpU9mTax7yzAsW.qj0eG3HCpYVdjL7LfYSoL81g66AxVVy	ADMIN	admin1	t
\.


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.admins (id) FROM stdin;
1
\.


--
-- Data for Name: container_images; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.container_images (id, url) FROM stdin;
1	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779234792/cleanflow/u1edmwfoi52iki5vmm1y.jpg
2	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779234821/cleanflow/iywfmvwtn6uiv54huuas.jpg
3	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779234854/cleanflow/zfykbnpcpuuug2dmynbp.jpg
4	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779234896/cleanflow/kyxj4aiuk7iqnicrna9i.jpg
5	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779234932/cleanflow/xxy3yiitr4ardhjblxc9.jpg
6	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779234956/cleanflow/ityordwjr7lzq0uzddf8.jpg
7	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235019/cleanflow/nrgdvqorzepxmi3zkiwf.jpg
8	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235061/cleanflow/zsyfeyke9d53jwz9w62s.jpg
9	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235093/cleanflow/dihckjasfkmmn8tc4ygg.webp
10	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235130/cleanflow/ayyv58coxoqbmwqhp9yh.jpg
11	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235169/cleanflow/pkbqbicdqusfkjhuknsr.jpg
12	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235247/cleanflow/e9kvc0stfutfn5ov2yxc.jpg
13	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235289/cleanflow/riqpl6qcejg1kqrtepwq.jpg
14	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235331/cleanflow/kdfklop4browwdtncvqk.webp
15	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235386/cleanflow/b2msrmvrhmsnohflsyab.jpg
16	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235447/cleanflow/syybwgsk3l8ztanekjja.jpg
17	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235495/cleanflow/gaqyhfyqxbaj518lyln3.jpg
18	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235573/cleanflow/zit6lhpe4rbug8sywalq.jpg
19	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235630/cleanflow/qfih1mbcpa4gixhexvd6.jpg
20	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235686/cleanflow/waqmll8kd0sptijrm3um.jpg
21	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235731/cleanflow/zi4hkkwoqmyhg1pczczl.jpg
22	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235819/cleanflow/mi8lh7hznao3wgfurgdo.jpg
23	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235862/cleanflow/av2u3xukpwxbndzumdjn.jpg
24	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235899/cleanflow/poymfka4poz3ciuv7ohv.jpg
25	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779235961/cleanflow/n8y2vgytyo0lji00z3io.jpg
26	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236002/cleanflow/l272jfg8xaa8pzxeivmr.jpg
27	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236044/cleanflow/dl14nohumj2edvkim8dk.jpg
28	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236100/cleanflow/xzpcs99wd9gmt2qlmv81.jpg
29	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236152/cleanflow/eev0eeovgjaediwg2xi8.jpg
30	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236187/cleanflow/j753lmtrhbj5otp2gksw.jpg
31	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236240/cleanflow/rh6xjslmact42n83gncw.jpg
32	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236279/cleanflow/tnuhfusjluturoolelhx.jpg
33	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236314/cleanflow/qjd4hauvypv46nwra2c9.webp
34	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236354/cleanflow/m4fiqsraxjix0gf96xoh.jpg
35	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236392/cleanflow/lvhujz51bkwmxrui5lnt.webp
36	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236425/cleanflow/jqi3uo6q1kbxuuvujg1p.jpg
37	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236545/cleanflow/pijzh8wvdklcdfx9xkfn.jpg
38	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236564/cleanflow/djwplkdiqz0ytdg6o3ik.jpg
39	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236595/cleanflow/wevyfkvanqqcabtu3rs4.jpg
40	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236652/cleanflow/jxccdi77zgkf4otl6jmq.jpg
41	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236700/cleanflow/rysql9lvdr9py2f6f6bj.jpg
42	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236725/cleanflow/mpfnla3kei3za8azicts.jpg
43	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236758/cleanflow/ouiberptl8avz4kqy3ue.jpg
44	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236799/cleanflow/ccpn4smdhzgcz6hdelai.jpg
45	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236850/cleanflow/qdv7q7hwwikyvjotvqk1.webp
46	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236911/cleanflow/fmcxw0c4cwyjaqkfo2tn.jpg
47	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236951/cleanflow/h2m2baikc4j3feefa46l.jpg
48	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779236986/cleanflow/ytuxwwtvrl9edwe3qadz.jpg
49	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779237021/cleanflow/ruszlodg5ojtsipeaugy.jpg
50	https://res.cloudinary.com/drpvxaxr2/image/upload/v1779237094/cleanflow/lmtd5lx8noaqarz9g7nj.webp
\.


--
-- Data for Name: containers; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.containers (id, address_name, api_key, location, name, secret, container_image_id) FROM stdin;
1	Parque Hipólito Unanue	4565f8a2-1e30-4397-9851-841030674e71	0101000020E6100000C7B037D77B4153C0881B58EADF2C28C0	Contenedor 1	$2a$10$6wKs4W/xS7sNiGIuK20dnusj40FajghKG5OybSdRWUHkU4/HtBqva	1
2	Parque Fernando Carbajal	b396bd16-5e58-467c-9141-8c0ceba31e6d	0101000020E6100000758B1866734153C0B6CDF376F32B28C0	Contenedor 2	$2a$10$0CnyZira7k1qWB5Hla9gt.fteKD2IGOuqzGicPptnm676YLD0sAjm	2
3	Parque Sergio Bernales	6e4b654e-f54a-4bae-8f88-6ba8633144db	0101000020E61000007009E7EC734153C0AA63E93EB72A28C0	Contenedor 3	$2a$10$RVELpwEx7Zpowf7sV/ynCuO2okn3PqE/GHYWuVukbT9p/QDaE42vq	3
4	Cruce Av. Canadá con Los Brillantes	264ab446-b4c2-4f05-91d2-219954d4f9da	0101000020E6100000C9DD9F47A14153C0831695DD312A28C0	Contenedor 4	$2a$10$Al37lpn6FnhZ1/KhE1BXt.01uioe8iUBEHgX32iL/BP43.6NfLv.u	4
5	Parque Carlos Socco	553a52c8-edaa-4742-ba97-c9054df6ebb8	0101000020E6100000DF990667534153C099FBF4CE3C2A28C0	Contenedor 5	$2a$10$U6BhYEeo10PrXKRABYsQVOJA3qBEHwc85Feqm7iz5WMzaGLjOliju	5
6	Parque Felipe Pinglo	11efa575-f651-4d12-8df2-f137069601ac	0101000020E6100000024AD8E04A4153C0F65872E6CD2A28C0	Contenedor 6	$2a$10$LVm71rT8H2/qRpKVTtY/buj9IyodWNDc1HfaIB3W6w4RW/AnODdRq	6
7	Parque Divino Niño Jesús	a5957ea9-8927-42ff-8378-8e7f8a0f7531	0101000020E6100000EC14AA30374153C08E8FE754A52A28C0	Contenedor 7	$2a$10$5UsDK/vT/bDvkNjTi3CDnOOHgicfXTWU9U3VGhoOwhOHJTsRJOpKu	7
8	Parque Martin Luther King	49c8524d-b40b-4a1f-9911-e4b1c159867d	0101000020E6100000B041A9472F4153C0DB15A4B0172A28C0	Contenedor 8	$2a$10$bLz4WxO2hbLuX63Bfa6xvef53CIDdqPNU1FG9glEWOxRb9DomIb4y	8
10	Parque López Albujar	2738ffdb-6066-4771-ac64-c91f4fa881df	0101000020E61000008F08986B034153C005A85A2D9E2B28C0	Contenedor 10	$2a$10$oF/KEcf/7IQo05C2MhapUeOGTNzbCxIyR3YDyfny/dgltP/.KkU7i	10
11	Cruce Av. Santa Catalina con Av. San Eugenio	15b92bb0-2f4e-4301-a04b-194c31942af9	0101000020E6100000EB14AA0F2B4153C007AD577F5B2B28C0	Contenedor 11	$2a$10$wkWzzGvDzBlBslX.VnTV4unOvREzyEwGEiOdxpQRBsTIXBw5THaZi	11
9	Parque Emilio Kouri	a7bd0d9c-ab7b-4c96-89fa-c792b787482e	0101000020E6100000775C2938114153C00A01FCE3802A28C0	Contenedor 9	$2a$10$kBfPQfqLINvlGRa3zEm6auIfcg02TE3USQnppCiIKTgvI0QP1Blo2	9
12	Cruce Calle Pascual Saco Oliveros con Av. Santa Catalina	92759905-9cb0-4120-acb5-a3373e694d4d	0101000020E6100000E792F827384153C060B61DA7722C28C0	Contenedor 12	$2a$10$khoKkWECPsuAPe0Hsj9Mcum4nH/iXbdWMt/l7N9Mj6azgqVvA19qy	12
13	Cruce Calle Pascual Saco Oliveros con Calle Miguel Checa	2ea6d474-02c0-4858-bc99-5c412d86ec87	0101000020E610000080CC5BF4104153C0420B50188C2C28C0	Contenedor 13	$2a$10$yvaFHqmhd8.snWzCg0HCRua7ZOlSOP9WMlJXOigJ5HTZHfsEbs2Si	13
14	Cruce Calle Pedro Bertonelli con Calle Manuel Vildoso	2497d468-0235-400d-b840-5ec04f456752	0101000020E610000052082FA8214153C0B130088CF52B28C0	Contenedor 14	$2a$10$PpxywIAMjjLwd8wkfRtrUOaGIJ.4o0LA/KTfdOkt4bzIa6g9hqSmW	14
15	Calle Carlos Villarán	22781c90-bf57-45f9-84f5-4ec632233756	0101000020E6100000775C293A1E4153C0865BA02A3E2D28C0	Contenedor 15	$2a$10$UKc1eLcvpV0CfPLzvG5JX.YNF0xLi1hteU3fzrbZAk/e4e7dvQI.y	15
16	Cruce Calle Carlos Villarán con Av. Esteban Campodónico	be56038a-d4f2-4171-a6cc-e64934a1a34f	0101000020E610000015EB5523534153C042AFAA81762D28C0	Contenedor 16	$2a$10$73/hInXh3w.G6cEIkvD.3.9fU2prOq1qRmNoz6c4yI5t0vlVOoZaG	16
17	Cruce Av. Esteban Campodónico con Jr. Antonio de Zela	14aa1e3a-777b-46ae-9a6a-5fe6807a0c4b	0101000020E610000024DDB91A544153C0117DEC784B2C28C0	Contenedor 17	$2a$10$N7IhAe1eF1hzUyoJ/q8yOObD9HIQFYE.lFXqXctDoWNQrbIfGe3lC	17
18	I.E. Victor Andrés Belaúnde	8f094c88-923f-4508-bc72-057ec08a4575	0101000020E6100000C0F4259A4D4153C0B3FEC8088D2B28C0	Contenedor 18	$2a$10$D4QcRvyUgagWdEGP7DXwQuJDfFipBmsLqD5ftfjm43bpphi.Kc7XG	18
19	Cruce Calle Ricardo Flores con Jr. Alberto Barton	8c10f696-4999-486e-8328-62f63533a5ce	0101000020E6100000CAAE302A9F4153C05016EC87452B28C0	Contenedor 19	$2a$10$MbX76klG.PmsmjvswiT4leFcW7vEmX0k.4p0QaZydfbMkwL/JxYZi	19
21	Parque Coronel Luna y Peralta	41cb3e66-ca27-44c6-b6ec-f7ce34836688	0101000020E610000006AF19A1894153C02B716E3D172928C0	Contenedor 21	$2a$10$r1wJZPNJadOK.A.ZA22PPOb5071vlt8T3dm6isyiAgYKe640BLaiG	21
20	Cruce Enrique León García con Av. Canadá	1b6092c4-585c-4b55-9459-d782df8ded0c	0101000020E6100000ED8BEA786E4153C0A1A54D61D62928C0	Contenedor 20	$2a$10$nn4gZ6n0N4qUuj88bOAGluSbVtPW1luqpT3sOGJdeaJGqpEl6IlWC	20
22	Cruce Calle Las Ágatas con Calle Brillantes	4a831f1c-e7c4-4a01-a928-4d1707950aaa	0101000020E6100000FE117FC4AA4153C0BAD891B7952928C0	Contenedor 22	$2a$10$glVE111eb55v9/WyJ8CQwuSf6OatgtyMND3M7uf8Ug7QuYX1TWSTa	22
23	Cruce Calle Brillantes con Av. de Las Américas	37a46f32-482f-4311-b3b5-791865e9693e	0101000020E6100000FD9A3EEEB54153C08670B6299C2828C0	Contenedor 23	$2a$10$/qXlAR60U36llEpAyl2uf.oNNskyOQZJ4pQsYcb8c5dkCjc/4Mf2e	23
25	Cruce Santiago Cárdenas con Parque Unión Panamericana	b690518c-6ba4-4f5c-906c-72d900044768	0101000020E61000003219F638634153C03425F9B7142828C0	Contenedor 25	$2a$10$1zeavIU/BnnjaVq2i197kOX94aREPLJ1oJOcYd3FrfYEw9eFh7Vfa	25
26	Cruce Av. Palermo con Parque Unión Panamericana	8c2c6466-2cbf-4357-aecb-c47cf15cd299	0101000020E610000083AA64FD714153C07EBCBD14242728C0	Contenedor 26	$2a$10$r2/wbrYgdluaL/qEpVYjxe7ZAe3u1/MYkyZP/CQ.JEODR95o6PE/u	26
27	Cruce Av. de Las Américas con Jr. Los Diamantes	dfc91db4-7fb0-4179-8ec9-9b1617979e0c	0101000020E6100000CE9CB15B4F4153C0DF324C743B2728C0	Contenedor 27	$2a$10$bLbKktb/lYO.qUnc/uFD0OgZR4rAQsG/KQ7U0./mPbTGy1LV6HNAK	27
24	Cruce Av. de Las Américas con Jr. Los Diamantes	2b7c3cf9-5b10-46be-ab11-387233b8db42	0101000020E6100000732450558A4153C023F54366152828C0	Contenedor 24	$2a$10$WWMUi8Kng4VJwm.zbrPh0O8HYVVsqXwfXeW68xiHTXla8mZDXIKWm	24
28	Cruce Los Jaspes con Av. México	bd7491dd-08d1-4661-9f75-d7aa6e3c0896	0101000020E6100000C38856A7934153C0E84D4E70A12628C0	Contenedor 28	$2a$10$m3SQW0jQ9R/s7FtcOoIo0.FrzYLqGBVbxjoOtuv4XyN0Da4.qjbk6	28
29	Cruce Jr. Los Topacios con Pje. Los Jacintos	de442632-a509-4067-95a7-2489eb96bb18	0101000020E61000002A5F6BF79C4153C0DAF4A8EF562728C0	Contenedor 29	$2a$10$j7xAi5qoqo0zkLZGFpahi.3vhfufkqZpHFcntxSTojaCBpdPOboUq	29
30	Cruce Calle Brillantes con Las Amtistas	5757fb6d-e8cc-4875-b9c9-19161b236f1c	0101000020E6100000DDAB05E2C14153C001C2E3A48E2728C0	Contenedor 30	$2a$10$GyDgv25OPwuoIaFWYu/y8uSsfXACix8ggxuY7iBYwf8XBTFLOSUTC	30
31	Cruce Coronel Casimiro Negrón con Antonio de la Guerra	92c74cff-5c49-4b5a-984c-81fd4241fa26	0101000020E610000067206D33594153C0A499DBF5502928C0	Contenedor 31	$2a$10$xtm1hTyad7lYbNzK3baSVOr1sbqBtVU8hVWGIF6kSYGASSs7pZbGG	31
32	Cruce Federico Barrero con José M. Cortez	834cb370-00b1-42f3-9067-a05af4aa58a7	0101000020E61000006DA29EBF364153C0805B9B1A792828C0	Contenedor 32	$2a$10$un7LOhl5HZEsXO82GvF8IuGg/wGCUN2fBftyLokrkxRr4SYI3JvQG	32
33	Parque Miguel Dasso	f8db1741-90fc-42f9-9b95-7cba15312581	0101000020E610000014741563394153C06A91090B852728C0	Contenedor 33	$2a$10$6K37bQBKzKI4bHmdCjzW6OL48Mq6uOusQN7iW6XLkfwd5coXZ/B6u	33
34	Cruce Av. de Las Américas con Prolongación Lucanas	09e04fac-2e6f-4c56-a2da-f8f1d6607a70	0101000020E6100000A2056D6A1B4153C0C5D8672FAF2628C0	Contenedor 34	$2a$10$s8e4XZpCRFMUlbQYUfLzyuGFYSseEJ/oQwDTM1rcjGGFExthP8xlK	34
35	Cruce Mariano Aragonés con Huamanga	bdf3c86b-e010-4276-af8f-0ac0a9a8d8e1	0101000020E6100000D856BC4F2E4153C0FCFFF9E1362628C0	Contenedor 35	$2a$10$/15hRwSF6kXhQgdJpJCKsOPBZLMqjZrlb1shfLHRVbkjJmMkkdUJ.	35
36	Jirón Juan Castro	dd1ffdd2-a928-425a-88ed-aa362318c4ee	0101000020E6100000F01F1BDA604153C0A07E4DF07A2628C0	Contenedor 36	$2a$10$VM0.IbgafRxE6foRb98rreO0UQUlBctl1Wscmg22l9phH6L/Yzc8m	36
37	Parque La Pólvora	5ee37103-1ae9-458c-b1b3-bfad087826dc	0101000020E610000042829A8EEF4053C0AB4F0FC0B62928C0	Contenedor 37	$2a$10$/dZIesd71uUkHa6JMGMi8urRFpAMnpsT7Hii/mxAmbsCl9BvkCnca	37
38	Parque Cultura	c1952dd3-51f4-4c73-833b-df6aae360b91	0101000020E6100000F3845C58004153C09A1AB07DDD2828C0	Contenedor 38	$2a$10$EVDEdSstYf8U/ZlyDlgfFufQs/NqDI2SOBKDypoOL7gXxi.aVT0hy	38
39	Parque Monte Carmelo	8dedb162-f7d5-4714-a5f7-844c7a95c75c	0101000020E610000028E8AA7E164153C0E01292BA062928C0	Contenedor 39	$2a$10$ZTO11JUUIp/kI3JVT3rd4u7ho6n0JhUCOyfAp9oqOax7vlAsg7xRu	39
40	Cruce Calle José Sannoni con Calle Juan Carlos Vizcardo y Guzman	c492dc1c-59d2-49a9-8666-4faf9503248e	0101000020E6100000A0D88440204153C009C57544532828C0	Contenedor 40	$2a$10$aKIOdL2DUb2Y6PmYjAVUP.sJQyOaB5TGNsV7MUv4ZCe0O7w14N6Sm	40
41	Cruce Calle Moyobamba con Calle Carlos Gutíerrez	9514ca1e-dd02-4016-b79c-0f2f4b50251c	0101000020E6100000EF79EB7E064153C0DF5D73F6612728C0	Contenedor 41	$2a$10$mkAz7fgteN00oTx.OTPOs.vDuyAd9Mg.E6MYTF2Sz7X/xcpvO.d5a	41
42	Parque La Cuadrada	9f451068-0d33-45c7-9536-410aefc3b2e5	0101000020E610000013472DDEF34053C0C9F395C82C2828C0	Contenedor 42	$2a$10$mQLMmrLIJHLhVXOg/wjhGe3gmMd8lfj0gjVMDMh4U2SPTCuM77as6	42
43	Calle Llamas	4f9bbe79-4f61-4141-9c33-d5536b1bc118	0101000020E610000052082F98E64053C0DC76D248B62828C0	Contenedor 43	$2a$10$x35XlR7OjB5F5PnslOUdO.6wscdYZHkFLFgE2oGPoLiwRISo7LOW6	43
44	Cruce Av. de Las Américas con Calle Ignacio Cossio	5fb33658-7c07-48cb-b2d7-5b6fa6e1ff47	0101000020E61000007A1D42CED54053C0930FF9F2C42728C0	Contenedor 44	$2a$10$qMWWF15iz2k1.Uqaz4GtB.xp2jyTplsUrt26pgcoxcmp7jH.4hAvS	44
45	Cruce Calle Jaime Garzo con Pasaje 1	23bce402-bdc2-45dc-b138-121771efc174	0101000020E610000060DD2218C04053C09E94F4DED02628C0	Contenedor 45	$2a$10$HJrNqb.vqr.23tLByHiamOBItlfjG9ZQn.ZpuFKI5iqSCTXqlPVKi	45
46	Parque Bellas Artes	10bca6e7-913d-4da4-95df-61d26fbd4d2c	0101000020E610000076E5E830D54053C03D8C6189902528C0	Contendor 46	$2a$10$AD2g7SgYqxOqLj9tqKT4RujOap7euPzyM1tGyB9knhLyH0d2qQwtC	46
47	Cruce Calle Jorge Cuba con Calle Antonio Bazo	6ec13a1b-34f3-4c46-83e5-cc39b5d72712	0101000020E6100000C1218E54DE4053C0A34845DCD02628C0	Contenedor 47	$2a$10$juEqNVbavw7TU/PqJGJ44OuzhLz0UrLQJ/WV5IflkDJVoo9ZY3oMC	47
48	Jr. Carlos Gutierrez Noriega	eb58956d-9318-48b1-9a92-800d9eee2b75	0101000020E61000005B01A1BBF74053C0A929B57FF32528C0	Contenedor 48	$2a$10$1.3svdSL0kIwvAuAKELrYuW4peFpR0MtFRq0kFoE7.8PcTH1n.DAC	48
49	Jr. Hector Arellano	92790629-a321-4a39-b9e1-a281d2624d16	0101000020E6100000BFAACD22014153C095FCB3BEC12628C0	Contenedor 49	$2a$10$FKb40MxzfaPh7r9ucdnWQ.6Qc6//IK/LWWGqD9hMRiiGSL7/oTHvi	49
50	Cruce Av. Canadá con Av. Nicolás Arriola	e89ad892-0526-4d2b-8d86-36e7f5b6dab9	0101000020E61000000916E2EFE94053C0C1757B24872A28C0	Contenedor 50	$2a$10$LXdvU3pqXFRJ54nEu0Q69.iu4ONTLcrYGnxpBK5muGls9ISZATAhO	50
\.


--
-- Data for Name: container_edge; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.container_edge (id, duration, polyline, id_first_container, id_second_container) FROM stdin;
2451	100.9	`{whAnrbuMj@QV`DuLrDMMOqCjAa@]oGQ@	1	2
2452	104.3	`{whAnrbuMvBs@JWY}EQY[S_AAkYtBNlB	1	3
2453	110.4	`{whAnrbuMj@QV`D{Bv@e^hKYyCTI	1	4
2454	128	`{whAnrbuMvBs@Li@[kEQY[Ss@AYsDe^hCM}B	1	5
2455	129.1	`{whAnrbuMvBs@Li@[kEQY[Ss@AYsDwRtAQsBcCRIqA	1	6
2456	159.2	`{whAnrbuMvBs@Li@[kEQY[Ss@AYsDwRtAQsBwFb@I}CNsBPcA	1	7
2457	173.7	`{whAnrbuMvBs@Li@[kEQY[Ss@AYsDe^hCMsBuBPK_B@iDp@mE	1	8
2458	201.2	`{whAnrbuMvBs@Li@[kEQY[Ss@AYsDwRtAY}D@sAJo@vAuEcFiBlEkMbBj@	1	10
2459	162.2	`{whAnrbuMvBs@Li@[kEQY[Ss@AYsDwRtAY}DD_BhAgEtB_GUKyA`E	1	11
2460	211.7	`{whAnrbuMvBs@JWY}Em@m@_AAsd@hDcAwJHsGb@mCfF{OnBp@{@dC	1	9
2461	122.7	`{whAnrbuMfBk@TQF_@Q_CzCUa@sF@q@u@qKcJp@Dh@	1	12
2462	132.6	`{whAnrbuMfBk@TQF_@Q_CzCUa@sF@q@u@qKyBPg@aHc@s@yBcA	1	13
2463	149.1	`{whAnrbuMvBs@Li@[kEQY[Ss@AYsDwRtAY}D?_ALcA`AcDtB_GrBr@	1	14
2464	113.2	`{whAnrbuMfBk@TQF_@Q_CzCUa@sFAyAsAsQI@@H	1	15
2465	70.4	`{whAnrbuMvBs@Li@[kEQY[Ss@AUwCpFe@@N	1	16
2466	73.5	`{whAnrbuMvBs@JWY}EQY[Ss@AYsDwE\\AG	1	17
2467	106.6	`{whAnrbuMvBs@Li@[kEQY[Ss@AYsDsKx@OwBuAJ	1	18
2468	69.7	`{whAnrbuMj@QV`DsM`E_FrAAK	1	19
2469	201.3	`{whAnrbuMj@QV`Dab@`MUaC[Q{D^DtAiDRa@wGx@k@l@kA_B_@	1	21
2470	112.2	`{whAnrbuMvBs@JWY}EQY[S_AAed@fD	1	20
2471	136.1	`{whAnrbuMj@QV`D{Bv@e^hKUaC[Q{D^DjA	1	22
2472	146.6	`{whAnrbuMj@QV`D{Bv@ep@nRq@cC	1	23
2473	186	`{whAnrbuMj@QV`Dab@`MmBsPk@}@eSkCYqC	1	25
2474	218.6	`{whAnrbuMj@QV`Dab@`MmBsPo@aAaSgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	1	26
2475	258.5	`{whAnrbuMvBs@JWY}Em@m@_AAsd@hDcAwJB}EYi@aEi@aPaHu@hBEdC_CEgBd@zBvH	1	27
2476	190.6	`{whAnrbuMj@QV`Dab@`MmBsPo@aAoMaBYzAo@rAcClB	1	24
2477	217.5	`{whAnrbuMj@QV`Dub@pNaYjIqDp@{@Ki@g@]{As@qA{BqIrCw@iAsD_Cj@	1	28
2478	181.5	`{whAnrbuMj@QV`Dub@pNaYjIgDn@}@Eq@k@]{As@qA{BqI~EwABJ	1	29
2479	192.9	`{whAnrbuMj@QV`Dub@pNaYjIuCj@gA?s@e@qCsIrC{@`B|F	1	30
2480	185.5	`{whAnrbuMvBs@JWY}Em@m@_AAsd@hDcAwJB}E_@o@MrDNtD_BR	1	31
2481	185.1	`{whAnrbuMvBs@JWY}Em@m@_AAsd@hDcAwJB}EYi@mDa@qEqBk@dB	1	32
2482	219.1	`{whAnrbuMvBs@JWY}Em@m@_AAsd@hDcAwJB}E]m@}De@aPaHu@hBIrE	1	33
2483	225.7	`{whAnrbuMvBs@JWY}Em@m@_AAsd@hDcAwJB}E]m@}De@}YiMeAnB	1	34
2484	244.7	`{whAnrbuMj@QV`Da{@hX{G|@cCyEwIq\\}B}W~BU	1	35
2485	215.4	`{whAnrbuMj@QV`Dub@pNaYjIgEp@iAk@c@cBs@qAoIo[Ga@x@a@p@eD	1	36
2486	220.7	`{whAnrbuMvBs@Li@[kEm@m@s@AYsDwRtAY}D@sAbBeGeVkIb@kI\\}A	1	37
2487	231	`{whAnrbuMvBs@JWY}Em@m@_AAsd@hDcAwJB}E_@o@uCUiDuAp@}AyAq@\\aAl@cK	1	38
2488	241.5	`{whAnrbuMvBs@Li@[kEm@m@s@AYsDwRtAY}D@sAbBeGkUcI_CSNgCaBMUrE	1	39
2489	192.6	`{whAnrbuMvBs@JWY}Em@m@_AAsd@hDcAwJB}ESa@gEq@sIwDl@_B	1	40
2490	225.1	`{whAnrbuMvBs@JWY}Em@m@_AAsd@hDcAwJB}EYi@aEi@oU{JRo@TeDPE	1	41
2491	265.2	`{whAnrbuMvBs@JWY}Em@m@_AAsd@hDcAwJB}ESa@gEq@sIwDbCuGXaB_DID}@sAe@fAsC	1	42
2492	264.3	`{whAnrbuMvBs@JWY}Em@m@_AAsd@hDcAwJB}ESa@gEq@sIwDbCuGl@sDeCeApBaFf@k@	1	43
2493	283.6	`{whAnrbuMvBs@JWY}Em@m@_AAsd@hDcAwJB}E]m@}De@oU{JRo@^}DjGsOkBo@	1	44
2494	336.2	`{whAnrbuMvBs@JWY}Em@m@_AAsd@hDcAwJB}E]m@}De@oU{JRo@^}DjGsOqE}A}KwAh@oA`Bg@	1	45
2495	289.9	`{whAnrbuMbCkAY}Em@m@sf@fDcAwJB}E]m@}De@w^mO{CY{DTwCyPnCg@Ms@	1	46
2496	310.9	`{whAnrbuMbCkAY}Em@m@sf@fDcAwJB}E]m@}De@w^mOwEUm@uDt@i@DaBlGd@`A{F	1	47
2497	251.3	`{whAnrbuMbCkAY}Em@m@sf@fDcAwJB}E]m@}De@w^mOwEUm@uDv@i@	1	48
2498	280.1	`{whAnrbuMbCkAY}Em@m@sf@fDcAwJB}E]m@}De@w^mOwEUYgBhCOzC`@z@Y	1	49
2499	277.4	`{whAnrbuMvBs@Li@[kEm@m@s@AYsDwRtAY}D@sAbBeGkUcI_CSZoF[a@dDwJlIxC	1	50
2500	78.1	lowhAbnbuMPAUuChHk@p@zIZK	2	1
2501	67.9	lowhAbnbuMPAUuCwM~@NlB	2	3
2502	92.8	lowhAbnbuMkDVd@|HgPbF	2	4
2503	85.5	lowhAbnbuMPAm@iIgRrAM}B	2	5
2504	86.6	lowhAbnbuMPAm@iIyF^QsBcCRIqA	2	6
2505	116.7	lowhAbnbuMPAm@iIyF^QsBwFb@I}CNsBPcA	2	7
2506	131.2	lowhAbnbuMPAm@iIgRrAMsBuBPK_B@iDp@mE	2	8
2507	158.7	lowhAbnbuMPAm@iIyF^Y}D@sAJo@vAuEcFiBlEkMbBj@	2	10
2508	119.7	lowhAbnbuMPAm@iIyF^Y}D@sAJo@vAuE~AmEUKyA`E	2	11
2509	170.5	lowhAbnbuMPAm@iIyF^Y}D@sAJo@vAuEgPwF~B}GnBp@{@dC	2	9
2510	116.7	lowhAbnbuMPAm@iIyF^Y}D@sAJo@jA}D`EtAtAJhCKBP	2	12
2511	147.7	lowhAbnbuMPAm@iIyF^Y}D@sAJo@fAqDjGwQLQvEjBs@pBHB	2	13
2512	106.6	lowhAbnbuMPAm@iIyF^Y}D@sAJo@vAuE~AmErBr@	2	14
2513	129.4	lowhAbnbuMPAk@kH|R_BwA{RI@@H	2	15
2514	75.7	lowhAbnbuMPAk@kHpR}A@N	2	16
2515	86.2	lowhAbnbuMPAk@kH~Jw@C[wE\\AG	2	17
2516	64.1	lowhAbnbuMPAm@iIUBOwBuAJ	2	18
2517	92.5	lowhAbnbuMkDVd@|HvA_@PfD_FrAAK	2	19
2518	215	lowhAbnbuMkDVd@|HeJnCRbDqErAUaC[Q{D^DtAiDRa@wGx@k@l@kA_B_@	2	21
2519	75.8	lowhAbnbuMPAUuCqXpB	2	20
2520	149.8	lowhAbnbuMkDVd@|HeJnCRbDqErAUaC_@QwD^DjA	2	22
2521	160.3	lowhAbnbuMkDVd@|HeJnCRbDqWxHq@cC	2	23
2522	162.4	lowhAbnbuMPAm@iIkYrBYz@t@bG}RgCYqC	2	25
2523	195	lowhAbnbuMPAm@iIkYrBYz@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	2	26
2524	219.3	lowhAbnbuMPAm@iIiYrBa@cEB}E]m@}De@aPaHu@hBEdC_CEgBd@zBvH	2	27
2525	167	lowhAbnbuMPAm@iIiYrB[z@t@bGkMaBYzAo@rAcClB	2	24
2530	145.9	lowhAbnbuMPAm@iIiYrBa@cEB}E]m@iD]qEqBk@dB	2	32
2535	178.2	lowhAbnbuMPAm@iIyF^Y}D@sAJo@vAuEeVkIb@kIDc@Vy@	2	37
2540	226	lowhAbnbuMPAm@iIiYrBa@cEB}EYi@aEi@sIwDbCuGXaB_DID}@sAe@fAsC	2	42
2545	271.7	lowhAbnbuMPAm@iIiYrBa@cEB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	2	47
2550	61.6	`awhAxnbuMOmBxGg@TvCjDW	3	2
2555	99.1	`awhAxnbuMOmBgJr@cAwJAiDtBBr@oF	3	8
2560	174.8	`awhAxnbuMOmBvM_AWsDyF^Y}D@sAJo@vAuEzFsPLQvEjBs@pBHB	3	13
2565	91.2	`awhAxnbuMOmBvM_AWsDUBOwBuAJ	3	18
2570	127.2	`awhAxnbuMz@jL{Ab@RbDqWxHq@cC	3	23
2575	187.2	`awhAxnbuMOmBgJr@c@sDYz@t@bGkMaBYzAo@rAcClByA\\wAH}AOcBk@aAzA_Cj@	3	28
2580	142.7	`awhAxnbuMOmBgJr@cAwJB}E_@o@sBMgAUaPaHY`@[fAIrE	3	33
2585	154.6	`awhAxnbuMOmBgJr@cAwJB}E_@o@uCUiDuAp@}AyAq@\\aAl@cK	3	38
2590	187.9	`awhAxnbuMOmBgJr@cAwJB}ESa@KMsBMgAUsIwDbCuGl@sDeCeApBaFP[TO	3	43
2595	174.9	`awhAxnbuMOmBgJr@cAwJB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@d@E	3	48
2600	62.3	~yvhA|_cuM|GwB{@kL	4	3
2605	168.4	~yvhA|_cuMUH_CgRcAwJB}Eh@cE|AgFhCsHnBp@nAqDtHjC	4	10
2610	133	~yvhA|_cuMUH{C}VnQqAWsCGuBLwAZkAzCwIrBr@	4	14
2615	89.5	~yvhA|_cuM~RcGPfD_FrAAK	4	19
2620	84	~yvhA|_cuMUHsAyKk@}@eSkCCiA]aAFE	4	25
2625	160.4	~yvhA|_cuMUHc@iDSGMNfAdI_EjAgAl@_HxB}@f@wEtAcAJyA`@i@Bs@S[_@]{A]y@UW{BqI~EwABJ	4	29
2630	147.2	~yvhA|_cuMUHyCmVi@qFB}EYi@aEi@}YiMeAnB	4	34
2635	169.7	~yvhA|_cuMUH_CgRcAwJAiDJiBb@mCfB}FcDkA_CSNgCaBMUrE	4	39
2640	205.1	~yvhA|_cuMUHyCmVi@qFB}ESa@gEq@oU{JRo@^}DjGsOkBo@	4	44
2645	201.6	~yvhA|_cuMUHyCmVi@qFB}ESa@gEq@}YiMyCcAyAU}B?YgBhCOzC`@TAb@i@@P	4	49
2650	191.5	zzvhAlbbuMIuBF{BnBNEzBH~A~E_@TrCnAKrAhRgPbF	5	4
2655	137.6	zzvhAlbbuMIuBJwC^eC`@mAmBs@n@gBtLfEjBeFUKyA`E	5	11
2660	173.2	zzvhAlbbuMIuBJwC^eC`@mAmBs@n@gBtLfEfGkQLQxGfCtC~AFDCPNjC	5	15
2665	224.3	zzvhAlbbuMIuBF{BnBNEzBH~AqBNLrBcF^Yz@zCdVqD^DtAiDRa@wGx@k@l@kA_B_@	5	21
2670	197.9	zzvhAlbbuMIuBF{BnBNEzBH~AqBNLrBeF`@Wx@t@bG}RgCCiAk@qAw@o@oAUiAHa@Lq@f@_@n@Qp@Ct@Fh@	5	26
2675	254.6	zzvhAlbbuMIuBF{BnBNEzBH~AqBNLrBcF^Yz@zCdVqD^DtAiDR}KhDm@uBeCn@mA^l@tB	5	30
2680	251.8	zzvhAlbbuMAqFnBNBzE{In@GmH_@o@{Dc@}YiMyCcA{CY}EZxBxOd@CMaB~BU	5	35
2685	141.9	zzvhAlbbuMIuBF{BnBNEzBH~A{In@KoAB}EYi@WGaBKgAUsIwDl@_B	5	40
2690	272.5	zzvhAlbbuMIuBJwC`AsEmBs@x@}BsG}B_CSZoF[a@f@{AuCiA]{AmAJASgGaCHQqAg@cD_AyJmAh@oA`Bg@	5	45
2695	184.2	zzvhAlbbuMIuBJwC^eC`@mAmBs@x@}BsG}B_CSZoFCSWMdDwJlIxC	5	50
2700	29.9	vawhAd_buMHpAeF^?I	6	5
2705	122.4	vawhAd_buM@yALiAh@uB_IsCx@}BoBq@~B}GnBp@{@dC	6	9
2710	95.3	vawhAd_buMHpAjBOTrC`[cC@N	6	16
2715	95.6	vawhAd_buMHpAjBOTrCnAKVrCsRxA	6	20
2720	174.8	vawhAd_buMHpAoM~@GmH]m@}De@aPaHu@hBEdC_CEgBd@zBvH	6	27
2725	101.8	vawhAd_buMHpAoM~@KoAB}Ea@o@KrDNtD_BR	6	31
2730	194.1	vawhAd_buMHpAeF^LrBeF`@Wx@t@bG}RgCCiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	6	36
2735	141.4	vawhAd_buMHpAoM~@GmH]m@}De@oU{JRo@TeDPE	6	41
2740	206.2	vawhAd_buMHpAoM~@GmH_@o@{Dc@}YiMyCcA{CY{DTwCyPnCg@Ms@	6	46
2745	158.1	d_whApwauMQbAOrBH|C~E_@TrCnAKVrCfNcAp@zIZK	7	1
2750	43.8	d_whApwauM^uAjBn@i@tBMhAAxA	7	6
2755	104.6	d_whApwauM^uAsEcBn@gBhQnGl@LtAJhCKBP	7	12
2760	135.9	d_whApwauMQbAOrBH|C~E_@TrCnS}AC[wE\\AG	7	17
2765	137	d_whApwauMQbAOrBH|CqBNLrBcF^Yz@zCdVqD^DjA	7	22
2770	147.8	d_whApwauMQbAOrBH|CqBNLrBcF^Yz@t@bGkMaBYzAo@rAaAbAaAh@	7	24
2775	112.3	d_whApwauMQbAOrBH|C{In@KoAB}E]m@iD]qEqBi@lAAV	7	32
2780	105	d_whApwauM^uAsEcBx@}BmHeCb@kIDc@Vy@	7	37
2785	181.2	d_whApwauM^uAsEcBx@}BsG}B_CSNgC_EWDy@m@BS`@eCeAg@nAsAe@fAsC	7	42
2790	238.1	d_whApwauMa@vDH|C{In@GmH]m@}De@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	7	47
2795	130.5	lxvhAptauMrAaE~K~D}@pCY~A?tBXbEnAKl@jHjDW	8	2
2800	36.3	lxvhAptauMb@yArEbB_@tA	8	7
2805	112.4	lxvhAptauMrAaEhQnGl@LtAJhCKg@{HHc@t@uBHB	8	13
2810	85.1	lxvhAptauMq@lEAhDJ~AnRyA	8	18
2815	165.7	lxvhAptauMs@nFuBCDs@a@o@KrDNtDbCfSzA~KgPzEq@cC	8	23
2820	186.2	lxvhAptauMs@nFuBCDs@a@o@KrDNtDaBReHnBVrBI`Bm@vBgAvA}@l@s@VuBX{@?_AMcBk@aAzA_Cj@	8	28
2825	103.9	lxvhAptauMs@nFuBCDs@_@o@sBMgAUaPaHY`@[fAIrE	8	33
2830	89.2	lxvhAptauM|AwEsG}B_CSNgC_EWDo@	8	38
2835	122.8	lxvhAptauM|AwEsG}B_CSZoFCSWMf@{AuCiAUa@Gy@kAJ	8	43
2840	136.1	lxvhAptauMs@nFuBCDs@_@o@{Dc@}YiMyCcAyAU}B?m@uDPc@d@E	8	48
2845	139.5	pkwhAtcauMFBoApDdBn@kEdMY~A?tBXbEnAKVrCyGf@NlB	10	3
2850	89.5	pkwhAtcauMcBk@mEjMsE{A}AvE	10	8
2855	53.4	pkwhAtcauMFBoApDdBn@a@hAhC~@	10	14
2860	182.9	pkwhAtcauMFBt@yBvK`EtC~A`HvGl@`Ad@rAV~CEpAr@pJE`@MPeBT[NMd@FhAQf@ORqCjBgExAuDx@yMzDAK	10	19
2865	188.4	pkwhAtcauMgAtDdBn@}E|NG|CRdDwPlAYz@t@bG}RgCYqC	10	25
2870	271.4	pkwhAtcauMgAtDdBn@}E|NG|CRdDwPlAYz@t@bGkMaBYzAo@rAaAbAiAl@mB^yA@cDy@aAzAhArDjA_@BJ	10	29
2875	186.9	pkwhAtcauMcBk@mEjMeJ}CwAnEy@pEyDc@}YiMeAnB	10	34
2880	148.4	pkwhAtcauMcBk@mEjMgNyE_CSNgCaBMUrE	10	39
2885	176.6	pkwhAtcauMt@aBvBv@p@e@wa@cOgIwDwD_CW^dAn@eCpGOC	10	44
2526	216.5	lowhAbnbuMPAm@iIkYrBYz@t@bGkMaBYzAo@rAcClByA\\wAH}AOcBk@aAzA_Cj@	2	28
2527	203.7	lowhAbnbuMkDVd@|HvA_@PfDWPiS|GaYjIgDn@}@Eq@k@]{As@qA{BqI~EwABJ	2	29
2528	215.1	lowhAbnbuMkDVd@|HvA_@PfDWPiS|GaYjIgDn@}@Ek@c@qCsIrC{@`B|F	2	30
2529	146.3	lowhAbnbuMPAm@iIiYrBa@cEB}E_@o@MrDNtD_BR	2	31
2531	179.9	lowhAbnbuMPAm@iIiYrBa@cEB}E]m@}De@aPaHu@hBIrE	2	33
2532	186.5	lowhAbnbuMPAm@iIiYrBa@cEB}E]m@}De@}YiMeAnB	2	34
2533	263.3	lowhAbnbuMPAm@iIiYrBa@cEB}E]m@}De@}YiMyCcA{CY}EZxBxOd@CMaB~BU	2	35
2534	224.2	lowhAbnbuMPAm@iIkYrBYz@t@bG}RgCCiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	2	36
2536	189.9	lowhAbnbuMPAm@iIyF^Y}D@sAJo@vAuEkUcI_CSNgC_EWDo@	2	38
2537	199	lowhAbnbuMPAm@iIyF^Y}D@sAJo@vAuEkUcI_CSNgCaBMUrE	2	39
2538	153.4	lowhAbnbuMPAm@iIiYrBa@cEB}ESa@gEq@sIwDl@_B	2	40
2539	185.9	lowhAbnbuMPAm@iIiYrBa@cEB}EYi@aEi@oU{JRo@TeDPE	2	41
2541	223.5	lowhAbnbuMPAm@iIyF^Y}D@sAJo@vAuEkUcI_CSZoFCSWMf@{AuCiAUa@Gy@kAJ	2	43
2542	244.4	lowhAbnbuMPAm@iIiYrBa@cEB}E]m@}De@oU{JRo@^}DjGsOkBo@	2	44
2543	297	lowhAbnbuMPAm@iIiYrBa@cEB}E]m@}De@oU{JRo@^}DjGsOqE}A}KwAh@oA`Bg@	2	45
2544	250.7	lowhAbnbuMPAm@iIiYrBa@cEB}E]m@}De@}YiMyCcA{CY{DTwCyPnCg@Ms@	2	46
2546	212.1	lowhAbnbuMPAm@iIiYrBa@cEB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@d@E	2	48
2547	240.9	lowhAbnbuMPAm@iIiYrBa@cEB}E]m@}De@}YiMyCcAyAU}B?YgBhCOzC`@TAb@i@@P	2	49
2548	234.9	lowhAbnbuMPAm@iIyF^Y}D@sAJo@vAuEkUcI_CSZoFCSWMdDwJlIxC	2	50
2549	97.8	`awhAxnbuMOmB`WkBp@zIZK	3	1
2551	59.7	`awhAxnbuMz@jL}GvB	3	4
2552	82.4	`awhAxnbuMOmBgJr@w@gHhF_@?I	3	5
2553	106.8	`awhAxnbuMOmBgJr@w@gHnM_AIqA	3	6
2554	117.6	`awhAxnbuMOmBgJr@w@gHzIo@I}CNsBPcA	3	7
2556	170.5	`awhAxnbuMOmBgJr@cAwJAiDJiBb@mC|AgFhCsHnBp@nAqDtHjC	3	10
2557	146.8	`awhAxnbuMOmBvM_AWsDyF^Y}DD_BhAgEtB_GUKyA`E	3	11
2558	135.3	`awhAxnbuMOmBgJr@cAwJB}Eh@cE|AgFhCsHnBp@{@dC	3	9
2559	143.8	`awhAxnbuMOmBvM_AWsDyF^Y}D@sAJo@jA}D`EtAtAJhCKBP	3	12
2561	133.7	`awhAxnbuMOmBvM_AWsDyF^Y}D@sAJo@vAuE~AmErBr@	3	14
2562	156.5	`awhAxnbuMOmBvM_AUuC|R_BwA{RI@@H	3	15
2563	102.8	`awhAxnbuMOmBvM_AUuCpR}A@N	3	16
2564	106.1	`awhAxnbuMOmBvYuBYsDwE\\AG	3	17
2566	105.2	`awhAxnbuMz@jL`JkCPfD_FrAAK	3	19
2567	181.9	`awhAxnbuMz@jL{Ab@RbDE@kEpAUaCUOOAqD^DtAiDRa@wGx@k@l@kA_B_@	3	21
2568	35.8	`awhAxnbuMOmByIp@	3	20
2569	116.7	`awhAxnbuMz@jL{Ab@RbDqErAUaC_@QwD^DjA	3	22
2571	133.1	`awhAxnbuMOmBgJr@a@sD[z@t@bG}RgCCiA]aAFE	3	25
2572	165.7	`awhAxnbuMOmBgJr@a@sD[z@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	3	26
2573	182.1	`awhAxnbuMOmBgJr@cAwJB}E]m@}De@aPaHu@hBEdC_CEgBd@zBvH	3	27
2574	137.7	`awhAxnbuMOmBgJr@c@sDYz@t@bGkMaBYzAo@rAaAbAaAh@	3	24
2576	195.7	`awhAxnbuMz@jL{Ab@RbDiLhDeLnEwEtAgDn@}@Eq@k@]{As@qA{BqI~EwABJ	3	29
2577	199.7	`awhAxnbuMz@jL{Ab@RbDqWxHw@oCwDhAm@uBsEnAl@tB	3	30
2578	109.1	`awhAxnbuMOmBgJr@cAwJB}E_@o@MrDNtD_BR	3	31
2579	108.7	`awhAxnbuMOmBgJr@cAwJB}E]m@iD]qEqBi@lAAV	3	32
2581	149.3	`awhAxnbuMOmBgJr@cAwJB}E]m@}De@}YiMeAnB	3	34
2582	226.1	`awhAxnbuMOmBgJr@cAwJB}E_@o@{Dc@}YiMyCcA{CY}EZxBxOd@CMaB~BU	3	35
2583	194.9	`awhAxnbuMOmBgJr@a@sD[z@t@bG}RgCCiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	3	36
2584	151	`awhAxnbuMOmBgJr@cAwJAiDJiBb@mCfB}F}DsAb@kIDc@Vy@	3	37
2586	171.8	`awhAxnbuMOmBgJr@cAwJAiDJiBb@mCfB}FcDkA_CSNgCaBMUrE	3	39
2587	116.2	`awhAxnbuMOmBgJr@cAwJB}ESa@KMsBMgAUsIwDl@_B	3	40
2588	148.7	`awhAxnbuMOmBgJr@cAwJB}EYi@aEi@oU{JRo@TeDPE	3	41
2589	188.8	`awhAxnbuMOmBgJr@cAwJB}ESa@KMsBMgAUsIwDbCuGXaB_DID}@sAe@fAsC	3	42
2591	207.2	`awhAxnbuMOmBgJr@cAwJB}E]m@}De@oU{JRo@^}DjGsOkBo@	3	44
2592	259.8	`awhAxnbuMOmBgJr@cAwJB}E]m@}De@oU{JRo@^}DjGsOqE}A}KwAh@oA`Bg@	3	45
2593	213.5	`awhAxnbuMOmBgJr@cAwJB}E_@o@{Dc@}YiMyCcA{CY{DTwCyPnCg@Ms@	3	46
2594	234.5	`awhAxnbuMOmBgJr@cAwJB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	3	47
2596	203.7	`awhAxnbuMOmBgJr@cAwJB}E]m@}De@}YiMyCcAyAU}B?YgBhCOzC`@TAb@i@@P	3	49
2597	207.7	`awhAxnbuMOmBgJr@cAwJAiDJiBb@mCfB}FcDkA_CSZoFCSWMdDwJlIxC	3	50
2598	91.2	~yvhA|_cuM``@mL	4	1
2599	94.8	~yvhA|_cuM|UkH]oGQ@	4	2
2601	80.3	~yvhA|_cuMUHwDo[hF_@?I	4	5
2602	104.7	~yvhA|_cuMUHwDo[nM_AIqA	4	6
2603	115.5	~yvhA|_cuMUHwDo[zIo@I}CNsBPcA	4	7
2604	97	~yvhA|_cuMUH_CgRcAwJAiDtBBr@oF	4	8
2606	146.1	~yvhA|_cuMUH{C}VnQqA_@}ED_BhAgEtB_GUKyA`E	4	11
2607	133.2	~yvhA|_cuMUHyCmVi@qFAiDJiBb@mC|AgFhCsHnBp@{@dC	4	9
2608	143.1	~yvhA|_cuMUH{C}VnQqA_@}E@sAJo@jA}D`EtAtAJhCKBP	4	12
2609	174.1	~yvhA|_cuMUH{C}VnQqA_@}E@sAJo@vAuEzFsPLQvEjBs@pBHB	4	13
2611	181.7	~yvhA|_cuMUH{C}VnQqA_@}ELcCvIoWHKxGfCtC~ARbD	4	15
2612	134.7	~yvhA|_cuMUH{C}Vvl@qE@N	4	16
2613	145.2	~yvhA|_cuMUH{C}Vde@kDC[wE\\AG	4	17
2614	102.5	~yvhA|_cuMUH{C}VnQqAWsCnCS	4	18
2616	126.5	~yvhA|_cuMUHc@iDSGMNb@fDqD^DtAiDRa@wGx@k@l@kA_B_@	4	21
2617	39.4	~yvhA|_cuMUH_CgRLA	4	20
2618	61.3	~yvhA|_cuMUHc@iDSGMNb@fDqD^DjA	4	22
2619	91.9	~yvhA|_cuMUHc@iDSGMNfAdIgPzEq@cC	4	23
2621	116.6	~yvhA|_cuMUHsAyKo@aAaSgCCiAk@qAw@o@oAUiAHa@Lq@f@_@n@Qp@Ct@Fh@	4	26
2622	159.2	~yvhA|_cuMUHsAyKk@}@eSkC@e@QeA_@o@_@_@mAa@s@Co@HeEqNSHzBvH	4	27
2623	88.6	~yvhA|_cuMUHsAyKo@aAoMaBYzAo@rAaAbAaAh@	4	24
2624	138.1	~yvhA|_cuMUHsAyKk@}@sMeBYzAo@rAcClByA\\wAH}AOcBk@aAzA_Cj@	4	28
2626	156.8	~yvhA|_cuMUHc@iDSGMNb@fDqD^DtAiDR}KhDm@uBsEnAl@tB	4	30
2627	107	~yvhA|_cuMUH_CgRcAwJB}E_@o@MrDNtD_BR	4	31
2628	106.6	~yvhA|_cuMUHwDo[KoAB}E_@o@sBMs@MqEqBi@lAAV	4	32
2629	140.6	~yvhA|_cuMUHyCmVi@qFB}EYi@WGaBKgAUaPaHY`@[fAIrE	4	33
2631	204.1	~yvhA|_cuMUHsAyKk@}@eSkCCiA]aAaBkAmAIqAVq@f@k@fA?~BgI`Cm@oCm@eFoAwP~BU	4	35
2632	145.8	~yvhA|_cuMUHsAyKo@aAaSgCCiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	4	36
2633	148.9	~yvhA|_cuMUH_CgRcAwJAiDJiBb@mCfB}F}DsAb@kIDc@Vy@	4	37
2634	152.5	~yvhA|_cuMUHwDo[KoAB}E_@o@uCUiDuAp@}AyAq@\\aAl@cK	4	38
2636	114.1	~yvhA|_cuMUHwDo[KoAB}E_@o@sBMs@MgJ_El@_B	4	40
2637	146.6	~yvhA|_cuMUHyCmVi@qFB}EQ]MQsBMgAUoU{JRo@TeDBKLD	4	41
2638	186.7	~yvhA|_cuMUHwDo[KoAB}E_@o@sBMs@MgJ_EbCuGXaB_DID}@sAe@fAsC	4	42
2639	185.8	~yvhA|_cuMUHwDo[GmH_@o@gD[gJ_EbCuGl@sDeCeApBaFf@k@	4	43
2641	257.7	~yvhA|_cuMUHwDo[GmH_@o@{Dc@oU{JRo@^}DjGsOqE}A}KwAh@oA`Bg@	4	45
2642	211.4	~yvhA|_cuMUHyCmVi@qFB}EYi@aEi@}YiMyCcA{CY{DTwCyPnCg@Ms@	4	46
2643	232.4	~yvhA|_cuMUHyCmVi@qFB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	4	47
2644	172.8	~yvhA|_cuMUHyCmVi@qFB}EYi@aEi@}YiMyCcAyAU}B?m@uDPc@d@E	4	48
2646	205.6	~yvhA|_cuMUHcE_^HsGb@mCfB}FcDkA_CSZoF[a@dDwJlIxC	4	50
2647	180.2	zzvhAlbbuMIuBF{BnBNEzBH~A~E_@TrCnAKVrCfNcAp@zIZK	5	1
2648	136.9	zzvhAlbbuMIuBF{BnBNEzBH~A~E_@TrCnAKl@jHjDW	5	2
2649	139.9	zzvhAlbbuMIuBF{BnBNEzBH~A~E_@TrCnAKVrCyGf@NlB	5	3
2651	75.9	zzvhAlbbuMIuBF{BnBNEzBH~ArBOIqA	5	6
2652	45	zzvhAlbbuMIuBF{BnBNZyB	5	7
2653	65.3	zzvhAlbbuMIuBJwC^eC`@mAmBs@c@xA	5	8
2654	137.4	zzvhAlbbuMIuBJwC^eC`@mAmBs@n@gBpE`BxEgNbBj@	5	10
2656	119.8	zzvhAlbbuMIuBJwC^eC`@mAmBs@x@}BoBq@~B}GnBp@{@dC	5	9
2657	127.1	zzvhAlbbuMIuBJwC^eC`@mAmBs@n@gBhQnGl@LtAJhCKBP	5	12
2658	162.4	zzvhAlbbuMIuBJwC^eC`@mAmBs@n@gBhQnGl@LtAJhCKg@{HHc@t@uBHB	5	13
2659	124.5	zzvhAlbbuMIuBJwC^eC`@mAmBs@n@gBtLfEjBeFrBr@	5	14
2661	147.5	zzvhAlbbuMIuBF{BnBNEzBH~A~E_@TrC`[cC@N	5	16
2662	158	zzvhAlbbuMIuBF{BnBNEzBH~A~E_@TrCnS}AC[wE\\AG	5	17
2663	86.5	zzvhAlbbuMIuBF{BnBNEzBH~AfKw@	5	18
2664	191.2	zzvhAlbbuMIuBF{BnBNEzBH~A~E_@TrCnAKrAhRvA_@PfD_FrAAK	5	19
2666	131	zzvhAlbbuMIuBF{BnBNEzBH~AqBNLrBcF^Yz@~@nHXs@[cCLA	5	20
2667	159.1	zzvhAlbbuMIuBF{BnBNEzBH~AqBNLrBcF^Yz@zCdVqD^DjA	5	22
2668	189.7	zzvhAlbbuMIuBF{BnBNEzBH~AqBNLrBcF^Yz@~Db[gPzEq@cC	5	23
2669	165.3	zzvhAlbbuMIuBF{BnBNEzBH~AqBNLrBeF`@Wx@t@bG}RgCCiA]aAFE	5	25
2671	207.8	zzvhAlbbuMAqFnBNBzE{In@GmH]m@}De@aPaHu@hBEdC_CEgBd@zBvH	5	27
2672	169.9	zzvhAlbbuMIuBF{BnBNEzBH~AqBNLrBeF`@Wx@t@bGkMaBYzAo@rAaAbAaAh@	5	24
2673	219.4	zzvhAlbbuMAqFnBNBzEqBNLrBeF`@Wx@t@bGkMaBYzAo@rAcClByA\\wAH}AOcBk@aAzA_Cj@	5	28
2674	248.3	zzvhAlbbuMAqFnBNBzEqBNLrBeF`@Wx@t@bGkMaBYzAo@rAaAbAiAl@mB^yA@cDy@aAzAhArDjA_@BJ	5	29
2676	134.8	zzvhAlbbuMIuBF{BnBNEzBH~A{In@KoAB}Ea@o@KrDNtD_BR	5	31
2677	134.4	zzvhAlbbuMIuBF{BnBNEzBH~A{In@KoAB}E]m@iD]qEqBi@lAAV	5	32
2678	168.4	zzvhAlbbuMIuBF{BnBNEzBH~A{In@KoAB}E]m@uBOgAUaPaHY`@[fAIrE	5	33
2679	175	zzvhAlbbuMAqFnBNBzE{In@GmH]m@}De@}YiMeAnB	5	34
2681	227.1	zzvhAlbbuMAqFnBNBzEqBNLrBeF`@Wx@t@bG}RgCCiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	5	36
2682	127.5	zzvhAlbbuMIuBJwC^eC`@mAmBs@x@}BmHeCb@kIDc@Vy@	5	37
2683	139.2	zzvhAlbbuMIuBJwC^eC`@mAmBs@x@}BsG}B_CSNgC_EWDo@	5	38
2684	148.3	zzvhAlbbuMIuBJwC^eC`@mAmBs@x@}BsG}B_CSNgCaBMUrE	5	39
2686	174.4	zzvhAlbbuMIuBF{BnBNEzBH~A{In@KoAB}E]m@uBOgAUoU{JRo@TeDBKLD	5	41
2687	203.7	zzvhAlbbuMIuBJwC^eC`@mAmBs@x@}BsG}B_CSNgC_EWDy@m@BS`@eCeAg@nAsAe@fAsC	5	42
2688	172.8	zzvhAlbbuMIuBJwC^eC`@mAmBs@x@}BsG}B_CSZoFCSWMf@{AuCiAUa@Gy@kAJ	5	43
2689	219.9	zzvhAlbbuMIuBJwC^eC`@mAmBs@x@}BsG}B_CSZoFCSWMf@{AuCiAUa@Gy@mAJASgGaCHQkBo@	5	44
2691	239.2	zzvhAlbbuMAqFnBNBzE{In@GmH_@o@{Dc@}YiMyCcA{CY{DTwCyPnCg@Ms@	5	46
2692	260.2	zzvhAlbbuMAqFnBNBzE{In@GmH]m@}De@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	5	47
2693	200.6	zzvhAlbbuMAqFnBNBzE{In@GmH]m@}De@}YiMyCcAyAU}B?m@uDPc@d@E	5	48
2694	229.4	zzvhAlbbuMAqFnBNBzE{In@GmH]m@}De@}YiMyCcAyAU}B?YgBhCOzC`@TAb@i@@P	5	49
2696	128	vawhAd_buMHpAjBOTrCnAKVrCfNcAp@zIZK	6	1
2697	84.7	vawhAd_buMHpAjBOTrCnAKl@jHjDW	6	2
2698	87.7	vawhAd_buMHpAjBOTrCnAKVrCyGf@NlB	6	3
2699	139.3	vawhAd_buMHpAjBOTrCnAKrAhRgPbF	6	4
2701	47.2	vawhAd_buMHpAsBNI}CNsBPcA	6	7
2702	67.9	vawhAd_buM@yALiAh@uB_IsCc@xA	6	8
2703	124.5	vawhAd_buMHpAbCSGiAD_B~AyFcFiBlEkMbBj@	6	10
2704	85.5	vawhAd_buMHpAbCSGuBLwAvAuE~AmEUKyA`E	6	11
2706	82.5	vawhAd_buMHpAbCSGiA@sAJo@jA}D`EtAtAJhCKBP	6	12
2707	113.5	vawhAd_buMHpAbCSGuBLwAvAuEzFsPLQvEjBs@pBHB	6	13
2708	72.4	vawhAd_buMHpAbCSGuBLwAvAuE~AmErBr@	6	14
2709	121.1	vawhAd_buMHpAbCSGuBLwAvAuEzFsPLQxGfCtC~AFDCPNjC	6	15
2711	105.8	vawhAd_buMHpAjBOTrCnS}AC[wE\\AG	6	17
2712	34.3	vawhAd_buMHpArGg@	6	18
2713	139	vawhAd_buMHpAjBOTrCnAKrAhRvA_@PfD_FrAAK	6	19
2714	191.3	vawhAd_buMHpAeF^LrBcF^Yz@zCdVqD^DtAiDRa@wGx@k@l@kA_B_@	6	21
2716	126.1	vawhAd_buMHpAeF^LrBcF^Yz@zCdVqD^DjA	6	22
2717	156.7	vawhAd_buMHpAeF^LrBcF^Yz@~Db[gPzEq@cC	6	23
2718	132.3	vawhAd_buMHpAeF^LrBeF`@Wx@t@bG}RgCCiA]aAFE	6	25
2719	164.9	vawhAd_buMHpAeF^LrBeF`@Wx@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	6	26
2721	136.9	vawhAd_buMHpAeF^LrBeF`@Wx@t@bGkMaBYzAo@rAaAbAaAh@	6	24
2722	186.4	vawhAd_buMHpAeF^LrBeF`@Wx@t@bGkMaBYzAo@rAcClByA\\wAH}AOcBk@aAzA_Cj@	6	28
2723	215.3	vawhAd_buMHpAeF^LrBeF`@Wx@t@bGkMaBYzAo@rAaAbAiAl@mB^yA@cDy@aAzAhArDjA_@BJ	6	29
2724	221.6	vawhAd_buMHpAeF^LrBcF^Yz@zCdVqD^DtAiDR}KhDm@uBeCn@mA^l@tB	6	30
2726	101.4	vawhAd_buMHpAoM~@KoAB}E]m@iD]qEqBi@lAAV	6	32
2727	135.4	vawhAd_buMHpAoM~@KoAB}E]m@uBOgAUaPaHY`@[fAIrE	6	33
2728	142	vawhAd_buMHpAoM~@GmH]m@}De@}YiMeAnB	6	34
2729	218.8	vawhAd_buMHpAoM~@GmH_@o@{Dc@}YiMyCcA{CY}EZxBxOd@CMaB~BU	6	35
2731	130.1	vawhAd_buM@yALiAh@uB_IsCx@}BmHeCb@kIDc@Vy@	6	37
2732	141.8	vawhAd_buM@yALiAh@uB_IsCx@}BsG}B_CSNgC_EWDo@	6	38
2733	150.9	vawhAd_buM@yALiAh@uB_IsCx@}BsG}B_CSNgCaBMUrE	6	39
2734	108.9	vawhAd_buMHpAoM~@KoAB}EYi@WGaBKgAUsIwDl@_B	6	40
2736	181.5	vawhAd_buMHpAoM~@KoAB}E]m@iD]gJ_EbCuGXaB_DID}@sAe@fAsC	6	42
2737	175.4	vawhAd_buM@yALiAh@uB_IsCx@}BsG}B_CSZoFCSWMf@{AuCiAUa@Gy@kAJ	6	43
2738	199.9	vawhAd_buMHpAoM~@GmH]m@}De@oU{JRo@^}DjGsOkBo@	6	44
2739	252.5	vawhAd_buMHpAoM~@GmH]m@}De@oU{JRo@^}DjGsOqE}A}KwAh@oA`Bg@	6	45
2741	227.2	vawhAd_buMHpAoM~@GmH]m@}De@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	6	47
2742	167.6	vawhAd_buMHpAoM~@GmH]m@}De@}YiMyCcAyAU}B?m@uDPc@d@E	6	48
2743	196.4	vawhAd_buMHpAoM~@GmH]m@}De@}YiMyCcAyAU}B?YgBhCOzC`@TAb@i@@P	6	49
2744	186.8	vawhAd_buM@yALiAh@uB_IsCx@}BsG}B_CSZoFCSWMdDwJlIxC	6	50
2746	114.8	d_whApwauMQbAOrBH|C~E_@TrCnAKl@jHjDW	7	2
2747	117.8	d_whApwauMQbAOrBH|C~E_@TrCnAKVrCyGf@NlB	7	3
2748	169.4	d_whApwauMQbAOrBH|C~E_@TrCnAKrAhRgPbF	7	4
2749	40.8	d_whApwauMQbAOrBH|CqBN?I	7	5
2751	42.8	d_whApwauM^uAsEcBc@xA	7	8
2752	114.9	d_whApwauM^uAsEcBn@gBpE`BxEgNbBj@	7	10
2753	115.1	d_whApwauM^uAsEcBn@gBtLfEjBeFUKyA`E	7	11
2754	97.3	d_whApwauM^uAsEcBx@}BoBq@~B}GnBp@{@dC	7	9
2756	139.9	d_whApwauM^uAsEcBn@gBhQnGl@LtAJhCKg@{HHc@t@uBHB	7	13
2757	102	d_whApwauM^uAsEcBn@gBtLfEjBeFrBr@	7	14
2758	150.7	d_whApwauM^uAsEcBn@gBtLfEfGkQLQxGfCtC~AFDCPNjC	7	15
2759	125.4	d_whApwauMQbAOrBH|C~E_@TrC`[cC@N	7	16
2761	64.4	d_whApwauMQbAOrBH|CfKw@	7	18
2762	169.1	d_whApwauMQbAOrBH|C~E_@TrCnAKrAhRvA_@PfD_FrAAK	7	19
2763	202.2	d_whApwauMQbAOrBH|CqBNLrBcF^Yz@zCdVqD^DtAiDRa@wGx@k@l@kA_B_@	7	21
2764	108.9	d_whApwauMQbAOrBH|CqBNLrBcF^Yz@~@nHXs@[cCLA	7	20
2766	167.6	d_whApwauMQbAOrBH|CqBNLrBcF^Yz@~Db[gPzEq@cC	7	23
2767	143.2	d_whApwauMQbAOrBH|CqBNLrBcF^Yz@t@bG}RgCCiA]aAFE	7	25
2768	175.8	d_whApwauMa@vDH|CqBNLrBcF^Yz@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	7	26
2769	185.7	d_whApwauMa@vDH|C{In@GmH]m@}De@aPaHu@hBEdC_CEgBd@zBvH	7	27
2771	197.3	d_whApwauMa@vDH|CqBNLrBcF^Yz@t@bGkMaBYzAo@rAcClByA\\wAH}AOcBk@aAzA_Cj@	7	28
2772	226.2	d_whApwauMa@vDH|CqBNLrBcF^Yz@t@bGkMaBYzAo@rAaAbAiAl@mB^yA@cDy@aAzAhArDjA_@BJ	7	29
2773	232.5	d_whApwauMQbAOrBH|CqBNLrBcF^Yz@zCdVqD^DtAiDR}KhDm@uBeCn@mA^l@tB	7	30
2774	112.7	d_whApwauMQbAOrBH|C{In@KoAB}Ea@o@KrDNtD_BR	7	31
2776	146.3	d_whApwauMQbAOrBH|C{In@KoAB}E]m@uBOgAUaPaHY`@[fAIrE	7	33
2777	152.9	d_whApwauMa@vDH|C{In@GmH]m@}De@}YiMeAnB	7	34
2778	229.7	d_whApwauMa@vDH|C{In@GmH_@o@{Dc@}YiMyCcA{CY}EZxBxOd@CMaB~BU	7	35
2779	205	d_whApwauMa@vDH|CqBNLrBcF^Yz@t@bG}RgCCiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	7	36
2781	116.7	d_whApwauM^uAsEcBx@}BsG}B_CSNgC_EWDo@	7	38
2782	125.8	d_whApwauM^uAsEcBx@}BsG}B_CSNgCaBMUrE	7	39
2783	119.8	d_whApwauMQbAOrBH|C{In@KoAB}EYi@WGaBKgAUsIwDl@_B	7	40
2784	152.3	d_whApwauMQbAOrBH|C{In@KoAB}E]m@uBOgAUoU{JRo@TeDBKLD	7	41
2786	150.3	d_whApwauM^uAsEcBx@}BsG}B_CSZoFCSWMf@{AuCiAUa@Gy@kAJ	7	43
2787	197.4	d_whApwauM^uAsEcBx@}BsG}B_CSZoFCSWMf@{AuCiAUa@Gy@mAJASgGaCHQkBo@	7	44
2788	250	d_whApwauM^uAsEcBx@}BsG}B_CSZoF[a@f@{AuCiA]{AmAJASgGaCHQqAg@cD_AyJmAh@oA`Bg@	7	45
2789	217.1	d_whApwauMa@vDH|C{In@GmH_@o@{Dc@}YiMyCcA{CY{DTwCyPnCg@Ms@	7	46
2791	178.5	d_whApwauMa@vDH|C{In@GmH]m@}De@}YiMyCcAyAU}B?m@uDPc@d@E	7	48
2792	207.3	d_whApwauMa@vDH|C{In@GmH]m@}De@}YiMyCcAyAU}B?YgBhCOzC`@TAb@i@@P	7	49
2793	161.7	d_whApwauM^uAsEcBx@}BsG}B_CSZoFCSWMdDwJlIxC	7	50
2794	173.8	lxvhAptauMrAaE~K~D}@pCY~A?tBXbEnAKVrCfNcAp@zIZK	8	1
2796	118.7	lxvhAptauMs@nFuBCDs@a@o@KrB@fC^bEl@n@lGe@PtCdBMNlB	8	3
2797	168.1	lxvhAptauMs@nFuBCDs@a@o@KrB@fC^bEj@n@nGe@PtCcBLrB~P{Bt@	8	4
2798	50.1	lxvhAptauMq@lEAhDJ~AtBQ?I	8	5
2799	61.3	lxvhAptauMb@yA~HrCi@tBMhAAxA	8	6
2801	87.4	lxvhAptauMrAaEpE`BxEgNbBj@	8	10
2802	87.6	lxvhAptauMrAaEtLfEjBeFUKyA`E	8	11
2803	69.4	lxvhAptauMEVsBc@|AgFhCsHnBp@{@dC	8	9
2804	77.1	lxvhAptauMrAaEhQnGl@LtAJhCKBP	8	12
2806	74.5	lxvhAptauMrAaEtLfEjBeFrBr@	8	14
2807	123.2	lxvhAptauMrAaEtLfEfGkQLQxGfCtC~AFDCPNjC	8	15
2808	122.2	lxvhAptauMrAaEvR|GxBJ|L{@t@hK	8	16
2809	151.6	lxvhAptauMrAaE~K~D}@pCY~A?tBXbEnS}AC[wE\\AG	8	17
2811	184.8	lxvhAptauMrAaE~K~D}@pCY~A?tBXbEnAKrAhRvA_@PfD_FrAAK	8	19
2812	197.2	lxvhAptauMs@nFuBCDs@a@o@KrDNtDaBReHnBTxACfBYzA}@dBvBnHhDcAz@y@Zu@_B_@	8	21
2813	107	lxvhAptauMs@nFuBCDs@_@o@EVGzCFzBfBlOXs@[cCLA	8	20
2814	135.1	lxvhAptauMs@nFuBCDs@_@o@EVGzCNtDzDh[qD^DjA	8	22
2816	140.1	lxvhAptauMs@nFuBCDs@a@o@KrDNtDaBReHnBTxACfBqDe@CiA]aAFE	8	25
2817	172.7	lxvhAptauMs@nFuBCDs@a@o@KrDNtDaBReHnBTxACfBqDe@CiAk@qAw@o@oAUiAHa@Lq@f@_@n@Qp@Ct@Fh@	8	26
2818	143.3	lxvhAptauMs@nFuBCDs@_@o@sBMgAUaPaHY`@[fAEdC_CEgBd@zBvH	8	27
2819	136.7	lxvhAptauMs@nFuBCDs@a@o@KrDNtDaBReHnBNz@FpAIfAUfA]x@o@|@eBhA	8	24
2821	215.1	lxvhAptauMs@nFuBCDs@a@o@KrDNtDaBReHnBVrBI`Bm@vBgAvA}@l@s@VuBX{@?_AMcBk@aAzAhArDjA_@BJ	8	29
2822	227.8	lxvhAptauMs@nFuBCDs@a@o@KrDNtDaBReHnBTxACfBYzAo@rAaAbAiAl@mB^yA@lD|LsEnAl@tB	8	30
2823	70.3	lxvhAptauMs@nFuBCDs@a@o@KrDNtD_BR	8	31
2824	69.9	lxvhAptauMs@nFuBCDs@_@o@sBMs@MqEqBi@lAAV	8	32
2826	110.5	lxvhAptauMs@nFuBCDs@_@o@sBMgAUiYyLSOi@|@Sr@GA	8	34
2827	187.3	lxvhAptauMs@nFuBCDs@_@o@{Dc@}YiMyCcA{CY}EZxBxOd@CMaB~BU	8	35
2828	171.8	lxvhAptauMs@nFuBCDs@_@o@{Dc@aPaHu@hBEdC_CEgBd@u@d@yBhN	8	36
2829	77.5	lxvhAptauM|AwEmHeCb@kIDc@Vy@	8	37
2831	98.3	lxvhAptauM|AwEsG}B_CSNgCaBMUrE	8	39
2832	77.4	lxvhAptauMs@nFuBCDs@]m@iD]gJ_El@_B	8	40
2833	109.9	lxvhAptauMs@nFuBCDs@_@o@sBMgAUoU{JRo@TeDBKLD	8	41
2834	150	lxvhAptauMs@nFuBCDs@]m@iD]gJ_EbCuGXaB_DID}@sAe@fAsC	8	42
2836	168.4	lxvhAptauMs@nFuBCDs@_@o@sBMgAUoU{JRo@NgCNu@jGsOkBo@	8	44
2837	221	lxvhAptauMs@nFuBCDs@_@o@{Dc@oU{JRo@^}DjGsOqE}A}KwAh@oA`Bg@	8	45
2838	174.7	lxvhAptauMs@nFuBCDs@_@o@{Dc@}YiMyCcA{CY{DTwCyPnCg@Ms@	8	46
2839	195.7	lxvhAptauMs@nFuBCDs@_@o@{Dc@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	8	47
2841	164.9	lxvhAptauMs@nFuBCDs@_@o@{Dc@}YiMyCcAyAU}B?YgBhCOzC`@TAb@i@@P	8	49
2842	134.2	lxvhAptauM|AwEsG}B_CSZoFCSWMdDwJlIxC	8	50
2843	179	pkwhAtcauMFBt@yBvK`E`Bx@~BhBtErEl@`Ad@rAV~CEpAr@pJIf@OL_BR[NMd@FhAQf@ORqCjBgExAuDx@UcDjDeA	10	1
2844	136.5	pkwhAtcauMFBoApDdBn@kEdMY~A?tBXbEnAKl@jHjDW	10	2
2846	191.1	pkwhAtcauMFBoApDdBn@kEdMY~AAr@@`AXbEnAKrAhRgPbF	10	4
2847	106.4	pkwhAtcauMFBoApDdBn@kEdMY~ABdDqIn@?I	10	5
2848	92.7	pkwhAtcauMFBoApDdBn@qC|HkA~DiBWMhAAxA	10	6
2849	114	pkwhAtcauMFBoApDdBn@qC|HkA~DiBWh@uBkBo@_@tA	10	7
2851	49.3	pkwhAtcauMFBoApDdBn@{BjG	10	11
2852	53.3	pkwhAtcauMuHkCkCvH	10	9
2853	80.2	pkwhAtcauMFBt@yBtIdDqB`Gh@vI	10	12
2854	55.2	pkwhAtcauMFBt@yBtIdDs@pBHB	10	13
2856	62.8	pkwhAtcauMFBt@yBvK`E|CdBCPNjC	10	15
2857	102.6	pkwhAtcauMFBt@yBvK`E|CdBCPL`CvAjS	10	16
2858	134	pkwhAtcauMFBt@yBvK`E|CdBCPL`CrAbRkM~@AG	10	17
2859	93.6	pkwhAtcauMFBoApDdBn@kEdMY~AAr@DpBfDW	10	18
2861	247.4	pkwhAtcauMFBoApDdBn@qC|HkA~DGf@?tBRdDuPlA[z@zCdVqD^DtAiDRa@wGx@k@l@kA_B_@	10	21
2862	147.4	pkwhAtcauMFBoApDdBn@kEdMY~A?tBXbEnAKVrCsRxA	10	20
2863	182.2	pkwhAtcauMFBoApDdBn@qC|HkA~DGf@?tBRdDuPlA[z@zCdVqD^DjA	10	22
2864	212.8	pkwhAtcauMgAtDdBn@}E|NG|CRdDuPlA[z@~Db[gPzEq@cC	10	23
2866	221	pkwhAtcauMgAtDdBn@}E|NG|CRdDwPlAYz@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	10	26
2867	219.7	pkwhAtcauMcBk@mEjMeJ}CwAnEy@pEyDc@aPaHu@hBEdC_CEgBd@zBvH	10	27
2868	193	pkwhAtcauMgAtDdBn@}E|NG|CRdDwPlAYz@t@bGkMaBYzAo@rAcClB	10	24
2869	242.5	pkwhAtcauMgAtDdBn@}E|NG|CRdDwPlAYz@t@bGkMaBYzAo@rAcClByA\\wAH}AOcBk@aAzA_Cj@	10	28
2871	277.7	pkwhAtcauMgAtDdBn@}E|NG|CRdDuPlA[z@zCdVqD^DtAiDR}KhDm@uBeCn@mA^l@tB	10	30
2872	138.3	pkwhAtcauMcBk@mEjMeJ}CwAnEw@`EMbENtD_BR	10	31
2873	146.3	pkwhAtcauMcBk@mEjMeJ}CwAnEy@pEqBMs@MqEqBi@lAAV	10	32
2874	180.3	pkwhAtcauMcBk@mEjMeJ}CwAnEy@pEyDc@aPaHu@hBIrE	10	33
2876	263.7	pkwhAtcauMcBk@mEjMeJ}CwAnEy@pEyDc@}YiMyCcA{CY}EZxBxOd@CMaB~BU	10	35
2877	248.2	pkwhAtcauMcBk@mEjMeJ}CwAnEy@pEyDc@aPaHu@hBEdC_CEgBd@u@d@yBhN	10	36
2878	127.6	pkwhAtcauMcBk@mEjMaOaFb@kIDc@Vy@	10	37
2879	139.3	pkwhAtcauMcBk@mEjMgNyE_CSNgC_EWDo@	10	38
2881	153.8	pkwhAtcauMcBk@mEjMeJ}CwAnEy@pEqBMs@MgJ_El@_B	10	40
2882	186.3	pkwhAtcauMcBk@mEjMeJ}CwAnEy@pEyDc@oU{JRo@TeDPE	10	41
2883	203.8	pkwhAtcauMcBk@mEjMgNyE_CSNgC_EWDy@m@BS`@eCeAg@nAsAe@fAsC	10	42
2884	172.9	pkwhAtcauMcBk@mEjMgNyE_CSZoFCSWMf@{AuCiAUa@Gy@kAJ	10	43
2886	229.2	pkwhAtcauMt@aBvBv@p@e@wa@cOgIwDwD_CW^dAn@eCpGyC{@yJmAh@oA`Bg@	10	45
2887	251.1	pkwhAtcauMcBk@mEjMeJ}CwAnEy@pEaCQo`@_P{CY{DTwCyPnCg@Ms@	10	46
2888	222.2	pkwhAtcauMt@aBvBv@p@e@wa@cOgIwDwD_CW^dAn@eCpGeCu@_Fo@_@rE	10	47
2889	212.5	pkwhAtcauMcBk@mEjMeJ}CwAnEy@pEyDc@}YiMyCcAyAU}B?m@uDPc@d@E	10	48
2891	184.3	pkwhAtcauMcBk@mEjMgNyE_CSZoFCSWMdDwJlIxC	10	50
2890	228.8	pkwhAtcauMt@aBvBv@p@e@wa@cOgIwDwD_CW^dAn@uLpZ_Bm@K[	10	49
2895	141.8	rhwhAfsauMoAxDQv@Gf@?tBXbEnAKrAhRgPbF	11	4
2900	71.5	rhwhAfsauMELmE_BlEkMbBj@	11	10
2905	87.5	rhwhAfsauMQf@TFfGkQLQxGfCtC~AFDCPNjC	11	15
2910	198.1	rhwhAfsauMoAxDY~A?tBRdDuPlA[z@zCdVqD^DtAiDRa@wGx@k@l@kA_B_@	11	21
2915	171.7	rhwhAfsauMiBxGRzGwPlAYz@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	11	26
2920	228.4	rhwhAfsauMiBxGRzGuPlA[z@zCdVqD^DtAiDR}KhDm@uBeCn@mA^l@tB	11	30
2925	227.1	rhwhAfsauMELsP}FwAnEy@pEqBMsA[qYcMyCcA{CY}EZxBxOd@CMaB~BU	11	35
2930	117.2	rhwhAfsauMELsP}FwAnEy@pEqBMs@MgJ_El@_B	11	40
2935	236	rhwhAfsauMELuTyH_CSZoF[a@f@{AuCiA]{AmAJASgGaCHQqAg@cD_AyJmAh@oA`Bg@	11	45
2940	147.7	rhwhAfsauMELuTyH_CSZoFCSWMdDwJlIxC	11	50
2945	147.5	n}vhA`iauMzD_L~K`EgI|UY~ABdDqIn@?I	9	5
2950	90.4	n}vhA`iauMzD_L~K`EwFbP	9	11
2955	140.4	n}vhA`iauMzD_LhTzHfChAbAp@dBlW	9	16
2960	183.5	n}vhA`iauMz@eCoBq@zC{I[KuD|JcDtJm@tBi@|CMbCFzDfBlOXs@[cCLA	9	20
2965	228.2	n}vhA`iauMz@eCoBq@zC{I[KyIrVyAbHyDc@aPaHu@hBEdC_CEgBd@zBvH	9	27
2970	146.8	n}vhA`iauMz@eCoBq@zC{I[KyFvOmCpIo@dEGzCNtD_BR	9	31
2975	256.7	n}vhA`iauMz@eCoBq@zC{I[KyIrVyAbHyDc@aPaHu@hBEdC_CEgBd@u@d@yBhN	9	36
2980	194.8	n}vhA`iauMz@eCoBq@zC{I[KyIrVyAbHyDc@oU{JRo@TeDPE	9	41
2985	251.8	n}vhA`iauMz@eCoBq@tCmIwOyFsMoGs@u@IqBi@g@cDi@c@Te@~@g@RaYpBgAh@KTpB|Kd@?Cg@nCg@Ms@	9	46
2990	131.4	|uwhA~wauMCQvIo@pArPiDX[SYAoBHp@zIZK	12	1
2995	83.8	|uwhA~wauMEi@sBLaBMwA_@{B_AiAjDQv@iBWMhAAxA	12	6
3000	116.1	|uwhA~wauMEi@sBLaBMw@Q}F}BoL}D~B}GnBp@{@dC	12	9
3005	82.6	|uwhA~wauMCQvIo@p@`JkM~@AG	12	17
3010	173.3	|uwhA~wauMEi@sBLaBMwA_@{B_AiAjDY~A?tBRdDwPlAYz@zCdVqD^DjA	12	22
3015	184.1	|uwhA~wauMEi@sBLaBMsE_BcBjGRzGwPlAYz@t@bGkMaBYzAo@rAcClB	12	24
3020	142.5	|uwhA~wauMEi@sBLyC_@oUkIwAnEy@pEeD[qEqBk@dB	12	32
3025	123.8	|uwhA~wauMEi@sBLaBMw@QcG_CgRoGb@kIDc@Vy@	12	37
3030	200	|uwhA~wauMEi@sBLyC_@qYgK_CSNgC_EWDy@m@BS`@eCeAg@nAsAe@fAsC	12	42
3035	255.4	|uwhA~wauMg@eJnBsFbAZNW_j@gSgIwDwD_CW^dAn@eCpGeCu@_Fo@_@rE	12	47
3040	156.5	zvwhAzhauMICu@tBIb@d@bHsBLaBMwA_@{B_AiAjDY~A?tBXbEnAKl@jHjDW	13	2
3045	134	zvwhAzhauMICu@tBIb@d@bHsBLaBMwA_@{B_AiAjDQv@iBWh@uBkBo@_@tA	13	7
3050	36.9	zvwhAzhauMICu@tBIb@j@lI	13	12
3055	93.3	zvwhAzhauMICu@tBIb@v@dLmBLLbCsGd@	13	18
3060	232.6	zvwhAzhauMICr@qB`AZtC~AxHtHz@vBdAbRKj@iCl@Md@FhAa@z@qCjBgExAuDx@gm@lQq@cC	13	23
3065	262.5	zvwhAzhauMIC_AxCd@bHsBLaBMsE_BcBjGRzGwPlAYz@t@bGkMaBYzAo@rAcClByA\\wAH}AOcBk@aAzA_Cj@	13	28
3070	205.4	zvwhAzhauMIC_AxCd@bHsBLyC_@oUkIwAnEy@pEyDc@aPaHu@hBIrE	13	33
3075	164.4	zvwhAzhauMIC_AxCd@bHqDFkBa@aY_K_CSNgC_EWDo@	13	38
3080	181.7	zvwhAzhauMICr@qBbAZNWmh@mRiIsDOZdCnA_@~AR~DkAJ	13	43
3085	237.6	zvwhAzhauMIC_AxCd@bHsBLyC_@oUkIwAnEy@pEyDc@}YiMyCcAyAU}B?m@uDPc@d@E	13	48
3090	115.6	vowhAdoauMiC_AsChIg@hBGf@?tBXbEnAKVrCyGf@NlB	14	3
3095	78.3	vowhAdoauMiC_A_BnEaL{D}AvE	14	8
3100	60.8	vowhAdoauMsBs@zCeJLQvEjBs@pBHB	14	13
3105	166.9	vowhAdoauMiC_AiDzJY~A?tBXbEnAKrAhRvA_@PfD_FrAAK	14	19
3110	164.5	vowhAdoauMiC_AyA`EiBxGRzGwPlAYz@t@bG}RgCYqC	14	25
3115	247.5	vowhAdoauMiC_AyA`EiBxGRzGwPlAYz@t@bGkMaBYzAo@rAaAbAiAl@mB^yA@cDy@aAzAhArDjA_@BJ	14	29
3120	175.7	vowhAdoauMiC_A_BnEsP}FwAnEy@pEyDc@}YiMeAnB	14	34
3125	137.2	vowhAdoauMiC_A_BnEuTyH_CSNgCaBMUrE	14	39
3130	177.3	vowhAdoauMsBs@zCeJp@e@wa@cOgIwDwD_CW^dAn@eCpGOC	14	44
3135	229.5	vowhAdoauMsBs@zCeJp@e@wa@cOgIwDwD_CW^dAn@uLpZ_Bm@K[	14	49
3140	181	p_xhAdnauM~Cdc@wEjCoC~@e^hKYyCTI	15	4
3145	134.3	p_xhAdnauMZ`FiMz@aBMw@QiJmDlEkMbBj@	15	10
3150	81.1	p_xhAdnauMZ`FiMz@aBMwA_@bBsEHB	15	14
3155	261.6	p_xhAdnauMpAxQ}l@jEYz@zCdVqD^DtAiDRa@wGx@k@l@kA_B_@	15	21
3160	235.2	p_xhAdnauMpAxQ}l@jEYz@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	15	26
3165	263.5	p_xhAdnauM`Dlb@Kb@mE~BgNhEmHrC_c@rMsE`AgACk@c@qCsIrC{@`B|F	15	30
3170	289.9	p_xhAdnauMZ`FiMz@yC_@oUkIqC`LyDc@w^mO{CY}EZxBxOd@CMaB~BU	15	35
3175	180	p_xhAdnauMZ`FiMz@yC_@oUkIwAnEy@pEeD[gJ_El@_B	15	40
3180	289.7	p_xhAdnauMZ`FkBLg@aHgD{Br@qBbAZNW_j@gS_OwHW^dAn@eCpGsOiCh@oA`Bg@	15	45
3185	210.5	p_xhAdnauMZ`FiMz@}@EkBa@aY_K_CSZoF[a@dDwJlIxC	15	50
3190	124.8	fbxhAfbbuMZhDiDX[Ss@AYsDe^hCM}B	16	5
3195	148.3	fbxhAfbbuMFTBUw@cLwM~@aBMw@QeCcA~AmEUKyA`E	16	11
3200	82.3	fbxhAfbbuMFTBUEy@sAsQI@@H	16	15
3205	109	fbxhAfbbuMZhDiDX[S_AAed@fD	16	20
3210	255.3	fbxhAfbbuMZhDiDX[S_AAsd@hDcAwJB}EYi@aEi@aPaHu@hBEdC_CEgBd@zBvH	16	27
3215	182.3	fbxhAfbbuMZhDiDX[S_AAsd@hDcAwJB}Ea@o@KrDNtD_BR	16	31
3220	246.2	fbxhAfbbuM~@nOmE~BgZ~Jcb@dM{Dp@uAk@wAuDoIo[Ga@x@a@p@eD	16	36
3225	221.9	fbxhAfbbuMZhDiDX[S_AAsd@hDcAwJB}EYi@aEi@oU{JRo@TeDPE	16	41
3230	286.7	fbxhAfbbuMZhDiDX{AUsd@hDcAwJB}E]m@}De@w^mO{CY{DTwCyPnCg@Ms@	16	46
3235	135.5	tswhAvbbuM@FyL|@D\\nAKVrCfNcAp@zIZK	17	1
3240	61	tswhAvbbuM@F_Lv@QsBcCRIqA	17	6
3245	144.9	tswhAvbbuM@F_Lv@Y}D@sAJo@vAuEgPwF~B}GnBp@{@dC	17	9
3250	71.8	tswhAvbbuM@F{DZBZdS_B@N	17	16
2892	130.5	rhwhAfsauMoAxDY~A?tBXbEnAKVrCfNcAp@zIZK	11	1
2893	87.2	rhwhAfsauMoAxDY~A?tBXbEnAKl@jHjDW	11	2
2894	90.2	rhwhAfsauMoAxDQv@Gf@?tBXbEnAKVrCyGf@NlB	11	3
2896	57.1	rhwhAfsauMoAxDQv@IzADpBqIn@?I	11	5
2897	43.4	rhwhAfsauMoAxDQv@iBWMhAAxA	11	6
2898	64.7	rhwhAfsauMoAxDQv@iBWh@uBkBo@_@tA	11	7
2899	52.9	rhwhAfsauMELaL{D}AvE	11	8
2901	83.3	rhwhAfsauMELqOmF~B}GnBp@{@dC	11	9
2902	41.4	rhwhAfsauMQf@hDnAl@LtAJhCKBP	11	12
2903	76.7	rhwhAfsauMQf@vE|AtAJhCKg@{HHc@t@uBHB	11	13
2904	38.8	rhwhAfsauMQf@TFjBeFrBr@	11	14
2906	86.5	rhwhAfsauMQf@hDnAvATnABtAIfJq@t@hK	11	16
2907	108.3	rhwhAfsauMoAxDY~A?tBXbEnS}AC[wE\\AG	11	17
2908	44.3	rhwhAfsauMoAxDQv@IzADpBfDW	11	18
2909	141.5	rhwhAfsauMoAxDY~A?tBRxCDh@nAKrAhRvA_@PfD_FrAAK	11	19
2911	98.1	rhwhAfsauMoAxDQv@Gf@?tBXbEnAKVrCsRxA	11	20
2912	132.9	rhwhAfsauMoAxDY~A?tBRdDyPnAWx@zCdVqD^DjA	11	22
2913	163.5	rhwhAfsauMoAxDY~A?tBRdDuPlA[z@~Db[gPzEq@cC	11	23
2914	139.1	rhwhAfsauMoAxDY~A?tBRdDwPlAYz@t@bG}RgCCiA]aAFE	11	25
2916	183.1	rhwhAfsauMELsP}FwAnEy@pEyDc@aPaHu@hBEdC_CEgBd@zBvH	11	27
2917	143.7	rhwhAfsauMoAxDY~A?tBRdDwPlAYz@t@bGkMaBYzAo@rAaAbAaAh@	11	24
2918	193.2	rhwhAfsauMiBxGRzGwPlAYz@t@bGkMaBYzAo@rAcClByA\\wAH}AOcBk@aAzA_Cj@	11	28
2919	222.1	rhwhAfsauMiBxGRzGwPlAYz@t@bGkMaBYzAo@rAaAbAiAl@mB^yA@cDy@aAzAhArDjA_@BJ	11	29
2921	101.7	rhwhAfsauMELsP}FwAnEw@`EMbENtD_BR	11	31
2922	109.7	rhwhAfsauMELsP}FwAnEy@pEqBMs@MqEqBi@lAAV	11	32
2923	143.7	rhwhAfsauMELsP}FwAnEy@pEyDc@aPaHu@hBIrE	11	33
2924	150.3	rhwhAfsauMELsP}FwAnEy@pEyDc@}YiMeAnB	11	34
2926	200.9	rhwhAfsauMiBxGRzGwPlAYz@t@bG}RgCCiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	11	36
2927	91	rhwhAfsauMELoUaIb@kIDc@Vy@	11	37
2928	102.7	rhwhAfsauMELuTyH_CSNgC_EWDo@	11	38
2929	111.8	rhwhAfsauMELuTyH_CSNgCaBMUrE	11	39
2931	149.7	rhwhAfsauMELsP}FwAnEy@pEsCUuViKRo@TeDPE	11	41
2932	167.2	rhwhAfsauMELuTyH_CSNgC_EWDy@m@BS`@eCeAg@nAsAe@fAsC	11	42
2933	136.3	rhwhAfsauMELuTyH_CSZoFCSWMf@{AuCiAUa@Gy@kAJ	11	43
2934	183.4	rhwhAfsauMELuTyH_CSZoF[a@f@{AuCiA]{AmAJASgGaCHQkBo@	11	44
2936	214.5	rhwhAfsauMELsP}FwAnEy@pEqBMsA[qYcMyCcA{CY{DTwCyPnCg@Ms@	11	46
2937	229	rhwhAfsauMELuTyH_CSZoF[a@f@{AuCiA]{AmAJASgGaCHQqAg@_Cu@oFs@_@rE	11	47
2938	175.9	rhwhAfsauMELsP}FwAnEy@pEsCUc[wMaEoAoDIm@uDPc@d@E	11	48
2939	204.7	rhwhAfsauMELsP}FwAnEy@pEsCUc[wMaEoAoDIYgBhCOzC`@TAb@i@@P	11	49
2941	218.8	n}vhA`iauMzD_LrLhELQzJ`E~BhBlFpFz@vB~@dSSR{Bb@Md@FhAQf@aD~BgExAuDx@UcDjDeA	9	1
2942	177.6	n}vhA`iauMzD_L~K`EgI|UY~AAr@@`AXbEnAKl@jHjDW	9	2
2943	180.6	n}vhA`iauMzD_L~K`EgI|UY~A?tBXbEnAKVrCyGf@NlB	9	3
2944	232.2	n}vhA`iauMzD_L~K`EgI|UY~A?tBXbEnAKrAhRgPbF	9	4
2946	133.8	n}vhA`iauMzD_L~K`EiGjQoAhEiBWMhAAxA	9	6
2947	130.4	n}vhA`iauMjCwHhBn@oElMiBm@y@|BrEbB_@tA	9	7
2948	102.8	n}vhA`iauMjCwHhBn@oElMiBm@}AvE	9	8
2949	50.1	n}vhA`iauMjCwHtHjC	9	10
2951	115.4	n}vhA`iauMzD_LrSpHcBxEIb@j@lI	9	12
2952	90.4	n}vhA`iauMzD_LrSpHm@bBHB	9	13
2953	94.5	n}vhA`iauMzD_L~K`E}C`JhC~@	9	14
2954	100.6	n}vhA`iauMzD_LhTzHfChAbAp@NjC	9	15
2956	171.8	n}vhA`iauMzD_LhTzHfChAbAp@`BdVkM~@AG	9	17
2957	134.7	n}vhA`iauMzD_L~K`EgI|UY~ABdDfDW	9	18
2958	222.7	n}vhA`iauMzD_LrLhELQpKnE~HnHrAtCdAbRSr@aCd@Md@FhAa@z@qCjBgExAoStFAK	9	19
2959	273.7	n}vhA`iauMz@eCoBq@zC{I[KgKhZo@dEGzCNtDaBReHnBTxACfBYzA}@dBvBnHhDcAz@y@Zu@_B_@	9	21
2961	211.6	n}vhA`iauMz@eCoBq@zC{I[KyIrVwArGMbENtDzDh[qD^DjA	9	22
2962	242.2	n}vhA`iauMz@eCoBq@zC{I[KkJ~WkAnGGzCNtD~Ef`@gPzEq@cC	9	23
2963	216.6	n}vhA`iauMz@eCoBq@zC{I[KyFvOmCpIo@dEGzCNtDaBReHnBTxACfBqDe@CiA]aAFE	9	25
2964	249.2	n}vhA`iauMz@eCoBq@zC{I[KgKhZo@dEGzCNtDaBReHnBTxACfBqDe@OkB_@o@w@o@oAUiAH{@^w@dAUjAFdA	9	26
2966	213.2	n}vhA`iauMz@eCoBq@zC{I[KyFvOmCpIo@dEGzCNtDaBReHnBNz@FpAIfAUfA]x@o@|@eBhA	9	24
2967	262.7	n}vhA`iauMz@eCoBq@zC{I[KgKhZo@dEGzCNtDaBReHnBVlCUtBy@lBwArA}Al@_CR}AOcBk@aAzA_Cj@	9	28
2968	291.6	n}vhA`iauMz@eCoBq@zC{I[KgKhZo@dEGzCNtDaBReHnBVlCUtBy@lBmB`BgA^_CR}AOcBk@aAzAhArDjA_@BJ	9	29
2969	304.3	n}vhA`iauMz@eCoBq@zC{I[KgKhZo@dEGzCNtDaBReHnBTxACfBYzAo@rAaAbAiAl@mB^yA@lD|LsEnAl@tB	9	30
2971	154.8	n}vhA`iauMz@eCoBq@zC{I[KuD|JcDtJm@tBk@lDqBMs@MqEqBi@lAAV	9	32
2972	188.8	n}vhA`iauMz@eCoBq@zC{I[KuD|JcDtJm@tBk@lDqBMgAUaPaHY`@[fAIrE	9	33
2973	195.4	n}vhA`iauMz@eCoBq@zC{I[KyIrVyAbHyDc@}YiMeAnB	9	34
2974	272.2	n}vhA`iauMz@eCoBq@zC{I[KyIrVyAbHyDc@}YiMyCcA{CY}EZxBxOd@CMaB~BU	9	35
2976	101.3	n}vhA`iauMz@eCoBq@zC{I[KmAbDeGwBg@zA	9	37
2977	152.6	n}vhA`iauMjCwHhBn@oElM}JkD_CSNgC_EWDo@	9	38
2978	161.7	n}vhA`iauMjCwHhBn@oElM}JkD_CSNgCaBMUrE	9	39
2979	162.3	n}vhA`iauMz@eCoBq@zC{I[KuD|JcDtJm@tBk@lDqBMs@MgJ_El@_B	9	40
2981	187.5	n}vhA`iauMz@eCoBq@tCmIeN_FiIsDOZdCnAUr@Ij@R~DcAFWJy@fBsAi@o@|A	9	42
2982	153.5	n}vhA`iauMz@eCoBq@tCmIGE}MyEiIsDOZdCnAUr@Ij@R~DkAJ	9	43
2983	153.3	n}vhA`iauMz@eCoBq@tCmIGE}MyEeCeAcHgD{A{@k@g@QJERdAn@eCpGOC	9	44
2984	205.9	n}vhA`iauMz@eCoBq@lCsIcR_HcHgDgCcBW^dAn@eCpGyC{@yJmAh@oA`Bg@	9	45
2986	198.9	n}vhA`iauMz@eCoBq@tCmIkReHcHgDgCcBW^dAn@eCpGeCu@_Fo@_@rE	9	47
2987	221	n}vhA`iauMz@eCoBq@zC{I[KyIrVyAbHqBMsA[qYcMaEoAoDIm@uDPc@d@E	9	48
2988	205.5	n}vhA`iauMz@eCoBq@tCmIkReHcHgDgCcBW^dAn@uLpZ_Bm@K[	9	49
2989	167.3	n}vhA`iauMz@eCoBq@tCmIeN_FiIsDMNAJdCnApMbFGPhDlA	9	50
2991	127.6	|uwhA~wauMEi@sBLaBMwA_@{B_AiAjDQv@Gf@?tBXbEnAKl@jHjDW	12	2
2992	130.6	|uwhA~wauMEi@sBLaBMwA_@{B_AiAjDQv@Gf@?tBXbEnAKVrCyGf@NlB	12	3
2993	182.2	|uwhA~wauMEi@sBLaBMwA_@{B_AiAjDQv@Gf@?tBXbEnAKrAhRgPbF	12	4
2994	97.5	|uwhA~wauMEi@sBLaBMwA_@{B_AiAjDQv@IzADpBqIn@?I	12	5
2996	105.1	|uwhA~wauMEi@sBLaBMwA_@{B_AiAjDQv@iBWh@uBkBo@_@tA	12	7
2997	85.7	|uwhA~wauMEi@sBLaBMw@QcG_CyHiC}AvE	12	8
2998	104.3	|uwhA~wauMEi@sBLaBMwA_@iI_DlEkMbBj@	12	10
2999	72.2	|uwhA~wauMEi@sBLaBMwA_@eBu@~AmEUKyA`E	12	11
3001	33.6	|uwhA~wauMk@mIHc@t@uBHB	12	13
3002	49.2	|uwhA~wauMUyCkC@aBYr@kBHB	12	14
3003	59	|uwhA~wauMCQbJq@c@aGI@@H	12	15
3004	51.2	|uwhA~wauMCQvIo@t@hK	12	16
3006	56.4	|uwhA~wauMJvAmBLLbCsGd@	12	18
3007	151.7	|uwhA~wauMCQvIo@`CtZAVwEjCoC~@wP|EAK	12	19
3008	238.5	|uwhA~wauMEi@sBLaBMwA_@{B_AiAjDY~A?tBRdDwPlAYz@zCdVqD^DtAiDRa@wGx@k@l@kA_B_@	12	21
3009	138.5	|uwhA~wauMEi@sBLaBMwA_@{B_AiAjDQv@Gf@?tBXbEnAKVrCsRxA	12	20
3011	203.9	|uwhA~wauMEi@sBLaBMsE_BcBjGRzGwPlAYz@~Db[gPzEq@cC	12	23
3012	179.5	|uwhA~wauMEi@sBLaBMsE_BcBjGRzGwPlAYz@t@bG}RgCYqC	12	25
3013	212.1	|uwhA~wauMEi@sBLaBMsE_BcBjGRzGwPlAYz@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	12	26
3014	215.9	|uwhA~wauMEi@sBLyC_@oUkIwAnEy@pEyDc@aPaHu@hBEdC_CEgBd@zBvH	12	27
3016	233.6	|uwhA~wauMEi@sBLaBMsE_BcBjGRzGwPlAYz@t@bGkMaBYzAo@rAcClByA\\wAH}AOcBk@aAzA_Cj@	12	28
3017	262.5	|uwhA~wauMEi@sBLaBMsE_BcBjGRzGwPlAYz@t@bGkMaBYzAo@rAaAbAiAl@mB^yA@cDy@aAzAhArDjA_@BJ	12	29
3018	268.8	|uwhA~wauMEi@sBLaBMsE_BcBjGRzGuPlA[z@zCdVqD^DtAiDR}KhDm@uBeCn@mA^l@tB	12	30
3019	134.5	|uwhA~wauMEi@sBLaBMw@QcG_CkMkEwAnEw@`EMbENtD_BR	12	31
3021	176.5	|uwhA~wauMEi@sBLyC_@oUkIwAnEy@pEyDc@aPaHu@hBIrE	12	33
3022	183.1	|uwhA~wauMEi@sBLyC_@oUkIwAnEy@pEyDc@}YiMeAnB	12	34
3023	259.9	|uwhA~wauMEi@mGQoUkIqC`LqBM_a@cP{CY}EZxBxOd@CMaB~BU	12	35
3024	241.3	|uwhA~wauMEi@sBLaBMsE_BcBjGRzGwPlAYz@t@bG}RgCCiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	12	36
3026	135.5	|uwhA~wauMEi@sBLyC_@qYgK_CSNgC_EWDo@	12	38
3027	144.6	|uwhA~wauMEi@sBLyC_@qYgK_CSNgCaBMUrE	12	39
3028	150	|uwhA~wauMEi@sBLyC_@oUkIwAnEy@pEqBMsA[gIqDl@_B	12	40
3029	182.5	|uwhA~wauMEi@sBLyC_@oUkIwAnEy@pEsCUuViKRo@TeDPE	12	41
3031	169.1	|uwhA~wauMEi@sBLyC_@qYgK_CSZoF[a@f@{AuCiA]{AkAJ	12	43
3032	209.8	|uwhA~wauMg@eJnBsFbAZNW_j@gSgIwDwD_CW^dAn@eCpGOC	12	44
3033	262.4	|uwhA~wauMg@eJnBsFbAZNW_j@gSgIwDwD_CW^dAn@eCpGyC{@yJmAh@oA`Bg@	12	45
3034	247.3	|uwhA~wauMEi@mGQoUkIqC`LqBM_a@cP{CY{DTwCyPnCg@Ms@	12	46
3036	208.7	|uwhA~wauMEi@sBLyC_@oUkIwAnEy@pEsCUc[wMaEoAoDIm@uDPc@d@E	12	48
3037	237.5	|uwhA~wauMEi@sBLyC_@oUkIwAnEy@pEsCUc[wMaEoAoDIYgBhCOzC`@TAb@i@@P	12	49
3038	180.5	|uwhA~wauMEi@sBLaBMw@Q}F}BsQiG_CSZoFCSWMdDwJlIxC	12	50
3039	151.8	zvwhAzhauMICr@qB`AZtC~AfFzEpAxAz@vBV~CEpAr@pJE`@MPeBT[NK\\D`AIh@W`@iAv@gAr@gExAuDx@UcDjDeA	13	1
3041	159.5	zvwhAzhauMICu@tBIb@d@bHsBLaBMwA_@{B_AiAjDQv@Gf@?tBXbEnAKVrCyGf@NlB	13	3
3042	196.4	zvwhAzhauMICr@qB`AZtC~AxHtHz@vBdAbRIf@kCp@Md@FhAa@z@qCjBgExAuDx@g[fJYyCTI	13	4
3043	126.4	zvwhAzhauMICu@tBIb@d@bHsBLaBMwA_@{B_AiAjDQv@IzADpBqIn@?I	13	5
3044	112.7	zvwhAzhauMICu@tBIb@d@bHsBLaBMwA_@{B_AiAjDQv@iBWMhAAxA	13	6
3046	114.6	zvwhAzhauMICu@tBIb@d@bHsBLaBMwA_@cFqByHiC}AvE	13	8
3047	103.3	zvwhAzhauMICr@qBbAZLE@QkHsCa@l@{BvGeBo@nAqDGC	13	10
3048	82.9	zvwhAzhauMICr@qBbAZLE@QkHsCa@l@wFbP	13	11
3049	143.6	zvwhAzhauMICr@qBbAZLE@QgGcC_QiGDM[K]|@lC`A{D~K	13	9
3051	64.9	zvwhAzhauMIC}@nCR|DkC@aBYr@kBHB	13	14
3052	33.1	zvwhAzhauMxBbAb@r@Hv@jBO@H	13	15
3053	72.9	zvwhAzhauMxBbAb@r@Hv@jBOvAjS	13	16
3054	104.3	zvwhAzhauMxBbAb@r@Hv@jBOrAbRkM~@AG	13	17
3056	155.7	zvwhAzhauMICr@qB`AZtC~AfFzEpAxAz@vBV~CEpAr@pJCXGPMH_BR[NMd@FhAQf@ORqCjBgExAuDx@yMzDAK	13	19
3057	267.4	zvwhAzhauMIC_AxCd@bHsBLaBMsE_BcBjGRzGyPnAWx@zCdVqD^DtAiDRa@wGx@k@l@kA_B_@	13	21
3058	167.4	zvwhAzhauMICu@tBIb@d@bHsBLaBMwA_@{B_AiAjDY~AAr@@`AXbEnAKVrCsRxA	13	20
3059	202.2	zvwhAzhauMICu@tBIb@d@bHsBLaBMwA_@{B_AiAjDY~A?tBRdDyPnAWx@zCdVqD^DjA	13	22
3061	208.4	zvwhAzhauMIC_AxCd@bHsBLaBMsE_BcBjGRzGwPlAYz@t@bG}RgCYqC	13	25
3062	241	zvwhAzhauMIC_AxCd@bHsBLaBMsE_BcBjGRzGwPlAYz@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	13	26
3063	244.8	zvwhAzhauMIC_AxCd@bHsBLyC_@oUkIwAnEy@pEyDc@aPaHu@hBEdC_CEgBd@zBvH	13	27
3064	213	zvwhAzhauMIC_AxCd@bHsBLaBMsE_BcBjGRzGwPlAYz@t@bGkMaBYzAo@rAcClB	13	24
3066	256.2	zvwhAzhauMh@uBxDbB~HnHrAtCdAbRSr@aCd@g@jDkJzEi`AvXoBq@mE_ObFkA	13	29
3067	267.6	zvwhAzhauMh@uBxDbB~HnHrAtCdAbRSr@aCd@g@jDkJzEw_ArXgA?s@e@qCsIrC{@`B|F	13	30
3068	163.4	zvwhAzhauMICu@tBIb@d@bHsBLaBMw@QcG_CkMkEwAnEw@`EMbENtD_BR	13	31
3069	171.4	zvwhAzhauMIC_AxCd@bHsBLyC_@oUkIwAnEy@pEeD[qEqBk@dB	13	32
3255	130.6	tswhAvbbuM@Fq^jCYz@zCdVqD^DjA	17	22
3071	212	zvwhAzhauMIC_AxCd@bHsBLyC_@oUkIwAnEy@pEyDc@}YiMeAnB	13	34
3072	288.8	zvwhAzhauMiAtCd@bHmGQoUkIqC`LyDc@w^mO{CY}EZxBxOd@CMaB~BU	13	35
3073	270.2	zvwhAzhauMIC_AxCd@bHsBLaBMsE_BcBjGRzGwPlAYz@t@bG}RgCCiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	13	36
3074	136.7	zvwhAzhauMICr@qBbAZLE@QgGcC_QiGDM[KmAbDeGwBg@zA	13	37
3076	173.5	zvwhAzhauMIC_AxCd@bHsBLyC_@qYgK_CSNgCaBMUrE	13	39
3077	178.9	zvwhAzhauMIC_AxCd@bHsBLyC_@oUkIwAnEy@pEqBMsA[gIqDl@_B	13	40
3078	211.4	zvwhAzhauMIC_AxCd@bHsBLyC_@oUkIwAnEy@pEyDc@oU{JRo@TeDPE	13	41
3079	215.7	zvwhAzhauMICr@qBbAZNWmh@mRiIsDOZdCnA_@~AR~D{ARy@fBsAi@o@|A	13	42
3081	181.5	zvwhAzhauMICr@qBbAZNW_j@gSgIwDwD_CW^dAn@eCpGOC	13	44
3082	234.1	zvwhAzhauMICr@qBbAZNW_j@gSgIwDwD_CW^dAn@eCpGyC{@yJmAh@oA`Bg@	13	45
3083	276.2	zvwhAzhauMiAtCd@bHmGQoUkIqC`LaCQo`@_P{CY{DTwCyPnCg@Ms@	13	46
3084	227.1	zvwhAzhauMICr@qBbAZNW_j@gSgIwDwD_CW^dAn@eCpGeCu@_Fo@_@rE	13	47
3086	233.7	zvwhAzhauMICr@qBbAZNW_j@gSgIwDwD_CW^dAn@uLpZ_Bm@K[	13	49
3087	195.5	zvwhAzhauMICr@qBbAZNWmh@mRiIsDMNAJdCnApMbFGPhDlA	13	50
3088	155.9	vowhAdoauMiC_AiDzJY~AAr@@`AXbEnAKVrCfNcAp@zIZK	14	1
3089	112.6	vowhAdoauMiC_AiDzJY~AAr@@`AXbEnAKl@jHjDW	14	2
3091	167.2	vowhAdoauMiC_AiDzJY~A?tBXbEnAKrAhRgPbF	14	4
3092	82.5	vowhAdoauMiC_AiDzJY~ABdDqIn@?I	14	5
3093	68.8	vowhAdoauMiC_AsChIg@hBiBWMhAAxA	14	6
3094	90.1	vowhAdoauMiC_AsChIg@hBiBWh@uBkBo@_@tA	14	7
3096	80	vowhAdoauMsBs@lB}FUGkAnDeBo@nAqDGC	14	10
3097	25.4	vowhAdoauMiC_AyA`E	14	11
3098	108.7	vowhAdoauMiC_A_BnEqOmF~B}GnBp@{@dC	14	9
3099	52.5	vowhAdoauMICs@jB`BXjCATxC	14	12
3101	68.4	vowhAdoauMsBs@zCeJLQxGfCtC~AFDCPNjC	14	15
3102	104.6	vowhAdoauMICs@jB`BXjCAPfCvIo@t@hK	14	16
3103	133.7	vowhAdoauMiC_AiDzJY~AAr@@`AXbEnS}AC[wE\\AG	14	17
3104	69.7	vowhAdoauMiC_AsChIg@hBIzADpBfDW	14	18
3106	223.5	vowhAdoauMiC_AyA`EoAxDY~A?tBRdDyPnAWx@zCdVqD^DtAiDRa@wGx@k@l@kA_B_@	14	21
3107	123.5	vowhAdoauMiC_AsChIg@hBGf@?tBXbEnAKVrCsRxA	14	20
3108	158.3	vowhAdoauMiC_AyA`EoAxDY~A?tBRdDyPnAWx@zCdVqD^DjA	14	22
3109	188.9	vowhAdoauMiC_AyA`EoAxDY~A?tBRdDuPlA[z@~Db[gPzEq@cC	14	23
3111	197.1	vowhAdoauMiC_AyA`EiBxGRzGwPlAYz@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	14	26
3112	208.5	vowhAdoauMiC_A_BnEsP}FwAnEy@pEyDc@aPaHu@hBEdC_CEgBd@zBvH	14	27
3113	169.1	vowhAdoauMiC_AyA`EiBxGRzGwPlAYz@t@bGkMaBYzAo@rAcClB	14	24
3114	218.6	vowhAdoauMiC_AyA`EiBxGRzGwPlAYz@t@bGkMaBYzAo@rAcClByA\\wAH}AOcBk@aAzA_Cj@	14	28
3116	253.8	vowhAdoauMiC_AyA`EiBxGRzGyPnAWx@zCdVqD^DtAiDR}KhDm@uBeCn@mA^l@tB	14	30
3117	127.1	vowhAdoauMiC_A_BnEsP}FwAnEw@`EMbENtD_BR	14	31
3118	135.1	vowhAdoauMiC_A_BnEsP}FwAnEy@pEeD[qEqBk@dB	14	32
3119	169.1	vowhAdoauMiC_A_BnEsP}FwAnEy@pEyDc@aPaHu@hBIrE	14	33
3121	252.5	vowhAdoauMiC_A_BnEsP}FwAnEy@pEyDc@}YiMyCcA{CY}EZxBxOd@CMaB~BU	14	35
3122	226.3	vowhAdoauMiC_AyA`EiBxGRzGwPlAYz@t@bG}RgCCiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	14	36
3123	116.4	vowhAdoauMiC_A_BnEoUaIb@kIDc@Vy@	14	37
3124	128.1	vowhAdoauMiC_A_BnEuTyH_CSNgC_EWDo@	14	38
3126	142.6	vowhAdoauMiC_A_BnEsP}FwAnEy@pEeD[gJ_El@_B	14	40
3127	175.1	vowhAdoauMiC_A_BnEsP}FwAnEy@pEqBMgAUoU{JRo@TeDPE	14	41
3128	192.6	vowhAdoauMiC_A_BnEuTyH_CSNgC_EWDy@m@BS`@eCeAg@nAsAe@fAsC	14	42
3129	161.7	vowhAdoauMiC_A_BnEuTyH_CSZoFCSWMf@{AuCiAUa@Gy@kAJ	14	43
3131	229.9	vowhAdoauMsBs@zCeJp@e@wa@cOgIwDwD_CW^dAn@eCpGyC{@yJmAh@oA`Bg@	14	45
3132	239.9	vowhAdoauMiC_A_BnEsP}FwAnEy@pEeD[qZqMyCcA{CY{DTwCyPnCg@Ms@	14	46
3133	222.9	vowhAdoauMsBs@zCeJp@e@wa@cOgIwDwD_CW^dAn@eCpGeCu@_Fo@_@rE	14	47
3134	201.3	vowhAdoauMiC_A_BnEsP}FwAnEy@pEaCQu[{MaEoAoDIm@uDPc@d@E	14	48
3136	173.1	vowhAdoauMiC_A_BnEuTyH_CSZoFCSWMdDwJlIxC	14	50
3137	120	p_xhAdnauMpBjXiDX[SYAoBHp@zIZK	15	1
3138	145.6	p_xhAdnauMpBjXiDX[S_AAqPlATvCjDW	15	2
3139	140.9	p_xhAdnauMpBjXiDX[S_AAkYtBNlB	15	3
3141	125.7	p_xhAdnauMpAxQye@jDM}B	15	5
3142	113.8	p_xhAdnauMZ`FiMz@aBMw@Q{CmAiAjDQv@iBWMhAAxA	15	6
3143	135.1	p_xhAdnauMZ`FiMz@aBMw@Q{CmAiAjDQv@iBWh@uBkBo@_@tA	15	7
3144	115.7	p_xhAdnauMZ`FiMz@aBMwA_@cFqByHiC}AvE	15	8
3146	102.2	p_xhAdnauMZ`FiMz@aBMw@QeCcA~AmEUKyA`E	15	11
3147	146.1	p_xhAdnauMZ`FiMz@}@EkBa@sFwBiL{D~B}GnBp@{@dC	15	9
3148	45.7	p_xhAdnauMZ`FuIl@Dh@	15	12
3149	55.6	p_xhAdnauMZ`FkBLg@aHc@s@yBcA	15	13
3151	39.8	p_xhAdnauMtA`S	15	16
3152	71.2	p_xhAdnauMpAxQkM~@AG	15	17
3153	100.3	p_xhAdnauMl@|IcM`ALbCsGd@	15	18
3154	140.3	p_xhAdnauMtA`SjAjNAVwEjCoC~@wP|EAK	15	19
3156	148.8	p_xhAdnauMpBjXiDX[S_AAed@fD	15	20
3157	196.4	p_xhAdnauMpAxQ}l@jEYz@zCdVqD^DjA	15	22
3158	217.2	p_xhAdnauM~Cdc@wEjCoC~@ep@nRq@cC	15	23
3159	202.6	p_xhAdnauMpAxQ}l@jEYz@t@bG}RgCYqC	15	25
3161	245.9	p_xhAdnauMZ`FiMz@yC_@oUkIwAnEy@pEyDc@aPaHu@hBEdC_CEgBd@zBvH	15	27
3162	207.2	p_xhAdnauMpAxQ}l@jEYz@t@bGkMaBYzAo@rAcClB	15	24
3260	141.4	tswhAvbbuMo^rCYz@t@bGkMaBYzAo@rAcClB	17	24
3163	256.7	p_xhAdnauMpAxQ}l@jEYz@t@bGkMaBYzAo@rAcClByA\\wAH}AOcBk@aAzA_Cj@	15	28
3164	252.1	p_xhAdnauMtCpc@mE~BuW|I}i@vOoBq@mE_ObFkA	15	29
3166	164.5	p_xhAdnauMZ`FiMz@yC_@oUkIwAnEw@`EMbENtD_BR	15	31
3167	172.5	p_xhAdnauMZ`FiMz@yC_@oUkIwAnEy@pEeD[qEqBk@dB	15	32
3168	206.5	p_xhAdnauMZ`FiMz@yC_@oUkIwAnEy@pEyDc@aPaHu@hBIrE	15	33
3169	213.1	p_xhAdnauMZ`FiMz@yC_@oUkIwAnEy@pEyDc@}YiMeAnB	15	34
3171	264.4	p_xhAdnauMpAxQ}l@jEYz@t@bG}RgCa@kC{BqA_Dd@iAvBoDc@Hi@}Aa@	15	36
3172	153.8	p_xhAdnauMZ`FiMz@yC_@kZoKb@kI\\}A	15	37
3173	165.5	p_xhAdnauMZ`FiMz@aBMi[yK_CSNgC_EWDo@	15	38
3174	174.6	p_xhAdnauMZ`FiMz@yC_@qYgK_CSNgCaBMUrE	15	39
3176	212.5	p_xhAdnauMZ`FiMz@yC_@oUkIwAnEy@pEaBKwAWoU{JRo@TeDPE	15	41
3177	230	p_xhAdnauMZ`FiMz@aBMi[yK_CSNgC_EWDy@m@BS`@eCeAg@nAsAe@fAsC	15	42
3178	199.1	p_xhAdnauMZ`FiMz@yC_@qYgK_CSZoF[a@f@{AuCiA]{AkAJ	15	43
3179	237.1	p_xhAdnauMZ`FkBLg@aHc@s@cCgAr@qBbAZNW_j@gSgIwDwD_CW^dAn@eCpGOC	15	44
3181	277.3	p_xhAdnauMZ`FiMz@yC_@oUkIqC`LsCU}_@{O{CY{DTwCyPnCg@Ms@	15	46
3182	282.7	p_xhAdnauMZ`FkBLg@aHc@s@cCgAr@qBbAZNW_j@gSgIwDwD_CW^dAn@eCpGeCu@_Fo@_@rE	15	47
3183	238.7	p_xhAdnauMZ`FiMz@yC_@oUkIqC`LqBMe\\_NaEoAoDIm@uDv@i@	15	48
3184	267.5	p_xhAdnauMZ`FiMz@yC_@oUkIqC`LaBKe`@sOaGg@YgBhCOzC`@z@Y	15	49
3186	80.2	fbxhAfbbuMZhDiDX[SYAoBHp@zIZK	16	1
3187	105.8	fbxhAfbbuMZhDiDX[S_AAqPlATvCjDW	16	2
3188	101.1	fbxhAfbbuMZhDiDX[S_AAkYtBNlB	16	3
3189	141.2	fbxhAfbbuMlAvNMVmE~BoC~@e^hKYyCTI	16	4
3191	125.9	fbxhAfbbuMZhDiDX[Ss@AYsDwRtAQsBcCRIqA	16	6
3192	156	fbxhAfbbuMZhDiDX[Ss@AYsDwRtAQsBwFb@I}CNsBPcA	16	7
3193	161.8	fbxhAfbbuMFTs@yLwM~@aBMuR{G}AvE	16	8
3194	180.4	fbxhAfbbuMFTBUw@cLwM~@}@EkBa@yIeDlEkMbBj@	16	10
3196	192.2	fbxhAfbbuMFTs@yLwM~@aBMeVmI~B}GnBp@{@dC	16	9
3197	91.8	fbxhAfbbuMFTBUw@cLcJp@Dh@	16	12
3198	101.7	fbxhAfbbuMFTBUw@cLyBPg@aHc@s@yBcA	16	13
3199	127.2	fbxhAfbbuMFTBUw@cLwM~@aBMwA_@bBsEHB	16	14
3201	70.3	fbxhAfbbuMZhDiDX[Ss@AYsDwE\\AG	16	17
3202	103.4	fbxhAfbbuMZhDiDX[Ss@AYsDsKx@OwBuAJ	16	18
3203	100.5	fbxhAfbbuMjAjNAVwEjCoC~@wP|EAK	16	19
3204	232.1	fbxhAfbbuMhAbOwEjCgNhEmS~FUaC[Q{D^DtAiDRa@wGx@k@l@kA_B_@	16	21
3206	166.9	fbxhAfbbuMlAvNMVmE~BoC~@e^hKUaC[Q{D^DjA	16	22
3207	177.4	fbxhAfbbuMlAvNMVcCpAyElBep@nRq@cC	16	23
3208	201.7	fbxhAfbbuMZhDiDX[Ss@AYsDie@hDYz@t@bG}RgCYqC	16	25
3209	234.3	fbxhAfbbuMZhDiDX[Ss@AYsDie@hDYz@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	16	26
3211	206.3	fbxhAfbbuMZhDiDX[Ss@AYsDie@hDYz@t@bGkMaBYzAo@rAcClB	16	24
3212	248.3	fbxhAfbbuM~@nOmE~BuW|Iud@fN{Dp@uAk@sEgOrCw@iAsD_Cj@	16	28
3213	212.3	fbxhAfbbuM~@nOmE~BuW|Iud@fNeFh@cCyE{BqIbFkA	16	29
3214	223.7	fbxhAfbbuMlAvNMVmE~Bic@xNaYjI}Cl@gACk@c@qCsIrC{@`B|F	16	30
3216	181.9	fbxhAfbbuMZhDiDX[S_AAsd@hDcAwJB}EYi@mDa@qEqBk@dB	16	32
3217	215.9	fbxhAfbbuMZhDiDX[S_AAsd@hDcAwJB}E]m@}De@aPaHu@hBIrE	16	33
3218	222.5	fbxhAfbbuMZhDiDX[S_AAsd@hDcAwJB}E]m@}De@}YiMeAnB	16	34
3219	275.5	fbxhAfbbuM~@nOmE~BgZ~Jcb@dMgEp@iAk@wAuDwIq\\}B}W~BU	16	35
3221	199.9	fbxhAfbbuMFTs@yLwM~@aBMc\\aLb@kI\\}A	16	37
3222	211.6	fbxhAfbbuMFTs@yLwM~@aBMi[yK_CSNgC_EWDo@	16	38
3223	220.7	fbxhAfbbuMFTs@yLwM~@aBMi[yK_CSNgCaBMUrE	16	39
3224	189.4	fbxhAfbbuMZhDiDX[S_AAsd@hDcAwJB}ESa@gEq@sIwDl@_B	16	40
3226	262	fbxhAfbbuMZhDiDX[S_AAsd@hDcAwJB}ESa@gEq@sIwDbCuGXaB_DID}@sAe@fAsC	16	42
3227	245.2	fbxhAfbbuMFTs@yLwM~@aBMi[yK_CSZoF[a@f@{AuCiA]{AkAJ	16	43
3228	268.8	fbxhAfbbuMFTwAeUp@q@nAlATQuDkDgKoEwa@cOgIwDwD_CW^dAn@eCpGOC	16	44
3229	321.4	fbxhAfbbuMFTwAeUp@q@nAlATQuDkD_n@sU_OwHW^dAn@eCpGsOiCh@oA`Bg@	16	45
3231	307.7	fbxhAfbbuMZhDiDX{AUsd@hDcAwJB}E]m@}De@w^mOwEUm@uDt@i@DaBlGd@`A{F	16	47
3232	248.1	fbxhAfbbuMZhDiDX{AUsd@hDcAwJB}E]m@}De@w^mOwEUm@uDv@i@	16	48
3233	276.9	fbxhAfbbuMZhDiDX{AUsd@hDcAwJB}E]m@}De@w^mOwEUYgBhCOzC`@z@Y	16	49
3234	256.6	fbxhAfbbuMFTs@yLwM~@aBMi[yK_CSZoF[a@dDwJlIxC	16	50
3236	92.2	tswhAvbbuM@FyL|@D\\nAKl@jHjDW	17	2
3237	95.2	tswhAvbbuM@FyL|@D\\nAKVrCyGf@NlB	17	3
3238	146.8	tswhAvbbuM@FyL|@D\\nAKrAhRgPbF	17	4
3239	59.9	tswhAvbbuM@FmWjBM}B	17	5
3241	91.1	tswhAvbbuM@F_Lv@QsBwFb@I}CNsBPcA	17	7
3242	105.6	tswhAvbbuM@FmWjBMsBuBPK_B@iDp@mE	17	8
3243	133.1	tswhAvbbuM@F_Lv@Y}D@sAJo@vAuEcFiBlEkMbBj@	17	10
3244	94.1	tswhAvbbuM@F_Lv@Y}DD_BhAgEtB_GUKyA`E	17	11
3246	91.1	tswhAvbbuM@F_Lv@Y}D@sAJo@jA}D`EtAtAJhCKBP	17	12
3247	122.1	tswhAvbbuM@F_Lv@Y}D@sAJo@fAqDjGwQLQvEjBs@pBHB	17	13
3248	81	tswhAvbbuM@F_Lv@Y}D?_ALcA`AcDtB_GrBr@	17	14
3249	125.5	tswhAvbbuM@F{DZBZpSaBwA{RI@@H	17	15
3251	36.4	tswhAvbbuMKmBsGd@	17	18
3252	146.5	tswhAvbbuM@FyL|@D\\nAKrAhRvA_@PfD_FrAAK	17	19
3253	195.8	tswhAvbbuM@Fq^jCYz@zCdVqD^DtAiDRa@wGx@k@l@kA_B_@	17	21
3254	102.5	tswhAvbbuM@Fq^jCYz@~@nHXs@[cCLA	17	20
3256	161.2	tswhAvbbuMo^rCYz@~Db[gPzEq@cC	17	23
3257	136.8	tswhAvbbuMo^rCYz@t@bG}RgCYqC	17	25
3258	169.4	tswhAvbbuMo^rCYz@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	17	26
3259	193.7	tswhAvbbuMm^rCa@cEB}E]m@}De@aPaHu@hBEdC_CEgBd@zBvH	17	27
3261	190.9	tswhAvbbuMo^rCYz@t@bGkMaBYzAo@rAcClByA\\wAH}AOcBk@aAzA_Cj@	17	28
3262	219.8	tswhAvbbuMo^rCYz@t@bGkMaBYzAo@rAaAbAiAl@mB^yA@cDy@aAzAhArDjA_@BJ	17	29
3263	226.1	tswhAvbbuMo^rCYz@zCdVqD^DtAiDR}KhDm@uBeCn@mA^l@tB	17	30
3264	120.7	tswhAvbbuM@Fo^jCa@cEB}Ea@o@KrDNtD_BR	17	31
3266	154.3	tswhAvbbuMm^rCa@cEB}E]m@}De@aPaHu@hBIrE	17	33
3267	160.9	tswhAvbbuMm^rCa@cEB}E]m@}De@}YiMeAnB	17	34
3268	237.7	tswhAvbbuMm^rCa@cEB}E]m@}De@}YiMyCcA{CY}EZxBxOd@CMaB~BU	17	35
3269	198.6	tswhAvbbuMo^rCYz@t@bG}RgCCiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	17	36
3271	164.3	tswhAvbbuM}K~@Y}D@sAbBeGkUcI_CSNgC_EWDo@	17	38
3272	173.4	tswhAvbbuM@F_Lv@Y}D@sAJo@vAuEkUcI_CSNgCaBMUrE	17	39
3273	127.8	tswhAvbbuMm^rCa@cEB}ESa@gEq@sIwDl@_B	17	40
3274	160.3	tswhAvbbuMm^rCa@cEB}EYi@aEi@oU{JRo@TeDPE	17	41
3276	197.9	tswhAvbbuM}K~@Y}D@sAbBeGkUcI_CSZoF[a@f@{AuCiA]{AkAJ	17	43
3277	218.8	tswhAvbbuMm^rCa@cEB}E]m@}De@oU{JRo@^}DjGsOkBo@	17	44
3278	271.4	tswhAvbbuMm^rCa@cEB}E]m@}De@oU{JRo@^}DjGsOqE}A}KwAh@oA`Bg@	17	45
3279	225.1	tswhAvbbuMm^rC]aL]m@}De@w^mO{CY{DTwCyPnCg@Ms@	17	46
3281	186.5	tswhAvbbuMm^rCa@cEB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@d@E	17	48
3282	215.3	tswhAvbbuMm^rCa@cEB}E]m@}De@}YiMyCcAyAU}B?YgBhCOzC`@TAb@i@@P	17	49
3283	209.3	tswhAvbbuM@F_Lv@Y}D@sAJo@vAuEkUcI_CSZoFCSWMdDwJlIxC	17	50
3284	124.5	tjwhAn`buMgDVTrCnAKVrCfNcAp@zIZK	18	1
3286	84.2	tjwhAn`buMgDVTrCnAKVrCyGf@NlB	18	3
3287	135.8	tjwhAn`buMgDVTrCnAKrAhRgPbF	18	4
3288	43.8	tjwhAn`buMyNfA?I	18	5
3289	31	tjwhAn`buMsGf@IqA	18	6
3291	81.8	tjwhAn`buMoRxAK_B@iDp@mE	18	8
3292	110.2	tjwhAn`buMoCRGiAD_B~AyFcFiBlEkMbBj@	18	10
3293	71.2	tjwhAn`buMoCRGiCLcAZkAzCwIUKyA`E	18	11
3294	122	tjwhAn`buMoCRGiAD_B~AyFgPwF~B}GnBp@{@dC	18	9
3296	88.2	tjwhAn`buMtAKCcBp@qDtAJhCKg@{HHc@t@uBHB	18	13
3297	58.1	tjwhAn`buMoCRGuBLwAvAuE~AmErBr@	18	14
3298	105.8	tjwhAn`buMtAKCcBp@qDxBJhM}@c@aGI@@H	18	15
3299	70.4	tjwhAn`buMtAKRrCdS_B@N	18	16
3301	135.5	tjwhAn`buMgDVTrCnAKrAhRvA_@PfD_FrAAK	18	19
3302	192.1	tjwhAn`buMgDVNtByPnAWx@zCdVqD^DtAiDRa@wGx@k@l@kA_B_@	18	21
3303	92.1	tjwhAn`buMgDVTrCnAKVrCsRxA	18	20
3304	126.9	tjwhAn`buMgDVNtByPnAWx@zCdVqD^DjA	18	22
3306	133.1	tjwhAn`buMgDVNtBwPlAYz@t@bG}RgCYqC	18	25
3307	165.7	tjwhAn`buMgDVNtBwPlAYz@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	18	26
3308	190	tjwhAn`buMgDVNtBuPlAa@cEB}E]m@}De@aPaHu@hBEdC_CEgBd@zBvH	18	27
3309	137.7	tjwhAn`buMgDVNtBwPlAYz@t@bGkMaBYzAo@rAcClB	18	24
3311	216.1	tjwhAn`buMgDVNtBwPlAYz@t@bGkMaBYzAo@rAaAbAiAl@mB^yA@cDy@aAzAhArDjA_@BJ	18	29
3312	222.4	tjwhAn`buMgDVNtByPnAWx@zCdVqD^DtAiDR}KhDm@uBeCn@mA^l@tB	18	30
3313	117	tjwhAn`buMgDVNtBuPlAa@cEB}Ea@o@KrDNtD_BR	18	31
3314	116.6	tjwhAn`buMgDVNtBuPlAa@cEB}E]m@iD]qEqBi@lAAV	18	32
3316	157.2	tjwhAn`buMgDVNtBuPlAa@cEB}E]m@}De@}YiMeAnB	18	34
3317	234	tjwhAn`buMgDVNtBuPlAa@cEB}E]m@}De@}YiMyCcA{CY}EZxBxOd@CMaB~BU	18	35
3318	194.9	tjwhAn`buMgDVNtBwPlAYz@t@bG}RgCCiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	18	36
3319	129.7	tjwhAn`buMoCRGiAD_B~AyFeVkIb@kIDc@Vy@	18	37
3321	150.5	tjwhAn`buMoCRGiAD_B~AyFkUcI_CSNgCaBMUrE	18	39
3322	124.1	tjwhAn`buMgDVNtBuPlAa@cEB}ESa@KMsBMgAUsIwDl@_B	18	40
3323	156.6	tjwhAn`buMgDVNtBuPlAa@cEB}EYi@aEi@oU{JRo@TeDPE	18	41
3324	196.7	tjwhAn`buMgDVNtBuPlAa@cEB}EYi@aEi@sIwDbCuGXaB_DID}@sAe@fAsC	18	42
3326	215.1	tjwhAn`buMgDVNtBuPlAa@cEB}E]m@}De@oU{JRo@^}DjGsOkBo@	18	44
3327	267.7	tjwhAn`buMgDVNtBuPlAa@cEB}E]m@}De@oU{JRo@^}DjGsOqE}A}KwAh@oA`Bg@	18	45
3328	221.4	tjwhAn`buMgDVNtBuPlAa@cEB}E]m@}De@}YiMyCcA{CY{DTwCyPnCg@Ms@	18	46
3329	242.4	tjwhAn`buMgDVNtBuPlAa@cEB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	18	47
3331	211.6	tjwhAn`buMgDVNtBuPlAa@cEB}E]m@}De@}YiMyCcAyAU}B?YgBhCOzC`@TAb@i@@P	18	49
3332	186.4	tjwhAn`buMoCRGiAD_B~AyFkUcI_CSZoFCSWMdDwJlIxC	18	50
3333	68.6	ngwhAh_cuMSwCdSaG	19	1
3334	72.2	ngwhAh_cuMSwC`I_C]oGQ@	19	2
3336	54.2	ngwhAh_cuMSwC{KjD	19	4
3337	134.1	ngwhAh_cuMyAoSkNdAw@gHhF_@?I	19	5
3338	145.2	ngwhAh_cuMSwC`I_CkAyQyF^QsBcCRIqA	19	6
3339	169.3	ngwhAh_cuMyAoSkNdAw@gHzIo@I}CNsBPcA	19	7
3341	217.3	ngwhAh_cuMSwC`I_CkAyQyF^Y}D@sAJo@vAuEcFiBlEkMbBj@	19	10
3342	178.3	ngwhAh_cuMSwC`I_CkAyQyF^QsBGuBLwAvAuE~AmEUKyA`E	19	11
3343	187	ngwhAh_cuMyAoSkNdAYeCi@qFAiDJiBb@mC|AgFhCsHnBp@{@dC	19	9
3344	175.3	ngwhAh_cuMSwC`I_CkAyQyF^Y}D@sAJo@jA}D`EtAtAJhCKBP	19	12
3346	165.2	ngwhAh_cuMSwC`I_CkAyQyF^Y}D@sAJo@vAuE~AmErBr@	19	14
3347	181.8	ngwhAh_cuMSwClVmHNGJWOqCzCUa@sFAyAsAsQI@@H	19	15
3348	134.3	ngwhAh_cuMSwC`I_CiA{PpR}A@N	19	16
3349	141	ngwhAh_cuMyAoSrUcBYsDwE\\AG	19	17
3351	176.4	ngwhAh_cuMSwCyEvARbDE@kEpAUaCUOOAqD^DtAiDRa@wGx@k@l@kA_B_@	19	21
3265	120.3	tswhAvbbuMm^rCa@cEB}E]m@iD]qEqBk@dB	17	32
3270	152.6	tswhAvbbuM@F_Lv@Y}D@sAJo@vAuEeVkIb@kIDc@Vy@	17	37
3275	200.4	tswhAvbbuMm^rCa@cEB}EYi@aEi@sIwDbCuGXaB_DID}@sAe@fAsC	17	42
3280	246.1	tswhAvbbuMm^rCa@cEB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	17	47
3285	81.2	tjwhAn`buMgDVTrCnAKl@jHjDW	18	2
3290	61.1	tjwhAn`buMgKv@I}CNsBPcA	18	7
3295	52.9	tjwhAn`buMtAKCcBp@qDtAJhCKBP	18	12
3300	33.1	tjwhAn`buMrGe@JlB	18	17
3305	157.5	tjwhAn`buMgDVNtByPnAWx@~Db[gPzEq@cC	18	23
3310	187.2	tjwhAn`buMgDVNtBwPlAYz@t@bGkMaBYzAo@rAcClByA\\wAH}AOcBk@aAzA_Cj@	18	28
3315	150.6	tjwhAn`buMgDVNtBuPlAa@cEB}E_@o@{Dc@aPaHu@hBIrE	18	33
3320	141.4	tjwhAn`buMoCRGiAD_B~AyFkUcI_CSNgC_EWDo@	18	38
3325	175	tjwhAn`buMoCRGiAD_B~AyFkUcI_CSZoFCSWMf@{AuCiAUa@Gy@kAJ	18	43
3330	182.8	tjwhAn`buMgDVNtBuPlAa@cEB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@d@E	18	48
3335	61.3	ngwhAh_cuMs@uJaCPWkD	19	3
3340	150.8	ngwhAh_cuMyAoSkNdAcAwJAiDtBBr@oF	19	8
3345	201.2	ngwhAh_cuMSwClVmHNGJWOqCzCUa@sF@q@u@qKyBPg@aHc@s@yBcA	19	13
3350	122.7	ngwhAh_cuMSwC`I_CkAyQUBOwBuAJ	19	18
3355	138.2	ngwhAh_cuMSwCqLtDsAyKk@}@eSkCCiA]aAFE	19	25
3360	178.1	ngwhAh_cuMSwCbFwAPfDWPgJbDm`@pLqFdAy@Oa@c@]{As@qA{BqI~EwABJ	19	29
3365	201	ngwhAh_cuMyAoSkNdAcAwJB}E]m@}De@}YiMeAnB	19	34
3370	223.5	ngwhAh_cuMyAoSkNdAcAwJAiDJiBb@mCfB}FcDkA_CSNgCaBMUrE	19	39
3375	258.9	ngwhAh_cuMyAoSkNdAcAwJB}E]m@}De@oU{JRo@^}DjGsOkBo@	19	44
3380	255.4	ngwhAh_cuMyAoSkNdAcAwJB}E]m@}De@}YiMyCcAyAU}B?YgBhCOzC`@TAb@i@@P	19	49
3385	106.1	vlvhAfwbuM~A^r@h@bDe@Hn@NFNK@ISeBxC_@x@~G{Bt@	21	4
3390	183.4	vlvhAfwbuM~A^f@kEjCZXs@_B{NB}Eh@cE|AgFhCsHnBp@nAqDtHjC	21	10
3395	148	vlvhAfwbuM~A^f@kEvBXXARo@w@yGnQqAWsCGuBLwAZkAzCwIrBr@	21	14
3400	179.5	vlvhAfwbuM~A^r@h@bDe@Hn@NFNK@ISeBxC_@x@~GbOmEPfD_FrAAK	21	19
3405	110.9	vlvhAfwbuM~A^n@uFcOmBCiA]aAm@o@s@[s@I{@Do@Pq@f@_@n@Qp@Ct@Fh@	21	26
3410	136	vlvhAfwbuM~A^r@h@n@pIiDR}KhDm@uBsEnAl@tB	21	30
3415	198.4	vlvhAfwbuM~A^n@uFcOmBCiA]aAm@o@mAa@cBDsAt@q@`BDdBgI`Cm@oCm@eFoAwP~BU	21	35
3420	129.1	vlvhAfwbuM~A^f@kEjCZXs@_B{NB}E_@o@sBMs@MgJ_El@_B	21	40
3425	272.7	vlvhAfwbuM~A^f@kEjCZXs@_B{NB}E_@o@{Dc@oU{JRo@^}DjGsOqE}A}KwAh@oA`Bg@	21	45
3430	220.6	vlvhAfwbuM~A^f@kEjCZXs@_B{NAiDJiBb@mCfB}FcDkA_CSZoFCSWMdDwJlIxC	21	50
3435	46.6	vuvhA|lbuMM@w@gHhF_@?I	20	5
3440	112.4	vuvhA|lbuMM@[uCnQqA_@}ED_BhAgEtB_GUKyA`E	20	11
3445	148	vuvhA|lbuMM@[uCnQqA_@}ELcC`J{WxGfCtC~ARbD	20	15
3450	156.3	vuvhA|lbuMM@c@sDYz@zCdVqD^DtAiDRa@wGx@k@l@kA_B_@	20	21
3455	146.3	vuvhA|lbuMM@w@gHKoAB}EYi@WGaBKgAUaPaHY`@[fAEdC_CEgBd@zBvH	20	27
3460	73.3	vuvhA|lbuMM@cAwJB}E_@o@MrDNtD_BR	20	31
3465	159.1	vuvhA|lbuMM@a@sD[z@t@bG}RgCCiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	20	36
3470	112.9	vuvhA|lbuMM@w@gHKoAB}EYi@WGaBKgAUoU{JRo@TeDBKLD	20	41
3475	177.7	vuvhA|lbuMM@cAwJB}E]m@}De@}YiMyCcA{CY{DTwCyPnCg@Ms@	20	46
3480	195.2	zrvhAxccuMiD\\a@wGx@k@l@kAf@kEpCVRo@[cChb@_Dp@zIZK	22	1
3485	151.5	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEjCZXs@sAkLnM_AIqA	22	6
3490	180	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEjCZXs@_B{NB}Eh@cE|AgFhCsHnBp@{@dC	22	9
3495	181.5	zrvhAxccuMiD\\a@wGx@k@l@kAf@kEjCZXs@w@yGvl@qE@N	22	16
3500	86.2	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEvBXXARo@[cCLA	22	20
3505	114.7	zrvhAxccuM?HiDRa@wGx@k@l@kAn@uFqIgAYzAo@rAaAbAaAh@	22	24
3510	153.4	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEjCZXs@_B{NB}E_@o@sBMs@MqEqBi@lAAV	22	32
3515	195.7	zrvhAxccuMiD\\a@wGx@k@l@kAf@kEjCZXs@_B{NAiDn@wFfB}F}DsAb@kI\\}A	22	37
3520	233.5	zrvhAxccuMiD\\a@wGx@k@l@kAf@kEjCZXs@_B{NB}E_@o@gD[gJ_EbCuGXaB_DID}@sAe@fAsC	22	42
3525	269.7	zrvhAxccuMN|BgAl@}I`DmJ`C}@Bs@[m@qBs@qAoIo[}@mH}AeSgDgRzEq@|BBnC`@p@kCNoB	22	47
3530	157.9	pfvhAbhcuMkBmGhHuBx@k@l@kAf@kEpCVRo@[cC`S{ATvCjDW	23	2
3535	161.2	pfvhAbhcuMkBmGhHuBx@k@l@kAf@kEvBXXARo@sAkLzIo@I}CNsBPcA	23	7
3540	188.8	pfvhAbhcuMkBmGhHuBx@k@l@kAf@kEpCVRo@w@yGnQqA_@}E@sAvAmF`EtAtAJhCKBP	23	12
3545	190.9	pfvhAbhcuMkBmGhHuBx@k@l@kAf@kEpCVRo@w@yGde@kDC[yET	23	17
3550	80.2	pfvhAbhcuMkBmGxH}Bh@c@l@kAr@h@n@fI	23	22
3555	85.8	pfvhAbhcuMqEwOmB^yA@wAUkAc@aAzA_Cj@	23	28
3560	138.9	pfvhAbhcuMuGcUv@k@f@gAHmAQeA_@o@w@o@oAUiAHeEqNxA[xBDClA	23	33
3565	198.2	pfvhAbhcuMkBmGdIgCjAeBf@kEjCZXs@_B{NB}E_@o@uCUiDuAp@}AyAq@\\aAl@cK	23	38
3570	231.5	pfvhAbhcuMkBmGdIgCjAeBf@kEjCZXs@sAkLGmHSa@gEq@sIwDbCuGl@sDeCeApBaFf@k@	23	43
3575	183.7	pfvhAbhcuMuGcUv@k@f@gAHmAQeA_@o@w@o@oAUiAHwGmUAwAf@yBaEoAoDIm@uDPc@d@E	23	48
3580	123.1	h`vhAphbuMjCeBl@zAdHoB`BSPtAl@n@lGe@PtCdBMNlB	25	3
3585	125.7	h`vhAphbuMjCeBl@zAdHoBQ}BCyAL}CdBNZOJMb@mCrBb@DW	25	8
3590	203.8	h`vhAphbuMjCeBl@zAdHoB`BSPtAl@n@pQqA_@}ELcC`J{WvEjBs@pBHB	25	13
3595	132.2	h`vhAphbuMjCeBl@zAdHoB`BSPtAl@n@pQqAWsCnCS	25	18
3600	154.2	h`vhAphbuMjCeB`@z@ZzAFpAMzA|MdB~BrQgPzEq@cC	25	23
3605	136.6	h`vhAphbuMjCeBl@zATxACfBYzAc@`A{@dA}@l@gA^cANyA@wAUkAc@aAzAhArDjA_@BJ	25	29
3610	130.1	h`vhAphbuMjCeB`@z@T|@LtAElAqDe@@e@QeA_@o@w@o@oAUiAHoGsTKw@@y@]I	25	34
3615	188.4	h`vhAphbuMjCeBl@zAdHoBQ}BCyAL}C|@wF\\uFeBKNgCaBMUrE	25	39
3352	87.5	ngwhAh_cuMyAoS}MbA	19	20
3353	111.2	ngwhAh_cuMSwCyEvARbDE@kEpAUaC_@QwD^DjA	19	22
3354	121.7	ngwhAh_cuMSwCyEvARbDE@kWvHq@cC	19	23
3356	170.8	ngwhAh_cuMSwCqLtDsAyKk@}@eSkCCiA]aAaBkAoBCaBx@q@`BB~A	19	26
3357	213.4	ngwhAh_cuMSwCqLtDsAyKk@}@eSkCOkB_AoAmAa@cBDeEqNSHzBvH	19	27
3358	142.8	ngwhAh_cuMSwCqLtDsAyKk@}@sMeBYzAo@rAaAbAaAh@	19	24
3359	192.3	ngwhAh_cuMSwCqLtDsAyKk@}@sMeBYzAo@rAcClByA\\wAH}AOcBk@aAzA_Cj@	19	28
3361	189.5	ngwhAh_cuMSwCbFwAPfDWPiS|GaYjIuCj@gA?s@e@qCsIrC{@`B|F	19	30
3362	160.8	ngwhAh_cuMyAoSkNdAcAwJB}E_@o@MrDNtD_BR	19	31
3363	160.4	ngwhAh_cuMyAoSkNdAcAwJB}EYi@mDa@qEqBi@lAAV	19	32
3364	194.4	ngwhAh_cuMyAoSkNdAcAwJB}E]m@}De@aPaHu@hBIrE	19	33
3366	241.3	ngwhAh_cuMSwCbFwAPfDWPgJbDcb@dMqDp@iASmBmEwIq\\y@cHcAyN~BU	19	35
3367	200	ngwhAh_cuMSwCqLtDsAyKk@}@eSkCCiA]aAaBkAmAIqAVeA~@]hAoDc@Hi@}Aa@	19	36
3368	202.7	ngwhAh_cuMyAoSkNdAcAwJAiDJiBb@mCfB}F}DsAb@kIDc@Vy@	19	37
3369	206.3	ngwhAh_cuMyAoSkNdAcAwJB}E_@o@uCUiDuAp@}AyAq@\\aAl@cK	19	38
3371	167.9	ngwhAh_cuMyAoSkNdAcAwJB}ESa@KMsBMgAUsIwDl@_B	19	40
3372	200.4	ngwhAh_cuMyAoSkNdAcAwJB}EYi@aEi@oU{JRo@TeDPE	19	41
3373	240.5	ngwhAh_cuMyAoSkNdAcAwJB}ESa@KMsBMgAUsIwDbCuGXaB_DID}@sAe@fAsC	19	42
3374	239.6	ngwhAh_cuMyAoSkNdAcAwJB}ESa@gEq@sIwDbCuGl@sDeCeApBaFf@k@	19	43
3376	311.5	ngwhAh_cuMyAoSkNdAcAwJB}E]m@}De@oU{JRo@^}DjGsOqE}A}KwAh@oA`Bg@	19	45
3377	265.2	ngwhAh_cuMyAoSkNdAcAwJB}E]m@}De@}YiMyCcA{CY{DTwCyPnCg@Ms@	19	46
3378	286.2	ngwhAh_cuMyAoSkNdAcAwJB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	19	47
3379	226.6	ngwhAh_cuMyAoSkNdAcAwJB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@d@E	19	48
3381	259.4	ngwhAh_cuMyAoSkNdAcAwJAiDn@wFfB}FcDkA_CSZoF[a@dDwJlIxC	19	50
3382	163.4	vlvhAfwbuM~A^f@kElCZVs@[cChb@_Dp@zIZK	21	1
3383	127.2	vlvhAfwbuM~A^f@kElCZVs@[cC`S{ATvCjDW	21	2
3384	86.9	vlvhAfwbuM~A^f@kElCZVs@[cCfJs@NlB	21	3
3386	95.3	vlvhAfwbuM~A^f@kEjCZXs@sAkLhF_@?I	21	5
3387	119.7	vlvhAfwbuM~A^f@kEjCZXs@sAkLnM_AIqA	21	6
3388	130.5	vlvhAfwbuM~A^f@kEvBXXARo@sAkLzIo@I}CNsBPcA	21	7
3389	112	vlvhAfwbuM~A^f@kEjCZXs@_B{NAiDtBBr@oF	21	8
3391	161.1	vlvhAfwbuM~A^f@kEvBXXARo@w@yGnQqA_@}ED_BhAgEtB_GUKyA`E	21	11
3392	148.2	vlvhAfwbuM~A^f@kEjCZXs@_B{NAiDJiBb@mC|AgFhCsHnBp@{@dC	21	9
3393	158.1	vlvhAfwbuM~A^f@kEvBXXARo@w@yGnQqA_@}E@sAJo@jA}D`EtAtAJhCKBP	21	12
3394	189.1	vlvhAfwbuM~A^f@kEpCVRo@w@yGnQqA_@}ELcC`J{WvEjBs@pBHB	21	13
3396	196.7	vlvhAfwbuM~A^f@kEpCVRo@w@yGnQqA_@}ELcC`J{WxGfCtC~ARbD	21	15
3397	149.7	vlvhAfwbuM~A^f@kEpCVRo@w@yGvl@qE@N	21	16
3398	160.2	vlvhAfwbuM~A^f@kEpCVRo@w@yGde@kDC[yET	21	17
3399	117.5	vlvhAfwbuM~A^f@kEvBXXARo@w@yGnQqAWsCnCS	21	18
3401	54.4	vlvhAfwbuM~A^f@kElCZVs@[cCLA	21	20
3402	40.5	vlvhAfwbuM~A^r@h@n@fI	21	22
3403	85.4	vlvhAfwbuM~A^r@h@h@zFThEgJnCq@cC	21	23
3404	78.3	vlvhAfwbuM~A^n@uFcOmBCiA]aAFE	21	25
3406	153.5	vlvhAfwbuM~A^n@uFcOmB@e@QeA_@o@_@_@mAa@s@Co@HeEqNSHzBvH	21	27
3407	82.9	vlvhAfwbuM~A^n@uFqIgAYzAo@rAaAbAaAh@	21	24
3408	132.4	vlvhAfwbuM~A^n@uFqIgAYzAo@rAaAbAaAh@yA\\wAH}AOcBk@aAzA_Cj@	21	28
3409	153.5	vlvhAfwbuM~A^r@h@h@zFThEgAl@_HxB}@f@wEtAcAJcBb@}@E[OU[]{A]y@UW{BqI~EwABJ	21	29
3411	122	vlvhAfwbuM~A^f@kEjCZXs@_B{NB}E_@o@MrDNtD_BR	21	31
3412	121.6	vlvhAfwbuM~A^f@kEjCZXs@_B{NB}E_@o@sBMs@MqEqBi@lAAV	21	32
3413	151.3	vlvhAfwbuM~A^n@uFcOmB@e@QeA_@o@_@_@mAa@s@Co@HeEqNxA[xBDClA	21	33
3414	146.8	vlvhAfwbuM~A^n@uFcOmB@e@QeA_@o@_@_@mAa@s@Co@HoGsTKw@@y@]I	21	34
3416	140.1	vlvhAfwbuM~A^n@uFcOmB@e@QeA_@o@w@o@oAU{@Dc@Je@Vk@l@]hAoDc@Hi@}Aa@	21	36
3417	163.9	vlvhAfwbuM~A^f@kEjCZXs@_B{NAiDJiBb@mCfB}F}DsAb@kIDc@Vy@	21	37
3418	167.5	vlvhAfwbuM~A^f@kEjCZXs@_B{NB}E_@o@uCUiDuAp@}AyAq@\\aAl@cK	21	38
3419	184.7	vlvhAfwbuM~A^f@kEjCZXs@_B{NAiDJiBb@mCfB}FcDkA_CSNgCaBMUrE	21	39
3421	161.6	vlvhAfwbuM~A^f@kEjCZXs@_B{NB}E_@o@sBMgAUoU{JRo@TeDBKLD	21	41
3422	201.7	vlvhAfwbuM~A^f@kEjCZXs@_B{NB}E_@o@sBMs@MgJ_EbCuGXaB_DID}@sAe@fAsC	21	42
3423	200.8	vlvhAfwbuM~A^f@kEjCZXs@sAkLKoAB}ESa@KMsBMgAUsIwDbCuGl@sDeCeApBaFP[TO	21	43
3424	220.1	vlvhAfwbuM~A^f@kEjCZXs@_B{NB}E_@o@{Dc@oU{JRo@^}DjGsOkBo@	21	44
3426	226.4	vlvhAfwbuM~A^f@kEjCZXs@sAkLGmHSa@gEq@}YiMyCcA{CY{DTwCyPnCg@Ms@	21	46
3427	247.4	vlvhAfwbuM~A^f@kEjCZXs@_B{NB}E_@o@{Dc@m]{NcCg@}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	21	47
3428	187.8	vlvhAfwbuM~A^f@kEjCZXs@sAkLGmHSa@gEq@}YiMyCcAyAU}B?m@uDPc@d@E	21	48
3429	216.6	vlvhAfwbuM~A^f@kEjCZXs@_B{NB}E_@o@{Dc@m]{NcCg@}B?YgBhCOzC`@TAb@i@@P	21	49
3431	109	vuvhA|lbuMza@}Cp@zIZK	20	1
3432	72.8	vuvhA|lbuMrRyATvCjDW	20	2
3433	32.5	vuvhA|lbuMxIq@NlB	20	3
3434	68.6	vuvhA|lbuMnCUrB~P{Bt@	20	4
3436	71	vuvhA|lbuMM@w@gHnM_AIqA	20	6
3437	81.8	vuvhA|lbuMM@w@gHzIo@I}CNsBPcA	20	7
3438	63.3	vuvhA|lbuMM@w@gHKoAAiDtBBr@oF	20	8
3439	134.7	vuvhA|lbuMM@cAwJAiDJiBb@mC|AgFhCsHnBp@nAqDtHjC	20	10
3441	99.5	vuvhA|lbuMM@cAwJAiDJiBb@mC|AgFhCsHnBp@{@dC	20	9
3442	109.4	vuvhA|lbuMM@[uCnQqA_@}E@sAJo@jA}D`EtAtAJhCKBP	20	12
3443	140.4	vuvhA|lbuMM@[uCnQqA_@}E@sAJo@vAuEzFsPLQvEjBs@pBHB	20	13
3444	99.3	vuvhA|lbuMM@[uCnQqAWsCGuBLwAZkAzCwIrBr@	20	14
3446	101	vuvhA|lbuMM@[uCvl@qE@N	20	16
3447	111.5	vuvhA|lbuMM@[uCde@kDC[wE\\AG	20	17
3448	68.8	vuvhA|lbuMM@[uCnQqAWsCnCS	20	18
3449	127.1	vuvhA|lbuMrRyAz@tMvA_@PfD_FrAAK	20	19
3451	91.1	vuvhA|lbuMM@c@sDYz@zCdVqD^DjA	20	22
3452	121.7	vuvhA|lbuMM@c@sDYz@~Db[gPzEq@cC	20	23
3453	97.3	vuvhA|lbuMM@a@sD[z@t@bG}RgCCiA]aAFE	20	25
3454	129.9	vuvhA|lbuMM@a@sD[z@t@bG}RgCCiAk@qA_@_@s@[mAIqAVeA~@]hACt@Fh@	20	26
3456	101.9	vuvhA|lbuMM@c@sDYz@t@bGkMaBYzAo@rAaAbAaAh@	20	24
3457	151.4	vuvhA|lbuMM@c@sDYz@t@bGkMaBYzAo@rAaAbAaAh@yA\\wAH}AOcBk@aAzA_Cj@	20	28
3458	180.3	vuvhA|lbuMM@c@sDYz@t@bGkMaBYzAo@rAaAbAiAl@mB^yA@wAUkAc@aAzAhArDjA_@BJ	20	29
3459	186.6	vuvhA|lbuMM@c@sDYz@zCdVqD^DtAiDR}KhDm@uBeCn@mA^l@tB	20	30
3461	72.9	vuvhA|lbuMM@w@gHKoAB}EYi@mDa@qEqBi@lAAV	20	32
3462	106.9	vuvhA|lbuMM@cAwJB}E]m@uBOgAUaPaHY`@[fAIrE	20	33
3463	113.5	vuvhA|lbuMM@cAwJB}E]m@uBOgAUiYyLSOi@|@Sr@GA	20	34
3464	190.3	vuvhA|lbuMM@cAwJB}E_@o@{Dc@}YiMyCcA{CY}EZxBxOd@CMaB~BU	20	35
3466	115.2	vuvhA|lbuMM@w@gHKoAAiDJiBb@mCfB}F}DsAb@kIDc@Vy@	20	37
3467	118.8	vuvhA|lbuMM@cAwJB}E_@o@uCUiDuAp@}AyAq@\\aAl@cK	20	38
3468	136	vuvhA|lbuMM@w@gHKoAAiDJiBb@mCfB}FcDkA_CSNgCaBMUrE	20	39
3469	80.4	vuvhA|lbuMM@w@gHKoAB}ESa@KMsBMgAUsIwDl@_B	20	40
3471	153	vuvhA|lbuMM@w@gHKoAB}EYi@WGaBKgAUsIwDbCuGXaB_DID}@sAe@fAsC	20	42
3472	152.1	vuvhA|lbuMM@w@gHKoAB}EYi@WGaBKgAUsIwDbCuGl@sDeCeApBaFP[TO	20	43
3473	171.4	vuvhA|lbuMM@cAwJB}E]m@uBOgAUoU{JRo@NgCNu@jGsOkBo@	20	44
3474	224	vuvhA|lbuMM@cAwJB}E]m@uBOgAUoU{JRo@NgCNu@jGsOqE}A}KwAPq@V]n@Yp@M	20	45
3476	198.7	vuvhA|lbuMM@cAwJB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	20	47
3477	139.1	vuvhA|lbuMM@cAwJB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@d@E	20	48
3478	167.9	vuvhA|lbuMM@cAwJB}E]m@}De@}YiMyCcAyAU}B?YgBhCOzC`@TAb@i@@P	20	49
3479	171.9	vuvhA|lbuMM@w@gHKoAAiDJiBb@mCfB}FcDkA_CSZoFCSWMdDwJlIxC	20	50
3481	159	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEvBXXARo@[cC`S{ATvCjDW	22	2
3482	118.7	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kElCZVs@[cCfJs@NlB	22	3
3483	146.9	zrvhAxccuM?HiDRa@wGx@k@l@kAr@h@bDe@Hn@NFNK@ISeBxC_@x@~G{Bt@	22	4
3484	127.1	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEjCZXs@sAkLhF_@?I	22	5
3486	162.3	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEjCZXs@sAkLzIo@I}CNsBPcA	22	7
3487	143.8	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEjCZXs@_B{NAiDtBBr@oF	22	8
3488	215.2	zrvhAxccuMiD\\a@wGx@k@l@kAf@kEjCZXs@_B{NB}Eh@cEfF{OnBp@nAqDtHjC	22	10
3489	192.9	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEjCZXs@w@yGnQqA_@}ED_BhAgEtB_GUKyA`E	22	11
3491	189.9	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEjCZXs@w@yGnQqA_@}E@sAJo@jA}D`EtAtAJhCKBP	22	12
3492	220.9	zrvhAxccuMiD\\a@wGx@k@l@kAf@kEjCZXs@w@yGnQqA_@}ELcC`J{WvEjBs@pBHB	22	13
3493	179.8	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEjCZXs@w@yGnQqAWsCGuBLwAZkAzCwIrBr@	22	14
3494	228.5	zrvhAxccuMiD\\a@wGx@k@l@kAf@kEjCZXs@w@yGnQqA_@}ELcCvIoWHKxGfCtC~ARbD	22	15
3496	192	zrvhAxccuMiD\\a@wGx@k@l@kAf@kEjCZXs@w@yGde@kDC[yET	22	17
3497	149.3	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEjCZXs@w@yGnQqAWsCnCS	22	18
3498	213.3	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEvBXXARo@[cC`S{Az@tMvA_@PfD_FrAAK	22	19
3499	65.2	zrvhAxccuM?HiDRa@wGx@k@l@kA_B_@	22	21
3501	44.9	zrvhAxccuMN|BgJnCq@cC	22	23
3502	96.2	zrvhAxccuM?HiDReF~AoGwT~@s@b@mAD_AQeAQ_@FE	22	25
3503	128.8	zrvhAxccuM?HiDReF~AoGwT~@s@^_AFg@@e@QeA_@o@_@_@s@[mAIo@H{@^k@l@Wn@Ir@FdA	22	26
3504	171.4	zrvhAxccuM?HiDReF~AoGwTv@k@f@gAHmAQeA_@o@w@o@oAUiAHeEqNSHzBvH	22	27
3506	116.1	zrvhAxccuM?HiDReF~AkEkOmB^yA@wAUkAc@aAzA_Cj@	22	28
3507	113	zrvhAxccuMN|BgAl@_HxB}@f@wEtAcAJyA`@u@@g@Q[_@]{A]y@UW{BqI~EwABJ	22	29
3508	95.5	zrvhAxccuM?HiDR}KhDm@uBsEnAl@tB	22	30
3509	150.9	zrvhAxccuM?HiDReF~AoGwT~@s@d@qAB{@Ec@]aArCkBl@zAfHoB	22	31
3511	169.2	zrvhAxccuM?HiDReF~AoGwTv@k@f@gAHmAQeA_@o@w@o@oAUiAHeEqNxA[xBDClA	22	33
3512	164.7	zrvhAxccuM?HiDReF~AoGwTv@k@f@gAHmAQeA_@o@w@o@oAUiAHoGsTKw@@y@]I	22	34
3513	176.2	zrvhAxccuMN|BgAl@uPvF{Dp@qAc@g@kBs@qAwIq\\y@cHcAyN~BU	22	35
3514	135.2	zrvhAxccuM?HiDReF~AkEkOmB^yA@aBWcB{@u@w@]i@k@gBKkBNmB}Aa@	22	36
3516	199.3	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEjCZXs@_B{NB}E_@o@uCUiDuAp@}AyAq@\\aAl@cK	22	38
3517	216.5	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEjCZXs@_B{NAiDJiBb@mCfB}FcDkA_CSNgCaBMUrE	22	39
3518	160.9	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEjCZXs@_B{NB}E_@o@sBMs@MgJ_El@_B	22	40
3519	193.4	zrvhAxccuM?HiDRa@wGx@k@l@kAf@kEjCZXs@_B{NB}E_@o@sBMgAUoU{JRo@TeDBKLD	22	41
3521	232.6	zrvhAxccuMiD\\a@wGx@k@l@kAf@kEjCZXs@_B{NB}E_@o@gD[gJ_EbCuGl@sDeCeApBaFf@k@	22	43
3522	251.9	zrvhAxccuMiD\\a@wGx@k@l@kAf@kEjCZXs@_B{NB}E_@o@{Dc@oU{JRo@^}DjGsOkBo@	22	44
3523	303.6	zrvhAxccuMN|BgAl@}I`DmJ`C}@Bs@[m@qBs@qAoIo[}@mH}AeSqF_[~Ds@xBLXaFrC^h@oA`Bg@	22	45
3524	239.5	zrvhAxccuMN|BeLnEwEtAgDn@}@Eq@k@]{As@qAwIq\\sCq[qF_[nCg@Ms@	22	46
3526	214	zrvhAxccuMiD\\eF~AoGwTv@k@f@gAHmAQeA_@o@w@o@oAUiAHwGmUAwAf@yBaEoAoDIm@uDPc@d@E	22	48
3527	242.8	zrvhAxccuMiD\\eF~AoGwTpAqAT_ACsAk@qAw@o@oAUiAHwGmUAwAf@yBaEoAoDIYgBhCOzC`@TAb@i@@P	22	49
3528	252.4	zrvhAxccuMiD\\a@wGx@k@l@kAf@kEjCZXs@_B{NAiDn@wFfB}FcDkA_CSZoF[a@dDwJlIxC	22	50
3529	194.1	pfvhAbhcuMkBmGhHuBx@k@l@kAf@kEpCVRo@[cChb@_Dp@zIZK	23	1
3531	117.6	pfvhAbhcuMkBmGhHuBx@k@l@kAf@kEvBXXARo@[cCfJs@NlB	23	3
3532	145.8	pfvhAbhcuMkBmGxH}Bh@c@l@kAr@h@bDe@Hn@NFNK@ISeBxC_@x@~G{Bt@	23	4
3533	126	pfvhAbhcuMkBmGhHuBx@k@l@kAf@kElCZVs@sAkLhF_@?I	23	5
3534	150.4	pfvhAbhcuMkBmGhHuBZQn@o@Zu@f@kEjCZXs@sAkLnM_AIqA	23	6
3536	142.7	pfvhAbhcuMkBmGhHuBZQn@o@Zu@f@kEjCZXs@_B{NAiDtBBr@oF	23	8
3537	214.1	pfvhAbhcuMkBmGdIgCjAeBf@kEjCZXs@_B{NB}Eh@cEfF{OnBp@nAqDtHjC	23	10
3538	191.8	pfvhAbhcuMkBmGhHuBx@k@l@kAf@kEvBXXARo@w@yGnQqA_@}ED_BhAgEtB_GUKyA`E	23	11
3539	178.9	pfvhAbhcuMkBmGdIgCjAeBf@kEjCZXs@_B{NHsGb@mCfF{OnBp@{@dC	23	9
3541	219.8	pfvhAbhcuMkBmGhHuBx@k@l@kAf@kEpCVRo@w@yGnQqA_@}ELcC`J{WvEjBs@pBHB	23	13
3542	178.7	pfvhAbhcuMkBmGhHuBx@k@l@kAf@kEpCVRo@w@yGnQqA_@iGh@cDzCwIrBr@	23	14
3543	227.4	pfvhAbhcuMkBmGhHuBx@k@l@kAf@kEpCVRo@w@yGnQqA_@}ELcC`J{WxGfCtC~ARbD	23	15
3544	180.4	pfvhAbhcuMkBmGhHuBx@k@l@kAf@kEpCVRo@w@yGvl@qE@N	23	16
3546	148.2	pfvhAbhcuMkBmGhHuBx@k@l@kAf@kEvBXXARo@w@yGnQqAWsCnCS	23	18
3547	212.2	pfvhAbhcuMkBmGhHuBx@k@l@kAf@kEpCVRo@[cC`S{Az@tMvA_@PfD_FrAAK	23	19
3548	64.1	pfvhAbhcuMkBmGhHuBb@Wf@i@Zu@_B_@	23	21
3549	85.1	pfvhAbhcuMkBmGhHuBx@k@l@kAf@kEvBXXARo@[cCLA	23	20
3551	65.9	pfvhAbhcuMuGcU~@s@b@mAD_AQeAQ_@FE	23	25
3552	98.5	pfvhAbhcuMuGcU~@s@d@qAB{@Ec@]aAm@o@s@[mAIeAP}@l@_@n@UjAFdA	23	26
3553	141.1	pfvhAbhcuMuGcUv@k@f@gAHmAQeA_@o@w@o@oAUiAHeEqNSHzBvH	23	27
3554	87.7	pfvhAbhcuMuGcUv@k@f@gApDd@]jAc@z@aAbAaAh@	23	24
3556	94.7	pfvhAbhcuMEKmOtEc@gAUW{BqI~EwABJ	23	29
3557	72.5	pfvhAbhcuMEKwDhAm@uBsEnAl@tB	23	30
3558	120.6	pfvhAbhcuMuGcU~@s@d@qAB{@Ec@]aArCkBl@zAfHoB	23	31
3559	152.3	pfvhAbhcuMkBmGhHuBZQn@o@Zu@f@kEjCZXs@sAkLKoAB}ESa@KMsBMs@MqEqBi@lAAV	23	32
3561	134.4	pfvhAbhcuMuGcUv@k@f@gAHmAQeA_@o@w@o@oAUiAHoGsTKw@@y@]I	23	34
3562	156.7	pfvhAbhcuMqEwOqAXy@FmACoASaAa@eA{@o@_Ac@mA_D`Am@oCm@eFoAwP~BU	23	35
3563	104.9	pfvhAbhcuMqEwOmB^yA@aBWcB{@u@w@]i@k@gBKkBNmB}Aa@	23	36
3564	194.6	pfvhAbhcuMkBmGdIgCjAeBf@kEjCZXs@_B{NAiDn@wFfB}F}DsAb@kI\\}A	23	37
3566	215.4	pfvhAbhcuMkBmGhHuBZQn@o@Zu@f@kEjCZXs@_B{NAiDJiBb@mCfB}FcDkA_CSNgCaBMUrE	23	39
3567	159.8	pfvhAbhcuMkBmGhHuBZQn@o@Zu@f@kEjCZXs@_B{NB}E_@o@sBMs@MgJ_El@_B	23	40
3568	176.1	pfvhAbhcuMuGcUv@k@f@gAHmAQeA_@o@w@o@oAUiAHwGmUAwAZiA@Y~CnAGWRo@RwCDYLD	23	41
3569	220.1	pfvhAbhcuMuGcUv@k@f@gAHmAQeA_@o@w@o@oAUiAH{GkV^}C~CnAGWRo@TeD~CaIhD`B	23	42
3571	234.6	pfvhAbhcuMuGcUv@k@f@gAHmAQeA_@o@w@o@oAUiAH{GkV^}C~CnAGWRo@^}DjGsOkBo@	23	44
3572	283.5	pfvhAbhcuMuGcUpAqAT_ACsAk@qAw@o@oAUiAHwGmUAwAf@yBaEoAoDIYgBhCOzC`@TAb@i@|AyFt@}IiGu@h@oA`Bg@	23	45
3573	220	pfvhAbhcuMqEwOkC`@}CWgC}AsAmC_D`AgAcGyB}WqF_[nCg@Ms@	23	46
3574	243.3	pfvhAbhcuMuGcUpAqAT_ACsAk@qAw@o@oAUiAHwGmUAwAf@yBaEoAoDIm@uDPc@b@EDaB|BBnC`@p@kCNoB	23	47
3576	212.5	pfvhAbhcuMuGcUpAqAT_ACsAk@qAw@o@oAUiAHwGmUAwAf@yBaEoAoDIYgBhCOzC`@TAb@i@@P	23	49
3577	251.3	pfvhAbhcuMkBmGdIgCjAeBf@kEjCZXs@_B{NAiDn@wFfB}FcDkA_CSZoF[a@dDwJlIxC	23	50
3578	197.1	h`vhAphbuMjCeBl@zAdHoB`BSPtAl@n@fSyAVrCfNcAp@zIZK	25	1
3579	153.8	h`vhAphbuMjCeBl@zAdHoB`BSPtAl@n@fSyAl@jHjDW	25	2
3581	158.1	h`vhAphbuMjCeB`@z@ZzAFpAMzA|MdBb@rDHn@FDPAFQSeBxC_@x@~G{Bt@	25	4
3582	119	h`vhAphbuMjCeBl@zAdHoB`BSPtAn@n@[qChF_@?I	25	5
3583	142.7	h`vhAphbuMjCeBl@zAdHoB`BSPtAl@n@pQqAWsCcCRIqA	25	6
3584	154.2	h`vhAphbuMjCeBl@zAdHoB`BSPtAn@n@[qCzIo@I}CNsBPcA	25	7
3586	196.2	h`vhAphbuMjCeBl@zAdHoBUwEL}CdBNf@]b@mCfF{OnBp@nAqDtHjC	25	10
3587	175.8	h`vhAphbuMjCeBl@zAdHoB`BSPtAl@n@pQqA_@}ED_B~DgMUKyA`E	25	11
3588	161	h`vhAphbuMjCeBl@zAdHoBQ}BCyAL}CdBNf@]b@mC|AgFhCsHnBp@{@dC	25	9
3589	172.8	h`vhAphbuMjCeBl@zAdHoB`BSPtAl@n@pQqA_@}E@sAvAmF`EtAtAJhCKBP	25	12
3591	162.7	h`vhAphbuMjCeBl@zAdHoB`BSPtAl@n@pQqA_@iGh@cDzCwIrBr@	25	14
3592	211.4	h`vhAphbuMjCeBl@zAdHoB`BSPtAl@n@pQqA_@}ELcC`J{WxGfCtC~ARbD	25	15
3593	164.4	h`vhAphbuMjCeBl@zAdHoB`BSPtAl@n@xl@qE@N	25	16
3594	174.9	h`vhAphbuMjCeBl@zAdHoB`BSPtAl@n@fe@kDC[yET	25	17
3596	208.1	h`vhAphbuMjCeBl@zAdHoB`BSPtAl@n@fSyArAhRvA_@PfD_FrAAK	25	19
3597	118.7	h`vhAphbuMjCeBl@zATxACfBYzA}@dBvBnHhDcAz@y@Zu@_B_@	25	21
3598	91.4	h`vhAphbuMjCeB`@z@ZzAFpAMzA|MdBXs@[cCLA	25	20
3599	123.6	h`vhAphbuMjCeB`@z@ZzAFpAMzA|MdBzAtLqD^DjA	25	22
3601	94.2	h`vhAphbuMjCeB`@z@T|@LtAElAqDe@CiAk@qAw@o@oAUiAHa@Lq@f@_@n@Qp@Ct@Fh@	25	26
3602	136.8	h`vhAphbuMjCeB`@z@T|@LtAElAqDe@@e@QeA_@o@w@o@oAUiAHeEqNSHzBvH	25	27
3603	58.2	h`vhAphbuMjCeB`@z@T|@LnBMzAo@lBaAlAsAx@	25	24
3604	107.7	h`vhAphbuMjCeB`@z@T|@LnBMzAi@bBu@fAeBhAq@RcAN{@BcAI{@OaAa@aAzA_Cj@	25	28
3606	149.3	h`vhAphbuMjCeB`@z@T|@LtAElAO`Aa@hAe@t@s@p@aAh@q@RcANyA@lD|LsEnAl@tB	25	30
3607	54.7	h`vhAphbuMjCeBl@zAfHoB	25	31
3608	112.5	h`vhAphbuMjCeBl@zAdHoBQ}B?qCoAOuAe@}BkAOS	25	32
3609	134.6	h`vhAphbuMjCeB`@z@T|@LtAElAqDe@@e@QeA_@o@w@o@oAUiAHeEqNxA[xBDClA	25	33
3611	178.6	h`vhAphbuMjCeB`@z@T|@LnBMzAo@lBaAlA{A|@qAXy@FmACoASaAa@eA{@o@_Ac@mA_D`Am@oCm@eFoAwP~BU	25	35
3612	123.4	h`vhAphbuMjCeB`@z@T|@LtAElAqDe@CiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	25	36
3613	160.9	h`vhAphbuMjCeBl@zAdHoBQ}BCyAL}C|@wF`AaQDc@Vy@	25	37
3614	167.5	h`vhAphbuMjCeBl@zAdHoBQ}BCyAL}CZuBcAUwEwB\\aAl@cK	25	38
3616	131.2	h`vhAphbuMjCeBl@zAdHoBQ}BCyAPqDwAWsIwDl@_B	25	40
3617	163.7	h`vhAphbuMjCeBl@zAdHoBQ}BCyAPqDwAWoU{JRo@TeDBKLD	25	41
3618	203.8	h`vhAphbuMjCeBl@zAdHoBQ}BCyAPqDwAWsIwDbCuGXaB_DID}@sAe@fAsC	25	42
3619	202.9	h`vhAphbuMjCeBl@zAdHoBQ}BCyAPqDwAWsIwDbCuGl@sDeCeApBaFP[TO	25	43
3621	274.8	h`vhAphbuMjCeBl@zAdHoBQ}BCyAPqDwAWoU{JRo@NgCNu@jGsOqE}A}KwAPq@V]n@Yp@M	25	45
3622	218	h`vhAphbuMjCeB`@z@T|@LtAElAqDe@@e@QeA_@o@w@o@oAUiAHwGmUAwAf@yByCcAyAU}B?_CPwCyPnCg@Ms@	25	46
3623	239	h`vhAphbuMjCeB`@z@T|@LtAElAqDe@@e@QeA_@o@w@o@oAUiAHwGmUAwAf@yBaEoAgAKgB@m@uDPc@b@EDaB|BBnC`@p@kCNoB	25	47
3624	179.4	h`vhAphbuMjCeB`@z@T|@LtAElAqDe@@e@QeA_@o@w@o@oAUiAHwGmUAwAf@yBaEoAgAKgB@m@uDPc@d@E	25	48
3626	224.3	h`vhAphbuMjCeBl@zAdHoBQ}BCyAL}C|@wF\\uFeBKZoFCSWMdDwJlIxC	25	50
3627	201.2	~tuhAbnbuMd@jAb@`@vAb@xBUv@k@f@gAnSjCXs@[cChb@_Dp@zIZK	26	1
3628	165	~tuhAbnbuMd@jAb@`@pBd@xBg@dAcBpSjCVs@[cC`S{ATvCjDW	26	2
3629	124.7	~tuhAbnbuMd@jAb@`@pBd@xBg@dAcBnSjCXs@[cCfJs@NlB	26	3
3631	133.1	~tuhAbnbuMd@jAb@`@h@Vl@Jt@?bAUv@k@f@gApSjCVs@sAkLhF_@?I	26	5
3632	157.5	~tuhAbnbuMd@jAb@`@vAb@xBUv@k@f@gApSjCVs@sAkLnM_AIqA	26	6
3633	168.3	~tuhAbnbuMd@jAb@`@vAb@xBUv@k@f@gApSjCVs@sAkLzIo@I}C`@wD	26	7
3634	149.8	~tuhAbnbuMd@jAb@`@h@Vl@Jt@?bAUv@k@f@gApSjCVs@_B{NAiDtBBr@oF	26	8
3636	198.9	~tuhAbnbuMd@jAb@`@vAb@xBUv@k@f@gApSjCVs@w@yGnQqA_@}ED_B~DgMUKyA`E	26	11
3637	186	~tuhAbnbuMd@jAb@`@vAb@xBUv@k@f@gApSjCVs@_B{NHsGb@mCfF{OnBp@{@dC	26	9
3638	195.9	~tuhAbnbuMd@jAb@`@vAb@xBUv@k@f@gApSjCVs@w@yGnQqA_@}E@sAvAmF`EtAtAJhCKBP	26	12
3639	226.9	~tuhAbnbuMd@jAb@`@vAb@xBUv@k@f@gApSjCVs@w@yGnQqA_@}ELcC`J{WvEjBs@pBHB	26	13
3641	234.5	~tuhAbnbuMd@jAb@`@vAb@xBUv@k@f@gApSjCVs@w@yGnQqA_@}ELcC`J{WxGfCtC~ARbD	26	15
3642	187.5	~tuhAbnbuMd@jAb@`@vAb@xBUv@k@f@gAnSjCXs@w@yGvl@qE@N	26	16
3643	198	~tuhAbnbuMd@jAb@`@vAb@xBUv@k@f@gApSjCVs@w@yGde@kDC[yET	26	17
3644	155.3	~tuhAbnbuMd@jAb@`@vAb@xBUv@k@f@gApSjCVs@w@yGnQqAWsCnCS	26	18
3646	100.1	~tuhAbnbuMd@jAb@`@h@Vl@JpAChDrLpIeCb@Wf@i@Zu@_B_@	26	21
3647	92.2	~tuhAbnbuMd@jAb@`@h@Vl@Jt@?bAUv@k@f@gAnSjCXs@[cCLA	26	20
3648	116.2	~tuhAbnbuMd@jAb@`@h@Vl@JpAChDrLpIeCx@k@l@kA\\PTVn@fI	26	22
3649	155	~tuhAbnbuMd@jAb@`@h@Vl@Jt@?bAUv@k@f@gAnSjC~BrQgPzEq@cC	26	23
3651	107.7	~tuhAbnbuM@DgD~@QqABwBReAXs@lA_Bt@e@~@_@aCeISHzBvH	26	27
3652	67.2	~tuhAbnbuMd@jAb@`@h@Vl@Jt@?bAUv@k@f@gApDd@]jAc@z@aAbAaAh@	26	24
3653	79.9	~tuhAbnbuMd@jAb@`@h@Vl@JpAC`AhDcANyA@wAUkAc@aAzA_Cj@	26	28
3654	87.4	~tuhAbnbuM@DgI`C]RdDjMdGgBBJ	26	29
3656	100.1	~tuhAbnbuMd@jAb@`@h@Vl@JpACf@Qp@c@l@oAHmAQeAQ_@rCkBl@zAfHoB	26	31
3657	131.1	~tuhAbnbuM@DgD~@QqA?aBV{Ah@kAj@w@p@i@~@c@|@Sr@IjA?x@JlA\\NyEnBHR{B@H	26	32
3658	105.5	~tuhAbnbuM@DgD~@QqABwBReAXs@lA_Bt@e@~@_@aCeIxA[xBDClA	26	33
3659	101	~tuhAbnbuM@DgD~@Mu@EoADcAReAXs@lA_Bt@e@~@_@kEgOKw@@y@]I	26	34
3661	44.1	~tuhAbnbuM@DgD~@SoB@cAL_A}Aa@	26	36
3662	201.7	~tuhAbnbuMd@jAb@`@h@Vl@Jt@?bAUv@k@f@gAzRhCXARo@_B{NAiDJiBb@mCfB}F}DsAb@kIDc@Vy@	26	37
3663	190.5	~tuhAbnbuM@DgD~@QqABwBReAXs@lA_Bt@e@~@_@sEaPAwAZiA@YpOlGDc@~BcGl@sDJWRM`@??H	26	38
3664	222.5	~tuhAbnbuMd@jAb@`@h@Vl@Jt@?bAUv@k@f@gAzRhCXARo@_B{NAiDJiBb@mCfB}FcDkA_CSNgCaBMUrE	26	39
3666	142.7	~tuhAbnbuM@DgD~@Mu@EoADcAReAXs@lA_Bt@e@~@_@kEgOKsA^aC~CnAGWRo@RwCDYLD	26	41
3667	186.7	~tuhAbnbuM@DgD~@Mu@EoADcAReAXs@lA_Bt@e@~@_@kEgOKw@@y@ZiA@Y~CnAGWRo@TeD~CaInDvAEH	26	42
3668	210.8	~tuhAbnbuM@DgD~@QqABwBReAXs@lA_Bt@e@~@_@sEaPAwAZiA@Y~CnAGWRo@XqDvAXrFHD}@xCqHP[TO	26	43
3669	201.2	~tuhAbnbuM@DgD~@Mu@EoADcAReAXs@lA_Bt@e@~@_@kEgOKw@@y@ZiA@Y~CnAGWRo@NgCNu@jGsOkBo@	26	44
3671	150.8	~tuhAbnbuM@DgI`CYmAYwAo@uFgAqOUsBqF_[nCg@Ms@	26	46
3672	181	~tuhAbnbuM@DgI`Ce@mBa@uC_@oDcAyNUsBgDgRnCi@jAG|BBnC`@p@kCNoB	26	47
3673	136.5	~tuhAbnbuM@DgI`Ce@mBaAeIcAyNUsBsAoH~BWs@eEPc@d@E	26	48
3674	165.3	~tuhAbnbuM@DgI`Ce@mBa@uC_@oDcAyNUsBsAoH~BW_@wBh@I~AEzC`@TAb@i@@P	26	49
3676	219.1	bvuhAz`buMBJdD]nC`@bCfB`ArBdHoB`BSPtAl@n@fSyAVrCfNcAp@zIZK	27	1
3677	175.8	bvuhAz`buMBJdD]nC`@bCfB`ArBdHoB`BSPtAl@n@fSyAl@jHjDW	27	2
3678	145.1	bvuhAz`buMBJdD]nC`@bCfB`ArBdHoB`BSPtAl@n@lGe@PtCdBMNlB	27	3
3679	180.1	bvuhAz`buMBJpB]dBBnAVpAl@rAvAl@zAVrBMtB|MdBb@rDHn@FDPAFQSeBxC_@x@~G{Bt@	27	4
3681	164.7	bvuhAz`buMBJdD]nC`@bCfB`ArBdHoB`BSPtAl@n@pQqAWsCcCRIqA	27	6
3682	174.7	bvuhAz`buMBJvAYdBCfCh@NyEnBHR{Bb@kAnEnBpDd@f@]b@mCrBb@h@qBrEbB_@tA	27	7
3683	138.4	bvuhAz`buMBJvAYdBCx@JlA\\NyEnBHR{Bb@kAnEnBv@PxBRf@]b@mCrBb@DW	27	8
3684	208.9	bvuhAz`buMBJvAYdBCfCh@NyEnBHR{Bb@kA`FtBnDXVWb@mCfF{OnBp@nAqDtHjC	27	10
3686	173.7	bvuhAz`buMBJvAYdBCx@JlA\\NyEnBHR{Bb@kAnEnBv@P`CP^[b@mC|AgFhCsHnBp@{@dC	27	9
3687	194.8	bvuhAz`buMBJdD]nC`@bCfB`ArBdHoB`BSPtAl@n@pQqA_@}E@sAvAmF`EtAtAJhCKBP	27	12
3688	225.8	bvuhAz`buMBJdD]nC`@bCfB`ArBdHoB`BSPtAl@n@pQqA_@}ELcC`J{WvEjBs@pBHB	27	13
3689	184.7	bvuhAz`buMBJdD]nC`@bCfB`ArBdHoB`BSPtAl@n@pQqA_@iGh@cDzCwIrBr@	27	14
3691	186.4	bvuhAz`buMBJdD]nC`@bCfB`ArBdHoB`BSPtAl@n@xl@qE@N	27	16
3692	196.9	bvuhAz`buMBJdD]nC`@bCfB`ArBdHoB`BSPtAl@n@fe@kDC[yET	27	17
3693	154.2	bvuhAz`buMBJdD]nC`@bCfB`ArBdHoB`BSPtAl@n@pQqAWsCnCS	27	18
3694	230.1	bvuhAz`buMBJdD]nC`@bCfB`ArBdHoB`BSPtAl@n@fSyArAhRvA_@PfD_FrAAK	27	19
3620	222.2	h`vhAphbuMjCeBl@zAdHoBQ}BCyAPqDwAWoU{JRo@NgCNu@jGsOkBo@	25	44
3625	208.2	h`vhAphbuMjCeB`@z@T|@LtAElAqDe@@e@QeA_@o@w@o@oAUiAHwGmUAwAf@yBaEoAgAKgB@YgBh@I~AEzC`@TAb@i@@P	25	49
3630	158.9	~tuhAbnbuMd@jAb@`@h@Vl@Jt@?bAUv@k@f@gAnSjCb@rDHn@FDPAFQSeBxC_@x@~G{Bt@	26	4
3635	221.2	~tuhAbnbuMd@jAb@`@vAb@xBUv@k@f@gApSjCVs@_B{NB}Eh@cEfF{OnBp@nAqDtHjC	26	10
3640	185.8	~tuhAbnbuMd@jAb@`@vAb@xBUv@k@f@gApSjCVs@w@yGnQqA_@iGh@cDzCwIrBr@	26	14
3645	219.3	~tuhAbnbuMd@jAb@`@vAb@xBUv@k@f@gAnSjCXs@[cC`S{Az@tMvA_@PfD_FrAAK	26	19
3650	45.4	~tuhAbnbuMd@jAb@`@h@VfALv@Ef@Q~@s@b@mAD_AQeAQ_@FE	26	25
3655	121.5	~tuhAbnbuMd@jAb@`@h@Vl@JpAC`AhDcANyA@lD|LsEnAl@tB	26	30
3660	87.5	~tuhAbnbuM@DgI`Cm@oCm@eFoAwP~BU	26	35
3665	151.2	~tuhAbnbuM@DgD~@QqABwBReAXs@lA_Bt@e@~@_@sEaPAwAZiA@YpOlGDc@h@mA	26	40
3670	214.9	~tuhAbnbuMeIfCgAcGyB}WqF_[~Ds@xBLXaFrC^h@oA`Bg@	26	45
3675	258.4	~tuhAbnbuMd@jAb@`@h@Vl@Jt@?bAUv@k@f@gApSjCVs@_B{NAiDJiBb@mCfB}FcDkA_CSZoFCSWMdDwJlIxC	26	50
3680	141	bvuhAz`buMBJvAYlACpAJ|@TbAf@~@~@d@r@Z~@dHoB`BSPtAn@n@[qChF_@?I	27	5
3685	197.8	bvuhAz`buMBJdD]nC`@bCfB`ArBdHoB`BSPtAl@n@pQqA_@}ED_B~DgMUKyA`E	27	11
3690	233.4	bvuhAz`buMBJdD]nC`@bCfB`ArBdHoB`BSPtAl@n@pQqA_@}ELcC`J{WxGfCtC~ARbD	27	15
3695	130.3	bvuhAz`buMfAvD}@l@k@fAInANbA\\p@b@`@h@VfALv@EhDrLpIeCb@Wf@i@Zu@_B_@	27	21
3700	30.2	bvuhAz`buMfAvD}@l@_@n@UjAFdA	27	26
3705	76.7	bvuhAz`buMBJvAYlACpAJ|@TbAf@~@~@d@r@Z~@fHoB	27	31
3710	59.4	bvuhAz`buMfAvDe@Vk@l@]hAoDc@Hi@}Aa@	27	36
3715	97.6	bvuhAz`buMBJTGkEgOKsA^aC~CnAGWRo@RwCDYLD	27	41
3720	143.8	bvuhAz`buMBJTGsEaPAwAf@yByCcAyAU}B?_CPwCyPnCg@Ms@	27	46
3725	193.2	f`vhAfwbuMkAgDv@k@f@gAnSjCXs@[cChb@_Dp@zIZK	24	1
3730	149.5	f`vhAfwbuMGBcAkDv@k@f@gApSjCVs@sAkLnM_AIqA	24	6
3735	178	f`vhAfwbuMGBcAkDv@k@f@gAzRhCXARo@_B{NAiDJiBb@mC|AgFhCsHnBp@{@dC	24	9
3740	179.5	f`vhAfwbuMkAgDv@k@f@gApSjCVs@w@yGvl@qE@N	24	16
3745	84.2	f`vhAfwbuMGBcAkDv@k@f@gAnSjCXs@[cCLA	24	20
3750	112.6	f`vhAfwbuMGBcAkDv@k@f@gAHmAQeA_@o@w@o@oAUiAHeEqNSHzBvH	24	27
3755	124.4	f`vhAfwbuMGBcAkDp@c@^m@T_ACsAk@qA_@_@s@[~@kDl@RNyEnBHR{B@H	24	32
3760	193.7	f`vhAfwbuMGBcAkDv@k@f@gAzRhCT@Vs@_B{NAiDJiBb@mCfB}F}DsAb@kIDc@Vy@	24	37
3765	191.6	f`vhAfwbuMGBcAkDv@k@f@gAHmAQeA_@o@w@o@oAUiAHoGsTKsA^aC~CnAGWRo@TeD~CaInDvAEH	24	42
3770	213.9	f`vhAfwbuMq@RaBPmACoASaAa@eA{@o@_Ac@mA_D`Am@oCu@kGgAqOUsBgDgRnCi@jAG|BBnC`@p@kCNoB	24	47
3775	206.1	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gAnSjCXs@[cC`S{ATvCjDW	28	2
3780	209.4	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gApSjCVs@sAkLzIo@I}C`@wD	28	7
3785	237	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gApSjCVs@w@yGnQqA_@}E@sAvAmF`EtAtAJhCKBP	28	12
3790	239.1	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gAnSjCXs@w@yGde@kDC[yET	28	17
3795	150	pnuhAzzbuM]TGXt@~CfK}CdApD~M_Ex@k@l@kAr@h@n@fI	28	22
3800	108.3	pnuhAzzbuMMD}A{FdI_CXh@b@`@~@^p@Dv@E`Aa@d@c@^_ApDd@]jAc@z@aAbAaAh@	28	24
3805	123.6	pnuhAzzbuMMDwCeLj@QTe@zCeRRe@pCy@~BDClA	28	33
3810	208.1	pnuhAzzbuMMDwCeLy@cHcAyNUsBsAoHnD[rBJh@LdTvIDc@~BcGl@sDJWRM`@??H	28	38
3815	228.4	pnuhAzzbuMMDwCeLy@cHcAyNUsBsAoHnD[rBJxAb@bGbCGWRo@XqDvAXrFHD}@xCqHP[TO	28	43
3820	130.2	pnuhAzzbuMMDwCeLy@cHcAyNUsBsAoH~BWs@eEPc@d@E	28	48
3825	140.1	jwuhAn~buM~@bDrR{Fh@c@l@kAf@kEvBXXARo@[cCfJs@NlB	29	3
3830	165.2	jwuhAn~buM~@bDrR{Fh@c@l@kAf@kElCZVs@_B{NAiDtBBr@oF	29	8
3835	242.3	jwuhAn~buM~@bDfSkGbA_Bf@kEjCZXs@w@yGnQqA_@}ELcC`J{WvEjBs@pBHB	29	13
3840	170.7	jwuhAn~buM~@bDrR{Fh@c@l@kAf@kEjCZXs@w@yGnQqAWsCnCS	29	18
3845	143.1	jwuhAn~buM~@bDhMwDbB`GvAe@hDSNrBgJnCq@cC	29	23
3850	90.9	jwuhAn~buM~@bDbCs@wBqHwAUkAc@aAzA_Cj@	29	28
3855	164.3	jwuhAn~buM~@bDxH}BiDuLp@c@^m@Rs@B{@QeA_@o@_@_@mAa@s@Co@HoGsTKw@@y@]I	29	34
3860	237.9	jwuhAn~buM~@bDbRsFx@k@l@kAf@kEjCZXs@_B{NAiDJiBb@mCfB}FcDkA_CSNgCaBMUrE	29	39
3865	264.5	jwuhAn~buM~@bDxH}BiDuLv@k@f@gAHmAQeA_@o@w@o@oAUiAH{GkV^}C~CnAGWRo@^}DjGsOkBo@	29	44
3870	239.6	jwuhAn~buM~@bDbCs@wBqHaBWcB{@eAkAq@cB_D`Ae@mBa@uC_@oDcAyNUsBsAoH~BW_@wBh@I~AEzC`@TAb@i@@P	29	49
3875	195	~yuhAplcuMaCz@y@_By@}CdYoIx@k@l@kAr@h@bDe@Hn@NFPUSeBxC_@x@~G{Bt@	30	4
3880	263.3	~yuhAplcuMaCz@y@_By@}CtYwIh@c@l@kAf@kEpCVRo@_B{NB}Eh@cEfF{OnBp@nAqDtHjC	30	10
3885	227.9	~yuhAplcuMaCz@y@_By@}ChZgJbA_Bf@kEjCZXs@w@yGnQqA_@iGh@cDzCwIrBr@	30	14
3890	261.4	~yuhAplcuMaCz@y@_By@}CtYwIh@c@l@kAf@kEpCVRo@[cC`S{Az@tMvA_@PfD_FrAAK	30	19
3895	122.5	~yuhAplcuM@DcCt@c@gAUWy@}CzOyEiDuL~@s@b@mAD_AQeAQ_@FE	30	25
3900	64.9	~yuhAplcuM@DcCt@c@gAUW{BqI~EwABJ	30	29
3905	128.1	~yuhAplcuM@DcCt@c@gAUWoIo[aAeIcAyN~BU	30	35
3910	209	~yuhAplcuM@DcCt@c@gAUWy@}CtYwIh@c@l@kAf@kEjCZXs@_B{NB}E_@o@sBMs@MgJ_El@_B	30	40
3915	255.5	~yuhAplcuMaCz@y@_BcIoZiAmI}AeSqF_[~Ds@xBLXaFrC^h@oA`Bg@	30	45
3920	300.5	~yuhAplcuMaCz@y@_By@}CtYwIh@c@l@kAf@kEpCVRo@_B{NAiDn@wFfB}FcDkA_CSZoF[a@dDwJlIxC	30	50
3925	64.3	jovhAvdbuM~ASPtAn@n@[qChF_@?I	31	5
3930	121.1	jovhAvdbuM~ASPtAl@n@pQqA_@}ED_BhAgEtB_GUKyA`E	31	11
3935	156.7	jovhAvdbuM~ASPtAl@n@pQqA_@}ELcC`J{WxGfCtC~ARbD	31	15
3940	126.9	jovhAvdbuMgHnBTxACfBYzA}@dBvBnHhDcAz@y@Zu@_B_@	31	21
3945	102.4	jovhAvdbuMgHnBTxACfBqDe@CiAk@qAw@o@oAUiAHa@Lq@f@_@n@Qp@Ct@Fh@	31	26
3950	157.5	jovhAvdbuMgHnBVrBI`Bm@vBgAvA}@l@gA^cANyA@lD|LsEnAl@tB	31	30
3696	113.4	bvuhAz`buMBJpB]dBB|A\\xAz@h@j@d@r@d@|ALnBMzA|MdBXs@[cCLA	27	20
3697	145.6	bvuhAz`buMBJpB]dBB|A\\xAz@h@j@d@r@d@|ALnBMzA|MdBzAtLqD^DjA	27	22
3698	176.2	bvuhAz`buMBJpB]dBB|A\\xAz@h@j@d@r@d@|ALnBMzA|MdB~BrQgPzEq@cC	27	23
3699	75.6	bvuhAz`buMfAvDe@Vk@l@Wn@InARjAXh@b@`@~@^lABbAUp@c@^m@TiACiA]aAFE	27	25
3701	80.2	bvuhAz`buMBJvAYlACp@BnAVfB`A|@bA`@z@T|@LtAElAO`Aa@hAe@t@s@p@aAh@	27	24
3702	110.1	bvuhAz`buMfAvD}@l@k@fAInANbA\\p@b@`@h@VfALv@E`AhDcANyA@wAUkAc@aAzA_Cj@	27	28
3703	117.6	bvuhAz`buMfAvD}@l@_@n@UjAHjAgI`C]RdDjMdGgBBJ	27	29
3704	151.7	bvuhAz`buMfAvD}@l@k@fAInANbA\\p@b@`@h@VfALv@E`AhDcANyA@lD|LsEnAl@tB	27	30
3706	86	bvuhAz`buMBJvAYdBCx@JlA\\NyEnBHR{B@H	27	32
3707	60.4	bvuhAz`buMBJTGaCeIxA[xBDClA	27	33
3708	55.9	bvuhAz`buMBJTGkEgOKw@@y@]I	27	34
3709	110.9	bvuhAz`buMBJTGaCeI}@\\KPaAxFw@Cs@Du@}J	27	35
3711	179.2	bvuhAz`buMBJpB]dBB|A\\xAz@`AmAPiBnBLTkBtAd@nANLyB|@wF|@sP\\wA	27	37
3712	145.4	bvuhAz`buMBJTGsEaPAwAZiA@YpOlGDc@~BcGl@sDJWRM`@??H	27	38
3713	181.7	bvuhAz`buMBJTGsEaPAwAZiA@YpOlGDc@~BcGl@sDRa@VET@Ex@|AHUrE	27	39
3714	106.1	bvuhAz`buMBJTGsEaPAwAZiA@YpOlGDc@h@mA	27	40
3716	141.6	bvuhAz`buMBJTGsEaPAwAZiA@Y~CnAGWRo@TeD~CaInDvAEH	27	42
3717	165.7	bvuhAz`buMBJTGsEaPAwAZiA@Y~CnAGWRo@XqDvAXrFHD}@xCqHP[TO	27	43
3718	156.1	bvuhAz`buMBJTGkEgOKw@@y@ZiA@Y~CnAGWRo@NgCNu@jGsOkBo@	27	44
3719	205	bvuhAz`buMBJTGsEaPAwAf@yBaEoAgAKgB@YgBh@I~AEzC`@TAb@i@|AyFPsAb@iGiGu@Pq@V]n@Yp@M	27	45
3721	164.8	bvuhAz`buMBJTGsEaPAwAf@yBaEoAgAKgB@k@mDHe@h@KDaB|BBnC`@p@kCNoB	27	47
3722	105.2	bvuhAz`buMBJTGsEaPAwAf@yBaEoAgAKgB@m@uDPc@d@E	27	48
3723	134	bvuhAz`buMBJTGsEaPAwAf@yBaEoAgAKgB@YgBh@I~AEzC`@TAb@i@@P	27	49
3724	230.8	bvuhAz`buMBJTGsEaPAwA\\cBpOlGdCgHx@kEt@MJiA^Y|Bj@dDwJlIxC	27	50
3726	157	f`vhAfwbuMkAgDv@k@f@gAnSjCXs@[cC`S{ATvCjDW	24	2
3727	116.7	f`vhAfwbuMGBcAkDv@k@f@gAnSjCXs@[cCfJs@NlB	24	3
3728	150.9	f`vhAfwbuMGBcAkDv@k@f@gAnSjCb@rDHn@FDPAFQSeBxC_@x@~G{Bt@	24	4
3729	125.1	f`vhAfwbuMGBcAkDv@k@f@gApSjCVs@sAkLhF_@?I	24	5
3731	160.3	f`vhAfwbuMGBcAkDv@k@f@gApSjCVs@sAkLzIo@I}CNsBPcA	24	7
3732	141.8	f`vhAfwbuMGBcAkDv@k@f@gAzRhCXARo@_B{NAiDtBBr@oF	24	8
3733	213.2	f`vhAfwbuMkAgDv@k@f@gApSjCVs@_B{NB}Eh@cEfF{OnBp@nAqDtHjC	24	10
3734	190.9	f`vhAfwbuMkAgDv@k@f@gApSjCVs@w@yGnQqA_@}ED_B~DgMUKyA`E	24	11
3736	187.9	f`vhAfwbuMkAgDv@k@f@gApSjCVs@w@yGnQqA_@}E@sAvAmF`EtAtAJhCKBP	24	12
3737	218.9	f`vhAfwbuMkAgDv@k@f@gApSjCVs@w@yGnQqA_@}ELcC`J{WvEjBs@pBHB	24	13
3738	177.8	f`vhAfwbuMkAgDv@k@f@gApSjCVs@w@yGnQqA_@iGh@cDzCwIrBr@	24	14
3739	226.5	f`vhAfwbuMkAgDv@k@f@gApSjCVs@w@yGnQqA_@}ELcC`J{WxGfCtC~ARbD	24	15
3741	190	f`vhAfwbuMkAgDv@k@f@gApSjCVs@w@yGde@kDC[yET	24	17
3742	147.3	f`vhAfwbuMkAgDv@k@f@gApSjCVs@w@yGnQqAWsCnCS	24	18
3743	211.3	f`vhAfwbuMkAgDv@k@f@gAnSjCXs@[cC`S{Az@tMvA_@PfD_FrAAK	24	19
3744	78.5	f`vhAfwbuMq@RfBhGpIeCb@Wf@i@Zu@_B_@	24	21
3746	94.6	f`vhAfwbuMq@RfBhGpIeCx@k@l@kA\\PTVn@fI	24	22
3747	135	f`vhAfwbuMq@RfBhGvDiAbB`GvAe@hDSNrBgJnCq@cC	24	23
3748	37.4	f`vhAfwbuMGBcAkD~@s@b@mAD_AQeAQ_@FE	24	25
3749	70	f`vhAfwbuMGBcAkDp@c@^m@Rs@B{@QeA_@o@_@_@s@[mAIo@H{@^k@l@Wn@Ir@FdA	24	26
3751	49.5	f`vhAfwbuMyA\\wAH}AOcBk@aAzA_Cj@	24	28
3752	78.4	f`vhAfwbuMyA\\wAH}AOcBk@aAzAhArDjA_@BJ	24	29
3753	91.1	f`vhAfwbuMyA\\uBFlD|LsEnAl@tB	24	30
3754	92.1	f`vhAfwbuMGBcAkD~@s@d@qAB{@Ec@]aArCkBl@zAfHoB	24	31
3756	110.4	f`vhAfwbuMGBcAkDv@k@f@gAHmAQeA_@o@w@o@oAUiAHeEqNxA[xBDClA	24	33
3757	105.9	f`vhAfwbuMGBcAkDv@k@f@gAHmAQeA_@o@w@o@oAUiAHoGsTKw@@y@]I	24	34
3758	120.4	f`vhAfwbuMq@RaBPmACoASaAa@eA{@o@_Ac@mA_D`Am@oCm@eFoAwP~BU	24	35
3759	68.6	f`vhAfwbuMyA\\uBFaBWcB{@u@w@]i@k@gBKkBNmB}Aa@	24	36
3761	191.5	f`vhAfwbuMGBcAkDp@c@^m@T_ACsAk@qA_@_@s@[~@kDl@RNyEnBHR{Bl@{AuCmABQ~BcGt@aEVW`@??H	24	38
3762	214.5	f`vhAfwbuMGBcAkDv@k@f@gAzRhCT@Vs@_B{NAiDJiBb@mCfB}FcDkA_CSNgCaBMUrE	24	39
3763	152.2	f`vhAfwbuMGBcAkDp@c@^m@T_ACsAk@qA_@_@s@[~@kDl@RNyEnBHR{Bl@{AuCmAl@_B	24	40
3764	147.6	f`vhAfwbuMGBcAkDv@k@f@gAHmAQeA_@o@w@o@oAUiAHwGmUAwAZiA@Y~CnAGWRo@RwCDYLD	24	41
3766	215.7	f`vhAfwbuMGBcAkDv@k@f@gAHmAQeA_@o@w@o@oAUiAHoGsTKw@@y@ZiA@Y~CnAGWRo@XqDvAXrFHD}@xCqHP[TO	24	43
3767	206.1	f`vhAfwbuMkAgDv@k@f@gAHmAQeA_@o@w@o@oAUiAH{GkV^}C~CnAGWRo@^}DjGsOkBo@	24	44
3768	247.8	f`vhAfwbuMsCd@}CWgC}AsAmC_D`AgAcGyB}WqF_[~Ds@xBLXaFrC^h@oA`Bg@	24	45
3769	183.7	f`vhAfwbuMsCd@}CWgC}AsAmC_D`AgAcGyB}WqF_[nCg@Ms@	24	46
3771	155.2	f`vhAfwbuMGBcAkDv@k@f@gAHmAQeA_@o@w@o@oAUiAHwGmUAwAf@yBaEoAgAKgB@m@uDPc@d@E	24	48
3772	184	f`vhAfwbuMGBcAkDp@c@^m@T_ACsAk@qAw@o@oAUiAHwGmUAwAf@yBaEoAgAKgB@YgBh@I~AEzC`@TAb@i@@P	24	49
3773	250.4	f`vhAfwbuMGBcAkDv@k@f@gAzRhCXARo@_B{NAiDJiBb@mCfB}FcDkA_CSZoFCSWMdDwJlIxC	24	50
3774	242.3	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gAnSjCXs@[cChb@_Dp@zIZK	28	1
3776	165.8	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gAnSjCXs@[cCfJs@NlB	28	3
3777	172.2	pnuhAzzbuMe@n@zHvZI|As@`@o@]@w@\\i@nAu@bBm@fHyA`ViHm@sGTI	28	4
3778	174.2	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gApSjCVs@sAkLhFi@	28	5
3779	198.6	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gApSjCVs@sAkLnM_AIqA	28	6
3781	190.9	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gApSjCVs@_B{NAiDtBBr@oF	28	8
3782	262.3	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gApSjCVs@_B{NB}Eh@cEfF{OnBp@nAqDtHjC	28	10
3783	240	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gApSjCVs@w@yGnQqA_@}ED_B~DgMUKyA`E	28	11
3784	227.1	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gApSjCVs@_B{NHsGb@mCfF{OnBp@{@dC	28	9
3786	268	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gApSjCVs@w@yGnQqA_@}ELcC`J{WvEjBs@pBHB	28	13
3787	226.9	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gApSjCVs@w@yGnQqA_@iGh@cDzCwIrBr@	28	14
3788	275.6	pnuhAzzbuMkBuFdI_C|@jAvAb@xBU~AsBnSjCXs@w@yGnQqA_@}ELcC`J{WnLfFRbD	28	15
3789	228.6	pnuhAzzbuMkBuFdI_C|@jAvAb@xBU~AsBnSjCXs@w@yGxl@aE	28	16
3791	196.4	pnuhAzzbuMMD}A{FdI_CXh@lAx@~BFxAu@l@oApSjCVs@w@yGnQqAWsCnCS	28	18
3792	260.4	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gAnSjCXs@[cC`S{Az@tMvA_@PfD_FrAAK	28	19
3793	133.9	pnuhAzzbuM]TGXt@~CfK}CdApDnNgEh@c@l@kA_B_@	28	21
3794	133.3	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gAnSjCXs@[cCLA	28	20
3796	190.4	pnuhAzzbuM]TGXt@~CfK}CdApDdIcCbB`GvAe@hDSNrBgJnCq@cC	28	23
3797	86.5	pnuhAzzbuMMD}A{FdI_CXh@b@`@~@^lABbAU~@s@b@mAD_AQeAQ_@FE	28	25
3798	76.4	pnuhAzzbuMMD}A{F~C}@]oBBwBnDb@Ct@Fh@	28	26
3799	116.5	pnuhAzzbuMMDwCeLj@QTe@zCeRRe@h@SzBvH	28	27
3801	48.1	pnuhAzzbuM]TGXt@~CdGgBBJ	28	29
3802	97.1	pnuhAzzbuM]TGXt@~CxDgAbDlL	28	30
3803	141.2	pnuhAzzbuMMD}A{FdI_CXh@b@`@h@VfALv@Ef@Qp@c@l@oAHmAQeAQ_@rCkBl@zAfHoB	28	31
3804	153.6	pnuhAzzbuMMD}A{F~C}@YsAEgBNuAr@gBj@w@p@i@~@c@|@Sr@IjA?x@JlA\\NyEnBHR{B@H	28	32
3806	122.9	pnuhAzzbuMMDwCeLy@cHcAyNjGo@hBg@YgAAwA]I	28	34
3807	81.2	pnuhAzzbuMMDwCeLy@cH_AcNCU~BU	28	35
3808	51.9	pnuhAzzbuMMDwCeLj@QLOp@eD	28	36
3809	242.8	pnuhAzzbuMMD}A{FdI_C|@jAvAb@xBUv@k@f@gAtSfCRo@_B{NAiDn@wFfB}F}DsAb@kI\\}A	28	37
3811	244.4	pnuhAzzbuMMDwCeLy@cHcAyNiBcLnD[|CXdTvIdCgHl@sDj@g@T@Ex@|AHUrE	28	39
3812	168.8	pnuhAzzbuMMDwCeLy@cHcAyNUsBsAoHnD[rBJh@LdTvIDc@h@mA	28	40
3813	160.3	pnuhAzzbuMMDwCeLy@cHcAyNUsBsAoHnD[rBJxAb@bGbCGWRo@RwCDYLD	28	41
3814	204.3	pnuhAzzbuMMDwCeLy@cHcAyNUsBsAoHnD[rBJxAb@bGbCGWRo@TeD~CaInDvAEH	28	42
3816	208.3	pnuhAzzbuMMDwCeLy@cHcAyNiBcL~BW_@wBhCOzC`@p@_@dBeGt@}IrC`@dBl@	28	44
3817	208.6	pnuhAzzbuMMDwCeLsCq[qF_[~Ds@xBLXaFrC^h@oA`Bg@	28	45
3818	144.5	pnuhAzzbuMMDwCeLsCq[qF_[nCg@Ms@	28	46
3819	174.7	pnuhAzzbuMMDwCeLsCq[gDgRzEq@|BBnC`@p@kCNoB	28	47
3821	159	pnuhAzzbuMMDwCeLy@cHcAyNUsBsAoH~BW_@wBh@I~AEzC`@TAb@i@@P	28	49
3822	271.6	pnuhAzzbuMMDwCeLsCq[aJ{f@z^gCr@JpN`IpMbFGPhDlA	28	50
3823	216.6	jwuhAn~buM~@bDrR{Fh@c@l@kAf@kEpCVRo@[cChb@_Dp@zIZK	29	1
3824	180.4	jwuhAn~buM~@bDrR{Fh@c@l@kAf@kEpCVRo@[cC`S{ATvCjDW	29	2
3826	168.3	jwuhAn~buM~@bDbRsFx@k@l@kAr@h@bDe@Hn@XBFQSeBxC_@x@~G{Bt@	29	4
3827	148.5	jwuhAn~buM~@bD|QqFh@Yf@i@Zu@f@kEjCZXs@sAkLhF_@?I	29	5
3828	172.9	jwuhAn~buM~@bDrR{Fh@c@l@kAf@kEjCZXs@sAkLnM_AIqA	29	6
3829	183.7	jwuhAn~buM~@bDbRsFj@_@^a@Zu@f@kEjCZXs@sAkLzIo@I}CNsBPcA	29	7
3831	236.6	jwuhAn~buM~@bDrR{Fh@c@l@kAf@kElCZVs@_B{NB}Eh@cEfF{OnBp@nAqDtHjC	29	10
3832	214.3	jwuhAn~buM~@bDbRsFx@k@l@kAf@kEjCZXs@w@yGnQqA_@}ED_B~DgMUKyA`E	29	11
3833	201.4	jwuhAn~buM~@bDrR{Fh@c@l@kAf@kElCZVs@_B{NAiDJiBb@mC|AgFhCsHnBp@{@dC	29	9
3834	211.3	jwuhAn~buM~@bDfSkGbA_Bf@kEjCZXs@w@yGnQqA_@}E@sAvAmF`EtAtAJhCKBP	29	12
3836	201.2	jwuhAn~buM~@bDfSkGbA_Bf@kEjCZXs@w@yGnQqA_@iGh@cDzCwIrBr@	29	14
3837	249.9	jwuhAn~buM~@bDbRsFx@k@l@kAf@kEjCZXs@w@yGnQqA_@}ELcC`J{WxGfCtC~ARbD	29	15
3838	202.9	jwuhAn~buM~@bD~ReGjAeBf@kEjCZXs@w@yGvl@qE@N	29	16
3839	213.4	jwuhAn~buM~@bD~ReGjAeBf@kEjCZXs@w@yGde@kDC[yET	29	17
3841	234.7	jwuhAn~buM~@bDbRsFx@k@l@kAf@kEpCVRo@[cC`S{Az@tMvA_@PfD_FrAAK	29	19
3842	86.6	jwuhAn~buM~@bDrR{Fh@c@l@kA_B_@	29	21
3843	107.6	jwuhAn~buM~@bDrR{Fh@c@l@kAf@kEvBXXARo@[cCLA	29	20
3844	102.7	jwuhAn~buM~@bDbRsFx@k@l@kAr@h@n@fI	29	22
3846	95.8	jwuhAn~buM~@bDxH}BiDuL~@s@b@mAD_AQeAQ_@FE	29	25
3847	119.8	jwuhAn~buM~@bDbCs@wBqHwAUkAc@eA{@o@_A]}@SeAEoADcAnDb@Ct@Fh@	29	26
3848	171	jwuhAn~buM~@bDxH}BiDuLv@k@f@gAHmAQeA_@o@w@o@oAUiAHeEqNSHzBvH	29	27
3849	117.6	jwuhAn~buM~@bDxH}BiDuLv@k@f@gApDd@]jAc@z@aAbAaAh@	29	24
3851	55.2	jwuhAn~buMrBjHmA^l@tB	29	30
3852	150.5	jwuhAn~buM~@bDxH}BiDuL~@s@d@qAB{@Ec@]aArCkBl@zAfHoB	29	31
3853	174.8	jwuhAn~buM~@bDbRsFx@k@l@kAf@kEjCZXs@sAkLKoAB}ESa@KMsBMs@MqEqBi@lAAV	29	32
3854	168.8	jwuhAn~buM~@bDxH}BiDuLv@k@f@gAHmAQeA_@o@w@o@oAUiAHeEqNxA[xBDClA	29	33
3856	161.8	jwuhAn~buM~@bDbCs@wBqHaBWcB{@eAkAq@cB_D`AYmAYwAo@uFgAqO~BU	29	35
3857	110	jwuhAn~buM~@bDbCs@wBqHwAUkAc@eA{@o@_Ac@mAQqAAkANuA}Aa@	29	36
3858	217.1	jwuhAn~buM~@bDrR{Fh@c@l@kAf@kEpCVRo@_B{NAiDn@wFfB}F}DsAb@kI\\}A	29	37
3859	220.7	jwuhAn~buM~@bDbRsFx@k@l@kAf@kEjCZXs@_B{NB}E_@o@uCUiDuAp@}AyAq@\\aAl@cK	29	38
3861	182.3	jwuhAn~buM~@bDbRsFx@k@l@kAf@kEjCZXs@_B{NB}E_@o@sBMs@MgJ_El@_B	29	40
3862	206	jwuhAn~buM~@bDxH}BiDuLv@k@f@gAHmAQeA_@o@w@o@oAUiAHwGmUAwAZiA@Y~CnAGWRo@RwCDYLD	29	41
3863	250	jwuhAn~buM~@bDxH}BiDuLpAqAVoBQeA_AoAmAa@cBDoGsTIqB\\cB~CnAGWRo@TeD~CaIhD`B	29	42
3864	254	jwuhAn~buM~@bDbRsFx@k@l@kAf@kEjCZXs@sAkLGmHSa@gEq@sIwDbCuGl@sDeCeApBaFf@k@	29	43
4043	84.7	jyuhApxauMBmA_CEgBd@bEnN}@l@_@n@UjAFdA	33	26
3866	289.2	jwuhAn~buM~@bDbCs@wBqHaBWcB{@eAkAq@cB_D`AgAcGyB}WqF_[~Ds@xBLXaFrC^h@oA`Bg@	29	45
3867	225.1	jwuhAn~buM~@bDbCs@wBqHaBWcB{@eAkAq@cB_D`Ae@mB}@mH}AeSqF_[nCg@Ms@	29	46
3868	255.3	jwuhAn~buM~@bDbCs@wBqHaBWcB{@eAkAq@cB_D`AgAcGyB}WgDgRzEq@|BBnC`@p@kCNoB	29	47
3869	210.8	jwuhAn~buM~@bDbCs@wBqHaBWcB{@eAkAq@cB_D`Ae@mBaAeIcAyNUsBsAoH~BWs@eEPc@d@E	29	48
3871	273.8	jwuhAn~buM~@bDrR{Fh@c@l@kAf@kEpCVRo@_B{NAiDn@wFfB}FcDkA_CSZoF[a@dDwJlIxC	29	50
3872	243.3	~yuhAplcuMaCz@y@_By@}CtYwIh@c@l@kAf@kEpCVRo@[cChb@_Dp@zIZK	30	1
3873	207.1	~yuhAplcuMaCz@y@_By@}CtYwIh@c@l@kAf@kEpCVRo@[cC`S{ATvCjDW	30	2
3874	166.8	~yuhAplcuMaCz@y@_By@}CtYwIh@c@l@kAf@kEpCVRo@[cCfJs@NlB	30	3
3876	175.2	~yuhAplcuM@DcCt@c@gAUWy@}CdYoIb@Wf@i@Zu@f@kEjCZXs@sAkLhF_@?I	30	5
3877	199.6	~yuhAplcuMaCz@y@_By@}ChZgJbA_Bf@kEjCZXs@sAkLnM_AIqA	30	6
3878	210.4	~yuhAplcuMaCz@y@_By@}CdYoIx@k@l@kAf@kEjCZXs@sAkLzIo@I}C`@wD	30	7
3879	191.9	~yuhAplcuM@DcCt@c@gAUWy@}CtYwIh@c@l@kAf@kEvBXXARo@_B{NAiDtBBr@oF	30	8
3881	241	~yuhAplcuMaCz@y@_By@}ChZgJbA_Bf@kEjCZXs@w@yGnQqA_@}ED_B~DgMUKyA`E	30	11
3882	228.1	~yuhAplcuMaCz@y@_By@}CtYwIh@c@l@kAf@kEpCVRo@_B{NHsGb@mCfF{OnBp@{@dC	30	9
3883	238	~yuhAplcuMaCz@y@_By@}ChZgJbA_Bf@kEjCZXs@w@yGnQqA_@}E@sAvAmF`EtAtAJhCKBP	30	12
3884	269	~yuhAplcuMaCz@y@_By@}ChZgJbA_Bf@kEjCZXs@w@yGnQqA_@}ELcC`J{WvEjBs@pBHB	30	13
3886	276.6	~yuhAplcuMaCz@y@_By@}ChZgJbA_Bf@kEjCZXs@w@yGnQqA_@}ELcC`J{WxGfCtC~ARbD	30	15
3887	229.6	~yuhAplcuMaCz@y@_By@}ChZgJbA_Bf@kEjCZXs@w@yGvl@qE@N	30	16
3888	240.1	~yuhAplcuMaCz@y@_By@}ChZgJbA_Bf@kEjCZXs@w@yGde@kDC[yET	30	17
3889	197.4	~yuhAplcuMaCz@y@_By@}CtYwIh@c@l@kAf@kEjCZXs@w@yGnQqAWsCnCS	30	18
3891	113.3	~yuhAplcuM@DcCt@c@gAUWy@}CtYwIh@c@l@kA_B_@	30	21
3892	134.3	~yuhAplcuM@DcCt@c@gAUWy@}CtYwIh@c@l@kAf@kEvBXXARo@[cCLA	30	20
3893	129.4	~yuhAplcuM@DcCt@c@gAUWy@}CdYoIx@k@l@kAr@h@n@fI	30	22
3894	169.8	~yuhAplcuM@DcCt@c@gAUWy@}CjTsGbB`GvAe@hDSNrBgJnCq@cC	30	23
3896	123.3	~yuhAplcuM@DcCt@c@gAUW}GgW~C}@]oBBwBnDb@Ct@Fh@	30	26
3897	163.4	~yuhAplcuM@DcCt@c@gAUWwIq\\j@QTe@zCeRRe@h@SzBvH	30	27
3898	144.3	~yuhAplcuM@DcCt@c@gAUWy@}CzOyEiDuLv@k@f@gApDd@]jAc@z@aAbAaAh@	30	24
3899	100.9	~yuhAplcuM@DcCt@c@gAUW{BqIrCw@iAsD_Cj@	30	28
3901	177.2	~yuhAplcuM@DcCt@c@gAUWy@}CzOyEiDuL~@s@d@qAB{@Ec@]aArCkBl@zAfHoB	30	31
3902	200.5	~yuhAplcuM@DcCt@c@gAUW}GgW~C}@]oB?aBb@uBx@wAn@k@z@i@lBc@r@CjABlBd@NyEnBHR{B@H	30	32
3903	170.5	~yuhAplcuM@DcCt@c@gAUWwIq\\j@QTe@zCeRRe@pCy@~BDClA	30	33
3904	169.8	~yuhAplcuM@DcCt@c@gAUWoIo[}@mHgAqOjGo@hBg@YgAAwA]I	30	34
3906	98.8	~yuhAplcuM@DcCt@c@gAUWuGkVaAeEj@QLOp@eD	30	36
3907	243.8	~yuhAplcuMaCz@y@_By@}CtYwIh@c@l@kAf@kEjCZXs@_B{NAiDn@wFfB}F}DsAb@kI\\}A	30	37
3908	247.4	~yuhAplcuMaCz@y@_By@}CtYwIh@c@l@kAf@kEjCZXs@_B{NB}E_@o@uCUiDuAp@}AyAq@\\aAl@cK	30	38
3909	264.6	~yuhAplcuMaCz@y@_By@}CtYwIh@c@l@kAf@kEjCZXs@_B{NAiDn@wFfB}FcDkA_CSNgCaBMUrE	30	39
3911	207.2	~yuhAplcuMaCz@y@_BcIoZiAmIgAqOiBcLnD[rBJ|IfDGWRo@RwCDYLD	30	41
3912	251.2	~yuhAplcuMaCz@y@_BcIoZiAmIgAqOiBcLnD[rBJ|IfDGWRo@TeD~CaIhD`B	30	42
3913	275.3	~yuhAplcuMaCz@y@_BcIoZiAmIgAqOiBcLnD[rBJ|IfDGWRo@XqDvAXrFHD}@xCqHf@k@	30	43
3914	255.2	~yuhAplcuMaCz@y@_BcIoZiAmIgAqOiBcL~BW_@wBhCOzC`@p@_@dBeGt@}IrC`@dBl@	30	44
3916	191.4	~yuhAplcuMaCz@y@_BoIo[}@mH}AeSqF_[nCg@Ms@	30	46
3917	221.6	~yuhAplcuMaCz@y@_BcIoZiAmI}AeSgDgRzEq@|BBnC`@p@kCNoB	30	47
3918	177.1	~yuhAplcuMaCz@y@_BwIq\\y@cHcAyNiBcL~BWs@eEPc@d@E	30	48
3919	205.9	~yuhAplcuMaCz@y@_BcIoZiAmIgAqOiBcL~BW_@wBhCOzC`@TAb@i@@P	30	49
3921	142.4	jovhAvdbuM~ASPtAl@n@fSyAVrCfNcAp@zIZK	31	1
3922	99.1	jovhAvdbuM~ASPtAl@n@fSyAl@jHjDW	31	2
3923	68.4	jovhAvdbuM~ASPtAl@n@lGe@PtCdBMNlB	31	3
3924	117.8	jovhAvdbuM~ASPtAl@n@lGe@PtCcBLrB~P{Bt@	31	4
3926	88	jovhAvdbuM~ASPtAl@n@pQqAWsCcCRIqA	31	6
3927	99.5	jovhAvdbuM~ASPtAn@n@[qCzIo@I}CNsBPcA	31	7
3928	70.4	jovhAvdbuMWmDLgEdBNZOJMb@mCrBb@DW	31	8
3929	140.9	jovhAvdbuMWmDLgEdBNf@]b@mC|AgFhCsHnBp@nAqDtHjC	31	10
3931	105.7	jovhAvdbuMWmDLgEdBNf@]b@mC|AgFhCsHnBp@{@dC	31	9
3932	118.1	jovhAvdbuM~ASPtAl@n@pQqA_@}E@sAJo@jA}D`EtAtAJhCKBP	31	12
3933	149.1	jovhAvdbuM~ASPtAl@n@pQqA_@}E@sAJo@vAuEzFsPLQvEjBs@pBHB	31	13
3934	108	jovhAvdbuM~ASPtAl@n@pQqAWsCGuBLwAZkAzCwIrBr@	31	14
3936	109.7	jovhAvdbuM~ASPtAl@n@xl@qE@N	31	16
3937	120.2	jovhAvdbuM~ASPtAl@n@fe@kDC[yET	31	17
3938	77.5	jovhAvdbuM~ASPtAl@n@vPmAXCWsCnCS	31	18
3939	153.4	jovhAvdbuM~ASPtAl@n@fSyArAhRvA_@PfD_FrAAK	31	19
3941	56.7	jovhAvdbuM~AS~ArMXs@[cCLA	31	20
3942	84.8	jovhAvdbuM~ASzDh[qD^DjA	31	22
3943	115.4	jovhAvdbuM~ASbCfSzA~KgPzEq@cC	31	23
3944	69.8	jovhAvdbuMgHnBTxACfBqDe@CiA]aAFE	31	25
3946	141.8	jovhAvdbuMS}BCyAPqDcB]uO{GY`@[fAEdC_CEgBd@zBvH	31	27
3947	66.4	jovhAvdbuMgHnBNz@FpAIfAUfA]x@o@|@eBhA	31	24
3948	115.9	jovhAvdbuMgHnBNz@FpAUtBy@lBwArA}Al@cAN{@B}AOcBk@aAzA_Cj@	31	28
3949	144.8	jovhAvdbuMgHnBNz@FpAUtBy@lBwArA}Al@cAN{@B}AOcBk@aAzAhArDjA_@BJ	31	29
3951	57.2	jovhAvdbuMS}B?qCoAOuAe@}BkAOS	31	32
3952	102.4	jovhAvdbuMS}BCyAPqDcB]uO{GY`@[fAIrE	31	33
3953	109	jovhAvdbuMS}BCyAPqDcB]aJ_E{MsFSOi@|@Sr@GA	31	34
3954	185.8	jovhAvdbuMWwEPqDcB]qYcMyCcA{CY}EZxBxOd@CMaB~BU	31	35
3956	105.6	jovhAvdbuMWmDLgE|@wF`AaQDc@Vy@	31	37
3957	112.2	jovhAvdbuMS}BCyAL}CZuBcAUwEwB\\aAl@cK	31	38
3958	133.1	jovhAvdbuMWmDLgE|@wF\\uFeBKNgCaBMUrE	31	39
3959	75.9	jovhAvdbuMS}BCyAPqDwAWsIwDl@_B	31	40
3961	148.5	jovhAvdbuMS}BCyAPqDwAWsIwDbCuGXaB_DID}@sAe@fAsC	31	42
3962	147.6	jovhAvdbuMS}BCyAPqDwAWsIwDbCuGl@sDeCeApBaFP[TO	31	43
3963	166.9	jovhAvdbuMS}BCyAPqDwAWoU{JRo@NgCNu@jGsOkBo@	31	44
3964	219.5	jovhAvdbuMS}BCyAPqDwAWoU{JRo@NgCNu@jGsOqE}A}KwAPq@V]n@Yp@M	31	45
3966	194.2	jovhAvdbuMWwEPqDcB]a]uNcCg@}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	31	47
3967	134.6	jovhAvdbuMWwEPqDcB]a]uNcCg@}B?m@uDPc@d@E	31	48
3968	163.4	jovhAvdbuMWwEPqDcB]a]uNcCg@}B?YgBhCOzC`@TAb@i@@P	31	49
3969	169	jovhAvdbuMWmDLgE|@wF\\uFeBKZoFCSWMdDwJlIxC	31	50
3971	139.3	bevhApwauM`@uAnEnBlDd@GzCNtDPtAj@n@hSyAl@jHjDW	32	2
3972	108.6	bevhApwauMAIb@kAnEnBlDd@EbF^bEl@n@lGe@PtCdBMNlB	32	3
3973	158	bevhApwauMAIb@kAnEnBlDd@GzCNtDPtAj@n@nGe@PtCcBLrB~P{Bt@	32	4
3974	104.5	bevhApwauMAIb@kAnEnBlDd@GzCNtDPtAl@n@YqChF_@?I	32	5
3976	97.2	bevhApwauMAIb@kAnEnBv@P|BRb@]b@mCrBb@h@qBrEbB_@tA	32	7
3977	60.9	bevhApwauMAIb@kAnEnBv@PxBRf@]b@mCrBb@DW	32	8
3978	131.4	bevhApwauMAIb@kA`FtB~C^ZOJMb@mC|AgFhCsHnBp@nAqDtHjC	32	10
3979	139.6	bevhApwauMAIb@kAnEnBv@P`CP^[b@mC|AgFdPxFjBeFUKyA`E	32	11
3981	129.1	bevhApwauM`@uAnEnBxDb@^[b@mC|AgFxT`IbCXhCKBP	32	12
3982	154	bevhApwauM`@uAtFzBjCXf@]b@mC|AgFpGcR`WjJs@pBHB	32	13
3983	126.5	bevhApwauM`@uAnEnBxDb@^[b@mC|AgFdPxFjBeFrBr@	32	14
3984	161.6	bevhApwauM`@uAtFzBjCXf@]b@mC|AgFpGcRd\\`Mz@j@J|C	32	15
3986	160.4	bevhApwauM`@uAnEnBlDd@GzCNtDPtAl@n@fe@kDC[yET	32	17
3987	117.7	bevhApwauMAIb@kAnEnBlDd@GzCNtDPtAl@n@pQqAWsCnCS	32	18
3988	193.6	bevhApwauMAIb@kAnEnBlDd@GzCNtDPtAl@n@fSyArAhRvA_@PfD_FrAAK	32	19
3989	158.3	bevhApwauMAI[~DFD\\@IrAGTaAlA|@bA`@z@ZzAFpAIfAUfA}@dBvBnHhDcAz@y@Zu@_B_@	32	21
3991	125	bevhApwauMAIb@kAnEnBlDd@GzCNtDzDh[qD^DjA	32	22
3992	155.6	bevhApwauMAIb@kAnEnBlDd@GzCNtDbCfSzA~KgPzEq@cC	32	23
3993	101.2	bevhApwauMAI[~DFD\\@IrAGTaAlA|@bAl@zATxACfBqDe@CiA]aAFE	32	25
3994	132.4	bevhApwauM@Wh@mAcJwDY`@[fAEdC_CEgBd@bEnN}@l@_@n@UjAFdA	32	26
3996	97.8	bevhApwauMAI[~DFD\\@IrAGTaAlA|@bAl@zATxACfBYzAo@rAaAbAaAh@	32	24
3997	147.3	bevhApwauMAI[~DFD\\@IrAGTaAlA|@bA`@z@`@xBGzBUfA]x@sA|AaAh@q@RcANyA@wAUkAc@aAzA_Cj@	32	28
3998	176.2	bevhApwauMAI[~DFD\\@IrAGTaAlAh@j@d@r@d@|ALnBUtBg@rAo@|@y@n@}Al@cANyA@wAUkAc@aAzAhArDjA_@BJ	32	29
3999	188.9	bevhApwauMAI[~DFD\\@IrAGTaAlA|@bAl@zAVrBI`BUfA]x@o@|@y@n@s@\\qAXuBFlD|LsEnAl@tB	32	30
4001	62.8	bevhApwauM@Wh@mAcJwDY`@[fAIrE	32	33
4002	69.4	bevhApwauM@Wh@mAkSoISOi@|@Sr@GA	32	34
4003	146.2	bevhApwauM@Wh@mAkSoISOyCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	32	35
4004	130.7	bevhApwauM@Wh@mAcJwDY`@[fAEdC_CEgBd@i@RKPyBhN	32	36
4006	75.6	bevhApwauM@Wh@mAuCmABQ~BcGt@aEVW`@??H	32	38
4007	106	bevhApwauMAIb@kAz@^x@kByAq@\\aAf@sI|AHUrE	32	39
4008	36.3	bevhApwauM@Wh@mAuCmAl@_B	32	40
4009	68.8	bevhApwauM@Wh@mAqOqGRo@TeDBKLD	32	41
4011	108	bevhApwauM@Wh@mAuCmAbCuGl@sDeCeApBaFP[TO	32	43
4012	127.3	bevhApwauM@Wh@mAqOqGRo@NgCNu@jGsOkBo@	32	44
4013	179.9	bevhApwauM@Wh@mAqOqGRo@NgCNu@jGsOqE}A}KwAPq@V]n@Yp@M	32	45
4014	133.6	bevhApwauM@Wh@mAkSoISOyCcAyAU}B?_CPwCyPnCg@Ms@	32	46
4016	95	bevhApwauM@Wh@mAkSoISOoBq@qA]q@I}B?m@uDPc@d@E	32	48
4017	123.8	bevhApwauM@Wh@mAkSoISOoBq@qA]q@I}B?YgBh@I~AEzC`@TAb@i@@P	32	49
4018	161	bevhApwauM@Wh@mAuCmABQ~BcGl@sDRa@l@CPuAXML?nBj@dDwJlIxC	32	50
4019	220.2	jyuhApxauMHsEd@}AfPbH~Dl@GzCNtDPtAj@n@hSyAVrCfNcAp@zIZK	33	1
4021	146.2	jyuhApxauMHsEd@}AfPbHhAXtBREbF^bEl@n@lGe@PtCdBMNlB	33	3
4022	195.6	jyuhApxauMHsEd@}AfPbHhAXtBREbF^bEl@n@lGe@PtCcBLrB~P{Bt@	33	4
4023	142.1	jyuhApxauMHsEd@}AfPbHhAXtBRGzCNtDPtAj@n@WqChF_@?I	33	5
4024	159.8	jyuhApxauMHsEd@}AfPbHbEl@f@]b@mCrBb@h@qB~HrCi@tBObD	33	6
4026	98.5	jyuhApxauMHsEd@}AfPbHv@RfBTj@@^[b@mCrBb@DW	33	8
4027	169	jyuhApxauMHsEd@}AfPbHjEj@^[b@mCfF{OnBp@nAqDtHjC	33	10
4028	177.2	jyuhApxauMHsEd@}AfPbHbEl@f@]b@mC|AgFdPxFjBeFUKyA`E	33	11
4029	133.8	jyuhApxauMHsEd@}AfPbHhAX`CP^[b@mC|AgFhCsHnBp@{@dC	33	9
4031	191.6	jyuhApxauMHsEd@}AfPbH~Ch@r@AVWb@mC|AgFpGcR`WjJs@pBHB	33	13
4032	164.1	jyuhApxauMHsEd@}AfPbHbEl@f@]b@mC|AgFdPxFjBeFrBr@	33	14
4033	199.2	jyuhApxauMHsEd@}AfPbH~Ch@r@AVWb@mC|AgFpGcRd\\`Mz@j@J|C	33	15
4034	187.5	jyuhApxauMHsEd@}AfPbH~Dl@GzCNtDPtAl@n@xl@qE@N	33	16
4036	155.3	jyuhApxauMHsEd@}AfPbH~Dl@GzCNtDPtAl@n@pQqAWsCnCS	33	18
4037	231.2	jyuhApxauMHsEd@}AfPbH~Dl@GzCNtDPtAl@n@fSyArAhRvA_@PfD_FrAAK	33	19
4038	172.9	jyuhApxauMBmAfCHW~H|A\\xAz@|@bAl@zATxACfBYzA}@dBvBnHhDcAz@y@Zu@_B_@	33	21
4039	134.5	jyuhApxauMHsEd@}AfPbHhAXtBRGzCFzBfBlOXs@[cCLA	33	20
4041	193.2	jyuhApxauMHsEd@}AfPbHhAXtBRGzCNtDbCfSzA~KgPzEq@cC	33	23
4042	115.8	jyuhApxauMBmAfCHW~H~@PfAb@n@b@|@bA`@z@T|@LtAElAqDe@CiA]aAFE	33	25
3955	131.6	jovhAvdbuMgHnBTxACfBqDe@CiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	31	36
3960	108.4	jovhAvdbuMS}BCyAPqDwAWoU{JRo@TeDBKLD	31	41
3965	173.2	jovhAvdbuMWwEPqDcB]qYcMyCcA{CY{DTwCyPnCg@Ms@	31	46
3970	182.6	bevhApwauM`@uAnEnBlDd@GzCNtDPtAl@n@fSyAVrCfNcAp@zIZK	32	1
3975	122.2	bevhApwauMAIb@kAnEnBv@P|BRb@]b@mCrBb@h@qB~HrCi@tBMhAAxA	32	6
3980	96.2	bevhApwauMAIb@kAnEnBv@P`CP^[b@mC|AgFhCsHnBp@{@dC	32	9
3985	149.9	bevhApwauM`@uAnEnBlDd@GzCNtDPtAl@n@xl@qE@N	32	16
3990	96.9	bevhApwauMAIb@kAnEnBlDd@GzCFzBfBlOXs@[cCLA	32	20
3995	102.2	bevhApwauM@Wh@mAcJwDY`@[fAEdC_CEgBd@zBvH	32	27
4000	60.2	bevhApwauMAIb@kAnEnBlDd@GzCNtD_BR	32	31
4005	104.3	bevhApwauMAIb@kA|DfB|A\\|@wF`AaQDc@Vy@	32	37
4010	108.9	bevhApwauM@Wh@mAuCmAbCuGXaB_DID}@sAe@fAsC	32	42
4015	154.6	bevhApwauM@Wh@mAkSoISOoBq@qA]q@I}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	32	47
4020	176.9	jyuhApxauMHsEd@}AfPbH~Dl@GzCNtDPtAj@n@hSyAl@jHjDW	33	2
4025	134.8	jyuhApxauMHsEd@}AfPbHhAX`CP^[b@mCrBb@h@qBrEbB_@tA	33	7
4030	166.7	jyuhApxauMHsEd@}AfPbHjEj@^[b@mC|AgFxT`IbCXhCKBP	33	12
4035	198	jyuhApxauMHsEd@}AfPbH~Dl@GzCNtDPtAl@n@fe@kDC[yET	33	17
4040	162.6	jyuhApxauMHsEd@}AfPbHhAXtBRGzCNtDzDh[qD^DjA	33	22
4045	112.4	jyuhApxauMBmAfCHW~HlBd@~AfAx@jAZ~@Nz@Fv@ElAe@rBaA~AeBhA	33	24
4050	57.3	jyuhApxauMHsEd@}AhJzD_@|@AV	33	32
4055	96.9	jyuhApxauMHsEZgAXa@l@{ABw@lDFrAZj@gB^gCJW^OT@?H	33	38
4060	129.3	jyuhApxauMHsEZgAXa@l@{ABw@lDFrAZ\\{@l@sDeCeApBaFP[TO	33	43
4065	93.3	jyuhApxauMHsEZgAXa@gHwCSOyCcAyAU}B?m@uDPc@d@E	33	48
4070	151.2	houhAzlauM\\H\\cB|Y`M~Dl@EbF^bEl@n@lGe@PtCdBMNlB	34	3
4075	103.5	houhAzlauM\\HZiA@Y|Y`Mv@RfBTj@@^[b@mCrBb@DW	34	8
4080	196.6	houhAzlauM\\H\\cB|Y`MjEj@^[b@mC|AgFpGcR`WjJs@pBHB	34	13
4085	160.3	houhAzlauM\\H\\cB|Y`M~Dl@GzCNtDPtAl@n@pQqAWsCnCS	34	18
4090	198.2	houhAzlauM\\H\\cB|Y`M~Dl@GzCNtD~Ef`@gPzEq@cC	34	23
4095	149	houhAzlauMF@AhAJt@nGtT}@l@_@n@UjAHjAb@dAb@`@h@VfALv@E`AhDcANyA@wAUkAc@aAzA_Cj@	34	28
4100	53.9	houhAzlauMF@@bBrA`FfBe@~BDClA	34	33
4105	139.5	houhAzlauM\\HZiA@YpOlGDc@~BcGl@sDRa@VET@Ex@|AHUrE	34	39
4110	113.9	houhAzlauM\\HZiA@Y~CnAGWRo@NgCNu@jGsOkBo@	34	44
4115	84	houhAzlauM{EgAi@?_AiFh@I~AEzC`@TAb@i@@P	34	49
4120	228.6	liuhAftauMxDe@z@[]aC^aC|Y`M~Dl@EbF^bEl@n@lGe@PtCcBLrB~P{Bt@	35	4
4125	202	liuhAftauMxDe@z@[]aC^aC|Y`MfEl@b@]b@mCfF{OnBp@nAqDtHjC	35	10
4130	197.1	liuhAftauMxDe@z@[]aC^aC|Y`MbEl@f@]b@mC|AgFdPxFjBeFrBr@	35	14
4135	264.2	liuhAftauMxDe@z@[]aC^aC|Y`M~Dl@GzCNtDPtAl@n@fSyArAhRvA_@PfD_FrAAK	35	19
4140	124.5	liuhAftauMjCYtA_@zFdSe@Vk@l@Wn@Ir@HjAHZXh@b@`@~@^lABbAUp@c@^m@TiACiA]aAFE	35	25
4145	166.5	liuhAftauMjCYtA_@zFdS}@l@_@n@UjAHjAgI`C]RdDjMdGgBBJ	35	29
4150	41.7	liuhAftauMxDe@z@[YgAAwA]I	35	34
4155	91.9	liuhAftauMxDe@z@[YgACy@^aCpOlGDc@h@mA	35	40
4160	173.9	liuhAftauMnAOUkAeAYMSoBsKh@I~AEzC`@TAb@i@|AyFPsAb@iGiGu@Pq@V]n@Yp@M	35	45
4165	216.6	liuhAftauMxDe@z@[]aC^aCpOlGdCgHx@kEt@MJiA^Y|Bj@dDwJlIxC	35	50
4170	168.3	vluhArgbuM|A`@r@gBjAqApAs@pB]dCJfBl@xAnA`ArBdHoB`BSPtAn@n@[qChFi@	36	5
4175	225.1	vluhArgbuM|A`@r@gBjAqAfB{@tBUjBJ`C|@rAvAl@zAdHoB`BSPtAl@n@pQqA_@}ED_B~DgMUKyA`E	36	11
4180	260.7	vluhArgbuM|A`@r@gBjAqAfB{@tBUjBJ`C|@rAvAl@zAdHoB`BSPtAl@n@pQqA_@}ELcC`J{WxGfCtC~ARbD	36	15
4185	150.9	vluhArgbuM|A`@r@gBnCjBWn@Ir@HjAHZXh@b@`@h@VfALv@EhDrLpIeCb@Wf@i@Zu@_B_@	36	21
4190	50.8	vluhArgbuM|A`@r@gBnCjB]hACt@Fh@	36	26
4195	172.3	vluhArgbuM|A`@r@gBnCjBWn@Ir@HjAHZXh@b@`@h@VfALv@E`AhDcANyA@lD|LsEnAl@tB	36	30
4200	71	vluhArgbuMv@oFw@Cs@Du@}J	36	35
4205	121.6	vluhArgbuMpBuMRe@|@]qA{EAwAZiA@Y~CnAGWRo@RwCDYLD	36	41
4210	144.8	vluhArgbuMv@oFw@CuDZs@}JUsBqF_[nCg@Ms@	36	46
4215	221.6	~svhAh|`uM]vAi@nJfEpA`OjF}@pCY~A?tBXbEnAKVrCfNcAp@zIZK	37	1
4220	130.3	~svhAh|`uM]vAi@nJhH|Bo@fB~HrCi@tBMhAAxA	37	6
4225	80.9	~svhAh|`uMf@{AdGvBgBxETTLEPe@nBp@{@dC	37	9
4230	164.4	~svhAh|`uMf@{AwAg@v@{B~d@vPtC~AhBdX	37	16
4235	141.8	~svhAh|`uM]vAi@nJtC|@kAvDs@jDI|@GzCNtD~ArMXs@[cCLA	37	20
4240	176.3	~svhAh|`uM]vA}@rP}@vFcB]uO{GY`@[fAEdC_CEgBd@zBvH	37	27
4245	105.1	~svhAh|`uM]vAi@nJtC|@kAvDw@`EMbENtD_BR	37	31
4250	204.8	~svhAh|`uM]vA}@rP}@vFcB]uO{GY`@[fAEdC_CEgBd@i@RKPyBhN	37	36
4255	87	~svhAh|`uMWx@Eb@qFqBW]KcAcAFWJy@fBsAi@o@|A	37	42
4260	145.7	~svhAh|`uMWx@Eb@qFqBW]KcAmAJASgGaCHQqAg@_Cu@oFs@_@rE	37	47
4265	189.8	livhAvbauMEn@~DVQbD`BLxDjAnOpF}@pCY~A?tBXbEnAKl@jHjDW	38	2
4270	116.8	livhAvbauMEn@~DVQbD`BLhH|Bo@fBrEbB_@tA	38	7
4275	136.4	livhAvbauMEn@~DVQbD`BLxDjAxT`IbCXhCKBP	38	12
4280	210.9	livhAvbauMEn@~DVQbD`BLxDjAnOpFwApF?tBXbEnS}AC[yET	38	17
4285	179.7	livhAvbauMk@tJ_@nAxAp@y@jBdDtAzC^GzCNtDzDh[qD^DjA	38	22
4290	164.2	livhAvbauM?Ia@?WVu@`EcCtGAPlCjAk@hBS`DFD\\@IrAGTaAlA|@bA`@z@ZzAFpAMzAo@lBaAlAsAx@	38	24
4295	75.7	livhAvbauM?IUA_@Ny@jE_CbGEb@lCjA_@|@AV	38	32
4300	59.8	livhAvbauMJsANS\\EnBj@f@{A`Bl@Dc@Vy@	38	37
4305	54.3	livhAvbauM?Ia@?SLKVeCeApBaFP[TO	38	43
4310	127.9	livhAvbauM?Ia@?WVu@`EcCtGuNaGSOyCcAyAU}B?m@uDPc@d@E	38	48
4044	54.5	jyuhApxauMBmA_CEgBd@zBvH	33	27
4046	161.9	jyuhApxauMBmAfCHW~HnAVpAl@~@~@d@r@Z~@TxA?lASzAa@hAe@t@s@p@iAl@mB^yA@wAUkAc@aAzA_Cj@	33	28
4047	172.1	jyuhApxauMBmA_CEgBd@bEnN}@l@_@n@UjAHjAgI`C]RdDjMdGgBBJ	33	29
4048	203.5	jyuhApxauMBmAfCHW~H~@PfAb@xAnAd@r@Z~@VrBElAYzAc@`A{@dA}@l@gA^cANyA@lD|LsEnAl@tB	33	30
4049	97.8	jyuhApxauMHsEd@}AfPbHhAXtBRGzCNtD_BR	33	31
4051	54.9	jyuhApxauMBmAyBEyAZiAaEKw@@y@]I	33	34
4052	102.8	jyuhApxauMBmA_CEqCx@Sd@y@dFw@Cs@Du@}J	33	35
4053	83	jyuhApxauMBmA_CEqCx@Sd@qBtM	33	36
4054	141.9	jyuhApxauMHsEd@}AfPbH|A\\|@wF`AaQDc@Vy@	33	37
4056	133.2	jyuhApxauMHsEZgAXa@l@{ABw@lDFrAZj@gB^gCRa@VET@Ex@|AHUrE	33	39
4057	58.9	jyuhApxauMHsEd@}AzEnBDc@h@mA	33	40
4058	67.1	jyuhApxauMHsEZgAXa@mDyARo@TeDBKLD	33	41
4059	111.1	jyuhApxauMHsEZgAXa@mDyARo@TeD~CaInDvAEH	33	42
4061	125.6	jyuhApxauMHsEZgAXa@mDyARo@NgCNu@jGsOkBo@	33	44
4062	178.2	jyuhApxauMHsEZgAXa@mDyARo@NgCNu@jGsOqE}A}KwAPq@V]n@Yp@M	33	45
4063	131.9	jyuhApxauMHsEZgAXa@gHwCSOaEoAsBM{DTwCyPnCg@Ms@	33	46
4064	152.9	jyuhApxauMHsEZgAXa@gHwCSOyCcAyAU}B?k@mDHe@h@KDaB|BBnC`@p@kCNoB	33	47
4066	122.1	jyuhApxauMHsEZgAXa@gHwCSOyCcAyAU}B?YgBh@I~AEzC`@TAb@i@@P	33	49
4067	182.3	jyuhApxauMHsEZgAXa@l@{ABw@lDFrAZj@gB^gCJWRM`@?JiA^Y|Bj@dDwJlIxC	33	50
4068	225.2	houhAzlauM\\H\\cB|Y`M~Dl@GzCNtDPtAl@n@fSyAVrCfNcAp@zIZK	34	1
4069	181.9	houhAzlauM\\H\\cB|Y`M~Dl@GzCNtDPtAj@n@hSyAl@jHjDW	34	2
4071	200.6	houhAzlauM\\H\\cB|Y`M~Dl@EbF^bEl@n@lGe@PtCcBLrB~P{Bt@	34	4
4072	147.1	houhAzlauM\\H\\cB|Y`M~Dl@GzCNtDPtAj@n@WqChFi@	34	5
4073	164.8	houhAzlauM\\H\\cB|Y`MbEl@f@]b@mCrBb@h@qB~HrCi@tBObD	34	6
4074	139.8	houhAzlauM\\H\\cB|Y`MhAX`CP^[b@mCrBb@h@qBrEbB_@tA	34	7
4076	174	houhAzlauM\\H\\cB|Y`MbEl@f@]b@mCfF{OnBp@nAqDtHjC	34	10
4077	182.2	houhAzlauM\\H\\cB|Y`MbEl@f@]b@mC|AgFdPxFjBeFUKyA`E	34	11
4078	138.8	houhAzlauM\\H\\cB|Y`MbEl@f@]b@mCfF{OnBp@{@dC	34	9
4079	171.7	houhAzlauM\\H\\cB|Y`M~Ch@j@@^[b@mC|AgFxT`IbCXhCKBP	34	12
4081	169.1	houhAzlauM\\H\\cB|Y`MbEl@f@]b@mC|AgFdPxFjBeFrBr@	34	14
4082	204.2	houhAzlauM\\H\\cB|Y`MjEj@^[b@mC|AgFpGcRd\\`Mz@j@J|C	34	15
4083	192.5	houhAzlauM\\H\\cB|Y`M~Dl@GzCNtDPtAl@n@xl@qE@N	34	16
4084	203	houhAzlauM\\H\\cB|Y`M~Dl@GzCNtDPtAl@n@fe@kDC[yET	34	17
4086	236.2	houhAzlauM\\H\\cB|Y`M~Dl@GzCNtDPtAl@n@fSyArAhRvA_@PfD_FrAAK	34	19
4087	169.2	houhAzlauMF@AhAJt@nGtTe@Vk@l@]hACt@Hn@b@dAb@`@~@^p@Dv@EhDrLpIeCb@Wf@i@Zu@_B_@	34	21
4088	139.5	houhAzlauM\\HZiA@Y|Y`MhAXtBRGzCFzBfBlOXs@[cCLA	34	20
4089	167.6	houhAzlauM\\HZiA@Y|Y`MhAXtBRGzCNtDzDh[qD^DjA	34	22
4091	114.5	houhAzlauMF@AhAJt@nGtTe@Vk@l@]hACt@Hn@b@dAb@`@h@Vl@JpAC`Aa@v@aAT_A@o@QeAQ_@FE	34	25
4092	69.1	houhAzlauMF@AhAJt@nGtT}@l@_@n@UjAFdA	34	26
4093	38.9	houhAzlauMF@AhAJt@fE|N	34	27
4094	119.1	houhAzlauMF@AhAJt@jEhO|@SlAIjAB~@PfAb@n@b@|@bA`@z@T|@LtAElAO`Aa@hAe@t@s@p@aAh@	34	24
4096	156.5	houhAzlauMF@AhAJt@nGtT}@l@_@n@UjAHjAgI`C]RdDjMdGgBBJ	34	29
4097	190.6	houhAzlauMF@AhAJt@nGtT}@l@_@n@UjAHjAb@dAb@`@h@VfALv@E`AhDcANyA@lD|LsEnAl@tB	34	30
4098	102.8	houhAzlauM\\HZiA@Y|Y`MhAXtBRGzCNtD_BR	34	31
4099	62.3	houhAzlauM\\HZiA@Y~SxI_@|@AV	34	32
4101	94	houhAzlauMF@@bBrA`Fi@RKPaAxFw@Cs@Du@}J	34	35
4102	74.2	houhAzlauMF@@bBrA`Fi@RSd@qBtM	34	36
4103	146.9	houhAzlauM\\HZiA@Y|Y`M|A\\|@wF`AaQDc@Vy@	34	37
4104	103.2	houhAzlauM\\HZiA@YpOlGDc@~BcGl@sDJWRM`@??H	34	38
4106	63.9	houhAzlauM\\HZiA@YpOlGDc@h@mA	34	40
4107	55.4	houhAzlauM\\HZiA@Y~CnAGWRo@RwCDYLD	34	41
4108	99.4	houhAzlauM\\HZiA@Y~CnAGWRo@TeD~CaInDvAEH	34	42
4109	123.5	houhAzlauM\\HZiA@Y~CnAGWRo@XqDvAXrFHD}@xCqHP[TO	34	43
4111	155	houhAzlauM{EgAi@?_AiFh@I~AEzC`@TAb@i@|AyFPsAb@iGiGu@Pq@V]n@Yp@M	34	45
4112	99	houhAzlauM{EgAi@?e@aC_CPwCyPnCg@Ms@	34	46
4113	114.8	houhAzlauM{EgAi@?sAwHPc@b@EDaB|BBnC`@p@kCNoB	34	47
4114	55.2	houhAzlauM{EgAi@?sAwHPc@d@E	34	48
4116	188.6	houhAzlauM\\H\\cBpOlGdCgHx@kEt@MJiA^Y|Bj@dDwJlIxC	34	50
4117	253.2	liuhAftauMxDe@z@[]aC^aC|Y`M~Dl@GzCNtDPtAj@n@hSyAVrCfNcAp@zIZK	35	1
4118	209.9	liuhAftauMxDe@z@[]aC^aC|Y`M~Dl@GzCNtDPtAj@n@hSyAl@jHjDW	35	2
4119	179.2	liuhAftauMxDe@z@[]aC^aC|Y`M~Dl@EbF^bEl@n@lGe@PtCdBMNlB	35	3
4121	175.1	liuhAftauMxDe@z@[]aC^aC|Y`M~Dl@GzCNtDPtAj@n@WqChFi@	35	5
4122	192.8	liuhAftauMxDe@z@[]aC^aC|Y`M~Ch@j@@^[b@mCrBb@h@qB~HrCi@tBObD	35	6
4123	167.8	liuhAftauMxDe@z@[]aC^aCt[tMrCV^[b@mCrBb@h@qBrEbB_@tA	35	7
4124	131.5	liuhAftauMxDe@z@[]aC^aCt[tMrCV^[b@mCrBb@DW	35	8
4126	210.2	liuhAftauMxDe@z@[]aC^aC|Y`M~Ch@j@@^[b@mC|AgFdPxFjBeFUKyA`E	35	11
4127	166.8	liuhAftauMxDe@z@[]aC^aC|Y`MfEl@b@]b@mCfF{OnBp@{@dC	35	9
4128	199.7	liuhAftauMxDe@z@[]aC^aC|Y`MhAXxBRf@]b@mC|AgFxT`IbCXhCKBP	35	12
4129	224.6	liuhAftauMxDe@z@[]aC^aC|Y`MjEj@^[b@mC|AgFpGcR`WjJs@pBHB	35	13
4131	232.2	liuhAftauMtFaA]aC^aC|Y`MjEj@rLu^d\\`Mz@j@J|C	35	15
4132	220.5	liuhAftauMtFaA]aC^aC|Y`M~Dl@FpI~@dCzl@aE	35	16
4133	231	liuhAftauMxDe@z@[]aC^aC|Y`M~Dl@GzCNtDPtAl@n@fe@kDC[yET	35	17
4134	188.3	liuhAftauMxDe@z@[]aC^aC|Y`M~Dl@GzCNtDPtAl@n@pQqAWsCnCS	35	18
4136	179.2	liuhAftauMjCYtA_@zFdS}@l@k@fAInANbA\\p@b@`@h@VfALv@EhDrLpIeCb@Wf@i@Zu@_B_@	35	21
4137	162.3	liuhAftauM`Fy@vDxMpB]dBB|A\\xAz@nA~Ad@|ALnBMzA|MdBXs@[cCLA	35	20
4138	194.5	liuhAftauM`Fy@vDxMpB]dBB|A\\xAz@nA~Ad@|ALnBMzA|MdBzAtLqD^DjA	35	22
4139	225.1	liuhAftauM`Fy@vDxMpB]dBB|A\\xAz@nA~Ad@|ALnBMzA|MdB~BrQgPzEq@cC	35	23
4141	79.1	liuhAftauMjCYtA_@zFdS}@l@_@n@UjAFdA	35	26
4142	48.9	liuhAftauMjCYtA_@rDlM	35	27
4143	129.1	liuhAftauMjCYtA_@vDxMpB]jA?x@J|@TbAf@rAvA`@z@ZzAFpAIfAUfAo@rAaAbAaAh@	35	24
4144	159	liuhAftauMjCYtA_@zFdS}@l@k@fAInANbA\\p@b@`@h@VfALv@E`AhDcANyA@wAUkAc@aAzA_Cj@	35	28
4146	200.6	liuhAftauMjCYtA_@zFdS}@l@k@fAInANbA\\p@b@`@h@VfALv@E`AhDcANyA@lD|LsEnAl@tB	35	30
4147	125.6	liuhAftauMjCYtA_@vDxM|@SlAIjABnAVv@\\dAv@x@jAZ~@fHoB	35	31
4148	90.3	liuhAftauMxDe@z@[YgACy@^aC~SxI_@|@AV	35	32
4149	63.9	liuhAftauMjCYtA_@v@tCfBe@~BDClA	35	33
4151	84.2	liuhAftauMjCYtA_@v@tCi@RSd@qBtM	35	36
4152	174.9	liuhAftauMxDe@z@[]aC^aC|Y`M|A\\|@wF`AaQ\\}A	35	37
4153	131.2	liuhAftauMxDe@z@[YgACy@^aCpOlGDc@~BcGl@sDJWRM`@??H	35	38
4154	167.5	liuhAftauMxDe@z@[YgACy@^aCpOlGDc@~BcGl@sDJWRM`@?Ex@|AHUrE	35	39
4156	83.4	liuhAftauMxDe@z@[YgACy@^aC~CnAGWRo@RwCDYLD	35	41
4157	127.4	liuhAftauMxDe@z@[YgACy@^aC~CnAGWRo@TeD~CaInDvAEH	35	42
4158	151.5	liuhAftauMxDe@z@[YgACy@^aC~CnAGWRo@XqDvAXrFHD}@xCqHP[TO	35	43
4159	141.9	liuhAftauMxDe@z@[YgACy@^aC~CnAGWRo@NgCNu@jGsOkBo@	35	44
4161	116.4	liuhAftauMnAOUkAeAYMSQ_A_C\\{EqXnCg@Ms@	35	46
4162	133.7	liuhAftauMnAOUkAeAYMSuAkHk@_ENYb@EDaB|BBnC`@p@kCNoB	35	47
4163	74.1	liuhAftauMnAOUkAeAYMSoA{Gs@eEPc@d@E	35	48
4164	102.9	liuhAftauMnAOUkAeAYMSoBsKh@I~AEzC`@TAb@i@@P	35	49
4166	246.4	vluhArgbuM|A`@r@gBjAqAfB{@tBUjBJ`C|@rAvAl@zAdHoB`BSPtAl@n@fSyAVrCfNcAp@zIZK	36	1
4167	203.1	vluhArgbuM|A`@r@gB|AaB|Bw@~BIhBZpAl@rAvAl@zAdHoB`BSPtAl@n@fSyAl@jHjDW	36	2
4168	172.4	vluhArgbuM|A`@r@gB|AaB|Bw@~BIhBZpAl@rAvAl@zAdHoB`BSPtAl@n@lGe@PtCdBMNlB	36	3
4169	207.4	vluhArgbuM|A`@nAmC`A{@tAk@nCU~Ch@~AfAhAjB`@xBKnC|MdBt@hFXSSeBxC_@x@~G{Bt@	36	4
4171	192	vluhArgbuM|A`@r@gBjAqAfB{@tBUjBJ`C|@rAvAl@zAdHoB`BSPtAl@n@pQqAWsCcCRIqA	36	6
4172	202	vluhArgbuM|A`@nAmC`A{@tAk@nCU~Ch@NyEnBHR{Bb@kAnEnBpDd@f@]b@mCrBb@h@qBrEbB_@tA	36	7
4173	165.7	vluhArgbuM|A`@nAmC`A{@tAk@nCU~Ch@NyEnBHR{Bb@kAnEnBpDd@f@]b@mCrBb@DW	36	8
4174	236.2	vluhArgbuM|A`@nAmC`A{@tAk@nCU~Ch@NyEnBHR{Bb@kA`FtBnDXVWb@mCfF{OnBp@nAqDtHjC	36	10
4176	201	vluhArgbuM|A`@nAmC`A{@tAk@nCU~Ch@NyEnBHR{Bb@kAnEnBxDb@^[b@mCfF{OnBp@{@dC	36	9
4177	222.1	vluhArgbuM|A`@r@gBjAqAfB{@tBUjBJ`C|@rAvAl@zAdHoB`BSPtAl@n@pQqA_@}E@sAvAmF`EtAtAJhCKBP	36	12
4178	253.1	vluhArgbuM|A`@r@gBjAqAfB{@tBUjBJ`C|@rAvAl@zAdHoB`BSPtAl@n@pQqA_@}ELcC`J{WvEjBs@pBHB	36	13
4179	212	vluhArgbuM|A`@r@gBjAqAfB{@tBUjBJ`C|@rAvAl@zAdHoB`BSPtAl@n@pQqA_@iGh@cDzCwIrBr@	36	14
4181	213.7	vluhArgbuM|A`@~ByD|EqAlFhA`CrDfKcC~@dCzl@aE	36	16
4182	224.2	vluhArgbuM|A`@r@gBjAqAfB{@tBUjBJ`C|@rAvAl@zAdHoB`BSPtAl@n@fe@kDC[yET	36	17
4183	181.5	vluhArgbuM|A`@r@gBjAqApAs@pB]dCJfBl@xAnA`ArBdHoB`BSPtAl@n@pQqAWsCnCS	36	18
4184	257.4	vluhArgbuM|A`@r@gBjAqAfB{@tBUjBJ`C|@rAvAl@zAdHoB`BSPtAl@n@fSyArAhRvA_@PfD_FrAAK	36	19
4186	140.7	vluhArgbuM|A`@r@gBj@w@p@i@~@c@|@Sr@IjA?xATfAb@n@b@|@bA`@z@ZzAFpAMzA|MdBXs@[cCLA	36	20
4187	167	vluhArgbuM|A`@r@gBnCjBWn@Ir@HjAHZXh@b@`@h@VfALv@EhDrLpIeCx@k@l@kA\\PTVn@fI	36	22
4188	203.5	vluhArgbuM|A`@nAmC`C_BpB]dCJ`C|@dBrBp@xCKnC|MdB~BrQgPzEq@cC	36	23
4189	96.2	vluhArgbuM|A`@r@gBnCjBWn@Ir@HjAHZXh@b@`@~@^p@Dv@Ef@Qp@c@^m@Rs@B{@QeAQ_@FE	36	25
4191	69.6	vluhArgbuMpBuMRe@h@SzBvH	36	27
4192	107.5	vluhArgbuM|A`@b@oAz@oAzAcArA]lAIjABnAVpAl@~@~@t@rAZzADjBSzAg@rAaAlAsAx@	36	24
4193	130.7	vluhArgbuM|A`@r@gBnCjBWn@Ir@HjAHZXh@b@`@h@VfALv@E`AhDcANyA@wAUkAc@aAzA_Cj@	36	28
4194	136.1	vluhArgbuMq@dDMNk@Pu@kGa@Df@~EVxAlEzPdGgBBJ	36	29
4196	104	vluhArgbuM|A`@r@gBjAqApAs@pB]jA?x@JfBl@xAnAd@r@Z~@fHoB	36	31
4197	113.3	vluhArgbuM|A`@b@oAj@}@`A{@tAk@`AQlACpAJlA\\NyEnBHR{B@H	36	32
4198	76.7	vluhArgbuMpBuMRe@pCy@~BDClA	36	33
4199	79.9	vluhArgbuMpBuMRe@|@]iAaEKw@@y@]I	36	34
4201	206.5	vluhArgbuM|A`@r@gB|@gA~A}@vAYlACpAJlA\\hAr@`AmAPiBnBLTkBtAd@nANLyB|@wF|@sP\\wA	36	37
4202	165	vluhArgbuMpBuMRe@pCy@~BDDeCZgAXa@l@{ABw@lDFrAZj@gB^gCJW^OT@?H	36	38
4203	201.3	vluhArgbuMxBiNJQh@S`Bc@dCBDeCZgAXa@l@{ABw@lDFrAZj@gB^gCRa@VET@Ex@|AHUrE	36	39
4204	127	vluhArgbuMpBuMRe@pCy@~BDDeCd@}AzEnBDc@h@mA	36	40
4206	165.6	vluhArgbuMpBuMRe@|@]qA{EAwAZiA@Y~CnAGWRo@TeD~CaInDvAEH	36	42
4207	189.7	vluhArgbuMpBuMRe@|@]qA{EAwAZiA@Y~CnAGWRo@XqDvAXrFHD}@xCqHP[TO	36	43
4208	180.1	vluhArgbuMpBuMRe@|@]iAaEKw@@y@ZiA@Y~CnAGWRo@NgCNu@jGsOkBo@	36	44
4209	208.9	vluhArgbuMv@oFw@CuDZs@}JUsBqF_[~Ds@xBLXaFrC^Pq@V]n@Yp@M	36	45
4211	175	vluhArgbuMv@oFw@CuDZs@}JUsBgDgRnCi@jAG|BBnC`@p@kCNoB	36	47
4212	129.2	vluhArgbuMpBuMRe@|@]iAaEKw@@y@f@yBaEoAgAKgB@m@uDPc@d@E	36	48
4213	158	vluhArgbuMpBuMRe@|@]iAaEKw@@y@f@yBaEoAgAKgB@YgBh@I~AEzC`@TAb@i@@P	36	49
4214	250.4	vluhArgbuMxBiNvCiAdCBDeCbBeEBw@lDFrAZvAgGt@MJiA^Y|Bj@dDwJlIxC	36	50
4216	178.3	~svhAh|`uM]vAi@nJfEpA`OjF}@pCY~A?tBXbEnAKl@jHjDW	37	2
4217	153.5	~svhAh|`uM]vAi@nJtC|@yAzEo@dEEbF^bEl@n@lGe@PtCdBMNlB	37	3
4394	56.4	fcvhA|nauMm@~AmEiBOJe@|AIrE	40	33
4218	202.9	~svhAh|`uM]vAi@nJtC|@kAvDs@jDQxC@fC^bEj@n@nGe@PtCcBLrB~P{Bt@	37	4
4219	127.8	~svhAh|`uM]vAi@nJhH|BaAnCWhAk@tDC~@@hBJ~AtBQ?I	37	5
4221	105.3	~svhAh|`uM]vAi@nJhH|Bo@fBrEbB_@tA	37	7
4222	77.7	~svhAh|`uM]vAi@nJhH|BsA`E	37	8
4223	107.3	~svhAh|`uMf@{AwAg@l@gBlNbFo@fBtHjC	37	10
4224	121.2	~svhAh|`uMf@{AwAg@v@{Bl[dLaGvP	37	11
4226	124.9	~svhAh|`uM]vAi@nJfEpAjTzHl@LtAJhCKBP	37	12
4227	117	~svhAh|`uMf@{AwAg@v@{B|b@zOs@pBHB	37	13
4228	122.3	~svhAh|`uM]vAi@nJfEpAvOrFjBeFrBr@	37	14
4229	124.6	~svhAh|`uMf@{AwAg@v@{Bbf@lQxBnAJ|C	37	15
4231	195.8	~svhAh|`uMf@{AwAg@v@{B~d@vP|CdB|AvVmMv@	37	17
4232	135.4	~svhAh|`uM]vAi@nJfEpA`OjF}@pCY~ABdDfDW	37	18
4233	232.6	~svhAh|`uM]vAi@nJfEpA`OjF}@pCY~A?tBXbEnAKrAhRvA_@PfD_FrAAK	37	19
4234	232	~svhAh|`uM]vAi@nJtC|@kAvDw@`EMbENtDaBReHnBTxACfBYzA}@dBvBnHhDcAz@y@Zu@_B_@	37	21
4236	169.9	~svhAh|`uM]vAi@nJtC|@_CbJO`HhEv^qD^DjA	37	22
4237	200.5	~svhAh|`uM]vAi@nJtC|@_CbJO`HlAxL~CzUgPzEq@cC	37	23
4238	174.9	~svhAh|`uM]vAi@nJtC|@kAvDw@`EMbENtDaBReHnBTxACfBqDe@CiA]aAFE	37	25
4239	206.5	~svhAh|`uM]vA}@rP}@vFcB]uO{GY`@[fAEdC_CEgBd@bEnN}@l@_@n@UjAFdA	37	26
4241	171.5	~svhAh|`uM]vAi@nJtC|@kAvDw@`EMbENtDaBReHnBNz@FpAIfAUfA]x@o@|@eBhA	37	24
4242	221	~svhAh|`uM]vAi@nJtC|@kAvDw@`EMbENtDaBReHnBNz@FpAUtBy@lBwArA}Al@cAN{@B}AOcBk@aAzA_Cj@	37	28
4243	249.9	~svhAh|`uM]vAi@nJtC|@kAvDw@`EMbENtDaBReHnBNz@FpAUtBy@lBo@r@}@l@gA^cAN{@B}AOcBk@aAzAhArDjA_@BJ	37	29
4244	262.6	~svhAh|`uM]vAi@nJtC|@kAvDw@`EMbENtDaBReHnBTxACfBYzAo@rAaAbAiAl@mB^yA@lD|LsEnAl@tB	37	30
4246	102.9	~svhAh|`uM]vA}@rP}@vFwAW}DiBi@lAAV	37	32
4247	136.9	~svhAh|`uM]vA}@rP}@vFcB]uO{GY`@[fAIrE	37	33
4248	143.5	~svhAh|`uM]vA}@rP}@vFcB]aJ_E{MsFSOi@|@Sr@GA	37	34
4249	220.3	~svhAh|`uM]vA}@rP}@vFcB]qYcMyCcA{CY}EZxBxOd@CMaB~BU	37	35
4251	57.3	~svhAh|`uMWx@Eb@aBm@g@zAoBk@]DORKrA	37	38
4252	84.5	~svhAh|`uMWx@Eb@aBm@g@zAZRKtBaBMUrE	37	39
4253	102.6	~svhAh|`uM]vAs@pLGnBg@fDcAUqIwD	37	40
4254	113.2	~svhAh|`uMWx@Eb@aBm@g@zAoBk@]DORKhAa@?SL_@hBsKSiAS	37	41
4256	53	~svhAh|`uMWx@Eb@qFqBW]KcAkAJ	37	43
4257	100.1	~svhAh|`uMWx@Eb@qFqBW]KcAmAJASgGaCHQkBo@	37	44
4258	152.7	~svhAh|`uMWx@Eb@qFqBW]KcAmAJASgGaCHQqAg@cD_AyJmAPq@V]n@Yp@M	37	45
4259	207.7	~svhAh|`uM]vAaAfQy@bFOAsA[qYcMyCcA{CY{DTwCyPnCg@Ms@	37	46
4261	169.1	~svhAh|`uM]vA}@rP}@vFcB]a]uNcCg@}B?m@uDPc@d@E	37	48
4262	156.5	~svhAh|`uMWx@Eb@qFqBW]KcAcAFWJy@fBsAi@i@rAiGgC{DxJ_Bm@K[	37	49
4263	54.8	~svhAh|`uMf@{AwAg@l@gBlIxC	37	50
4264	233.1	livhAvbauMEn@~DVQbD`BLxDjAnOpFwApF?tBXbEnAKVrCfNcAp@zIZK	38	1
4266	163.3	livhAvbauMk@tJ_@nAxAp@y@jBdDtAzC^EbF^bEl@n@lGe@PtCdBMNlB	38	3
4267	212.7	livhAvbauMk@tJ_@nAxAp@y@jBdDtAzC^GzCNtDPtAj@n@nGe@PtCcBLrB~P{Bt@	38	4
4268	139.3	livhAvbauMEn@~DVQbD`BLhH|BaAnCWhAk@tDC~@@hBJ~AtBQ?I	38	5
4269	141.8	livhAvbauMEn@~DVQbD`BLhH|Bo@fB~HrCi@tBMhAAxA	38	6
4271	89.2	livhAvbauMEn@~DVQbD`BLhH|BsA`E	38	8
4272	136.3	livhAvbauMJsANS\\EnBj@dDwJlNbFo@fBtHjC	38	10
4273	146.9	livhAvbauMEn@~DVQbD`BLxDjAdPxFjBeFUKyA`E	38	11
4274	125	livhAvbauMJsANS\\EnBj@dDwJlNbF{D~K	38	9
4276	146	livhAvbauMJsANS\\EnBj@nDkK|b@zOs@pBHB	38	13
4277	133.8	livhAvbauMEn@~DVQbD`BLxDjAdPxFjBeFrBr@	38	14
4278	153.6	livhAvbauMJsANS\\EnBj@nDkKbf@lQxBnAJ|C	38	15
4279	181.5	livhAvbauMEn@~DVQbD`BLxDjAxT`IfDX|L{@t@hK	38	16
4281	146.9	livhAvbauMEn@~DVQbD`BLxDjAnOpF}@pCY~ABdDfDW	38	18
4282	244.1	livhAvbauMEn@~DVQbD`BLxDjAnOpF}@pCY~A?tBXbEnAKrAhRvA_@PfD_FrAAK	38	19
4283	224.7	livhAvbauM?IUA_@Ny@jE_CbGEb@lCjAk@hBS`DFD\\@IrAGTaAlAh@j@d@r@Z~@Nz@FpAMzA]jAq@lAvBnHhDcAz@y@Zu@_B_@	38	21
4284	151.6	livhAvbauMk@tJ_@nAxAp@y@jBdDtAzC^GzCFzBfBlOXs@[cCLA	38	20
4286	210.3	livhAvbauMk@tJ_@nAxAp@y@jBdDtAzC^GzCNtD~Ef`@gPzEq@cC	38	23
4287	167.6	livhAvbauM?Ia@?SLKVm@rD_CbGEb@lCjAk@hBS`DFD\\@IrAGTaAlA|@bAl@zATxACfBqDe@CiA]aAFE	38	25
4288	165.3	livhAvbauM?Ia@?WVu@`EcCtGmEiBY`@[fAEdC_CEgBd@bEnN}@l@_@n@UjAFdA	38	26
4289	135.1	livhAvbauM?Ia@?WVu@`EcCtGmEiBY`@[fAEdC_CEgBd@zBvH	38	27
4291	213.7	livhAvbauM?Ia@?SLKVm@rD_CbGEb@lCjAk@hBS`DFD\\@IrAGTaAlAh@j@d@r@Z~@Nz@Fv@ElAe@rBc@z@o@r@}@l@s@VwAVyA@wAUkAc@aAzA_Cj@	38	28
4292	242.6	livhAvbauM?Ia@?SLKVm@rD_CbGEb@lCjAk@hBS`DFD\\@IrAGTaAlAh@j@d@r@d@|ALnBMzA]jAq@lAiA`AiAd@wAVyA@wAUkAc@aAzAhArDjA_@BJ	38	29
4293	255.3	livhAvbauMa@I_@d@m@rDeCfHlCjAk@hBS`Dd@FIrAiAbB|@bAl@zAVrBI`Bs@`CiBlBeCv@uBFlD|LsEnAl@tB	38	30
4294	114.9	livhAvbauMk@tJ_@nAxAp@y@jBdDtAzC^GzCNtD_BR	38	31
4296	95.7	livhAvbauM?Ia@?WVu@`EcCtGmEiBOJe@|AIrE	38	33
4297	102.3	livhAvbauM?Ia@?WVu@`EcCtGuNaGSOi@|@Sr@GA	38	34
4298	179.1	livhAvbauM?Ia@?WVu@`EcCtGuNaGSOyCcAyAUaAC}EZ~AxJX~Cd@CMaB~BU	38	35
4299	163.6	livhAvbauM?Ia@?WVu@`EcCtGmEiBY`@[fAEdC_CEqCx@Sd@qBtM	38	36
4301	36.3	livhAvbauMEn@|AHUrE	38	39
4302	50.8	livhAvbauM?Ia@?WVg@tCcB`F	38	40
4303	60.8	livhAvbauM?IUA_@N_@hBsKSiAS	38	41
4304	64.5	livhAvbauM?Ia@?SLKVeCeAg@nAsAe@fAsC	38	42
4306	99.7	livhAvbauM?Ia@?SLKVeCeApBaFP[ROASgGaCHQkBo@	38	44
4307	152.3	livhAvbauM?Ia@?SLKVeCeApBaFP[ROASgGaCHQ}DwAqL}APq@V]n@Yp@M	38	45
4308	166.5	livhAvbauMa@IWVu@`EcCtGcTuI{CY{DTwCyPnCg@Ms@	38	46
4309	145.3	livhAvbauM?Ia@?SLKVeCeApBaFP[ROASgGaCHQqE}AoFs@_@rE	38	47
4311	138.9	livhAvbauM?Ia@?SLKVeCeAg@nAkDsAlA{CqD{A{DxJ_Bm@K[	38	49
4312	83.8	livhAvbauMJsANS\\EnBj@dDwJlIxC	38	50
4313	235.6	nkvhAdkauMTsE`BLQbD`BLxDjAnOpFwApF?tBXbEnAKVrCfNcAp@zIZK	39	1
4314	192.3	nkvhAdkauMTsE`BLQbD`BLxDjAnOpF}@pCY~A?tBXbEnAKl@jHjDW	39	2
4316	216.9	nkvhAdkauMTsE`BLQbD`BLtC|@kAvDs@jDQxC@fC^bEj@n@nGe@PtCcBLrB~P{Bt@	39	4
4317	141.8	nkvhAdkauMTsE`BLQbD`BLhH|BaAnCWhAk@tDC~@@hBJ~AtBQ?I	39	5
4318	144.3	nkvhAdkauMTsE`BLQbD`BLhH|Bo@fB~HrCi@tBMhAAxA	39	6
4319	119.3	nkvhAdkauMTsE`BLQbD`BLhH|Bo@fBrEbB_@tA	39	7
4321	149.2	nkvhAdkauMTsE`BLQbD`BLxDjA`IrCxEgNbBj@	39	10
4322	149.4	nkvhAdkauMTsE`BLQbD`BLxDjAdPxFjBeFUKyA`E	39	11
4323	138.6	nkvhAdkauMTsE`BLQbD`BLhH|BHUoBq@~B}GnBp@{@dC	39	9
4324	138.9	nkvhAdkauMTsE`BLQbD`BLxDjAxT`IbCXhCKBP	39	12
4326	136.3	nkvhAdkauMTsE`BLQbD`BLxDjAdPxFjBeFrBr@	39	14
4327	174.3	nkvhAdkauMTsE`BLJuB[SnDkKbf@lQxBnAJ|C	39	15
4328	184	nkvhAdkauMTsE`BLQbD`BLxDjAxT`IfDX|L{@t@hK	39	16
4329	213.4	nkvhAdkauMTsE`BLQbD`BLxDjAnOpFwApF?tBXbEnS}AC[yET	39	17
4331	246.6	nkvhAdkauMTsE`BLQbD`BLxDjAnOpF}@pCY~A?tBXbEnAKrAhRvA_@PfD_FrAAK	39	19
4332	246	nkvhAdkauMTsE`BLQbD`BLtC|@kAvDw@`EMbENtDaBReHnBTxACfBYzA}@dBvBnHhDcAz@y@Zu@_B_@	39	21
4333	155.8	nkvhAdkauMTsE`BLQbD`BLtC|@}@pCe@pB_@tBMbC@fCLlB~ArMXs@[cCLA	39	20
4334	183.9	nkvhAdkauMTsE`BLQbD`BLtC|@kAvDs@jDQxC@fCLlBt@xGdCnRqD^DjA	39	22
4336	188.9	nkvhAdkauMTsE`BLQbD`BLtC|@kAvDw@`EMbENtDaBReHnBTxACfBqDe@CiA]aAFE	39	25
4337	201.6	nkvhAdkauMTsE}AIDy@a@?SLKVm@rDcCtGmEiBY`@[fAEdC_CEgBd@bEnN}@l@_@n@UjAFdA	39	26
4338	171.4	nkvhAdkauMTsE}AIDy@a@?SLKVm@rDcCtGmEiBY`@[fAEdC_CEgBd@zBvH	39	27
4339	185.5	nkvhAdkauMTsE`BLQbD`BLtC|@kAvDw@`EMbENtDaBReHnBNz@FpAIfAUfA]x@o@|@eBhA	39	24
4341	263.9	nkvhAdkauMTsE`BLQbD`BLtC|@kAvDw@`EMbENtDaBReHnBNz@FpAUtBy@lBo@r@}@l@gA^cAN{@B}AOcBk@aAzAhArDjA_@BJ	39	29
4342	276.6	nkvhAdkauMTsE`BLQbD`BLtC|@kAvDw@`EMbENtDaBReHnBTxACfBYzAo@rAaAbAiAl@mB^yA@lD|LsEnAl@tB	39	30
4343	119.1	nkvhAdkauMTsE`BLQbD`BLtC|@kAvDw@`EMbENtD_BR	39	31
4344	112	nkvhAdkauMTsE}AIDy@a@?SLKVm@rDcCtGAPlCjA_@|@AV	39	32
4346	138.6	nkvhAdkauMTsE}AIDy@UAWDS`@m@rDcCtGuNaGSOi@|@Sr@GA	39	34
4347	215.4	nkvhAdkauMTsE}AIDy@UAk@f@m@rDcCtGcTuI{CY}EZxBxOd@CMaB~BU	39	35
4348	199.9	nkvhAdkauMTsE}AIDy@a@?SLKVm@rDcCtGmEiBY`@[fAEdC_CEqCx@Sd@qBtM	39	36
4349	80.5	nkvhAdkauMTsE`BLJuB[Sf@{A`Bl@Dc@Vy@	39	37
4351	82.6	nkvhAdkauMTsE}AIe@dI_@nAyB_A	39	40
4352	97.1	nkvhAdkauMTsE}AIDy@a@?SL_@hBsKSiAS	39	41
4353	100.8	nkvhAdkauMTsE}AIDy@m@BS`@eCeAg@nAsAe@fAsC	39	42
4354	90.6	nkvhAdkauMTsE}AIDy@m@BS`@eCeApBaFP[TO	39	43
4356	188.6	nkvhAdkauMTsE}AIDy@m@BS`@eCeApBaFP[ROASgGaCHQ}DwAqL}APq@V]n@Yp@M	39	45
4357	202.8	nkvhAdkauMTsE}AIDy@UAk@f@m@rDcCtGcTuI{CY{DTwCyPnCg@Ms@	39	46
4358	181.6	nkvhAdkauMTsE}AIDy@m@BS`@eCeApBaFP[ROASgGaCHQ}DwAcGy@_@rE	39	47
4359	164.2	nkvhAdkauMTsE}AIDy@a@?SLKVm@rDcCtGuNaGSOyCcAyAU}B?m@uDPc@d@E	39	48
4361	104.5	nkvhAdkauMTsE`BLJuB[SdDwJlIxC	39	50
4362	199.3	fcvhA|nauMo@pB|IzDlDd@GzCNtDPtAj@n@hSyAVrCfNcAp@zIZK	40	1
4363	156	fcvhA|nauMo@pB|IzDlDd@GzCNtDPtAj@n@hSyAl@jHjDW	40	2
4364	125.3	fcvhA|nauMi@lAEb@|IzDlDd@GzCNtDPtAj@n@nGe@PtCdBMNlB	40	3
4366	121.2	fcvhA|nauMi@lAEb@|IzDlDd@GzCNtDPtAj@n@WqChF_@?I	40	5
4367	138.9	fcvhA|nauMi@lAEb@jIrDhAX`CP^[b@mCrBb@h@qB~HrCi@tBMhAAxA	40	6
4368	113.9	fcvhA|nauMi@lAEb@jIrDv@RrCV^[b@mCrBb@h@qBrEbB_@tA	40	7
4369	77.6	fcvhA|nauMi@lAEb@jIrDv@RrCV^[b@mCrBb@DW	40	8
4371	156.3	fcvhA|nauMo@pB|IzDpDd@f@]b@mC|AgFdPxFjBeFUKyA`E	40	11
4372	112.9	fcvhA|nauMi@lAEb@|IzDv@PxBRf@]b@mC|AgFhCsHnBp@{@dC	40	9
4373	145.8	fcvhA|nauMo@pBjIrD~Ch@j@@^[b@mC|AgFxT`IbCXhCKBP	40	12
4374	170.7	fcvhA|nauMo@pB|IzDlC`@r@AVWb@mC|AgFpGcR`WjJs@pBHB	40	13
4376	178.3	fcvhA|nauMo@pB|IzDlC`@r@AVWb@mC|AgFpGcRd\\`Mz@j@J|C	40	15
4377	166.6	fcvhA|nauMo@pB|IzDlDd@GzCNtDPtAl@n@xl@qE@N	40	16
4378	177.1	fcvhA|nauMo@pB|IzDlDd@GzCNtDPtAl@n@fe@kDC[yET	40	17
4379	134.4	fcvhA|nauMi@lAEb@|IzDlDd@GzCNtDPtAl@n@pQqAWsCnCS	40	18
4381	185.4	fcvhA|nauMi@lAEb@lCjAk@hBS`DFD\\@IrAGTaAlA|@bA`@z@T|@LtAElAO`Aa@hAe@t@vBnHhDcAz@y@Zu@_B_@	40	21
4382	113.6	fcvhA|nauMi@lAEb@|IzDlDd@GzCFzBfBlOXs@[cCLA	40	20
4383	141.7	fcvhA|nauMi@lAEb@|IzDlDd@GzCNtDzDh[qD^DjA	40	22
4384	172.3	fcvhA|nauMi@lAEb@|IzDlDd@GzCNtDbCfSzA~KgPzEq@cC	40	23
4386	126	fcvhA|nauMm@~AmEiBY`@[fAEdC_CEgBd@bEnN}@l@_@n@UjAFdA	40	26
4387	95.8	fcvhA|nauMm@~AmEiBY`@[fAEdC_CEgBd@zBvH	40	27
4388	124.9	fcvhA|nauMi@lAEb@lCjAk@hBS`DFD\\@IrAGTaAlA|@bA`@z@ZzADjBSzAg@rAaAlAsAx@	40	24
4389	174.4	fcvhA|nauMi@lAEb@lCjAk@hBS`DFD\\@IrAGTaAlAh@j@d@r@Z~@Nz@DjB]tB]x@o@|@y@n@iAd@wAVyA@wAUkAc@aAzA_Cj@	40	28
4391	216	fcvhA|nauMi@lAEb@lCjAk@hBS`DFD\\@IrAGTaAlA|@bAl@zATxACfBO`Aa@hAe@t@s@p@aAh@q@RcANyA@lD|LsEnAl@tB	40	30
4392	76.9	fcvhA|nauMi@lAEb@|IzDlDd@GzCNtD_BR	40	31
4393	36.4	fcvhA|nauMi@lAEb@lCjA_@|@AV	40	32
4315	167.5	nkvhAdkauMTsE`BLQbD`BLtC|@yAzEo@dEEbF^bEl@n@lGe@PtCdBMNlB	39	3
4320	91.7	nkvhAdkauMTsE`BLQbD`BLhH|BsA`E	39	8
4325	166.7	nkvhAdkauMTsE`BLJuB[SnDkK|b@zOs@pBHB	39	13
4330	149.4	nkvhAdkauMTsE`BLQbD`BLxDjAnOpF}@pCY~ABdDfDW	39	18
4335	214.5	nkvhAdkauMTsE`BLQbD`BLtC|@_CbJO`HlAxL~CzUgPzEq@cC	39	23
4340	235	nkvhAdkauMTsE`BLQbD`BLtC|@kAvDw@`EMbENtDaBReHnBNz@FpAUtBy@lBwArA}Al@cAN{@B}AOcBk@aAzA_Cj@	39	28
4345	132	nkvhAdkauMTsE}AIDy@a@?SLKVm@rDcCtGmEiBOJe@|AIrE	39	33
4350	36.3	nkvhAdkauMTsE}AIDo@	39	38
4355	136	nkvhAdkauMTsE}AIDy@m@BS`@eCeApBaFP[ROASgGaCHQkBo@	39	44
4360	175.2	nkvhAdkauMTsE}AIDy@m@BS`@eCeAg@nAkDsAlA{CqD{A{DxJ_Bm@K[	39	49
4365	174.7	fcvhA|nauMi@lAEb@|IzDlDd@GzCNtDPtAj@n@nGe@PtCcBLrB~P{Bt@	40	4
4370	148.1	fcvhA|nauMi@lAEb@|IzDv@P|BRb@]b@mC|AgFhCsHnBp@nAqDtHjC	40	10
4375	143.2	fcvhA|nauMo@pB|IzDpDd@f@]b@mC|AgFdPxFjBeFrBr@	40	14
4380	210.3	fcvhA|nauMo@pB|IzDlDd@GzCNtDPtAj@n@hSyArAhRvA_@PfD_FrAAK	40	19
4385	128.3	fcvhA|nauMi@lAEb@lCjAk@hBS`DFD\\@IrAGTaAlA|@bAl@zATxACfBqDe@CiA]aAFE	40	25
4390	203.3	fcvhA|nauMi@lAEb@lCjAk@hBS`DFD\\@IrAGTaAlA|@bAl@zAVrBI`BUfAo@rAaAbAiAl@mB^yA@wAUkAc@aAzAhArDjA_@BJ	40	29
4395	63	fcvhA|nauMm@~AuNaGSOi@|@Sr@GA	40	34
4400	79.3	fcvhA|nauMxB~@\\aAf@sI|AHUrE	40	39
4405	173.5	fcvhA|nauMm@~A{JcERo@NgCNu@jGsOqE}A}KwAPq@V]n@Yp@M	40	45
4410	129.7	fcvhA|nauMbBaF^gCJWRM`@?JiA^Y|Bj@dDwJlIxC	40	50
4415	181	xwuhA|dauMhARrKRY`B_CbGEb@|IzDlDd@GzCNtDPtAj@n@WqChF_@?I	41	5
4420	206.3	xwuhA|dauMhARrFHD}@pDuIpCSfDhA|AsEl[dLaGvP	41	11
4425	209.7	xwuhA|dauMhARrFHD}@pDuIpCSfDhA|AsEbf@lQxBnAJ|C	41	15
4430	245.2	xwuhA|dauMhARrKRY`B_CbGEb@lCjAk@hBS`DFD\\@IrAGTaAlA|@bA`@z@T|@LtAElAO`Aa@hAe@t@vBnHhDcAz@y@Zu@_B_@	41	21
4435	159.3	xwuhA|dauMMEDKtCiHyAo@gGnO_@f@UjA?p@Jt@nGtT}@l@_@n@UjAFdA	41	26
4440	275.8	xwuhA|dauMhARrKRY`BeCfHlCjAk@hBS`Dd@FIrAiAbB|@bAl@zATxACfBq@jCyAfBsB|@}CPlD|LsEnAl@tB	41	30
4445	179.7	xwuhA|dauMMEDKtCiHyAo@}FxNyCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	41	35
4450	71.3	xwuhA|dauMhARrKRY`BuAtD	41	40
4455	167.1	xwuhA|dauMMEDKtCiHyAo@}FxNyCcAyAU}B?_CPwCyPnCg@Ms@	41	46
4460	270	pavhAb~`uMgArCrAd@E|@~CHY`BeCfH|IzDlDd@GzCNtDPtAj@n@hSyAVrCfNcAp@zIZK	42	1
4465	206	pavhAb~`uMn@}ArAh@x@gBVKbAGFx@T`@tChAg@zAVLBR]jG`BLhH|Bo@fB~HrCi@tBMhAAxA	42	6
4470	146.8	pavhAb~`uMn@}ArAh@r@_B\\SbAG|@@~CfArA_ElNbF{D~K	42	9
4475	215.2	pavhAb~`uMn@}ArAh@r@_B\\S`CE~CfA|AsE~d@vP|CdB`B~W	42	16
4480	184.3	pavhAb~`uMgArCrAd@E|@~CHY`B_CbGEb@|IzDlDd@GzCFzBfBlOXs@[cCLA	42	20
4485	114.2	pavhAb~`uMDIiGgCgGnOSNUn@Kr@BjAnExO	42	27
4490	147.6	pavhAb~`uMgArCrAd@E|@~CHY`B_CbGEb@|IzDlDd@GzCNtD_BR	42	31
4495	149.5	pavhAb~`uMDIiGgCgGnO_@f@UjABjArA`Fi@RSd@qBtM	42	36
4500	50.5	pavhAb~`uMgArCwAm@g@lAIz@m@Cw@Q	42	41
4505	104.5	pavhAb~`uMn@}AmDwAhAuCqAg@_Cu@oFs@_@rE	42	47
4510	220.2	~gvhA~x`uMjAKFx@T`@tChAg@zAVLBR]jG`BLxDjAnOpF}@pCY~A?tBXbEnAKl@jHjDW	43	2
4515	147.2	~gvhA~x`uMjAKFx@T`@tChAg@zAVLBR]jG`BLhH|Bo@fBrEbB_@tA	43	7
4520	159	~gvhA~x`uM`CKfDhA|AsE|b@zOqB`Gh@vI	43	12
4525	212.8	~gvhA~x`uM`CKfDhA|AsE~d@vP|CdB|AvVmMv@	43	17
4530	211.1	~gvhA~x`uMg@j@qB`FdCdAm@rDeCfH|IzDlDd@GzCNtDzDh[qD^DjA	43	22
4535	194.3	~gvhA~x`uMUNQZqB`FdCdAm@rD_CbGEb@lCjAk@hBS`DFD\\@IrAGTaAlA|@bA`@z@ZzADjBSzAg@rAaAlAsAx@	43	24
4540	105.8	~gvhA~x`uMUNQZqB`FdCdAm@rDcCtGAPlCjA_@|@AV	43	32
4545	52.4	~gvhA~x`uMjAKFx@Zf@pFpBDc@Vy@	43	37
4550	34	~gvhA~x`uMUNs@~AsAi@o@|A	43	42
4555	140.3	~gvhA~x`uMUNs@~AsAi@i@rAiGgC{DxJ_Bm@{ACs@MTgAEQMKcAMwBE	43	48
4560	196.8	p|uhAfr`uMNB{JtV|Y`M~Dl@EbF^bEl@n@lGe@PtCdBMNlB	44	3
4565	149.1	p|uhAfr`uMNB{JtV|Y`Mv@RrCV^[b@mCrBb@DW	44	8
4570	180	p|uhAfr`uMeBm@sCa@HaBQ{E`DSr@JjJpFhGrChh@lRs@pBHB	44	13
4575	205.9	p|uhAfr`uMNB{JtV|Y`M~Dl@GzCNtDPtAl@n@pQqAWsCnCS	44	18
4580	243.8	p|uhAfr`uMNB{JtV|Y`M~Dl@GzCNtD~Ef`@gPzEq@cC	44	23
4585	208.2	p|uhAfr`uMNB{K|WWbBLnAnGtT}@l@k@fAInANbA\\p@lAx@~BF`AhD}CPcDy@aAzA_Cj@	44	28
4590	103.8	p|uhAfr`uMNB{JtVtH|Ce@|AIrE	44	33
4595	119	p|uhAfr`uMNBsBdFpDzAmAzCjDrAf@oAdCdAJWRM`@??H	44	38
4600	85.9	p|uhAfr`uMNBsBdFxAn@jAuCbG~BP[TO	44	43
4605	58.4	p|uhAfr`uMNBoH~Q_Bm@K[	44	49
4610	289.9	xpuhAhj`uMbCOM_C`DSr@JpN`IlSxHuIrVkAnGEbF^bEl@n@lGe@PtCcBLrB~P{Bt@	45	4
4615	164.8	xpuhAhj`uMbCOM_C`DSr@JpN`IlSxHGPlC`Ao@fBtHjC	45	10
4620	174.7	xpuhAhj`uMbCOM_C`DSr@JjJpFhGrCx`@vNgDtJhC~@	45	14
4625	294.1	xpuhAhj`uMbCOM_CtEGtRdKbk@vS|BpAxHtHz@vBx@nSiCl@WvCaD~ByYbI	45	19
4630	225.2	xpuhAhj`uMbDM~Ez@tAl@mNb]WbBLnAnGtTqAdA]hADdBb@dAb@`@vAb@pAC`Aa@v@aAT_AY{C	45	25
4635	267.2	xpuhAhj`uMbDM~Ez@tAl@mNb]UjAJfBnGtT}@l@_@n@UjAHjAeJtCdDjMdGgBBJ	45	29
4640	115.6	xpuhAhj`uMbCO^@~Ez@tAl@mMz[SN_@jAGA	45	34
4645	169.8	xpuhAhj`uMbCOM_C`DSr@JtD~B`FjC|ExBjDpAoDjKZRKtBaBMUrE	45	39
4650	57.7	xpuhAhj`uMbCO^@~Ez@tAl@qAdDOC	45	44
4655	113.4	xpuhAhj`uMbCOM_C`DSr@JpN`IpMbFGPhDlA	45	50
4660	271.8	fauhAlr`uMa@_D`AW~AC~Q|BxCz@{JtV|Y`M~Dl@GzCNtDPtAj@n@WqChFi@	46	5
4665	219.9	fauhAlr`uMa@_D`AWpDJBoDrPkAr@JjJpFhGrCx`@vNaGvP	46	11
4396	139.8	fcvhA|nauMm@~AuNaGSOyCcAyAUaAC}EZ~AxJX~Cd@CMaB~BU	40	35
4397	124.3	fcvhA|nauMm@~AmEiBY`@[fAEdC_CEqCx@Sd@qBtM	40	36
4398	105.7	fcvhA|nauMbBaF^gCRa@l@CPuAXML?nBj@f@{A`Bl@Dc@Vy@	40	37
4399	44.3	fcvhA|nauMbBaFf@uCVW`@??H	40	38
4401	62.4	fcvhA|nauMm@~A{JcERo@TeDBKLD	40	41
4402	77.6	fcvhA|nauMtAuDXaB_DID}@sAe@fAsC	40	42
4403	76.7	fcvhA|nauMbBaF^gCeCeApBaFP[TO	40	43
4404	120.9	fcvhA|nauMm@~A{JcERo@NgCNu@jGsOkBo@	40	44
4406	127.2	fcvhA|nauMm@~AuNaGSOyCcAyAUaAC{DTwCyPnCg@Ms@	40	46
4407	148.2	fcvhA|nauMm@~AuNaGSOyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	40	47
4408	88.6	fcvhA|nauMm@~AuNaGSOyCcAyAU}B?m@uDPc@d@E	40	48
4409	117.4	fcvhA|nauMm@~AuNaGSOyCcAyAU}B?YgBh@I~AEzC`@TAb@i@@P	40	49
4411	259.1	xwuhA|dauMhARrKRY`BeCfH|IzDlDd@GzCNtDPtAj@n@hSyAVrCfNcAp@zIZK	41	1
4412	215.8	xwuhA|dauMhARrKRY`BeCfH|IzDlDd@GzCNtDPtAj@n@hSyAl@jHjDW	41	2
4413	185.1	xwuhA|dauMhARrKRY`B_CbGEb@|IzDlDd@EbF^bEl@n@lGe@PtCdBMNlB	41	3
4414	234.5	xwuhA|dauMhARrKRY`B_CbGEb@|IzDlDd@GzCNtDPtAj@n@nGe@PtCcBLrB~P{Bt@	41	4
4416	198.7	xwuhA|dauMhARrKRY`BeCfH|IzDxDb@^[b@mCrBb@h@qB~HrCi@tBObD	41	6
4417	173.7	xwuhA|dauMhARrKRY`B_CbGEb@jIrDhAX`CP^[b@mCrBb@h@qBrEbB_@tA	41	7
4418	137.4	xwuhA|dauMhARrKRY`B_CbGEb@jIrDhAX|BRb@]b@mCrBb@DW	41	8
4419	192.4	xwuhA|dauMhARrFHD}@pDuIpCSfDhArA_ElNbFo@fBtHjC	41	10
4421	172.7	xwuhA|dauMhARrKRY`B_CbGEb@|IzDv@PxBRf@]b@mC|AgFhCsHnBp@{@dC	41	9
4422	197.1	xwuhA|dauMhARrKR^iBt@MEx@~DVQbD`BLxDjAxT`IbCXhCKBP	41	12
4423	202.1	xwuhA|dauMhARrFHD}@pDuIpCSfDhA|AsE|b@zOs@pBHB	41	13
4424	194.5	xwuhA|dauMhARrKR^iBt@MEx@~DVQbD`BLxDjAdPxFjBeFrBr@	41	14
4426	226.4	xwuhA|dauMhARrKRY`BeCfH|IzDlDd@GzCNtDPtAl@n@xl@qE@N	41	16
4427	236.9	xwuhA|dauMhARrKRY`BeCfH|IzDlDd@GzCNtDPtAl@n@fe@kDC[yET	41	17
4428	194.2	xwuhA|dauMhARrKRY`BeCfH|IzDlDd@GzCNtDPtAj@n@rQqAWsCnCS	41	18
4429	270.1	xwuhA|dauMhARrKRY`BeCfH|IzDlDd@GzCNtDPtAj@n@hSyArAhRvA_@PfD_FrAAK	41	19
4431	173.4	xwuhA|dauMhARrKRY`B_CbGEb@|IzDlDd@GzCFzBfBlOXs@[cCLA	41	20
4432	201.5	xwuhA|dauMhARrKRY`B_CbGEb@|IzDlDd@GzCNtDzDh[qD^DjA	41	22
4433	232.1	xwuhA|dauMhARrKRY`BeCfH|IzDlDd@GzCNtD~Ef`@gPzEq@cC	41	23
4434	188.1	xwuhA|dauMhARrKRY`B_CbGEb@lCjAk@hBS`DFD\\@IrAGTaAlA|@bAl@zATxACfBqDe@CiA]aAFE	41	25
4436	129.1	xwuhA|dauMMEDKtCiHyAo@gGnO_@f@UjA?p@Jt@fE|N	41	27
4437	184.7	xwuhA|dauMhARrKRY`B_CbGEb@lCjAk@hBS`DFD\\@IrAGTaAlA|@bAl@zATxACfBYzAo@rAaAbAaAh@	41	24
4438	234.2	xwuhA|dauMhARrKRY`B_CbGEb@lCjAk@hBS`DFD\\@IrAGTaAlA|@bAl@zATxACfBYzAo@rAaAbAaAh@yA\\wAH}AOcBk@aAzA_Cj@	41	28
4439	246.7	xwuhA|dauMGQtCiHyAo@gHvPWbBLnAnGtT}@l@_@n@UjAHjAeJtCdDjMdGgBBJ	41	29
4441	136.7	xwuhA|dauMhARrKRY`B_CbGEb@|IzDlDd@GzCNtD_BR	41	31
4442	96.2	xwuhA|dauMhARrKRY`B_CbGEb@lCjA_@|@AV	41	32
4443	116.2	xwuhA|dauMhARrKRY`BcCtGmEiBOJe@|AIrE	41	33
4444	95.1	xwuhA|dauMMEDKtCiHyAo@gGnOSN_@jAGA	41	34
4446	164.4	xwuhA|dauMMEDKtCiHyAo@gGnO_@f@Sr@@bBrA`Fi@RSd@qBtM	41	36
4447	120.5	xwuhA|dauMhARrFHD}@xCqHVc@VKbAGFx@Zf@pFpBDc@Vy@	41	37
4448	60.7	xwuhA|dauMhARrKR^iB^OT@?H	41	38
4449	97	xwuhA|dauMhARrKR^iBRM`@?Ex@|AHUrE	41	39
4451	52	xwuhA|dauMMEDKtCiHnDvAEH	41	42
4452	68.1	xwuhA|dauMhARrFHD}@xCqHP[TO	41	43
4453	66.5	xwuhA|dauMMEHWfGgOkBo@	41	44
4454	119.1	xwuhA|dauMMEHWfGgOqE}A}KwAPq@V]n@Yp@M	41	45
4456	112.1	xwuhA|dauMMEHWfGgOqE}AoFs@_@rE	41	47
4457	126.2	xwuhA|dauMMEDKtCiHyAo@{DxJ_Bm@{ACs@MTgAEQMKcAMwBE	41	48
4458	89.4	xwuhA|dauMMEDKtCiHyAo@{DxJ_Bm@K[	41	49
4459	139.9	xwuhA|dauMhARrFHD}@pDuIf@MhBEfDhArA_ElIxC	41	50
4461	226.7	pavhAb~`uMgArCrAd@E|@~CHY`BeCfH|IzDlDd@GzCNtDPtAj@n@hSyAl@jHjDW	42	2
4462	196	pavhAb~`uMgArCrAd@E|@~CHY`B_CbGEb@|IzDlDd@EbF^bEl@n@lGe@PtCdBMNlB	42	3
4463	245.4	pavhAb~`uMgArCrAd@E|@~CHY`B_CbGEb@|IzDlDd@GzCNtDPtAj@n@nGe@PtCcBLrB~P{Bt@	42	4
4464	191.9	pavhAb~`uMgArCrAd@E|@~CHY`B_CbGEb@|IzDlDd@GzCNtDPtAj@n@WqChF_@?I	42	5
4466	181	pavhAb~`uMn@}ArAh@x@gBVKbAGFx@T`@tChAg@zAVLBR]jG`BLhH|Bo@fBrEbB_@tA	42	7
4467	148.3	pavhAb~`uMgArCrAd@E|@~CHY`B_CbGEb@|IzDv@PxBRf@]b@mCrBb@DW	42	8
4468	158.1	pavhAb~`uMn@}ArAh@r@_B\\SbAG|@@~CfArA_ElNbFo@fBtHjC	42	10
4469	172	pavhAb~`uMn@}ArAh@r@_B\\S`CE~CfA|AsEl[dLaGvP	42	11
4471	192.8	pavhAb~`uMn@}ArAh@r@_B\\S`CE~CfA|AsE|b@zOqB`Gh@vI	42	12
4472	167.8	pavhAb~`uMn@}ArAh@r@_B\\S`CE~CfA|AsE|b@zOs@pBHB	42	13
4473	176.1	pavhAb~`uMn@}ArAh@r@_B\\S`CE~CfA|AsEl[dLgDtJhC~@	42	14
4474	175.4	pavhAb~`uMn@}ArAh@r@_B\\S`CE~CfA|AsEbf@lQxBnAJ|C	42	15
4476	246.6	pavhAb~`uMn@}ArAh@r@_B\\S`CE~CfA|AsEl[dLhLxEd@\\|AvVmMv@	42	17
4477	205.1	pavhAb~`uMgArCrAd@E|@~CHY`BeCfH|IzDlDd@GzCNtDPtAj@n@rQqAWsCnCS	42	18
4478	281	pavhAb~`uMgArCrAd@E|@~CHY`BeCfH|IzDlDd@GzCNtDPtAj@n@hSyArAhRvA_@PfD_FrAAK	42	19
4479	244.5	pavhAb~`uMcGqC{HjRH~BnGtT}@l@_@n@UjAHjAb@dAlAx@~BFhDrLtJ}CbA_B_B_@	42	21
4481	212.4	pavhAb~`uMgArCrAd@E|@~CHY`BeCfH|IzDlDd@GzCNtDzDh[qD^DjA	42	22
4482	243	pavhAb~`uMgArCrAd@E|@~CHY`BeCfH|IzDlDd@GzCNtD~Ef`@gPzEq@cC	42	23
4483	189.8	pavhAb~`uMDIiGgCgGnO_@f@UjA?p@Jt@nGtTe@Vk@l@]hACt@Hn@b@dAb@`@h@Vl@JpAC`Aa@v@aAT_A@o@QeAQ_@FE	42	25
4484	144.4	pavhAb~`uMDIiGgCgGnO_@f@Sr@AhAJt@nGtT}@l@_@n@UjAFdA	42	26
4486	194.4	pavhAb~`uMDIiGgCgGnO_@f@Sr@Cn@LnAjEhO|@SlAIjAB~@PfAb@n@b@|@bA`@z@T|@LtAElAO`Aa@hAe@t@s@p@aAh@	42	24
4487	224.3	pavhAb~`uMDIiGgCgGnO_@f@UjA?p@Jt@nGtT}@l@_@n@UjAHjAb@dAb@`@h@VfALv@E`AhDcANyA@wAUkAc@aAzA_Cj@	42	28
4488	231.8	pavhAb~`uMcGqC{HjRH~BnGtT}@l@_@n@UjAHjAeJtCdDjMdGgBBJ	42	29
4489	265.9	pavhAb~`uMcGqCgHvPUjAJfBnGtT}@l@_@n@UjAHjAb@dAlAx@~BF`AhD}CPlD|LsEnAl@tB	42	30
4491	107.1	pavhAb~`uMgArCrAd@E|@~CHY`B_CbGEb@lCjA_@|@AV	42	32
4492	119.9	pavhAb~`uMDIiGgCgGnOtH|Ce@|AIrE	42	33
4493	80.2	pavhAb~`uMDIiGgCgGnOSN_@jAGA	42	34
4494	164.8	pavhAb~`uMDIiGgC}FxNyCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	42	35
4496	86.2	pavhAb~`uMn@}ArAh@x@gBVKbAGFx@Zf@pFpBDc@Vy@	42	37
4497	66.7	pavhAb~`uMn@}ArAh@oA|CdCdAJWRM`@??H	42	38
4498	103	pavhAb~`uMn@}ArAh@oA|CdCdARa@l@CEx@|AHUrE	42	39
4499	82.2	pavhAb~`uMgArCrAd@E|@~CHY`BuAtD	42	40
4501	33.8	pavhAb~`uMn@}ArAh@l@uAZY	42	43
4502	58.9	pavhAb~`uMn@}AmDwAhAuCkBo@	42	44
4503	111.5	pavhAb~`uMn@}AmDwAhAuCqE}A}KwAPq@V]n@Yp@M	42	45
4504	152.2	pavhAb~`uMDIiGgC}FxNyCcAyAU}B?_CPwCyPnCg@Ms@	42	46
4506	111.3	pavhAb~`uMDIiGgC{DxJ_Bm@{ACs@MTgAEQMKcAMwBE	42	48
4507	74.5	pavhAb~`uMDIiGgC{DxJ_Bm@K[	42	49
4508	105.6	pavhAb~`uMn@}ArAh@r@_B\\SbAG|@@~CfArA_ElIxC	42	50
4509	257.8	~gvhA~x`uM`CKfDhA|AsEje@~PhCvA`HvGrAtC~@dSSR{Bb@Md@FhAQf@aD~BgExAuDx@UcDjDeA	43	1
4511	194.7	~gvhA~x`uMUNQZqB`FdCdAm@rD_CbGEb@|IzDlDd@EbF^bEl@n@lGe@PtCdBMNlB	43	3
4512	244.1	~gvhA~x`uMg@j@qB`FdCdAm@rDeCfH|IzDlDd@GzCNtDPtAj@n@nGe@PtCcBLrB~P{Bt@	43	4
4513	169.7	~gvhA~x`uMjAKFx@T`@tChAg@zAVLBR]jG`BLhH|BaAnCWhAk@tDC~@@hBJ~AtBQ?I	43	5
4514	172.2	~gvhA~x`uMjAKFx@T`@tChAg@zAVLBR]jG`BLhH|Bo@fB~HrCi@tBMhAAxA	43	6
4516	119.6	~gvhA~x`uMjAKFx@T`@tChAg@zAVLBR]jG`BLhH|BsA`E	43	8
4517	124.3	~gvhA~x`uMjAKt@?fDhArA_ElNbFo@fBtHjC	43	10
4518	138.2	~gvhA~x`uMjAKt@?fDhA|AsEl[dLaGvP	43	11
4519	113	~gvhA~x`uMjAKt@?fDhArA_ElNbF{D~K	43	9
4521	134	~gvhA~x`uM`CKfDhA|AsE|b@zOs@pBHB	43	13
4522	142.3	~gvhA~x`uMjAKt@?fDhA|AsEl[dLgDtJhC~@	43	14
4523	141.6	~gvhA~x`uM`CKfDhA|AsEbf@lQxBnAJ|C	43	15
4524	181.4	~gvhA~x`uM`CKfDhA|AsEl[dLhLxEd@\\`B~W	43	16
4526	177.3	~gvhA~x`uMjAKFx@T`@tChAg@zAVLBR]jG`BLxDjAnOpF}@pCY~ABdDfDW	43	18
4527	261.7	~gvhA~x`uM`CKfDhA|AsEbf@lQ|DlCtErEl@`Ad@rAV~CEpAr@pJKj@iCl@Md@FhAQf@aD~BgExAoStFAK	43	19
4528	254.8	~gvhA~x`uMg@j@qB`FdCdAm@rDeCfHlCjAk@hBS`Dd@FIrAiAbB~A~Bb@rCUnCgA~BvBnHhDcAz@y@Zu@_B_@	43	21
4529	183	~gvhA~x`uMUNQZqB`FdCdAm@rD_CbGEb@|IzDlDd@GzCFzBfBlOXs@[cCLA	43	20
4531	241.7	~gvhA~x`uMg@j@qB`FdCdAm@rDeCfH|IzDlDd@GzCNtD~Ef`@gPzEq@cC	43	23
4532	197.7	~gvhA~x`uMUNQZqB`FdCdAm@rD_CbGEb@lCjAk@hBS`DFD\\@IrAGTaAlA|@bAl@zATxACfBqDe@CiA]aAFE	43	25
4533	173.4	~gvhA~x`uMUNs@~AsAi@i@rAiGgCgGnOSNUn@MjALnAnGtT}@l@_@n@UjAFdA	43	26
4534	143.2	~gvhA~x`uMUNs@~AsAi@i@rAiGgCgGnO_@f@UjABjAnExO	43	27
4536	243.8	~gvhA~x`uMUNQZqB`FdCdAm@rD_CbGEb@lCjAk@hBS`DFD\\@IrAGTaAlAh@j@d@r@Z~@Nz@DjB]tB]x@o@|@y@n@iAd@wAVyA@wAUkAc@aAzA_Cj@	43	28
4537	260.8	~gvhA~x`uMiAnBsAi@i@rAiGgC{HjRH~BnGtT}@l@_@n@UjAHjAeJtCdDjMdGgBBJ	43	29
4538	285.4	~gvhA~x`uMg@j@qB`FdCdAm@rDeCfHlCjAk@hBS`Dd@FIrAiAbB|@bAl@zATxACfBq@jCyAfBsB|@}CPlD|LsEnAl@tB	43	30
4539	146.3	~gvhA~x`uMUNQZqB`FdCdAm@rD_CbGEb@|IzDlDd@GzCNtD_BR	43	31
4541	125.8	~gvhA~x`uMUNQZqB`FdCdAm@rDcCtGmEiBOJe@|AIrE	43	33
4542	109.2	~gvhA~x`uMUNs@~AsAi@i@rAiGgCgGnOSN_@jAGA	43	34
4543	193.8	~gvhA~x`uMUNs@~AsAi@i@rAiGgC}FxNyCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	43	35
4544	178.5	~gvhA~x`uMUNs@~AsAi@i@rAiGgCgGnO_@f@Sr@@bBrA`Fi@RSd@qBtM	43	36
4546	57.9	~gvhA~x`uMUNQZqB`FdCdAJWRM`@??H	43	38
4547	89.9	~gvhA~x`uMjAKFx@T`@tChAg@zAZRKtBaBMUrE	43	39
4548	80.9	~gvhA~x`uMUNQZqB`FdCdA_@fCcB`F	43	40
4549	65.1	~gvhA~x`uMUNQZyCpHE|@sFIiAS	43	41
4551	47.1	~gvhA~x`uMCSgGaCHQkBo@	43	44
4552	99.7	~gvhA~x`uMCSgGaCHQ}DwAqL}APq@V]n@Yp@M	43	45
4553	172.2	~gvhA~x`uMCSgGaCHQqAg@_Cu@oFs@o@bIq@jCoCa@}BCkAFwAiI	43	46
4554	92.7	~gvhA~x`uMCSgGaCHQqAg@_Cu@oFs@_@rE	43	47
4556	103.5	~gvhA~x`uMUNs@~AsAi@i@rAiGgC{DxJ_Bm@K[	43	49
4557	71.8	~gvhA~x`uMjAKt@?fDhArA_ElIxC	43	50
4558	270.8	p|uhAfr`uMNB{JtV|Y`M~Dl@GzCNtDPtAj@n@hSyAVrCfNcAp@zIZK	44	1
4559	227.5	p|uhAfr`uMNB{JtV|Y`M~Dl@GzCNtDPtAj@n@hSyAl@jHjDW	44	2
4561	246.2	p|uhAfr`uMNB{JtV|Y`M~Dl@GzCNtDPtAj@n@nGe@PtCcBLrB~P{Bt@	44	4
4562	192.7	p|uhAfr`uMNB{JtV|Y`MhAXtBRGzCNtDPtAj@n@WqChF_@?I	44	5
4563	210.4	p|uhAfr`uMNB{JtV|Y`M~Ch@j@@^[b@mCrBb@h@qB~HrCi@tBObD	44	6
4564	185.4	p|uhAfr`uMNB{JtVt[tMrCV^[b@mCrBb@h@qBrEbB_@tA	44	7
4566	178.4	p|uhAfr`uMeBm@sCa@HaBQ{E`DSr@JpN`IlSxHGPlC`Ao@fBtHjC	44	10
4567	184.2	p|uhAfr`uMeBm@sCa@HaBQ{E`DSr@JjJpFhGrCx`@vNaGvP	44	11
4568	167.1	p|uhAfr`uMeBm@sCa@HaBQ{E`DSr@JpN`IlSxHGPlC`A{D~K	44	9
4569	205	p|uhAfr`uMeBm@sCa@HaBQ{E`DSr@JjJpFhGrChh@lRqB`Gh@vI	44	12
4571	188.3	p|uhAfr`uMeBm@sCa@HaBQ{E`DSr@JjJpFhGrCx`@vNgDtJhC~@	44	14
4572	187.6	p|uhAfr`uMeBm@sCa@HaBQ{E`DSr@JjJpFhGrCjj@hS|CdBJ|C	44	15
4573	227.4	p|uhAfr`uMeBm@sCa@HaBQ{E`DSr@JjJpFhGrCx`@vNhLxEd@\\`B~W	44	16
4574	248.6	p|uhAfr`uMNB{JtV|Y`M~Dl@GzCNtDPtAl@n@fe@kDC[yET	44	17
4576	281.8	p|uhAfr`uMNB{JtV|Y`M~Dl@GzCNtDPtAl@n@fSyArAhRvA_@PfD_FrAAK	44	19
4577	228.4	p|uhAfr`uMNB{K|WUjAJfBnGtT}@l@_@n@UjAHjAb@dAlAx@~BFhDrLtJ}CbA_B_B_@	44	21
4578	185.1	p|uhAfr`uMNB{JtV|Y`MhAXtBRGzCFzBfBlOXs@[cCLA	44	20
4579	213.2	p|uhAfr`uMNB{JtV|Y`M~Dl@GzCNtDzDh[qD^DjA	44	22
4581	173.7	p|uhAfr`uMNB{JtV_@f@Sr@AhAJt@nGtTe@Vk@l@]hACt@Hn@b@dAb@`@h@Vl@JpAC`Aa@v@aAT_A@o@QeAQ_@FE	44	25
4582	128.3	p|uhAfr`uMNB{JtV_@f@UjA?p@Jt@nGtT}@l@_@n@UjAFdA	44	26
4583	98.1	p|uhAfr`uMNB{JtV_@f@Sr@AhAJt@fE|N	44	27
4584	178.3	p|uhAfr`uMNB{K|WU|BvE~PjC]jCTvBfA~A~Bb@rCUnCgA~BuBzA	44	24
4586	215.7	p|uhAfr`uMNB{K|WUjAJfBnGtT}@l@_@n@UjAHjAeJtCdDjMdGgBBJ	44	29
4587	249.8	p|uhAfr`uMNB{K|WUjAJfBnGtT}@l@_@n@UjAHjAb@dAlAx@~BF`AhD}CPlD|LsEnAl@tB	44	30
4588	148.4	p|uhAfr`uMNB{JtV|Y`MhAXtBRGzCNtD_BR	44	31
4589	107.9	p|uhAfr`uMNB{JtV~SxI_@|@AV	44	32
4591	64.1	p|uhAfr`uMNB{JtVSN_@jAGA	44	34
4592	148.7	p|uhAfr`uMNBqJ~UyCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	44	35
4593	133.4	p|uhAfr`uMNB{JtV_@f@Sr@@bBrA`Fi@RSd@qBtM	44	36
4594	129.6	p|uhAfr`uMeBm@sCa@HaBQ{E`DSr@JtD~BzH`E]rA@~@jJdDg@zA	44	37
4596	155.3	p|uhAfr`uMNBsBdFpDzAmAzCjDrAf@oAdCdARa@l@CEx@|AHUrE	44	39
4597	109.5	p|uhAfr`uMNB{JtVpOlGDc@h@mA	44	40
4598	78.8	p|uhAfr`uMNBsBdFpDzAuBhFIz@m@Cw@Q	44	41
4599	51.3	p|uhAfr`uMNBsBdFhGfCEH	44	42
4601	52.6	p|uhAfr`uMiCw@yJmAPq@V]n@Yp@M	44	45
4602	125.1	p|uhAfr`uMuBq@_Fo@o@bIq@jCoCa@}BCkAFwAiI	44	46
4603	45.6	p|uhAfr`uMuBq@_Fo@_@rE	44	47
4604	95.2	p|uhAfr`uMNBoH~Q_Bm@{ACs@MTgAEQMKcAMwBE	44	48
4606	127	p|uhAfr`uMeBm@sCa@HaBQ{E`DSr@JtD~BzH`EpMbFGPhDlA	44	50
4607	290.2	xpuhAhj`uMbCOM_CtEGtRdKjj@hSnHnF~CdDz@vB`A|RqC~@WvCaD~B}JrCUcDjDeA	45	1
4608	257.8	xpuhAhj`uMbCOM_C`DSr@JjJpFhGrCx`@vNqIpV[rCZdGnAKl@jHjDW	45	2
4609	240.5	xpuhAhj`uMbCOM_C`DSr@JpN`IlSxHcJxW}@hFEbF^bEj@n@nGe@PtCdBMNlB	45	3
4611	223	xpuhAhj`uMbCOM_C`DSr@JpN`IlSxHwG`RrC~@yAxEo@tFLhEtB[	45	5
4612	214	xpuhAhj`uMbCOM_C`DSr@JjJpFhGrCx`@vNcJhXiBWObD	45	6
4613	200.5	xpuhAhj`uMbCOM_C`DSr@JpN`IlSxHwG`RrC~@o@fBrEbB_@tA	45	7
4614	172.9	xpuhAhj`uMbCOM_C`DSr@JpN`IlSxHwG`RrC~@sA`E	45	8
4616	170.6	xpuhAhj`uMbCOM_C`DSr@JjJpFhGrCx`@vNaGvP	45	11
4617	153.5	xpuhAhj`uMbCOM_C`DSr@JpN`IlSxHGPlC`A{D~K	45	9
4618	191.4	xpuhAhj`uMbCOM_C`DSr@JjJpFhGrChh@lRqB`Gh@vI	45	12
4619	166.4	xpuhAhj`uMbCOM_C`DSr@JjJpFhGrChh@lRs@pBHB	45	13
4621	174	xpuhAhj`uMbCOM_C`DSr@JjJpFhGrCbk@vSdCvAJ|C	45	15
4622	213.8	xpuhAhj`uMbCOM_C`DSr@JjJpFhGrCx`@vNhLxEd@\\`B~W	45	16
4623	245.2	xpuhAhj`uMbCOM_C`DSr@JjJpFhGrCjj@hStC~AdB|VmMv@	45	17
4624	214.9	xpuhAhj`uMbCOM_C`DSr@JjJpFhGrCx`@vN{H~To@pCBdDfDW	45	18
4626	279.9	xpuhAhj`uMbDM~Ez@tAl@aOv^H~BnGtT}@l@k@fAInANbA\\p@lAx@~BFhDrLtJ}CbA_B_B_@	45	21
4627	228.8	xpuhAhj`uMbCOM_C`DSr@JpN`IlSxHcIfUwArGMbCFzDfBlOXs@[cCLA	45	20
4628	256.9	xpuhAhj`uMbCOM_C`DSr@JpN`IlSxHcIfUwArGMbENtDzDh[qD^DjA	45	22
4629	287.5	xpuhAhj`uMbCOM_C`DSr@JpN`IlSxHuIrVkAnGGzCNtD~Ef`@gPzEq@cC	45	23
4631	179.8	xpuhAhj`uMbCO^@~Ez@tAl@mMz[_@f@Sr@AhAJt@nGtT}@l@_@n@UjAFdA	45	26
4632	149.6	xpuhAhj`uMbCO^@~Ez@tAl@mMz[_@f@Sr@AhAJt@fE|N	45	27
4633	229.8	xpuhAhj`uMbDM~Ez@tAl@mNb]WbBLnAjEhOjC]jCTvBfA~A~Bb@rCUnCgA~BuBzA	45	24
4634	259.7	xpuhAhj`uMbDM~Ez@tAl@mNb]WbBLnAnGtT}@l@k@fAInANbA\\p@lAx@~BF`AhD}CPcDy@aAzA_Cj@	45	28
4636	301.3	xpuhAhj`uMbDM~Ez@tAl@mNb]UjAJfBnGtT}@l@_@n@UjAHjAb@dAlAx@~BF`AhD}CPlD|LsEnAl@tB	45	30
4637	192.1	xpuhAhj`uMbCOM_C`DSr@JpN`IlSxHqJ|Xo@dEGzCNtD_BR	45	31
4638	159.4	xpuhAhj`uMbCO^@~Ez@tAl@mMz[~SxI_@|@AV	45	32
4639	155.3	xpuhAhj`uMbCO^@~Ez@tAl@mMz[tH|Ce@|AIrE	45	33
4641	200.2	xpuhAhj`uMbCO^@~Ez@tAl@cMd[yCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	45	35
4642	184.9	xpuhAhj`uMbCO^@~Ez@tAl@aKdWkAtCSNUn@Kr@BjArA`Fi@RSd@qBtM	45	36
4643	116	xpuhAhj`uMbCOM_C`DSr@JtD~BzH`E]rA@~@jJdDg@zA	45	37
4644	142.6	xpuhAhj`uMbCOM_C`DSr@JtD~B`FjC|ExBjDpAoDjK}Bk@_@XKrA	45	38
4646	161	xpuhAhj`uMbCO^@~Ez@tAl@mMz[pOlGDc@h@mA	45	40
4647	130.3	xpuhAhj`uMbCO^@~Ez@tAl@eEjKpDzAuBhFIz@m@Cw@Q	45	41
4648	102.8	xpuhAhj`uMbCO^@~Ez@tAl@eEjKhGfCEH	45	42
4649	99.6	xpuhAhj`uMbCOM_C`DSjAX|CpBzH`EUr@Ij@R~DkAJ	45	43
4651	182.5	xpuhAhj`uMbCOM_C`DSpAPx@AXMJSBi@EKc@[eAY}AOc@TQd@SXg@RaYpBgAh@KT^vApAdIRFPGBGG_@nCg@Ms@	45	46
4652	103.3	xpuhAhj`uMbCO^@~Ez@tAl@qAdDeCu@_Fo@_@rE	45	47
4653	146.7	xpuhAhj`uMbCO^@~Ez@tAl@aKdW_Bm@{ACs@MTgAEQMKcAMwBE	45	48
4654	109.9	xpuhAhj`uMbCO^@~Ez@tAl@aKdW_Bm@K[	45	49
4656	339.5	fauhAlr`uMa@_DrFKBoDfR_AtRdKbn@pUlJpJd@rAdAbRSr@aCd@OhCaBxAeMfEUcDjDeA	46	1
4657	306.6	fauhAlr`uMa@_D`AW~AC~Q|BxCz@{JtV|Y`M~Dl@GzCNtDPtAj@n@hSyAl@jHjDW	46	2
4658	275.9	fauhAlr`uMa@_D`AW~AC~Q|BxCz@{JtV|Y`M~Dl@EbF^bEl@n@lGe@PtCdBMNlB	46	3
4659	325.3	fauhAlr`uMa@_D`AW~AC~Q|BxCz@{JtV|Y`M~Dl@GzCNtDPtAj@n@nGe@PtCcBLrB~P{Bt@	46	4
4661	263.3	fauhAlr`uMa@_D`AWpDJBoDrPkAjAXrIbFhGrCx`@vNcJhXiBWObD	46	6
4746	93.6	zpuhAxu`uM^sE~En@dCt@sBdFhGfCEH	47	42
4662	249.8	fauhAlr`uMa@_D`AWpDJBoDrPkAjAXxMrHlSxHwG`RrC~@o@fBrEbB_@tA	46	7
4663	222.2	fauhAlr`uMa@_D`AWpDJBoDrPkAjAXxMrHlSxHwG`RrC~@sA`E	46	8
4664	214.1	fauhAlr`uMa@_D`AWpDJBoDrPkAjAXxMrHlSxHGPlC`Ao@fBtHjC	46	10
4666	202.8	fauhAlr`uMa@_D`AWpDJBoDrPkAr@JpN`IlSxHGPlC`A{D~K	46	9
4667	240.7	fauhAlr`uMa@_DrFKBoDfR_AtRdKhh@lRqB`Gh@vI	46	12
4668	215.7	fauhAlr`uMa@_DrFKBoDfR_AtRdKhh@lRi@tB	46	13
4669	224	fauhAlr`uMa@_D`AWpDJBoDrPkAr@JjJpFhGrCx`@vNgDtJhC~@	46	14
4671	263.1	fauhAlr`uMa@_DrFKBoDfR_AtRdK`o@hVhBdX	46	16
4672	294.5	fauhAlr`uMa@_DrFKBoDrPkAhTpKvj@pSpC|A|AvVmMv@	46	17
4673	264.2	fauhAlr`uMa@_D`AWpDJBoDrPkAjAXrIbFhGrCx`@vN{H~To@pCBdDfDW	46	18
4674	343.4	fauhAlr`uMa@_DrFKBoDfR_AtRdKvj@pShCvA`HvGrAtCx@nSiCl@WvCaD~ByYbI	46	19
4676	264.2	fauhAlr`uMa@_D`AW~AC~Q|BxCz@{JtV|Y`M~Dl@?vGfBlOXs@[cCLA	46	20
4677	292.3	fauhAlr`uMa@_D`AW~AC~Q|BxCz@{JtV|Y`M~Dl@GzCNtDzDh[qD^DjA	46	22
4678	322.9	fauhAlr`uMa@_D`AW~AC~Q|BxCz@{JtV|Y`M~Dl@GzCNtD~Ef`@gPzEq@cC	46	23
4679	252.8	fauhAlr`uMa@_D`AW~AC~Q|BxCz@{K|WU|BzGjVqAdA]hADdBb@dAb@`@vAb@pAC`Aa@v@aAT_AY{C	46	25
4681	177.2	fauhAlr`uMc@{B@c@LMr@I~AC~Q|BxCz@{JtV_@f@Sr@AhAJt@fE|N	46	27
4682	257.4	fauhAlr`uMa@_D`AW~AC~Q|BxCz@{K|WWbBLnAjEhOjC]jCTvBfA~A~Bb@rCUnCgA~BuBzA	46	24
4683	287.3	fauhAlr`uMa@_D`AW~AC~Q|BxCz@{K|WWbBLnAnGtT}@l@k@fAInANbA\\p@lAx@~BF`AhD}CPcDy@aAzA_Cj@	46	28
4684	294.8	fauhAlr`uMa@_D`AW~AC~Q|BxCz@{K|WUjAJfBnGtT}@l@_@n@UjAHjAeJtCdDjMdGgBBJ	46	29
4686	227.5	fauhAlr`uMa@_D`AW~AC~Q|BxCz@{JtV|Y`M~Dl@GzCNtD_BR	46	31
4687	187	fauhAlr`uMc@{B@c@LMr@I~AC~Q|BxCz@{JtV~SxI_@|@AV	46	32
4688	182.9	fauhAlr`uMc@{B@c@LMr@I~AC~Q|BxCz@{JtVtH|Ce@|AIrE	46	33
4689	143.2	fauhAlr`uMc@{B@c@LMr@I~AC~Q|BxCz@{JtVSN_@jAGA	46	34
4691	212.5	fauhAlr`uMc@{B@c@LMr@I~AC~Q|BxCz@{JtV_@f@Sr@@bBrA`Fi@RSd@qBtM	46	36
4692	165.3	fauhAlr`uMa@_D`AWpDJBoDrPkAjAXxMrH]rA@~@jJdDg@zA	46	37
4693	191.9	fauhAlr`uMa@_D`AWpDJBoDrPkAr@JvKjGhKjEoDjK}Bk@_@XKrA	46	38
4694	219.1	fauhAlr`uMa@_D`AWpDJBoDrPkAjAX~J|FhKjEoDjKZRKtBaBMUrE	46	39
4696	157.9	fauhAlr`uMc@{B@c@LMr@I~AC~Q|BxCz@sBdFpDzAuBhFIz@m@Cw@Q	46	41
4697	130.4	fauhAlr`uMe@sCPYr@I~ACvSlC`Bj@sBdFhGfCEH	46	42
4698	148.9	fauhAlr`uMa@_D`AWpDJBoDrPkAjAXxMrH_@~AR~DkAJ	46	43
4699	79.1	fauhAlr`uMc@{B@c@LMr@I~AC~Q|BhCv@	46	44
4701	75.9	fauhAlr`uMc@{B@c@LMrCMrKrA_@rE	46	47
4702	139.1	fauhAlr`uMc@{B@c@LMrCMrKrAo@bIq@jCoCa@}BCC`B	46	48
4703	122.3	fauhAlr`uMc@{B@c@LMrCMrKrAo@bIq@jCvA`@m@vB@P	46	49
4704	162.7	fauhAlr`uMa@_D`AWpDJBoDrPkAjAXxMrHpMbFGPhDlA	46	50
4706	242.6	zpuhAxu`uMOnBq@jCvA`@k@lCJV~Al@kAtC|Y`M~Dl@GzCNtDPtAj@n@hSyAl@jHjDW	47	2
4707	211.9	zpuhAxu`uMOnBq@jCvA`@k@lCJV~Al@kAtC|Y`M~Dl@EbF^bEl@n@lGe@PtCdBMNlB	47	3
4708	261.3	zpuhAxu`uMOnBq@jCvA`@k@lCJV~Al@kAtC|Y`M~Dl@GzCNtDPtAj@n@nGe@PtCcBLrB~P{Bt@	47	4
4709	207.8	zpuhAxu`uMOnBq@jCvA`@k@lCJV~Al@kAtC|Y`M~Dl@GzCNtDPtAj@n@WqChFi@	47	5
4711	200.5	zpuhAxu`uMOnBq@jCvA`@k@lCJV~Al@kAtCt[tMrCV^[b@mCrBb@h@qBrEbB_@tA	47	7
4712	164.2	zpuhAxu`uMOnBq@jCvA`@m@vB@TJV~Al@kAtC|Y`Mv@RrCV^[b@mCrBb@DW	47	8
4713	191.9	zpuhAxu`uM^sEzAPHaBQ{E`DSjAXxMrHlSxHGPlC`Ao@fBtHjC	47	10
4714	197.7	zpuhAxu`uM^sEzAPHaBQ{E`DSjAXrIbFhGrCx`@vNaGvP	47	11
4716	218.5	zpuhAxu`uM^sEzAPHaBQ{E`DSr@JjJpFhGrChh@lRqB`Gh@vI	47	12
4717	193.5	zpuhAxu`uM^sEzAPHaBQ{E`DSr@JjJpFhGrChh@lRs@pBHB	47	13
4718	201.8	zpuhAxu`uM^sEzAPHaBQ{E`DSr@JjJpFhGrCx`@vNgDtJhC~@	47	14
4719	201.1	zpuhAxu`uM^sEzAPHaBQ{E`DSr@JjJpFhGrCbk@vSdCvAJ|C	47	15
4721	263.7	zpuhAxu`uMOnBq@jCvA`@k@lCJV~Al@kAtC|Y`M~Dl@GzCNtDPtAj@n@he@kDC[yET	47	17
4722	221	zpuhAxu`uMOnBq@jCvA`@k@lCJV~Al@kAtC|Y`M~Dl@GzCNtDPtAj@n@rQqAWsCnCS	47	18
4723	296.9	zpuhAxu`uMOnBq@jCvA`@k@lCJV~Al@kAtC|Y`M~Dl@GzCNtDPtAj@n@hSyArAhRvA_@PfD_FrAAK	47	19
4724	243.5	zpuhAxu`uMOnBq@jCvA`@k@lCJV~Al@uBtEKdBzGjV}@l@k@fAInANbA\\p@lAx@~BFhDrLtJ}CbA_B_B_@	47	21
4726	228.3	zpuhAxu`uMOnBq@jCvA`@k@lCJV~Al@kAtC|Y`M~Dl@GzCNtDzDh[qD^DjA	47	22
4727	258.9	zpuhAxu`uMOnBq@jCvA`@k@lCJV~Al@kAtC|Y`M~Dl@GzCNtD~Ef`@gPzEq@cC	47	23
4728	188.8	zpuhAxu`uMOnBq@jCvA`@m@vB@TJV~Al@kAtCSNUn@Kr@?p@Jt@nGtTe@Vk@l@]hACt@Hn@b@dAb@`@h@Vl@JpAC`Aa@v@aAT_A@o@QeAQ_@FE	47	25
4729	143.4	zpuhAxu`uMOnBq@jCvA`@m@vB@TJV~Al@kAtCSNUn@Kr@?p@Jt@nGtT}@l@_@n@UjAFdA	47	26
4731	193.4	zpuhAxu`uMOnBq@jCvA`@m@vB@TJV~Al@kAtCSNUn@Kr@?p@Jt@jEhOvAYlACpAJ|@TbAf@~@~@t@rAT|@Jz@?lA]tB]x@o@|@eBhA	47	24
4732	223.3	zpuhAxu`uMOnBq@jCvA`@k@lCJV~Al@uBtEKdBzGjV}@l@_@n@UjAHjAb@dAlAx@~BF`AhD}CPcDy@aAzA_Cj@	47	28
4733	228.8	zpuhAxu`uMOnBq@jCoCa@}BCE`Bc@DQb@l@tDaDV~AxJdClY~ExRdGgBBJ	47	29
4734	264.9	zpuhAxu`uMOnBq@jCvA`@k@lCJV~Al@uBtEKdBzGjV}@l@_@n@UjAHjAb@dAlAx@~BF`AhD}CPlD|LsEnAl@tB	47	30
4736	123	zpuhAxu`uMOnBq@jCvA`@m@vB@TJV~Al@kAtC~SxI_@|@AV	47	32
4737	118.9	zpuhAxu`uMOnBq@jCvA`@m@vB@TJV~Al@kAtCtH|Ce@|AIrE	47	33
4738	79.2	zpuhAxu`uMOnBq@jCvA`@m@vB@TJV~Al@kAtC_@f@Sr@GA	47	34
4739	156.9	zpuhAxu`uMOnBq@jCoCa@}BCE`Bc@DQb@l@tDaDV~AxJX~Cd@CMaB~BU	47	35
4741	143.1	zpuhAxu`uM^sEzAPHaBQ{E`DSjAX|CpBzH`E]rA@~@jJdDg@zA	47	37
4742	161.3	zpuhAxu`uM^sE~En@dCt@sBdFpDzAmAzCjDrAf@oAdCdAJWRM`@??H	47	38
4743	196.9	zpuhAxu`uM^sEzAPHaBQ{E`DSjAX|CpBzH`EnHtCoDjKZRKtBaBMUrE	47	39
4744	124.6	zpuhAxu`uMOnBq@jCvA`@m@vB@TJV~Al@kAtCpOlGDc@h@mA	47	40
4670	223.3	fauhAlr`uMa@_DrFKBoDfR_AtRdKbk@vSdCvAJ|C	46	15
4675	307.5	fauhAlr`uMa@_D`AW~AC~Q|BxCz@oLpYH~BnGtT}@l@_@n@UjAHjAb@dAlAx@~BFhDrLtJ}CbA_B_B_@	46	21
4680	207.4	fauhAlr`uMc@{B@c@LMr@I~AC~Q|BxCz@{JtV_@f@Sr@AhAJt@nGtT}@l@_@n@UjAFdA	46	26
4685	328.9	fauhAlr`uMa@_D`AW~AC~Q|BxCz@{K|WUjAJfBnGtT}@l@_@n@UjAHjAb@dAlAx@~BF`AhD}CPlD|LsEnAl@tB	46	30
4690	227.8	fauhAlr`uMc@{B@c@LMr@I~AC~Q|BxCz@qJ~UyCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	46	35
4695	188.6	fauhAlr`uMc@{B@c@LMr@I~AC~Q|BxCz@{JtVpOlGDc@h@mA	46	40
4700	66.9	fauhAlr`uMc@{B@c@LMrCMdFn@Pq@V]n@Yp@M	46	45
4705	285.9	zpuhAxu`uMOnBq@jCvA`@k@lCJV~Al@kAtC|Y`M~Dl@GzCNtDPtAj@n@hSyAVrCfNcAp@zIZK	47	1
4710	225.5	zpuhAxu`uMOnBq@jCvA`@k@lCJV~Al@kAtC|Y`M~Ch@j@@^[b@mCrBb@h@qB~HrCi@tBObD	47	6
4715	180.6	zpuhAxu`uM^sEzAPHaBQ{E`DSr@JpN`IlSxHGPlC`A{D~K	47	9
4720	240.9	zpuhAxu`uM^sEzAPHaBQ{E`DSjAXrIbFhGrCjj@hS|CdB`B~W	47	16
4725	200.2	zpuhAxu`uMOnBq@jCvA`@m@vB@TJV~Al@kAtC|Y`MhAXtBRGzCFzBfBlOXs@[cCLA	47	20
4730	113.2	zpuhAxu`uMOnBq@jCvA`@m@vB@TJV~Al@kAtCSNUn@Kr@?p@Jt@fE|N	47	27
4735	163.5	zpuhAxu`uMOnBq@jCvA`@m@vB@TJV~Al@kAtC|Y`MhAXtBRGzCNtD_BR	47	31
4740	148.5	zpuhAxu`uMOnBq@jCvA`@m@vB@TJV~Al@kAtC_@f@Sr@Cn@LnAjAdEi@RSd@qBtM	47	36
4745	116.1	zpuhAxu`uMOnBq@jCvA`@m@vB@TJV~Al@kAtC~CnAGWRo@RwCDYLD	47	41
4750	79.5	zpuhAxu`uMOnBq@jCoCa@}BCkAFwAiI	47	46
4755	213	ffuhAp_auMe@DQb@r@dEnB?|ATp^jO~Dl@GzCNtDPtAj@n@hSyAl@jHjDW	48	2
4760	170.9	ffuhAp_auMe@DQb@r@dEnB?|ATb_@rOxDb@^[b@mCrBb@h@qBrEbB_@tA	48	7
4765	202.8	ffuhAp_auMe@DQb@r@dEnB?|ATh`@~OjCXf@]b@mC|AgFxT`IbCXhCKBP	48	12
4770	234.1	ffuhAp_auMw@h@r@dElETp^jO~Dl@FpI~@dCfe@kDC[yET	48	17
4775	198.7	ffuhAp_auMe@DQb@r@dEnB?|ATp^jO~Dl@GzCNtDzDh[qD^DjA	48	22
4780	171.7	ffuhAp_auMe@DQb@r@dEn@CrBJ|DvASN_@jA@bBrEdP|@SlAIjAB~@PfAb@n@b@|@bA`@z@T|@LtAElAO`Aa@hAe@t@s@p@aAh@	48	24
4785	93.4	ffuhAp_auMe@DQb@r@dEnB?|ATrXbL_@|@AV	48	32
4790	178	ffuhAp_auMe@DQb@r@dEnB?|ATp^jO|A\\|@wF`AaQ\\}A	48	37
4795	130.5	ffuhAp_auMe@DQb@r@dEnB?|ATrHxCGWRo@TeD~CaInDvAEH	48	42
4800	59.9	ffuhAp_auMBaB|BBnC`@p@kCNoB	48	47
4805	165.5	dpuhA`cauMJZ~Al@kAtC|Y`M~Dl@EbF^bEl@n@lGe@PtCdBMNlB	49	3
4810	117.8	dpuhA`cauMJZ~Al@kAtCnZhMv@P|BRb@]b@mCrBb@DW	49	8
4815	201.5	dpuhA`cauMlB_Jl@kJQ{E`DSjAXrIbFhGrChh@lRs@pBHB	49	13
4820	174.6	dpuhA`cauMJZ~Al@kAtC|Y`M~Dl@GzCNtDPtAl@n@pQqAWsCnCS	49	18
4825	212.5	dpuhA`cauMJZ~Al@kAtC|Y`M~Dl@GzCNtD~Ef`@gPzEq@cC	49	23
4830	176.9	dpuhA`cauMJZ~Al@kAtCSNUn@Kr@BjAvGpU}@l@_@n@UjAHjAb@dAb@`@h@VfALv@E`AhDcANyA@wAUkAc@aAzA_Cj@	49	28
4835	72.5	dpuhA`cauMJZ~Al@kAtCtH|Ce@|AIrE	49	33
4840	117.5	dpuhA`cauMJZ~Al@kAtCpOlGDc@~BcGl@sDJWRM`@??H	49	38
4845	134.7	dpuhA`cauMAQ|AyFPsAl@kJQ{E`DSr@JtD~BzH`EUr@Ij@R~DkAJ	49	43
4850	48	dpuhA`cauMJZ{ACs@MTgAKWkASwBE	49	48
4855	185.5	j~vhAvy`uMPF{IfWw@`EMbCNtFPtAj@n@nGe@PtCcBLrB~P{Bt@	50	4
4860	52.5	j~vhAvy`uM~ChAo@fBtHjC	50	10
4865	75.4	j~vhAvy`uM~PjG}C`JhC~@	50	14
4870	203.6	j~vhAvy`uMrQrGLQpKnEvIlIz@vBV~CEpAn@jKUZ{Bb@Md@FhAa@z@qCjBgExAoStFAK	50	19
4875	157.5	j~vhAvy`uMPFoGnQ}@pCe@pB_@tBMbC@fCLlBaBReHnBTxACfBqDe@CiA]aAFE	50	25
4880	232.5	j~vhAvy`uMPFoGnQcBbGm@xFNtFaBReHnBVlCUtBy@lBmB`BgA^_CR}AOcBk@aAzAhArDjA_@BJ	50	29
4885	136.3	j~vhAvy`uMPFmI`VgAvFyDc@}YiMeAnB	50	34
4890	104.7	j~vhAvy`uMPFcGvPaC{@_CSNgCaBMUrE	50	39
4895	163.7	j~vhAvy`uMPFwC~HTTLEfDsJGE}MyEeCeAcHgD{A{@k@g@QJERdAn@eCpGOC	50	44
4900	190.7	j~vhAvy`uMPFmI`VgAvFyDc@}YiMyCcAyAU}B?YgBhCOzC`@TAb@i@@P	50	49
4747	126.7	zpuhAxu`uM^sEzAPHaBQ{E`DSjAX|CpBzH`EUr@Ij@R~DkAJ	47	43
4748	42.3	zpuhAxu`uM^sE~En@tBp@	47	44
4749	52.7	zpuhAxu`uM^sEmDc@Pq@V]n@Yp@M	47	45
4751	63.2	zpuhAxu`uMOnBq@jCoCa@}BCC`B	47	48
4752	46.4	zpuhAxu`uMOnBq@jCvA`@m@vB@P	47	49
4753	140.5	zpuhAxu`uM^sEzAPHaBQ{E`DSjAXxMrHpMbFGPhDlA	47	50
4754	256.3	ffuhAp_auMw@h@r@dElETp^jO~Dl@FpI|@dChSyAVrCfNcAp@zIZK	48	1
4756	182.3	ffuhAp_auMe@DQb@r@dEnB?|ATp^jO~Dl@EbF^bEl@n@lGe@PtCdBMNlB	48	3
4757	231.7	ffuhAp_auMe@DQb@r@dEnB?|ATp^jO~Dl@EbF^bEl@n@lGe@PtCcBLrB~P{Bt@	48	4
4758	178.2	ffuhAp_auMe@DQb@r@dEnB?|ATp^jO~Dl@GzCNtDPtAj@n@WqChFi@	48	5
4759	195.9	ffuhAp_auMe@DQb@r@dEnB?|ATb_@rOxDb@^[b@mCrBb@h@qB~HrCi@tBObD	48	6
4761	134.6	ffuhAp_auMe@DQb@r@dEnB?|ATb_@rOtDd@b@]b@mCrBb@DW	48	8
4762	205.1	ffuhAp_auMe@DQb@r@dEnB?|ATp^jObEl@f@]b@mCfF{OnBp@nAqDtHjC	48	10
4763	213.3	ffuhAp_auMe@DQb@r@dEnB?|ATh`@~OjCXf@]b@mC|AgFdPxFjBeFUKyA`E	48	11
4764	169.9	ffuhAp_auMe@DQb@r@dEnB?|ATp^jO~Ch@j@@^[b@mCfF{OnBp@{@dC	48	9
4766	227.7	ffuhAp_auMe@DQb@r@dEnB?|ATp^jObEl@f@]b@mC|AgFpGcR`WjJs@pBHB	48	13
4767	200.2	ffuhAp_auMe@DQb@r@dEnB?|ATp^jOhAXxBRf@]b@mC|AgFdPxFjBeFrBr@	48	14
4768	235.3	ffuhAp_auMw@h@r@dElETp^jO~Ch@jAY`CuJpGcRd\\`Mz@j@J|C	48	15
4769	223.6	ffuhAp_auMw@h@r@dElETp^jO~Dl@FpI~@dCzl@aE	48	16
4771	191.4	ffuhAp_auMe@DQb@r@dEnB?|ATp^jO~Dl@GzCNtDPtAl@n@pQqAWsCnCS	48	18
4772	267.3	ffuhAp_auMe@DQb@r@dEnB?|ATp^jO~Dl@GzCNtDPtAj@n@hSyArAhRvA_@PfD_FrAAK	48	19
4773	221.8	ffuhAp_auMe@DQb@r@dEbDF|DvAs@zA@bBvGpUqAdA]hADdBb@dAbB`AhB?hDrLtJ}CbA_B_B_@	48	21
4774	170.6	ffuhAp_auMe@DQb@r@dEnB?|ATp^jO~Dl@?vGfBlOXs@[cCLA	48	20
4776	229.3	ffuhAp_auMe@DQb@r@dEnB?|ATp^jO~Dl@GzCNtD~Ef`@gPzEq@cC	48	23
4777	167.1	ffuhAp_auMe@DQb@r@dEn@CrBJ|DvASN_@jA@bBvGpUe@Vk@l@]hACt@Hn@b@dAb@`@h@Vl@JpAC`Aa@v@aAT_A@o@QeAQ_@FE	48	25
4778	121.7	ffuhAp_auMe@DQb@r@dEn@CrBJ|DvASN_@jA@bBvGpU}@l@_@n@UjAFdA	48	26
4779	91.5	ffuhAp_auMe@DQb@r@dEn@CrBJ|DvASN_@jA@bBnExO	48	27
4781	201.6	ffuhAp_auMe@DQb@r@dEn@CrBJ|DvASN_@jA@bBvGpU}@l@_@n@UjAHjAb@dAb@`@h@VfALv@E`AhDcANyA@wAUkAc@aAzA_Cj@	48	28
4782	170.9	ffuhAp_auMe@DQb@l@tDaDV~AxJzA~Qn@`GxEdRdGgBBJ	48	29
4783	219.9	ffuhAp_auMe@DQb@l@tDaDV~AxJdClY~ExRxDgAbDlL	48	30
4784	133.9	ffuhAp_auMe@DQb@r@dEnB?|ATp^jO~Dl@GzCNtD_BR	48	31
4786	89.3	ffuhAp_auMe@DQb@r@dEnB?|AThMfFe@|AIrE	48	33
4787	57.5	ffuhAp_auMe@DQb@r@dEn@CrBJ|DvASN_@jAGA	48	34
4788	99	ffuhAp_auMe@DQb@l@tDaDV~AxJX~Cd@CMaB~BU	48	35
4789	126.8	ffuhAp_auMe@DQb@r@dEn@CrBJ|DvASNUn@Kr@?p@Jt@jAdEi@RSd@qBtM	48	36
4791	134.3	ffuhAp_auMe@DQb@r@dEnB?|ATdTvIDc@~BcGl@sDJWRM`@??H	48	38
4792	170.6	ffuhAp_auMe@DQb@r@dEnB?|ATdTvIDc@~BcGl@sDJWRM`@?Ex@|AHUrE	48	39
4793	95	ffuhAp_auMe@DQb@r@dEnB?|ATdTvIDc@h@mA	48	40
4794	86.5	ffuhAp_auMe@DQb@r@dEnB?|ATrHxCGWRo@RwCDYLD	48	41
4796	154.6	ffuhAp_auMe@DQb@r@dEnB?|ATrHxCGWRo@XqDvAXrFHD}@xCqHP[TO	48	43
4797	95.6	ffuhAp_auMBaBxCFtATtBh@n@aCNaAd@{GrC`@dBl@	48	44
4798	111.9	ffuhAp_auMBaBkAFOw@zAq@l@kKrC^Pq@V]n@Yp@M	48	45
4799	50.1	ffuhAp_auMBaBkAFwAiI	48	46
4801	51.1	ffuhAp_auMvBDjARJVUfAfANTAb@i@@P	48	49
4802	185.3	ffuhAp_auMBaBxCFjE~@n@aCn@yGNeDQ{E`DSjAXxMrHpMbFGPhDlA	48	50
4803	239.5	dpuhA`cauMJZ~Al@kAtC|Y`M~Dl@GzCNtDPtAj@n@hSyAVrCfNcAp@zIZK	49	1
4804	196.2	dpuhA`cauMJZ~Al@kAtC|Y`M~Dl@GzCNtDPtAj@n@hSyAl@jHjDW	49	2
4806	214.9	dpuhA`cauMJZ~Al@kAtC|Y`M~Dl@GzCNtDPtAj@n@nGe@PtCcBLrB~P{Bt@	49	4
4807	161.4	dpuhA`cauMJZ~Al@kAtC|Y`M~Dl@GzCNtDPtAj@n@WqChFi@	49	5
4808	179.1	dpuhA`cauMJZ~Al@kAtCnZhMxDb@^[b@mCrBb@h@qB~HrCi@tBObD	49	6
4809	154.1	dpuhA`cauMJZ~Al@kAtC|Y`MjEj@^[b@mCrBb@h@qBrEbB_@tA	49	7
4811	188.3	dpuhA`cauMJZ~Al@kAtC|Y`MbEl@f@]b@mCfF{OnBp@nAqDtHjC	49	10
4812	196.5	dpuhA`cauMJZ~Al@kAtCt[tMjCXf@]b@mC|AgFdPxFjBeFUKyA`E	49	11
4813	153.1	dpuhA`cauMJZ~Al@kAtC|Y`M~Dl@j@]b@mCfF{OnBp@{@dC	49	9
4814	186	dpuhA`cauMJZ~Al@kAtCt[tMjCXf@]b@mC|AgFxT`IbCXhCKBP	49	12
4816	183.4	dpuhA`cauMJZ~Al@kAtC|Y`M~Ch@j@@^[b@mC|AgFdPxFjBeFrBr@	49	14
4817	209.1	dpuhA`cauMlB_Jl@kJQ{E`DSjAXrIbFhGrCvj@pSpC|AJ|C	49	15
4818	206.8	dpuhA`cauMJZ~Al@kAtC|Y`M~Dl@GzCNtDPtAl@n@xl@qE@N	49	16
4819	217.3	dpuhA`cauMJZ~Al@kAtC|Y`M~Dl@GzCNtDPtAj@n@he@kDC[yET	49	17
4821	250.5	dpuhA`cauMJZ~Al@kAtC|Y`M~Dl@GzCNtDPtAj@n@hSyArAhRvA_@PfD_FrAAK	49	19
4822	197.1	dpuhA`cauMJZ~Al@kAtCSNUn@Kr@BjAvGpU}@l@k@fAInARjAXh@b@`@h@VfALv@EhDrLpIeCb@Wf@i@Zu@_B_@	49	21
4823	153.8	dpuhA`cauMJZ~Al@kAtC|Y`MhAXtBRGzCFzBfBlOXs@[cCLA	49	20
4824	181.9	dpuhA`cauMJZ~Al@kAtC|Y`MhAXtBRGzCNtDzDh[qD^DjA	49	22
4826	142.4	dpuhA`cauMJZ~Al@kAtCSNUn@Kr@BjAvGpUe@Vk@l@]hACt@Hn@b@dAb@`@h@Vl@JpAC`Aa@v@aAT_A@o@QeAQ_@FE	49	25
4827	97	dpuhA`cauMJZ~Al@kAtCSNUn@Kr@BjAvGpU}@l@_@n@UjAFdA	49	26
4828	66.8	dpuhA`cauMJZ~Al@kAtCSNUn@Kr@BjAnExO	49	27
4829	147	dpuhA`cauMJZ~Al@kAtCSNUn@Kr@BjArEdPvAYlACpAJ|@TbAf@~@~@t@rAT|@Jz@?lA]tB]x@o@|@eBhA	49	24
4831	184.4	dpuhA`cauMJZ~Al@kAtCSNUn@Kr@BjAvGpU}@l@_@n@UjAHjAgI`C]RdDjMdGgBBJ	49	29
4832	218.5	dpuhA`cauMJZ~Al@uBtEG~BvGpU}@l@_@n@UjAHjAb@dAlAx@~BF`AhD}CPlD|LsEnAl@tB	49	30
4833	117.1	dpuhA`cauMJZ~Al@kAtC|Y`MhAXtBRGzCNtD_BR	49	31
4834	76.6	dpuhA`cauMJZ~Al@kAtC~SxI_@|@AV	49	32
4836	32.8	dpuhA`cauMJZ~Al@kAtC_@f@Sr@GA	49	34
4837	117.4	dpuhA`cauMJZ~Al@aA~ByCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	49	35
4838	102.1	dpuhA`cauMJZ~Al@kAtC_@f@UjABjArA`Fi@RSd@qBtM	49	36
4839	151.1	dpuhA`cauMAQ|AyFPsAl@kJQ{E`DSr@JtD~BzH`E]rA@~@jJdDg@zA	49	37
4841	153.8	dpuhA`cauMJZ~Al@kAtCpOlGDc@~BcGl@sDJWRM`@?Ex@|AHUrE	49	39
4842	78.2	dpuhA`cauMJZ~Al@kAtCpOlGDc@h@mA	49	40
4843	69.7	dpuhA`cauMJZ~Al@kAtC~CnAGWRo@RwCDYLD	49	41
4844	110.1	dpuhA`cauMAQ|AyFPsAb@iGrC`@tBp@sBdFhGfCEH	49	42
4846	58.8	dpuhA`cauMAQ|AyFPsAb@iGrC`@dBl@	49	44
4847	80.5	dpuhA`cauMAQ|AyFPsAb@iGiGu@Pq@V]n@Yp@M	49	45
4848	78.9	dpuhA`cauMAQl@wBuBi@uAUyCGkAFwAiI	49	46
4849	46.3	dpuhA`cauMAQl@wBwAa@p@kCNoB	49	47
4851	148.5	dpuhA`cauMlB_Jl@kJQ{E`DSr@JpN`IpMbFGPhDlA	49	50
4852	199.7	j~vhAvy`uMrQrGLQzJ`EzG`GfB|Bd@rAV~CEpAr@pJIf@kCp@Md@FhAQf@aD~BgExAuDx@UcDjDeA	50	1
4853	158.5	j~vhAvy`uM~PjGgI|UY~AAr@@`AXbEnAKl@jHjDW	50	2
4854	136.1	j~vhAvy`uMPF{ExMmCpIo@dEEbF^bEj@n@nGe@PtCdBMNlB	50	3
4856	118.6	j~vhAvy`uMPFoGnQrC~@aAnCWhAk@tDC~@@hBJ~AtBQ?I	50	5
4857	114.7	j~vhAvy`uM~PjGiGjQoAhEiBWMhAAxA	50	6
4858	96.1	j~vhAvy`uMPFoGnQrC~@o@fBrEbB_@tA	50	7
4859	68.5	j~vhAvy`uMPFoGnQrC~@sA`E	50	8
4861	71.3	j~vhAvy`uM~PjGwFbP	50	11
4862	41.2	j~vhAvy`uM~ChA{D~K	50	9
4863	96.3	j~vhAvy`uMrXzJcBxEIb@j@lI	50	12
4864	71.3	j~vhAvy`uMrXzJm@bBHB	50	13
4866	81.5	j~vhAvy`uMhYdKfChAbAp@NjC	50	15
4867	121.3	j~vhAvy`uMhYdKfChAbAp@dBlW	50	16
4868	152.7	j~vhAvy`uMhYdKfChAbAp@`BdVkM~@AG	50	17
4869	115.6	j~vhAvy`uM~PjGgI|UY~ABdDfDW	50	18
4871	214.6	j~vhAvy`uMPFoGnQ}@pCe@pB_@tBMbC@fCLlBaBReHnBTxACfBYzA}@dBvBnHhDcAz@y@Zu@_B_@	50	21
4872	124.4	j~vhAvy`uMPF_EzKmCdIeAfFMbCFzDfBlOXs@[cCLA	50	20
4873	152.5	j~vhAvy`uMPFmI`VeAfFMbENtDzDh[qD^DjA	50	22
4874	183.1	j~vhAvy`uMPF{IfWw@`EMbCNtF~Ef`@gPzEq@cC	50	23
4876	190.1	j~vhAvy`uMPFoGnQcBbGm@xFNtFaBReHnBTxACfBqDe@OkB_@o@w@o@oAUiAH{@^w@dAUjAFdA	50	26
4877	169.1	j~vhAvy`uMPFmI`VgAvFyDc@aPaHu@hBEdC_CEgBd@zBvH	50	27
4878	154.1	j~vhAvy`uMPFoGnQ}@pCe@pB_@tBMbC@fCLlBaBReHnBNz@FpAIfAUfA]x@o@|@eBhA	50	24
4879	203.6	j~vhAvy`uMPFoGnQcBbGm@xFNtFaBReHnBVlCUtBy@lBwArA}Al@_CR}AOcBk@aAzA_Cj@	50	28
4881	245.2	j~vhAvy`uMPFoGnQcBbGm@xFNtFaBReHnBTxACfBYzAo@rAaAbAiAl@mB^yA@lD|LsEnAl@tB	50	30
4882	87.7	j~vhAvy`uMPFoGnQ}@pCe@pB_@tBMbC@fCLlB_BR	50	31
4883	95.7	j~vhAvy`uMPF_EzKmCdIgAvFqBMs@MqEqBi@lAAV	50	32
4884	129.7	j~vhAvy`uMPF_EzKmCdIgAvFqBMgAUaPaHY`@[fAIrE	50	33
4886	213.1	j~vhAvy`uMPFmI`VgAvFyDc@}YiMyCcA{CY}EZxBxOd@CMaB~BU	50	35
4887	197.6	j~vhAvy`uMPFmI`VgAvFyDc@aPaHu@hBEdC_CEgBd@u@d@yBhN	50	36
4888	42.2	j~vhAvy`uMPFo@dBeGwBg@zA	50	37
4889	95.6	j~vhAvy`uMPFcGvPaC{@_CSNgC_EWDo@	50	38
4891	103.2	j~vhAvy`uMPF_EzKmCdIgAvFqBMs@MgJ_El@_B	50	40
4892	135.7	j~vhAvy`uMPF_EzKmCdIgAvFqBMgAUoU{JRo@TeDBKLD	50	41
4893	160.1	j~vhAvy`uMPFcGvPaC{@_CSNgC_EWDy@m@BS`@eCeAg@nAsAe@fAsC	50	42
4894	129.2	j~vhAvy`uMPFcGvPaC{@_CSZoFCSWMf@{AuCiAUa@Gy@kAJ	50	43
4896	216.3	j~vhAvy`uMPFwC~HTTLE~CyJcR_HcHgDgCcBW^dAn@eCpGyC{@yJmAh@oA`Bg@	50	45
4897	200.5	j~vhAvy`uMPFmI`VgAvFyDc@}YiMyCcA{CY{DTwCyPnCg@Ms@	50	46
4898	209.3	j~vhAvy`uMPFwC~HTTLEfDsJkReHcHgDgCcBW^dAn@eCpGeCu@_Fo@_@rE	50	47
4899	161.9	j~vhAvy`uMPFmI`VgAvFyDc@}YiMyCcAyAU}B?m@uDPc@d@E	50	48
\.


--
-- Data for Name: drivers; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.drivers (id) FROM stdin;
2
3
4
5
6
\.


--
-- Data for Name: generated_routes; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.generated_routes (id, created_at, driver_id) FROM stdin;
16	2026-05-20 16:10:01.622148	2
17	2026-05-20 16:10:01.790521	3
18	2026-05-20 16:10:01.948985	4
19	2026-05-20 16:10:02.329608	5
11	2026-05-19 16:09:53.25	2
12	2026-05-19 16:09:53.3	3
10	2026-05-18 16:09:37.437	6
2	2026-05-17 13:22:30.872	3
7	2026-05-18 16:09:37.11	3
4	2026-05-17 13:22:31.364	5
20	2026-05-20 16:10:02.645	6
1	2026-05-17 13:22:30.660759	2
14	2026-05-19 16:09:53.609	5
5	2026-05-17 13:22:31.613	6
13	2026-05-19 15:09:53.515	4
8	2026-05-18 16:09:37.236	4
15	2026-05-19 16:09:53.731	6
6	2026-05-18 16:09:36.908	2
3	2026-05-17 13:22:31.197	4
9	2026-05-18 16:09:37.296	5
23	2026-05-16 16:14:12.816	4
25	2026-05-16 16:14:13.059	6
21	2026-05-16 16:14:12.604	2
24	2026-05-16 16:14:12.9	5
22	2026-05-16 16:14:12.745	3
54	2026-05-10 17:07:14.638	5
59	2026-05-09 17:08:04.184	5
41	2026-05-12 17:06:26.838	2
58	2026-05-09 17:08:04.044	4
35	2026-05-14 17:06:16.127	6
28	2026-05-15 16:58:14.259	4
38	2026-05-13 17:06:16.605	4
63	2026-05-08 17:08:06.625	4
46	2026-05-11 17:06:31.19	2
61	2026-05-08 17:08:06.172	2
49	2026-05-11 17:06:32.013	5
50	2026-05-11 17:06:32.338	6
55	2026-05-10 17:07:15.004	6
32	2026-05-14 17:06:14.969	3
48	2026-05-11 17:06:31.747	4
56	2026-05-09 17:08:03.502	2
64	2026-05-08 17:08:06.779	5
67	2026-05-07 17:08:08.775	3
66	2026-05-07 17:08:08.61	2
31	2026-05-14 17:06:14.857	2
34	2026-05-14 17:06:15.741	5
70	2026-05-07 17:08:09.536	6
69	2026-05-07 17:08:09.298	5
68	2026-05-07 17:08:09.059	4
65	2026-05-08 17:08:07.079	6
47	2026-05-11 17:06:31.364	3
57	2026-05-09 17:08:03.731	3
60	2026-05-09 17:08:04.582	6
62	2026-05-08 17:08:06.389	3
52	2026-05-10 17:07:14.231	3
53	2026-05-10 17:07:14.423	4
51	2026-05-10 17:07:14.083	2
26	2026-05-15 16:58:13.801	2
27	2026-05-15 16:58:14.015	3
40	2026-05-13 17:06:17.321	6
43	2026-05-12 17:06:27.378	4
30	2026-05-15 16:58:14.981	6
36	2026-05-13 17:06:16.204	2
42	2026-05-12 17:06:27.181	3
45	2026-05-12 17:06:28.038	6
29	2026-05-15 16:58:14.509	5
33	2026-05-14 17:06:15.329	4
37	2026-05-13 17:06:16.392	3
44	2026-05-12 17:06:27.639	5
39	2026-05-13 17:06:17.025	5
\.


--
-- Data for Name: generated_containers; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.generated_containers (id, visit_order, container_id, generated_route_id) FROM stdin;
1	0	3	1
2	1	20	1
3	2	5	1
4	3	7	1
5	4	8	1
6	5	6	1
7	6	32	1
8	7	31	1
9	8	19	1
10	0	1	2
11	1	16	2
12	2	17	2
13	3	18	2
14	4	12	2
15	5	13	2
16	6	15	2
17	7	14	2
18	8	11	2
19	9	10	2
20	10	2	2
21	0	27	3
22	1	34	3
23	2	33	3
24	3	41	3
25	4	44	3
26	5	47	3
27	6	49	3
28	7	48	3
29	8	46	3
30	9	45	3
31	10	35	3
32	0	9	4
33	1	37	4
34	2	43	4
35	3	42	4
36	4	38	4
37	5	39	4
38	6	40	4
39	7	50	4
40	0	4	5
41	1	22	5
42	2	23	5
43	3	21	5
44	4	25	5
45	5	24	5
46	6	28	5
47	7	29	5
48	8	30	5
49	9	36	5
50	10	26	5
51	0	3	6
52	1	20	6
53	2	5	6
54	3	7	6
55	4	8	6
56	5	6	6
57	6	32	6
58	7	31	6
59	8	19	6
60	0	1	7
61	1	16	7
62	2	17	7
63	3	18	7
64	4	12	7
65	5	13	7
66	6	15	7
67	7	14	7
68	8	11	7
69	9	10	7
70	10	2	7
71	0	27	8
72	1	34	8
73	2	33	8
74	3	41	8
75	4	44	8
76	5	47	8
77	6	49	8
78	7	48	8
79	8	46	8
80	9	45	8
81	10	35	8
82	0	9	9
83	1	37	9
84	2	43	9
85	3	42	9
86	4	38	9
87	5	39	9
88	6	40	9
89	7	50	9
90	0	4	10
91	1	22	10
92	2	23	10
93	3	21	10
94	4	25	10
95	5	24	10
96	6	28	10
97	7	29	10
98	8	30	10
99	9	36	10
100	10	26	10
101	0	34	11
102	1	48	11
103	2	46	11
104	3	45	11
105	4	44	11
106	5	47	11
107	6	49	11
108	7	41	11
109	8	35	11
110	0	1	12
111	1	19	12
112	2	4	12
113	3	3	12
114	4	2	12
115	5	5	12
116	0	21	13
117	1	22	13
118	2	23	13
119	3	25	13
120	4	31	13
121	5	20	13
122	6	24	13
123	7	28	13
124	8	29	13
125	9	30	13
126	10	36	13
127	11	26	13
128	12	27	13
129	0	6	14
130	1	18	14
131	2	17	14
132	3	16	14
133	4	15	14
134	5	12	14
135	6	13	14
136	7	14	14
137	8	11	14
138	9	7	14
139	10	10	14
140	0	8	15
141	1	9	15
142	2	37	15
143	3	43	15
144	4	42	15
145	5	38	15
146	6	39	15
147	7	40	15
148	8	32	15
149	9	33	15
150	10	50	15
151	0	1	16
152	1	19	16
153	2	4	16
154	3	20	16
155	4	3	16
156	5	2	16
157	6	5	16
158	7	6	16
159	8	31	16
160	9	22	16
161	10	21	16
162	0	7	17
163	1	18	17
164	2	17	17
165	3	16	17
166	4	15	17
167	5	12	17
168	6	13	17
169	7	14	17
170	8	11	17
171	9	10	17
172	0	34	18
173	1	48	18
174	2	46	18
175	3	45	18
176	4	44	18
177	5	47	18
178	6	49	18
179	7	41	18
180	8	35	18
181	0	8	19
182	1	9	19
183	2	37	19
184	3	43	19
185	4	42	19
186	5	38	19
187	6	39	19
188	7	40	19
189	8	32	19
190	9	33	19
191	10	50	19
192	0	23	20
193	1	25	20
194	2	24	20
195	3	28	20
196	4	29	20
197	5	30	20
198	6	36	20
199	7	26	20
200	8	27	20
201	0	25	21
202	1	31	21
203	2	32	21
204	3	40	21
205	4	33	21
206	5	27	21
207	6	26	21
208	7	36	21
209	8	35	21
210	0	1	22
211	1	16	22
212	2	17	22
213	3	18	22
214	4	6	22
215	5	5	22
216	6	7	22
217	7	14	22
218	8	11	22
219	9	12	22
220	10	13	22
221	11	15	22
222	12	3	22
223	13	2	22
224	0	8	23
225	1	9	23
226	2	10	23
227	3	37	23
228	4	43	23
229	5	38	23
230	6	39	23
231	7	50	23
232	0	34	24
233	1	48	24
234	2	46	24
235	3	45	24
236	4	44	24
237	5	47	24
238	6	49	24
239	7	41	24
240	8	42	24
241	0	4	25
242	1	20	25
243	2	22	25
244	3	23	25
245	4	21	25
246	5	24	25
247	6	28	25
248	7	29	25
249	8	30	25
250	9	19	25
251	0	3	26
252	1	20	26
253	2	5	26
254	3	7	26
255	4	8	26
256	5	6	26
257	6	32	26
258	7	31	26
259	8	19	26
260	0	1	27
261	1	16	27
262	2	17	27
263	3	18	27
264	4	12	27
265	5	13	27
266	6	15	27
267	7	14	27
268	8	11	27
269	9	10	27
270	10	2	27
271	0	27	28
272	1	34	28
273	2	33	28
274	3	41	28
275	4	44	28
276	5	47	28
277	6	49	28
278	7	48	28
279	8	46	28
280	9	45	28
281	10	35	28
282	0	9	29
283	1	37	29
284	2	43	29
285	3	42	29
286	4	38	29
287	5	39	29
288	6	40	29
289	7	50	29
290	0	4	30
291	1	22	30
292	2	23	30
293	3	21	30
294	4	25	30
295	5	24	30
296	6	28	30
297	7	29	30
298	8	30	30
299	9	36	30
300	10	26	30
301	0	34	31
302	1	48	31
303	2	46	31
304	3	45	31
305	4	44	31
306	5	47	31
307	6	49	31
308	7	41	31
309	8	35	31
310	0	1	32
311	1	19	32
312	2	4	32
313	3	3	32
314	4	2	32
315	5	5	32
316	0	21	33
317	1	22	33
318	2	23	33
319	3	25	33
320	4	31	33
321	5	20	33
322	6	24	33
323	7	28	33
324	8	29	33
325	9	30	33
326	10	36	33
327	11	26	33
328	12	27	33
329	0	6	34
330	1	18	34
331	2	17	34
332	3	16	34
333	4	15	34
334	5	12	34
335	6	13	34
336	7	14	34
337	8	11	34
338	9	7	34
339	10	10	34
340	0	8	35
341	1	9	35
342	2	37	35
343	3	43	35
344	4	42	35
345	5	38	35
346	6	39	35
347	7	40	35
348	8	32	35
349	9	33	35
350	10	50	35
351	0	1	36
352	1	19	36
353	2	4	36
354	3	20	36
355	4	3	36
356	5	2	36
357	6	5	36
358	7	6	36
359	8	31	36
360	9	22	36
361	10	21	36
362	0	7	37
363	1	18	37
364	2	17	37
365	3	16	37
366	4	15	37
367	5	12	37
368	6	13	37
369	7	14	37
370	8	11	37
371	9	10	37
372	0	34	38
373	1	48	38
374	2	46	38
375	3	45	38
376	4	44	38
377	5	47	38
378	6	49	38
379	7	41	38
380	8	35	38
381	0	8	39
382	1	9	39
383	2	37	39
384	3	43	39
385	4	42	39
386	5	38	39
387	6	39	39
388	7	40	39
389	8	32	39
390	9	33	39
391	10	50	39
392	0	23	40
393	1	25	40
394	2	24	40
395	3	28	40
396	4	29	40
397	5	30	40
398	6	36	40
399	7	26	40
400	8	27	40
401	0	25	41
402	1	31	41
403	2	32	41
404	3	40	41
405	4	33	41
406	5	27	41
407	6	26	41
408	7	36	41
409	8	35	41
410	0	1	42
411	1	16	42
412	2	17	42
413	3	18	42
414	4	6	42
415	5	5	42
416	6	7	42
417	7	14	42
418	8	11	42
419	9	12	42
420	10	13	42
421	11	15	42
422	12	3	42
423	13	2	42
424	0	8	43
425	1	9	43
426	2	10	43
427	3	37	43
428	4	43	43
429	5	38	43
430	6	39	43
431	7	50	43
432	0	34	44
433	1	48	44
434	2	46	44
435	3	45	44
436	4	44	44
437	5	47	44
438	6	49	44
439	7	41	44
440	8	42	44
441	0	4	45
442	1	20	45
443	2	22	45
444	3	23	45
445	4	21	45
446	5	24	45
447	6	28	45
448	7	29	45
449	8	30	45
450	9	19	45
451	0	1	46
452	1	19	46
453	2	4	46
454	3	20	46
455	4	3	46
456	5	2	46
457	6	18	46
458	7	6	46
459	8	5	46
460	9	7	46
461	10	8	46
462	11	31	46
463	12	17	46
464	0	21	47
465	1	22	47
466	2	23	47
467	3	30	47
468	4	29	47
469	5	28	47
470	6	24	47
471	0	37	48
472	1	43	48
473	2	42	48
474	3	41	48
475	4	38	48
476	5	39	48
477	6	44	48
478	7	47	48
479	8	49	48
480	9	48	48
481	10	46	48
482	11	45	48
483	0	10	49
484	1	11	49
485	2	14	49
486	3	12	49
487	4	13	49
488	5	15	49
489	6	16	49
490	7	9	49
491	8	50	49
492	0	25	50
493	1	26	50
494	2	36	50
495	3	27	50
496	4	34	50
497	5	33	50
498	6	32	50
499	7	40	50
500	8	35	50
501	0	1	51
502	1	16	51
503	2	17	51
504	3	18	51
505	4	12	51
506	5	13	51
507	6	15	51
508	7	14	51
509	8	11	51
510	9	10	51
511	0	21	52
512	1	22	52
513	2	23	52
514	3	25	52
515	4	24	52
516	5	28	52
517	6	29	52
518	7	30	52
519	8	36	52
520	9	26	52
521	10	27	52
522	0	8	53
523	1	9	53
524	2	37	53
525	3	43	53
526	4	42	53
527	5	38	53
528	6	39	53
529	7	40	53
530	8	32	53
531	9	50	53
532	0	2	54
533	1	3	54
534	2	20	54
535	3	5	54
536	4	7	54
537	5	6	54
538	6	31	54
539	7	4	54
540	8	19	54
541	0	33	55
542	1	34	55
543	2	48	55
544	3	46	55
545	4	45	55
546	5	44	55
547	6	47	55
548	7	49	55
549	8	41	55
550	9	35	55
551	0	8	56
552	1	32	56
553	2	40	56
554	3	33	56
555	4	27	56
556	5	25	56
557	6	31	56
558	7	39	56
559	0	34	57
560	1	48	57
561	2	46	57
562	3	45	57
563	4	44	57
564	5	47	57
565	6	49	57
566	7	41	57
567	8	42	57
568	9	43	57
569	10	37	57
570	11	38	57
571	12	35	57
572	0	7	58
573	1	18	58
574	2	17	58
575	3	16	58
576	4	15	58
577	5	12	58
578	6	13	58
579	7	14	58
580	8	11	58
581	9	10	58
582	10	9	58
583	11	50	58
584	0	23	59
585	1	30	59
586	2	29	59
587	3	28	59
588	4	36	59
589	5	26	59
590	6	24	59
591	0	1	60
592	1	19	60
593	2	4	60
594	3	20	60
595	4	3	60
596	5	2	60
597	6	5	60
598	7	6	60
599	8	22	60
600	9	21	60
601	0	27	61
602	1	34	61
603	2	33	61
604	3	32	61
605	4	40	61
606	5	41	61
607	6	42	61
608	7	44	61
609	8	47	61
610	9	49	61
611	10	48	61
612	11	46	61
613	12	45	61
614	13	35	61
615	0	1	62
616	1	16	62
617	2	17	62
618	3	18	62
619	4	12	62
620	5	13	62
621	6	15	62
622	7	14	62
623	8	11	62
624	9	2	62
625	0	21	63
626	1	22	63
627	2	23	63
628	3	25	63
629	4	24	63
630	5	28	63
631	6	29	63
632	7	30	63
633	8	36	63
634	9	26	63
635	0	10	64
636	1	9	64
637	2	37	64
638	3	43	64
639	4	38	64
640	5	39	64
641	6	50	64
642	0	3	65
643	1	20	65
644	2	5	65
645	3	7	65
646	4	8	65
647	5	6	65
648	6	31	65
649	7	4	65
650	8	19	65
651	0	5	66
652	1	20	66
653	2	32	66
654	3	40	66
655	4	33	66
656	5	27	66
657	6	26	66
658	7	36	66
659	8	25	66
660	9	31	66
661	0	34	67
662	1	48	67
663	2	46	67
664	3	45	67
665	4	44	67
666	5	47	67
667	6	49	67
668	7	41	67
669	8	42	67
670	9	35	67
671	0	1	68
672	1	16	68
673	2	17	68
674	3	18	68
675	4	6	68
676	5	14	68
677	6	11	68
678	7	12	68
679	8	13	68
680	9	15	68
681	10	3	68
682	11	2	68
683	0	7	69
684	1	8	69
685	2	9	69
686	3	10	69
687	4	37	69
688	5	43	69
689	6	38	69
690	7	39	69
691	8	50	69
692	0	4	70
693	1	22	70
694	2	23	70
695	3	21	70
696	4	24	70
697	5	28	70
698	6	29	70
699	7	30	70
700	8	19	70
\.


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.metrics (id, air_quality_level, filling_level, is_alive, ppm, "timestamp", container_id) FROM stdin;
\.


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.routes (id, end_at, polyline, start_at, status, driver_id) FROM stdin;
35	2026-05-19 19:43:36.9433	~yvhA|_cuMUH_CgRcAwJB}E_@o@MrDNtD_BR	2026-05-19 19:43:36.933917	FINISHED	6
24	2026-05-19 19:43:36.53089	~yvhA|_cuMUHyCmVi@qFB}EYi@aEi@}YiMyCcAyAU}B?m@uDPc@d@E	2026-05-19 19:43:36.520273	FINISHED	4
10	2026-05-19 19:43:36.028402	pkwhAtcauMgAtDdBn@}E|NG|CRdDwPlAYz@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	2026-05-19 19:43:36.013254	FINISHED	2
7	2026-05-19 19:43:35.947371	`awhAxnbuMOmBgJr@cAwJB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	2026-05-19 19:43:35.93582	FINISHED	2
21	2026-05-19 19:43:36.47234	zzvhAlbbuMAqFnBNBzE{In@GmH]m@}De@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	2026-05-19 19:43:36.46186	FINISHED	4
13	2026-05-19 19:43:36.199558	pkwhAtcauMgAtDdBn@}E|NG|CRdDwPlAYz@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	2026-05-19 19:43:36.187721	FINISHED	3
8	2026-05-19 19:43:35.973951	rhwhAfsauMELuTyH_CSZoF[a@f@{AuCiA]{AmAJASgGaCHQqAg@cD_AyJmAh@oA`Bg@	2026-05-19 19:43:35.95874	FINISHED	2
17	2026-05-19 19:43:36.377988	vawhAd_buMHpAeF^LrBcF^Yz@zCdVqD^DtAiDRa@wGx@k@l@kA_B_@	2026-05-19 19:43:36.365617	FINISHED	4
14	2026-05-19 19:43:36.227354	n}vhA`iauMz@eCoBq@zC{I[KgKhZo@dEGzCNtDaBReHnBTxACfBYzAo@rAaAbAiAl@mB^yA@lD|LsEnAl@tB	2026-05-19 19:43:36.21326	FINISHED	3
4	2026-05-19 19:43:35.879059	`{whAnrbuMvBs@Li@[kEm@m@s@AYsDwRtAY}D@sAbBeGkUcI_CSZoF[a@dDwJlIxC	2026-05-19 19:43:35.867239	FINISHED	2
33	2026-05-19 19:43:36.818169	vawhAd_buMHpAeF^LrBeF`@Wx@t@bG}RgCCiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	2026-05-19 19:43:36.806268	FINISHED	5
32	2026-05-19 19:43:36.792686	d_whApwauMa@vDH|CqBNLrBcF^Yz@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	2026-05-19 19:43:36.782728	FINISHED	5
34	2026-05-19 19:43:36.92435	zzvhAlbbuMIuBF{BnBNEzBH~AqBNLrBeF`@Wx@t@bGkMaBYzAo@rAaAbAaAh@	2026-05-19 19:43:36.913133	FINISHED	6
30	2026-05-19 19:43:36.75395	rhwhAfsauMiBxGRzGwPlAYz@t@bGkMaBYzAo@rAaAbAiAl@mB^yA@cDy@aAzAhArDjA_@BJ	2026-05-19 19:43:36.742595	FINISHED	5
25	2026-05-19 19:43:36.55408	~tuhAbnbuM@DgD~@Mu@EoADcAReAXs@lA_Bt@e@~@_@kEgOKw@@y@ZiA@Y~CnAGWRo@NgCNu@jGsOkBo@	2026-05-19 19:43:36.5413	FINISHED	4
28	2026-05-19 19:43:36.710003	n}vhA`iauMz@eCoBq@zC{I[KgKhZo@dEGzCNtDaBReHnBTxACfBYzAo@rAaAbAiAl@mB^yA@lD|LsEnAl@tB	2026-05-19 19:43:36.696733	FINISHED	5
1	2026-05-19 19:43:35.806517	`{whAnrbuMvBs@Li@[kEm@m@s@AYsDwRtAY}D@sAbBeGkUcI_CSZoF[a@dDwJlIxC	2026-05-19 19:43:35.77934	FINISHED	2
40	2026-05-19 19:43:37.030089	lowhAbnbuMPAm@iIiYrBa@cEB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@d@E	2026-05-19 19:43:37.019572	FINISHED	6
38	2026-05-19 19:43:36.99248	zzvhAlbbuMAqFnBNBzE{In@GmH]m@}De@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	2026-05-19 19:43:36.984533	FINISHED	6
36	2026-05-19 19:43:36.961263	`awhAxnbuMOmBgJr@cAwJB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	2026-05-19 19:43:36.952137	FINISHED	6
39	2026-05-19 19:43:37.010072	vawhAd_buMHpAeF^LrBcF^Yz@zCdVqD^DtAiDRa@wGx@k@l@kA_B_@	2026-05-19 19:43:37.000843	FINISHED	6
37	2026-05-19 19:43:36.977939	~yvhA|_cuMUHyCmVi@qFB}EYi@aEi@}YiMyCcAyAU}B?m@uDPc@d@E	2026-05-19 19:43:36.969763	FINISHED	6
31	2026-05-19 19:43:36.773438	pkwhAtcauMgAtDdBn@}E|NG|CRdDwPlAYz@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	2026-05-19 19:43:36.762997	FINISHED	5
29	2026-05-19 19:43:36.731213	rhwhAfsauMELuTyH_CSZoF[a@f@{AuCiA]{AmAJASgGaCHQqAg@cD_AyJmAh@oA`Bg@	2026-05-19 19:43:36.720847	FINISHED	5
26	2026-05-19 19:43:36.664576	zvwhAzhauMIC_AxCd@bHsBLaBMsE_BcBjGRzGwPlAYz@t@bG}RgCCiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	2026-05-19 19:43:36.652626	FINISHED	5
27	2026-05-19 19:43:36.685968	n}vhA`iauMz@eCoBq@tCmIwOyFsMoGs@u@IqBi@g@cDi@c@Te@~@g@RaYpBgAh@KTpB|Kd@?Cg@nCg@Ms@	2026-05-19 19:43:36.67597	FINISHED	5
20	2026-05-19 19:43:36.450512	vawhAd_buMHpAeF^LrBcF^Yz@zCdVqD^DtAiDRa@wGx@k@l@kA_B_@	2026-05-19 19:43:36.438186	FINISHED	4
19	2026-05-19 19:43:36.426297	n}vhA`iauMz@eCoBq@tCmIwOyFsMoGs@u@IqBi@g@cDi@c@Te@~@g@RaYpBgAh@KTpB|Kd@?Cg@nCg@Ms@	2026-05-19 19:43:36.416431	FINISHED	4
6	2026-05-19 19:43:35.923084	zzvhAlbbuMAqFnBNBzE{In@GmH]m@}De@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	2026-05-19 19:43:35.910366	FINISHED	2
18	2026-05-19 19:43:36.40446	`{whAnrbuMvBs@Li@[kEm@m@s@AYsDwRtAY}D@sAbBeGkUcI_CSZoF[a@dDwJlIxC	2026-05-19 19:43:36.388861	FINISHED	4
23	2026-05-19 19:43:36.510337	~yvhA|_cuMUHyCmVi@qFB}EYi@aEi@}YiMyCcAyAU}B?m@uDPc@d@E	2026-05-19 19:43:36.501021	FINISHED	4
22	2026-05-19 19:43:36.491421	zvwhAzhauMIC_AxCd@bHsBLaBMsE_BcBjGRzGwPlAYz@t@bG}RgCCiA]aAm@o@mAa@uA@iAb@k@l@]hAoDc@Hi@}Aa@	2026-05-19 19:43:36.480553	FINISHED	4
5	2026-05-19 19:43:35.898606	d_whApwauMa@vDH|CqBNLrBcF^Yz@t@bG}RgCCiAk@qAw@o@oAUiAHsAt@q@`BB~A	2026-05-19 19:43:35.887935	FINISHED	2
15	2026-05-19 19:43:36.252411	rhwhAfsauMELuTyH_CSZoF[a@f@{AuCiA]{AmAJASgGaCHQqAg@cD_AyJmAh@oA`Bg@	2026-05-19 19:43:36.239352	FINISHED	3
12	2026-05-19 19:43:36.175772	lowhAbnbuMPAm@iIiYrBa@cEB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@d@E	2026-05-19 19:43:36.160949	FINISHED	3
11	2026-05-19 19:43:36.147392	lowhAbnbuMPAm@iIiYrBa@cEB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@d@E	2026-05-19 19:43:36.13174	FINISHED	3
9	2026-05-19 19:43:35.998842	n}vhA`iauMz@eCoBq@tCmIwOyFsMoGs@u@IqBi@g@cDi@c@Te@~@g@RaYpBgAh@KTpB|Kd@?Cg@nCg@Ms@	2026-05-19 19:43:35.986018	FINISHED	2
2	2026-05-19 19:43:35.835961	n}vhA`iauMz@eCoBq@zC{I[KgKhZo@dEGzCNtDaBReHnBTxACfBYzAo@rAaAbAiAl@mB^yA@lD|LsEnAl@tB	2026-05-19 19:43:35.82314	FINISHED	2
3	2026-05-19 19:43:35.855565	~yvhA|_cuMUHyCmVi@qFB}EYi@aEi@}YiMyCcAyAU}B?m@uDPc@d@E	2026-05-19 19:43:35.844638	FINISHED	2
16	2026-05-19 19:43:36.274675	`awhAxnbuMOmBgJr@cAwJB}E]m@}De@}YiMyCcAyAU}B?m@uDPc@b@EDaB|BBnC`@p@kCNoB	2026-05-19 19:43:36.264089	FINISHED	3
\.


--
-- Data for Name: points; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.points (id, latitude, longitude, "timestamp", route_id) FROM stdin;
\.


--
-- Data for Name: polylines; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.polylines (id, polyline, segment_order, generated_route_id) FROM stdin;
1	`awhAxnbuMOmByIp@	0	1
2	vuvhA|lbuMM@w@gHhF_@?I	1	1
3	zzvhAlbbuMIuBF{BnBNZyB	2	1
4	d_whApwauM^uAsEcBc@xA	3	1
5	lxvhAptauMb@yA~HrCi@tBMhAAxA	4	1
6	vawhAd_buMHpAoM~@KoAB}E]m@iD]qEqBi@lAAV	5	1
7	bevhApwauMAIb@kAnEnBlDd@GzCNtD_BR	6	1
8	jovhAvdbuM~ASPtAl@n@fSyArAhRvA_@PfD_FrAAK	7	1
9	`{whAnrbuMvBs@Li@[kEQY[Ss@AUwCpFe@@N	0	2
10	fbxhAfbbuMZhDiDX[Ss@AYsDwE\\AG	1	2
11	tswhAvbbuMKmBsGd@	2	2
12	tjwhAn`buMtAKCcBp@qDtAJhCKBP	3	2
13	|uwhA~wauMk@mIHc@t@uBHB	4	2
14	zvwhAzhauMxBbAb@r@Hv@jBO@H	5	2
15	p_xhAdnauMZ`FiMz@aBMwA_@bBsEHB	6	2
16	vowhAdoauMiC_AyA`E	7	2
17	rhwhAfsauMELmE_BlEkMbBj@	8	2
18	pkwhAtcauMFBoApDdBn@kEdMY~A?tBXbEnAKl@jHjDW	9	2
19	bvuhAz`buMBJTGkEgOKw@@y@]I	0	3
20	houhAzlauMF@@bBrA`FfBe@~BDClA	1	3
21	jyuhApxauMHsEZgAXa@mDyARo@TeDBKLD	2	3
22	xwuhA|dauMMEHWfGgOkBo@	3	3
23	p|uhAfr`uMuBq@_Fo@_@rE	4	3
24	zpuhAxu`uMOnBq@jCvA`@m@vB@P	5	3
25	dpuhA`cauMJZ{ACs@MTgAKWkASwBE	6	3
26	ffuhAp_auMBaBkAFwAiI	7	3
27	fauhAlr`uMc@{B@c@LMrCMdFn@Pq@V]n@Yp@M	8	3
28	xpuhAhj`uMbCO^@~Ez@tAl@cMd[yCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	9	3
29	n}vhA`iauMz@eCoBq@zC{I[KmAbDeGwBg@zA	0	4
30	~svhAh|`uMWx@Eb@qFqBW]KcAkAJ	1	4
31	~gvhA~x`uMUNs@~AsAi@o@|A	2	4
32	pavhAb~`uMn@}ArAh@oA|CdCdAJWRM`@??H	3	4
33	livhAvbauMEn@|AHUrE	4	4
34	nkvhAdkauMTsE}AIe@dI_@nAyB_A	5	4
35	fcvhA|nauMbBaF^gCJWRM`@?JiA^Y|Bj@dDwJlIxC	6	4
36	~yvhA|_cuMUHc@iDSGMNb@fDqD^DjA	0	5
37	zrvhAxccuMN|BgJnCq@cC	1	5
38	pfvhAbhcuMkBmGhHuBb@Wf@i@Zu@_B_@	2	5
39	vlvhAfwbuM~A^n@uFcOmBCiA]aAFE	3	5
40	h`vhAphbuMjCeB`@z@T|@LnBMzAo@lBaAlAsAx@	4	5
41	f`vhAfwbuMyA\\wAH}AOcBk@aAzA_Cj@	5	5
42	pnuhAzzbuM]TGXt@~CdGgBBJ	6	5
43	jwuhAn~buMrBjHmA^l@tB	7	5
44	~yuhAplcuM@DcCt@c@gAUWuGkVaAeEj@QLOp@eD	8	5
45	vluhArgbuM|A`@r@gBnCjB]hACt@Fh@	9	5
46	`awhAxnbuMOmByIp@	0	6
47	vuvhA|lbuMM@w@gHhF_@?I	1	6
48	zzvhAlbbuMIuBF{BnBNZyB	2	6
49	d_whApwauM^uAsEcBc@xA	3	6
50	lxvhAptauMb@yA~HrCi@tBMhAAxA	4	6
51	vawhAd_buMHpAoM~@KoAB}E]m@iD]qEqBi@lAAV	5	6
52	bevhApwauMAIb@kAnEnBlDd@GzCNtD_BR	6	6
53	jovhAvdbuM~ASPtAl@n@fSyArAhRvA_@PfD_FrAAK	7	6
54	`{whAnrbuMvBs@Li@[kEQY[Ss@AUwCpFe@@N	0	7
55	fbxhAfbbuMZhDiDX[Ss@AYsDwE\\AG	1	7
56	tswhAvbbuMKmBsGd@	2	7
57	tjwhAn`buMtAKCcBp@qDtAJhCKBP	3	7
58	|uwhA~wauMk@mIHc@t@uBHB	4	7
59	zvwhAzhauMxBbAb@r@Hv@jBO@H	5	7
60	p_xhAdnauMZ`FiMz@aBMwA_@bBsEHB	6	7
61	vowhAdoauMiC_AyA`E	7	7
62	rhwhAfsauMELmE_BlEkMbBj@	8	7
63	pkwhAtcauMFBoApDdBn@kEdMY~A?tBXbEnAKl@jHjDW	9	7
64	bvuhAz`buMBJTGkEgOKw@@y@]I	0	8
65	houhAzlauMF@@bBrA`FfBe@~BDClA	1	8
66	jyuhApxauMHsEZgAXa@mDyARo@TeDBKLD	2	8
67	xwuhA|dauMMEHWfGgOkBo@	3	8
68	p|uhAfr`uMuBq@_Fo@_@rE	4	8
69	zpuhAxu`uMOnBq@jCvA`@m@vB@P	5	8
70	dpuhA`cauMJZ{ACs@MTgAKWkASwBE	6	8
71	ffuhAp_auMBaBkAFwAiI	7	8
72	fauhAlr`uMc@{B@c@LMrCMdFn@Pq@V]n@Yp@M	8	8
73	xpuhAhj`uMbCO^@~Ez@tAl@cMd[yCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	9	8
74	n}vhA`iauMz@eCoBq@zC{I[KmAbDeGwBg@zA	0	9
75	~svhAh|`uMWx@Eb@qFqBW]KcAkAJ	1	9
76	~gvhA~x`uMUNs@~AsAi@o@|A	2	9
77	pavhAb~`uMn@}ArAh@oA|CdCdAJWRM`@??H	3	9
78	livhAvbauMEn@|AHUrE	4	9
79	nkvhAdkauMTsE}AIe@dI_@nAyB_A	5	9
80	fcvhA|nauMbBaF^gCJWRM`@?JiA^Y|Bj@dDwJlIxC	6	9
81	~yvhA|_cuMUHc@iDSGMNb@fDqD^DjA	0	10
82	zrvhAxccuMN|BgJnCq@cC	1	10
83	pfvhAbhcuMkBmGhHuBb@Wf@i@Zu@_B_@	2	10
84	vlvhAfwbuM~A^n@uFcOmBCiA]aAFE	3	10
85	h`vhAphbuMjCeB`@z@T|@LnBMzAo@lBaAlAsAx@	4	10
86	f`vhAfwbuMyA\\wAH}AOcBk@aAzA_Cj@	5	10
87	pnuhAzzbuM]TGXt@~CdGgBBJ	6	10
88	jwuhAn~buMrBjHmA^l@tB	7	10
89	~yuhAplcuM@DcCt@c@gAUWuGkVaAeEj@QLOp@eD	8	10
90	vluhArgbuM|A`@r@gBnCjB]hACt@Fh@	9	10
91	houhAzlauM{EgAi@?sAwHPc@d@E	0	11
92	ffuhAp_auMBaBkAFwAiI	1	11
93	fauhAlr`uMc@{B@c@LMrCMdFn@Pq@V]n@Yp@M	2	11
94	xpuhAhj`uMbCO^@~Ez@tAl@qAdDOC	3	11
95	p|uhAfr`uMuBq@_Fo@_@rE	4	11
96	zpuhAxu`uMOnBq@jCvA`@m@vB@P	5	11
97	dpuhA`cauMJZ~Al@kAtC~CnAGWRo@RwCDYLD	6	11
98	xwuhA|dauMMEDKtCiHyAo@}FxNyCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	7	11
99	`{whAnrbuMj@QV`DsM`E_FrAAK	0	12
100	ngwhAh_cuMSwC{KjD	1	12
101	~yvhA|_cuM|GwB{@kL	2	12
102	`awhAxnbuMOmBxGg@TvCjDW	3	12
103	lowhAbnbuMPAm@iIgRrAM}B	4	12
104	vlvhAfwbuM~A^r@h@n@fI	0	13
105	zrvhAxccuMN|BgJnCq@cC	1	13
106	pfvhAbhcuMuGcU~@s@b@mAD_AQeAQ_@FE	2	13
107	h`vhAphbuMjCeBl@zAfHoB	3	13
108	jovhAvdbuM~AS~ArMXs@[cCLA	4	13
109	vuvhA|lbuMM@c@sDYz@t@bGkMaBYzAo@rAaAbAaAh@	5	13
110	f`vhAfwbuMyA\\wAH}AOcBk@aAzA_Cj@	6	13
111	pnuhAzzbuM]TGXt@~CdGgBBJ	7	13
112	jwuhAn~buMrBjHmA^l@tB	8	13
113	~yuhAplcuM@DcCt@c@gAUWuGkVaAeEj@QLOp@eD	9	13
114	vluhArgbuM|A`@r@gBnCjB]hACt@Fh@	10	13
115	~tuhAbnbuM@DgD~@QqABwBReAXs@lA_Bt@e@~@_@aCeISHzBvH	11	13
116	vawhAd_buMHpArGg@	0	14
117	tjwhAn`buMrGe@JlB	1	14
118	tswhAvbbuM@F{DZBZdS_B@N	2	14
119	fbxhAfbbuMFTBUEy@sAsQI@@H	3	14
120	p_xhAdnauMZ`FuIl@Dh@	4	14
121	|uwhA~wauMk@mIHc@t@uBHB	5	14
122	zvwhAzhauMIC}@nCR|DkC@aBYr@kBHB	6	14
123	vowhAdoauMiC_AyA`E	7	14
124	rhwhAfsauMoAxDQv@iBWh@uBkBo@_@tA	8	14
125	d_whApwauM^uAsEcBn@gBpE`BxEgNbBj@	9	14
126	lxvhAptauMEVsBc@|AgFhCsHnBp@{@dC	0	15
127	n}vhA`iauMz@eCoBq@zC{I[KmAbDeGwBg@zA	1	15
128	~svhAh|`uMWx@Eb@qFqBW]KcAkAJ	2	15
129	~gvhA~x`uMUNs@~AsAi@o@|A	3	15
130	pavhAb~`uMn@}ArAh@oA|CdCdAJWRM`@??H	4	15
131	livhAvbauMEn@|AHUrE	5	15
132	nkvhAdkauMTsE}AIe@dI_@nAyB_A	6	15
133	fcvhA|nauMi@lAEb@lCjA_@|@AV	7	15
134	bevhApwauM@Wh@mAcJwDY`@[fAIrE	8	15
135	jyuhApxauMHsEZgAXa@l@{ABw@lDFrAZj@gB^gCJWRM`@?JiA^Y|Bj@dDwJlIxC	9	15
136	`{whAnrbuMj@QV`DsM`E_FrAAK	0	16
137	ngwhAh_cuMSwC{KjD	1	16
138	~yvhA|_cuMUH_CgRLA	2	16
139	vuvhA|lbuMxIq@NlB	3	16
140	`awhAxnbuMOmBxGg@TvCjDW	4	16
141	lowhAbnbuMPAm@iIgRrAM}B	5	16
142	zzvhAlbbuMIuBF{BnBNEzBH~ArBOIqA	6	16
143	vawhAd_buMHpAoM~@KoAB}Ea@o@KrDNtD_BR	7	16
144	jovhAvdbuM~ASzDh[qD^DjA	8	16
145	zrvhAxccuM?HiDRa@wGx@k@l@kA_B_@	9	16
146	d_whApwauMQbAOrBH|CfKw@	0	17
147	tjwhAn`buMrGe@JlB	1	17
148	tswhAvbbuM@F{DZBZdS_B@N	2	17
149	fbxhAfbbuMFTBUEy@sAsQI@@H	3	17
150	p_xhAdnauMZ`FuIl@Dh@	4	17
151	|uwhA~wauMk@mIHc@t@uBHB	5	17
152	zvwhAzhauMIC}@nCR|DkC@aBYr@kBHB	6	17
153	vowhAdoauMiC_AyA`E	7	17
154	rhwhAfsauMELmE_BlEkMbBj@	8	17
155	houhAzlauM{EgAi@?sAwHPc@d@E	0	18
156	ffuhAp_auMBaBkAFwAiI	1	18
157	fauhAlr`uMc@{B@c@LMrCMdFn@Pq@V]n@Yp@M	2	18
158	xpuhAhj`uMbCO^@~Ez@tAl@qAdDOC	3	18
159	p|uhAfr`uMuBq@_Fo@_@rE	4	18
160	zpuhAxu`uMOnBq@jCvA`@m@vB@P	5	18
161	dpuhA`cauMJZ~Al@kAtC~CnAGWRo@RwCDYLD	6	18
162	xwuhA|dauMMEDKtCiHyAo@}FxNyCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	7	18
163	lxvhAptauMEVsBc@|AgFhCsHnBp@{@dC	0	19
164	n}vhA`iauMz@eCoBq@zC{I[KmAbDeGwBg@zA	1	19
165	~svhAh|`uMWx@Eb@qFqBW]KcAkAJ	2	19
166	~gvhA~x`uMUNs@~AsAi@o@|A	3	19
167	pavhAb~`uMn@}ArAh@oA|CdCdAJWRM`@??H	4	19
168	livhAvbauMEn@|AHUrE	5	19
169	nkvhAdkauMTsE}AIe@dI_@nAyB_A	6	19
170	fcvhA|nauMi@lAEb@lCjA_@|@AV	7	19
171	bevhApwauM@Wh@mAcJwDY`@[fAIrE	8	19
172	jyuhApxauMHsEZgAXa@l@{ABw@lDFrAZj@gB^gCJWRM`@?JiA^Y|Bj@dDwJlIxC	9	19
173	pfvhAbhcuMuGcU~@s@b@mAD_AQeAQ_@FE	0	20
174	h`vhAphbuMjCeB`@z@T|@LnBMzAo@lBaAlAsAx@	1	20
175	f`vhAfwbuMyA\\wAH}AOcBk@aAzA_Cj@	2	20
176	pnuhAzzbuM]TGXt@~CdGgBBJ	3	20
177	jwuhAn~buMrBjHmA^l@tB	4	20
178	~yuhAplcuM@DcCt@c@gAUWuGkVaAeEj@QLOp@eD	5	20
179	vluhArgbuM|A`@r@gBnCjB]hACt@Fh@	6	20
180	~tuhAbnbuM@DgD~@QqABwBReAXs@lA_Bt@e@~@_@aCeISHzBvH	7	20
181	h`vhAphbuMjCeBl@zAfHoB	0	21
182	jovhAvdbuMS}B?qCoAOuAe@}BkAOS	1	21
183	bevhApwauM@Wh@mAuCmAl@_B	2	21
184	fcvhA|nauMm@~AmEiBOJe@|AIrE	3	21
185	jyuhApxauMBmA_CEgBd@zBvH	4	21
186	bvuhAz`buMfAvD}@l@_@n@UjAFdA	5	21
187	~tuhAbnbuM@DgD~@SoB@cAL_A}Aa@	6	21
188	vluhArgbuMv@oFw@Cs@Du@}J	7	21
189	`{whAnrbuMvBs@Li@[kEQY[Ss@AUwCpFe@@N	0	22
190	fbxhAfbbuMZhDiDX[Ss@AYsDwE\\AG	1	22
191	tswhAvbbuMKmBsGd@	2	22
192	tjwhAn`buMsGf@IqA	3	22
193	vawhAd_buMHpAeF^?I	4	22
194	zzvhAlbbuMIuBF{BnBNZyB	5	22
195	d_whApwauM^uAsEcBn@gBtLfEjBeFrBr@	6	22
196	vowhAdoauMiC_AyA`E	7	22
197	rhwhAfsauMQf@hDnAl@LtAJhCKBP	8	22
198	|uwhA~wauMk@mIHc@t@uBHB	9	22
199	zvwhAzhauMxBbAb@r@Hv@jBO@H	10	22
200	p_xhAdnauMpBjXiDX[S_AAkYtBNlB	11	22
201	`awhAxnbuMOmBxGg@TvCjDW	12	22
202	lxvhAptauMEVsBc@|AgFhCsHnBp@{@dC	0	23
203	n}vhA`iauMjCwHtHjC	1	23
204	pkwhAtcauMcBk@mEjMaOaFb@kIDc@Vy@	2	23
205	~svhAh|`uMWx@Eb@qFqBW]KcAkAJ	3	23
206	~gvhA~x`uMUNQZqB`FdCdAJWRM`@??H	4	23
207	livhAvbauMEn@|AHUrE	5	23
208	nkvhAdkauMTsE`BLJuB[SdDwJlIxC	6	23
209	houhAzlauM{EgAi@?sAwHPc@d@E	0	24
210	ffuhAp_auMBaBkAFwAiI	1	24
211	fauhAlr`uMc@{B@c@LMrCMdFn@Pq@V]n@Yp@M	2	24
212	xpuhAhj`uMbCO^@~Ez@tAl@qAdDOC	3	24
213	p|uhAfr`uMuBq@_Fo@_@rE	4	24
214	zpuhAxu`uMOnBq@jCvA`@m@vB@P	5	24
215	dpuhA`cauMJZ~Al@kAtC~CnAGWRo@RwCDYLD	6	24
216	xwuhA|dauMMEDKtCiHnDvAEH	7	24
217	~yvhA|_cuMUH_CgRLA	0	25
218	vuvhA|lbuMM@c@sDYz@zCdVqD^DjA	1	25
219	zrvhAxccuMN|BgJnCq@cC	2	25
220	pfvhAbhcuMkBmGhHuBb@Wf@i@Zu@_B_@	3	25
221	vlvhAfwbuM~A^n@uFqIgAYzAo@rAaAbAaAh@	4	25
222	f`vhAfwbuMyA\\wAH}AOcBk@aAzA_Cj@	5	25
223	pnuhAzzbuM]TGXt@~CdGgBBJ	6	25
224	jwuhAn~buMrBjHmA^l@tB	7	25
225	~yuhAplcuMaCz@y@_By@}CtYwIh@c@l@kAf@kEpCVRo@[cC`S{Az@tMvA_@PfD_FrAAK	8	25
226	`awhAxnbuMOmByIp@	0	26
227	vuvhA|lbuMM@w@gHhF_@?I	1	26
228	zzvhAlbbuMIuBF{BnBNZyB	2	26
229	d_whApwauM^uAsEcBc@xA	3	26
230	lxvhAptauMb@yA~HrCi@tBMhAAxA	4	26
231	vawhAd_buMHpAoM~@KoAB}E]m@iD]qEqBi@lAAV	5	26
232	bevhApwauMAIb@kAnEnBlDd@GzCNtD_BR	6	26
233	jovhAvdbuM~ASPtAl@n@fSyArAhRvA_@PfD_FrAAK	7	26
234	`{whAnrbuMvBs@Li@[kEQY[Ss@AUwCpFe@@N	0	27
235	fbxhAfbbuMZhDiDX[Ss@AYsDwE\\AG	1	27
236	tswhAvbbuMKmBsGd@	2	27
237	tjwhAn`buMtAKCcBp@qDtAJhCKBP	3	27
238	|uwhA~wauMk@mIHc@t@uBHB	4	27
239	zvwhAzhauMxBbAb@r@Hv@jBO@H	5	27
240	p_xhAdnauMZ`FiMz@aBMwA_@bBsEHB	6	27
241	vowhAdoauMiC_AyA`E	7	27
242	rhwhAfsauMELmE_BlEkMbBj@	8	27
243	pkwhAtcauMFBoApDdBn@kEdMY~A?tBXbEnAKl@jHjDW	9	27
244	bvuhAz`buMBJTGkEgOKw@@y@]I	0	28
245	houhAzlauMF@@bBrA`FfBe@~BDClA	1	28
246	jyuhApxauMHsEZgAXa@mDyARo@TeDBKLD	2	28
247	xwuhA|dauMMEHWfGgOkBo@	3	28
248	p|uhAfr`uMuBq@_Fo@_@rE	4	28
249	zpuhAxu`uMOnBq@jCvA`@m@vB@P	5	28
250	dpuhA`cauMJZ{ACs@MTgAKWkASwBE	6	28
251	ffuhAp_auMBaBkAFwAiI	7	28
252	fauhAlr`uMc@{B@c@LMrCMdFn@Pq@V]n@Yp@M	8	28
253	xpuhAhj`uMbCO^@~Ez@tAl@cMd[yCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	9	28
254	n}vhA`iauMz@eCoBq@zC{I[KmAbDeGwBg@zA	0	29
255	~svhAh|`uMWx@Eb@qFqBW]KcAkAJ	1	29
256	~gvhA~x`uMUNs@~AsAi@o@|A	2	29
257	pavhAb~`uMn@}ArAh@oA|CdCdAJWRM`@??H	3	29
258	livhAvbauMEn@|AHUrE	4	29
259	nkvhAdkauMTsE}AIe@dI_@nAyB_A	5	29
260	fcvhA|nauMbBaF^gCJWRM`@?JiA^Y|Bj@dDwJlIxC	6	29
261	~yvhA|_cuMUHc@iDSGMNb@fDqD^DjA	0	30
262	zrvhAxccuMN|BgJnCq@cC	1	30
263	pfvhAbhcuMkBmGhHuBb@Wf@i@Zu@_B_@	2	30
264	vlvhAfwbuM~A^n@uFcOmBCiA]aAFE	3	30
265	h`vhAphbuMjCeB`@z@T|@LnBMzAo@lBaAlAsAx@	4	30
266	f`vhAfwbuMyA\\wAH}AOcBk@aAzA_Cj@	5	30
267	pnuhAzzbuM]TGXt@~CdGgBBJ	6	30
268	jwuhAn~buMrBjHmA^l@tB	7	30
269	~yuhAplcuM@DcCt@c@gAUWuGkVaAeEj@QLOp@eD	8	30
270	vluhArgbuM|A`@r@gBnCjB]hACt@Fh@	9	30
271	houhAzlauM{EgAi@?sAwHPc@d@E	0	31
272	ffuhAp_auMBaBkAFwAiI	1	31
273	fauhAlr`uMc@{B@c@LMrCMdFn@Pq@V]n@Yp@M	2	31
274	xpuhAhj`uMbCO^@~Ez@tAl@qAdDOC	3	31
275	p|uhAfr`uMuBq@_Fo@_@rE	4	31
276	zpuhAxu`uMOnBq@jCvA`@m@vB@P	5	31
277	dpuhA`cauMJZ~Al@kAtC~CnAGWRo@RwCDYLD	6	31
278	xwuhA|dauMMEDKtCiHyAo@}FxNyCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	7	31
279	`{whAnrbuMj@QV`DsM`E_FrAAK	0	32
280	ngwhAh_cuMSwC{KjD	1	32
281	~yvhA|_cuM|GwB{@kL	2	32
282	`awhAxnbuMOmBxGg@TvCjDW	3	32
283	lowhAbnbuMPAm@iIgRrAM}B	4	32
284	vlvhAfwbuM~A^r@h@n@fI	0	33
285	zrvhAxccuMN|BgJnCq@cC	1	33
286	pfvhAbhcuMuGcU~@s@b@mAD_AQeAQ_@FE	2	33
287	h`vhAphbuMjCeBl@zAfHoB	3	33
288	jovhAvdbuM~AS~ArMXs@[cCLA	4	33
289	vuvhA|lbuMM@c@sDYz@t@bGkMaBYzAo@rAaAbAaAh@	5	33
290	f`vhAfwbuMyA\\wAH}AOcBk@aAzA_Cj@	6	33
291	pnuhAzzbuM]TGXt@~CdGgBBJ	7	33
292	jwuhAn~buMrBjHmA^l@tB	8	33
293	~yuhAplcuM@DcCt@c@gAUWuGkVaAeEj@QLOp@eD	9	33
294	vluhArgbuM|A`@r@gBnCjB]hACt@Fh@	10	33
295	~tuhAbnbuM@DgD~@QqABwBReAXs@lA_Bt@e@~@_@aCeISHzBvH	11	33
296	vawhAd_buMHpArGg@	0	34
297	tjwhAn`buMrGe@JlB	1	34
298	tswhAvbbuM@F{DZBZdS_B@N	2	34
299	fbxhAfbbuMFTBUEy@sAsQI@@H	3	34
300	p_xhAdnauMZ`FuIl@Dh@	4	34
301	|uwhA~wauMk@mIHc@t@uBHB	5	34
302	zvwhAzhauMIC}@nCR|DkC@aBYr@kBHB	6	34
303	vowhAdoauMiC_AyA`E	7	34
304	rhwhAfsauMoAxDQv@iBWh@uBkBo@_@tA	8	34
305	d_whApwauM^uAsEcBn@gBpE`BxEgNbBj@	9	34
306	lxvhAptauMEVsBc@|AgFhCsHnBp@{@dC	0	35
307	n}vhA`iauMz@eCoBq@zC{I[KmAbDeGwBg@zA	1	35
308	~svhAh|`uMWx@Eb@qFqBW]KcAkAJ	2	35
309	~gvhA~x`uMUNs@~AsAi@o@|A	3	35
310	pavhAb~`uMn@}ArAh@oA|CdCdAJWRM`@??H	4	35
311	livhAvbauMEn@|AHUrE	5	35
312	nkvhAdkauMTsE}AIe@dI_@nAyB_A	6	35
313	fcvhA|nauMi@lAEb@lCjA_@|@AV	7	35
314	bevhApwauM@Wh@mAcJwDY`@[fAIrE	8	35
315	jyuhApxauMHsEZgAXa@l@{ABw@lDFrAZj@gB^gCJWRM`@?JiA^Y|Bj@dDwJlIxC	9	35
316	`{whAnrbuMj@QV`DsM`E_FrAAK	0	36
317	ngwhAh_cuMSwC{KjD	1	36
318	~yvhA|_cuMUH_CgRLA	2	36
319	vuvhA|lbuMxIq@NlB	3	36
320	`awhAxnbuMOmBxGg@TvCjDW	4	36
321	lowhAbnbuMPAm@iIgRrAM}B	5	36
322	zzvhAlbbuMIuBF{BnBNEzBH~ArBOIqA	6	36
323	vawhAd_buMHpAoM~@KoAB}Ea@o@KrDNtD_BR	7	36
324	jovhAvdbuM~ASzDh[qD^DjA	8	36
325	zrvhAxccuM?HiDRa@wGx@k@l@kA_B_@	9	36
326	d_whApwauMQbAOrBH|CfKw@	0	37
327	tjwhAn`buMrGe@JlB	1	37
328	tswhAvbbuM@F{DZBZdS_B@N	2	37
329	fbxhAfbbuMFTBUEy@sAsQI@@H	3	37
330	p_xhAdnauMZ`FuIl@Dh@	4	37
331	|uwhA~wauMk@mIHc@t@uBHB	5	37
332	zvwhAzhauMIC}@nCR|DkC@aBYr@kBHB	6	37
333	vowhAdoauMiC_AyA`E	7	37
334	rhwhAfsauMELmE_BlEkMbBj@	8	37
335	houhAzlauM{EgAi@?sAwHPc@d@E	0	38
336	ffuhAp_auMBaBkAFwAiI	1	38
337	fauhAlr`uMc@{B@c@LMrCMdFn@Pq@V]n@Yp@M	2	38
338	xpuhAhj`uMbCO^@~Ez@tAl@qAdDOC	3	38
339	p|uhAfr`uMuBq@_Fo@_@rE	4	38
340	zpuhAxu`uMOnBq@jCvA`@m@vB@P	5	38
341	dpuhA`cauMJZ~Al@kAtC~CnAGWRo@RwCDYLD	6	38
342	xwuhA|dauMMEDKtCiHyAo@}FxNyCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	7	38
343	lxvhAptauMEVsBc@|AgFhCsHnBp@{@dC	0	39
344	n}vhA`iauMz@eCoBq@zC{I[KmAbDeGwBg@zA	1	39
345	~svhAh|`uMWx@Eb@qFqBW]KcAkAJ	2	39
346	~gvhA~x`uMUNs@~AsAi@o@|A	3	39
347	pavhAb~`uMn@}ArAh@oA|CdCdAJWRM`@??H	4	39
348	livhAvbauMEn@|AHUrE	5	39
349	nkvhAdkauMTsE}AIe@dI_@nAyB_A	6	39
350	fcvhA|nauMi@lAEb@lCjA_@|@AV	7	39
351	bevhApwauM@Wh@mAcJwDY`@[fAIrE	8	39
352	jyuhApxauMHsEZgAXa@l@{ABw@lDFrAZj@gB^gCJWRM`@?JiA^Y|Bj@dDwJlIxC	9	39
353	pfvhAbhcuMuGcU~@s@b@mAD_AQeAQ_@FE	0	40
354	h`vhAphbuMjCeB`@z@T|@LnBMzAo@lBaAlAsAx@	1	40
355	f`vhAfwbuMyA\\wAH}AOcBk@aAzA_Cj@	2	40
356	pnuhAzzbuM]TGXt@~CdGgBBJ	3	40
357	jwuhAn~buMrBjHmA^l@tB	4	40
358	~yuhAplcuM@DcCt@c@gAUWuGkVaAeEj@QLOp@eD	5	40
359	vluhArgbuM|A`@r@gBnCjB]hACt@Fh@	6	40
360	~tuhAbnbuM@DgD~@QqABwBReAXs@lA_Bt@e@~@_@aCeISHzBvH	7	40
361	h`vhAphbuMjCeBl@zAfHoB	0	41
362	jovhAvdbuMS}B?qCoAOuAe@}BkAOS	1	41
363	bevhApwauM@Wh@mAuCmAl@_B	2	41
364	fcvhA|nauMm@~AmEiBOJe@|AIrE	3	41
365	jyuhApxauMBmA_CEgBd@zBvH	4	41
366	bvuhAz`buMfAvD}@l@_@n@UjAFdA	5	41
367	~tuhAbnbuM@DgD~@SoB@cAL_A}Aa@	6	41
368	vluhArgbuMv@oFw@Cs@Du@}J	7	41
369	`{whAnrbuMvBs@Li@[kEQY[Ss@AUwCpFe@@N	0	42
370	fbxhAfbbuMZhDiDX[Ss@AYsDwE\\AG	1	42
371	tswhAvbbuMKmBsGd@	2	42
372	tjwhAn`buMsGf@IqA	3	42
373	vawhAd_buMHpAeF^?I	4	42
374	zzvhAlbbuMIuBF{BnBNZyB	5	42
375	d_whApwauM^uAsEcBn@gBtLfEjBeFrBr@	6	42
376	vowhAdoauMiC_AyA`E	7	42
377	rhwhAfsauMQf@hDnAl@LtAJhCKBP	8	42
378	|uwhA~wauMk@mIHc@t@uBHB	9	42
379	zvwhAzhauMxBbAb@r@Hv@jBO@H	10	42
380	p_xhAdnauMpBjXiDX[S_AAkYtBNlB	11	42
381	`awhAxnbuMOmBxGg@TvCjDW	12	42
382	lxvhAptauMEVsBc@|AgFhCsHnBp@{@dC	0	43
383	n}vhA`iauMjCwHtHjC	1	43
384	pkwhAtcauMcBk@mEjMaOaFb@kIDc@Vy@	2	43
385	~svhAh|`uMWx@Eb@qFqBW]KcAkAJ	3	43
386	~gvhA~x`uMUNQZqB`FdCdAJWRM`@??H	4	43
387	livhAvbauMEn@|AHUrE	5	43
388	nkvhAdkauMTsE`BLJuB[SdDwJlIxC	6	43
389	houhAzlauM{EgAi@?sAwHPc@d@E	0	44
390	ffuhAp_auMBaBkAFwAiI	1	44
391	fauhAlr`uMc@{B@c@LMrCMdFn@Pq@V]n@Yp@M	2	44
392	xpuhAhj`uMbCO^@~Ez@tAl@qAdDOC	3	44
393	p|uhAfr`uMuBq@_Fo@_@rE	4	44
394	zpuhAxu`uMOnBq@jCvA`@m@vB@P	5	44
395	dpuhA`cauMJZ~Al@kAtC~CnAGWRo@RwCDYLD	6	44
396	xwuhA|dauMMEDKtCiHnDvAEH	7	44
397	~yvhA|_cuMUH_CgRLA	0	45
398	vuvhA|lbuMM@c@sDYz@zCdVqD^DjA	1	45
399	zrvhAxccuMN|BgJnCq@cC	2	45
400	pfvhAbhcuMkBmGhHuBb@Wf@i@Zu@_B_@	3	45
401	vlvhAfwbuM~A^n@uFqIgAYzAo@rAaAbAaAh@	4	45
402	f`vhAfwbuMyA\\wAH}AOcBk@aAzA_Cj@	5	45
403	pnuhAzzbuM]TGXt@~CdGgBBJ	6	45
404	jwuhAn~buMrBjHmA^l@tB	7	45
405	~yuhAplcuMaCz@y@_By@}CtYwIh@c@l@kAf@kEpCVRo@[cC`S{Az@tMvA_@PfD_FrAAK	8	45
406	`{whAnrbuMj@QV`DsM`E_FrAAK	0	46
407	ngwhAh_cuMSwC{KjD	1	46
408	~yvhA|_cuMUH_CgRLA	2	46
409	vuvhA|lbuMxIq@NlB	3	46
410	`awhAxnbuMOmBxGg@TvCjDW	4	46
411	lowhAbnbuMPAm@iIUBOwBuAJ	5	46
412	tjwhAn`buMsGf@IqA	6	46
413	vawhAd_buMHpAeF^?I	7	46
414	zzvhAlbbuMIuBF{BnBNZyB	8	46
415	d_whApwauM^uAsEcBc@xA	9	46
416	lxvhAptauMs@nFuBCDs@a@o@KrDNtD_BR	10	46
417	jovhAvdbuM~ASPtAl@n@fe@kDC[yET	11	46
418	vlvhAfwbuM~A^r@h@n@fI	0	47
419	zrvhAxccuMN|BgJnCq@cC	1	47
420	pfvhAbhcuMEKwDhAm@uBsEnAl@tB	2	47
421	~yuhAplcuM@DcCt@c@gAUW{BqI~EwABJ	3	47
422	jwuhAn~buM~@bDbCs@wBqHwAUkAc@aAzA_Cj@	4	47
423	pnuhAzzbuMMD}A{FdI_CXh@b@`@~@^p@Dv@E`Aa@d@c@^_ApDd@]jAc@z@aAbAaAh@	5	47
424	~svhAh|`uMWx@Eb@qFqBW]KcAkAJ	0	48
425	~gvhA~x`uMUNs@~AsAi@o@|A	1	48
426	pavhAb~`uMgArCwAm@g@lAIz@m@Cw@Q	2	48
427	xwuhA|dauMhARrKR^iB^OT@?H	3	48
428	livhAvbauMEn@|AHUrE	4	48
429	nkvhAdkauMTsE}AIDy@m@BS`@eCeApBaFP[ROASgGaCHQkBo@	5	48
430	p|uhAfr`uMuBq@_Fo@_@rE	6	48
431	zpuhAxu`uMOnBq@jCvA`@m@vB@P	7	48
432	dpuhA`cauMJZ{ACs@MTgAKWkASwBE	8	48
433	ffuhAp_auMBaBkAFwAiI	9	48
434	fauhAlr`uMc@{B@c@LMrCMdFn@Pq@V]n@Yp@M	10	48
435	pkwhAtcauMFBoApDdBn@{BjG	0	49
436	rhwhAfsauMQf@TFjBeFrBr@	1	49
437	vowhAdoauMICs@jB`BXjCATxC	2	49
438	|uwhA~wauMk@mIHc@t@uBHB	3	49
439	zvwhAzhauMxBbAb@r@Hv@jBO@H	4	49
440	p_xhAdnauMtA`S	5	49
441	fbxhAfbbuMFTs@yLwM~@aBMeVmI~B}GnBp@{@dC	6	49
442	n}vhA`iauMz@eCoBq@tCmIeN_FiIsDMNAJdCnApMbFGPhDlA	7	49
443	h`vhAphbuMjCeB`@z@T|@LtAElAqDe@CiAk@qAw@o@oAUiAHa@Lq@f@_@n@Qp@Ct@Fh@	0	50
444	~tuhAbnbuM@DgD~@SoB@cAL_A}Aa@	1	50
445	vluhArgbuMpBuMRe@h@SzBvH	2	50
446	bvuhAz`buMBJTGkEgOKw@@y@]I	3	50
447	houhAzlauMF@@bBrA`FfBe@~BDClA	4	50
448	jyuhApxauMHsEd@}AhJzD_@|@AV	5	50
449	bevhApwauM@Wh@mAuCmAl@_B	6	50
450	fcvhA|nauMm@~AuNaGSOyCcAyAUaAC}EZ~AxJX~Cd@CMaB~BU	7	50
451	`{whAnrbuMvBs@Li@[kEQY[Ss@AUwCpFe@@N	0	51
452	fbxhAfbbuMZhDiDX[Ss@AYsDwE\\AG	1	51
453	tswhAvbbuMKmBsGd@	2	51
454	tjwhAn`buMtAKCcBp@qDtAJhCKBP	3	51
455	|uwhA~wauMk@mIHc@t@uBHB	4	51
456	zvwhAzhauMxBbAb@r@Hv@jBO@H	5	51
457	p_xhAdnauMZ`FiMz@aBMwA_@bBsEHB	6	51
458	vowhAdoauMiC_AyA`E	7	51
459	rhwhAfsauMELmE_BlEkMbBj@	8	51
460	vlvhAfwbuM~A^r@h@n@fI	0	52
461	zrvhAxccuMN|BgJnCq@cC	1	52
462	pfvhAbhcuMuGcU~@s@b@mAD_AQeAQ_@FE	2	52
463	h`vhAphbuMjCeB`@z@T|@LnBMzAo@lBaAlAsAx@	3	52
464	f`vhAfwbuMyA\\wAH}AOcBk@aAzA_Cj@	4	52
465	pnuhAzzbuM]TGXt@~CdGgBBJ	5	52
466	jwuhAn~buMrBjHmA^l@tB	6	52
467	~yuhAplcuM@DcCt@c@gAUWuGkVaAeEj@QLOp@eD	7	52
468	vluhArgbuM|A`@r@gBnCjB]hACt@Fh@	8	52
469	~tuhAbnbuM@DgD~@QqABwBReAXs@lA_Bt@e@~@_@aCeISHzBvH	9	52
470	lxvhAptauMEVsBc@|AgFhCsHnBp@{@dC	0	53
471	n}vhA`iauMz@eCoBq@zC{I[KmAbDeGwBg@zA	1	53
472	~svhAh|`uMWx@Eb@qFqBW]KcAkAJ	2	53
473	~gvhA~x`uMUNs@~AsAi@o@|A	3	53
474	pavhAb~`uMn@}ArAh@oA|CdCdAJWRM`@??H	4	53
475	livhAvbauMEn@|AHUrE	5	53
476	nkvhAdkauMTsE}AIe@dI_@nAyB_A	6	53
477	fcvhA|nauMi@lAEb@lCjA_@|@AV	7	53
478	bevhApwauM@Wh@mAuCmABQ~BcGl@sDRa@l@CPuAXML?nBj@dDwJlIxC	8	53
479	lowhAbnbuMPAUuCwM~@NlB	0	54
480	`awhAxnbuMOmByIp@	1	54
481	vuvhA|lbuMM@w@gHhF_@?I	2	54
482	zzvhAlbbuMIuBF{BnBNZyB	3	54
483	d_whApwauM^uAjBn@i@tBMhAAxA	4	54
484	vawhAd_buMHpAoM~@KoAB}Ea@o@KrDNtD_BR	5	54
485	jovhAvdbuM~ASPtAl@n@lGe@PtCcBLrB~P{Bt@	6	54
486	~yvhA|_cuM~RcGPfD_FrAAK	7	54
487	jyuhApxauMBmAyBEyAZiAaEKw@@y@]I	0	55
488	houhAzlauM{EgAi@?sAwHPc@d@E	1	55
489	ffuhAp_auMBaBkAFwAiI	2	55
490	fauhAlr`uMc@{B@c@LMrCMdFn@Pq@V]n@Yp@M	3	55
491	xpuhAhj`uMbCO^@~Ez@tAl@qAdDOC	4	55
492	p|uhAfr`uMuBq@_Fo@_@rE	5	55
493	zpuhAxu`uMOnBq@jCvA`@m@vB@P	6	55
494	dpuhA`cauMJZ~Al@kAtC~CnAGWRo@RwCDYLD	7	55
495	xwuhA|dauMMEDKtCiHyAo@}FxNyCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	8	55
496	lxvhAptauMs@nFuBCDs@_@o@sBMs@MqEqBi@lAAV	0	56
497	bevhApwauM@Wh@mAuCmAl@_B	1	56
498	fcvhA|nauMm@~AmEiBOJe@|AIrE	2	56
499	jyuhApxauMBmA_CEgBd@zBvH	3	56
500	bvuhAz`buMfAvDe@Vk@l@Wn@InARjAXh@b@`@~@^lABbAUp@c@^m@TiACiA]aAFE	4	56
501	h`vhAphbuMjCeBl@zAfHoB	5	56
502	jovhAvdbuMWmDLgE|@wF\\uFeBKNgCaBMUrE	6	56
503	houhAzlauM{EgAi@?sAwHPc@d@E	0	57
504	ffuhAp_auMBaBkAFwAiI	1	57
505	fauhAlr`uMc@{B@c@LMrCMdFn@Pq@V]n@Yp@M	2	57
506	xpuhAhj`uMbCO^@~Ez@tAl@qAdDOC	3	57
507	p|uhAfr`uMuBq@_Fo@_@rE	4	57
508	zpuhAxu`uMOnBq@jCvA`@m@vB@P	5	57
509	dpuhA`cauMJZ~Al@kAtC~CnAGWRo@RwCDYLD	6	57
510	xwuhA|dauMMEDKtCiHnDvAEH	7	57
511	pavhAb~`uMn@}ArAh@l@uAZY	8	57
512	~gvhA~x`uMjAKFx@Zf@pFpBDc@Vy@	9	57
513	~svhAh|`uMWx@Eb@aBm@g@zAoBk@]DORKrA	10	57
514	livhAvbauM?Ia@?WVu@`EcCtGuNaGSOyCcAyAUaAC}EZ~AxJX~Cd@CMaB~BU	11	57
515	d_whApwauMQbAOrBH|CfKw@	0	58
516	tjwhAn`buMrGe@JlB	1	58
517	tswhAvbbuM@F{DZBZdS_B@N	2	58
518	fbxhAfbbuMFTBUEy@sAsQI@@H	3	58
519	p_xhAdnauMZ`FuIl@Dh@	4	58
520	|uwhA~wauMk@mIHc@t@uBHB	5	58
521	zvwhAzhauMIC}@nCR|DkC@aBYr@kBHB	6	58
522	vowhAdoauMiC_AyA`E	7	58
523	rhwhAfsauMELmE_BlEkMbBj@	8	58
524	pkwhAtcauMuHkCkCvH	9	58
525	n}vhA`iauMz@eCoBq@tCmIeN_FiIsDMNAJdCnApMbFGPhDlA	10	58
526	pfvhAbhcuMEKwDhAm@uBsEnAl@tB	0	59
527	~yuhAplcuM@DcCt@c@gAUW{BqI~EwABJ	1	59
528	jwuhAn~buM~@bDbCs@wBqHwAUkAc@aAzA_Cj@	2	59
529	pnuhAzzbuMMDwCeLj@QLOp@eD	3	59
530	vluhArgbuM|A`@r@gBnCjB]hACt@Fh@	4	59
531	~tuhAbnbuMd@jAb@`@h@Vl@Jt@?bAUv@k@f@gApDd@]jAc@z@aAbAaAh@	5	59
532	`{whAnrbuMj@QV`DsM`E_FrAAK	0	60
533	ngwhAh_cuMSwC{KjD	1	60
534	~yvhA|_cuMUH_CgRLA	2	60
535	vuvhA|lbuMxIq@NlB	3	60
536	`awhAxnbuMOmBxGg@TvCjDW	4	60
537	lowhAbnbuMPAm@iIgRrAM}B	5	60
538	zzvhAlbbuMIuBF{BnBNEzBH~ArBOIqA	6	60
539	vawhAd_buMHpAeF^LrBcF^Yz@zCdVqD^DjA	7	60
540	zrvhAxccuM?HiDRa@wGx@k@l@kA_B_@	8	60
541	bvuhAz`buMBJTGkEgOKw@@y@]I	0	61
542	houhAzlauMF@@bBrA`FfBe@~BDClA	1	61
543	jyuhApxauMHsEd@}AhJzD_@|@AV	2	61
544	bevhApwauM@Wh@mAuCmAl@_B	3	61
545	fcvhA|nauMm@~A{JcERo@TeDBKLD	4	61
546	xwuhA|dauMMEDKtCiHnDvAEH	5	61
547	pavhAb~`uMn@}AmDwAhAuCkBo@	6	61
548	p|uhAfr`uMuBq@_Fo@_@rE	7	61
549	zpuhAxu`uMOnBq@jCvA`@m@vB@P	8	61
550	dpuhA`cauMJZ{ACs@MTgAKWkASwBE	9	61
551	ffuhAp_auMBaBkAFwAiI	10	61
552	fauhAlr`uMc@{B@c@LMrCMdFn@Pq@V]n@Yp@M	11	61
553	xpuhAhj`uMbCO^@~Ez@tAl@cMd[yCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	12	61
554	`{whAnrbuMvBs@Li@[kEQY[Ss@AUwCpFe@@N	0	62
555	fbxhAfbbuMZhDiDX[Ss@AYsDwE\\AG	1	62
556	tswhAvbbuMKmBsGd@	2	62
557	tjwhAn`buMtAKCcBp@qDtAJhCKBP	3	62
558	|uwhA~wauMk@mIHc@t@uBHB	4	62
559	zvwhAzhauMxBbAb@r@Hv@jBO@H	5	62
560	p_xhAdnauMZ`FiMz@aBMwA_@bBsEHB	6	62
561	vowhAdoauMiC_AyA`E	7	62
562	rhwhAfsauMoAxDY~A?tBXbEnAKl@jHjDW	8	62
563	vlvhAfwbuM~A^r@h@n@fI	0	63
564	zrvhAxccuMN|BgJnCq@cC	1	63
565	pfvhAbhcuMuGcU~@s@b@mAD_AQeAQ_@FE	2	63
566	h`vhAphbuMjCeB`@z@T|@LnBMzAo@lBaAlAsAx@	3	63
567	f`vhAfwbuMyA\\wAH}AOcBk@aAzA_Cj@	4	63
568	pnuhAzzbuM]TGXt@~CdGgBBJ	5	63
569	jwuhAn~buMrBjHmA^l@tB	6	63
570	~yuhAplcuM@DcCt@c@gAUWuGkVaAeEj@QLOp@eD	7	63
571	vluhArgbuM|A`@r@gBnCjB]hACt@Fh@	8	63
572	pkwhAtcauMuHkCkCvH	0	64
573	n}vhA`iauMz@eCoBq@zC{I[KmAbDeGwBg@zA	1	64
574	~svhAh|`uMWx@Eb@qFqBW]KcAkAJ	2	64
575	~gvhA~x`uMUNQZqB`FdCdAJWRM`@??H	3	64
576	livhAvbauMEn@|AHUrE	4	64
577	nkvhAdkauMTsE`BLJuB[SdDwJlIxC	5	64
578	`awhAxnbuMOmByIp@	0	65
579	vuvhA|lbuMM@w@gHhF_@?I	1	65
580	zzvhAlbbuMIuBF{BnBNZyB	2	65
581	d_whApwauM^uAsEcBc@xA	3	65
582	lxvhAptauMb@yA~HrCi@tBMhAAxA	4	65
583	vawhAd_buMHpAoM~@KoAB}Ea@o@KrDNtD_BR	5	65
584	jovhAvdbuM~ASPtAl@n@lGe@PtCcBLrB~P{Bt@	6	65
585	~yvhA|_cuM~RcGPfD_FrAAK	7	65
586	zzvhAlbbuMIuBF{BnBNEzBH~AqBNLrBcF^Yz@~@nHXs@[cCLA	0	66
587	vuvhA|lbuMM@w@gHKoAB}EYi@mDa@qEqBi@lAAV	1	66
588	bevhApwauM@Wh@mAuCmAl@_B	2	66
589	fcvhA|nauMm@~AmEiBOJe@|AIrE	3	66
590	jyuhApxauMBmA_CEgBd@zBvH	4	66
591	bvuhAz`buMfAvD}@l@_@n@UjAFdA	5	66
592	~tuhAbnbuM@DgD~@SoB@cAL_A}Aa@	6	66
593	vluhArgbuM|A`@r@gBnCjBWn@Ir@HjAHZXh@b@`@~@^p@Dv@Ef@Qp@c@^m@Rs@B{@QeAQ_@FE	7	66
594	h`vhAphbuMjCeBl@zAfHoB	8	66
595	houhAzlauM{EgAi@?sAwHPc@d@E	0	67
596	ffuhAp_auMBaBkAFwAiI	1	67
597	fauhAlr`uMc@{B@c@LMrCMdFn@Pq@V]n@Yp@M	2	67
598	xpuhAhj`uMbCO^@~Ez@tAl@qAdDOC	3	67
599	p|uhAfr`uMuBq@_Fo@_@rE	4	67
600	zpuhAxu`uMOnBq@jCvA`@m@vB@P	5	67
601	dpuhA`cauMJZ~Al@kAtC~CnAGWRo@RwCDYLD	6	67
602	xwuhA|dauMMEDKtCiHnDvAEH	7	67
603	pavhAb~`uMDIiGgC}FxNyCcAyAU}B?aDV~AxJX~Cd@CMaB~BU	8	67
604	`{whAnrbuMvBs@Li@[kEQY[Ss@AUwCpFe@@N	0	68
605	fbxhAfbbuMZhDiDX[Ss@AYsDwE\\AG	1	68
606	tswhAvbbuMKmBsGd@	2	68
607	tjwhAn`buMsGf@IqA	3	68
608	vawhAd_buMHpAbCSGuBLwAvAuE~AmErBr@	4	68
609	vowhAdoauMiC_AyA`E	5	68
610	rhwhAfsauMQf@hDnAl@LtAJhCKBP	6	68
611	|uwhA~wauMk@mIHc@t@uBHB	7	68
612	zvwhAzhauMxBbAb@r@Hv@jBO@H	8	68
613	p_xhAdnauMpBjXiDX[S_AAkYtBNlB	9	68
614	`awhAxnbuMOmBxGg@TvCjDW	10	68
615	d_whApwauM^uAsEcBc@xA	0	69
616	lxvhAptauMEVsBc@|AgFhCsHnBp@{@dC	1	69
617	n}vhA`iauMjCwHtHjC	2	69
618	pkwhAtcauMcBk@mEjMaOaFb@kIDc@Vy@	3	69
619	~svhAh|`uMWx@Eb@qFqBW]KcAkAJ	4	69
620	~gvhA~x`uMUNQZqB`FdCdAJWRM`@??H	5	69
621	livhAvbauMEn@|AHUrE	6	69
622	nkvhAdkauMTsE`BLJuB[SdDwJlIxC	7	69
623	~yvhA|_cuMUHc@iDSGMNb@fDqD^DjA	0	70
624	zrvhAxccuMN|BgJnCq@cC	1	70
625	pfvhAbhcuMkBmGhHuBb@Wf@i@Zu@_B_@	2	70
626	vlvhAfwbuM~A^n@uFqIgAYzAo@rAaAbAaAh@	3	70
627	f`vhAfwbuMyA\\wAH}AOcBk@aAzA_Cj@	4	70
628	pnuhAzzbuM]TGXt@~CdGgBBJ	5	70
629	jwuhAn~buMrBjHmA^l@tB	6	70
630	~yuhAplcuMaCz@y@_By@}CtYwIh@c@l@kAf@kEpCVRo@[cC`S{Az@tMvA_@PfD_FrAAK	7	70
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.reports (id, content, "timestamp", container_id, user_id) FROM stdin;
\.


--
-- Data for Name: report_images; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.report_images (id, path, report_id) FROM stdin;
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
1	t	2026-05-21 00:45:18.496848	0103000020E61000000100000005000000010000D82C4253C05A7ED13D692E28C001000010424053C05A7ED13D692E28C001000010424053C05FD78C43662328C0010000D82C4253C05FD78C43662328C0010000D82C4253C05A7ED13D692E28C0	1
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
-- Name: actual_container_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.actual_container_id_seq', 1, true);


--
-- Name: container_edge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.container_edge_id_seq', 4900, true);


--
-- Name: container_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.container_images_id_seq', 50, true);


--
-- Name: containers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.containers_id_seq', 50, true);


--
-- Name: generated_containers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.generated_containers_id_seq', 700, true);


--
-- Name: generated_routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.generated_routes_id_seq', 70, true);


--
-- Name: metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.metrics_id_seq', 1, false);


--
-- Name: points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.points_id_seq', 1, false);


--
-- Name: polylines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.polylines_id_seq', 630, true);


--
-- Name: report_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.report_images_id_seq', 1, false);


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.reports_id_seq', 1, false);


--
-- Name: routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.routes_id_seq', 40, true);


--
-- Name: user_viewports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.user_viewports_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: topology_id_seq; Type: SEQUENCE SET; Schema: topology; Owner: dbuser
--

SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

