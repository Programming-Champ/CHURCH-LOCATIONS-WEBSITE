--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7 (Ubuntu 15.7-0ubuntu0.23.10.1)
-- Dumped by pg_dump version 15.7 (Ubuntu 15.7-0ubuntu0.23.10.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: naikram
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO naikram;

--
-- Name: church; Type: TABLE; Schema: public; Owner: naikram
--

CREATE TABLE public.church (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    lat double precision NOT NULL,
    long double precision NOT NULL,
    county character varying(100),
    ward character varying(100),
    address character varying(200),
    phone character varying(100),
    members integer
);


ALTER TABLE public.church OWNER TO naikram;

--
-- Name: church_id_seq; Type: SEQUENCE; Schema: public; Owner: naikram
--

CREATE SEQUENCE public.church_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.church_id_seq OWNER TO naikram;

--
-- Name: church_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: naikram
--

ALTER SEQUENCE public.church_id_seq OWNED BY public.church.id;


--
-- Name: church_update; Type: TABLE; Schema: public; Owner: naikram
--

CREATE TABLE public.church_update (
    id integer NOT NULL,
    church_id integer,
    name character varying(255) NOT NULL,
    lat double precision NOT NULL,
    long double precision NOT NULL,
    county character varying(100),
    ward character varying(100),
    address character varying(200),
    phone character varying(100),
    members integer,
    approval_status integer
);


ALTER TABLE public.church_update OWNER TO naikram;

--
-- Name: church_update_id_seq; Type: SEQUENCE; Schema: public; Owner: naikram
--

CREATE SEQUENCE public.church_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.church_update_id_seq OWNER TO naikram;

--
-- Name: church_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: naikram
--

ALTER SEQUENCE public.church_update_id_seq OWNED BY public.church_update.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: naikram
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    username character varying(100) NOT NULL,
    password_hash character varying(60) NOT NULL
);


ALTER TABLE public."user" OWNER TO naikram;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: naikram
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO naikram;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: naikram
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: church id; Type: DEFAULT; Schema: public; Owner: naikram
--

ALTER TABLE ONLY public.church ALTER COLUMN id SET DEFAULT nextval('public.church_id_seq'::regclass);


--
-- Name: church_update id; Type: DEFAULT; Schema: public; Owner: naikram
--

ALTER TABLE ONLY public.church_update ALTER COLUMN id SET DEFAULT nextval('public.church_update_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: naikram
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: naikram
--

COPY public.alembic_version (version_num) FROM stdin;
c47bcf67b422
\.


--
-- Data for Name: church; Type: TABLE DATA; Schema: public; Owner: naikram
--

COPY public.church (id, name, lat, long, county, ward, address, phone, members) FROM stdin;
1	Seventh-Day Adventist (SDA) Church, Mogotio Central	-0.0170813	35.9579779	Baringo	Lembus	\N	\N	\N
2	SDA Church Kabarnet	0.487859	35.7397958	Baringo	Kapropita	\N	\N	\N
3	SDA KABARNET ACADEMY	0.4900198	35.7400507	Baringo	Kapropita	\N	\N	\N
4	AIC KAPROPITA	0.485592	35.7542592	Baringo	Kapropita	\N	\N	\N
5	KAPROPITA GIRLS HIGH SCHOOL	0.4836538	35.7551622	Baringo	Kapropita	\N	\N	\N
6	Kapropita	0.4496052	35.7734398	Baringo	Kapropita	\N	\N	\N
7	Sacho high school	0.388822	35.786026	Baringo	Sacho	\N	\N	\N
8	Sacho School Dispensary	0.388822	35.786026	Baringo	Sacho	\N	\N	\N
9	Tenges Seventh-day Adventist Church	0.3143178	35.8026056	Baringo	Tenges	\N	\N	\N
10	Bartabwa	0.833333	35.8	Baringo	Bartabwa	\N	\N	\N
11	Barwesa	0.716667	35.733333	Baringo	Barwessa	\N	\N	\N
12	Kabartonjo AIC Church	0.6324707	35.7974662	Baringo	Kabartonjo	\N	\N	\N
13	Sda magigat	0.4725126	35.9932654	Baringo	Marigat	\N	\N	\N
14	Ainabmoek sda church	0.0182843	35.5997728	Baringo	Mumberes/Maji Mazuri	\N	\N	\N
15	Sda Eldama Ravine	0.0534513	35.7313097	Baringo	Ravine	\N	\N	\N
16	Equator sda church	0.0538025	35.7311498	Baringo	Ravine	\N	\N	\N
17	Hope Alive Sda church	0.0473418	35.7220232	Baringo	Ravine	\N	\N	\N
18	Kisanana	0.1056538	36.11108	Baringo	Kisanana	\N	\N	\N
20	Ndarawetta Girls Secondary School	-0.6866066	35.3789642	Bomet	Ndaraweta	\N	\N	\N
21	Silibwet central SDA church	-0.7343153	35.3479893	Bomet	Silibwet Township	\N	\N	\N
22	Silibwet Township Academy	-0.7316595	35.3485944	Bomet	Silibwet Township	\N	\N	\N
23	Cheptuiyet SDA Church	-0.7143485	35.3507955	Bomet	Silibwet Township	\N	\N	\N
24	Singorwet Dispensary	-0.7308157	35.3049852	Bomet	Singorwet	\N	\N	\N
25	Singorwet	-0.7305961	35.3058103	Bomet	Singorwet	\N	\N	\N
26	Kuresiet Seventh Day Adventist Church	-0.8156705	35.4732804	Bomet	Chemaner	\N	\N	\N
27	Kimogoro SDA Church	-0.7937309	35.4860585	Bomet	Chemaner	\N	\N	\N
28	Toronik SDA Church	-0.92419	35.3571713	Bomet	Kipreres	\N	\N	\N
29	Mulot SDA Church	-0.9274649	35.4146606	Bomet	Kipreres	\N	\N	\N
30	SDA CHURCH- TORONIK	-0.9523749	35.3590505	Bomet	Kipreres	\N	\N	\N
31	Longisa SDA Church	-0.8577466	35.4013657	Bomet	Longisa	\N	\N	\N
32	Bomet Central SDA Church	-0.7907071	35.3399308	Bomet	Merigi	\N	\N	\N
33	SDA CHURCH KIPROROGET	-0.9344367	35.1901767	Bomet	Chebunyo	\N	\N	\N
34	SEVENTHDAY ADVENTIST CHURCH (SDA) KATARET	-0.9310582	35.1664875	Bomet	Chebunyo	\N	\N	\N
35	Chebunyo	-0.9680595	35.1914893	Bomet	Chebunyo	\N	\N	\N
36	Kapkesosoi Seventh-day Adventist Church	-0.8453662	35.3216292	Bomet	Nyangores	\N	\N	\N
37	Kapkoin Seventh-day Adventist Church	-0.9075441	35.3074615	Bomet	Sigor	\N	\N	\N
38	Cheptolelyoi Sabbath School (SDA CHURCH)	-0.9368358	35.2646934	Bomet	Sigor	\N	\N	\N
39	SEVENTH DAY ADVENTIST CHURCH, SIONGIROI	-0.9010619	35.2118261	Bomet	Siongiroi	\N	\N	\N
40	TABOINO SDA CHURCH	-0.6050239	35.3547476	Bomet	Embomos	\N	\N	\N
41	Kimarwandi SDA Church	-0.5825868	35.3839734	Bomet	Embomos	\N	\N	\N
42	SDA Church Kapken	-0.6262584	35.3244841	Bomet	Embomos	\N	\N	\N
43	SDA CHEMALAL	-0.5131323	35.2294177	Bomet	Kimulot	\N	\N	\N
44	Chebitet SDA church	-0.6177573	35.260855	Bomet	Mogogosiek	\N	\N	\N
45	Seventh Day Adventist Church Koiwa	-0.61291	35.3229986	Bomet	Mogogosiek	\N	\N	\N
46	Malindi SDA chebongi	-0.6765779	35.1076225	Bomet	Chemagel	\N	\N	\N
47	SDA. Church Sotik Central	-0.6857554	35.1145942	Bomet	Chemagel	\N	\N	\N
48	Kimawit Seventh Day Adventist church	-0.6906925	35.1110853	Bomet	Chemagel	\N	\N	\N
49	Kaplong SDA Church	-0.6823134	35.143373	Bomet	Chemagel	\N	\N	\N
50	Tiritamoita SDA Church	-0.6523465	35.1094451	Bomet	Chemagel	\N	\N	\N
51	Kapkoitim SDA Church	-0.6695943	35.2178479	Bomet	Kapletundo	\N	\N	\N
52	CHESILYOT SDA CHURCH	-0.6634077	35.2020107	Bomet	Kapletundo	\N	\N	\N
53	SDA chebirbelek cental church	-0.6494375	35.2260625	Bomet	Kapletundo	\N	\N	\N
54	Seventh Day Adventist Church, Koitab Sawe	-0.6807265	35.2493124	Bomet	Kapletundo	\N	\N	\N
55	Koluu sda Church	-0.6684632	35.2317242	Bomet	Kapletundo	\N	\N	\N
56	Seventh day adventist church chebirbelek central	-0.6550197	35.2432971	Bomet	Kapletundo	\N	\N	\N
57	Seventh Day Adventist Church Chebaibai	-0.712184	35.2260748	Bomet	Kipsonoi	\N	\N	\N
58	Sumoni SDA Church	-0.7750612	35.1963283	Bomet	Kipsonoi	\N	\N	\N
59	Emityot Seventh Day Adventist	-0.7296965	35.1517527	Bomet	Kipsonoi	\N	\N	\N
60	Mabusi SDA Church Bngoma	0.5206986	34.4246121	Bungoma	Bumula	\N	\N	\N
61	Kabula pastoral centre	0.4874729	34.5321932	Bungoma	Kabula	\N	\N	\N
62	Kabula	0.4720249	34.524971	Bungoma	Kabula	\N	\N	\N
63	ACK Khasoko Church	0.4824648	34.4050903	Bungoma	Khasoko	\N	\N	\N
64	Siboti SDA Church	0.6193118	34.4516307	Bungoma	Siboti	\N	\N	\N
65	BWAKE RC PRI SCH	0.6755034	34.6331603	Bungoma	Bwake/Luuya	\N	\N	\N
66	Luuya Girls Secondary School	0.6494555	34.6395403	Bungoma	Bwake/Luuya	\N	\N	\N
67	Sichei SDA Church	0.7359248	34.5777449	Bungoma	Kabuchai/Chwele	\N	\N	\N
68	Chwele Sub County Hospital	0.7359257	34.5777566	Bungoma	Kabuchai/Chwele	\N	\N	\N
69	Nalondo SDA Church	0.6596081	34.5903583	Bungoma	West Nalondo	\N	\N	\N
70	SDA KISULUNI	0.5833146	34.5999735	Bungoma	Bukembe West	\N	\N	\N
71	Kanduyi SDA Church	0.5941146	34.5550213	Bungoma	Khalaba	\N	\N	\N
72	Bungoma Central SDA Church	0.5841917	34.5666061	Bungoma	Khalaba	\N	\N	\N
73	Khalaba Medical Clinic	0.556298	34.560038	Bungoma	Khalaba	\N	\N	\N
74	TUUTI/MARAKARU FRIENDS CHURCH	0.6020312	34.5410907	Bungoma	Marakaru/Tuuti	\N	\N	\N
75	Kibabii Seventh-Day Adventist Church	0.6235004	34.5213184	Bungoma	Marakaru/Tuuti	\N	\N	\N
76	Milimani SDA church Bungoma	0.5684319	34.5548952	Bungoma	Musikoma	\N	\N	\N
77	Bungoma Town Sda Church	0.5597411	34.5547404	Bungoma	Musikoma	\N	\N	\N
78	Seventh-Day Adventist Church Kimilili Central	0.787287	34.708688	Bungoma	Kimilili	\N	\N	\N
79	Nasusi SDA Church	0.8187579	34.7464552	Bungoma	Maeni	\N	\N	\N
80	Chekalini SDA Church	0.6208629	34.8991647	Bungoma	Chekalini	\N	\N	\N
81	Seventh Day Adventist Main Lumakanda	0.6278134	34.9649153	Bungoma	Lumakanda	\N	\N	\N
82	Mautuma P.A.G	0.7048841	35.0015019	Bungoma	Mautuma	\N	\N	\N
83	Cheptais SDA Church	0.8096515	34.4663405	Bungoma	Cheptais	\N	\N	\N
84	CHEMONDI SDA ACADEMY	0.8199876	34.5000846	Bungoma	Chesikaki	\N	\N	\N
85	TORORO SDA CHURCH	0.8018789	34.4831756	Bungoma	Chesikaki	\N	\N	\N
86	Marigo SDA Church	0.8187023	34.4782856	Bungoma	Chesikaki	\N	\N	\N
87	CHEPTAIS SDA ACADEMY PRI SCH	0.81	34.47	Bungoma	Chesikaki	\N	\N	\N
88	Marigo SDA Church	0.8087718	34.4695401	Bungoma	Chesikaki	\N	\N	\N
89	SDA church kapsokwony	0.8427791	34.7130803	Bungoma	Elgon	\N	\N	\N
90	MLIMANI SDA	0.84	34.73	Bungoma	Elgon	\N	\N	\N
91	SDA Kaboywo	0.9222161	34.7509418	Bungoma	Kaptama	\N	\N	\N
92	SDA CHURCH CHEMOGE CENTRAL	0.8637284	34.7425675	Bungoma	Kaptama	\N	\N	\N
93	Kaprot SDA Church	0.7929388	34.4447195	Bungoma	Lwandanyi	\N	\N	\N
94	KABENDO SDA PRI	0.81	34.44	Bungoma	Lwandanyi	\N	\N	\N
95	Cherendyo SDA Church	0.7906957	34.4664483	Bungoma	Lwandanyi	\N	\N	\N
96	Lwandanyi secondary school	0.7878004	34.415683	Bungoma	Lwandanyi	\N	\N	\N
97	CHERINDIO SDA PRI SCH	0.79	34.46	Bungoma	Lwandanyi	\N	\N	\N
98	Namwela Secondary School	0.7621999	34.5487213	Bungoma	Namwela	\N	\N	\N
99	Mbakalo Friends Secondary School	0.723993	34.8774833	Bungoma	Mbakalo	\N	\N	\N
100	Mukuyuni Seventh Day Adventist Church	0.7697114	34.8283427	Bungoma	Milima	\N	\N	\N
101	Seventh Day Adventist Church	0.756243	34.8860657	Bungoma	Milima	\N	\N	\N
102	KWENA SDA SPECIAL UNIT SCH	0.7400916	34.8200478	Bungoma	Milima	\N	\N	\N
103	SDA Church Ndalu	0.8392919	34.9948257	Bungoma	Ndalu/ Tabani	\N	\N	\N
104	Seventh Day Adventist Church (SDA)	0.827932	35.0057695	Bungoma	Ndalu/ Tabani	\N	\N	\N
105	Ndalu	0.8403103	34.9451498	Bungoma	Ndalu/ Tabani	\N	\N	\N
106	SDA Church Matisi	0.6217752	34.6958312	Bungoma	Bokoli	\N	\N	\N
107	Bokoli RC Primary School	0.6928435	34.6789558	Bungoma	Bokoli	\N	\N	\N
108	SEVENTH DAY ADVENTIST CHURCH -MALAHA	0.6269924	34.7436609	Bungoma	Matulo	\N	\N	\N
109	Mang'ana SDA Church	0.5218041	34.6889045	Bungoma	Sitikho	\N	\N	\N
110	Yalusi SDA Church	0.5358178	34.7001085	Bungoma	Sitikho	\N	\N	\N
111	Sitikho Friends Secondary School	0.4748156	34.666924	Bungoma	Sitikho	\N	\N	\N
112	Matsakha Seventh-Day Adventist Church	0.5992059	34.779603	Bungoma	Maraka	\N	\N	\N
113	Makuma SDA Primary School	0.5753416	34.7560202	Bungoma	Maraka	\N	\N	\N
114	Webuye Sunrise SDA Church	0.5993302	34.7780178	Bungoma	Maraka	\N	\N	\N
115	SEVENTH DAY ADVENTIST CHURCH BUNANG'ENI	0.5992059	34.779603	Bungoma	Maraka	\N	\N	\N
116	Seventh Day Adventists Church - North-West Kenya	0.6077347	34.7658857	Bungoma	Maraka	\N	\N	\N
117	Western Kenya Conference of Seventh-day Adventists Headquarters	0.6382056	34.7595167	Bungoma	Mihuu	\N	\N	\N
118	SDA CHURCH PORTVICTORIA	0.0960654	33.9781238	Busia	Bunyala West	\N	\N	\N
119	Marachi Central	0.3565096	34.2643871	Busia	Marachi Central	\N	\N	\N
120	St. Lukes (ACK) Busiada Dispensary	0.3155763	34.2655133	Busia	Marachi Central	\N	\N	\N
121	SDA Newlife Muruka	0.3306368	34.3528542	Busia	Marachi East	\N	\N	\N
122	BUKHALALIRE SDA CHURCH	0.3041583	34.2060283	Busia	Marachi West	\N	\N	\N
123	Ageng'a Dispensary (Samia)	0.2527239	34.0710057	Busia	Ageng'A Nanguba	\N	\N	\N
124	Ogalo SDA church	0.3484013	34.1412646	Busia	Namboboto Nambuku	\N	\N	\N
125	St cecilia nangina girls high school	0.2784879	34.1010719	Busia	Nangina	\N	\N	\N
126	Nangina Girls High School	0.2754779	34.1011387	Busia	Nangina	\N	\N	\N
127	Nangina Dispensary	0.279642	34.1177232	Busia	Nangina	\N	\N	\N
128	Nangina Special School for the Intellectually Disabled	0.2739257	34.0926457	Busia	Nangina	\N	\N	\N
129	Busia Prison SDA	0.4450578	34.1464633	Busia	Bukhayo West	\N	\N	\N
130	Seventh day Adventist church Sunshine Budokomi	0.4015935	34.1308667	Busia	Bukhayo West	\N	\N	\N
131	Burumba SDA Church	0.450964	34.127252	Busia	Bukhayo West	\N	\N	\N
132	Seventh Day Adventist Church	0.4622459	34.1085348	Busia	Burumba	\N	\N	\N
133	New Life Seventh-Day Adventist Church, Busia	0.456178	34.1078872	Busia	Burumba	\N	\N	\N
134	Matayos Busia	0.365132	34.1655332	Busia	Matayos South	\N	\N	\N
135	Korsiondet SDA church	0.7635364	34.3935597	Busia	Ang'Urai East	\N	\N	\N
136	KOCHOLYA SEVENTH -DAY ADVENTIST CHURCH	0.6199593	34.3504663	Busia	Malaba South	\N	\N	\N
137	Seventh Day Adventist church Alupe	0.5020652	34.1371594	Busia	Ang'Orom	\N	\N	\N
138	Asiriam Seventh Day Adventist Church	0.4980467	34.1670633	Busia	Chakol South	\N	\N	\N
139	Tambach SDA church	0.5964207	35.5210299	Elgeyo-Marakwet	Tambach	\N	\N	\N
140	Sitotwo SDA	0.3674603	35.5462342	Elgeyo-Marakwet	Chepkorio	\N	\N	\N
141	SDA Church	0.1757971	35.6548995	Elgeyo-Marakwet	Metkei	\N	\N	\N
142	Kapchebutuk SDA Church	0.2085066	35.549698	Elgeyo-Marakwet	Metkei	\N	\N	\N
143	SDA Church	0.961371	35.3440964	Elgeyo-Marakwet	Cherang'Any/Chebororwa	\N	\N	\N
144	Cherangany chebororwo	0.948656	35.4233987	Elgeyo-Marakwet	Cherang'Any/Chebororwa	\N	\N	\N
145	KAPSOWAR SDA CHURCH	0.9752119	35.5626233	Elgeyo-Marakwet	Kapsowar	\N	\N	\N
146	Seventh Day Adventist Church Kapcherop	1.046031	35.3244829	Elgeyo-Marakwet	Sengwer	\N	\N	\N
147	Kavutiri Seventh Day Adventist	-0.4202424	37.5050121	Embu	Gaturi North	\N	\N	\N
148	KANYARIRI SDA CHURCH - KIANAMU ROAD EMBU	-0.5412901	37.4633122	Embu	Kirimari	\N	\N	\N
149	Good New SDA Church-Embu	-0.5363146	37.4564237	Embu	Kirimari	\N	\N	\N
150	Gatoori SDA Church	-0.4833595	37.4531325	Embu	Kirimari	\N	\N	\N
151	Kithimu Dispensary	-0.5090166	37.5174311	Embu	Kithimu	\N	\N	\N
152	Kithimu	-0.5085318	37.5194731	Embu	Kithimu	\N	\N	\N
153	SDA Church Majimbo	-0.5462539	37.4681526	Embu	Mbeti North	\N	\N	\N
154	SALVATION ARMY EMBU CORPS	-0.4298403	37.4785288	Embu	Ruguru/Ngandori	\N	\N	\N
155	Ishiara SDA Church	-0.455974	37.783624	Embu	Evurore	\N	\N	\N
156	Mugwanjogu SDA church	-0.5639659	37.7782029	Embu	Muminji	\N	\N	\N
157	Seventh-day Adventist Church Cianyi	-0.5908929	37.6133848	Embu	Nthawa	\N	\N	\N
158	Irabari SDA Church	-0.6988573	37.6844265	Embu	Mavuria	\N	\N	\N
159	Kabingori SDA Church	-0.7156314	37.7217847	Embu	Mavuria	\N	\N	\N
160	Ngarira SDA	-0.7244567	37.682775	Embu	Mavuria	\N	\N	\N
161	RIANGUU SDA CHURCH	-0.6694322	37.4927471	Embu	Mbeti South	\N	\N	\N
162	NEKF SDA Camporee Grounds	-0.6029867	37.5359661	Embu	Mbeti South	\N	\N	\N
163	Seventh Day Adventist church	-0.4139971	37.5671015	Embu	Central Ward	\N	\N	\N
164	KIANJOKOMA SEVENTH DAY ADVENTIST	-0.396876	37.5095346	Embu	Kagaari North	\N	\N	\N
165	Ugweri SDA church	-0.465012	37.5928657	Embu	Kagaari South	\N	\N	\N
166	SDA Kigumo Kathageri Sabbath School	-0.3871537	37.5980843	Embu	Kyeni North	\N	\N	\N
167	Kigumo Machagua SDA Church	-0.4124233	37.6243867	Embu	Kyeni South	\N	\N	\N
168	Seventh day adventist Church Daadab	0.1008226	40.3117994	Garissa	Dadaab	\N	\N	\N
170	Seventh Day Adventist Church Bonde Homabay	-0.5314094	34.4515998	Homa Bay	Homa Bay Arujo	\N	\N	\N
171	Homa Bay Central Seventh Day Adventist Church	-0.5353636	34.4602002	Homa Bay	Homa Bay Arujo	\N	\N	\N
172	Kakayo SDA Church	-0.5350072	34.4531058	Homa Bay	Homa Bay Arujo	\N	\N	\N
173	Arera SDA	-0.5350072	34.4531058	Homa Bay	Homa Bay Arujo	\N	\N	\N
174	Sophia SDA Church	-0.5401993	34.457366	Homa Bay	Homa Bay Arujo	\N	\N	\N
175	Varin SDA church	-0.527173	34.4523937	Homa Bay	Homa Bay Arujo	\N	\N	\N
176	Canaan Kabondo SDA	-0.5350073	34.4531059	Homa Bay	Homa Bay Arujo	\N	\N	\N
177	Monato SDA Church	-0.5249159	34.4733804	Homa Bay	Homa Bay Central	\N	\N	\N
178	Maranatha SDA Church	-0.5334123	34.4563453	Homa Bay	Homa Bay Central	\N	\N	\N
179	Lwala West SDA Church	-0.5383704	34.4753653	Homa Bay	Homa Bay Central	\N	\N	\N
180	Makongeni SDA Church	-0.523367	34.4636547	Homa Bay	Homa Bay Central	\N	\N	\N
181	Lake Victoria Field Headquarters Of Seventh-Day Adventist Church	-0.5596912	34.4429096	Homa Bay	Homa Bay West	\N	\N	\N
182	Nyagidha SDA Church	-0.5427379	34.424167	Homa Bay	Homa Bay West	\N	\N	\N
183	Got Kokello SDA Church	-0.5723392	34.4567678	Homa Bay	Homa Bay West	\N	\N	\N
184	Ongulu SDA Church	-0.5671	34.435209	Homa Bay	Homa Bay West	\N	\N	\N
185	Gweno Kipodi Sda	-0.4141909	34.8625936	Homa Bay	Kabondo West	\N	\N	\N
186	Kojwach SDA church	-0.4600177	34.853145	Homa Bay	Kojwach	\N	\N	\N
187	Kokwanyo SDA. Church	-0.4051933	34.7735319	Homa Bay	Kokwanyo/Kakelo	\N	\N	\N
188	SDA CHURCH OGILO KOKWANYO	-0.415081	34.7976652	Homa Bay	Kokwanyo/Kakelo	\N	\N	\N
189	Kibuon SDA church ,Kokwanyo	-0.4221937	34.7756779	Homa Bay	Kokwanyo/Kakelo	\N	\N	\N
190	DAGO SDA CHURCH	-0.4320715	34.8010905	Homa Bay	Kokwanyo/Kakelo	\N	\N	\N
191	Kakelo SDA Church	-0.4644406	34.8238475	Homa Bay	Kokwanyo/Kakelo	\N	\N	\N
192	OJWANDO SDA CHURCH	-0.4491053	34.8510494	Homa Bay	Kokwanyo/Kakelo	\N	\N	\N
193	Bao Central SDA Church	-0.3865481	34.7886381	Homa Bay	Kokwanyo/Kakelo	\N	\N	\N
194	ANDING'O SDA CHURCH	-0.4288139	34.8075957	Homa Bay	Kokwanyo/Kakelo	\N	\N	\N
195	Soko SDA	-0.3720144	34.6855921	Homa Bay	Kendu Bay Town	\N	\N	\N
196	SDA Church Nyahera Gendia	-0.390448	34.6573268	Homa Bay	North Karachuonyo	\N	\N	\N
197	Ngoya SDA Church	-0.3903785	34.6524179	Homa Bay	North Karachuonyo	\N	\N	\N
198	Kanyadhiang SDA Church	-0.3836457	34.6341192	Homa Bay	North Karachuonyo	\N	\N	\N
199	Okoba SDA Church	-0.4019988	34.6555848	Homa Bay	North Karachuonyo	\N	\N	\N
200	Gendia SDA. Church	-0.3791185	34.6526633	Homa Bay	North Karachuonyo	\N	\N	\N
201	Nyandiwa-Gendia SDA Church	-0.3773337	34.6442455	Homa Bay	North Karachuonyo	\N	\N	\N
202	Ndiru SDA Church	-0.3851772	34.6679194	Homa Bay	North Karachuonyo	\N	\N	\N
203	Jieri SDA Church	-0.3666363	34.6425944	Homa Bay	North Karachuonyo	\N	\N	\N
204	Ramba SDA Church	-0.417701	34.6677613	Homa Bay	North Karachuonyo	\N	\N	\N
205	Kendu Central SDA Church	-0.3627941	34.6500189	Homa Bay	North Karachuonyo	\N	\N	\N
206	Kanyango Seventh-day Adventist Church	-0.3633306	34.4659518	Homa Bay	West Karachuonyo	\N	\N	\N
207	nyamonge SDA Church	-0.403972	34.5122922	Homa Bay	West Karachuonyo	\N	\N	\N
208	Nyabondo Seventh-day Adventist Church	-0.4257785	34.5225157	Homa Bay	West Karachuonyo	\N	\N	\N
209	Milimani SDA Church	-0.387978	34.4740959	Homa Bay	West Karachuonyo	\N	\N	\N
210	Koguta Seventh-day Adventist Church	-0.4307473	34.4883006	Homa Bay	West Karachuonyo	\N	\N	\N
211	Owiro Seventh-day Adventist Church	-0.4400806	34.4851998	Homa Bay	West Karachuonyo	\N	\N	\N
212	Angong'a Seventh-day Adventist Church	-0.3875433	34.4681393	Homa Bay	West Karachuonyo	\N	\N	\N
213	Ng'ou SDA church	-0.4252283	34.5001022	Homa Bay	West Karachuonyo	\N	\N	\N
214	Lwala SDA Church	-0.5079077	34.7695155	Homa Bay	East Kamagak	\N	\N	\N
215	Kachieng SDA Church	-0.4820961	34.7809608	Homa Bay	East Kamagak	\N	\N	\N
216	OWANG' SDA CHURCH-ANYONA	-0.5190161	34.7776424	Homa Bay	East Kamagak	\N	\N	\N
217	Nyabondo Kachieng SDA Church	-0.4759121	34.7879808	Homa Bay	East Kamagak	\N	\N	\N
218	god ber sda church	-0.5204714	34.7882595	Homa Bay	East Kamagak	\N	\N	\N
219	Dudi Holo Seventh-day Adventist Church	-0.503753	34.7788133	Homa Bay	East Kamagak	\N	\N	\N
220	Ragogo SDA Church, Kodera Location, Kasipul. Homa Bay County	-0.507855	34.7381511	Homa Bay	South Kasipul	\N	\N	\N
221	Kwoyo Kasipul Seventh-day Adventist Church	-0.5179436	34.6977075	Homa Bay	South Kasipul	\N	\N	\N
222	SDA CHURCH MILIMANI OYUGIS.	-0.5243273	34.7259982	Homa Bay	South Kasipul	\N	\N	\N
223	SDA CHURCH PALA OYUGIS	-0.5176649	34.7398981	Homa Bay	South Kasipul	\N	\N	\N
224	Rakewa SDA church	-0.5222885	34.754959	Homa Bay	South Kasipul	\N	\N	\N
225	OURU CENTRAL SDA CHURCH	-0.5216491	34.7635333	Homa Bay	South Kasipul	\N	\N	\N
226	Nyapiedho SDA Church	-0.507855	34.7381511	Homa Bay	South Kasipul	\N	\N	\N
227	Agoro Sare Sda Church	-0.4991883	34.7354501	Homa Bay	West Kamagak	\N	\N	\N
228	Anyona SDA Church	-0.5269718	34.7749317	Homa Bay	West Kamagak	\N	\N	\N
229	Wire Seventh Day Adventist Church	-0.4885573	34.7556468	Homa Bay	West Kamagak	\N	\N	\N
230	CALVARY SDA CHURCH	-0.5024945	34.729915	Homa Bay	West Kamagak	\N	\N	\N
231	Kisuri SDA Church	-0.475116	34.7493609	Homa Bay	West Kamagak	\N	\N	\N
232	ONGIRO TOWN SDA CHUCH	-0.483656	34.7215365	Homa Bay	West Kamagak	\N	\N	\N
233	Highway Seventh Day Adventist Church	-0.4935768	34.7490098	Homa Bay	West Kamagak	\N	\N	\N
234	Kisui SDA Church	-0.4535961	34.2311806	Homa Bay	Kasgunga	\N	\N	\N
235	Wanga SDA Church	-0.4586936	34.267982	Homa Bay	Kasgunga	\N	\N	\N
236	RUSINGA CENTRAL SDA CHURCH	-0.4137095	34.2041096	Homa Bay	Kasgunga	\N	\N	\N
237	Ogando SDA Church	-0.5980683	34.352288	Homa Bay	Lambwe	\N	\N	\N
238	Lwala SDA Church	-0.5	34.366667	Homa Bay	Lambwe	\N	\N	\N
239	Hon. OLANDO'S Home Miyal SDA church	-0.5806769	34.3778414	Homa Bay	Lambwe	\N	\N	\N
240	KAJIEI MAIN SEVENTH DAY ADVENTIST CHURCH	-0.6220655	34.3310364	Homa Bay	Lambwe	\N	\N	\N
241	Paga SDA church	-0.5390694	34.3587581	Homa Bay	Lambwe	\N	\N	\N
242	Itutu Seventh Adventist Church, Mfangano Island.	-0.4763971	34.0354987	Homa Bay	Mfangano Island	\N	\N	\N
243	Seventh day Adventist. Mfangano central	-0.4571968	34.0588975	Homa Bay	Mfangano Island	\N	\N	\N
244	Rinya SDA Church	-0.4475156	33.9998584	Homa Bay	Mfangano Island	\N	\N	\N
245	Yokia SDA Church	-0.4327847	34.0366866	Homa Bay	Mfangano Island	\N	\N	\N
246	Wakula SDA Church	-0.4547035	33.9887456	Homa Bay	Mfangano Island	\N	\N	\N
247	Sagrema foundation Community based organization	-0.4908331	34.0359359	Homa Bay	Mfangano Island	\N	\N	\N
330	SDA church Kiserian	-1.426909	36.6853552	Kajiado	Keekonyokie	\N	\N	\N
248	Ugina Seventh Day Adventist Church	-0.4829652	33.9921363	Homa Bay	Mfangano Island	\N	\N	\N
249	Rusinga Got SDA Church	-0.4084789	34.2043323	Homa Bay	Rusinga Island	\N	\N	\N
250	Wauwa SDA church	-0.3835547	34.1690481	Homa Bay	Rusinga Island	\N	\N	\N
251	Wasaria SDA Church	-0.4141948	34.1993641	Homa Bay	Rusinga Island	\N	\N	\N
252	Nyamuga SDA Church	-0.3974546	34.1897589	Homa Bay	Rusinga Island	\N	\N	\N
253	WARIGA SDA CHURCH	-0.4149509	34.1888937	Homa Bay	Rusinga Island	\N	\N	\N
254	Gunda SDA Church	-0.4066471	34.1500488	Homa Bay	Rusinga Island	\N	\N	\N
255	Rusinga Island Lodge	-0.4109375	34.1423125	Homa Bay	Rusinga Island	\N	\N	\N
256	Milimani SDA Church	-0.402744	34.1860878	Homa Bay	Rusinga Island	\N	\N	\N
257	SIENGA SDA CHURCH	-0.4320781	34.1585418	Homa Bay	Rusinga Island	\N	\N	\N
258	Kaswanga SDA Church	-0.4084108	34.1578463	Homa Bay	Rusinga Island	\N	\N	\N
259	Kaswanga SDA Church	-0.3977871	34.1656232	Homa Bay	Rusinga Island	\N	\N	\N
260	Wamwanga SDA Church	-0.4132051	34.1507601	Homa Bay	Rusinga Island	\N	\N	\N
261	Chula Beach Resort, Rusinga Island	-0.3886444	34.1932529	Homa Bay	Rusinga Island	\N	\N	\N
262	Kodote SDA Church	-0.5407178	34.5264383	Homa Bay	Kochia	\N	\N	\N
263	Nyandiwa Gem SDA Church	-0.6168444	34.5615894	Homa Bay	West Gem	\N	\N	\N
264	Yogo Seventh-day Adventist Church	-0.6511284	34.5721336	Homa Bay	West Gem	\N	\N	\N
265	Nyandiwa main SDA church	-0.7274212	34.0512008	Homa Bay	Gwassi North	\N	\N	\N
266	Kiabuya Central SDA Church	-0.7413579	34.0952459	Homa Bay	Gwassi South	\N	\N	\N
267	Kagoro Seventh Day Adventist Church	-0.7488425	34.079941	Homa Bay	Gwassi South	\N	\N	\N
268	Magunga Central SDA Church	-0.6870703	34.1530791	Homa Bay	Gwassi South	\N	\N	\N
269	Rowo SDA Church	-0.548558	34.1434903	Homa Bay	Kaksingri West	\N	\N	\N
270	Nyabomo SDA Church	-0.5885643	34.1700071	Homa Bay	Kaksingri West	\N	\N	\N
271	Sindo SDA Church	-0.5325871	34.1684998	Homa Bay	Kaksingri West	\N	\N	\N
272	Lake View SDA Church	-0.5423306	34.1651552	Homa Bay	Kaksingri West	\N	\N	\N
273	Kibuogi sda church	-0.527549	34.0891969	Homa Bay	Kaksingri West	\N	\N	\N
274	kisenye sda church	-0.5352517	34.1758536	Homa Bay	Kaksingri West	\N	\N	\N
275	Rowo SDA Church	-0.556762	34.1253751	Homa Bay	Kaksingri West	\N	\N	\N
276	Sindo Central SDA Church	-0.5407532	34.1704091	Homa Bay	Kaksingri West	\N	\N	\N
277	Mikiundu SDA Church	-0.5573429	34.1224761	Homa Bay	Kaksingri West	\N	\N	\N
278	Sindo East SDA Church	-0.5459164	34.1775063	Homa Bay	Kaksingri West	\N	\N	\N
279	The Great Hope-Sindo SDA church	-0.5495547	34.1728429	Homa Bay	Kaksingri West	\N	\N	\N
280	Gingo SDA Church	-0.4989484	34.1650968	Homa Bay	Kaksingri West	\N	\N	\N
281	Kalombe SDA Church	-0.55747	34.2287935	Homa Bay	Ruma-Kaksingri	\N	\N	\N
282	Kaunda sda church	-0.5515304	34.249801	Homa Bay	Ruma-Kaksingri	\N	\N	\N
283	Bulla SDA church	0.3440878	37.5745774	Isiolo	Bulla Pesa	\N	\N	\N
284	Upperhill Mixed SDA secondary school	0.3331685	37.5483961	Isiolo	Burat	\N	\N	\N
285	Seventh Day Adventist Church Central Point Isiolo	0.3517193	37.5855718	Isiolo	Wabera	\N	\N	\N
286	Isiolo Prison SDA church	0.3583153	37.5839583	Isiolo	Wabera	\N	\N	\N
287	Isiolo Main SDA Church	0.3327743	37.5748874	Isiolo	Wabera	\N	\N	\N
288	Chumviere seventh- day adventist church	0.355636	37.5833061	Isiolo	Wabera	\N	\N	\N
289	Wabera Primary school Playground	0.3481509	37.5852055	Isiolo	Wabera	\N	\N	\N
290	Wabera Primary School	0.3493902	37.5836939	Isiolo	Wabera	\N	\N	\N
291	Garbatulla District Hospital	0.4110913	38.5690418	Isiolo	Garbatulla	\N	\N	\N
292	Kajiado Central SDA Church	-1.8460197	36.7923415	Kajiado	Dalalekutuk	\N	\N	\N
293	Dalalekutuk Farm	-1.8078934	36.7873466	Kajiado	Dalalekutuk	\N	\N	\N
294	Imaroro Town Centre	-1.9480516	37.0927217	Kajiado	Imaroro	\N	\N	\N
295	Seventh-Day Adventist Church	-1.5101525	36.9507269	Kajiado	Kaputiei North	\N	\N	\N
296	New Valley Seventh Day Adventist Church Kitengela	-1.4947698	36.9667194	Kajiado	Kaputiei North	\N	\N	\N
297	Crystal Fountain SDA Church Kitengela	-1.516353	36.9431873	Kajiado	Kaputiei North	\N	\N	\N
298	Seventh Day Adventist Church Noonkopir	-1.466862	36.9438886	Kajiado	Oloosirkon/Sholinke	\N	\N	\N
299	Seventh Day Adventist Church Kitengela Central	-1.4762208	36.9537402	Kajiado	Oloosirkon/Sholinke	\N	\N	\N
300	Oloika SDA church	-1.5249542	36.8968102	Kajiado	Oloosirkon/Sholinke	\N	\N	\N
301	Ngong Hills Central SDA Church	-1.3633508	36.6552776	Kajiado	Ngong	\N	\N	\N
302	Seventh Day Adventist Church	-1.3628106	36.6557969	Kajiado	Ngong	\N	\N	\N
303	Ronkai Central Sda Church	-1.3932575	36.7581633	Kajiado	Nkaimurunya	\N	\N	\N
304	SEVENTH-DAY ADVENTIST CHURCH, ONGATA RONGAI MAIN	-1.3888666	36.7491484	Kajiado	Nkaimurunya	\N	\N	\N
305	Nkoroi SDA Church	-1.4074299	36.7140237	Kajiado	Olkeri	\N	\N	\N
306	Sunshine Merisho SDA Church	-1.392907	36.7118127	Kajiado	Olkeri	\N	\N	\N
307	OLOIKA MWANGAZA ADVENTIST CHURCH	-1.4024728	36.7032488	Kajiado	Olkeri	\N	\N	\N
308	Mt Olives SDA Church Ngong	-1.378911	36.6735512	Kajiado	Olkeri	\N	\N	\N
309	SDA South Nairobi Kajiado Field Offices	-1.4063701	36.7518448	Kajiado	Olkeri	\N	\N	\N
310	Advent Hope Community Church	-1.3983109	36.7284655	Kajiado	Olkeri	\N	\N	\N
311	Oloolua SDA Church	-1.3630144	36.672266	Kajiado	Oloolua	\N	\N	\N
312	S.S.S.R Kangawa SDA	-1.3489549	36.6789363	Kajiado	Oloolua	\N	\N	\N
313	Ngong Sda	-1.360244	36.6711414	Kajiado	Oloolua	\N	\N	\N
314	Ngong East SDA Church	-1.3540914	36.6633154	Kajiado	Oloolua	\N	\N	\N
315	SDA	-1.3371666	36.6791277	Kajiado	Oloolua	\N	\N	\N
316	Laiser Hill SDA Church	-1.3942134	36.7326885	Kajiado	Ongata Rongai	\N	\N	\N
317	SDA central Kenya conference church	-1.3942027	36.7326862	Kajiado	Ongata Rongai	\N	\N	\N
318	SDA Church Greenview - Oloosirkon Kenya in Kajiado County	-1.3938406	36.7441953	Kajiado	Ongata Rongai	\N	\N	\N
319	Rongai East Seventh-day Adventist Church	-1.3903663	36.768823	Kajiado	Ongata Rongai	\N	\N	\N
320	Metro SDA church Rangau	-1.3938406	36.7441953	Kajiado	Ongata Rongai	\N	\N	\N
321	International Missionary Society SDA Reform Movement Church	-1.3895095	36.7713973	Kajiado	Ongata Rongai	\N	\N	\N
322	Kimana SDA Church	-2.8065993	37.5322901	Kajiado	Kimana	\N	\N	\N
323	Kimana FPFK Trinity Sanctuary	-2.8041571	37.5362233	Kajiado	Kimana	\N	\N	\N
324	Namelok SDA Church	-2.7143332	37.4573235	Kajiado	Kimana	\N	\N	\N
325	CUSTOMS SDA CHURCH	-2.9169686	37.5106914	Kajiado	Kuku	\N	\N	\N
326	Loitokitok Central SDA Church	-2.9330966	37.4997849	Kajiado	Kuku	\N	\N	\N
327	ROMBO SDA CHURCH	-3.0349201	37.6847883	Kajiado	Rombo	\N	\N	\N
328	AIC EWUASO KEDONG	-1.1443221	36.5021352	Kajiado	Ewuaso Oonkidong'I	\N	\N	\N
329	Valley View SDA Church, Kiserian. Kenya	-1.4442071	36.6893323	Kajiado	Keekonyokie	\N	\N	\N
331	Seventh Day Adventist	-1.4268095	36.6818952	Kajiado	Keekonyokie	\N	\N	\N
332	Seventh Day Adventist Church Kiserian south	-1.4410459	36.6730677	Kajiado	Keekonyokie	\N	\N	\N
333	Mount Olives Sda Church	-1.3992354	36.6633599	Kajiado	Keekonyokie	\N	\N	\N
334	Seventh Day Adventist Church Magadi	-1.9030441	36.2879894	Kajiado	Magadi	\N	\N	\N
335	Olngorswa SDA Church	-1.8996701	36.301039	Kajiado	Magadi	\N	\N	\N
336	ILPARAKUO SDA CHURCH	-1.8865507	36.3116668	Kajiado	Magadi	\N	\N	\N
337	Lenkobei SDA Church	-1.8996701	36.301039	Kajiado	Magadi	\N	\N	\N
338	Emuyundi Seventh Day Adventist Church	0.1947136	34.5171895	Kakamega	Marenyo - Shianda	\N	\N	\N
339	Idakho East Ward	0.1757937	34.7495316	Kakamega	Idakho East	\N	\N	\N
340	KHWISERO SEVENTH DAY ADVENTIST CHURCH	0.1710651	34.5932772	Kakamega	Kisa North	\N	\N	\N
341	Luanda SDA Church	0.1235912	34.493951	Kakamega	Kisa West	\N	\N	\N
342	SDA Chetambe	0.6362859	34.8516765	Kakamega	Lwandeti	\N	\N	\N
343	Akatsa SDA church	0.2181482	34.6357773	Kakamega	Butsotso South	\N	\N	\N
344	SDA Church Sichirayi	0.3037506	34.7630815	Kakamega	Sheywe	\N	\N	\N
345	Ebwambwa SDA Church	0.3107055	34.7703257	Kakamega	Sheywe	\N	\N	\N
346	Maraba SDA Church	0.2909815	34.7478108	Kakamega	Sheywe	\N	\N	\N
347	Seventh-Day Adventist Harmony Church	0.2726465	34.7717389	Kakamega	Shirere	\N	\N	\N
348	Kakamega Central SDA Church	0.278149	34.7523204	Kakamega	Shirere	\N	\N	\N
349	Kakamega SDA Satelite Academy	0.2672785	34.7586896	Kakamega	Shirere	\N	\N	\N
350	Seventh Day Adventist Church, Mt. Piscah-Maram	0.2773209	34.7423875	Kakamega	Shirere	\N	\N	\N
351	KAKAMEGA SDA SATELITE ACADEMY PRY SCH	0.28	34.75	Kakamega	Shirere	\N	\N	\N
352	Mumbetsa SDA Church	0.2827307	34.7518631	Kakamega	Shirere	\N	\N	\N
353	Shirere	0.2624533	34.7516247	Kakamega	Shirere	\N	\N	\N
354	Serve Ministries International - Kakamega	0.2806258	34.7474159	Kakamega	Shirere	\N	\N	\N
355	Seventh-Day Adventist Church Mount Pisgah - Maram	0.2827307	34.7518631	Kakamega	Shirere	\N	\N	\N
356	The Salvation Army - Kakamega Citadel	0.2704914	34.7526282	Kakamega	Shirere	\N	\N	\N
357	Seventhday Adventist Church Mukavakava	0.4918177	34.8634969	Kakamega	Butali/Chegulo	\N	\N	\N
358	KIMANG'ETI SDA CHURCH	0.4307217	34.917847	Kakamega	Chemuche	\N	\N	\N
359	Namagara SDA Church	0.5017372	34.876254	Kakamega	Manda-Shivanga	\N	\N	\N
360	Muriola SDA church	0.5091964	34.8780071	Kakamega	Manda-Shivanga	\N	\N	\N
361	FUBUYE MAIN SDA CHURCH	0.4901175	34.8813705	Kakamega	Manda-Shivanga	\N	\N	\N
362	Seventh-Day Adventist Church	0.6053047	34.8849423	Kakamega	Manda-Shivanga	\N	\N	\N
363	MATUNGU SDA PRI	0.39	34.48	Kakamega	Mayoni	\N	\N	\N
364	Makunga Church	0.2991138	34.6207956	Kakamega	Malaha/Isongo/Makunga	\N	\N	\N
365	Mumias Central SDA Church	0.3378626	34.4872023	Kakamega	Mumias Central	\N	\N	\N
366	Musanda Church	0.2195094	34.4475523	Kakamega	Musanda	\N	\N	\N
367	Musanda Secondary School	0.2197974	34.4481807	Kakamega	Musanda	\N	\N	\N
368	Ainamoi SDA Church	-0.2982284	35.2740787	Kericho	Ainamoi	\N	\N	\N
369	Keongo Seventh Day Adventist Church	-0.3405302	35.3019447	Kericho	Kapkugerwet	\N	\N	\N
370	Seventh-Day Adventist Church, Mangoin SDA.	-0.3263428	35.3085154	Kericho	Kapkugerwet	\N	\N	\N
371	Kapkiam Seventh-day Adventist Church	-0.2920279	35.3665937	Kericho	Kapsaos	\N	\N	\N
372	CHEBIGEN SEVENTH-DAY ADVENTIST CHURCH	-0.2827474	35.3356518	Kericho	Kapsaos	\N	\N	\N
373	SDA Church, Kericho	-0.35774	35.2800795	Kericho	Kipchebor	\N	\N	\N
374	SDA Church, Kabore Kericho	-0.3688967	35.286286	Kericho	Kipchebor	\N	\N	\N
375	Sunrise SDA Church	-0.371828	35.2835231	Kericho	Kipchebor	\N	\N	\N
376	Mlimani SDA	-0.3658776	35.2656733	Kericho	Kipchebor	\N	\N	\N
377	Malindi SDA kericho	-0.3778883	35.2824104	Kericho	Kipchebor	\N	\N	\N
378	Kipchimchim central seventh day Adventist Church	-0.3310173	35.2666048	Kericho	Kipchimchim	\N	\N	\N
379	Kinyose SDA church	-0.3212483	35.2785171	Kericho	Kipchimchim	\N	\N	\N
380	Kipchimchim Catholic Church	-0.3280793	35.268242	Kericho	Kipchimchim	\N	\N	\N
381	Chebungungon SDA Church	-0.4046059	35.1818525	Kericho	Cheptororiet/Seretut	\N	\N	\N
382	SDA CHURCH CHEMOSON	-0.4210082	35.1885139	Kericho	Cheptororiet/Seretut	\N	\N	\N
383	Kapsinendet SDA. Church	-0.3958389	35.1763076	Kericho	Cheptororiet/Seretut	\N	\N	\N
384	Cheptororiet Secondary School.	-0.3930887	35.2095468	Kericho	Cheptororiet/Seretut	\N	\N	\N
385	Kabianga SDA Church	-0.446518	35.1551168	Kericho	Kabianga	\N	\N	\N
386	Kapchebet central SDA church	-0.4307238	35.1265679	Kericho	Kabianga	\N	\N	\N
387	Kapchebet (main) SDA	-0.4185459	35.1367171	Kericho	Kabianga	\N	\N	\N
388	SDA Nyandika Church	-0.4380628	35.1072544	Kericho	Kabianga	\N	\N	\N
389	Kamawoi SDA Church	-0.3907598	35.1272218	Kericho	Kabianga	\N	\N	\N
390	Mobego SDA Church	-0.4303903	35.1492169	Kericho	Kabianga	\N	\N	\N
391	Saanga SDA Church	-0.4143981	35.1095427	Kericho	Kabianga	\N	\N	\N
392	KAPCHEBINYAL SDA CHURCH	-0.3902267	35.1140881	Kericho	Kabianga	\N	\N	\N
393	Chemamul SDA Church	-0.4282419	35.107378	Kericho	Kabianga	\N	\N	\N
394	Kapkures SDA CHURCH	-0.4374146	35.094553	Kericho	Kabianga	\N	\N	\N
395	Seventh Day Adventist Church	-0.3438531	35.216446	Kericho	Kapsuser	\N	\N	\N
396	SDA Kapnandet church	-0.3530991	35.2243818	Kericho	Kapsuser	\N	\N	\N
397	Keben SDA Church	-0.3853153	35.1849555	Kericho	Waldai	\N	\N	\N
398	Ngariet Seventh Day Adventist Church	-0.3746483	35.1533747	Kericho	Waldai	\N	\N	\N
399	Chereres SDA church	-0.3736497	35.1713619	Kericho	Waldai	\N	\N	\N
400	CHESEBET SDA CHURCH	-0.3627385	35.1715614	Kericho	Waldai	\N	\N	\N
401	Kapkatet AIC Church	-0.6332278	35.1968379	Kericho	Kapkatet	\N	\N	\N
402	University of Kabianga Kapkatet Campus	-0.6223958	35.1967543	Kericho	Kapkatet	\N	\N	\N
403	Litein SDA central church	-0.5814208	35.1940627	Kericho	Kapkatet	\N	\N	\N
404	SEVENTH DAY ADVENTIST KOCHORGO	-0.5887199	35.1969614	Kericho	Kapkatet	\N	\N	\N
405	Litein Seventh Day Adventist Church	-0.5837573	35.1919837	Kericho	Litein	\N	\N	\N
406	East Seventh-Day Adventist Church	-0.2784569	35.4027011	Kericho	Chepseon	\N	\N	\N
407	Seventh-Day Adventist Church, Binyiny	-0.2642126	35.408089	Kericho	Chepseon	\N	\N	\N
408	Momoniat SDA Church	-0.2388866	35.4496271	Kericho	Chepseon	\N	\N	\N
409	Seventh Day Adventist church-Kedowa	-0.2234079	35.5499635	Kericho	Kedowa/Kimugul	\N	\N	\N
410	Kipkoiyo SDA	-0.189729	35.6083774	Kericho	Kedowa/Kimugul	\N	\N	\N
411	Kipkoyo SDA	-0.2056875	35.6240625	Kericho	Kedowa/Kimugul	\N	\N	\N
412	Seventh Day Adventist Church	-0.1699522	35.5955388	Kericho	Kedowa/Kimugul	\N	\N	\N
413	Muungano Seventh Day Adventist church Londiani	-0.1731917	35.6094765	Kericho	Kedowa/Kimugul	\N	\N	\N
414	Kedowa Girls Secondary School	-0.2105207	35.5690742	Kericho	Kedowa/Kimugul	\N	\N	\N
415	KEDOWA PRIMARY SCHOOL	-0.2099757	35.5700509	Kericho	Kedowa/Kimugul	\N	\N	\N
416	Ararwet SDA church Londiani	-0.1326965	35.5502544	Kericho	Londiani	\N	\N	\N
417	Equator sda church	-0.0066139	35.5784592	Kericho	Tendeno/Sorget	\N	\N	\N
418	Sda hilltop	0.0108675	35.5310099	Kericho	Tendeno/Sorget	\N	\N	\N
419	Koisagat SDA Church	-0.1735925	35.3708204	Kericho	Chilchila	\N	\N	\N
420	Sereng Sda	-0.1962666	35.3887918	Kericho	Chilchila	\N	\N	\N
421	Fort Ternan SDA	-0.2058028	35.3400192	Kericho	Chilchila	\N	\N	\N
422	Kamasian SDA Church	-0.1489358	35.4251731	Kericho	Kamasian	\N	\N	\N
423	SDA CHURCH KALYET	-0.12014	35.5047481	Kericho	Kipkelion	\N	\N	\N
424	KITOI SDA PRIMARY SCHOOL	-0.0998286	35.2898736	Kericho	Kunyak	\N	\N	\N
425	Kaplelartet SDA Church	-0.3490498	35.0514132	Kericho	Kaplelartet	\N	\N	\N
426	CHEPKEMEL SDA CHURCH	-0.3798928	35.0622901	Kericho	Kaplelartet	\N	\N	\N
427	Kebeneti (SDA) Health Centre	-0.4072307	35.0498292	Kericho	Sigowet	\N	\N	\N
428	SDA CHEMEGONG	-0.4248635	35.0468156	Kericho	Sigowet	\N	\N	\N
429	Seventh-Day Adventist Church, Marumbasi	-0.4110738	35.0629125	Kericho	Sigowet	\N	\N	\N
430	Keteso SDA	-0.4222324	35.0609377	Kericho	Sigowet	\N	\N	\N
431	Seventh Day Adventist Church Kebeneti	-0.4540781	35.0755871	Kericho	Sigowet	\N	\N	\N
432	Seventh-day Adventist Church, Sasur	-0.3896865	35.0571536	Kericho	Sigowet	\N	\N	\N
433	SDA KAPCHANGA CHURCH	-0.4062089	35.071663	Kericho	Sigowet	\N	\N	\N
434	Korongoi Seventh Day Adventist Church	-0.2426919	35.2182005	Kericho	Soin	\N	\N	\N
435	kapchebwai SDA church	-0.1803816	35.2064734	Kericho	Soin	\N	\N	\N
436	Pala SDA Church	-0.1853559	35.1141144	Kericho	Soin	\N	\N	\N
437	Kamogoiwet SDA Church	-0.3072451	35.1481521	Kericho	Soliat	\N	\N	\N
438	Kimugul SDA Church	-0.3218719	35.1584157	Kericho	Soliat	\N	\N	\N
439	Kibugat SDA Church	-0.3130412	35.0466767	Kericho	Soliat	\N	\N	\N
440	Seventh Day Adventist Gituamba	-0.9059431	36.8621491	Kiambu	Gituamba	\N	\N	\N
441	Deliverable Church Kigaa	-1.0273976	36.8446477	Kiambu	Kiamwangi	\N	\N	\N
442	Seventh Day Adventist Church Kiamwathi	-0.9530095	36.8193823	Kiambu	Ndarugu	\N	\N	\N
443	PCEA Ndarugu Church	-0.9442498	36.8224558	Kiambu	Ndarugu	\N	\N	\N
444	Seventh day Adventist church -Githiga	-1.0913034	36.7406804	Kiambu	Githiga	\N	\N	\N
446	Seventh-Day Adventist Church NEWLIFE Githunguri	-1.0620374	36.7653098	Kiambu	Githunguri	\N	\N	\N
447	SDA CHURCH NGETETI	-1.0615677	36.7529276	Kiambu	Githunguri	\N	\N	\N
448	SDA Gathanji Church & School	-1.0875159	36.7831468	Kiambu	Githunguri	\N	\N	\N
449	SDA Church Ikinu	-1.104996	36.7994797	Kiambu	Ikinu	\N	\N	\N
450	SDA Ikinu	-1.1026361	36.7995429	Kiambu	Ikinu	\N	\N	\N
451	SDA Ikinu	-1.1029487	36.7996931	Kiambu	Ikinu	\N	\N	\N
452	SDA CHURCH KIGUMO	-1.0321341	36.8289618	Kiambu	Komothai	\N	\N	\N
453	Seventh Day Adventist church Kibau-ini	-1.0382377	36.8171218	Kiambu	Komothai	\N	\N	\N
454	PCEA Komothai Church	-1.0679847	36.8605601	Kiambu	Komothai	\N	\N	\N
455	Komothai Boys’ High School	-1.0680302	36.8598239	Kiambu	Komothai	\N	\N	\N
456	Seventh Day Adventist Kibauini	-1.0485658	36.8397783	Kiambu	Komothai	\N	\N	\N
457	Miguta Seventh-Day Adventist Church	-1.0780477	36.8418443	Kiambu	Ngewa	\N	\N	\N
458	Wendani SDA CHURCH	-1.0595695	36.8284865	Kiambu	Ngewa	\N	\N	\N
459	Juja SDA Church	-1.105283	37.0062302	Kiambu	Juja	\N	\N	\N
460	Jomo Kenyatta Seventh-Day Adventist (JKUSDA)	-1.0953419	37.0148641	Kiambu	Juja	\N	\N	\N
461	Seventh Day Adventist Church- Gachororo	-1.0859345	37.0178627	Kiambu	Juja	\N	\N	\N
462	Westview Milimani	-1.0838289	37.0044924	Kiambu	Juja	\N	\N	\N
463	Kenyatta Road SDA	-1.1246297	37.0119131	Kiambu	Kalimoni	\N	\N	\N
464	Murera Sda Church	-1.1499933	36.9992864	Kiambu	Murera	\N	\N	\N
465	Kiahuria SDA Church	-1.0444633	36.9982951	Kiambu	Witeithie	\N	\N	\N
466	Kanyariri SDA	-1.2328137	36.6857348	Kiambu	Gitaru	\N	\N	\N
467	Seventh Day Adventist Church	-1.2242026	36.7117268	Kiambu	Kabete	\N	\N	\N
468	Joyland SDA Church	-1.2216479	36.7153504	Kiambu	Kabete	\N	\N	\N
469	King'eero SDA Church	-1.2244805	36.7116677	Kiambu	Kabete	\N	\N	\N
470	SDA Kiambaa Central Church	-1.2008906	36.653222	Kiambu	Muguga	\N	\N	\N
471	SDA Church Githunguri Gichamu	-1.1887983	36.6696758	Kiambu	Muguga	\N	\N	\N
472	SDA Nyathuna	-1.186045	36.6773313	Kiambu	Nyadhuna	\N	\N	\N
473	SDA Church Gathiga	-1.217828	36.7386688	Kiambu	Nyadhuna	\N	\N	\N
474	Seventh day Adventist church kawaida	-1.1418138	36.755735	Kiambu	Cianda	\N	\N	\N
475	Church seventh day adventist	-1.1334087	36.7342488	Kiambu	Cianda	\N	\N	\N
476	Banana SDA Church	-1.1799605	36.7556103	Kiambu	Karuri	\N	\N	\N
477	St. Martin De Porres Karuri Catholic Church	-1.1758816	36.7565134	Kiambu	Karuri	\N	\N	\N
478	Kiambaa SDA church	-1.1636162	36.7646932	Kiambu	Karuri	\N	\N	\N
479	Gachie SDA Church	-1.2195613	36.7698312	Kiambu	Kihara	\N	\N	\N
480	SDA MUCHATHA	-1.1944645	36.7828083	Kiambu	Muchatha	\N	\N	\N
481	Seventh - Day Adventist Church	-1.1916494	36.777114	Kiambu	Muchatha	\N	\N	\N
482	SDA CHURCH KIAMBAA	-1.1869026	36.7680331	Kiambu	Muchatha	\N	\N	\N
483	Ndenderu SDA Chruch	-1.1952272	36.7442337	Kiambu	Ndenderu	\N	\N	\N
484	ACK St. Peters Church Ndumberi	-1.1511268	36.8015237	Kiambu	Ndumberi	\N	\N	\N
485	Ndumberi Stadium	-1.1509188	36.8063607	Kiambu	Ndumberi	\N	\N	\N
486	ACK Church Riabai	-1.1650396	36.842768	Kiambu	Riabai	\N	\N	\N
487	SDA Church Ting'ang'a	-1.1239293	36.8138039	Kiambu	Ting'Ang'A	\N	\N	\N
488	Ting'ang'a Secondary School	-1.1398579	36.8300178	Kiambu	Ting'Ang'A	\N	\N	\N
489	Kiambu SDA Church	-1.1721039	36.8279126	Kiambu	Township	\N	\N	\N
490	Gikambura SDA Church	-1.2757775	36.644635	Kiambu	Karai	\N	\N	\N
491	Kikuyu Central SDA Church	-1.250752	36.6661446	Kiambu	Kikuyu	\N	\N	\N
492	Seventh-Day Adventist Church Muthiga Shauri (SDA)	-1.2625301	36.686137	Kiambu	Kikuyu	\N	\N	\N
493	Seventh - Day Adventist Church Kinoo	-1.2508408	36.6883417	Kiambu	Kinoo	\N	\N	\N
494	Nachu Mbombo-ini SDA	-1.2633248	36.5798379	Kiambu	Nachu	\N	\N	\N
495	Ndacha SDA Church	-1.265661	36.5981265	Kiambu	Nachu	\N	\N	\N
496	KAMANGU SEVENTH DAY ADVENTIST CHURCH	-1.2391664	36.6027688	Kiambu	Nachu	\N	\N	\N
497	Seventh-Day Adventist Church Lusigeti	-1.2724501	36.6175165	Kiambu	Nachu	\N	\N	\N
498	Zambezi SDA Church	-1.2093234	36.6607368	Kiambu	Sigona	\N	\N	\N
499	Nderi SDA Church	-1.2177161	36.6516316	Kiambu	Sigona	\N	\N	\N
500	Seventh Day Adventist Church Thamanda	-1.1878167	36.6438508	Kiambu	Sigona	\N	\N	\N
501	SDA CHURCH NDERI	-1.2280673	36.6524498	Kiambu	Sigona	\N	\N	\N
502	ACK St Lukes Sigona	-1.2116637	36.6566752	Kiambu	Sigona	\N	\N	\N
503	Kipasi SDA church	-1.0181803	36.7786794	Kiambu	Kamburu	\N	\N	\N
504	Seventh Day Adventist Kagaa Township	-1.0260176	36.7128106	Kiambu	Kamburu	\N	\N	\N
505	SDA Kijabe	-0.9329496	36.5766676	Kiambu	Kinale	\N	\N	\N
506	SDA CHURCH CHEESE	-0.7662864	36.6463519	Kiambu	Kinale	\N	\N	\N
507	Seventh-day Adventist Church Kirenga	-1.009345	36.6291797	Kiambu	Lari/Kirenga	\N	\N	\N
508	Githirioni SDA Church	-1.0216959	36.6532969	Kiambu	Lari/Kirenga	\N	\N	\N
509	P.C.E.A and A.I.C Bibirioni Church	-1.0828371	36.6284068	Kiambu	Bibirioni	\N	\N	\N
510	Seventh Day Adventist Church limuru	-1.1125142	36.634436	Kiambu	Limuru Central	\N	\N	\N
511	Sda ndeiya makutano	-1.1435772	36.5810845	Kiambu	Ndeiya	\N	\N	\N
512	Messianic Assembly of YAHWEH 7th Day Church Ndeiya	-1.1098108	36.5943301	Kiambu	Ndeiya	\N	\N	\N
513	Seventh-Day Adventist Church Thigio	-1.2005182	36.6051756	Kiambu	Ndeiya	\N	\N	\N
514	Rwacumari SDA Church	-1.1435777	36.5810825	Kiambu	Ndeiya	\N	\N	\N
515	Seventh day Adventist	-1.1267155	36.5994267	Kiambu	Ndeiya	\N	\N	\N
516	Seventh day adventist	-1.1396327	36.6124838	Kiambu	Ndeiya	\N	\N	\N
517	Seventh -Day Adventist Church Ngecha	-1.1714331	36.6675988	Kiambu	Ngecha Tigoni	\N	\N	\N
518	Seventh Day Adventist Church Ruiru	-1.1570563	36.9469049	Kiambu	Gitothua	\N	\N	\N
519	Kiu Central SDA	-1.2133984	36.9589261	Kiambu	Kiuu	\N	\N	\N
520	Kahawa Wendani SDA	-1.2012693	36.9305911	Kiambu	Kiuu	\N	\N	\N
521	Githurai SDA Church	-1.2060364	36.9209046	Kiambu	Kiuu	\N	\N	\N
522	Mwihoko Seventh Day Adventist Church	-1.219873	36.9764601	Kiambu	Kiuu	\N	\N	\N
523	SDA Church Gilead~Ruiru	-1.1491328	36.9740726	Kiambu	Kiuu	\N	\N	\N
524	SDA kahawa Sukari	-1.1984333	36.9432538	Kiambu	Kiuu	\N	\N	\N
525	Sda junction	-1.2200606	36.9779873	Kiambu	Kiuu	\N	\N	\N
526	Kimbo South SDA Church	-1.2183145	36.9370509	Kiambu	Kiuu	\N	\N	\N
527	Seventh Day Adventist Church Ndururumo	-1.1732564	37.0298988	Kiambu	Kiuu	\N	\N	\N
528	SDA CHURCH GATUANYAGA	-1.0649415	37.2222912	Kiambu	Gatuanyaga	\N	\N	\N
529	Thika Central SDA Church	-1.036259	37.0658636	Kiambu	Kamenu	\N	\N	\N
530	SDA Thika Main Church Kenya	-1.053758	37.1108582	Kiambu	Kamenu	\N	\N	\N
531	Kiganjo SDA Church	-1.0746383	37.0895641	Kiambu	Kamenu	\N	\N	\N
532	Maguguni Central Seventh Day Church	-1.0545197	37.2722849	Kiambu	Ngoliba	\N	\N	\N
533	Palakumi SDA Church	-3.6241927	39.6053379	Kilifi	Jaribuni	\N	\N	\N
534	Seventh day adventist church	-3.3924058	39.7751718	Kilifi	Sokoke	\N	\N	\N
535	SDA Church Kaloleni	-3.8188094	39.6337463	Kilifi	Kaloleni	\N	\N	\N
536	Mariakani SDA Central Church	-3.8658916	39.4802688	Kilifi	Mariakani	\N	\N	\N
537	SDA Church, Mariakani Main	-3.8584613	39.4798071	Kilifi	Mariakani	\N	\N	\N
538	Mtsengo SDA Church	-3.7136212	39.6382736	Kilifi	Mwanamwinga	\N	\N	\N
539	Watamu SDA Church	-3.3540311	40.0176516	Kilifi	Dabaso	\N	\N	\N
540	Watamu SDA Junior School	-3.3542	40.017659	Kilifi	Dabaso	\N	\N	\N
541	Watamu Adventist Beach Resort	-3.3557574	40.0176275	Kilifi	Dabaso	\N	\N	\N
542	KIWAPA SDA CHURCH	-3.596088	39.8481926	Kilifi	Kibarani	\N	\N	\N
543	Kibarani School For the Deaf	-3.6093951	39.847107	Kilifi	Kibarani	\N	\N	\N
544	Kibarani Boarding Primary School	-3.6101467	39.8463642	Kilifi	Kibarani	\N	\N	\N
545	Sda church chuman	-3.4701195	39.899431	Kilifi	Matsangoni	\N	\N	\N
546	Mnarani Beach Club	-3.6383644	39.8513663	Kilifi	Mnarani	\N	\N	\N
547	Seventh Day Adventist Church Kilifi Central	-3.6207545	39.8528649	Kilifi	Sokoni	\N	\N	\N
548	SDA Church Discovery	-3.6302699	39.8591416	Kilifi	Sokoni	\N	\N	\N
550	Majaoni IMS SDA CHURCH	-3.5676819	39.8730883	Kilifi	Tezo	\N	\N	\N
551	Seventh Day Adventist -Kilifi East	-3.6107255	39.865647	Kilifi	Tezo	\N	\N	\N
552	Soyo Soyo SDA Church	-3.5106508	39.9093269	Kilifi	Tezo	\N	\N	\N
553	Kilifi Central Seventh-day Adventist Church	-3.5106508	39.9093269	Kilifi	Tezo	\N	\N	\N
554	Seventh Day Adventist Church Chasimba Township	-3.752696	39.6881492	Kilifi	Chasimba	\N	\N	\N
555	Vipingo SDA	-3.8170155	39.8176587	Kilifi	Junju	\N	\N	\N
556	SDA church Vipingo	-3.8201959	39.7858575	Kilifi	Junju	\N	\N	\N
557	Seventh-Day Adventist church, Majengo Kanamai	-3.9074052	39.7591262	Kilifi	Mtepeni	\N	\N	\N
558	Seventh Day Adventist Church Junction	-3.9084143	39.7657254	Kilifi	Mtepeni	\N	\N	\N
559	Maamba SDA church	-3.9093383	39.7742736	Kilifi	Mtepeni	\N	\N	\N
560	Kikambala for Jesus SDA	-3.880732	39.7902972	Kilifi	Mtepeni	\N	\N	\N
561	SDA. Mtwapa Central Church	-3.9457825	39.7498806	Kilifi	Shimo La Tewa	\N	\N	\N
562	SDA Church , Mtomondoni	-3.9445693	39.7290186	Kilifi	Shimo La Tewa	\N	\N	\N
563	Jumba great hope sda	-3.9452351	39.7669696	Kilifi	Shimo La Tewa	\N	\N	\N
564	Seventh Day Adventist Church	-3.033478	40.137094	Kilifi	Gongoni	\N	\N	\N
565	Hell’s Kitchen	-3.0263935	39.9638914	Kilifi	Marafa	\N	\N	\N
566	Dakacha Seventh Day Adventist Church	-3.0283545	39.8038791	Kilifi	Marafa	\N	\N	\N
567	Baraka seventh day Adventist	-3.2547398	40.1153772	Kilifi	Ganda	\N	\N	\N
568	Malindi Central Seventh Day Adventist	-3.2150666	40.1133076	Kilifi	Malindi Town	\N	\N	\N
569	The Seventh - Day Adventist Church - SDA Malindi West	-3.2145709	40.1033955	Kilifi	Malindi Town	\N	\N	\N
570	Seventhday Adventist Church	-3.227006	40.1056404	Kilifi	Shella	\N	\N	\N
571	Malindi GoodNews SDA Church	-3.2349636	40.108661	Kilifi	Shella	\N	\N	\N
572	SDA CHURCH MALINDI EAST	-3.2184689	40.1175009	Kilifi	Shella	\N	\N	\N
573	Rabai Mpya Adventist Church	-3.936853	39.5650452	Kilifi	Rabai/Kisurutini	\N	\N	\N
574	KĨANYAGA SDA PRI	-0.5	37.35	Kirinyaga	Baragwi	\N	\N	\N
575	Gatitu SDA Church	-0.4255339	37.4167085	Kirinyaga	Ngariama	\N	\N	\N
576	Ngariama Secondary School	-0.4442498	37.3898917	Kirinyaga	Ngariama	\N	\N	\N
577	GITUMBI SDA PRI	-0.4185218	37.3943502	Kirinyaga	Ngariama	\N	\N	\N
578	Kiamutugu SDA Church	-0.4674023	37.3919737	Kirinyaga	Ngariama	\N	\N	\N
579	Gatumbi (SDA) Dispensary	-0.4181419	37.3929334	Kirinyaga	Ngariama	\N	\N	\N
580	Gatumbi SDA High School	-0.4186875	37.3939375	Kirinyaga	Ngariama	\N	\N	\N
581	KARUCHO SDA CHURCH	-0.4931079	37.3826331	Kirinyaga	Njukiini	\N	\N	\N
582	Kamagambo SDA Church	-0.4752491	37.3750413	Kirinyaga	Njukiini	\N	\N	\N
583	Muthigiini	-0.4809287	37.4094234	Kirinyaga	Njukiini	\N	\N	\N
584	Gitumbi SDA church	-0.4566471	37.2777191	Kirinyaga	Inoi	\N	\N	\N
585	SDA Hope Alive Church Kerugoya	-0.4962981	37.2691445	Kirinyaga	Inoi	\N	\N	\N
586	Mbeti SDA Church	-0.4412569	37.2786119	Kirinyaga	Inoi	\N	\N	\N
587	Seventh Day Adventist Kangaita Church	-0.4200687	37.2708485	Kirinyaga	Inoi	\N	\N	\N
588	SDA Kiawakara	-0.457063	37.2636567	Kirinyaga	Inoi	\N	\N	\N
589	SDA CHURCH KARIA	-0.5361912	37.3072969	Kirinyaga	Kanyekini	\N	\N	\N
590	SDA CHURCH KERUGOYA	-0.5015047	37.2848696	Kirinyaga	Kerugoya	\N	\N	\N
591	Seventh Day Adventist Kiawakara.Kiawakara,Kirinyaga County-Kenya	-0.4993051	37.2784685	Kirinyaga	Kerugoya	\N	\N	\N
592	KAGUMO SDA	-0.462673	37.2399604	Kirinyaga	Mutira	\N	\N	\N
593	SDA kirogo	-0.6638892	37.3900342	Kirinyaga	Gathigiriri	\N	\N	\N
594	Seventh-day Adventist Church Ngucui	-0.6343547	37.3820968	Kirinyaga	Murinduko	\N	\N	\N
595	Seventh Day Adventist Church Mutithi	-0.7361222	37.3282963	Kirinyaga	Mutithi	\N	\N	\N
596	Thiba SDA church	-0.6838826	37.358662	Kirinyaga	Tebere	\N	\N	\N
597	SDA Ngurubani	-0.6844811	37.3511887	Kirinyaga	Tebere	\N	\N	\N
598	MUKANGU SDA CHURCH	-0.5583412	37.1592382	Kirinyaga	Kariti	\N	\N	\N
599	Kianjuri seventh day adventist church	-0.6203847	37.253169	Kirinyaga	Kiine	\N	\N	\N
600	Sameta Mokarate SDA Church	-0.7905869	34.7392723	Kisii	Sameta/Mokwerero	\N	\N	\N
601	Riokindo SDA Church	-0.9192289	34.7552993	Kisii	Bokimonge	\N	\N	\N
602	MAGENGE MAIN SDA CHURCH	-0.8988431	34.7592171	Kisii	Bokimonge	\N	\N	\N
603	Omobera SDA Church	-0.8921736	34.746907	Kisii	Bokimonge	\N	\N	\N
604	Kiango Main SDA Church	-0.9327415	34.7893519	Kisii	Bokimonge	\N	\N	\N
605	Kiru SDA Church	-0.9026059	34.7537495	Kisii	Bokimonge	\N	\N	\N
606	Motemomwamu SDA Church	-0.9253221	34.7597557	Kisii	Bokimonge	\N	\N	\N
607	Magenche Main SDA Church	-0.9516321	34.7133858	Kisii	Magenche	\N	\N	\N
608	SENGERA SDA PRI	-0.92	34.73	Kisii	Magenche	\N	\N	\N
609	RIAMANGATA SDA PRI	-0.91	34.7	Kisii	Magenche	\N	\N	\N
610	MOKOMONI SDA SEC. SCHOOL	-0.9261533	34.7273272	Kisii	Magenche	\N	\N	\N
611	SENGERA SDA MIXED SECONDARY SCHOOL	-0.9251931	34.7278077	Kisii	Magenche	\N	\N	\N
612	NYAGANCHA CENTRAL SDA CHURCH	-0.926555	34.7063347	Kisii	Magenche	\N	\N	\N
613	Nyakorere SDA church	-0.9233363	34.7012494	Kisii	Magenche	\N	\N	\N
614	Nyabinyinyi SDA Church	-0.9326436	34.7217695	Kisii	Magenche	\N	\N	\N
615	Tendere SDA Church	-0.8112301	34.7286372	Kisii	Boochi/Tendere	\N	\N	\N
616	Matongo SDA Church	-0.7791468	34.6974438	Kisii	Boochi/Tendere	\N	\N	\N
617	Nyaburumbasi SDA Church	-0.7862997	34.7056042	Kisii	Boochi/Tendere	\N	\N	\N
618	IBENCHO SDA CHURCH	-0.8690934	34.6907885	Kisii	Bosoti/Sengera	\N	\N	\N
619	Nyakoiba SDA Church (Main)	-0.8840586	34.7089663	Kisii	Bosoti/Sengera	\N	\N	\N
620	Nyabioto II sda church	-0.8650229	34.7120137	Kisii	Bosoti/Sengera	\N	\N	\N
621	Nyakoiba SDA Church (Main)	-0.8782754	34.6967094	Kisii	Bosoti/Sengera	\N	\N	\N
622	NYAMIOBO SDA CHURCH	-0.8633381	34.6999302	Kisii	Bosoti/Sengera	\N	\N	\N
623	Emanga SDA Church	-0.880999	34.6930321	Kisii	Bosoti/Sengera	\N	\N	\N
624	Nyaisero SDA Church	-0.8474609	34.7299251	Kisii	Bosoti/Sengera	\N	\N	\N
625	Nyabioto I Main SDA Church	-0.8479751	34.7144391	Kisii	Bosoti/Sengera	\N	\N	\N
626	Ribwago SDA Church	-0.6867341	34.6925495	Kisii	Bomorenda	\N	\N	\N
627	Sda church Mentorship	-0.6629583	34.6834819	Kisii	Bomorenda	\N	\N	\N
628	Suneka South SDA Church	-0.6832849	34.7004023	Kisii	Bomorenda	\N	\N	\N
629	Seventh Day Adventist Church Itibo	-0.692744	34.724807	Kisii	Bomorenda	\N	\N	\N
630	SDA EKIENDEGE CHURCH	-0.6693666	34.69421	Kisii	Bomorenda	\N	\N	\N
631	Suneka Central SDA church	-0.6763741	34.7066817	Kisii	Bomorenda	\N	\N	\N
632	Seventh day Adventist Itierio central	-0.6795183	34.7193887	Kisii	Bomorenda	\N	\N	\N
633	SUGUTA SDA	-0.7008148	34.7330603	Kisii	Bomorenda	\N	\N	\N
634	Nyakamba Sda	-0.5775449	34.8038188	Kisii	Marani	\N	\N	\N
635	Getare SDA Church	-0.5897852	34.7812037	Kisii	Marani	\N	\N	\N
636	Mbanda SDA church	-0.5953178	34.8007065	Kisii	Marani	\N	\N	\N
637	Kioge Sda Church	-0.5605694	34.8690049	Kisii	Monyerero	\N	\N	\N
638	Samugara SDA church	-0.5886926	34.8430105	Kisii	Monyerero	\N	\N	\N
639	Sensi SDA Primary School	-0.6057052	34.81817	Kisii	Sensi	\N	\N	\N
640	Mosocho Central SDA Church	-0.595991	34.7302121	Kisii	Bogeka	\N	\N	\N
641	Living Hope SDA church	-0.6045584	34.7453333	Kisii	Bogeka	\N	\N	\N
642	SDA Church,Mosocho Township Chutch	-0.5869644	34.7302827	Kisii	Bogusero	\N	\N	\N
643	SDA Church Nyakoe Central	-0.6200787	34.7590735	Kisii	Nyakoe	\N	\N	\N
644	GETERI SDA CHURCH	-0.6306038	34.7575059	Kisii	Nyakoe	\N	\N	\N
645	Geteri SDA church	-0.6276815	34.7655787	Kisii	Nyakoe	\N	\N	\N
646	Nyatieko SDA Church	-0.6407997	34.7988372	Kisii	Nyatieko	\N	\N	\N
647	Nyakeogiro SDA Church	-0.638192	34.7830642	Kisii	Nyatieko	\N	\N	\N
648	Njia Njema SDA	-0.6396815	34.7942337	Kisii	Nyatieko	\N	\N	\N
649	Kanyimbo SDA Church	-0.6505692	34.799841	Kisii	Nyatieko	\N	\N	\N
650	Birongo 2 SDA	-0.7529388	34.89042	Kisii	Birongo	\N	\N	\N
651	Birongo sda church	-0.7472435	34.888408	Kisii	Birongo	\N	\N	\N
652	Birongo Secondary School	-0.7472852	34.8886192	Kisii	Birongo	\N	\N	\N
653	NYAIGESA SDA CHURCH	-0.7465144	34.9030516	Kisii	Birongo	\N	\N	\N
654	Chibwobi SDA Church	-0.7646134	34.894669	Kisii	Birongo	\N	\N	\N
655	NYARIACHO SDA CHURCH	-0.7396432	34.8787892	Kisii	Birongo	\N	\N	\N
656	Gekomu II SDA Church	-0.6929385	34.7752813	Kisii	Bobaracho	\N	\N	\N
657	Mailimbili SDA	-0.6947717	34.7903939	Kisii	Bobaracho	\N	\N	\N
658	Borabu SDA church	-0.677334	34.779603	Kisii	Bobaracho	\N	\N	\N
659	Kiong'anyo Chiriba SDA Church	-0.6773339	34.7796031	Kisii	Bobaracho	\N	\N	\N
660	Nyaguru SDA Church	-0.7142691	34.7895737	Kisii	Bobaracho	\N	\N	\N
661	SDA CHURCH, JOGOO	-0.6741812	34.7873258	Kisii	Bobaracho	\N	\N	\N
662	Misesi Central SDA Church.	-0.677334	34.779603	Kisii	Bobaracho	\N	\N	\N
663	Moneke Seventh Day Adventist Church	-0.677334	34.779603	Kisii	Bobaracho	\N	\N	\N
664	Omoturumesi SDA church	-0.707487	34.7817747	Kisii	Bobaracho	\N	\N	\N
665	Kisii University SDA	-0.6894663	34.7759781	Kisii	Bobaracho	\N	\N	\N
666	Nyabera Central Sda Church	-0.677334	34.779603	Kisii	Bobaracho	\N	\N	\N
667	KIRWA SDA PRI	-0.7923941	34.8671648	Kisii	Ibeno	\N	\N	\N
668	KERERA SDA PRI	-0.75	34.83	Kisii	Ibeno	\N	\N	\N
669	Keumbu Central SDA Church	-0.7376379	34.8435819	Kisii	Keumbu	\N	\N	\N
670	AMARIBA SDA CHURCH	-0.7456516	34.7813118	Kisii	Kiogoro	\N	\N	\N
671	Nyanderema Seventh-day Adventist Church	-0.7472245	34.7996615	Kisii	Kiogoro	\N	\N	\N
672	OBWOYO SDA CHURCH	-0.7201699	34.7833029	Kisii	Kiogoro	\N	\N	\N
673	Rianyamwamu SDA church	-0.7287195	34.7939607	Kisii	Kiogoro	\N	\N	\N
674	Kisii Central SDA church	-0.6723272	34.7728899	Kisii	Kisii Central	\N	\N	\N
675	Kisii Newlife SDA Church	-0.6713493	34.7668069	Kisii	Kisii Central	\N	\N	\N
676	SDA CHURCH RIOMBATI	-0.659962	34.7679321	Kisii	Kisii Central	\N	\N	\N
677	Milimani SDA CHURCH,KISII.	-0.6858794	34.7710286	Kisii	Kisii Central	\N	\N	\N
678	Nyanchwa SDA Church	-0.6807989	34.765487	Kisii	Kisii Central	\N	\N	\N
679	Nyankongo main SDA church	-0.6680875	34.7730781	Kisii	Kisii Central	\N	\N	\N
680	Masongo SDA Church	-0.710055	34.7485159	Kisii	Kisii Central	\N	\N	\N
681	South Kenya Conference Headquaters	-0.6811471	34.767143	Kisii	Kisii Central	\N	\N	\N
682	Gesusu (SDA) Dispensary	-0.8701845	34.9092988	Kisii	Gesusu	\N	\N	\N
683	Rianyambane SDA Church	-0.8706686	34.9163523	Kisii	Gesusu	\N	\N	\N
684	Mogonga Central SDA Church	-0.8736382	34.9093646	Kisii	Gesusu	\N	\N	\N
685	New valley SDA	-0.8701911	34.9092967	Kisii	Gesusu	\N	\N	\N
686	Chibwobi Adventist Church	-0.8665575	34.9097379	Kisii	Gesusu	\N	\N	\N
687	Gesarate SDA Church	-0.8713357	34.9202981	Kisii	Gesusu	\N	\N	\N
688	MOGONGA CENTRAL SDA CHURCH	-0.8560145	34.9011939	Kisii	Gesusu	\N	\N	\N
689	Nyamiobo Sda Church	-0.7771404	34.9458038	Kisii	Ichuni	\N	\N	\N
690	Keroka Central SDA Church	-0.769195	34.9424187	Kisii	Ichuni	\N	\N	\N
691	Nyabiosi SdA Church	-0.7803663	34.9472949	Kisii	Ichuni	\N	\N	\N
692	Nyankononi SDA church	-0.7798713	34.947769	Kisii	Ichuni	\N	\N	\N
693	Rianyatundo sda church	-0.7816849	34.9480001	Kisii	Ichuni	\N	\N	\N
694	Ibiso SDA church	-0.7771404	34.9458038	Kisii	Ichuni	\N	\N	\N
695	Irondi SDA Church	-0.7810206	34.8862454	Kisii	Ichuni	\N	\N	\N
696	Riamang'era SDA Church	-0.8178382	34.8820551	Kisii	Kiamokama	\N	\N	\N
697	Kenyoro SDA Church	-0.8237547	34.8919192	Kisii	Kiamokama	\N	\N	\N
698	IKARANGO SDA CHURCH	-0.807324	34.8798761	Kisii	Kiamokama	\N	\N	\N
699	Riayoge SDA Church	-0.8475796	34.90569	Kisii	Kiamokama	\N	\N	\N
700	Nyambogo SDA church	-0.834164	34.9355735	Kisii	Kiamokama	\N	\N	\N
701	Angaza SDA Church	-0.8575553	34.9312899	Kisii	Masimba	\N	\N	\N
702	Mobaroka SDA CHURCH	-0.8543292	34.932054	Kisii	Masimba	\N	\N	\N
703	SDA Bonyakoni Church	-0.8560314	34.925152	Kisii	Masimba	\N	\N	\N
704	Kerema sda church	-0.8657181	34.9234487	Kisii	Masimba	\N	\N	\N
705	Itibo SDA Church	-0.8496517	34.944398	Kisii	Masimba	\N	\N	\N
706	NYASIKE SDA CHURCH	-0.8476762	34.9623498	Kisii	Masimba	\N	\N	\N
707	Nyabioto SDA Church	-0.8382693	34.9474147	Kisii	Masimba	\N	\N	\N
708	NYAMBOGO SDA CHURCH	-0.8738672	34.9771709	Kisii	Masimba	\N	\N	\N
709	SEVENTH DAY ADVENTIST CHURCH, MATIBO	-0.8530614	34.9702577	Kisii	Masimba	\N	\N	\N
710	Nyanzakia SDA	-0.8424068	34.9242285	Kisii	Masimba	\N	\N	\N
711	Nyabigena SDA Church	-0.7835683	34.674627	Kisii	Bogetenga	\N	\N	\N
712	Goti SDA church	-0.8154148	34.6438838	Kisii	Bogetenga	\N	\N	\N
713	OMOGWA SDA CHURCH (CAMP CENTRE )	-0.7901489	34.6386905	Kisii	Bogetenga	\N	\N	\N
714	Riosiri SDA Church	-0.7684491	34.6265958	Kisii	Bogetenga	\N	\N	\N
715	Mongane SDA church	-0.7701181	34.6629566	Kisii	Bogetenga	\N	\N	\N
716	ENGOTO SDA CHURCH ETAGO KISII	-0.9043501	34.6739299	Kisii	Borabu / Chitago	\N	\N	\N
717	Engoto Central SDA Church, Etago.	-0.8990683	34.6726175	Kisii	Borabu / Chitago	\N	\N	\N
718	SDA Tabaka Church	-0.7422014	34.6670188	Kisii	Tabaka	\N	\N	\N
719	Nyamue SDA Church	-0.749576	34.6423456	Kisii	Tabaka	\N	\N	\N
720	Nyatike SDA Church	-0.7419311	34.643866	Kisii	Tabaka	\N	\N	\N
721	Amaiko SDA Church	-0.7398962	34.6304662	Kisii	Tabaka	\N	\N	\N
722	SDA Church Ebikeri	-0.7357544	34.64013	Kisii	Tabaka	\N	\N	\N
723	Kisumu East SDA	-0.0905573	34.7807344	Kisumu	Kondele	\N	\N	\N
724	Better Living SDA	-0.107537	34.7560815	Kisumu	Market Milimani	\N	\N	\N
725	MCA Market Milimani Ward Office	-0.1096193	34.7519302	Kisumu	Market Milimani	\N	\N	\N
726	Migosi Seventh - Day Adventist Church	-0.0727317	34.777359	Kisumu	Migosi	\N	\N	\N
727	NYALENDA WESTERN SDA CHURCH	-0.1182392	34.7609394	Kisumu	Nyalenda B	\N	\N	\N
728	Seventh Day Adventist Church Kisumu South	-0.1240721	34.7510837	Kisumu	Nyalenda B	\N	\N	\N
729	Seventh Day Adventist Church New Life	-0.1172999	34.7610779	Kisumu	Nyalenda B	\N	\N	\N
730	Nyalenda Estate	-0.1247513	34.7547433	Kisumu	Nyalenda B	\N	\N	\N
731	Seventh Day Adventist Church Dunga	-0.1325909	34.7427692	Kisumu	Nyalenda B	\N	\N	\N
732	West Kenya Union HQs, Seventh-Day Adventist Church	-0.0667266	34.7597254	Kisumu	Railways	\N	\N	\N
733	Victory SDA Church	-0.0718482	34.7733903	Kisumu	Railways	\N	\N	\N
734	NEW KISUMU RAILWAY STATION	-0.085818	34.757978	Kisumu	Railways	\N	\N	\N
735	Airport SDA Church	-0.0725877	34.7346737	Kisumu	Railways	\N	\N	\N
736	West Kenya Union Conference	-0.066756	34.7593386	Kisumu	Railways	\N	\N	\N
737	Kisumu Central Church	-0.0954172	34.7665331	Kisumu	Shaurimoyo Kaloleni	\N	\N	\N
738	Kaloleni Shaurimoyo Ward Office	-0.1012106	34.7712527	Kisumu	Shaurimoyo Kaloleni	\N	\N	\N
739	SDA Shaurimoyo church	-0.0965979	34.7696466	Kisumu	Shaurimoyo Kaloleni	\N	\N	\N
740	NATIONAL HOUSING CORPORATION HOUSES, SHAURI MOYO	-0.0925012	34.7707077	Kisumu	Shaurimoyo Kaloleni	\N	\N	\N
741	Victory SDA Church	-0.0967788	34.7637644	Kisumu	Shaurimoyo Kaloleni	\N	\N	\N
742	Obwolo SDA church	-0.0478166	34.7925618	Kisumu	Kajulu	\N	\N	\N
743	Mamboleo Harvest SDA Church	-0.0577847	34.7866923	Kisumu	Kajulu	\N	\N	\N
744	Gita sda church	-0.0282884	34.7922874	Kisumu	Kajulu	\N	\N	\N
745	Riverside SDA Church	-0.0574971	34.8016891	Kisumu	Kajulu	\N	\N	\N
746	Maranatha Faith Assemblies	-0.0584585	34.7868689	Kisumu	Kajulu	\N	\N	\N
747	Odeso SDA Church	-0.1255691	34.8066478	Kisumu	Kolwa Central	\N	\N	\N
748	Bethlehem SDA Church	-0.1237586	34.7924906	Kisumu	Kolwa Central	\N	\N	\N
749	Bethlehem SDA Church -Nyamasaria	-0.1191581	34.7900574	Kisumu	Kolwa Central	\N	\N	\N
750	Nairobi Ndogo SDA Church	-0.0849691	34.8006297	Kisumu	Kolwa Central	\N	\N	\N
751	SDA Nyamasaria Church	-0.1114291	34.7870569	Kisumu	Kolwa Central	\N	\N	\N
752	Nyalunya SDA Church	-0.1143167	34.8026432	Kisumu	Kolwa Central	\N	\N	\N
753	KIBOS EAST SDA CHURCH	-0.0778248	34.8401067	Kisumu	Kolwa East	\N	\N	\N
754	Kibos SDA Church	-0.0737728	34.8181703	Kisumu	Kolwa East	\N	\N	\N
755	GoodNews SDA Church	-0.0863186	34.7876351	Kisumu	Manyatta 'B'	\N	\N	\N
756	Seventh - Day Adventist Church Kenya - Re	-0.073502	34.7879743	Kisumu	Manyatta 'B'	\N	\N	\N
757	K'Ombewa Home near SDA Baraka Church	-0.1008018	34.7799024	Kisumu	Manyatta 'B'	\N	\N	\N
758	Ngege Central SDA Church - Kisumu	-0.0885415	34.6922171	Kisumu	Central Kisumu	\N	\N	\N
759	kisumu command SDA church	-0.0725202	34.7096092	Kisumu	Central Kisumu	\N	\N	\N
760	KODIAGA Seventh day Adventist church	-0.066187	34.7119126	Kisumu	Central Kisumu	\N	\N	\N
761	Nawa SDA Church	-0.0884934	34.7119888	Kisumu	Central Kisumu	\N	\N	\N
762	Daraja SDA Church	-0.0405704	34.6459027	Kisumu	North West Kisumu	\N	\N	\N
763	Ojola Central SDA Church	-0.0607716	34.6454547	Kisumu	South West Kisumu	\N	\N	\N
764	Kenyaree SDA	-0.068584	34.6558342	Kisumu	South West Kisumu	\N	\N	\N
765	Sinyolo SDA Church	-0.0352936	34.6700803	Kisumu	West Kisumu	\N	\N	\N
766	Chemelil Central SDA Church	-0.0829214	35.1408012	Kisumu	Chemelil	\N	\N	\N
767	CHEMELIL ADVENTIST PRI	-0.08	35.14	Kisumu	Chemelil	\N	\N	\N
768	Ogen SDA Church	-0.0371604	35.1826986	Kisumu	Chemelil	\N	\N	\N
769	Masogo Seventh Day Adventist Church	-0.1007332	35.0049382	Kisumu	Masogo/Nyang'Oma	\N	\N	\N
770	Koru SDA Church	-0.1825207	35.2648912	Kisumu	Muhoroni/Koru	\N	\N	\N
771	Menara SDA Church	-0.1693675	35.227514	Kisumu	Muhoroni/Koru	\N	\N	\N
772	Karos SDA Church	-0.208735	35.3343369	Kisumu	Muhoroni/Koru	\N	\N	\N
773	Seventh Day Adventist Church Koisegem	-0.2328234	35.3399884	Kisumu	Muhoroni/Koru	\N	\N	\N
774	Konyuro Central SDA Church	-0.3194522	34.8789344	Kisumu	Central Nyakach	\N	\N	\N
775	Seventh-day Adventist Church- Family Life Obanda	-0.3130702	34.9367873	Kisumu	Central Nyakach	\N	\N	\N
776	Olembo SDA Church	-0.3282226	34.9419571	Kisumu	Central Nyakach	\N	\N	\N
777	Nyamarumbe SDA church	-0.2771063	34.9611055	Kisumu	North Nyakach	\N	\N	\N
778	Ng'omo SDA Church	-0.2957045	35.0150731	Kisumu	North Nyakach	\N	\N	\N
779	NYAUDO SDA CHURCH	-0.2825656	35.0019585	Kisumu	North Nyakach	\N	\N	\N
780	Obingo SDA Church	-0.2842072	35.0462168	Kisumu	North Nyakach	\N	\N	\N
781	Atoyieng'o SDA Church	-0.2747639	34.9927295	Kisumu	North Nyakach	\N	\N	\N
782	Odeyo Sda Church	-0.3059726	35.0211461	Kisumu	North Nyakach	\N	\N	\N
783	Ndori SDA Chruch	-0.3144212	35.0163305	Kisumu	North Nyakach	\N	\N	\N
784	Katito C SDA	-0.2690343	34.9761287	Kisumu	North Nyakach	\N	\N	\N
785	Omuga Sda Church	-0.2975259	34.9755058	Kisumu	North Nyakach	\N	\N	\N
786	Soi SDA Church	-0.3506585	34.9869799	Kisumu	South East Nyakach	\N	\N	\N
787	Ngege SDA church	-0.3525797	34.9982602	Kisumu	South East Nyakach	\N	\N	\N
788	Bwanda SDA Church	-0.3365829	34.9782728	Kisumu	South East Nyakach	\N	\N	\N
789	Nyawita SDA Church, Nyabondo West District. Cental Nyanza Conference.	-0.3656372	34.8458603	Kisumu	West Nyakach	\N	\N	\N
790	Bonde SDA Church	-0.3231909	34.8080016	Kisumu	West Nyakach	\N	\N	\N
791	Tableland SDA Sabbath School.	-0.3656372	34.8458603	Kisumu	West Nyakach	\N	\N	\N
792	Sangoro SDA Church	-0.3406811	34.816953	Kisumu	West Nyakach	\N	\N	\N
793	Ahero Central SDA Church	-0.1691512	34.9253201	Kisumu	Ahero	\N	\N	\N
794	Oriwo Kakola SDA Church	-0.1801711	34.9172208	Kisumu	Ahero	\N	\N	\N
795	SDA Church Othoo	-0.1456294	34.993751	Kisumu	Ahero	\N	\N	\N
796	Bunde SDA Church	-0.2135607	34.8998289	Kisumu	Ahero	\N	\N	\N
797	Awasi Seventh Day Adventist	-0.1643792	35.0712022	Kisumu	Awasi/Onjiko	\N	\N	\N
798	Awasi GOT Seventh Day Adventist	-0.1746969	35.0850777	Kisumu	Awasi/Onjiko	\N	\N	\N
799	Seventh Day Adventist Church	-0.1747456	35.0847101	Kisumu	Awasi/Onjiko	\N	\N	\N
800	Ogango SDA Church, East Kano	-0.225805	34.9846158	Kisumu	East Kano/Wawidhi	\N	\N	\N
801	Siany SDA Katito District	-0.2222848	35.0060825	Kisumu	East Kano/Wawidhi	\N	\N	\N
802	Orando Seventh-day Adventist Church	-0.0852732	34.5793314	Kisumu	East Seme	\N	\N	\N
803	Corner Stone Rodi SDA Church	-0.1185717	34.553616	Kisumu	East Seme	\N	\N	\N
804	SDA CHURCH GLORIOUS Sabbath School	-0.0801233	34.4400241	Kisumu	West Seme	\N	\N	\N
805	Glorious SDA Church (Abunga)	-0.0801021	34.4400462	Kisumu	West Seme	\N	\N	\N
806	Mount Zion SDA Church, Unyaa/Kwa Syengo	-1.3588058	37.9696824	Kitui	Kyangwithya West	\N	\N	\N
807	MIAMBANI PRI SCH	-1.2710536	38.1181584	Kitui	Miambani	\N	\N	\N
808	Kitui SDA church	-1.3689576	38.01817	Kitui	Township	\N	\N	\N
809	SDA Church	-1.3677405	38.0017476	Kitui	Township	\N	\N	\N
810	KYAMATHYAKA SDA CHURCH	-1.3750588	37.9951422	Kitui	Township	\N	\N	\N
811	Kitui Sda Sec Sch	-1.3690482	38.0178605	Kitui	Township	\N	\N	\N
812	KITUI SDA PRI SCH	-1.37118	38.0182189	Kitui	Nzambani	\N	\N	\N
813	Kawala SDA Church	-1.6832822	38.3165725	Kitui	Voo/Kyamatu	\N	\N	\N
814	Zombe SDA Church	-1.4425333	38.2510582	Kitui	Zombe/Mwitika	\N	\N	\N
815	Kabati SDA Church	-1.348031	38.22099	Kitui	Zombe/Mwitika	\N	\N	\N
816	SEKU SDA CHURCH	-1.3154516	37.7577363	Kitui	Kwavonza/Yatta	\N	\N	\N
817	SDA Katailini	-1.132838	37.7162812	Kitui	Kwavonza/Yatta	\N	\N	\N
818	MBITINI MARKET	-1.5948252	38.116741	Kitui	Mbitini	\N	\N	\N
819	Deliverance Church Mbitini, Kitui	-1.5896891	38.119919	Kitui	Mbitini	\N	\N	\N
820	Mbitini Girls High School	-1.5940534	38.1195703	Kitui	Mbitini	\N	\N	\N
821	SDA Church- Ikanga	-1.6921574	38.0563691	Kitui	Ikanga/Kyatune	\N	\N	\N
822	Ndatani Dispensary	-1.7256046	38.0763683	Kitui	Ikanga/Kyatune	\N	\N	\N
823	Sda Church Ikutha	-2.067535	38.176867	Kitui	Ikutha	\N	\N	\N
824	Seventh-day Adventist Church, Kasivuni	-1.9323653	38.386325	Kitui	Kanziko	\N	\N	\N
825	Seventh-Day Adventist Church, Mutomo	-1.8417412	38.2054345	Kitui	Mutomo	\N	\N	\N
826	Usiani Seventh Day Adventist Churh	-1.2176203	38.0530184	Kitui	Mutonguni	\N	\N	\N
827	Seventh-day Adventist Church Mwingi	-0.9151093	38.0616929	Kitui	Kivou	\N	\N	\N
828	Seventh Day Church	-1.082443	38.100763	Kitui	Migwani	\N	\N	\N
829	Kinagoni SDA Churc	-3.8689248	39.2542953	Kwale	Chengoni/Samburu	\N	\N	\N
830	Tsunza Seventh Day Adventist Church	-4.1393386	39.3180297	Kwale	Kinango	\N	\N	\N
831	Mwavumbo Secondary School	-3.8729573	39.4621074	Kwale	Mwavumbo	\N	\N	\N
832	Ndavaya	-4.2570629	39.1677026	Kwale	Ndavaya	\N	\N	\N
833	Perani SDA Church	-4.5191617	39.1852967	Kwale	Mwereni	\N	\N	\N
834	Lunga-lunga SDA Church	-4.5501026	39.1201153	Kwale	Vanga	\N	\N	\N
835	Seventh day Adventist church kombani	-4.1914502	39.5779805	Kwale	Tiwi	\N	\N	\N
836	SDA Kwale Church	-4.1724285	39.4584347	Kwale	Tsimba Golini	\N	\N	\N
837	Seventh Day Adventist Church - Ukunda Central	-4.2796832	39.5630681	Kwale	Gombato Bongwe	\N	\N	\N
838	Seventh Day Adventist Church Kinondo-Galu	-4.3523398	39.5585551	Kwale	Kinondo	\N	\N	\N
839	Ramisi Sugar Factory	-4.5309762	39.3947525	Kwale	Ramisi	\N	\N	\N
840	Diani Seventh Day Adventist Church	-4.3326925	39.5494314	Kwale	Ukunda	\N	\N	\N
841	Nanyuki central SDA Church	0.01945	37.0711341	Laikipia	Nanyuki	\N	\N	\N
842	Ngobit Secondary School	-0.1006418	36.6611999	Laikipia	Ngobit	\N	\N	\N
843	Kilimo SDA Church Nanyuki	0.0221416	37.0551034	Laikipia	Thingithu	\N	\N	\N
844	Segera Retreat	0.2501864	36.8099327	Laikipia	Segera	\N	\N	\N
845	Segera Ranch	0.1532847	36.8788381	Laikipia	Segera	\N	\N	\N
846	Gloryland SDA Rumuruti beacon	0.5550208	36.576533	Laikipia	Sosian	\N	\N	\N
847	Seventh Day Adventist Church	0.037747	36.3578242	Laikipia	Igwamiti	\N	\N	\N
848	Igwamiti Secondary School	0.0431547	36.3045539	Laikipia	Igwamiti	\N	\N	\N
849	IGWAMITI PRIMARY SCHOOL	0.0399949	36.2999571	Laikipia	Igwamiti	\N	\N	\N
850	SDA - MARMANET CHURCH	0.1390132	36.3869815	Laikipia	Marmanet	\N	\N	\N
851	Ol Jabet Seventh Day Adventist Church	0.171273	36.3839706	Laikipia	Marmanet	\N	\N	\N
852	SEVENTH DAY ADVENTIST	0.2697193	36.3546269	Laikipia	Marmanet	\N	\N	\N
853	SEVENTH DAY ADVENTIST CHURCH	0.2696981	36.3546133	Laikipia	Marmanet	\N	\N	\N
854	Saint Mark Catholic Church Ol Moran	0.5367074	36.4932133	Laikipia	Ol-Moran	\N	\N	\N
855	Rumuruti SDA Church	0.265257	36.5385619	Laikipia	Rumuruti Township	\N	\N	\N
856	SDA church	-2.3801311	40.7010479	Lamu	Bahari	\N	\N	\N
857	Hindi seventh day Adventist church	-2.1767894	40.8146311	Lamu	Hindi	\N	\N	\N
858	Sda church Lamu	-2.2780426	40.9041577	Lamu	Mkomani	\N	\N	\N
859	Kangundo SDA church	-1.2911246	37.3400181	Machakos	Kangundo Central	\N	\N	\N
860	Kangundo SDA church	-1.3055671	37.3453215	Machakos	Kangundo Central	\N	\N	\N
861	SDA kakuyuni	-1.3574525	37.3396643	Machakos	Kangundo West	\N	\N	\N
862	Kitulani seventh day adventist church	-1.6183929	37.3707522	Machakos	Kalama	\N	\N	\N
863	Seventh - Day Adventist Church: Great News,Machakos	-1.5138452	37.2624332	Machakos	Machakos Central	\N	\N	\N
864	sda church mutituni	-1.5074995	37.2649846	Machakos	Machakos Central	\N	\N	\N
865	Machakos West SDA Church	-1.5165276	37.2514327	Machakos	Mua	\N	\N	\N
866	MACHAKOS CENTRAL SEVENTH DAY ADVENTIST CHURCH	-1.4653859	37.2610003	Machakos	Mumbuni North	\N	\N	\N
867	SDA church mutituni	-1.4507715	37.2457577	Machakos	Mutituni	\N	\N	\N
868	Ekalakala Secondary School	-0.971584	37.484336	Machakos	Ekalakala	\N	\N	\N
869	SDA, ITUNDUIMUNI CHURCH	-1.0409189	37.5563541	Machakos	Ekalakala	\N	\N	\N
870	Kivaa SDA Church	-0.8582919	37.6966603	Machakos	Kivaa	\N	\N	\N
871	SDA Church Masinga Central (Seventh-day Adventist)	-1.0197064	37.7237678	Machakos	Masinga Central	\N	\N	\N
872	MOUNTAIN VIEW SDA CHURCH	-1.2951408	37.1891522	Machakos	Matungulu West	\N	\N	\N
873	Zion-Malaa SDA Church	-1.2664305	37.1299755	Machakos	Matungulu West	\N	\N	\N
874	Seventh Day Adventist Church	-1.2668894	37.3230304	Machakos	Tala	\N	\N	\N
875	Deliverance Church Tala	-1.2684214	37.3190699	Machakos	Tala	\N	\N	\N
876	Athi River Central, Seventh-Day Adventist Church.	-1.4557055	36.9710222	Machakos	Athi River	\N	\N	\N
877	Seventh-Day Adventist, Athi River East	-1.4577275	36.9908604	Machakos	Athi River	\N	\N	\N
878	Athi-river west seventh day Adventist church	-1.4440987	36.975415	Machakos	Athi River	\N	\N	\N
879	Athi River South SDA	-1.4422279	37.0014767	Machakos	Athi River	\N	\N	\N
880	CITAM Athi River.	-1.4452304	37.0048264	Machakos	Athi River	\N	\N	\N
881	County sda church	-1.4558434	36.9863986	Machakos	Athi River	\N	\N	\N
882	Athi River West	-1.4576675	36.978502	Machakos	Athi River	\N	\N	\N
883	Glory shop sda church	-1.4597611	36.9822488	Machakos	Athi River	\N	\N	\N
884	Seventh-Day Adventist Church, Kinanie	-1.4109671	37.0344351	Machakos	Kinanie	\N	\N	\N
885	Kenanie SDA church	-1.4097175	37.0339964	Machakos	Kinanie	\N	\N	\N
886	SDA SABBATH SCHOOL CHURCH MITATIN	-1.3130917	37.1432961	Machakos	Muthwani	\N	\N	\N
887	SDA CHURCH JOSKA CENTRAL	-1.3018785	37.0948441	Machakos	Muthwani	\N	\N	\N
888	Ndovoini central SDA Church	-1.35143	37.144713	Machakos	Muthwani	\N	\N	\N
889	Muthwani Secondary School	-1.410993	37.1706078	Machakos	Muthwani	\N	\N	\N
890	Agape SDA	-1.3029288	37.1215976	Machakos	Muthwani	\N	\N	\N
891	muthwani	-1.4079065	37.170743	Machakos	Muthwani	\N	\N	\N
892	Syokimau Central SDA Church	-1.3690467	36.9369615	Machakos	Syokimau/Mulolongo	\N	\N	\N
893	SDA Church Kicheko	-1.3780869	36.9407726	Machakos	Syokimau/Mulolongo	\N	\N	\N
894	SDA Church, Airport View	-1.3474946	36.9406549	Machakos	Syokimau/Mulolongo	\N	\N	\N
895	Syokimau East SDA Church	-1.3534421	36.9536192	Machakos	Syokimau/Mulolongo	\N	\N	\N
896	Syokimau SDA Parking Field	-1.3686205	36.9361602	Machakos	Syokimau/Mulolongo	\N	\N	\N
897	SDA. Church Great Hope Kicheko	-1.3592272	36.9379845	Machakos	Syokimau/Mulolongo	\N	\N	\N
898	Syokimau adventist school	-1.3687312	36.9367909	Machakos	Syokimau/Mulolongo	\N	\N	\N
899	Airportview Seventh Day Adventist Church SDA	-1.3577452	36.9290666	Machakos	Syokimau/Mulolongo	\N	\N	\N
900	Kiundwani Secondary School	-1.5241134	37.616392	Machakos	Kibauni	\N	\N	\N
901	SDA (Seventh-Day Adventist) Church Masii	-1.4647086	37.4380951	Machakos	Masii	\N	\N	\N
902	Mbiuni	-1.243643	37.4050245	Machakos	Mbiuni	\N	\N	\N
903	Catholic mission muthetheni	-1.5015071	37.5188067	Machakos	Muthetheni	\N	\N	\N
904	Muthetheni Girls Secondary School	-1.4993066	37.5240821	Machakos	Muthetheni	\N	\N	\N
905	Wamunyu	-1.413408	37.6240242	Machakos	Wamunyu	\N	\N	\N
906	Wamunyu	-1.4107089	37.5627775	Machakos	Wamunyu	\N	\N	\N
907	Ikombe	-1.2930716	37.6790928	Machakos	Ikombe	\N	\N	\N
908	Katangi Shopping Centre	-1.4077374	37.6886069	Machakos	Katangi	\N	\N	\N
909	KITHIMANI SEVENTH DAY ADVENTIST CHURCH	-1.189615	37.4571162	Machakos	Kithimani	\N	\N	\N
910	Matuu Central SDA Church	-1.1407328	37.5481284	Machakos	Matuu	\N	\N	\N
911	SDA Church Matuu	-1.1499278	37.5405413	Machakos	Matuu	\N	\N	\N
912	Ndalani Dispensary	-1.0763112	37.5001441	Machakos	Ndalani	\N	\N	\N
913	Ndalani secondary school	-1.0969301	37.486838	Machakos	Ndalani	\N	\N	\N
914	Dr Charles Mulli- Inyanzaani Secondary School	-1.096317	37.4637728	Machakos	Ndalani	\N	\N	\N
915	Kyamuoso SDA Church	-1.8321677	37.4387477	Makueni	Ilima	\N	\N	\N
916	SDA CHURCH MUSALALA	-1.7596288	37.4046899	Makueni	Ilima	\N	\N	\N
917	Sda Church Ukia	-1.765014	37.5056176	Makueni	Ukia	\N	\N	\N
918	Catholic Church, Mtito Andei	-2.6945301	38.1711033	Makueni	Mtito Andei	\N	\N	\N
919	Mtito Andei Branch	-2.6882282	38.1653138	Makueni	Mtito Andei	\N	\N	\N
920	The Church of Jesus Christ of Latter-day Saints	-2.6881917	38.1651528	Makueni	Mtito Andei	\N	\N	\N
921	Mtito Andei Primary School	-2.6943368	38.1708839	Makueni	Mtito Andei	\N	\N	\N
922	SEVENTH DAY ADVENTIST CHURCH	-2.5260943	38.0317163	Makueni	Thange	\N	\N	\N
923	Masimba-Emali SDA	-2.079689	37.4731352	Makueni	Emali/Mulala	\N	\N	\N
924	Seventh day Adventist Church (emali)	-2.0866687	37.4689492	Makueni	Emali/Mulala	\N	\N	\N
925	Kikumini SDA Church	-2.0840734	37.4753583	Makueni	Emali/Mulala	\N	\N	\N
926	Seventh Day Adventist	-2.4056381	37.9705037	Makueni	Kikumbulyu South	\N	\N	\N
927	Makindu Seventh Day Adventist Church	-2.2769201	37.8177307	Makueni	Makindu	\N	\N	\N
928	Mukaa	-1.8346636	37.3272814	Makueni	Mukaa	\N	\N	\N
929	Mathemba SDA Church	-1.879997	37.7517099	Makueni	Kathonzweni	\N	\N	\N
930	kwakavisi SDA church	-2.0035253	37.7112759	Makueni	Kathonzweni	\N	\N	\N
931	A.I.C Mwisa, Kathonzweni South D.C.C, Makueni	-1.9529806	37.7162706	Makueni	Kathonzweni	\N	\N	\N
932	Kathonzweni	-1.9131016	37.7317411	Makueni	Kathonzweni	\N	\N	\N
933	Mavindini SDA Church	-1.8191245	37.7934584	Makueni	Mavindini	\N	\N	\N
934	Makutano SDA Church	-1.8608145	37.7776866	Makueni	Mavindini	\N	\N	\N
935	Katithi SDA Church	-1.8152677	37.8197797	Makueni	Mavindini	\N	\N	\N
936	Kalamba Africa Inland Church	-1.8691442	37.512908	Makueni	Nzaui/Kilili/Kalamba	\N	\N	\N
937	Nzaui mountain	-1.879418	37.5305662	Makueni	Nzaui/Kilili/Kalamba	\N	\N	\N
938	AIC Kalamba Dispensary	-1.8665838	37.5130427	Makueni	Nzaui/Kilili/Kalamba	\N	\N	\N
939	SDA Church Wote Great News	-1.7806598	37.6207749	Makueni	Wote	\N	\N	\N
940	SDA Church - Wote Central	-1.7798519	37.6301654	Makueni	Wote	\N	\N	\N
941	Road to Great News SDA Church, Wote	-1.7797895	37.6192642	Makueni	Wote	\N	\N	\N
942	Seventh Day Adventist Church Wote Main	-1.797238	37.6262961	Makueni	Wote	\N	\N	\N
943	SDA Kanyenyoni	-1.5732311	37.4652809	Makueni	Kiteta/Kisau	\N	\N	\N
944	Uiini SDA	-1.566067	37.4748882	Makueni	Kiteta/Kisau	\N	\N	\N
945	Kitandini Sda Church	-1.6470642	37.5096131	Makueni	Kiteta/Kisau	\N	\N	\N
946	Kitundu (SDA) Dispensary	-1.6866231	37.4802269	Makueni	Kithungo/Kitundu	\N	\N	\N
947	SEVENTH DAY ADVENTIST CHURCH (SDA) KILYUNGI	-1.6743005	37.4593288	Makueni	Kithungo/Kitundu	\N	\N	\N
948	Kithuiani SDA church	-1.6611793	37.4733889	Makueni	Kithungo/Kitundu	\N	\N	\N
949	Kinyasye SDA church	-1.6669571	37.4721622	Makueni	Kithungo/Kitundu	\N	\N	\N
950	Mutitu SDA Church	-1.6579484	37.4508962	Makueni	Mbooni	\N	\N	\N
951	Nzaini SDA Church	-1.6226921	37.4560489	Makueni	Mbooni	\N	\N	\N
952	Ikondeni seventh Day Adventist church	-1.6624364	37.4469674	Makueni	Mbooni	\N	\N	\N
953	Mukondeni SDA	-1.6684121	37.4541087	Makueni	Mbooni	\N	\N	\N
954	MUTITU SDA Primary	-1.66	37.45	Makueni	Mbooni	\N	\N	\N
955	Ikondeni seventh Day ay Adventist church	-1.6624364	37.4469674	Makueni	Mbooni	\N	\N	\N
956	Mutitu SDA Secondary	-1.658471	37.4521809	Makueni	Mbooni	\N	\N	\N
957	WINZENI SDA CHURCH	-1.6356693	37.4484994	Makueni	Mbooni	\N	\N	\N
958	Uvaa SDA	-1.6632921	37.4178001	Makueni	Mbooni	\N	\N	\N
959	Mutitu Adventist Teacher's College	-1.6595913	37.4520305	Makueni	Mbooni	\N	\N	\N
960	Mutitu SDA church	-1.662347	37.4568958	Makueni	Mbooni	\N	\N	\N
961	Nthaani Seventh Day Adventist Church	-1.6046915	37.4263091	Makueni	Tulimani	\N	\N	\N
962	Wambuli SDA church	-1.5854085	37.3785853	Makueni	Tulimani	\N	\N	\N
963	KALAWANI SDA CHURCH	-1.5923709	37.4345563	Makueni	Tulimani	\N	\N	\N
964	Musoa SDA Church	-1.6015199	37.4471037	Makueni	Tulimani	\N	\N	\N
965	katunda sda church	-1.5640125	37.4040871	Makueni	Tulimani	\N	\N	\N
966	SDA Church,Kiambwani	-1.5956699	37.3984374	Makueni	Tulimani	\N	\N	\N
967	Musoa SDA Dispensary	-1.6015267	37.447108	Makueni	Tulimani	\N	\N	\N
968	Banisa Boarding Primary School	3.943276	40.3472821	Mandera	Banissa	\N	\N	\N
969	Mandera County Assembly	3.9404755	41.863752	Mandera	Township	\N	\N	\N
970	Rural Agency For Community Development And Assistance (Racida)	3.933443	41.869964	Mandera	Township	\N	\N	\N
971	Mandera Secondary School	3.935724	41.8550838	Mandera	Township	\N	\N	\N
973	Rhamu Dimtu	3.9810273	40.9990597	Mandera	Rhamu-Dimtu	\N	\N	\N
974	DANDU NURSING HOME LIMITED	3.4884173	39.8784831	Mandera	Dandu	\N	\N	\N
975	Lagsure Dispensary	3.5834903	40.1862129	Mandera	Lagsure	\N	\N	\N
976	Loyangalani seventh day adventist church	2.7586812	36.7110459	Marsabit	Loiyangalani	\N	\N	\N
977	Heillu Dispensary	3.518878	39.0736799	Marsabit	Heillu/Manyatta	\N	\N	\N
978	Manyatta Dispensary	3.518878	39.0736799	Marsabit	Heillu/Manyatta	\N	\N	\N
979	North Catholic Mission	3.3227946	37.0715326	Marsabit	North Horr	\N	\N	\N
980	SDA CHURCH MARSABIT	2.3354966	37.9943453	Marsabit	Marsabit Central	\N	\N	\N
981	Marsabit Seventh Day Adventist Church	2.3396751	37.9850898	Marsabit	Marsabit Central	\N	\N	\N
982	SDA Church - Rugusu	0.1425036	37.494753	Meru	Kibirichia	\N	\N	\N
983	SDA Church Thumburi	0.1861199	37.5086318	Meru	Kibirichia	\N	\N	\N
984	Naari Sda Church	0.1035668	37.5615987	Meru	Kiirua/Naari	\N	\N	\N
985	KIIRUA SDA BOARDING PRI	0.13	37.58	Meru	Kiirua/Naari	\N	\N	\N
986	Seventh Day Adventist KIIRUA CENTRAL	0.1152613	37.5595201	Meru	Kiirua/Naari	\N	\N	\N
987	SEVENTH DAY ADVENTIST CHURCH GITIMENE	0.0751715	37.5882703	Meru	Kiirua/Naari	\N	\N	\N
988	Kirukuru SDA	0.2002423	37.5641096	Meru	Kiirua/Naari	\N	\N	\N
989	Kirukuru SDA church	0.0924884	37.5587814	Meru	Kiirua/Naari	\N	\N	\N
990	Mbuju SDA church	0.1345126	37.3787487	Meru	Kisima	\N	\N	\N
991	SDA MARITATI	0.0902519	37.3212031	Meru	Kisima	\N	\N	\N
992	SDA Timau Church	0.075182	37.2288046	Meru	Timau	\N	\N	\N
993	Gatimbi Seventh day church(sda)	-0.0087558	37.6623322	Meru	Abothuguchi Central	\N	\N	\N
994	Abothuguchi Secondary School	-0.0199636	37.6480896	Meru	Abothuguchi Central	\N	\N	\N
995	Athiru Ruujine Sda Academy	0.3055461	37.9676754	Meru	Athiru Ruujine	\N	\N	\N
996	Mangala sda church	0.2425165	38.0526899	Meru	Igembe East	\N	\N	\N
997	Nthambiro SDA church	0.2579415	38.0270397	Meru	Igembe East	\N	\N	\N
998	Mpinda sda church	0.2766484	38.0326519	Meru	Igembe East	\N	\N	\N
999	SDA CHURCH KAWIRU	0.2934425	38.0050469	Meru	Igembe East	\N	\N	\N
1000	Kiina Meru Sda church	0.3147907	38.1849769	Meru	Igembe East	\N	\N	\N
1001	MUUTINE SDA PRY SCH	0.29	37.9	Meru	Njia	\N	\N	\N
1002	Njia Boys Secondary School	0.2963328	37.8966208	Meru	Njia	\N	\N	\N
1003	Seventh day adventist church mailitatu	0.2723195	37.9353634	Meru	Njia	\N	\N	\N
1004	BUATHINE SDA	0.300952	37.903975	Meru	Njia	\N	\N	\N
1005	Seventh day Adventist church - MURINGENE	0.2771722	37.9095728	Meru	Njia	\N	\N	\N
1006	Antubetwe SDA Church	0.3395402	38.0845695	Meru	Antubetwe Kiongo	\N	\N	\N
1007	SDA KAMBIA PRY SCH	0.3799767	37.9500037	Meru	Naathu	\N	\N	\N
1008	Muthara SDA Church	0.3882128	37.9452485	Meru	Naathu	\N	\N	\N
1009	Ntunene Girls Secondary School	0.3264802	37.9329825	Meru	Ntunene	\N	\N	\N
1010	Seventh Day Adventist Church, Kirindine	0.1763094	37.9380541	Meru	Akachiu	\N	\N	\N
1011	Riaki	0.1872847	37.9192672	Meru	Akachiu	\N	\N	\N
1012	Antubochiu Seventh-Day Adventist Church	0.216141	37.9422516	Meru	Kiegoi/Antubochiu	\N	\N	\N
1013	Maua Central Seventh day Adventist Church (SDA)	0.2391796	37.9414448	Meru	Maua	\N	\N	\N
1014	SDA MAUA CENTRAL CHURCH	0.2325853	37.9413741	Meru	Maua	\N	\N	\N
1015	GK Meru Prison SDA Church	0.0510536	37.6462437	Meru	Municipality	\N	\N	\N
1016	SDA MWITERIA	0.0377303	37.6780303	Meru	Ntima East	\N	\N	\N
1017	Meru Central SEVENTH DAY ADVENTIST CHURCH	0.043242	37.6549875	Meru	Ntima East	\N	\N	\N
1018	SDA NEKEF OFFICES	0.0165425	37.6985461	Meru	Ntima East	\N	\N	\N
1019	Gitwiki Seventh Day Adventist Church	0.0436737	37.6349987	Meru	Ntima West	\N	\N	\N
1020	Igoji SDA Church	-0.1973008	37.7055731	Meru	Igoji East	\N	\N	\N
1021	Mitunguu SDA Church	-0.1110901	37.7746703	Meru	Mitunguu	\N	\N	\N
1022	Nkubu Sda Church	-0.055824	37.6561604	Meru	Nkuene	\N	\N	\N
1023	SDA Church - Mikinduri	0.1189138	37.832814	Meru	Mikinduri	\N	\N	\N
1024	SDA Church - Karachine	0.1998408	37.8076882	Meru	Muthara	\N	\N	\N
1025	Akithi Girls Secondary School	0.1853164	37.7620508	Meru	Akithii	\N	\N	\N
1026	Kandebene sda church	0.3029439	37.6536265	Meru	Athwana	\N	\N	\N
1027	Miathene SDA Church	0.1499922	37.7823428	Meru	Kianjai	\N	\N	\N
1028	Mwithu SDA Church	0.1123576	37.7360805	Meru	Nkomo	\N	\N	\N
1029	Got Central SDA Church	-0.8204542	34.5405201	Migori	Central Sakwa	\N	\N	\N
1030	kokuro central sda church	-0.8540073	34.5347012	Migori	Central Sakwa	\N	\N	\N
1031	Holo Central Seventh-Day Adventist Church	-0.8452811	34.5551871	Migori	Central Sakwa	\N	\N	\N
1032	Kabola SDA Church	-0.8335226	34.5416184	Migori	Central Sakwa	\N	\N	\N
1033	Dago Kokuro SDA Church	-0.8541294	34.541963	Migori	Central Sakwa	\N	\N	\N
1034	Ranjira SDA church awendo	-0.8967672	34.5096146	Migori	Central Sakwa	\N	\N	\N
1035	Ranen SDA	-0.8407853	34.5604533	Migori	North Sakwa	\N	\N	\N
1036	Omung'i SDA Church	-0.7547795	34.5343739	Migori	North Sakwa	\N	\N	\N
1037	Manyuanda sda church	-0.8609355	34.5652985	Migori	North Sakwa	\N	\N	\N
1038	Nyakuru SDA Church	-0.7857918	34.510522	Migori	North Sakwa	\N	\N	\N
1039	Minyatta SDA Church	-0.8258972	34.5583839	Migori	North Sakwa	\N	\N	\N
1040	Ranen Got SDA	-0.859291	34.5650893	Migori	North Sakwa	\N	\N	\N
1041	Ranen South SDA Church	-0.8468904	34.5610503	Migori	North Sakwa	\N	\N	\N
1042	Awendo South SDA Church	-0.9146298	34.5270186	Migori	South Sakwa	\N	\N	\N
1043	Mulo SDA Church	-0.9522492	34.5973269	Migori	South Sakwa	\N	\N	\N
1044	Sonysugar south SDA church	-0.9018475	34.5347597	Migori	South Sakwa	\N	\N	\N
1045	Angaga SDA Church	-0.9809248	34.6144218	Migori	South Sakwa	\N	\N	\N
1046	Dier Aora Seventh-day Adventist Church	-0.9591015	34.6014637	Migori	South Sakwa	\N	\N	\N
1047	Seventh Day Adventist Church Awendo East	-0.9115344	34.5335946	Migori	South Sakwa	\N	\N	\N
1048	Sere Kogelo SDA Church	-0.9038315	34.5699293	Migori	South Sakwa	\N	\N	\N
1049	Sony SDA	-0.8952766	34.5394767	Migori	South Sakwa	\N	\N	\N
1050	Bongu SDA Church	-0.9387201	34.5780023	Migori	South Sakwa	\N	\N	\N
1051	Awendo East Sda	-0.9226658	34.525323	Migori	South Sakwa	\N	\N	\N
1052	Kwoyo SDA Church	-0.9095166	34.5836902	Migori	South Sakwa	\N	\N	\N
1053	Radienya SDA Church	-0.879715	34.556246	Migori	South Sakwa	\N	\N	\N
1054	Ombasa Central SDA church	-0.8312329	34.5134245	Migori	West Sakwa	\N	\N	\N
1055	Siruti Seventh Day Adventist Church	-0.8823552	34.5044813	Migori	West Sakwa	\N	\N	\N
1056	Rabondo SDA Church	-0.8392096	34.4872377	Migori	West Sakwa	\N	\N	\N
1057	Ntimaru SDA Church	-1.3363064	34.6864352	Migori	Ntimaru West	\N	\N	\N
1058	Seventh Day Adventist Nyabhikongori	-1.2539567	34.6095445	Migori	Nyabasi West	\N	\N	\N
1059	Kebarisia Sda Central Church	-1.2689037	34.619513	Migori	Nyabasi West	\N	\N	\N
1060	Komotobo SDA Church	-1.2786037	34.6213005	Migori	Nyabasi West	\N	\N	\N
1061	SDA Igena Church	-1.1977584	34.6170186	Migori	Bukira East	\N	\N	\N
1062	SDA Kehancha Central	-1.1879506	34.6243234	Migori	Bukira East	\N	\N	\N
1063	nyamaharaga SDA	-1.239449	34.4749622	Migori	Isibania	\N	\N	\N
1064	Nyamaraga south sda church	-1.2405785	34.4811595	Migori	Isibania	\N	\N	\N
1065	Seventh Day Adventist Church Nybikaye	-1.2317294	34.4856985	Migori	Isibania	\N	\N	\N
1066	Mabera SDA Church	-1.1636819	34.4442602	Migori	Tagare	\N	\N	\N
1067	T.M.I. Cental SDA Church	-1.0639232	34.2311772	Migori	Kaler	\N	\N	\N
1068	Jordan SDA Church	-1.049669	34.2285776	Migori	Kaler	\N	\N	\N
1069	chamachichi sda church	-1.0635162	34.2219622	Migori	Kaler	\N	\N	\N
1070	DUNGA SDA CHURCH	-1.0936606	34.2439009	Migori	Kaler	\N	\N	\N
1071	Seventh Day Adventist Church	-0.9695799	34.2857052	Migori	Macalder/Kanyarwanda	\N	\N	\N
1072	Got Kogile SDA Church	-0.9711175	34.2574417	Migori	Macalder/Kanyarwanda	\N	\N	\N
1073	Muhuru central sda church	-0.9970753	34.1008215	Migori	Muhuru	\N	\N	\N
1074	Tagache sda	-0.9989397	34.0961632	Migori	Muhuru	\N	\N	\N
1075	Senye SDA Church	-0.9986948	34.0910456	Migori	Muhuru	\N	\N	\N
1076	Seventh day Adventist church - Tagache	-1.0158877	34.1280569	Migori	Muhuru	\N	\N	\N
1077	NDIWA CENTRAL SDA CHURCH	-0.8940522	34.2888931	Migori	North Kadem	\N	\N	\N
1078	OGANGA SDA CHURCH	-0.9116922	34.2418211	Migori	North Kadem	\N	\N	\N
1079	Lwanda Magwar SDA Church	-0.8727957	34.1958587	Migori	North Kadem	\N	\N	\N
1080	Seventh-Day Adventist Church Lake Victoria Field Sota Rangenya	-0.8692757	34.251551	Migori	North Kadem	\N	\N	\N
1081	Nyangaga SDA Church	-0.9450246	34.2390667	Migori	North Kadem	\N	\N	\N
1082	Obware SDA Church	-0.8573898	34.2394012	Migori	North Kadem	\N	\N	\N
1083	kamagambo SDA church	-0.7394568	34.6278732	Migori	Central Kamagambo	\N	\N	\N
1084	Nyandiwa sda church kamagambo	-0.7550693	34.6060014	Migori	Central Kamagambo	\N	\N	\N
1085	Seventh Day Adventist Church-Rongo Central	-0.7571762	34.5970532	Migori	Central Kamagambo	\N	\N	\N
1086	Koderobara SDA Church	-0.7641713	34.6125256	Migori	Central Kamagambo	\N	\N	\N
1087	Matagaro SDA Church	-0.7532841	34.6194555	Migori	Central Kamagambo	\N	\N	\N
1088	Living Hope SDA Church	-0.7542796	34.6011469	Migori	Central Kamagambo	\N	\N	\N
1089	Nyarombo SDA Church	-0.7658321	34.5957651	Migori	Central Kamagambo	\N	\N	\N
1090	SDA. CHURCH WAMANYA	-0.7235708	34.5918867	Migori	East Kamagambo	\N	\N	\N
1091	MBUGRU SDA CHURCH	-0.735168	34.5730089	Migori	East Kamagambo	\N	\N	\N
1092	Kanyadgiro SDA Church	-0.725429	34.6230078	Migori	East Kamagambo	\N	\N	\N
1093	SDA Church	-0.6926158	34.5579242	Migori	East Kamagambo	\N	\N	\N
1094	Kameji SDA Church	-0.669631	34.6333338	Migori	North Kamagambo	\N	\N	\N
1095	Nyamgingo Church	-0.6764667	34.6130714	Migori	North Kamagambo	\N	\N	\N
1096	Dengu SDA Church	-0.6501194	34.6099838	Migori	North Kamagambo	\N	\N	\N
1097	Oboke Seventh-day Adventist Church	-0.6494986	34.5880199	Migori	North Kamagambo	\N	\N	\N
1098	Minyenya SDA Church	-0.6918999	34.6138421	Migori	North Kamagambo	\N	\N	\N
1099	Kanyimach SDA Church	-0.9191743	34.6075165	Migori	South Kamagambo	\N	\N	\N
1100	Ongo Central SDA Church	-0.9106675	34.6081064	Migori	South Kamagambo	\N	\N	\N
1101	Kanga SDA	-0.8128614	34.5900142	Migori	South Kamagambo	\N	\N	\N
1102	Dago Kogelo SDA Church	-0.8558656	34.5801873	Migori	South Kamagambo	\N	\N	\N
1103	Siany Kogelo SDA Church	-0.924214	34.5867178	Migori	South Kamagambo	\N	\N	\N
1104	DUDU SDA CHURCH	-0.8008371	34.597591	Migori	South Kamagambo	\N	\N	\N
1105	Ngope SDA Church & Kindergarten	-0.9358387	34.6114014	Migori	South Kamagambo	\N	\N	\N
1106	Orembe SDA Church	-0.9172893	34.5932767	Migori	South Kamagambo	\N	\N	\N
1107	Kibos SDA Church	-0.9049929	34.5877993	Migori	South Kamagambo	\N	\N	\N
1108	Alara Dip SDA Church	-1.0694375	34.5149375	Migori	God Jope	\N	\N	\N
1109	blessed one ministries	-1.0704562	34.5111827	Migori	God Jope	\N	\N	\N
1110	Sare Got SDA Church	-1.0746385	34.5206751	Migori	God Jope	\N	\N	\N
1111	Dago SDA church	-1.0400867	34.3834373	Migori	Kakrao	\N	\N	\N
1112	Migori South SDA Church	-1.0837263	34.4697216	Migori	Suna Central	\N	\N	\N
1113	Kadika SDA Church	-1.0778416	34.4823663	Migori	Suna Central	\N	\N	\N
1114	Onyalo SDA Church	-1.0463608	34.478423	Migori	Suna Central	\N	\N	\N
1115	New Life SDA Church, Migori.	-1.0509398	34.4764108	Migori	Suna Central	\N	\N	\N
1116	MILIMANI SDA CHURCH	-1.062195	34.4782436	Migori	Suna Central	\N	\N	\N
1117	OMBO SDA CHURCH	-1.074984	34.4745744	Migori	Suna Central	\N	\N	\N
1118	Migori West SDA CHURCH	-1.0647857	34.4621923	Migori	Ragana-Oruba	\N	\N	\N
1119	Ragana SDA	-1.077868	34.464222	Migori	Ragana-Oruba	\N	\N	\N
1120	Ragana Central SDA CHURCH	-1.0901432	34.4579469	Migori	Ragana-Oruba	\N	\N	\N
1121	SDA Church Migori Central	-1.0731866	34.4677295	Migori	Ragana-Oruba	\N	\N	\N
1122	RAGANA MALO SDA CHURCH	-1.0937745	34.457255	Migori	Ragana-Oruba	\N	\N	\N
1123	Migori East SDA Church	-1.0853574	34.4625966	Migori	Ragana-Oruba	\N	\N	\N
1124	Oruba Got SDA Church	-1.0579751	34.443759	Migori	Ragana-Oruba	\N	\N	\N
1125	Ramoya SDA Church	-1.0668108	34.3885501	Migori	Wasweta Ii	\N	\N	\N
1126	Nyailinga RC SDA Church.	-1.0821418	34.4051397	Migori	Wasweta Ii	\N	\N	\N
1127	Migori Sota SDA Church	-0.9977849	34.3255402	Migori	Wiga	\N	\N	\N
1128	Winyaduong SDA Church	-0.9492722	34.5000519	Migori	Central Kanyamkago	\N	\N	\N
1129	MARAM ROMBE SDA CHURCH	-0.9414861	34.4977724	Migori	Central Kanyamkago	\N	\N	\N
1130	Tie Liech SDA Church	-1.0363511	34.5881696	Migori	East Kanyamkago	\N	\N	\N
1131	Arambe Seventh Day Adventist Church	-1.0357281	34.5703711	Migori	East Kanyamkago	\N	\N	\N
1132	Tie Liech Seventh Day Adventist Church	-1.0422642	34.5891496	Migori	East Kanyamkago	\N	\N	\N
1133	Korondo SDA Church	-0.9933212	34.477044	Migori	South Kanyamkago	\N	\N	\N
1134	NYARAGO SDA CHURCH	-0.9435383	34.5172565	Migori	South Kanyamkago	\N	\N	\N
1135	Oyani (SDA) Dispensary	-0.9517037	34.4459608	Migori	West Kanyamkago	\N	\N	\N
1136	Got Ogengo SDA Church	-0.9180385	34.3632714	Migori	West Kanyamkago	\N	\N	\N
1137	Gogo SDA Church	-0.9040996	34.3419132	Migori	West Kanyamkago	\N	\N	\N
1138	Voice of Hope SDA church	-0.9521532	34.4420073	Migori	West Kanyamkago	\N	\N	\N
1139	Seventh Day Adventist chaani GoodNews	-4.0349176	39.6246709	Mombasa	Chaani	\N	\N	\N
1140	MOMBASA WEST CENTRAL CHURCH	-4.0282404	39.6261454	Mombasa	Chaani	\N	\N	\N
1141	Corner CHAANI SDA CLINIC	-4.037396	39.6207264	Mombasa	Chaani	\N	\N	\N
1142	Changamwe Baptist Child Development Center	-4.0208447	39.6274817	Mombasa	Changamwe	\N	\N	\N
1143	Changamwe Secondary School	-4.0260613	39.6319508	Mombasa	Changamwe	\N	\N	\N
1144	Africa Inland Church	-4.0236666	39.6310684	Mombasa	Changamwe	\N	\N	\N
1145	Seventh - Day Adventist Church	-4.036923	39.6118148	Mombasa	Port Reitz	\N	\N	\N
1146	SDA Church Bomu	-4.0303642	39.6127793	Mombasa	Port Reitz	\N	\N	\N
1147	Seventh Day Adventist Church-Misufini Good news.	-3.9958691	39.5771648	Mombasa	Jomvu Kuu	\N	\N	\N
1148	Jomvu Methodist Church	-3.9871144	39.6107077	Mombasa	Jomvu Kuu	\N	\N	\N
1149	AIC JOMVU	-3.9964898	39.599646	Mombasa	Jomvu Kuu	\N	\N	\N
1150	Seventhday Adventist Church	-3.993972	39.591215	Mombasa	Jomvu Kuu	\N	\N	\N
1151	Jomvu Parish Church	-3.99858	39.6065865	Mombasa	Jomvu Kuu	\N	\N	\N
1152	Seventh Day Adventist Church - Mikindani	-4.0075094	39.6329292	Mombasa	Mikindani	\N	\N	\N
1153	Seventh-day Adventist Church - Good News Mikindani	-4.0039893	39.6240521	Mombasa	Mikindani	\N	\N	\N
1154	Laos SDA Church, Mikindani	-3.99617	39.631837	Mombasa	Mikindani	\N	\N	\N
1155	Bamburi North Seventh Day Adventist church	-3.9890292	39.7053775	Mombasa	Bamburi	\N	\N	\N
1157	SDA Church Mshomoroni West	-4.0187392	39.6779163	Mombasa	Junda	\N	\N	\N
1158	Nyali West SDA Church	-4.0269665	39.6753004	Mombasa	Junda	\N	\N	\N
1159	Seventh Day Adventist Church	-3.997358	39.682795	Mombasa	Junda	\N	\N	\N
1160	Golden Gate Seventh Day Adventist Church	-4.013192	39.6821	Mombasa	Junda	\N	\N	\N
1161	SDA HOLY GHOST SALVATION CHURCH MOMBASA BRANCH	-4.0176949	39.6873948	Mombasa	Magogoni	\N	\N	\N
1162	Mishomoroni Great News SDA	-4.0239564	39.6827137	Mombasa	Mjambere	\N	\N	\N
1163	SDA Church Mwakirunge	-3.93736	39.66688	Mombasa	Mwakirunge	\N	\N	\N
1164	KIMBUNGA SDA CHURCH	-3.9704664	39.6874864	Mombasa	Mwakirunge	\N	\N	\N
1165	Seventhday Adventist Church	-3.9683379	39.7353833	Mombasa	Shanzu	\N	\N	\N
1166	Seventh-day Adventist Church Serena	-3.9625258	39.7501421	Mombasa	Shanzu	\N	\N	\N
1167	Shimo La Tewa Greatnews SDA Church	-3.9623405	39.7388225	Mombasa	Shanzu	\N	\N	\N
1168	SDA, ZIMLAT GREAT NEWS SDA	-3.9771472	39.726702	Mombasa	Shanzu	\N	\N	\N
1169	Majaoni Good News SDA Church	-3.9671198	39.7224237	Mombasa	Shanzu	\N	\N	\N
1170	Utange Family Life SDA Church	-3.9740765	39.7266064	Mombasa	Shanzu	\N	\N	\N
1171	SDA Church Likoni Main	-4.0913727	39.6445684	Mombasa	Likoni	\N	\N	\N
1172	Seventh Day Adventist Church - Mtongwe	-4.084922	39.636401	Mombasa	Mtongwe	\N	\N	\N
1173	Shika adabu secondary school	-4.106286	39.634544	Mombasa	Shika Adabu	\N	\N	\N
1174	SHIKAADABU PRI SCHOOL	-4.1162198	39.6374521	Mombasa	Shika Adabu	\N	\N	\N
1175	Shika Adabu Fire Station	-4.1114327	39.6387371	Mombasa	Shika Adabu	\N	\N	\N
1176	Masjid Swafa Shika Adabu	-4.111831	39.6461475	Mombasa	Shika Adabu	\N	\N	\N
1177	Shika Adabu	-4.1219143	39.6466552	Mombasa	Shika Adabu	\N	\N	\N
1178	Likoni Goodnews Sda	-4.0933438	39.650776	Mombasa	Timbwani	\N	\N	\N
1179	Seventh-day Adventist Church - Ujamaa	-4.1045458	39.6432804	Mombasa	Timbwani	\N	\N	\N
1180	Miritini SDA	-4.0547394	39.6636371	Mombasa	Majengo	\N	\N	\N
1181	sda CHURCH KIZINGO	-4.0703353	39.6682418	Mombasa	Mji Wa Kale/Makadara	\N	\N	\N
1182	Family Life SDA Church	-4.048852	39.6694512	Mombasa	Tononoka	\N	\N	\N
1183	Ziwani SDA Church	-4.0436782	39.6635466	Mombasa	Tononoka	\N	\N	\N
1184	Shimo la TEWA SDA Church	-4.0434771	39.6682065	Mombasa	Tononoka	\N	\N	\N
1186	Seventh Day Adventist Church,Ufuoni	-4.0412009	39.6699848	Mombasa	Tononoka	\N	\N	\N
1187	Tudor Cliff SDA	-4.0325113	39.6587132	Mombasa	Tudor	\N	\N	\N
1188	SDA, KENYA COAST FIELD	-4.00377	39.7030217	Mombasa	Kadzandani	\N	\N	\N
1189	Bamburi great news Seventh - Day Adventist Church	-4.0037553	39.7029705	Mombasa	Kadzandani	\N	\N	\N
1190	Ngomeni SDA Church	-4.0200263	39.6967188	Mombasa	Kadzandani	\N	\N	\N
1191	Kongowea SDA. Church	-4.0406594	39.6875236	Mombasa	Kongowea	\N	\N	\N
1192	Nyali Hills SDA Church	-4.0384914	39.6963062	Mombasa	Kongowea	\N	\N	\N
1193	Nyali SDA church	-4.0521018	39.6890531	Mombasa	Mkomani	\N	\N	\N
1194	MTOPANGA GREAT SDA CHURCH	-4.050822	39.6849599	Mombasa	Mkomani	\N	\N	\N
1195	Kidogo Basi SDA Church	-4.0328481	39.6932723	Mombasa	Ziwa La Ng'Ombe	\N	\N	\N
1196	Seventh Day Adventist Church	-4.0261577	39.7010383	Mombasa	Ziwa La Ng'Ombe	\N	\N	\N
1197	Chomo Seventh Day Adventist Church	-0.8839853	36.8825399	Murang'a	Gatanga	\N	\N	\N
1198	Ithanga Secondary School	-1.0096633	37.3481607	Murang'a	Ithanga	\N	\N	\N
1199	Seventhday Adventist church Kiganjo	-0.8846407	36.8733747	Murang'a	Kariara	\N	\N	\N
1200	Kigio SDA Church	-0.9738124	36.987194	Murang'a	Mugumo-Ini	\N	\N	\N
1201	Seventh-day Adventist church Githumu	-0.8231919	36.9064448	Murang'a	Ruchu	\N	\N	\N
1202	Kanyenyaini Tea Factory	-0.6793423	36.9160268	Murang'a	Kanyenya-Ini	\N	\N	\N
1203	Seventh Day Adventist Church - Gatangara	-0.6845566	36.9635129	Murang'a	Muguru	\N	\N	\N
1204	Seventh Day Adventist Church Kangema	-0.6821747	36.9551459	Murang'a	Muguru	\N	\N	\N
1205	Rwathia Girls Secondary School	-0.6656807	36.9182052	Murang'a	Rwathia	\N	\N	\N
1206	Kagwathi Sda Church	-0.8625174	37.079418	Murang'a	Kahumbu	\N	\N	\N
1207	Kagwathi SDA Primary School	-0.8615	37.0797195	Murang'a	Kahumbu	\N	\N	\N
1208	GAKARATI SDA CHURCH	-0.872022	37.1349322	Murang'a	Kahumbu	\N	\N	\N
1209	MBOGOINI SDA CHURCH	-0.8595905	37.0978776	Murang'a	Kahumbu	\N	\N	\N
1210	Kagwathi Sda Dispensary	-0.862374	37.0788361	Murang'a	Kahumbu	\N	\N	\N
1211	Kangari Central SDA Church	-0.7826102	36.8805692	Murang'a	Kangari	\N	\N	\N
1212	Mairi SDA church	-0.7729888	36.8286482	Murang'a	Kangari	\N	\N	\N
1213	Muthithi SDA	-0.8413289	37.0913176	Murang'a	Muthithi	\N	\N	\N
1214	seventh day church	-0.7038461	37.1816573	Murang'a	Mbiri	\N	\N	\N
1215	Kahatia SDA Church	-0.7360789	36.9288923	Murang'a	Murarandia	\N	\N	\N
1216	Murarandia Dispensary	-0.7316882	36.9218584	Murang'a	Murarandia	\N	\N	\N
1217	Seventh-day Adventist Church Murang'a	-0.723336	37.1628197	Murang'a	Township	\N	\N	\N
1218	SDA Church, Glory Land Muranga	-0.7220774	37.1532364	Murang'a	Township	\N	\N	\N
1219	seventh day adventist	-0.7113941	37.0319624	Murang'a	Wangu	\N	\N	\N
1220	SDA CHURCH MARAGUA	-0.8073497	37.1397515	Murang'a	Ichagaki	\N	\N	\N
1221	Maragua central sda church	-0.7983676	37.1284806	Murang'a	Ichagaki	\N	\N	\N
1222	SDA CHURCH IGIKIRO	-0.8187313	37.1851049	Murang'a	Kamahuha	\N	\N	\N
1223	Kenol Highway SDA Church	-0.9332664	37.1250074	Murang'a	Kimorori/Wempa	\N	\N	\N
1224	Marura sda church	-0.8685032	37.1889433	Murang'a	Makuyu	\N	\N	\N
1225	Gathera SDA Church	-0.7837492	37.0441449	Murang'a	Nginda	\N	\N	\N
1226	Nginda Girls' High School	-0.7898858	37.0862464	Murang'a	Nginda	\N	\N	\N
1227	Kiriaini SDA Church	-0.600115	36.9568678	Murang'a	Kamacharia	\N	\N	\N
1228	SEVENTH DAY ADVENTIST	-0.6087724	36.862405	Murang'a	Kiru	\N	\N	\N
1229	SDA Church Kamitha Central	-1.2771836	36.758788	Nairobi	Gatina	\N	\N	\N
1230	Kamitha Central Seventh-Day Adventist church	-1.2805329	36.7572691	Nairobi	Gatina	\N	\N	\N
1231	Seventh-day Adventist Church Kangemi East	-1.274367	36.7500653	Nairobi	Gatina	\N	\N	\N
1233	SDA Church - Gloryland	-1.2585506	36.7909145	Nairobi	Kileleshwa	\N	\N	\N
1234	Newlife SDA Church	-1.2937666	36.807738	Nairobi	Kilimani	\N	\N	\N
1235	Nairobi Central SDA Church	-1.2889816	36.8076987	Nairobi	Kilimani	\N	\N	\N
1236	East Kenya Union Conference	-1.2887519	36.8081649	Nairobi	Kilimani	\N	\N	\N
1237	Seventh Day Adventist Church East African Union-Millimani Rd	-1.2887406	36.8082049	Nairobi	Kilimani	\N	\N	\N
1238	Lavington SDA Church	-1.2905735	36.764296	Nairobi	Kilimani	\N	\N	\N
1239	Sda Church-East Africa Union	-1.288951	36.8077058	Nairobi	Kilimani	\N	\N	\N
1240	Kilimani Springs SDA Church	-1.2672244	36.763198	Nairobi	Kilimani	\N	\N	\N
1241	Adventist LMS Guest House & Conference Centre	-1.2889516	36.8086272	Nairobi	Kilimani	\N	\N	\N
1242	Family Fellowship Sabbath School	-1.2954848	36.7810257	Nairobi	Kilimani	\N	\N	\N
1243	Satellite Newlife SDA Church	-1.2825718	36.739567	Nairobi	Kabiro	\N	\N	\N
1244	SDA CHURCH KAWANGWARE	-1.2879058	36.7515102	Nairobi	Kawangware	\N	\N	\N
1245	Kawangware Adventist School	-1.2851908	36.7510601	Nairobi	Kawangware	\N	\N	\N
1246	Cornerstone SDA Church	-1.2752893	36.7407266	Nairobi	Kawangware	\N	\N	\N
1247	Kirigu SDA church.	-1.2872026	36.6952061	Nairobi	Mutu-Ini	\N	\N	\N
1248	PCEA Mutu-ini Church	-1.2905132	36.6992904	Nairobi	Mutu-Ini	\N	\N	\N
1249	Dagoretti Central SDA Church	-1.2952191	36.7500493	Nairobi	Ngando	\N	\N	\N
1250	Riruta East SDA church	-1.2984151	36.7416661	Nairobi	Ngando	\N	\N	\N
1251	Sacred Heart Ngando	-1.301809	36.7430709	Nairobi	Ngando	\N	\N	\N
1252	SDA Church Riruta Satellite	-1.287237	36.7346651	Nairobi	Riruta	\N	\N	\N
1253	Kianda	-1.2872335	36.734665	Nairobi	Riruta	\N	\N	\N
1254	Seventh Day Adventist Church Uthiru (SDA)	-1.2625731	36.7160649	Nairobi	Uthiru/Ruthimitu	\N	\N	\N
1255	SDA Church Great Hope Uthiru	-1.2673996	36.7141692	Nairobi	Uthiru/Ruthimitu	\N	\N	\N
1256	SDA Church Waithaka	-1.2837476	36.716222	Nairobi	Waithaka	\N	\N	\N
1257	Sunshine SDA Church	-1.273637	36.9138999	Nairobi	Kayole Central	\N	\N	\N
1258	Sda church thawabu	-1.2790956	36.9164277	Nairobi	Kayole Central	\N	\N	\N
1259	Kingsman voyage limited	-1.2679618	36.9207761	Nairobi	Kayole North	\N	\N	\N
1260	Soweto sda	-1.2794228	36.9143093	Nairobi	Kayole South	\N	\N	\N
1261	Soweto Sda Church	-1.2857926	36.914429	Nairobi	Kayole South	\N	\N	\N
1262	Patanisho sda Church	-1.2805003	36.9108046	Nairobi	Kayole South	\N	\N	\N
1263	Tumaini SDA Church	-1.2627919	36.9167946	Nairobi	Komarock	\N	\N	\N
1264	Saika West Sda Church Kwa miti	-1.2604544	36.9101689	Nairobi	Komarock	\N	\N	\N
1265	SDA Church Embakasi Central	-1.3029956	36.9128375	Nairobi	Embakasi	\N	\N	\N
1266	Seventh Day Adventist Church-Embakasi Mradi	-1.316935	36.9112391	Nairobi	Embakasi	\N	\N	\N
1267	SDA Embakasi Garrison	-1.3053594	36.9174097	Nairobi	Embakasi	\N	\N	\N
1268	JKIA CENTRAL SDA CHURCH	-1.3335186	36.8932884	Nairobi	Embakasi	\N	\N	\N
1269	Mihango	-1.2681645	36.9461967	Nairobi	Mihango	\N	\N	\N
1270	SDA	-1.2855742	36.946239	Nairobi	Mihango	\N	\N	\N
1271	SDA Utawala Central	-1.2814728	36.9699834	Nairobi	Mihango	\N	\N	\N
1272	SDA	-1.2681887	36.9462051	Nairobi	Mihango	\N	\N	\N
1273	UTAWALA SATELLITE SDA CHURCH	-1.2803889	36.9639637	Nairobi	Mihango	\N	\N	\N
1274	Seventh Day Adventist Church - Skyway	-1.268635	36.9637503	Nairobi	Mihango	\N	\N	\N
1275	Eden Springs SDA Church	-1.2768134	36.9795361	Nairobi	Mihango	\N	\N	\N
1276	Donholm SDA Church	-1.2932491	36.9022295	Nairobi	Upper Savannah	\N	\N	\N
1277	Umoja II SDA Church	-1.2840476	36.90262	Nairobi	Upper Savannah	\N	\N	\N
1278	Seventh-Day Adventist Church Dandora Central	-1.2434807	36.9000097	Nairobi	Dandora Area Ii	\N	\N	\N
1279	Dandora 4 SDA Church	-1.2417401	36.9055952	Nairobi	Dandora Area Iii	\N	\N	\N
1280	Dandora Terminus SDA Church	-1.2442864	36.9092111	Nairobi	Dandora Area Iv	\N	\N	\N
1281	SDA Church Kariobangi	-1.2576101	36.8783535	Nairobi	Kariobangi North	\N	\N	\N
1282	Kariobangi Adventist	-1.2566028	36.880897	Nairobi	Kariobangi North	\N	\N	\N
1283	SDA Church Gitathuru	-1.2512957	36.8843586	Nairobi	Kariobangi North	\N	\N	\N
1284	Seventh Day Adventist Church	-1.3208091	36.8857444	Nairobi	Kwa Njenga	\N	\N	\N
1285	Imara Daima SDA Church	-1.3210355	36.8854707	Nairobi	Kwa Njenga	\N	\N	\N
1286	SDA church kwa Reuben	-1.3135945	36.8720424	Nairobi	Kwa Reuben	\N	\N	\N
1287	Kware Central SDA Church	-1.3158086	36.889287	Nairobi	Kware	\N	\N	\N
1288	SDA Church Good news Kware (Quarry)	-1.3137604	36.8880308	Nairobi	Kware	\N	\N	\N
1289	Seventh Day Adventist Church Pipeline	-1.3105555	36.8919476	Nairobi	Pipeline	\N	\N	\N
1290	Seventh Day Adventist, Kariobangi South Church	-1.2631566	36.8855322	Nairobi	Kariobangi South	\N	\N	\N
1291	SDA MOWLEM	-1.2657814	36.9009547	Nairobi	Mowlem	\N	\N	\N
1292	Seventh Day Adventist Church Umoja 1	-1.2834184	36.8900332	Nairobi	Umoja Ii	\N	\N	\N
1293	Eastleigh SDA Church	-1.2759445	36.8470233	Nairobi	Eastleigh North	\N	\N	\N
1294	Seventh Day Adventist Church	-1.2759261	36.8469784	Nairobi	Eastleigh North	\N	\N	\N
1295	Green Valley SDA Church	-1.2218999	36.925999	Nairobi	Clay City	\N	\N	\N
1296	Kenya Queen Cabs	-1.2119893	36.9108383	Nairobi	Clay City	\N	\N	\N
1297	Kenhut SDA church	-1.2216013	36.9175541	Nairobi	Clay City	\N	\N	\N
1298	Sportsview SDA church-Kasarani	-1.2234016	36.9030513	Nairobi	Kasarani	\N	\N	\N
1299	Seventh-Day Adventist Church, Chieko	-1.2350479	36.92245	Nairobi	Kasarani	\N	\N	\N
1300	Seventh Day Adventist - Sports View Church	-1.2234027	36.903057	Nairobi	Kasarani	\N	\N	\N
1301	Valley-View SDA Church	-1.2302505	36.9139619	Nairobi	Kasarani	\N	\N	\N
1302	Sunton seventh day Adventist churches found	-1.224386	36.913781	Nairobi	Kasarani	\N	\N	\N
1303	Seventh Day Adventist Church Kasarani	-1.2329498	36.9305181	Nairobi	Mwiki	\N	\N	\N
1304	Mwiki SDA Church	-1.2308852	36.9315678	Nairobi	Mwiki	\N	\N	\N
1305	Seventh-Day Adventist Church Maji Mazuri	-1.2286323	36.9268498	Nairobi	Mwiki	\N	\N	\N
1306	CITY MISSION SEVENTH DAY ADVENTIST CHURCH	-1.2331022	36.9392124	Nairobi	Mwiki	\N	\N	\N
1307	Njiru APCC. Church	-1.2468619	36.9373206	Nairobi	Njiru	\N	\N	\N
1308	Saika Central SDA Church	-1.2534848	36.9146994	Nairobi	Njiru	\N	\N	\N
1309	DORKS SDA CHURCH	-1.2507218	36.9263065	Nairobi	Njiru	\N	\N	\N
1310	HIGH LIFE SDA CHURCH	-1.2504723	36.9270917	Nairobi	Njiru	\N	\N	\N
1311	Ruai Township Seventh Day Adventist (SDA) Church	-1.2740347	36.9922079	Nairobi	Ruai	\N	\N	\N
1312	SDA Ruai Central Church	-1.2546076	37.0059764	Nairobi	Ruai	\N	\N	\N
1313	Seventh Day Adventist Church-Greenview Ruai	-1.2635452	36.9892208	Nairobi	Ruai	\N	\N	\N
1314	Northview SDA Church	-1.2767403	37.0272605	Nairobi	Ruai	\N	\N	\N
1315	Mashimoni SDA Church	-1.3095271	36.791371	Nairobi	Laini Saba	\N	\N	\N
1316	Seventh Day Adventist Church	-1.309501	36.8118344	Nairobi	Nyayo Highrise	\N	\N	\N
1317	Kibera SDA Church	-1.3121163	36.7801368	Nairobi	Sarangombe	\N	\N	\N
1318	SDA Church	-1.3120386	36.7855059	Nairobi	Sarangombe	\N	\N	\N
1319	Jamhuri SDA Church	-1.3082109	36.772122	Nairobi	Sarangombe	\N	\N	\N
1320	SDA. Church, Karen Community	-1.3728886	36.7611987	Nairobi	Karen	\N	\N	\N
1321	Karen Springs Seventh day Adventist Church	-1.3306883	36.7303722	Nairobi	Karen	\N	\N	\N
1322	Oasis Seventh-day Adventist Church, Karen	-1.3272251	36.7183323	Nairobi	Karen	\N	\N	\N
1323	Karengata SDA Church	-1.3419516	36.7644972	Nairobi	Karen	\N	\N	\N
1324	Cooperative University SDA Church	-1.3675164	36.7283386	Nairobi	Karen	\N	\N	\N
1325	JKUAT Karen SDA church	-1.3562203	36.7403686	Nairobi	Karen	\N	\N	\N
1326	Nairobi West SDA Church	-1.3175965	36.8097605	Nairobi	Nairobi West	\N	\N	\N
1327	Christ Forever Ministers -Nairobi	-1.3085876	36.8229369	Nairobi	Nairobi West	\N	\N	\N
1328	SDA church Upper hill springs	-1.3039738	36.821253	Nairobi	Nairobi West	\N	\N	\N
1329	Nairobi South sda Church	-1.3127956	36.8242154	Nairobi	South C	\N	\N	\N
1330	Nairobi South SDA Church Parking.	-1.3127944	36.8242089	Nairobi	South C	\N	\N	\N
1331	Jericho Seventh Day Adventist	-1.2871138	36.8712298	Nairobi	Harambee	\N	\N	\N
1332	Makadara sda church	-1.2927654	36.8730875	Nairobi	Maringo/Hamza	\N	\N	\N
1333	Seventh-day Adventist Church, Nairobi East NESDAC	-1.2985067	36.8809487	Nairobi	Viwandani	\N	\N	\N
1334	HURUMA SDA Church	-1.2549942	36.8727996	Nairobi	Huruma	\N	\N	\N
1335	SDA CHURCH NGEI	-1.2587519	36.8712039	Nairobi	Huruma	\N	\N	\N
1336	Baraka SDA Church	-1.1986081	36.9062906	Nairobi	Githurai	\N	\N	\N
1337	Kahawa West SDA Church	-1.1856405	36.8986043	Nairobi	Kahawa	\N	\N	\N
1338	SDA CHURCH KAHAWA KONGO	-1.188304	36.9094155	Nairobi	Kahawa	\N	\N	\N
1339	Seventh Day Adventist Church	-1.1852305	36.8977926	Nairobi	Kahawa	\N	\N	\N
1340	Kahawa Tumaini Seventh Day Adventist Church	-1.1783494	36.9080799	Nairobi	Kahawa West	\N	\N	\N
1341	Seventh Day Adventist Church Roysambu	-1.214336	36.8876772	Nairobi	Roysambu	\N	\N	\N
1342	SDA Church	-1.2158519	36.8888702	Nairobi	Roysambu	\N	\N	\N
1343	RO SDA	-1.2141501	36.8876742	Nairobi	Roysambu	\N	\N	\N
1344	Seventh Day Adventist Church Zimmerman	-1.2050326	36.899683	Nairobi	Zimmerman	\N	\N	\N
1345	Great Hope SDA Zimmerman	-1.2053185	36.9023916	Nairobi	Zimmerman	\N	\N	\N
1346	Seventh Day Adventist Church, Great Hope	-1.205305	36.9023422	Nairobi	Zimmerman	\N	\N	\N
1347	BABA DOGO SDA CHURCH	-1.2379547	36.8842249	Nairobi	Baba Dogo	\N	\N	\N
1348	SDA Church, Korogocho Sabbath School	-1.2507529	36.8916909	Nairobi	Korogocho	\N	\N	\N
1349	Seventh Day Adventist Church, Korogocho S. S.	-1.2504147	36.8908776	Nairobi	Korogocho	\N	\N	\N
1350	Lucky Summer SDA church	-1.2373689	36.8992143	Nairobi	Lucky Summer	\N	\N	\N
1351	Lucky Summer Central SDA. Church	-1.2402095	36.8935865	Nairobi	Lucky Summer	\N	\N	\N
1352	Seventh - Day Adventist Church Mathare North	-1.2496282	36.8741502	Nairobi	Mathare North	\N	\N	\N
1353	SDA Church Mathare North School	-1.2476605	36.8731714	Nairobi	Mathare North	\N	\N	\N
1354	Kcau sda Church - Main Campus Nairobi	-1.2534872	36.8595685	Nairobi	Utalii	\N	\N	\N
1355	Seventh Day Adventist Church, University Of Nairobi (UONSDA)	-1.2790382	36.8177826	Nairobi	Nairobi Central	\N	\N	\N
1356	SDA JOSKA CENTRAL	-1.2920659	36.8219462	Nairobi	Nairobi Central	\N	\N	\N
1357	Green Valley SDA Church Nairobi	-1.2920659	36.8219462	Nairobi	Nairobi Central	\N	\N	\N
1358	Sda Hiltop	-1.2829417	36.8248292	Nairobi	Nairobi Central	\N	\N	\N
1359	Zebra SDA Church, Utawala	-1.2920659	36.8219462	Nairobi	Nairobi Central	\N	\N	\N
1360	Hazina seventh day adventist church	-1.3141681	36.8489407	Nairobi	Nairobi South	\N	\N	\N
1361	Seventh Day Adventist Church - Parklands (Parklands SDA Church)	-1.2699705	36.8226865	Nairobi	Ngara	\N	\N	\N
1362	Africa Inland Church- Ziwani	-1.2795148	36.8380282	Nairobi	Ziwani/Kariokor	\N	\N	\N
1363	Seventh - Day Adventist Church Kangemi Central	-1.267643	36.7532746	Nairobi	Kangemi	\N	\N	\N
1364	Kangemi SDA church and school	-1.2701594	36.7524721	Nairobi	Kangemi	\N	\N	\N
1365	Karura Sda Church Sch - Sec	-1.225589	36.780761	Nairobi	Karura	\N	\N	\N
1366	Karura Adventist church	-1.2244442	36.781486	Nairobi	Karura	\N	\N	\N
1367	KARURA SDA CHURCH SCH - PRI	-1.2200785	36.7800172	Nairobi	Karura	\N	\N	\N
1368	SDA Central Kenya Conference HQ Office	-1.2233088	36.7820879	Nairobi	Karura	\N	\N	\N
1369	Karura Sda Dispensary	-1.2237285	36.7812941	Nairobi	Karura	\N	\N	\N
1370	Karura sda school Men's dorm	-1.2269775	36.7798996	Nairobi	Karura	\N	\N	\N
1371	Kitisuru SDA Church	-1.2430119	36.7614608	Nairobi	Kitisuru	\N	\N	\N
1372	Seventh-Day Church HighRidge	-1.2548082	36.8228852	Nairobi	Parklands/Highridge	\N	\N	\N
1373	AIC KABATINI CHURCH	-0.2151149	36.1662003	Nakuru	Kabatini	\N	\N	\N
1374	PCEA Church Kabatini	-0.2152745	36.1625805	Nakuru	Kabatini	\N	\N	\N
1375	Kiamunyi Central SDA Church	-0.2618256	36.0175832	Nakuru	Kiamaina	\N	\N	\N
1376	Kiamaina Secondary School	-0.2289572	36.1175327	Nakuru	Kiamaina	\N	\N	\N
1377	Sda Hesima	-0.2442692	36.1112289	Nakuru	Kiamaina	\N	\N	\N
1378	Kiamunyi Central Seventh-day Adventist Church	-0.2683196	36.0188592	Nakuru	Kiamaina	\N	\N	\N
1379	Nakuru Umoja SDA Church	-0.2737942	36.1609236	Nakuru	Lanet/Umoja	\N	\N	\N
1380	Seventh Day Adventist Church Ndimu Nakuru	-0.30687	36.1726076	Nakuru	Lanet/Umoja	\N	\N	\N
1381	Deliverance Church Umoja Lanet	-0.2795971	36.1592635	Nakuru	Lanet/Umoja	\N	\N	\N
1382	Church Of God 7th Day (Umoja, Lanet)	-0.2645002	36.1699612	Nakuru	Lanet/Umoja	\N	\N	\N
1383	Lanet Umoja Primary	-0.2703838	36.1646075	Nakuru	Lanet/Umoja	\N	\N	\N
1384	Lanet Umoja Community Network	-0.2703875	36.164611	Nakuru	Lanet/Umoja	\N	\N	\N
1385	GILGIL CENTRAL SDA CHURCH	-0.5091833	36.3176735	Nakuru	Gilgil	\N	\N	\N
1386	Gilgil Angaza SDA	-0.4902017	36.3198029	Nakuru	Gilgil	\N	\N	\N
1387	Victory SDA Church	-0.4896428	36.3352323	Nakuru	Gilgil	\N	\N	\N
1388	Moto SDA church	-0.2478467	35.7205985	Nakuru	Sirikwa	\N	\N	\N
1389	Keringet Central SDA Church	-0.4267273	35.6883387	Nakuru	Keringet	\N	\N	\N
1390	Emitiot SDA Church	-0.4260665	35.6901841	Nakuru	Keringet	\N	\N	\N
1391	Kiptagich SDA Church	-0.5835615	35.6105083	Nakuru	Kiptagich	\N	\N	\N
1392	Mwangaza Main SDA Church	-0.273292	35.732431	Nakuru	Turi	\N	\N	\N
1393	St Andrew's School, Turi	-0.2783716	35.7639232	Nakuru	Turi	\N	\N	\N
1394	Maranatha SDA Church	-0.786789	36.444995	Nakuru	Hells Gate	\N	\N	\N
1395	SEVENTH DAY ADVENTIST CHURCH SANCTUARY	-0.798095	36.4349452	Nakuru	Hells Gate	\N	\N	\N
1396	Karai Seventh Day Adventist Church	-0.7602927	36.4779085	Nakuru	Hells Gate	\N	\N	\N
1397	Maai-Mahiu Main SDA Church	-0.988252	36.5959285	Nakuru	Mai Mahiu	\N	\N	\N
1398	Maai-Mahiu West SDA Church	-0.9765533	36.5755633	Nakuru	Mai Mahiu	\N	\N	\N
1399	SDA Church	-0.9981505	36.5372675	Nakuru	Mai Mahiu	\N	\N	\N
1400	Newlife SDA Church Maai Mahiu	-1.0008988	36.5573048	Nakuru	Mai Mahiu	\N	\N	\N
1401	SDA GOVERNOR MARANATHA	-0.9588405	36.5460236	Nakuru	Mai Mahiu	\N	\N	\N
1402	KINAMBA SDA CHURCH NAIVASHA	-0.7193663	36.4777574	Nakuru	Naivasha East	\N	\N	\N
1403	Nakuru Central SDA Church	-0.292409	36.0780767	Nakuru	Biashara	\N	\N	\N
1404	sda NAKURU SOUTH CHURCH	-0.2857699	36.0863856	Nakuru	Biashara	\N	\N	\N
1405	Central Rift Valley Conference	-0.2915409	36.0782438	Nakuru	Biashara	\N	\N	\N
1406	Seventh Day Adventist Church	-0.2915964	36.0777597	Nakuru	Biashara	\N	\N	\N
1407	Pangani SDA	-0.3097012	36.0719499	Nakuru	Flamingo	\N	\N	\N
1408	Seventh-day Adventist Church Racetrack	-0.3098586	36.0716379	Nakuru	Flamingo	\N	\N	\N
1409	Seventh Day Adventist Church,LangaLanga	-0.303363	36.0755756	Nakuru	Flamingo	\N	\N	\N
1410	Seventh-Day Adventist Church	-0.298407	36.0908925	Nakuru	Kivumbini	\N	\N	\N
1411	Crater Sda Church	-0.2932377	36.0664147	Nakuru	London	\N	\N	\N
1412	SDA Church	-0.274728	36.0580116	Nakuru	London	\N	\N	\N
1413	Deliverance Church, London	-0.2708929	36.0575824	Nakuru	London	\N	\N	\N
1414	SDA CHURCH ELIMU	-0.2660209	36.1053849	Nakuru	Menengai	\N	\N	\N
1415	SEVENT-DAY ADVENTIST CHURCH KITI NAKURU KENYA	-0.2717803	36.1117437	Nakuru	Menengai	\N	\N	\N
1416	Whitehouse Seventh-day Adventist Church	-0.2720178	36.0998091	Nakuru	Menengai	\N	\N	\N
1417	SDA Kiratina Church Nakuru	-0.2840664	36.1289209	Nakuru	Menengai	\N	\N	\N
1418	Seventh Day Adventist Church-Free Area	-0.2940944	36.12252	Nakuru	Nakuru East	\N	\N	\N
1419	LANETSOUTH SDA CHURCH	-0.3046952	36.1445213	Nakuru	Nakuru East	\N	\N	\N
1420	Pipeline Seventh Day Adventist Church	-0.3165241	36.1395285	Nakuru	Nakuru East	\N	\N	\N
1421	Barut SDA Church	-0.3257827	36.0526942	Nakuru	Barut	\N	\N	\N
1422	SDA Sabbath School, Kelelwet	-0.3483693	36.0376043	Nakuru	Barut	\N	\N	\N
1423	SDA CHURCH Mogoon	-0.3148401	36.034693	Nakuru	Kapkures	\N	\N	\N
1424	Kiamunyi East SDA	-0.2706526	36.038139	Nakuru	Kaptembwo	\N	\N	\N
1425	Hilton Seventh day Adventist church Nakuru	-0.2738228	36.049957	Nakuru	Kaptembwo	\N	\N	\N
1426	Seventh-Day Adventist Church	-0.2703791	36.0381641	Nakuru	Kaptembwo	\N	\N	\N
1427	Nakuru West SDA Church	-0.300557	36.0612773	Nakuru	Shaabab	\N	\N	\N
1428	Angaza Kaptembwo SDA Church	-0.2981547	36.0454214	Nakuru	Shaabab	\N	\N	\N
1429	Mau utalii sda	-0.6055243	36.007764	Nakuru	Mau Narok	\N	\N	\N
1430	SDA, Njoro Central Church	-0.3233327	35.9434468	Nakuru	Njoro	\N	\N	\N
1431	Seventh Day Adventist Church, Njoro New Life	-0.3417975	35.9520515	Nakuru	Njoro	\N	\N	\N
1432	Proposed Nyonjoro SDA Church Grounds	-0.3721309	35.9478869	Nakuru	Njoro	\N	\N	\N
1433	Egerton Seventh-Day Adventist Church	-0.3786295	35.9469301	Nakuru	Njoro	\N	\N	\N
1434	Egerton University SDA Church	-0.3664607	35.9331097	Nakuru	Njoro	\N	\N	\N
1435	Sunrise Egerton SDA Church	-0.3946325	35.9460183	Nakuru	Njoro	\N	\N	\N
1436	Ngata Central SDA Church	-0.2491709	35.9855346	Nakuru	Menengai West	\N	\N	\N
1437	Ngata Gate SDA	-0.2522341	35.9748065	Nakuru	Mosop	\N	\N	\N
1438	SEVENTH DAY ADVENTIST CHURCH EXODUS NAKURU KENYA	-0.2390918	35.8958262	Nakuru	Mosop	\N	\N	\N
1439	SEVENTH DAY ADVENTIST - SUBUKIA CENTRAL	-0.0064204	36.2302622	Nakuru	Subukia	\N	\N	\N
1440	Subukia sda	0.0048915	36.233769	Nakuru	Subukia	\N	\N	\N
1441	Church of Subukia Shrine	-0.0200495	36.2530002	Nakuru	Subukia	\N	\N	\N
1442	SDA CHURCH - Pilgrims of Maseno -WEI	0.0489825	36.2209408	Nakuru	Waseges	\N	\N	\N
1443	SDA Kaptarakwa Church- Subukia	0.0825211	36.2286421	Nakuru	Waseges	\N	\N	\N
1444	Kobujoi Central SDA Church	0.0602217	34.9785648	Nandi	Kobujoi	\N	\N	\N
1445	Sda Chebisas	0.0530823	34.9882754	Nandi	Kobujoi	\N	\N	\N
1446	Ndurio SDA Church	0.0249261	35.0298071	Nandi	Koyo-Ndurio	\N	\N	\N
1447	SDA Baraton Central Church	0.2513023	35.0816749	Nandi	Chemundu/Kapng'Etuny	\N	\N	\N
1448	Chemamul SDA	0.2504399	35.0687358	Nandi	Chemundu/Kapng'Etuny	\N	\N	\N
1449	Baraton University Church	0.255071	35.0814546	Nandi	Chemundu/Kapng'Etuny	\N	\N	\N
1450	C. M SDA CHURCH- KIBIRBEI	0.2328062	35.1133129	Nandi	Chemundu/Kapng'Etuny	\N	\N	\N
1451	Kapkoros SDA Adventist Church	0.3141881	35.0238526	Nandi	Kaptel/Kamoiywo	\N	\N	\N
1452	Kamokoiywo SDA Church	0.3297774	35.093826	Nandi	Kaptel/Kamoiywo	\N	\N	\N
1453	SIRONOI SDA ACADEMY	0.31	35.1	Nandi	Kaptel/Kamoiywo	\N	\N	\N
1454	Kipsol SDA Church	0.2546758	35.0161256	Nandi	Kaptel/Kamoiywo	\N	\N	\N
1455	Tiriin-kaptel SDA	0.2947606	35.0583132	Nandi	Kaptel/Kamoiywo	\N	\N	\N
1456	Lelmokwo SDA church	0.3873649	35.1558912	Nandi	Lelmokwo/Ngechek	\N	\N	\N
1457	KAPKECHUI SDA CHURCH	0.4113365	35.1433691	Nandi	Lelmokwo/Ngechek	\N	\N	\N
1458	SDA	0.4004024	35.1372639	Nandi	Lelmokwo/Ngechek	\N	\N	\N
1459	Kapkonjusmo SDA Church AND SDA KAPKONJUSMO Comprehensive school:- DAY AND BORDING SCHOOL	0.3650182	35.1631122	Nandi	Lelmokwo/Ngechek	\N	\N	\N
1460	Mlango SDA church	0.384303	35.1823278	Nandi	Lelmokwo/Ngechek	\N	\N	\N
1461	SDA KIPSHORORI CHURCH	0.4051228	35.1486003	Nandi	Lelmokwo/Ngechek	\N	\N	\N
1462	SDA Chebigoi	0.3985938	35.1754067	Nandi	Lelmokwo/Ngechek	\N	\N	\N
1463	SDA Biribiriet	0.3925059	35.1701359	Nandi	Lelmokwo/Ngechek	\N	\N	\N
1464	KAPKONJUSMO SDA COMPREHENSIVE SCHOOL:- PRIMARY AND JUNIOR SCHOOL DAY AND BOARDING	0.37	35.16	Nandi	Lelmokwo/Ngechek	\N	\N	\N
1465	Lelboinet Seventh day Adventist Church	0.2917721	35.1958381	Nandi	Lelmokwo/Ngechek	\N	\N	\N
1466	Kimugulmet SDA Church	0.1240592	34.9544084	Nandi	Chepkumia	\N	\N	\N
1467	Kamurguywo SDA Church	0.1175918	34.9708151	Nandi	Chepkumia	\N	\N	\N
1468	KABASKEI SDA CHURCH	0.149226	34.9531967	Nandi	Chepkumia	\N	\N	\N
1469	New Koibem SDA Church	0.1604064	34.941744	Nandi	Chepkumia	\N	\N	\N
1470	KOIBEM B. SDA CHURCH	0.1617282	34.9534307	Nandi	Chepkumia	\N	\N	\N
1471	Kapsabet Central SDA Church	0.1980068	35.0999	Nandi	Kapsabet	\N	\N	\N
1472	Adventist Bookshop Centre	0.2028966	35.0998988	Nandi	Kapsabet	\N	\N	\N
1473	Namgoi SDA Church	0.198489	35.1194317	Nandi	Kapsabet	\N	\N	\N
1474	Kamobo Sda Church	0.202957	35.0978385	Nandi	Kapsabet	\N	\N	\N
1475	Emdin SDA Church	0.2015844	35.119784	Nandi	Kapsabet	\N	\N	\N
1476	Kapsabet SDA Primary School	0.1977694	35.0994927	Nandi	Kapsabet	\N	\N	\N
1477	Deliverance Church Kapsabet	0.2046395	35.1079516	Nandi	Kapsabet	\N	\N	\N
1478	Kamobo SDA	0.1938263	35.075591	Nandi	Kapsabet	\N	\N	\N
1479	CITAM Kapsabet	0.2075874	35.0982942	Nandi	Kapsabet	\N	\N	\N
1480	SDA Kilibwoni church	0.2029864	35.2247582	Nandi	Kilibwoni	\N	\N	\N
1481	SDA Church, Kapnyeberai	0.2191434	35.2608088	Nandi	Kilibwoni	\N	\N	\N
1482	Kiptenden SDA Church	0.269187	35.1988307	Nandi	Kilibwoni	\N	\N	\N
1483	Kapkilel SDA Church	0.1554767	35.1247909	Nandi	Kilibwoni	\N	\N	\N
1484	Kabongwa Seventh Day Adventist Church	0.2176907	35.1573657	Nandi	Kilibwoni	\N	\N	\N
1485	Kaplamai SDA Church	0.4288051	35.1252054	Nandi	Kabisaga	\N	\N	\N
1486	Kebulwet SDA Church	0.4605997	35.1044629	Nandi	Kabiyet	\N	\N	\N
1487	SDA Church, Kipyeshi	0.4591823	35.0115212	Nandi	Kipkaren	\N	\N	\N
1488	Kurgung SDA	0.4446946	34.9899487	Nandi	Kurgung/Surungai	\N	\N	\N
1489	Tangaratwet Sda church	0.5147718	34.9551246	Nandi	Kurgung/Surungai	\N	\N	\N
1490	NGOROIN SDA Church	0.4981761	34.9800483	Nandi	Kurgung/Surungai	\N	\N	\N
1491	KAGARWO SDA ACADEMY	0.44	35	Nandi	Kurgung/Surungai	\N	\N	\N
1492	Singore SDA Church	0.4469712	34.9620743	Nandi	Kurgung/Surungai	\N	\N	\N
1493	Sda kasarani ndalat	0.5335535	35.1343675	Nandi	Ndalat	\N	\N	\N
1494	SDA KAIGAT TOWNSHIP	0.4900557	35.1476705	Nandi	Ndalat	\N	\N	\N
1495	MARURIAT SDA CHURCH	0.5013144	35.1558326	Nandi	Ndalat	\N	\N	\N
1496	SDA NDALAT GAA	0.5082824	35.0955625	Nandi	Ndalat	\N	\N	\N
1497	KOLONGET SDA CHURCH	0.5259845	35.0951539	Nandi	Ndalat	\N	\N	\N
1498	Ngariet sda church	0.5301057	35.1498001	Nandi	Ndalat	\N	\N	\N
1499	Kapkatet SDA Church	0.487806	35.0905861	Nandi	Ndalat	\N	\N	\N
1500	AIC Sangalo, Nandi County	0.3710761	35.0312798	Nandi	Sangalo/Kebulonik	\N	\N	\N
1501	All Saints Kebulonik Academy	0.3625271	35.0414147	Nandi	Sangalo/Kebulonik	\N	\N	\N
1502	CHEPKUNYUK SDA CHURCH	0.1472304	35.2308449	Nandi	Chepkunyuk	\N	\N	\N
1503	Nandi Hills SDA Church	0.1083838	35.1835488	Nandi	Nandi Hills	\N	\N	\N
1504	Sda Junction church	0.1030468	35.1763532	Nandi	Nandi Hills	\N	\N	\N
1505	Chesuwe SDA Church	0.1507158	35.1715603	Nandi	Nandi Hills	\N	\N	\N
1506	KIBUKWO SDA CHURCH	0.1030358	35.1763216	Nandi	Nandi Hills	\N	\N	\N
1507	Kipsebwo SDA Church	0.1393859	35.1662633	Nandi	Nandi Hills	\N	\N	\N
1508	Swamp Lessos SDA Church	0.2203602	35.2877925	Nandi	Ol'Lessos	\N	\N	\N
1509	Seventh Day Adventist Church, Ollessos	0.2122664	35.3006519	Nandi	Ol'Lessos	\N	\N	\N
1510	CHEMASE DISTRICT SDA	-0.026565	35.0490019	Nandi	Chemelil/Chemase	\N	\N	\N
1511	Mombwo Seventh-day Adventist Church	-0.0973488	35.2353312	Nandi	Songhor/Soba	\N	\N	\N
1512	MARABA SEVENTH DAY ADVENTIST CHURCH	0.0043131	35.3038627	Nandi	Songhor/Soba	\N	\N	\N
1513	Setek SDA Church	0.0629035	35.281944	Nandi	Songhor/Soba	\N	\N	\N
1514	SDA Church Kibukwo	0.0496383	35.2732932	Nandi	Songhor/Soba	\N	\N	\N
1515	METEITEI SDA CHURCH	0.0043133	35.3933928	Nandi	Tindiret	\N	\N	\N
1516	Taptengelei SDA Church	0.0181075	35.3907162	Nandi	Tindiret	\N	\N	\N
1517	Kapsasian Dispensary	-1.0021896	35.1324183	Narok	Kapsasian	\N	\N	\N
1518	SDA Church RiOnyangore	-0.8934281	34.9880403	Narok	Ololmasani	\N	\N	\N
1519	Gorofa SDA Church	-0.9757382	34.9224027	Narok	Kilgoris Central	\N	\N	\N
1520	Olmelil SDA Church	-0.904886	34.9843168	Narok	Kilgoris Central	\N	\N	\N
1521	OLOIBORSOITO SDA MAIN CHURCH	-0.9998771	34.9048385	Narok	Kilgoris Central	\N	\N	\N
1522	Oldonyo rasha(olarasha) SDA	-0.9717385	34.8984334	Narok	Kilgoris Central	\N	\N	\N
1523	Olarasha SDA	-0.9927214	34.8894041	Narok	Kilgoris Central	\N	\N	\N
1524	Intamiyio Church	-0.9611748	34.9688402	Narok	Kilgoris Central	\N	\N	\N
1525	Seventh Day Adventist Church,Esoit Enaibor	-1.0871458	35.0115208	Narok	Kimintet	\N	\N	\N
1526	Lolgorien SDA church	-1.2330583	34.8111917	Narok	Lolgorian	\N	\N	\N
1527	Sda church Narok central	-1.0842307	35.8752374	Narok	Narok Town	\N	\N	\N
1528	Seventh-day Adventist Church Narok Newlife	-1.083933	35.8693079	Narok	Narok Town	\N	\N	\N
1529	Valley view SDA Church narok	-1.1095721	35.8432913	Narok	Narok Town	\N	\N	\N
1530	SDA CHURCH OLELESHWA-NAROK	-1.0839786	35.8609016	Narok	Narok Town	\N	\N	\N
1531	SDA CHURCH EMPIRIS- NAROK	-1.0897375	35.8166094	Narok	Narok Town	\N	\N	\N
1532	SEVENTH-DAY ADVENTIST(SDA) CHURCH OLERAI- NAROK	-1.1231113	35.8211855	Narok	Narok Town	\N	\N	\N
1533	Sunshine SDA Narok	-1.1096557	35.8551425	Narok	Narok Town	\N	\N	\N
1534	SDA Church Upper-hill	-1.0931391	35.8463491	Narok	Narok Town	\N	\N	\N
1535	Seventh day Adventist church - London Church Narok	-1.0727295	35.8871667	Narok	Nkareta	\N	\N	\N
1536	KISIRIRI CENTRAL SDA CHURCH	-0.8532983	35.8953367	Narok	Olorropil	\N	\N	\N
1537	Seventh day Adventist church olosiro	-0.7882479	35.8914432	Narok	Olorropil	\N	\N	\N
1538	Olposimoru SDA Church	-0.5771245	35.7453507	Narok	Olpusimoru	\N	\N	\N
1539	Loita High School	-1.8517326	35.8526428	Narok	Loita	\N	\N	\N
1540	SDA CHURCH NAROK CENTRAL	-1.3604934	35.7406413	Narok	Majimoto/Naroosura	\N	\N	\N
1541	SDA Church Olmekenyu	-0.8369341	35.6702955	Narok	Melelo	\N	\N	\N
1542	KITOTA SDA CHURCH	-1.0022972	35.6308391	Narok	Ololulung'A	\N	\N	\N
1543	Naikarra Primary School	-1.6016281	35.6661379	Narok	Naikarra	\N	\N	\N
1544	Seventh Day Adventist Church, Kiabonyoru	-0.5836462	34.9944805	Nyamira	Kiabonyoru	\N	\N	\N
1545	Nyamiranga SDA church	-0.6123562	35.0261464	Nyamira	Kiabonyoru	\N	\N	\N
1546	Riamairima SDA church	-0.6023869	35.0174796	Nyamira	Kiabonyoru	\N	\N	\N
1547	Ndurumo SDA Church	-0.5919396	34.9997096	Nyamira	Kiabonyoru	\N	\N	\N
1548	Mekenene SDA church	-0.7085102	35.0418056	Nyamira	Mekenene	\N	\N	\N
1549	Kijaur Sda Church	-0.7620795	35.0163154	Nyamira	Nyansiongo	\N	\N	\N
1550	Igoma SDA Church	-0.749294	35.0122362	Nyamira	Nyansiongo	\N	\N	\N
1551	Upper Hill SDA Church	-0.7593575	35.0140324	Nyamira	Nyansiongo	\N	\N	\N
1552	Menyenya SDA High School	-0.7658578	35.0196601	Nyamira	Nyansiongo	\N	\N	\N
1553	Riokenye SDA church	-0.7613664	35.0115899	Nyamira	Nyansiongo	\N	\N	\N
1554	MENYENYA SDA PRI	-0.76	35.02	Nyamira	Nyansiongo	\N	\N	\N
1555	Seventh-Day Adventist Church Kijauri Central	-0.7651219	35.0129959	Nyamira	Nyansiongo	\N	\N	\N
1556	Nyansakia Eyemo SDA	-0.7240257	35.0099093	Nyamira	Nyansiongo	\N	\N	\N
1557	NYASIMWAMU SDA CHURCH	-0.7301309	34.9887958	Nyamira	Nyansiongo	\N	\N	\N
1558	Ribwago SDA Church, Nyansiongo	-0.7807437	34.9889948	Nyamira	Nyansiongo	\N	\N	\N
1559	Upper Hill SDA Church	-0.7707446	35.0045373	Nyamira	Nyansiongo	\N	\N	\N
1560	Simbauti SDA Church	-0.7807552	35.0108186	Nyamira	Nyansiongo	\N	\N	\N
1561	Gachuba SDA Church and Camp Ctr	-0.7086784	34.8655766	Nyamira	Gachuba	\N	\N	\N
1562	Girango SDA Church	-0.7160083	34.8548902	Nyamira	Gachuba	\N	\N	\N
1563	Gesima Central SDA Church	-0.6891233	34.9904288	Nyamira	Gesima	\N	\N	\N
1564	GETARE SDA CHURCH, GESIMA	-0.7170805	34.9963223	Nyamira	Gesima	\N	\N	\N
1565	Gesima Central SDA Church	-0.7092181	34.9948203	Nyamira	Gesima	\N	\N	\N
1566	Nyamakoroto SDA Church	-0.6989441	34.9551996	Nyamira	Gesima	\N	\N	\N
1567	Nyankarangania SDA Church	-0.6680807	34.9548847	Nyamira	Gesima	\N	\N	\N
1568	Nyabiosi SDA Church	-0.7195977	34.9842427	Nyamira	Gesima	\N	\N	\N
1569	Nyakongo SDA church	-0.7031634	34.9914965	Nyamira	Gesima	\N	\N	\N
1570	Nyaiguta SDA Church	-0.6875699	35.0075813	Nyamira	Gesima	\N	\N	\N
1571	Machururiati SDA Church	-0.7004263	34.9309605	Nyamira	Gesima	\N	\N	\N
1572	Kiamitengi SDA Church	-0.7108778	34.9635614	Nyamira	Gesima	\N	\N	\N
1573	Riamoni Main SDA	-0.6884808	34.9763593	Nyamira	Gesima	\N	\N	\N
1574	Nyamotenenio SDA Church	-0.6863308	35.0003042	Nyamira	Gesima	\N	\N	\N
1575	Kemera Central SDA church	-0.6671834	34.8463423	Nyamira	Kemera	\N	\N	\N
1576	NYAMARE SDA CHURCH	-0.6425992	34.8298815	Nyamira	Kemera	\N	\N	\N
1577	Manga Central SDA Church	-0.6068794	34.8374865	Nyamira	Manga	\N	\N	\N
1578	Seventh Day Adventist Riomanga Church	-0.7526598	34.9513713	Nyamira	Rigoma	\N	\N	\N
1579	Siara SDA Church	-0.7214531	34.9279827	Nyamira	Rigoma	\N	\N	\N
1580	Nyamonuri SDA Church	-0.4916707	34.9449352	Nyamira	Bomwagamo	\N	\N	\N
1581	NYAMIACHO SDA CHURCH	-0.5391792	34.9486172	Nyamira	Bomwagamo	\N	\N	\N
1582	MABARIRI SDA CHURCH	-0.521863	34.935932	Nyamira	Bomwagamo	\N	\N	\N
1583	KIOGE SDA CHURCH	-0.5287244	34.9511519	Nyamira	Bomwagamo	\N	\N	\N
1584	Nyambiri sda church	-0.5042806	34.935458	Nyamira	Bomwagamo	\N	\N	\N
1585	Itibo Health Centre SDA.	-0.5585448	35.0037151	Nyamira	Itibo	\N	\N	\N
1586	Magwagwa (SDA) Dispensary	-0.4829867	35.0222208	Nyamira	Magwagwa	\N	\N	\N
1587	Magwagwa SDA Dispensary	-0.4897	35.014	Nyamira	Magwagwa	\N	\N	\N
1588	Enkinda Sda Church	-0.6482688	34.994751	Nyamira	Bogichora	\N	\N	\N
1589	Nyaboraire SDA Church	-0.6482688	34.994751	Nyamira	Bogichora	\N	\N	\N
1590	Makairo Central SDA Church	-0.6287658	34.9407821	Nyamira	Bogichora	\N	\N	\N
1591	MABUNDU SDA CHURCH	-0.5649623	34.9120325	Nyamira	Bogichora	\N	\N	\N
1592	Ri'Ontegi SDA Church	-0.63259	34.9765921	Nyamira	Bogichora	\N	\N	\N
1593	MWANGO SDA ACADEMY	-0.6	34.96	Nyamira	Bonyamatuta	\N	\N	\N
1594	Nyabite SDA Church	-0.545376	34.9225503	Nyamira	Nyamaiya	\N	\N	\N
1595	Masosa SDA church	-0.4972441	34.9041178	Nyamira	Nyamaiya	\N	\N	\N
1596	nyansaga sda church	-0.5365821	34.9230385	Nyamira	Nyamaiya	\N	\N	\N
1597	sda Church Nyamira	-0.56051	34.925757	Nyamira	Township	\N	\N	\N
1598	Tente SDA Church	-0.5761996	34.9320473	Nyamira	Township	\N	\N	\N
1599	Brown SDA Church Nyamira	-0.5570817	34.934968	Nyamira	Township	\N	\N	\N
1600	Nyairicha SDA Church	-0.5675964	34.9408384	Nyamira	Township	\N	\N	\N
1601	SDA Nyamira south	-0.5629716	34.9339397	Nyamira	Township	\N	\N	\N
1602	Nyamira SDA Conference Headquater	-0.5752037	34.9314267	Nyamira	Township	\N	\N	\N
1603	Seventh day Adventist Church - Engineer	-0.6016559	36.5683508	Nyandarua	Engineer	\N	\N	\N
1604	GITHABAI PRI SCH	-0.73	36.57	Nyandarua	Githabai	\N	\N	\N
1605	Magumu SDA Church	-0.8567682	36.5638822	Nyandarua	Magumu	\N	\N	\N
1606	TurningPoint Church, Magumu	-0.8590487	36.5628343	Nyandarua	Magumu	\N	\N	\N
1607	Seventh-day Adventist Church Ndunyu Njeru	-0.5469588	36.5590755	Nyandarua	Murungaru	\N	\N	\N
1608	SDA CHURCH - KIRARWA	-0.506877	36.528808	Nyandarua	Murungaru	\N	\N	\N
1609	Rwanyambo SDA, KAGERA-INI SUB-LOCATION, NYAKIO LOCATION	-0.7275516	36.6539184	Nyandarua	Njabini\\Kiburu	\N	\N	\N
1610	Kiburu College Seventh Day Church	-0.7347833	36.6670335	Nyandarua	Njabini\\Kiburu	\N	\N	\N
1611	Njabini (town) 7th Day Church of God	-0.7249478	36.6646307	Nyandarua	Njabini\\Kiburu	\N	\N	\N
1612	P.C.E.A Njabini Church	-0.7267491	36.6608523	Nyandarua	Njabini\\Kiburu	\N	\N	\N
1613	SDA CHURCH	-0.4411998	36.6015315	Nyandarua	Geta	\N	\N	\N
1614	SDA Church Miharati	-0.3989615	36.4897782	Nyandarua	Kipipiri	\N	\N	\N
1615	SDA Church Ndaragwa	-0.0586599	36.5345147	Nyandarua	Central	\N	\N	\N
1616	SDA Church	-0.0436664	36.5176857	Nyandarua	Central	\N	\N	\N
1617	SEVENTH DAY ADVENTIST CHURCH - MAIRO INYA/T FALLS	0.0200996	36.4082659	Nyandarua	Kiriita	\N	\N	\N
1618	Leshau Pondo	0.0428084	36.4264328	Nyandarua	Leshau/Pondo	\N	\N	\N
1619	Leshau Pondo Shopping Center	0.0765663	36.4566547	Nyandarua	Leshau/Pondo	\N	\N	\N
1620	Charagita Shopping Center	-0.1638719	36.2795899	Nyandarua	Charagita	\N	\N	\N
1621	Gatimu Dispensary	-0.0182261	36.3736619	Nyandarua	Gatimu	\N	\N	\N
1622	SDA Church Gichungo	-0.2487105	36.4346883	Nyandarua	Kaimbaga	\N	\N	\N
1623	Ufunuo Seventh Day Adventist Church	-0.2894205	36.3946994	Nyandarua	Kaimbaga	\N	\N	\N
1624	Sda	-0.2590076	36.2329652	Nyandarua	Kanjuiri Range	\N	\N	\N
1625	Seventh-day Adventist Church Ol'kalou	-0.2793803	36.3687836	Nyandarua	Karau	\N	\N	\N
1626	SDA Church Mirangine	-0.1791634	36.2386865	Nyandarua	Mirangine	\N	\N	\N
1627	SDA Church Gichungo	-0.2042961	36.4249247	Nyandarua	Rurii	\N	\N	\N
1628	Kwa Huku Church SDA CHURCH	-0.0260463	37.0640732	Nyeri	Gakawa	\N	\N	\N
1629	St. Bakhita Gataragwa Secondary School	-0.2250203	36.7611181	Nyeri	Gatarakwa	\N	\N	\N
1630	SDA Church Mbiriri	-0.3371544	37.076023	Nyeri	Kabaru	\N	\N	\N
1631	SDA church	-0.3402668	36.8619403	Nyeri	Mweiga	\N	\N	\N
1632	Mweiga Adventist Secondary School	-0.3364137	36.8942541	Nyeri	Mweiga	\N	\N	\N
1633	Endarasha SDA Church	-0.3051644	36.799694	Nyeri	Mwiyogo/Endarasha	\N	\N	\N
1634	Wendiga Dispensary	-0.2735796	36.8519377	Nyeri	Mwiyogo/Endarasha	\N	\N	\N
1635	SEVENTH DAY ADVENTIST CHURCH, NAROMORU/KANDARA	-0.1541379	37.0292132	Nyeri	Naromoru Kiamathaga	\N	\N	\N
1636	Kiamathaga Dispensary	-0.1661137	37.021246	Nyeri	Naromoru Kiamathaga	\N	\N	\N
1637	GATUAMBA SDA CHURCH	-0.2387872	37.0337712	Nyeri	Thegu River	\N	\N	\N
1638	Seventhday adventist Church karatina	-0.4794721	37.123707	Nyeri	Konyu	\N	\N	\N
1639	SDA Mukurwe-ini	-0.5576305	37.0480843	Nyeri	Mukurwe-Ini Central	\N	\N	\N
1640	Muruguru SDA	-0.4583835	37.0287903	Nyeri	Gatitu/Muruguru	\N	\N	\N
1641	Seventh Day Adventist Church Nyeri west	-0.4348026	36.9120893	Nyeri	Kamakwa/Mukaro	\N	\N	\N
1642	Nyeri Central SDA	-0.427865	36.9524833	Nyeri	Kamakwa/Mukaro	\N	\N	\N
1643	PCEA Kamakwa Church	-0.4239607	36.929762	Nyeri	Kamakwa/Mukaro	\N	\N	\N
1644	ACK KAMAKWA CHURCH	-0.4269617	36.9310855	Nyeri	Kamakwa/Mukaro	\N	\N	\N
1645	Sda	-0.3981764	36.9994305	Nyeri	Kiganjo/Mathari	\N	\N	\N
1646	Room 8 (DKUSDA)	-0.3908208	36.9580846	Nyeri	Kiganjo/Mathari	\N	\N	\N
1647	Rware Central Hotel Nyeri	-0.4200894	36.9484921	Nyeri	Rware	\N	\N	\N
1648	RWARE MEDIA SERVICES	-0.4209322	36.9488513	Nyeri	Rware	\N	\N	\N
1649	Chinga boys high school	-0.577012	36.915731	Nyeri	Chinga	\N	\N	\N
1650	CHINGA TEA FACTORY	-0.6016617	36.8982957	Nyeri	Chinga	\N	\N	\N
1651	Seventh Day Adventist Church Othaya Central	-0.5391684	36.9412413	Nyeri	Iria-Ini	\N	\N	\N
1652	Seventh-Day Adventist Othaya Central	-0.5384713	36.9412563	Nyeri	Iria-Ini	\N	\N	\N
1653	Karĩma Boys High School	-0.5205774	36.9831616	Nyeri	Karima	\N	\N	\N
1654	Karima Catholic Dispensary	-0.5503114	36.9439212	Nyeri	Karima	\N	\N	\N
1655	Mahiga Girls Secondary School	-0.5149853	36.9130648	Nyeri	Mahiga	\N	\N	\N
1656	Aguthi SDA Church	-0.5080735	37.0275736	Nyeri	Aguthi-Gaaki	\N	\N	\N
1657	Karangia SDA church	-0.4964731	36.9004846	Nyeri	Wamagana	\N	\N	\N
1658	Wamba Secondary School	0.9715592	37.3123078	Samburu	Wamba East	\N	\N	\N
1659	Wamba	0.9830839	37.3239401	Samburu	Wamba East	\N	\N	\N
1660	ANGATA NANYOKIE PRIMARY	1.3	36.67	Samburu	Angata Nanyokie	\N	\N	\N
1661	Angata Nanyokie Dispensary	1.2981577	36.6665947	Samburu	Angata Nanyokie	\N	\N	\N
1662	Maralal SDA Church	1.0875539	36.6982674	Samburu	Maralal	\N	\N	\N
1663	Central Alego	0.1003636	34.2532741	Siaya	Central Alego	\N	\N	\N
1664	Siaya Central SDA Church	0.0644952	34.3002881	Siaya	Siaya Township	\N	\N	\N
1665	Seventh Day Adventist Church Siaya West	0.0545939	34.2782166	Siaya	Siaya Township	\N	\N	\N
1666	Siaya	0.0626293	34.2878084	Siaya	Siaya Township	\N	\N	\N
1667	SDA Church	0.0443742	34.372664	Siaya	South East Alego	\N	\N	\N
1668	Seventh Day Adventist Church	0.0379944	34.3330006	Siaya	South East Alego	\N	\N	\N
1669	SDA Nyang'oma Kogelo Church	-0.0054593	34.3448286	Siaya	South East Alego	\N	\N	\N
1670	Nyawita Seventh-day Adventist Church	0.1422441	34.1707897	Siaya	West Alego	\N	\N	\N
1671	Lenya SDA Church	-0.1551685	34.1073767	Siaya	Central Sakwa	\N	\N	\N
1672	Ulanda SDA	-0.127613	34.1283772	Siaya	Central Sakwa	\N	\N	\N
1673	Central Sakwa	-0.1701891	34.1754442	Siaya	Central Sakwa	\N	\N	\N
1674	Kamnara SDA Church	-0.0509687	34.323808	Siaya	North Sakwa	\N	\N	\N
1675	Seventh day Adventist church Manyuanda Central	-0.1003444	34.2754833	Siaya	North Sakwa	\N	\N	\N
1676	Seventh Day Adventist Church	-0.1970669	34.2188585	Siaya	South Sakwa	\N	\N	\N
1677	Wichlum SDA Church	-0.2346695	34.2135853	Siaya	South Sakwa	\N	\N	\N
1678	Alara SDA Church	-0.1148224	34.2153918	Siaya	South Sakwa	\N	\N	\N
1679	Seventh-day Adventist church Nyamnua	-0.2116254	34.2001669	Siaya	South Sakwa	\N	\N	\N
1680	South Sakwa	-0.1932886	34.2532741	Siaya	South Sakwa	\N	\N	\N
1681	Sinapanga SDA church	-0.0855663	34.2760724	Siaya	West Sakwa	\N	\N	\N
1682	Nyamira SDA Church, Bondo	-0.1022574	34.229305	Siaya	West Sakwa	\N	\N	\N
1683	Kapiyo SDA	-0.0971885	34.166819	Siaya	West Sakwa	\N	\N	\N
1684	Nyawita Junction Seventh-day Adventist Church	-0.0658141	34.2750075	Siaya	West Sakwa	\N	\N	\N
1685	Bondo East SDA church	-0.0863638	34.2933408	Siaya	West Sakwa	\N	\N	\N
1686	Jerusalem Seventh-day Adventist Church	-0.0880527	34.2472821	Siaya	West Sakwa	\N	\N	\N
1687	Usenge Central Seventh-day Adventist Church	-0.0651173	34.0599769	Siaya	West Yimbo	\N	\N	\N
1688	East Yimbo	-0.0385943	34.1865669	Siaya	Yimbo East	\N	\N	\N
1689	Seventh Day Adventist Church	0.096572	34.4980385	Siaya	Central Gem	\N	\N	\N
1690	Malanga SDA Church	0.1152991	34.4495283	Siaya	North Gem	\N	\N	\N
1691	Malanga SDA Church	0.1337063	34.418091	Siaya	North Gem	\N	\N	\N
1692	Maliera SDA Dispensary	0.103975	34.458641	Siaya	North Gem	\N	\N	\N
1693	Maliera Mission Dispensary	0.1076376	34.4536735	Siaya	North Gem	\N	\N	\N
1694	Dienya Seventh-day Adventist Church	0.0199674	34.4185634	Siaya	West Gem	\N	\N	\N
1695	Seventh Day Adventist Church Yala Central	0.0941488	34.5334783	Siaya	Yala Township	\N	\N	\N
1696	Seventh Day Adventist, Marenyo Church	0.0856543	34.5438467	Siaya	Yala Township	\N	\N	\N
1697	Raliew Seventh-day Adventist Church	-0.1831138	34.388228	Siaya	East Asembo	\N	\N	\N
1698	Masala SDA Church	-0.2203115	34.3032719	Siaya	North Uyoma	\N	\N	\N
1699	Nyaondo Seventh-day Adventist Church	-0.3879999	34.2886102	Siaya	South Uyoma	\N	\N	\N
1700	Naya Seventh-day Adventist Church	-0.3830647	34.3011592	Siaya	South Uyoma	\N	\N	\N
1701	South Uyoma Ward Office	-0.3324505	34.326667	Siaya	South Uyoma	\N	\N	\N
1702	MABINJU SDA CHURCH	-0.1818291	34.3719591	Siaya	West Asembo	\N	\N	\N
1703	Riat Kolemo SDA Church	-0.1200074	34.3411173	Siaya	West Asembo	\N	\N	\N
1704	Ajigo Seventh-day Adventist Church	-0.0887203	34.3481003	Siaya	West Asembo	\N	\N	\N
1705	Kagwa SDA. Church	-0.2275666	34.2567796	Siaya	West Uyoma	\N	\N	\N
1706	Seventh day adventist church Tuju	-0.2411378	34.2609765	Siaya	West Uyoma	\N	\N	\N
1707	East Ugenya	0.2861807	34.3421397	Siaya	East Ugenya	\N	\N	\N
1708	North Ugenya	0.2555909	34.1865669	Siaya	North Ugenya	\N	\N	\N
1709	Sidindi Seventh-day Adventist Church	0.152941	34.3799925	Siaya	Sidindi	\N	\N	\N
1710	Bura	-3.4501319	38.31262	Taita Taveta	Bura	\N	\N	\N
1711	Mwatate SDA Church	-3.5074487	38.3796299	Taita Taveta	Mwatate	\N	\N	\N
1712	Taveta central Seventh day Adventist Church	-3.3906673	37.6761234	Taita Taveta	Bomani	\N	\N	\N
1713	Voi Central sda church	-3.3882175	38.570372	Taita Taveta	Kaloleni	\N	\N	\N
1714	ACK Christ Church Kaloleni - Voi	-3.3923879	38.5806837	Taita Taveta	Kaloleni	\N	\N	\N
1715	Taita Village SDA church	-3.6152234	38.8456508	Taita Taveta	Marungu	\N	\N	\N
1716	Maungu Model Health Centre	-3.5613592	38.7550372	Taita Taveta	Marungu	\N	\N	\N
1717	Sagalla Dispensary Taita Taveta County	-3.4935914	38.5822332	Taita Taveta	Sagalla	\N	\N	\N
1718	Wundanyi SDA	-3.4050113	38.3618566	Taita Taveta	Wundanyi/Mbale	\N	\N	\N
1719	Madogo Seventh day Adventist church	-0.4784693	39.596527	Tana River	Madogo	\N	\N	\N
1720	Seventh-day Adventist church - Hola Town Tana River County	-1.5025752	40.0214912	Tana River	Chewani	\N	\N	\N
1721	Seventh-day Adventist Church- Idsoww	-2.2987432	40.1222596	Tana River	Garsen South	\N	\N	\N
1722	Watanu SDA Dispensary	-2.2695106	40.1106199	Tana River	Garsen West	\N	\N	\N
1723	Kathwana SDA Church	-0.3224683	37.8669975	Tharaka-Nithi	Igambang'Ombe	\N	\N	\N
1724	SDA Church Chuka	-0.322865	37.6546273	Tharaka-Nithi	Karingani	\N	\N	\N
1725	Magumoni Mixed Day Secondary School	-0.3683993	37.6219082	Tharaka-Nithi	Magumoni	\N	\N	\N
1726	Magumoni Girls Secondary School	-0.3709103	37.623083	Tharaka-Nithi	Magumoni	\N	\N	\N
1727	Ndagoni girls secondary school	-0.4124743	37.678109	Tharaka-Nithi	Magumoni	\N	\N	\N
1728	Kaanwa Sda church	-0.3232648	37.7240769	Tharaka-Nithi	Mariani	\N	\N	\N
1729	Weru Sda church	-0.3639447	37.7167436	Tharaka-Nithi	Mariani	\N	\N	\N
1730	Chogoria SDA Church	-0.2283489	37.6445733	Tharaka-Nithi	Chogoria	\N	\N	\N
1731	Seventh Day Adventist Church,IRUMA	-0.2279535	37.6306782	Tharaka-Nithi	Chogoria	\N	\N	\N
1732	Makuri SDA Church	-0.2207114	37.6106184	Tharaka-Nithi	Chogoria	\N	\N	\N
1733	Seventh day Adventist Church,Iruma	-0.2191018	37.6744822	Tharaka-Nithi	Mwimbi	\N	\N	\N
1734	SEVENTH DAY ADVENTIST CHURCH,IRUMA.	-0.2122121	37.6564114	Tharaka-Nithi	Mwimbi	\N	\N	\N
1735	Kanthanje SDA Church	-0.2653227	37.8379544	Tharaka-Nithi	Mwimbi	\N	\N	\N
1736	SDA CHIAKARIGA PRI	-0.28	37.92	Tharaka-Nithi	Chiakariga	\N	\N	\N
1737	Kamwanki SDA Church	-0.2208059	37.8650982	Tharaka-Nithi	Chiakariga	\N	\N	\N
1738	Kathirani SDA Church	-0.2854398	37.982721	Tharaka-Nithi	Chiakariga	\N	\N	\N
1739	Tunyai SDA Church	-0.1749822	37.8335477	Tharaka-Nithi	Chiakariga	\N	\N	\N
1740	SDA CHURCH MUKOTHIMA	0.0073506	37.9890501	Tharaka-Nithi	Mukothima	\N	\N	\N
1741	Seventh day adventist church Nkondi	-0.0436217	37.9571851	Tharaka-Nithi	Nkondi	\N	\N	\N
1742	Kapcheplanget SDA Church	0.9257483	35.2865089	Trans Nzoia	Chepsiro/Kiptoror	\N	\N	\N
1743	Kaplamai Main SDA Church	0.9639622	35.1130112	Trans Nzoia	Kaplamai	\N	\N	\N
1744	Seventh day Adventist church-motosiet	0.9970924	35.1718997	Trans Nzoia	Motosiet	\N	\N	\N
1745	Bisitati SDA church Sinyerere Kipsaina	1.1335203	35.1101713	Trans Nzoia	Sinyerere	\N	\N	\N
1746	SDA CHURCH KAPSARA MAIN	1.0899869	35.1382206	Trans Nzoia	Sinyerere	\N	\N	\N
1747	Kesogon Central SDA Church	1.1631954	35.1143681	Trans Nzoia	Sinyerere	\N	\N	\N
1748	Sitatunga SDA Church	1.0664605	35.1105063	Trans Nzoia	Sitatunga	\N	\N	\N
1749	SDA Church-Taito Kitale	1.069521	35.0699325	Trans Nzoia	Sitatunga	\N	\N	\N
1750	Chepchoina SDA Church	1.1701926	34.7519807	Trans Nzoia	Chepchoina	\N	\N	\N
1751	SEVENTH DAY ADVENTIST CHURCH	1.0181168	35.0319299	Trans Nzoia	Hospital	\N	\N	\N
1752	Kitale County Referral Hospital	1.0158141	35.0089352	Trans Nzoia	Hospital	\N	\N	\N
1753	Naisambu Sda Church	1.0139198	35.0479418	Trans Nzoia	Hospital	\N	\N	\N
1754	The springs SDA	1.0147241	35.011775	Trans Nzoia	Hospital	\N	\N	\N
1755	Bethel SDA Church	1.0313027	35.0218553	Trans Nzoia	Hospital	\N	\N	\N
1756	Kiminini Central Adventist Church	0.8825201	34.9264557	Trans Nzoia	Kiminini	\N	\N	\N
1757	Toll Baraton SDA Church	0.9233969	34.9397229	Trans Nzoia	Kiminini	\N	\N	\N
1758	SDA Church Lurambi	0.9454986	34.9365798	Trans Nzoia	Nabiswa	\N	\N	\N
1759	Kiungani Central SDA Church	0.9591883	34.9491982	Trans Nzoia	Nabiswa	\N	\N	\N
1760	Sirende Primary School	0.9710998	35.0549034	Trans Nzoia	Sirende	\N	\N	\N
1761	Seventh Day Adventist Mokoiywet	0.9504885	35.0190051	Trans Nzoia	Waitaluk	\N	\N	\N
1762	SDA Kibagenge Church	0.9706059	35.045556	Trans Nzoia	Waitaluk	\N	\N	\N
1763	SDA Tulwet Church	0.9095199	35.0138742	Trans Nzoia	Waitaluk	\N	\N	\N
1764	Amazing Discovery SDA	1.0097073	34.9976172	Trans Nzoia	Matisi	\N	\N	\N
1765	Family Life, Seventh-Day Adventist Church	1.0203918	34.9959863	Trans Nzoia	Matisi	\N	\N	\N
1766	Seventh day Adventist church Flyover, Kitale	0.9913936	35.0042	Trans Nzoia	Matisi	\N	\N	\N
1767	Adventist worship place SDA	1.0393568	34.976909	Trans Nzoia	Matisi	\N	\N	\N
1768	Seventh Day Adventist Blessed Hope Church	1.0389754	34.977453	Trans Nzoia	Matisi	\N	\N	\N
1769	Sda church	0.9429531	34.7786461	Trans Nzoia	Saboti	\N	\N	\N
1770	Segero Adventist School-Chesowos	0.9679095	34.8511296	Trans Nzoia	Saboti	\N	\N	\N
1771	Umoja SDA Church	1.0359963	34.9924903	Trans Nzoia	Tuwani	\N	\N	\N
1772	SDA Adventist	1.0261028	34.9929062	Trans Nzoia	Tuwani	\N	\N	\N
1773	SDA Kitale Central	1.0246661	34.9924453	Trans Nzoia	Tuwani	\N	\N	\N
1774	Kanamkemer Seventh Day Adventist Church	3.1103459	35.6042903	Turkana	Kanamkemer	\N	\N	\N
1775	SDA church Napetet	3.1260018	35.624942	Turkana	Lodwar Township	\N	\N	\N
1776	Deliverance Church Lodwar	3.1230329	35.6059778	Turkana	Lodwar Township	\N	\N	\N
1777	Kakwanyang SDA church	3.1514896	35.6744902	Turkana	Lodwar Township	\N	\N	\N
1778	Lodwar Airport	3.1202494	35.6046667	Turkana	Lodwar Township	\N	\N	\N
1779	Kapedo Secondary School	1.1792467	36.0992731	Turkana	Kapedo/Napeitom	\N	\N	\N
1780	Kaaleng Health Centre	4.4750215	35.3027226	Turkana	Kaaleng/Kaikor	\N	\N	\N
1781	Seventh day Adventist church, lokichar	2.370385	35.64061	Turkana	Lokichar	\N	\N	\N
1782	Seventh-Day Adventist Church - Kakuma Central	3.7066994	34.8576582	Turkana	Kakuma	\N	\N	\N
1783	Seventh-day Adventist Church, Kakuma Airstrip	3.7052491	34.8757352	Turkana	Kakuma	\N	\N	\N
1784	Kalobeyei Village-3 SDA church	3.750875	34.7563796	Turkana	Letea	\N	\N	\N
1785	Kalobeyei v1 Sda church	3.7664074	34.7354563	Turkana	Letea	\N	\N	\N
1786	Kapchorwa SDA Church	0.190229	35.5295764	Uasin Gishu	Ainabkoi/Olare	\N	\N	\N
1787	Seventh Day Adventist Church Kapsoya	0.5231515	35.3072059	Uasin Gishu	Kapsoya	\N	\N	\N
1788	SDA Flax	0.436426	35.451241	Uasin Gishu	Kaptagat	\N	\N	\N
1789	Tendwo SDA	0.4759268	35.4510913	Uasin Gishu	Kaptagat	\N	\N	\N
1790	KILUKA SDA CHURCH	0.4057226	35.4342483	Uasin Gishu	Kaptagat	\N	\N	\N
1791	Seventh Day Adventist Church-Kipkorgot	0.4868878	35.3414637	Uasin Gishu	Kaptagat	\N	\N	\N
1792	Kipkenyo SDA Church	0.5394206	35.2211401	Uasin Gishu	Kipkenyo	\N	\N	\N
1793	Kipkaren SDA Church	0.5071233	35.2487608	Uasin Gishu	Kipkenyo	\N	\N	\N
1794	Seventh-Day Adventist Church- Kapkenduywo	0.4664012	35.2466941	Uasin Gishu	Kipkenyo	\N	\N	\N
1795	Greater Rift Valley Conference of SDA Church	0.5260248	35.2110689	Uasin Gishu	Langas	\N	\N	\N
1796	Megun SDA Church	0.3738767	35.3156683	Uasin Gishu	Megun	\N	\N	\N
1797	SDA Mugundoi	0.3768111	35.3377135	Uasin Gishu	Megun	\N	\N	\N
1798	Seventh -Day Adventist Church Kokwatai	0.4653122	35.2403664	Uasin Gishu	Simat/Kapseret	\N	\N	\N
1799	Kamungei SDA Church	0.4538133	35.2460214	Uasin Gishu	Simat/Kapseret	\N	\N	\N
1800	SDA Church Cheptiret	0.3614651	35.3559241	Uasin Gishu	Cheptiret/Kipchamo	\N	\N	\N
1801	Seiyo Seventh Day Adventist Church	0.3680437	35.3657413	Uasin Gishu	Cheptiret/Kipchamo	\N	\N	\N
1802	SDA Cheplaskei	0.4201486	35.3208304	Uasin Gishu	Cheptiret/Kipchamo	\N	\N	\N
1803	Springfield Seventh Day Adventist Church	0.4979582	35.2986514	Uasin Gishu	Racecourse	\N	\N	\N
1804	Seventh day Adventist Church Starehe Eldoret	0.4871139	35.2643238	Uasin Gishu	Racecourse	\N	\N	\N
1805	Oasis Sda Green View	0.4630161	35.2854461	Uasin Gishu	Racecourse	\N	\N	\N
1806	Chamyet SDA Church	0.2033115	35.4336459	Uasin Gishu	Tarakwa	\N	\N	\N
1807	Seventh-day Adventist Church Koriomat	0.1599815	35.4699283	Uasin Gishu	Tarakwa	\N	\N	\N
1808	AIC Tarakwa Church	0.2693361	35.3929533	Uasin Gishu	Tarakwa	\N	\N	\N
1809	SDA ASURURIET PRIMARY	0.28	35.31	Uasin Gishu	Tulwet/Chuiyat	\N	\N	\N
1810	Moi University Seventh-Day Adventist church-MUSDA Main Campus	0.2805215	35.2968407	Uasin Gishu	Tulwet/Chuiyat	\N	\N	\N
1811	Eldoret East Seventh Day Adventist Church	0.5402392	35.2950555	Uasin Gishu	Kimumu	\N	\N	\N
1812	Sunrise SDA Church	0.5528207	35.3125388	Uasin Gishu	Kimumu	\N	\N	\N
1813	Seventh Day Adventist Church Chepkanga	0.5387044	35.294703	Uasin Gishu	Kimumu	\N	\N	\N
1814	Bahati SDA Church	0.5307463	35.3012365	Uasin Gishu	Kimumu	\N	\N	\N
1815	SDA Cheukta church	0.823846	35.376381	Uasin Gishu	Moiben	\N	\N	\N
1816	Torochmoi Sda Church	0.7165354	35.3790218	Uasin Gishu	Moiben	\N	\N	\N
1817	MUMETET SEVENTY-DAY ADVENTIST CHURCH SDA .	0.7364362	35.3219067	Uasin Gishu	Moiben	\N	\N	\N
1818	SDA church - Kerichin	0.5254836	35.3879305	Uasin Gishu	Tembelio	\N	\N	\N
1819	SDA Ziwa Church	0.8386131	35.2125712	Uasin Gishu	Kipsomba	\N	\N	\N
1820	Kuinet SDA Church	0.6013242	35.2957047	Uasin Gishu	Kuinet/Kapsuswa	\N	\N	\N
1821	KILIMA SDA CHURCH	0.9030549	35.1389298	Uasin Gishu	Moi'S Bridge	\N	\N	\N
1822	Moi's Bridge	0.8766986	35.1200016	Uasin Gishu	Moi'S Bridge	\N	\N	\N
1823	SDA Makongi Central Church	0.9020805	35.2603204	Uasin Gishu	Segero/Barsombe	\N	\N	\N
1824	SDA SEGERO PRIMARY	0.92	35.27	Uasin Gishu	Segero/Barsombe	\N	\N	\N
1825	SDA Kapsupering	0.911197	35.3314039	Uasin Gishu	Segero/Barsombe	\N	\N	\N
1826	Segero Dispensary (SDA)	0.9062759	35.2608813	Uasin Gishu	Segero/Barsombe	\N	\N	\N
1827	Segero Adventist High School	0.9174569	35.2694268	Uasin Gishu	Segero/Barsombe	\N	\N	\N
1828	Soy Central SDA Church	0.6780634	35.1614839	Uasin Gishu	Soy	\N	\N	\N
1829	Ngoisa SDA Church	0.7535986	35.2997328	Uasin Gishu	Soy	\N	\N	\N
1830	Ziwa Central SDA church	0.8398829	35.2419614	Uasin Gishu	Ziwa	\N	\N	\N
1831	Seventh-Day Adventist Church - Huruma	0.5334874	35.239302	Uasin Gishu	Huruma	\N	\N	\N
1832	Kamagut SDA Church	0.6370585	35.1665267	Uasin Gishu	Kamagut	\N	\N	\N
1833	Moi Barracks SDA Church	0.6475562	35.1651006	Uasin Gishu	Kamagut	\N	\N	\N
1834	Kaptich SDA Church	0.5878868	35.1784071	Uasin Gishu	Kamagut	\N	\N	\N
1835	Sigowet SDA Church	0.591491	35.2117447	Uasin Gishu	Kamagut	\N	\N	\N
1836	Seventh Day Adventist	0.604443	35.1720526	Uasin Gishu	Kamagut	\N	\N	\N
1837	Seventh Day Adventist Taunet	0.6016533	35.1691628	Uasin Gishu	Kamagut	\N	\N	\N
1838	Sambut SDA Church	0.6393229	35.1461343	Uasin Gishu	Kamagut	\N	\N	\N
1839	SDA WHITE SPRING CHURCH	0.6061993	35.1701304	Uasin Gishu	Kamagut	\N	\N	\N
1840	Emkwen Central SDA Sabbath School	0.6242001	35.1775878	Uasin Gishu	Kamagut	\N	\N	\N
1841	TAUNET SDA CHURCH	0.6083686	35.1636198	Uasin Gishu	Kamagut	\N	\N	\N
1842	Baharini SDA Sabbath School	0.6212143	35.1309153	Uasin Gishu	Kamagut	\N	\N	\N
1843	Kapsaos SDA Church	0.55349	35.2215011	Uasin Gishu	Kapsaos	\N	\N	\N
1844	Maili Nne Central SDA Church	0.5634897	35.2323833	Uasin Gishu	Kapsaos	\N	\N	\N
1845	Seventh Day Adventist Church Emkoin	0.5760738	35.2175231	Uasin Gishu	Kapsaos	\N	\N	\N
1846	Seventh Day Adventist Kapkoros	0.5713526	35.230776	Uasin Gishu	Kapsaos	\N	\N	\N
1847	SOSIOT SDA church	0.5441564	35.2378197	Uasin Gishu	Kapsaos	\N	\N	\N
1848	Alfajiri Seventh Day Adventist Eldoret	0.5467873	35.2450513	Uasin Gishu	Kapsaos	\N	\N	\N
1849	Tumaini Seventh Day-Adventist	0.5520712	35.2418196	Uasin Gishu	Kapsaos	\N	\N	\N
1850	Seventh Day Adventists Church Kiplombe	0.5999673	35.2618432	Uasin Gishu	Kiplombe	\N	\N	\N
1851	Seventh Day Adventist CHEPKOIYO	0.5980017	35.245721	Uasin Gishu	Kiplombe	\N	\N	\N
1852	Chepkoilel SDA Church	0.6663481	35.2164696	Uasin Gishu	Kiplombe	\N	\N	\N
1853	Emkwen SDA Sabbath School	0.6662927	35.2297906	Uasin Gishu	Kiplombe	\N	\N	\N
1854	Chepkongi SDA Church	0.6646926	35.1997817	Uasin Gishu	Kiplombe	\N	\N	\N
1855	Kapngetuny SDA Church	0.660624	35.2167574	Uasin Gishu	Kiplombe	\N	\N	\N
1856	Kaaboi SDA Church	0.6828228	35.2527656	Uasin Gishu	Kiplombe	\N	\N	\N
1857	Seventh Day Adventist Church, Kaplelach SDA	0.6466024	35.247532	Uasin Gishu	Kiplombe	\N	\N	\N
1858	Kisor SDA Church	0.6230293	35.2609938	Uasin Gishu	Kiplombe	\N	\N	\N
1859	Murgusi SDA Church	0.61519	34.9884798	Uasin Gishu	Ngenyilel	\N	\N	\N
1860	Chebaiywa SDA Church	0.5938795	34.9954335	Uasin Gishu	Ngenyilel	\N	\N	\N
1861	Koibarak SDA Church	0.6253856	35.0057186	Uasin Gishu	Ngenyilel	\N	\N	\N
1862	Seventh-day Adventist Church Kipkaren River	0.5958302	34.9679202	Uasin Gishu	Ngenyilel	\N	\N	\N
1863	Ematsuli SDA Church	0.1120921	34.6306587	Vihiga	North East Bunyore	\N	\N	\N
1864	Eshibinga SDA Church	0.11398	34.5922882	Vihiga	West Bunyore	\N	\N	\N
1865	Gisambai SDA Church	0.0500481	34.7465128	Vihiga	Gisambai	\N	\N	\N
1866	Shamakhokho salvation army	0.1053745	34.8315889	Vihiga	Shamakhokho	\N	\N	\N
1867	Seventh Day Adventist Church Marejeo	0.0168354	34.5970921	Vihiga	Emabungo	\N	\N	\N
1868	Luanda South Ward Office Vihiga County	-0.0129781	34.5856078	Vihiga	Luanda South	\N	\N	\N
1869	Emilabi Seventh Day Adventist Church	0.0657489	34.6359778	Vihiga	Wemilabi	\N	\N	\N
1870	Walodeya P.A.G Church	0.1142896	34.7291704	Vihiga	Chavakali	\N	\N	\N
1871	Chavakali Yearly Meeting	0.1183999	34.740082	Vihiga	Chavakali	\N	\N	\N
1872	Chavakali Friends Church	0.1185882	34.7401995	Vihiga	Chavakali	\N	\N	\N
1873	Lyaduywa	0.0902097	34.7050024	Vihiga	Lyaduywa/Izava	\N	\N	\N
1874	SDA CHURCH, MBALE CENTRAL	0.0818747	34.7130138	Vihiga	Lugaga-Wamuluma	\N	\N	\N
1875	Vihiga County Referral Hospital	0.0798441	34.721068	Vihiga	Lugaga-Wamuluma	\N	\N	\N
1876	Eldas	2.4507735	39.5691841	Wajir	Eldas	\N	\N	\N
1877	Seventh Day Adventist	1.7470278	40.0712492	Wajir	Township	\N	\N	\N
1878	ALALEE SEVEN DAY ADVENDIST CHURCH	2.2830961	34.9978952	West Pokot	Alale	\N	\N	\N
1879	SDA CHURCH KACHELIBA	1.4903029	35.0164308	West Pokot	Suam	\N	\N	\N
1880	Kapenguria SDA Church	1.2477703	35.1133233	West Pokot	Kapenguria	\N	\N	\N
1881	Makutano Central SDA	1.2634621	35.090347	West Pokot	Mnagei	\N	\N	\N
1882	SDA keringet church	1.2135709	35.0454188	West Pokot	Mnagei	\N	\N	\N
1883	SIYOI PRIMARY SCHOOL	1.24	35.15	West Pokot	Siyoi	\N	\N	\N
1884	ORTUM SDA CHURCH	1.4305641	35.3518951	West Pokot	Batei	\N	\N	\N
1885	Chepareria Seven Day Adventist Church	1.3025671	35.2013011	West Pokot	Chepareria	\N	\N	\N
1886	Chepareria SDA Dispensary	1.2975	35.191	West Pokot	Chepareria	\N	\N	\N
1887	SDA Church Chepkono	1.2531363	35.2380541	West Pokot	Lelan	\N	\N	\N
1888	Kapkoi SDA Church	1.2685518	35.2393609	West Pokot	Lelan	\N	\N	\N
1889	Kimnai SDA Church	1.0315201	35.4475596	West Pokot	Lelan	\N	\N	\N
1890	Lomut SDA Church	1.3901126	35.5701589	West Pokot	Lomut	\N	\N	\N
972	County Government Of Mandera Update 1	3.921457	41.820145	Mandera	Township	P.O.Box 3012, Mandera	0784383838	200
169	Daadab Sabbath school (Daadab sda)	0.043087	40.307636	Garissa	Dadaab			100
\.


--
-- Data for Name: church_update; Type: TABLE DATA; Schema: public; Owner: naikram
--

COPY public.church_update (id, church_id, name, lat, long, county, ward, address, phone, members, approval_status) FROM stdin;
1	972	County Government Of Mandera	3.9365961	41.8550863	Mandera	Township	P.O.Box 3012, Mandera	0784383838	200	1
4	972	County Government Of Mandera Update	3.934644	41.854134	Mandera	Township	P.O.Box 3012, Mandera	0784383838	200	1
5	972	County Government Of Mandera Update 2	3.934644	41.854134	Mandera	Township	P.O.Box 3012, Mandera	0784383838	200	1
2	972	County Government Of Mandera	3.934644	41.854134	Mandera	Township	P.O.Box 3012, Mandera	0784383838	200	1
6	972	County Government Of Mandera	3.903475	41.823921	Mandera	Township	P.O.Box 3012, Mandera	0784383838	200	1
7	972	County Government Of Mandera Update 1	3.921457	41.820145	Mandera	Township	P.O.Box 3012, Mandera	0784383838	200	1
9	972	County Government Of Mandera Update 1	3.921457	41.820145	Mandera	Township	P.O.Box 3012, Mandera	0784383838	200	1
10	972	County Government Of Mandera Update 1	3.921457	41.820145	Mandera	Township	P.O.Box 3012, Mandera	0784383838	200	0
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: naikram
--

COPY public."user" (id, email, username, password_hash) FROM stdin;
3	user1@gmail.com	user1	$2b$12$t5xW..7S/6aRw2JE2l9h7OZVWFNOlgaC4hxL.gXNFbt48ob6Agzme
\.


--
-- Name: church_id_seq; Type: SEQUENCE SET; Schema: public; Owner: naikram
--

SELECT pg_catalog.setval('public.church_id_seq', 1, false);


--
-- Name: church_update_id_seq; Type: SEQUENCE SET; Schema: public; Owner: naikram
--

SELECT pg_catalog.setval('public.church_update_id_seq', 10, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: naikram
--

SELECT pg_catalog.setval('public.user_id_seq', 3, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: naikram
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: church church_pkey; Type: CONSTRAINT; Schema: public; Owner: naikram
--

ALTER TABLE ONLY public.church
    ADD CONSTRAINT church_pkey PRIMARY KEY (id);


--
-- Name: church_update church_update_pkey; Type: CONSTRAINT; Schema: public; Owner: naikram
--

ALTER TABLE ONLY public.church_update
    ADD CONSTRAINT church_update_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: naikram
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: naikram
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: naikram
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

