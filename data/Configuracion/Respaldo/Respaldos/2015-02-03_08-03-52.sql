--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: SIGPA; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "SIGPA" WITH TEMPLATE = template0;


\connect "SIGPA"

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- Name: area; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE area (
    ca character(2) NOT NULL,
    d character varying(50) NOT NULL
);


--
-- Name: carga; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE carga (
    cuc character varying(15) NOT NULL,
    ci character varying(15) NOT NULL,
    p character varying(6) NOT NULL,
    s character varying(120) NOT NULL,
    ht real NOT NULL,
    hp real DEFAULT 0,
    tr character(1) NOT NULL,
    cm smallint NOT NULL
);


--
-- Name: carrera; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE carrera (
    cc character varying(2) NOT NULL,
    d character varying(50) NOT NULL,
    ca character(2) NOT NULL
);


--
-- Name: categoria; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE categoria (
    cat character(1) NOT NULL,
    abrv character varying(5) NOT NULL,
    d character varying(50) NOT NULL
);


--
-- Name: condicion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE condicion (
    c character(1) NOT NULL,
    d character varying(50) NOT NULL
);


--
-- Name: coordinacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE coordinacion (
    ci character varying(8) NOT NULL,
    cc character varying(2) NOT NULL,
    s character varying(2) NOT NULL
);


--
-- Name: dedicacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dedicacion (
    ded character(1) NOT NULL,
    abrv character varying(5) NOT NULL,
    d character varying(50) NOT NULL,
    h smallint NOT NULL
);


--
-- Name: eje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE eje (
    ce character(1) NOT NULL,
    d character varying(15) NOT NULL
);


--
-- Name: estudios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE estudios (
    cp character(3) NOT NULL,
    ci character varying(8) NOT NULL
);


--
-- Name: historial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE historial (
    ci character varying(8) NOT NULL,
    d character varying(200) NOT NULL,
    f timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: malla; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE malla (
    cm smallint NOT NULL,
    e character(1) DEFAULT 1 NOT NULL,
    f date DEFAULT now() NOT NULL,
    cc character varying(2) NOT NULL
);


--
-- Name: observacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE observacion (
    p character varying(6) NOT NULL,
    ci character varying(8) NOT NULL,
    d character varying(500)
);


--
-- Name: perfil; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE perfil (
    cuc character varying(15) NOT NULL,
    ci character varying(8) NOT NULL
);


--
-- Name: periodo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE periodo (
    fi date NOT NULL,
    ff date NOT NULL,
    t character(1) NOT NULL
);


--
-- Name: pertenece; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pertenece (
    ci character varying(8) NOT NULL,
    cc character(2) NOT NULL
);


--
-- Name: profesion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE profesion (
    cp character(3) NOT NULL,
    d character varying(80) NOT NULL
);


--
-- Name: profesor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE profesor (
    ci character varying(8) NOT NULL,
    n1 character varying(30) NOT NULL,
    n2 character varying(30) DEFAULT NULL::character varying,
    a1 character varying(30) NOT NULL,
    a2 character varying(30) DEFAULT NULL::character varying,
    c character(1) NOT NULL,
    cat character(1) NOT NULL,
    ded character(1) NOT NULL,
    s character(2) NOT NULL,
    ce character varying(80) DEFAULT NULL::character varying,
    tf character varying(30) DEFAULT NULL::character varying,
    tm character varying(30) DEFAULT NULL::character varying,
    h real DEFAULT 0 NOT NULL
);


--
-- Name: seccion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE seccion (
    id character(1) NOT NULL
);


--
-- Name: sede; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sede (
    s character(2) NOT NULL,
    d character varying(50) NOT NULL,
    dir character varying(80) NOT NULL,
    t character varying(30) NOT NULL,
    f date NOT NULL
);


--
-- Name: uc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uc (
    cuc character varying(15) NOT NULL,
    d character varying(60) NOT NULL,
    t character(1) NOT NULL,
    tr character(1) NOT NULL,
    ht real NOT NULL,
    hp real,
    ce character(1) NOT NULL,
    cc character varying(2) NOT NULL,
    cm smallint NOT NULL,
    lab character(1) DEFAULT 0 NOT NULL
);


--
-- Name: uc_cc_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE uc_cc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uc_cc_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE uc_cc_seq OWNED BY uc.cc;


--
-- Name: uc_e_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE uc_e_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uc_e_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE uc_e_seq OWNED BY uc.ce;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE usuario (
    ci character varying(8) NOT NULL,
    pw character varying(15) NOT NULL,
    r character varying(50) NOT NULL,
    n smallint NOT NULL
);


--
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: -
--

COPY area (ca, d) FROM stdin;
01	TECNOLOGIA
02	CIENCIAS SOCIALES
03	CIENCIAS AGRICOLAS Y AMBIENTALES
\.


--
-- Data for Name: carga; Type: TABLE DATA; Schema: public; Owner: -
--

COPY carga (cuc, ci, p, s, ht, hp, tr, cm) FROM stdin;
PIPT2	05655983	2015-A	A<br>	3	3	2	1
PISI4	05655983	2015-A	*A<br>	3	4.5	2	1
PIFC4	08047120	2015-A	A<br>	2	0	3	1
PIMA3	07168412	2015-A	A<br>	2	3	1	1
PIPT2	13966054	2015-A	B<br>	3	3	2	1
PIAB4	13966054	2015-A	A<br>	2	3	1	1
PIAI4	14917178	2015-A	A<br>	2	3	3	1
PIMB3	04491973	2015-A	A<br>	2	3	2	1
PIMA3	08027793	2015-A	C<br>	2	3	2	1
PIAP1	08047120	2015-A	B1-B2<br>	4	8	2	1
PIAP1	10898072	2015-A	C1-C2<br>	4	8	2	1
aapoo	10898072	2015-A	A<br>	0	3	1	1
aapoo	06953950	2015-A	B<br>	0	3	1	1
PIPP2	06953950	2015-A	A1-A2<br>	4	8	2	1
EFSI	11960173	2015-A	D<br>	2	3	2	1
adAW	11960173	2015-A	A<br>	2	3	3	1
PIMT1	09389944	2015-A	A<br>B<br>C<br>	6	9	2	1
PIIS3	14917178	2015-A	B<br>	2	3	2	1
PIBD2	04491973	2015-A	A<br>B<br>	4	6	2	1
PIIS3	11303172	2015-A	A<br>	2	3	1	1
PIIS3	11303172	2015-A	A<br>C<br>	4	6	2	1
PIGP4	08044725	2015-A	A<br>	5	0	1	1
PIPT1	13966054	2015-A	B<br>	3	3	2	1
PIPT1	10256095	2015-A	A<br>C<br>D<br>	9	9	2	1
PIPT3	09499979	2015-A	A<br>B<br>C<br>	9	9	2	1
PIPT3	08044725	2015-A	A<br>B<br>	6	6	1	1
PIPT4	14917178	2015-A	A<br>	3	3	1	1
PIRA4	12722185	2015-A	*A<br>	3	4.5	2	1
PIBD2	12722185	2015-A	D<br>	2	3	2	1
PIPNP03	11960173	2015-A	B<br>	4	0	1	1
\.


--
-- Data for Name: carrera; Type: TABLE DATA; Schema: public; Owner: -
--

COPY carrera (cc, d, ca) FROM stdin;
01	PNF AGROALIMENTACIÓN	03
02	PNF CONSTRUCCIÓN CIVIL	01
03	PNF INFORMATICA	01
04	PNF ADMINISTRACIÓN	02
05	PNF GEOCIENCIAS	01
06	PNF TURISMO	02
07	PNF CONTADURIA	02
08	PNF FONOAUDIOLOGIA	02
10	PNF PSICOLOGIA SOCIAL	02
09	PNF SEGURIDAD ALIMENTARIA Y CULTURA NUTRICIONAL	03
\.


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categoria (cat, abrv, d) FROM stdin;
2	inst	INSTRUCTOR
0	no	SIN ASIGNAR
1	asist	ASISTENTE
3	asoc	ASOCIADO
4	tit	TITULAR
5	agre	AGREGADO
6	aux	AUXILIAR DOCENTE
\.


--
-- Data for Name: condicion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY condicion (c, d) FROM stdin;
1	ORDINARIO
2	JUBILADO
3	CONTRATADO
4	SUPLENTE
0	SIN ASIGNAR
\.


--
-- Data for Name: coordinacion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY coordinacion (ci, cc, s) FROM stdin;
12345678	03	01
87654321	02	01
\.


--
-- Data for Name: dedicacion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dedicacion (ded, abrv, d, h) FROM stdin;
0	no	SIN ASIGNAR	0
1	TC	TIEMPO COMPLETO	16
3	MT	MEDIO TIEMPO	12
4	TCv	TIEMPO CONVENCIONAL	7
2	EXC	EXCLUSIVA	16
\.


--
-- Data for Name: eje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eje (ce, d) FROM stdin;
1	ACREDITABLE
2	PROFESIONAL
3	PROYECTO
4	SOCIO AMBIENTAL
5	SOCIO-CRITICO
\.


--
-- Data for Name: estudios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY estudios (cp, ci) FROM stdin;
000	00222222
000	00584711
000	03048184
000	03574698
000	04768948
000	07080727
000	08013569
000	08039294
000	08039463
000	09198636
000	10102259
000	10102454
000	11463296
000	13098763
000	07357589
000	10718224
000	02149217
000	02287821
000	00678538
000	00976855
000	01111111
000	01146089
000	01656140
000	01687450
000	02286020
000	02362548
000	02455516
000	02457912
000	02617975
000	02737443
000	02814719
000	02838121
000	02850226
000	02890587
000	02957596
000	03006127
000	03032135
000	03038774
000	03062497
000	03082706
000	03293648
000	03309773
000	03370453
000	03385972
000	03428254
000	03442051
000	03469416
000	03474020
000	03479772
000	03496268
000	03498015
000	03498205
000	03499333
000	03522090
000	03549662
000	03554216
000	03586551
000	03635921
000	03726896
000	03752100
000	03766382
000	03767094
000	03813571
000	03814444
000	03824022
000	03853571
000	03939324
000	03939832
000	03991661
000	03992823
000	03995466
000	03995911
000	04041213
000	04059960
000	04063136
000	04092339
000	04143374
000	04145751
000	04163685
000	04173394
000	04203537
000	04206639
000	04246098
000	04271043
000	04323352
000	04324337
000	04334862
000	03485766
000	03661985
000	03692342
000	03727339
000	03767311
000	03830917
000	03791326
000	03907664
000	03910823
000	03939687
000	03990590
000	03992405
000	04194292
000	04319574
000	04323036
000	04327492
000	04353143
000	04330086
000	04356042
000	04397227
000	04491963
000	04530705
000	04703287
000	04768469
000	04946336
000	04977183
000	05024784
000	05032481
000	05054721
000	05116030
000	05131347
000	05199025
000	05200953
000	05202671
000	05203329
000	05206583
000	05206598
000	05206999
000	05307768
000	05351609
000	05435898
000	05439749
000	05446019
000	05446471
000	05446661
000	05485302
000	05509322
000	05654710
000	05654904
000	05655737
000	05728108
000	05892364
000	05945180
000	06018398
000	06308181
000	06426190
000	06908190
000	04472778
000	04488065
000	04488256
000	04488420
000	04489957
000	04490481
000	04492233
000	04492356
000	04583431
000	04633259
000	04589713
000	04769890
000	04953940
000	05021210
000	05201622
000	05201033
000	05206267
000	05206372
000	05355610
000	05447146
000	05466076
000	05507269
000	05559793
000	05561396
000	05660032
000	05740339
000	05753564
000	04054457
024	04484976
017	04491607
001	04491973
000	05124273
000	05239250
016	15296169
022	07168412
001	12722185
000	05794416
000	05863317
000	06167653
000	05952723
000	06558454
000	06940439
000	07199187
000	07218768
000	07545873
000	07725635
000	07772181
000	08000405
000	08001969
000	08004481
000	08005373
000	08006286
000	08008780
000	08011218
000	08011554
000	08021739
000	08022263
000	08023900
000	08025259
000	08025261
000	08025941
000	08029052
000	08029795
000	08031306
000	08031593
000	08031757
000	08031821
000	08034214
000	07383992
000	07326064
000	07525829
000	07648734
000	07775026
000	07824945
000	07940076
000	08000617
000	08002316
000	08002737
000	08004161
000	08005159
000	08006388
000	08012641
000	08019784
000	08013671
000	08020758
000	08021306
000	08021736
000	08021842
000	08022671
000	08022340
000	08024531
000	08025750
000	08026122
000	08026155
000	08027408
000	08029045
000	08029696
000	08031064
000	08032732
000	08034029
000	08034300
000	08034371
000	08035484
000	08037619
000	08038332
000	08038611
000	10102108
000	08039160
000	08040671
000	08041985
000	08045140
000	08081463
000	08081684
000	08458508
000	09170633
000	09222772
000	09279327
000	09372327
000	09398123
000	09470586
000	09471742
000	09472935
000	09473824
000	09474583
000	09476548
000	09476680
000	09496713
000	08039498
000	08040787
000	08041510
000	08041620
000	08042559
000	08044768
000	08045258
000	08045307
000	08045536
000	08046408
000	08046659
000	08048794
000	08079222
000	08080375
000	08080676
000	08087415
000	08141857
000	08331149
000	08336414
000	08656400
000	08683060
000	08720054
000	08958864
000	09027962
000	09028433
000	09081546
000	09234597
000	09346062
000	09472514
000	09473151
000	09473374
000	09473423
000	09473567
000	09473852
000	09476268
000	09478674
000	09501330
000	09678973
000	09906067
000	09906615
000	10092487
000	10100205
000	10102820
000	10108462
000	10712338
000	10719923
000	10795287
000	10896107
000	10940629
000	11174533
000	11496709
000	11959818
000	11959905
000	12797606
000	12799845
000	13014423
000	13017695
000	10108950
000	10109087
000	10178133
000	10314511
000	10712408
000	10713529
000	10714070
000	10715404
000	10718393
000	10718091
000	10720364
000	10797122
000	11067484
000	11108398
011	06547603
016	06953950
024	07832738
000	07934845
000	08002183
000	08006639
001	08027793
001	08028204
001	08029075
001	08044725
000	08084432
022	09201868
000	09474147
001	09475173
001	09499979
000	10087275
001	10256095
001	10898072
022	09389944
000	11319364
000	11460000
000	11460813
000	11462979
000	11465653
000	11467397
000	11467713
000	11468201
000	11783461
000	11912316
000	11952770
000	11959505
000	12048353
000	12329797
000	12346208
000	12352023
000	12353031
000	12458260
000	12776731
000	12779069
000	12779975
000	12817844
000	12839616
000	13013152
000	13014707
000	13098188
000	13098422
000	13099230
000	13803898
000	15234461
000	15913325
000	16445105
000	16657360
000	16680396
000	13098948
000	13099384
000	13524820
000	13525905
000	13649962
000	13803490
000	13947142
000	13966605
000	13967486
000	14249554
000	14131053
000	14267080
000	14267842
000	14400087
000	14589222
000	14700296
000	14839454
000	14866857
000	14917365
000	15142314
000	14917541
000	15175795
000	15223533
000	15381185
000	15516303
000	15516332
000	15565857
000	15622903
000	15754922
000	15754311
000	15756979
000	15920086
000	15920291
000	15921593
000	16020374
000	16285988
000	16377291
000	16514402
000	16964770
000	17130729
000	17129511
000	17238348
000	17456574
000	17499585
000	17456954
000	16199115
000	17523454
000	17664938
000	17770813
000	18310574
000	18581024
000	18796815
000	18796996
000	18962414
000	19421996
000	19440209
000	81423693
000	12345678
000	87654321
000	09240195
000	14400356
000	14916156
001	08047120
039	03966127
000	14268612
001	07509507
002	09476031
054	10104966
001	11303172
001	11466224
022	11705856
001	11954144
039	11956576
000	11960173
006	13014569
001	13477378
001	13524109
016	13648603
000	13723698
001	13966054
001	14401340
016	14917178
001	05655983
\.


--
-- Data for Name: historial; Type: TABLE DATA; Schema: public; Owner: -
--

COPY historial (ci, d, f) FROM stdin;
4321	Se restauró el respaldo 2015-01-15_10-26-58.sql	2015-01-26 15:14:29.621541
12345678	El usuario 12345678 ha iniciado sesión	2015-01-26 15:20:57.303427
12345678	El usuario 12345678 ha iniciado sesión	2015-01-26 21:05:33.777065
4321	El usuario 4321 ha iniciado sesión	2015-01-26 21:58:10.993788
4321	Se creó un nuevo periodo de planificación	2015-01-26 22:02:48.472634
4321	Se creó un nuevo periodo académico	2015-01-26 22:02:48.494794
12345678	El usuario 12345678 ha iniciado sesión	2015-01-26 22:18:10.353746
4321	El usuario 4321 ha iniciado sesión	2015-01-26 22:19:40.302777
4321	Se modificó la unidad curricular PROYECTO SOCIO TECNOLÓGICO II de la carrera 03 en la malla 1	2015-01-26 22:20:05.910211
12345678	El usuario 12345678 ha iniciado sesión	2015-01-26 22:21:13.469569
12345678	insert into carga values('PIPT2', '05655983', '2015-A', 'A<br>', 3, 3, 2, 1)	2015-01-26 22:22:08.573018
4321	Se modificó la unidad curricular SEGURIDAD INFORMÁTICA de la carrera 03 en la malla 1	2015-01-26 22:22:50.502234
4321	Se modificó la unidad curricular SEGURIDAD INFORMÁTICA de la carrera 03 en la malla 1	2015-01-26 22:23:32.014477
12345678	insert into carga values('PISI4', '05655983', '2015-A', '*A<br>', 3, 4.5, 2, 1)	2015-01-26 22:25:19.548432
4321	Se modificó la unidad curricular FORMACIÓN CRÍTICA IV de la carrera 03 en la malla 1	2015-01-26 22:30:55.1333
12345678	insert into carga values('PIFC4', '08047120', '2015-A', 'A<br>', 2, 0, 3, 1)	2015-01-26 22:31:36.164945
4321	Se modificó la unidad curricular ALGORÍTMICA Y PROGRAMACIÓN de la carrera 03 en la malla 1	2015-01-26 22:31:59.430349
12345678	insert into carga values('PIAP1', '08047120', '2015-A', 'B(B1-B2)<br>', 2, 12, 2, 1)	2015-01-26 22:32:47.678976
12345678	Se eliminó la carga 'PIAP1' al profesor '08047120'	2015-01-26 22:33:50.326585
12345678	insert into carga values('PIAP1', '08047120', '2015-A', 'B(B1-B2)<br>', 2, 12, 2, 1)	2015-01-26 22:35:20.134293
12345678	Se eliminó la carga 'PIAP1' al profesor '08047120'	2015-01-26 22:35:35.316173
12345678	insert into carga values('PIAP1', '08047120', '2015-A', 'B<br>', 2, 6, 2, 1)	2015-01-26 22:35:51.926604
12345678	Se eliminó la carga 'PIAP1' al profesor '08047120'	2015-01-26 22:36:25.381135
12345678	insert into carga values('PIAP1', '08047120', '2015-A', 'B1-B2<br>', 4, 12, 2, 1)	2015-01-26 22:36:50.331441
12345678	Se eliminó la carga 'PIAP1' al profesor '08047120'	2015-01-26 22:43:13.017546
12345678	insert into carga values('PIAP1', '08047120', '2015-A', 'B1-B2<br>', 4, 12, 2, 1)	2015-01-26 22:43:29.397046
12345678	Se eliminó la carga 'PIAP1' al profesor '08047120'	2015-01-26 22:45:05.137849
12345678	insert into carga values('PIAP1', '08047120', '2015-A', 'B1-B2<br>', 2, 12, 2, 1)	2015-01-26 22:45:32.182541
4321	Se modificó la unidad curricular MATEMÁTICA APLICADA de la carrera 03 en la malla 1	2015-01-26 22:56:04.150061
12345678	insert into carga values('PIMA3', '07168412', '2015-A', 'A<br>', 2, 3, 1, 1)	2015-01-26 22:56:57.956987
12345678	insert into carga values('PIPT2', '13966054', '2015-A', 'B<br>', 3, 3, 2, 1)	2015-01-26 22:59:48.52875
4321	Se modificó la unidad curricular ADMINISTRACIÓN DE BASE DE DATOS de la carrera 03 en la malla 1	2015-01-26 23:00:10.194838
12345678	insert into carga values('PIAB4', '13966054', '2015-A', 'A<br>', 2, 3, 1, 1)	2015-01-26 23:00:51.682784
4321	Se modificó la unidad curricular PROYECTO SOCIO TECNOLÓGICO I de la carrera 03 en la malla 1	2015-01-26 23:01:14.226391
12345678	insert into carga values('PIPT1', '13966054', '2015-A', 'B<br>', 3, 3, 2, 1)	2015-01-26 23:01:44.314047
4321	Se modificó la unidad curricular PROYECTO SOCIO TECNOLÓGICO IV de la carrera 03 en la malla 1	2015-01-26 23:04:06.664719
12345678	insert into carga values('PIPT4', '14917178', '2015-A', 'A<br>', 3, 3, 1, 1)	2015-01-26 23:04:45.84183
4321	Se modificó la unidad curricular INGENIERÍA DEL SOFTWARE II de la carrera 03 en la malla 1	2015-01-26 23:05:39.550876
12345678	insert into carga values('PIIS3', '14917178', '2015-A', 'B<br>', 2, 3, 2, 1)	2015-01-26 23:06:15.490135
4321	Se modificó la unidad curricular AUDITORÍA INFORMÁTICA de la carrera 03 en la malla 1	2015-01-26 23:07:02.170314
12345678	insert into carga values('PIAI4', '14917178', '2015-A', 'A<br>', 2, 3, 3, 1)	2015-01-26 23:07:35.730231
12345678	insert into carga values('PIPT1', '10256095', '2015-A', 'A<br>C<br>D<br>', 9, 9, 2, 1)	2015-01-26 23:09:03.177354
12345678	Se eliminó la carga 'PIIS3' al profesor '14917178'	2015-01-26 23:11:47.593772
4321	Se modificó la unidad curricular INGENIERÍA DEL SOFTWARE III de la carrera 03 en la malla 1	2015-01-26 23:12:10.982166
12345678	insert into carga values('PIIS3', '14917178', '2015-A', 'B<br>', 2, 3, 2, 1)	2015-01-26 23:12:55.216199
4321	Se modificó la unidad curricular PROYECTO SOCIO TECNOLÓGICO III de la carrera 03 en la malla 1	2015-01-26 23:21:54.850857
12345678	insert into carga values('PIPT3', '09499979', '2015-A', 'A<br>B<br>C<br>', 9, 9, 2, 1)	2015-01-26 23:22:56.338003
4321	Se modificó la unidad curricular REDES AVANZADAS de la carrera 03 en la malla 1	2015-01-26 23:23:57.502401
12345678	insert into carga values('PIRA4', '12722185', '2015-A', '*A<br>', 3, 4.5, 1, 1)	2015-01-26 23:25:09.278012
4321	Se modificó la unidad curricular MODELADO DE BASE DE DATOS de la carrera 03 en la malla 1	2015-01-26 23:25:54.409776
12345678	insert into carga values('PIMB3', '04491973', '2015-A', 'A<br>', 2, 3, 2, 1)	2015-01-26 23:26:27.020281
4321	Se modificó la unidad curricular BASE DE DATOS de la carrera 03 en la malla 1	2015-01-26 23:27:13.60727
12345678	insert into carga values('PIBD2', '04491973', '2015-A', 'A<br>B<br>', 4, 6, 2, 1)	2015-01-26 23:27:51.129503
4321	Se modificó la unidad curricular MATEMATICA II de la carrera 03 en la malla 1	2015-01-26 23:28:23.538245
12345678	insert into carga values('PIMT2', '08027793', '2015-A', 'A<br>B<br>', 4, 6, 2, 1)	2015-01-26 23:29:31.069508
12345678	insert into carga values('PIMA3', '08027793', '2015-A', 'C<br>', 2, 3, 2, 1)	2015-01-26 23:30:25.689956
12345678	Se eliminó la carga 'PIAP1' al profesor '08047120'	2015-01-26 23:33:44.19383
4321	Se modificó la unidad curricular ALGORÍTMICA Y PROGRAMACIÓN de la carrera 03 en la malla 1	2015-01-26 23:34:00.149379
12345678	insert into carga values('PIAP1', '08047120', '2015-A', 'B1-B2<br>', 4, 8, 2, 1)	2015-01-26 23:35:43.635175
12345678	insert into carga values('PIAP1', '10898072', '2015-A', 'C1-C2<br>', 4, 8, 2, 1)	2015-01-26 23:38:43.784511
4321	Se creó la unidad curricular ACTIVIDAD ACREDITABLE PROGRAMACIÓN ORIENTADA A OBJETOS de la carrera 03 en la malla 1	2015-01-26 23:43:01.019851
12345678	insert into carga values('aapoo', '10898072', '2015-A', 'A<br>', 1, 3, 1, 1)	2015-01-26 23:44:10.573494
12345678	Se eliminó la carga 'aapoo' al profesor '10898072'	2015-01-26 23:44:42.272165
4321	Se modificó la unidad curricular ACTIVIDAD ACREDITABLE PROGRAMACIÓN ORIENTADA A OBJETOS de la carrera 03 en la malla 1	2015-01-26 23:44:54.427301
12345678	insert into carga values('aapoo', '10898072', '2015-A', 'A<br>', 0, 3, 1, 1)	2015-01-26 23:45:18.40437
12345678	insert into carga values('aapoo', '06953950', '2015-A', 'B<br>', 0, 3, 1, 1)	2015-01-26 23:46:50.623695
4321	Se modificó la unidad curricular PROGRAMACIÓN II de la carrera 03 en la malla 1	2015-01-26 23:48:41.898098
4321	Se modificó la unidad curricular PROGRAMACIÓN II de la carrera 03 en la malla 1	2015-01-26 23:49:58.061728
12345678	insert into carga values('PIPP2', '06953950', '2015-A', 'A1-A2<br>', 4, 8, 2, 1)	2015-01-26 23:50:44.560683
4321	Se creó la unidad curricular ELECTIVA FUNDAMENTOS DE SISTEMAS DE INFORMACIÓN de la carrera 03 en la malla 1	2015-01-26 23:53:42.199016
12345678	insert into carga values('EFSI', '11960173', '2015-A', 'D<br>', 2, 3, 2, 1)	2015-01-26 23:54:35.119546
4321	Se creó la unidad curricular ELECTIVA DESARROLLO DE APLICACIONES EN LA WEB de la carrera 03 en la malla 1	2015-01-26 23:56:27.582317
12345678	insert into carga values('adAW', '11960173', '2015-A', 'A<br>', 2, 3, 3, 1)	2015-01-26 23:57:02.596471
4321	Se modificó la unidad curricular PROYECTO NACIONAL Y NUEVA CIUDADANIA de la carrera 03 en la malla 1	2015-01-26 23:57:26.502841
12345678	insert into carga values('PIPNP03', '11960173', '2015-A', 'B<br>', 4, 0, 1, 1)	2015-01-26 23:58:22.880673
12345678	Se eliminó la carga 'PIIS3' al profesor '14917178'	2015-01-27 00:04:57.120563
4321	Se modificó la unidad curricular INGENIERÍA DEL SOFTWARE II de la carrera 03 en la malla 1	2015-01-27 00:05:43.697136
4321	Se modificó la unidad curricular INGENIERÍA DEL SOFTWARE II de la carrera 03 en la malla 1	2015-01-27 00:09:29.400392
4321	Se modificó la unidad curricular INGENIERÍA DEL SOFTWARE III de la carrera 03 en la malla 1	2015-01-27 00:10:04.032514
4321	Se eliminó la unidad curricular PIIS2 de la carrera 03 en la malla 1	2015-01-27 00:11:55.339736
12345678	insert into carga values('PIIS3', '14917178', '2015-A', 'B<br>', 2, 3, 1, 1)	2015-01-27 00:13:55.316037
4321	Se modificó la unidad curricular MATEMÁTICA I de la carrera 03 en la malla 1	2015-01-27 00:17:35.6395
12345678	insert into carga values('PIMT1', '09389944', '2015-A', 'A<br>B<br>C<br>', 6, 9, 2, 1)	2015-01-27 00:18:09.772465
12345678	Se eliminó la carga 'PIIS3' al profesor '14917178'	2015-01-27 00:26:37.232141
12345678	insert into carga values('PIIS3', '14917178', '2015-A', 'B<br>', 2, 3, 2, 1)	2015-01-27 00:27:28.343594
12345678	Se eliminó la carga 'PIBD2' al profesor '04491973'	2015-01-27 00:29:42.971862
12345678	insert into carga values('PIBD2', '04491973', '2015-A', 'A<br>B<br>', 4, 6, 2, 1)	2015-01-27 00:31:01.091835
4321	El usuario 4321 ha iniciado sesión	2015-01-27 00:37:21.262254
4321	Se creó la carrera PNF PSICOLOGIA SOCIAL	2015-01-27 00:37:58.932779
4321	Se creó la carrera PNF SEGURIDAD ALIMENTARIA Y CULTURA NUTRICIONAL	2015-01-27 00:39:07.674878
4321	Se creó el respaldo 2015-01-27_00-39-47.sql	2015-01-27 00:39:47.75483
4321	Se creó el respaldo 2015-01-27_00-40-07.sql	2015-01-27 00:40:07.221803
12345678	El usuario 12345678 ha iniciado sesión	2015-01-27 00:41:18.874431
4321	Se creó el respaldo 2015-01-27_09-00-08.sql	2015-01-27 09:00:08.99167
4321	Se creó el respaldo 2015-01-27_09-03-41.sql	2015-01-27 09:03:44.776251
12345678	El usuario 12345678 ha iniciado sesión	2015-01-27 09:21:09.887958
12345678	El usuario 12345678 ha iniciado sesión	2015-01-27 15:29:30.640217
4321	El usuario 4321 ha iniciado sesión	2015-01-27 15:42:46.136014
4321	El usuario 4321 ha iniciado sesión	2015-01-27 15:58:33.798506
4321	Se modificó la unidad curricular ALGORÍTMICA Y PROGRAMACIÓN  I de la carrera 03 en la malla 1	2015-01-27 16:10:25.266095
4321	Se modificó la unidad curricular INGENIERÍA DEL SOFTWARE II de la carrera 03 en la malla 1	2015-01-27 16:10:54.487482
4321	Se creó el respaldo 2015-01-27_16-11-10.sql	2015-01-27 16:11:14.275057
4321	El usuario 4321 ha iniciado sesión	2015-01-27 19:44:59.312841
12345678	El usuario 12345678 ha iniciado sesión	2015-01-27 20:05:03.035157
12345678	insert into carga values('PIIS3', '11303172', '2015-A', 'A<br>', 2, 3, 1, 1)	2015-01-27 20:19:02.211017
12345678	Se eliminó la carga 'PIIS3' al profesor '11303172'	2015-01-27 20:21:07.442893
12345678	insert into carga values('PIIS3', '11303172', '2015-A', 'A<br>', 2, 3, 1, 1)	2015-01-27 20:23:40.571334
12345678	insert into carga values('PIIS3', '11303172', '2015-A', 'A<br>D<br>', 4, 6, 2, 1)	2015-01-27 20:25:02.168747
12345678	Se eliminó la carga 'PIIS3' al profesor '11303172'	2015-01-27 20:28:30.661342
12345678	insert into carga values('PIIS3', '11303172', '2015-A', 'A<br>C<br>', 4, 6, 2, 1)	2015-01-27 20:29:09.764446
12345678	insert into carga values('PIPT3', '08044725', '2015-A', 'A<br>C<br>', 6, 6, 1, 1)	2015-01-27 20:31:34.812148
12345678	insert into carga values('PIGP4', '08044725', '2015-A', 'A<br>', 5, 0, 1, 1)	2015-01-27 20:32:09.777074
12345678	Se eliminó la carga 'PIPT3' al profesor '08044725'	2015-01-27 20:33:06.208301
12345678	insert into carga values('PIPT3', '08044725', '2015-A', 'A<br>B<br>', 6, 6, 1, 1)	2015-01-27 20:33:49.218101
4321	El usuario 4321 ha iniciado sesión	2015-01-27 20:34:48.385675
4321	Se modificó la unidad curricular GESTIÓN DE PROYECTOS INFORMÁTICOS de la carrera 03 en la malla 1	2015-01-27 20:35:38.281093
12345678	El usuario 12345678 ha iniciado sesión	2015-01-27 20:35:49.216506
4321	El usuario 4321 ha iniciado sesión	2015-01-27 20:39:16.225128
4321	Se modificó la unidad curricular IDIOMAS de la carrera 03 en la malla 1	2015-01-27 20:47:32.351401
4321	Se modificó la unidad curricular IDIOMAS de la carrera 03 en la malla 1	2015-01-27 20:48:46.85464
4321	Se modificó la unidad curricular REDES DE COMPUTADORES de la carrera 03 en la malla 1	2015-01-27 20:51:36.305196
4321	Se modificó la unidad curricular FORMACIÓN CRÍTICA III de la carrera 03 en la malla 1	2015-01-27 21:01:50.606648
4321	Se modificó la unidad curricular FORMACIÓN CRÍTICA III de la carrera 03 en la malla 1	2015-01-27 21:02:17.394681
4321	Se modificó la unidad curricular FORMACIÓN CRÍTICA II de la carrera 03 en la malla 1	2015-01-27 21:03:18.881408
4321	Se modificó la unidad curricular SISTEMAS OPERATIVOS II de la carrera 03 en la malla 1	2015-01-27 21:17:39.64081
4321	Se modificó la unidad curricular ARQUITECTURA DEL COMPUTADOR de la carrera 03 en la malla 1	2015-01-27 21:18:46.694405
4321	Se modificó la unidad curricular ALGORÍTMICA Y PROGRAMACIÓN  I de la carrera 03 en la malla 1	2015-01-27 21:19:35.548795
4321	Se modificó la unidad curricular ALGORÍTMICA Y PROGRAMACIÓN  I de la carrera 03 en la malla 1	2015-01-27 21:22:21.742812
4321	Se modificó la unidad curricular ALGORÍTMICA Y PROGRAMACIÓN  I de la carrera 03 en la malla 1	2015-01-27 21:25:03.759583
4321	El usuario 4321 ha iniciado sesión	2015-01-28 09:00:30.551229
4321	Se eliminó la unidad curricular PIAC1 de la carrera 03 en la malla 1	2015-01-28 09:34:26.494148
4321	Se creó la unidad curricular ARQUITECTURA DEL COMPUTADOR de la carrera 03 en la malla 1	2015-01-28 09:35:17.281034
4321	Se modificó la unidad curricular PROYECTO SOCIOTECNOLÓGICO I de la carrera 03 en la malla 1	2015-01-28 09:36:06.790342
4321	Se modificó la unidad curricular ELECTIVA I de la carrera 03 en la malla 1	2015-01-28 09:37:01.199538
4321	Se modificó la unidad curricular ARQUITECTURA DEL COMPUTADOR de la carrera 03 en la malla 1	2015-01-28 09:37:52.486854
4321	Se eliminó la unidad curricular PIAC1 de la carrera 03 en la malla 1	2015-01-28 09:38:34.286368
4321	Se creó la unidad curricular ARQUITECTURA DEL COMPUTADOR de la carrera 03 en la malla 1	2015-01-28 09:42:21.967955
12345678	El usuario 12345678 ha iniciado sesión	2015-01-28 09:43:38.904939
12345678	insert into carga values('PIAC1', '04054457', '2015-A', 'A<br>', 2, 3, 3, 1)	2015-01-28 09:44:10.296268
12345678	Se eliminó la carga 'PIAC1' al profesor '04054457'	2015-01-28 09:46:26.678191
4321	Se eliminó la unidad curricular PIEL1 de la carrera 03 en la malla 1	2015-01-28 09:59:00.697538
4321	Se modificó la unidad curricular MATEMATICA II de la carrera 03 en la malla 1	2015-01-28 10:00:06.918886
4321	Se modificó la unidad curricular MATEMATICA II de la carrera 03 en la malla 1	2015-01-28 10:00:20.762785
12345678	Se eliminó la carga 'PIMT2' al profesor '08027793'	2015-01-28 10:01:12.316577
4321	Se eliminó la unidad curricular PIMT2 de la carrera 03 en la malla 1	2015-01-28 10:01:20.994512
4321	Se creó la unidad curricular MATEMÁTICA II de la carrera 03 en la malla 1	2015-01-28 10:01:49.437683
4321	Se eliminó la unidad curricular PIFC2 de la carrera 03 en la malla 1	2015-01-28 10:02:31.881116
4321	Se creó la unidad curricular FORMACIÓN CRITICA II de la carrera 03 en la malla 1	2015-01-28 10:03:02.857675
4321	Se creó la unidad curricular INGENIERÍA DEL SOFTWARE I de la carrera 03 en la malla 1	2015-01-28 10:08:35.734783
4321	Se modificó la unidad curricular ELECTIVA II de la carrera 03 en la malla 1	2015-01-28 10:09:15.655955
4321	Se eliminó la unidad curricular PIID2 de la carrera 03 en la malla 1	2015-01-28 10:09:44.789594
4321	Se eliminó la unidad curricular PISC2 de la carrera 03 en la malla 1	2015-01-28 10:09:57.866087
4321	Se modificó la unidad curricular ELECTIVA II de la carrera 03 en la malla 1	2015-01-28 10:11:26.774023
4321	Se modificó la unidad curricular INVESTIGACIÓN DE OPERACIONES de la carrera 03 en la malla 1	2015-01-28 10:12:19.772018
4321	Se modificó la unidad curricular SISTEMAS OPERATIVOS de la carrera 03 en la malla 1	2015-01-28 10:12:51.626539
4321	Se eliminó la unidad curricular PIFC3 de la carrera 03 en la malla 1	2015-01-28 10:13:19.181537
4321	Se creó la unidad curricular FORMACIÓN CRITICA III de la carrera 03 en la malla 1	2015-01-28 10:13:46.002372
4321	Se modificó la unidad curricular PROYECTO SOCIOTECNOLÓGICO III de la carrera 03 en la malla 1	2015-01-28 10:14:09.268373
4321	Se modificó la unidad curricular ELECTIVA III de la carrera 03 en la malla 1	2015-01-28 10:14:53.822366
4321	Se eliminó la unidad curricular PIGC3 de la carrera 03 en la malla 1	2015-01-28 10:16:10.642084
4321	Se modificó la unidad curricular INGENIERÍA DEL SOFTWARE I de la carrera 03 en la malla 1	2015-01-28 10:16:53.429196
4321	Se modificó la unidad curricular PROYECTO SOCIOTECNOLÓGICO IV de la carrera 03 en la malla 1	2015-01-28 10:17:40.649836
4321	Se modificó la unidad curricular ELECTIVA IV de la carrera 03 en la malla 1	2015-01-28 10:18:05.249689
4321	Se modificó la unidad curricular REDES AVANZADAS de la carrera 03 en la malla 1	2015-01-28 10:18:15.971214
4321	Se modificó la unidad curricular REDES AVANZADAS de la carrera 03 en la malla 1	2015-01-28 10:18:28.559663
12345678	Se eliminó la carga 'PIRA4' al profesor '12722185'	2015-01-28 10:20:22.84509
4321	Se eliminó la unidad curricular PIRA4 de la carrera 03 en la malla 1	2015-01-28 10:21:44.61936
4321	Se creó la unidad curricular REDES AVANZADAS de la carrera 03 en la malla 1	2015-01-28 10:22:49.895002
4321	Se eliminó la unidad curricular PIEL4 de la carrera 03 en la malla 1	2015-01-28 10:23:45.944991
12345678	insert into carga values('PIRA4', '12722185', '2015-A', '*A<br>', 3, 4.5, 2, 1)	2015-01-28 10:29:36.703437
12345678	insert into carga values('PIAC1', '13723698', '2015-A', 'C(C1-C2)<br>D(D1-D2)<br>', 4, 12, 2, 1)	2015-01-28 10:43:08.64073
12345678	Se eliminó la carga 'PIAC1' al profesor '13723698'	2015-01-28 10:54:48.226814
12345678	El usuario 12345678 ha iniciado sesión	2015-01-28 11:52:19.712002
12345678	insert into carga values('PIBD2', '12722185', '2015-A', 'D<br>', 2, 3, 2, 1)	2015-01-28 11:57:26.61152
4321	El usuario 4321 ha iniciado sesión	2015-01-28 12:05:37.4767
4321	El usuario 4321 ha iniciado sesión	2015-01-29 16:38:14.629594
4321	Se eliminó el respaldo 2015-01-27_09-03-41.sql	2015-01-29 16:38:34.844875
4321	Se eliminó el respaldo 2015-01-27_14-42-55.sql	2015-01-29 16:38:37.254733
4321	Se eliminó el respaldo 2015-01-27_16-11-10.sql	2015-01-29 16:38:39.532381
4321	Se restauró el respaldo 2015-01-29_16-38-41.sql	2015-01-29 16:35:34.006781
4321	Se modificó la unidad curricular PROYECTO NACIONAL Y NUEVA CIUDADANIA de la carrera 03 en la malla 1	2015-01-29 16:47:42.650975
4321	Se modificó la unidad curricular PROYECTO NACIONAL Y NUEVA CIUDADANIA de la carrera 03 en la malla 1	2015-01-29 16:48:22.940801
4321	Se modificó la unidad curricular PROYECTO NACIONAL Y NUEVA CIUDADANIA de la carrera 03 en la malla 1	2015-01-29 16:49:30.129929
4321	Se modificó la unidad curricular PROYECTO NACIONAL Y NUEVA CIUDADANIA de la carrera 03 en la malla 1	2015-01-29 16:49:35.562865
4321	Se eliminó el respaldo 2015-01-29_16-38-41.sql	2015-01-29 16:50:06.600512
4321	Se restauró el respaldo 2015-01-29_16-50-07.sql	2015-02-02 22:34:10.157895
12345678	El usuario 12345678 ha iniciado sesión	2015-02-02 22:34:23.304017
12345678	El usuario 12345678 ha iniciado sesión	2015-02-03 00:52:35.781483
4321	El usuario 4321 ha iniciado sesión	2015-02-03 01:27:27.581598
4321	El usuario 4321 ha iniciado sesión	2015-02-03 07:06:57.943524
4321	Se modificó la carrera PNF SEGURIDAD ALIMENTARIA Y CULTURA NUTRICIONAL	2015-02-03 07:24:11.646243
12345678	El usuario 12345678 ha iniciado sesión	2015-02-03 07:27:37.387372
4321	El usuario 4321 ha iniciado sesión	2015-02-03 07:47:51.082297
12345678	El usuario 12345678 ha iniciado sesión	2015-02-03 07:53:29.446417
4321	El usuario 4321 ha iniciado sesión	2015-02-03 08:03:48.695364
\.


--
-- Data for Name: malla; Type: TABLE DATA; Schema: public; Owner: -
--

COPY malla (cm, e, f, cc) FROM stdin;
1	1	2014-12-09	01
1	1	2014-12-09	02
1	1	2014-12-09	04
1	1	2014-12-09	05
1	1	2014-12-09	06
1	1	2014-12-09	07
1	1	2014-12-09	08
1	1	2014-12-09	09
1	1	2014-12-09	03
\.


--
-- Data for Name: observacion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY observacion (p, ci, d) FROM stdin;
2015-A	12722185	Total de Horas: 13\n
2015-A	14917178	Total de Horas: 16\n
2015-A	11303172	Total de Horas: 15\n
2015-A	10256095	Total de Horas: 18\n(2 Horas de trabajo voluntario)\n
2015-A	05655983	Total de Horas: 14\n
2015-A	07168412	Total de Horas: 5\n
2015-A	10898072	Total de Horas: 15\n
2015-A	11960173	Total de Horas: 14\n
2015-A	09389944	Total de Horas: 15\n
2015-A	08027793	Total de Horas: 5\n
2015-A	06953950	Total de Horas: 15\n
2015-A	04491973	Total de Horas: 15\n
2015-A	08044725	Total de Horas: 17\n(1 Horas de trabajo voluntario)\n
2015-A	08047120	Total de Horas: 14\n
2015-A	13966054	Total de Horas: 17\n(1 Horas de trabajo voluntario)\n
2015-A	09499979	Total de Horas: 18\n(2 Horas de trabajo voluntario)\n
\.


--
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: -
--

COPY perfil (cuc, ci) FROM stdin;
PIPT2	05655983
PISI4	05655983
PIFC4	08047120
PIAP1	08047120
PIMA3	07168412
PIPT2	13966054
PIAB4	13966054
PIIS3	14917178
PIAI4	14917178
PIMB3	04491973
PIBD2	04491973
PIMA3	08027793
PIAP1	10898072
aapoo	10898072
aapoo	06953950
PIPP2	06953950
EFSI	11960173
adAW	11960173
PIMT1	09389944
PIIS3	11303172
PIGP4	08044725
PIPT1	13966054
PIPT1	10256095
PIAC1	04054457
PIMT2	08027793
PIPT3	09499979
PIPT3	08044725
PIPT4	14917178
PIRA4	12722185
PIAC1	13723698
PIBD2	03966127
PIBD2	12722185
PIPNP03	11960173
\.


--
-- Data for Name: periodo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY periodo (fi, ff, t) FROM stdin;
2015-01-26	2015-02-09	p
2015-02-16	2015-04-19	a
\.


--
-- Data for Name: pertenece; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pertenece (ci, cc) FROM stdin;
00222222	02
02149217	05
02287821	04
03048184	01
03048184	02
03485766	01
03574698	01
03661985	08
03692342	04
03727339	01
03767311	02
03767311	05
03791326	02
03791326	05
03791326	01
03830917	01
03907664	01
03910823	06
03939687	07
03990590	02
03992405	07
04194292	01
04194292	02
04319574	06
04323036	01
04327492	01
04327492	02
04330086	01
04353143	02
04356042	08
04397227	01
04472778	02
04488065	02
04488256	01
04488420	07
04489957	06
04489957	07
04489957	04
04490481	05
04492233	01
04492233	02
04492356	01
04583431	02
04589713	01
04633259	01
04768948	08
04769890	05
04769890	01
04769890	02
04953940	01
05021210	01
05021210	02
05021210	05
05201033	01
05201622	02
05206267	01
05206372	06
05355610	04
05355610	07
05447146	06
05447146	04
05466076	01
05507269	07
05559793	02
05561396	01
05660032	03
05740339	07
05753564	01
05753564	04
05794416	07
05794416	04
05863317	02
05952723	01
06167653	01
06558454	01
06940439	01
06940439	02
07080727	01
07080727	05
07326064	01
07383992	03
07525829	06
07648734	07
07648734	01
07775026	01
07824945	01
07940076	01
08000617	01
08002316	02
08002737	06
08004161	02
08005159	01
08006388	02
08012641	05
08013569	01
08013671	01
08019784	01
08019784	02
08019784	06
08020758	02
08021306	07
08021736	04
08021736	02
08021736	08
08021842	08
08022340	01
08022671	06
08022671	04
08024531	02
08025750	02
08025750	05
08026122	02
08026122	05
08026155	02
08027408	02
08029045	01
08029045	05
08029696	02
08031064	02
08031064	05
08032732	02
08034029	05
08034029	02
08034300	01
08034371	05
08034371	01
08035484	01
08037619	04
08038332	05
08038332	02
08038611	01
08039294	05
08039463	01
08039498	07
08039498	05
08040787	02
08040787	04
08041510	04
08041620	02
08042559	04
08044768	07
08044768	04
08045258	02
08045307	02
08045307	05
08045536	01
08046408	07
08046659	01
08048794	07
08079222	01
08080375	01
08080375	02
08080676	02
08087415	02
08141857	03
08331149	05
08336414	04
08656400	07
08656400	04
08683060	04
03966127	04
06547603	03
06547603	04
04054457	03
04054457	02
04054457	01
04484976	02
04484976	03
04491607	02
04491607	03
04491973	03
05124273	03
05239250	03
06953950	03
07509507	03
07832738	03
07934845	04
07934845	03
08002183	03
08006639	03
08006639	04
08006639	01
08006639	02
08006639	07
08006639	05
08027793	03
08028204	03
08029075	03
08044725	03
08084432	03
07168412	03
08720054	05
08958864	05
08958864	04
09027962	01
09028433	07
09028433	04
09081546	01
09198636	02
09198636	01
09234597	04
09346062	01
09472514	04
09473151	05
09473374	05
09473374	02
09473423	04
09473423	02
09473567	01
09473852	08
09476268	07
09478674	01
09501330	01
09678973	03
09906067	04
09906067	02
09906615	01
10092487	06
10092487	05
10092487	02
10100205	04
10102108	01
10102259	06
10102454	02
10108950	05
10109087	08
10178133	03
10314511	04
10712408	02
10713529	02
10714070	06
10715404	07
10718091	01
10718224	07
10718224	04
10718224	01
10718393	04
10720364	04
10720364	05
10720364	01
10797122	05
11067484	07
11108398	07
11108398	04
11319364	02
11460000	04
11460000	06
11460813	02
11462979	06
11462979	01
11463296	07
11465653	07
11467397	04
11467713	05
11468201	05
11783461	06
11912316	04
11952770	02
11952770	04
11959505	05
12048353	04
12329797	03
12346208	07
12352023	02
12353031	01
12458260	02
12776731	04
12776731	07
12776731	05
12779069	05
12779975	02
12817844	04
12839616	03
13013152	06
13014707	02
13098188	02
13098422	05
13098422	02
13098763	05
13098763	02
13098948	01
13099384	04
13099384	02
13099384	01
13524820	05
13524820	01
13525905	04
13649962	01
13803490	02
13947142	03
13966605	08
13967486	03
14131053	01
14249554	01
14267080	07
14267080	04
14267842	07
14400087	02
14589222	02
14700296	07
14839454	05
14866857	03
14916156	02
14916156	01
14917365	01
14917541	01
15142314	01
15175795	04
14400356	02
15223533	01
15381185	04
15516303	02
15516303	01
15516332	04
15565857	04
15622903	05
15754311	01
15754311	02
15754922	07
15756979	05
15920086	07
15920086	04
15920291	04
15920291	07
15921593	02
16020374	02
16199115	02
16199115	01
16285988	06
16285988	01
16377291	02
16514402	03
16964770	04
16964770	07
17129511	01
17130729	07
17238348	08
17456574	01
17456954	02
17456954	05
17456954	01
17499585	02
17523454	04
17664938	05
13524109	03
09499979	01
14268612	03
09201868	03
09474147	03
09475173	04
09475173	03
09476031	03
09499979	04
10087275	02
10087275	05
10087275	03
10104966	03
10104966	04
10104966	01
10256095	03
10898072	03
11303172	03
11466224	03
11705856	03
11705856	04
11954144	03
11956576	03
11956576	04
11960173	03
09389944	03
13014569	03
13477378	03
13524109	01
13524109	04
13648603	03
13966054	03
14401340	03
15296169	03
14917178	03
12722185	03
09389944	01
17770813	01
18310574	01
18581024	07
18581024	04
18796815	02
18796996	05
18796996	02
18962414	01
19421996	08
19440209	01
81423693	02
12345678	03
87654321	02
09240195	02
08047120	03
03966127	08
03966127	03
09499979	03
13723698	03
05655983	03
\.


--
-- Data for Name: profesion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY profesion (cp, d) FROM stdin;
000	SIN ASIGNAR
001	INGENIERO EN SISTEMAS
002	LIC. CONTADURIA
003	INGENIERO CIVIL
005	T.S.U. CONTADURIA
006	T.S.U. INFORMATICA
007	T.S.U. AGROTECNIA
008	T.S.U. C0NSTRUCCION CIVIL
009	ING. QUIMICO
010	T.S.U. MANEJO DE EMERGENCIAS A.C.D.
011	LIC. EN ADMINISTRACION
012	MATEMATICO
013	INGENIERO INDUSTRIAL
014	PSICOLOGO
015	SOCIOLOGO
016	ING. EN INFORMATICA
017	ING. ELECTRICO
018	ING. MECANICO
020	TECNOLOGIA PECUARIA
021	TECNOLOGIA AGRICOLA
022	LIC. MATEMATICA
023	INGENIERO FORESTAL
024	LIC. COMUNICACION SOCIAL
026	LIC. EDUCACION
027	LIC. ADMINISTRACION EMPRESAS
029	LIC. LETRAS
030	LIC. EDUCACION FISICA
031	ARQUITECTO
032	INGENIERO DE MINAS
033	LIC. NUTRICION
034	MEDICO VETERINARIO
035	ABOGADO
036	POLITOLOGO
037	CRIMINOLOGO
038	LIC. HISTORIA
039	LIC. IDIOMAS MODERNOS
040	LIC. MEDIOS AUDIOVISUALES
041	LIC. BIOLOGIA
042	LIC. FISICA
043	LIC. QUIMICA
044	GEOGRAFO
045	FARMACEUTICO
046	LIC. BIOANALISIS
047	MEDICO
048	LIC. ENFERMERIA
049	TECNICO SUPERIOR RADIOLOGO
050	ODONTOLOGO
051	ING. AGRICOLA
052	LIC. DISEÑO INDUSTRIAL
053	LIC. ESTADISTICA
054	ECONOMISTA
055	LIC. FILOSOFIA
056	ING GEOLOGO
057	FARMACEUTICA
\.


--
-- Data for Name: profesor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY profesor (ci, n1, n2, a1, a2, c, cat, ded, s, ce, tf, tm, h) FROM stdin;
03992405	MARIA	MAGALY	VALERO	LACRUZ	0	0	0	01				0
14267080	YULECXY 	AURORA	UZCATEGUI	ARAQUE	0	0	0	01	YULUZAR@HOTMAIL.COM	0274-2528083	0414-3751830	0
00222222	JESUS		RODRIGUEZ	IGNACIO	0	0	0	01				0
00584711	HECTOR	N	MEZA	F	0	0	0	00				0
03048184	JOSE		SOLANO		0	0	0	01				0
03574698	ANGEL	SAUL	VALERA	PACHECO	0	0	0	01	DESMODUS.ROT@HOTMAIL.COM	02754112264	04149798302	0
04768948	BEATRIZ CAROLINA	DEL CARMEN	ANGELI	MAURY	0	0	0	01	BEATRIZCAROLINAANGELI@GMAIL.COM		04247349806	0
07080727	IVAN		LOPEZ		0	0	0	01				0
08013569	JOSE	GREGORIO	RODRIGUEZ	ROJO	0	0	0	06	CARGREGOREME@HOTMAIL.COM		0414-7474077	0
08039294	LILIANA		DURAN		0	0	0	01	LDGEOLOGA@GMAIL.COM			0
08039463	RAMSES	ALONZO	PERNIA	SUAREZ	0	0	0	01	RAMSESPERNIA0606@HOTMAIL.COM			0
09198636	LUIS	ALBERTO	MOLINA	GUTIERREZ	0	0	0	01	LUISALBERTOMOLINA1963@HOTMAIL.COM		0416-6782813	0
10102259	ALIX		ANGULO		0	0	0	01				0
10102454	GERARDO	ALEXIS	VIELMA	SANCHEZ	0	0	0	01	GVS97@HOTMAIL.COM		0416-1719906	0
11463296	KARY	YUSELIN	UZCATEGUI	NAVA	0	0	0	01	KARINANAVA2006@HOTMAIL.COM		04265126395	0
13098763	AMALUZ	CAROLINA	ANGARITA	ALBORNOZ	0	0	0	01	AMALUZDELOPEZ@HOTMAIL.COM		0426-5731334	0
07357589	CIRA		GIL		0	0	0	00				0
10718224	NORA	PATRICIA	ROJAS	FENANDEZ	0	0	0	01	PATRICIAROJAS73@GMAIL.COM			0
02149217	CESAR	RAFAEL	GUTIERREZ		0	0	0	01	CESGUTIERREZ@HOTMAIL.COM	02742211931		0
02287821	EDUARDO	ALI	CALDERON	MORA	0	0	0	01	CALDERONEDUARDO@INTER.COM.VE	0274 2217690	0414 7440176	0
00678538	HUGO	JOSE	SALAS	R	0	0	0	00				0
00976855	JOSE	J	MUÑOZ	U	0	0	0	00				0
01111111	JUAN 	CARLOS	VALERA	RUIZ	0	0	0	00				0
01146089	DILCAR		CARMONA		0	0	0	00				0
01656140	NEVILLE	R	ROMAN	M	0	0	0	00				0
01687450	OTTO		ARAUJO	G	0	0	0	00				0
02286020	JOSE	L	RAMIREZ	M	0	0	0	00				0
02362548	ISRAEL	G	MEDINA		0	0	0	00				0
02455516	JOSE	M	LEON	F	0	0	0	00				0
02457912	RICARDO	A	CORREDOR	T	0	0	0	00				0
02617975	ANTONIO	J	MORENO		0	0	0	00	MORENOCHACON39@HOTMAIL.COM	0274 2633213	0414 7410259	0
02737443	JESUS		PORTILLO		0	0	0	00	JESUSPORTILLOI@CANTV.NET	0274 2716532	0416 8742684	0
02814719	TERESA		OMAÑA	M	0	0	0	00				0
02838121	RAUL		LEON	PALENCIA	0	0	0	00				0
02850226	EDMART		HERNANDEZ	F	0	0	0	00				0
02890587	HERNANDO		CHACON		0	0	0	00				0
02957596	GABRIEL		GONZALEZ		0	0	0	00				0
03006127	LUIS	A	RIVAS	P	0	0	0	00				0
03032135	FRANLKIN	O	QUINTERO	D	0	0	0	00				0
03038774	CARLOS		SANCHEZ		0	0	0	00				0
03062497	ZAIRA	COROMOTO	BOUQUET	MOLINA	0	0	0	00	ZAIRA01BOUQUET@HOTMAIL.COM			0
03082706	ORLANDO		GUTIERREZ		0	0	0	00				0
03293648	EUTIMIO		CONTRERAS	R	0	0	0	00	ETICON@VANTV.NET	0274 2662665	0416 4726991	0
03309773	TOMAS	A	RIVAS	S	0	0	0	00	TOALRISA@YAHOO.ES		0416 6743705	0
03370453	MAGDALENA		GONZALEZ	 M	0	0	0	00				0
03385972	HECTOR		SILVA		0	0	0	00				0
03428254	MARCIAL		SANCHEZ		0	0	0	00				0
03442051	AQUILES	RAFAEL	MACUARE	MACURE	0	0	0	00				0
03469416	SONIA		RUIZ		0	0	0	00				0
03474020	NESTOR		OJEDA		0	0	0	00				0
03479772	VICTOR	E	PONCE	G	0	0	0	00				0
03496268	RICARDO		PEREZ	D	0	0	0	00				0
03498015	JOSE	A	VIELMA	M	0	0	0	00				0
03498205	HOMERO		ANGULO	S	0	0	0	00				0
03499333	LAUDELINO		QUINTERO	D	0	0	0	00				0
03522090	JORGE	A	BASTIDAS	M	0	0	0	00				0
03549662	OMAR	A	SINZA		0	0	0	00				0
03554216	ANA	L	TORO	A	0	0	0	00				0
03586551	IRMA		MARTINEZ	USECHE	0	0	0	00				0
03635921	IDA		LOAIZA	M	0	0	0	00				0
03726896	ANTONIO	F	AYESTARAN		0	0	0	00				0
03752100	MARCOS	J	RAMIREZ	H	0	0	0	00				0
03766382	RIGOBERTO		ARAUJO	P	0	0	0	00				0
03767094	ROMAURO		RODRIGUEZ	R	0	0	0	00				0
03813571	TEODORO		PEARCE		0	0	0	00				0
03814444	EDGAR		AMADO		0	0	0	00				0
03824022	GUSTAVO		DOMINGUEZ	S	0	0	0	00				0
03853571	JEANNY		MEZA		0	0	0	00				0
03939324	CARLOS	E	QUINTERO	M	0	0	0	00				0
03939832	AURA	J	BELANDRIA		0	0	0	00				0
03991661	JOSE		CAMACHO	R	0	0	0	00				0
03992823	RAFAEL		MARQUEZ	C	0	0	0	00				0
03995466	RODOLFO		NEWMAN	M	0	0	0	00				0
03995911	ANTONIO	R	PEÑA	P	0	0	0	00				0
04041213	FRANCISCA		QUINTERO	C	0	0	0	00				0
04059960	ELIGIO	J	SALAS	P	0	0	0	00				0
04063136	FREDDY		OLMOS		0	0	0	00				0
04092339	DORA		ZAMBRANO		0	0	0	00				0
04143374	ROMEL	A	RODRIGUEZ	Z	0	0	0	00				0
04145751	ANA		CONTRERAS	RAMIREZ	0	0	0	00				0
04163685	ALEXIS		MARTINEZ	D	0	0	0	00				0
04173394	CARMEN	I	REYES		0	0	0	00				0
04203537	GERARDO		ESCALANTE	P	0	0	0	00				0
04206639	ZONIA	R	RAMIREZ	S	0	0	0	00				0
04246098	ALIS		MUJICA	A	0	0	0	00				0
04271043	FREDY		GARCIA	R	0	0	0	00				0
04323352	ALFREDO		PORTILLO		0	0	0	00				0
04324337	REBECA		URBANETA		0	0	0	00				0
04334862	ALEXI		LANDAETA	Y	0	0	0	00				0
03485766	HERNAN	ARMANDO	NIETO	VILLALOBOS	0	0	0	01				0
03661985	ODETTE	MARGARITA	REGGETI	DE PEREZ	0	0	0	01	Odette.pnffono@gmail.com		0424-1507514	0
03692342	MIGDALIA 	DEL CARMEN	GARAY	AGUILAR	0	0	0	01	MIGDAGAR@HOTMAIL.COM			0
03727339	NESTOR	ORLANDO	LEON	GONZALEZ	0	0	0	01	NESLANLEO@YAHOO.ES		0416-8736738	0
07168412	JESUS	ANTONIO	DELGADO	MENDOZA	1	1	1	01	JESUSDELG1@GMAIL.COM			5
15296169	ROSALY	CAROLINA	MENDOZA	MARQUEZ	1	6	1	01	MENDOZAROSALY@HOTMAIL.COM	02742661228	04264153365	0
03767311	MAGDALENA	JOSEFINA	TORRES	MORALES	0	0	0	01	MAGDALENATORRESM@GMAIL.COM		0424-7040173	0
03830917	ORLANDO	RAFAEL	GARCIA	ROMERO	0	0	0	01	ORLANDOGARCIA@INTERCABLE.NET			0
03791326	CARLOS	HUMBERTO	GUTIERREZ	QUIROZ	0	0	0	01	CARLOSHGQ@HOTMAIL.COM			0
03907664	CARMEN		MEDICCI 	B	0	0	0	06				0
03910823	EWALDO		SANDOVAL	S	0	0	0	01				0
03939687	MAGALI	ASTRID	MOLINA	ROJAS	0	0	0	01				0
03990590	ANTONIO	JOSE	MEJIAS	MARQUINA	0	0	0	01	ANTONIOJMM@CANTV.NET			0
04194292	ARVIN	ENRIQUE	PINEDA	QUERALES	0	0	0	01	ARVINP@CANTV.NET		04164740981	0
04319574	IRAIDE	CELINA	ZERPA		0	0	0	01				0
04323036	LUIS	ABDENAGO	PERDOMO	PEREZ	0	0	0	06				0
04327492	RAMIRO	DE JESUS	GARCIA	MATOS	0	0	0	01	RAMIROGMATOS@GMAIL.COM		0414-9742712	0
04353143	ABDEMAR	JOSE	AYESTARAN	FABIANI	0	0	0	01	ABDEMAR90@HOTMAIL.COM		0416-6740678	0
04330086	MARCIAL	EVANAAN	BRACHO		0	0	0	06	MARCIALBRACHO@HOTMAIL.COM			0
04356042	MYRIAM	TERESA	ANZOLA	DE DIAZ	0	0	0	01				0
04397227	RAFAEL	GREGORIO	BUSTAMANTE		0	0	0	01	BUSTARAF@ULA.VE			0
04491963	YOBEIRA		VARELA	PULIDO	0	0	0	00				0
04530705	RUTH		BLANCO		0	0	0	00				0
04703287	ANGEL		ALASTRE	PEREZ	0	0	0	00				0
04768469	MARINELLA		LOZADA		0	0	0	00				0
04946336	FREDDY		MOLINA		0	0	0	00				0
04977183	MARIA		GONZALEZ	V	0	0	0	00				0
05024784	BELKIS	J	CONTRERAS	G	0	0	0	00				0
05032481	LUIS		RAMIREZ		0	0	0	00				0
05054721	CECILIA		PORTILLO		0	0	0	00				0
05116030	MARIA	M	BRICEÑO	B	0	0	0	00				0
05131347	SUSANA	E	SCHULTS	B	0	0	0	00				0
05199025	MARILU		CARRILLO	D	0	0	0	00				0
05200953	RAFAEL		CAMACHO		0	0	0	00				0
05202671	GERARDO		PICON		0	0	0	00				0
05203329	FRANCISCO		QUINTERO	R	0	0	0	00				0
05206583	ALIZ		HERNANDEZ		0	0	0	00				0
05206598	ALBERTO		RODRIGUEZ		0	0	0	00				0
05206999	CARLOS	OMAR	SANTIAGO		0	0	0	00	CARLOSANTI5@HOTMAIL.COM	0274 2638075	0414 0786912	0
05307768	PEDRO		CANDELA		0	0	0	00				0
05351609	ARMANDA		OJEDA		0	0	0	00				0
05435898	IRNE		GIL	MATA	0	0	0	00	IRNE11GIL@HOTMAIL.COM		0416 0709031	0
05439749	JUAN	J	ROMAN	R	0	0	0	00				0
05446019	TERESITA		MONTOYA		0	0	0	00				0
05446471	MIRIAN		YEPEZ		0	0	0	00				0
05446661	GALDYS		ROJAS		0	0	0	00				0
05485302	VIRGILIO		RODRIGUEZ	P	0	0	0	00				0
05509322	NIVIA		LEON		0	0	0	00				0
05654710	JUAN		CACERES		0	0	0	00				0
05654904	MIGUEL		MORENO		0	0	0	00				0
05655737	MORELA	SOLANGE	VILLAMIZAR		0	0	0	00				0
05728108	IRMA		RAMIREZ		0	0	0	00				0
05892364	INGRID		SOSA		0	0	0	00				0
05945180	MARIA	TERESA	MALVACIAS		0	0	0	00				0
06018398	ARNOLDO		MARQUEZ		0	0	0	00				0
06308181	ENRIQUE	A	SALAZAR	B	0	0	0	00				0
06426190	ERIBEL		MARQUINA		0	0	0	00				0
06908190	ALEJANDRO		LIÑAYO		0	0	0	00				0
04472778	IGNACIO	ALEXIS	RODRIGUEZ	CARRERO	0	0	0	01		02742445382		0
04488065	JOSE	ALEXANDER	PEREZ	MARQUEZ	0	0	0	01	APMJOSE@HOTMAIL.COM			0
04488256	JUDITH		ANGARITA		0	0	0	03				0
04488420	JOSE	BALTAZAR	GUERRERO	DIAZ	0	0	0	01				0
04489957	ZOILA	TERESA	SOSA	BARRIOS	0	0	0	01				0
04490481	DORIS	M	MORANTES	R	0	0	0	01	MORANTESDORISM@HOTMAIL.COM		0414-0814673	0
04492233	GILBERTO	VALDEMAR	BELANDRIA	SARMIENTO	0	0	0	01	BELANSAR57@YAHOO.COM			0
04492356	HUMBERTO	EGMIDIO	RIVAS	RIVAS	0	0	0	01	HRIVAS_2000@YAHOO.ES			0
04583431	CARLOS	G	MELENDEZ	D	0	0	0	01				0
04633259	OMAR		GUALDRON		0	0	0	01				0
04589713	HENRY	BALOY	PORRAS		0	0	0	06	HENBAPO@HOTMAIL.COM	02742458034	04166741960	0
04769890	VIRGINIA	ELENA	RAMIREZ	MAGO	0	0	0	01	RVIKY1@HOTMAIL.COM		0416-6741109	0
04953940	WILFREDO		MOLINA	G	0	0	0	01				0
05021210	CARLOS	EVELIO	CASTILLO	BAUTISTA	0	0	0	01	INGCASTICAR@HOTMAIL.COM		0416-4702766	0
05201622	ALBERTO		ARANGUREN		0	0	0	01				0
05201033	CARMEN	JUDITH	GRATEROL	ROJAS	0	0	0	06	GRATEROLJUDITH@HOTMAIL.COM		0426-8298407	0
05206267	GLADYS	COROMOTO	AGUILAR	GUERRERO	0	0	0	01	GLADYSAGUILAR@HOTMAIL.COM		0414-9772740	0
05206372	DENIS		ROMERO		0	0	0	01				0
05355610	ALFREDO	SEGUNDO	LUJANO	VARELA	0	0	0	01				0
05447146	DOLLY		CARDOZO		0	0	0	01				0
05466076	ESTEBAN		BRICEÑO		0	0	0	01				0
05507269	LOURDES	F	VALVUENA		0	0	0	01				0
05559793	EDITH	IRAIZ	CALDERON	SARAS	0	0	0	01	EICS_AMIGOS@HOTMAIL.COM		0414-7456832	0
05561396	MANUEL	ANTONIO	OLIVEROS	CARRUYO	0	0	0	01	MAO5561@HOTMAIL.COM	0274-2216348	0426-5580062	0
05660032	NANCY	TERESA	ANTOLINEZ	GONZALEZ	0	0	0	05	NANCYTER@GMAIL.COM		0416-7769536	0
05740339	CECILIA	MAGDALENA	GRANADOS	DE BRITO	0	0	0	01				0
05753564	SANTO	SEGUNDO	ROMERO	CORONEL	0	0	0	01	VERVHIJA@YAHOO.ES			0
05794416	MARIELA		MENDOZA		0	0	0	01				0
05863317	OSCAR	GERONIMO	MUJICA	FIGUEROA	0	0	0	01	OSCAR.MUJICA_89@HOTMAIL.COM		0426-5507175	0
06167653	JESUS	ALECIO	ROQUE	MORENO	0	0	0	06	CHUYALFA1@GMAIL.COM		0414-0557319	0
04054457	VICTOR	ALBERTO	MEZA	MORALES	1	3	2	01	VICTORMEZA02@HOTMAIL.COM			0
04484976	NELSON	ANTONIO	CORREDOR	TREJO	1	1	1	01	NCORREDORTREJO@GMAIL.COM	0274 2442582		0
04491607	JESUS	ALFONSO	RIVAS	CHACON	1	1	1	01	ALFONSORIVAS17@HOTMAIL.COM		0416-9980201	0
04491973	ANA	CELINA	MUÑOZ	GARCIA	1	5	1	01				15
05124273	CORRADO		CANTO	PACHECO	1	1	1	01	CCANTOPACHECO@HOTMAIL.COM			0
05239250	GILBERT	ARTURO	SANTELIZ	ZERPA	1	1	1	01	GILBERTSANTELIZ@GMAIL.COM			0
05952723	LETICIA	DEL CARMEN	MOGOLLON	DE CHALBAUD	0	0	0	01				0
09279327	LUZ	MARINA	VASQUEZ		0	0	0	00				0
06558454	ANDRES	JULIAN	FORTI	CAVAZZONI	0	0	0	01	AFORTI1963@HOTMAIL.COM, AFORTI@INIA.GOB.VE			0
06940439	ZANDRA	VIRGINIA	ORTEGA	GUERRA	0	0	0	01	ZANDRAVIRGINIA@YAHOO.ES		04146086140	0
07199187	LUIS		ORDOÑEZ		0	0	0	00				0
07218768	ORQUIDEA		SALINAS		0	0	0	00				0
07545873	ERNESTINA		GALINDEZ		0	0	0	00				0
07725635	MARLENE		GARCIA		0	0	0	00				0
07772181	ARTURO	L	SULBARAN		0	0	0	00				0
08000405	WILLIAM		SARMIENTO		0	0	0	00				0
08001969	OLGA		MUÑOZ		0	0	0	00				0
08004481	CIRO		VALERA		0	0	0	00				0
08005373	FLOR	G	GONZALEZ	M	0	0	0	00				0
08006286	VIVIANA	C	LOBO	D	0	0	0	00				0
08008780	JESUS		MENDEZ		0	0	0	00				0
08011218	JORGE		MORENO		0	0	0	00				0
08011554	JOSE		BRICEÑOI		0	0	0	00				0
08021739	SORAIDA		ANGULO	UZCATEGUI	0	0	0	00				0
08022263	ARMANDO	A	PEREZ	D	0	0	0	00				0
08023900	WISTON		BELANDRIA		0	0	0	00				0
08025259	ELENA		MORA	N	0	0	0	00				0
08025261	MARY		MORA	N	0	0	0	00				0
08025941	JESUS		MARQUEZ		0	0	0	00				0
08029052	MARIA		CELIS		0	0	0	00				0
08029795	CLARA		ARELLANO		0	0	0	00				0
08031306	MANUEL		FERNANDEZ	R	0	0	0	00				0
08031593	ORLANDO	ALBERTO	QUINTERO	SUESCUN	0	0	0	00	ORLANDOQUIN2001@YAOO.COM			0
08031757	ANA	DEL CARMEN	RIVAS	RANGEL	0	0	0	00			04149740520	0
08031821	ANTONIO		MARTINEZ		0	0	0	00				0
08034214	ARGELIA	DEYANIRA	CONTRERAS	DAVILA	0	0	0	00	DEYA17@HOTMAIL.COM	02746350044	04141796765	0
07383992	ELIZABETH	DE LA TRINIDAD	MONTILLA	VALERO	0	0	0	05	LICHA_M20@HOTMAIL.COM		0424-5693293	0
07326064	RAMON	FERNANDO	RIERA	TONA	0	0	0	01	RRIERA60@HOTMAIL.COM	0274-2452722	0416-6562052	0
07525829	CARMEN	YSOLINA	GUTIERREZ	PITTER	0	0	0	01				0
07648734	MARIA	TRINIDAD	OTALVORA		0	0	0	01	OTALVORAMM@HOTMAIL.COM	0274 2211916	0414 7459433	0
07775026	MARIELA	C	OLIVEROS	C	0	0	0	01	MARIELAOBRACHO@HOTMAIL.COM			0
07824945	THAIS	COROMOTO	BRACHO	URDANETA	0	0	0	01	THAISBRACHO49@GMAIL.COM		0414-7172393	0
07940076	JOSE	BONAMI	CANDALES	PEÑA	0	0	0	06				0
08000617	OMAR	ENRRIQUE	FERNANDEZ	CASTILLO	0	0	0	01	VENAOMAR88@HOTMAIL.COM			0
08002316	JESUS	MANUEL	SANCHEZ	VILLARREAL	0	0	0	01	SANVI_3@HOTMAIL.COM		0414-5416339	0
08002737	JOSE	JUVENCIO	QUINTERO	DELGADO	0	0	0	01				0
08004161	MARIA	XIOMARA	GIL	OTAIZA	0	0	0	01	MAXIOGILO12@GMAIL.COM			0
08005159	RIGOBERTO		PAREDES		0	0	0	01			04144569878	0
08006388	ROMAN	ALI	MARQUEZ		0	0	0	01	TIERRACRUDA@HOTMAIL.COM		0424-7160374	0
08012641	ANA	TERESA	QUINTERO	DE RUGGERO	0	0	0	01	ANATQDR@GMAIL.COM		0424-7671634	0
08019784	LIRIA		GUTIERREZ	DE ROJAS	0	0	0	01	LIRIOS_GUTIERREZ@HOTMAIL.COM			0
08013671	AIDA	DOLORES	PEÑA	DE PUENTES	0	0	0	06	ARIES_AIDA@HOTMAIL.COM			0
08020758	MARIA	GRAZIA	MOCCI	DERIU	0	0	0	01	CUADRIFOLIUM@YAHOO.COM	02742667245	04149721770	0
08021306	LUIS	APOLINAR	ALTUVE		0	0	0	01				0
08021736	ROSA	MARIA	VASQUEZ	FALCON	0	0	0	01	ROSA_MARIAVF@HOTMAIL.COM		0416-2747257	0
08021842	JOSE	RAMON	DIAZ		0	0	0	01	joserdiazp@yahoo.es		0274-4176258	0
08022671	JOSE 	HUMBERTO	QUINTERO	DAVILA	0	0	0	01		02742631167	04147444352	0
08022340	JAIRO	ALONZO	PEREZ	RUIZ	0	0	0	06	JAIRO_ALONSO_P_R@HOTMAIL.COM			0
08024531	EMIRO		RIVAS	RIVAS	0	0	0	01				0
08025750	VICTOR	MANUEL	CONTRERAS	CONTRERAS	0	0	0	01	VIMACO7@HOTMAIL.COM		0424-7214303	0
08026122	CARLA		SECCO	TRACK	0	0	0	01	CARLASECO@GMAIL.COM	0274-2447227		0
08026155	AURA	YANIRA	SANTANA	VIVAS	0	0	0	01				0
08027408	OLGA	MARITZA	DE FRENZA	HERNANDEZ	0	0	0	01	MARIDEFREN@HOTMAIL.COM		0412 6711531	0
08029045	AMNERIS	TEOTISTE	GUERRERO	MOLINA	0	0	0	01	AMNERISGUERRERO@YAHOO.COM		0426-5725885	0
08029696	ANA	CRISTINA	PACHECO	LUGO	0	0	0	01	ANA_CRISTINAPACHECO@HOTMAIL.COM		0416-6740590	0
08031064	GLADYS	ELENA	ARAUJO	DIAZ	0	0	0	01	GEAP54@YAHOO.COM	02742522383	0416-3795128	0
08032732	AURA	CECILIA	QUINTERO	D JESUS	0	0	0	01	AURACQD@HOTMAIL.COM		0414-7466491	0
08034029	FRANCISCO	ALONSO	MARQUEZ	SOSA	0	0	0	01	FRANMARQ25@YAHOO.COM	02742632918	04149792750	0
08034300	PEDRO	WILLIAM	GONZALEZ	GUILLEN	0	0	0	01	PWGG@HOTMAIL.COM			0
08034371	JAVIER	ALEXIS	TELLEZ	GIL	0	0	0	01	JATELL@HOTMAIL.COM		0416-2704767	0
08035484	PIO	JOSE	MUÑOZ	ANGULO	0	0	0	01	PJOTA15@HOTMAIL.COM	0274 22160322	0416 5762472	0
08037619	MIRIAM	DEL CARMEN	MUÑOZ	RAMIREZ	0	0	0	01	PROF_MIRIAM_M@HOTMAIL.COM		04267027698	0
08038332	MARJORIE		UZCATEGUI		0	0	0	01	MAYOUZCA@HOTMAIL.COM		0416-7743326	0
08038611	FRANK	REINALDO	RODRIGUEZ	CALDERON	0	0	0	01	SRODRIGUEZ@INIA.GOB.VE			0
10102108	YASMELIA	DEL CARMEN	ZERPA	VIELMA	0	0	0	01				0
08039160	JOSE	GREGORIO	ANGULO	RODRIGUEZ	0	0	0	00	GREGORIOANGULO@YAHOO.COM	0474 2210079	0416 6740369	0
08040671	LEIRA		MORA		0	0	0	00				0
08041985	JESUS		MONTILLA		0	0	0	00				0
08045140	HERBERT		MORA	NEWMAN	0	0	0	00				0
08081463	JOSE	MARIO	UZCATEGUI		0	0	0	00				0
08081684	MARY		ARAUJO		0	0	0	00				0
08458508	MARIELA		RODRIGUEZ		0	0	0	00	MARTESAN3@YAHOO.COM	0274 2218459	0416 6746377	0
06953950	ADOLFO	JOSE	ROMERO	GONZALEZ	1	3	2	01	ADROME67@YAHOO.ES			15
07934845	MARIA	CAROLINA	MARQUEZ	UZCATEGUI	1	5	1	01	MCAROLINAMAR@HOTMAIL.COM			0
08002183	LUIS	ENRIQUE	ROJAS	RAMIREZ	1	1	3	01	ROJASLUIS64@GMAIL.COM			0
08006639	JOSE	DE JESUS	MARQUEZ		3	2	3	01	CHEPOMAR@HOTMAIL.COM	2664709	0414-7166051	0
08028204	NANCY	MARGOT	VILLARREAL	VILLANUEVA	3	2	1	01	NANAVILLARREAL@GMAIL.COM		04147451751	0
08029075	JERSON	ORLANDO	ZAMBRANO	GUERRERO	1	2	1	01	JERSONZAMBRANO@YAHOO.COM		04147170095	0
08027793	JUDIT	ESPERANZA	RODRIGUEZ	RIVERO	1	1	1	01	RODRIGUEZ.JUDITH593@GMAIL.COM			5
09170633	PEDRO		AREYANO		0	0	0	00				0
09222772	NGUYEN		MANRIQUE		0	0	0	00				0
09372327	HERIMAR		QUINTERO		0	0	0	00				0
09398123	ALBA		FUEMAYOR		0	0	0	00				0
09470586	MARIA		QUINTERO		0	0	0	00				0
09471742	ALVIO		MARQUEZ		0	0	0	00				0
09472935	VIRGINIA		RONDON		0	0	0	00				0
09473824	MARIA	ADRIANA	LOBO	DUGARTE	0	0	0	00				0
09474583	YUDITH		MEZA		0	0	0	00				0
09476548	DOUGLAS		GIL		0	0	0	00				0
09476680	FABIO		VIELMA		0	0	0	00				0
09496713	ELVIRA		MORENO		0	0	0	00				0
08039498	TIBAYRE		FERNANDEZ		0	0	0	01				0
08040787	RUBEN	DARIO	VOLCANES	CORREDOR	0	0	0	01	RUBENVOLCANES13@HOTMAIL.COM	0274-2662756	0426-5710547	0
08041510	EMIRO	ALFREDO	NAVA	FLORES	0	0	0	01	EMIRONAVA@HOTMAIL.COM, EMIRONAVA@CANTV.NET	0274-2633054	0416-6740835	0
08041620	RAMIRO	ENRIQUE	PRATO	VICUÑA	0	0	0	01	RAMIROPRATO@HOTMAIL.COM		0414-7445995	0
08042559	JHONNY	ENRIQUE	SANCHEZ	VILLAREAL	0	0	0	01	JHONYSANCHEZV@YAHOO.COM		0414-7179562	0
08044768	JORGE	LUIS	FLORES	CALDERON	0	0	0	01	JORGELFLORES5@HOTMAIL.COM			0
08045258	CARLOS	EDUARDO	SUESCUM	RODRIGUEZ	0	0	0	01	SUESCUM99@HOTMAIL.COM	0274-2213072	0414-9793280	0
08045307	BELKY	COROMOTO	SULBARAN	MALDONADO	0	0	0	01	BELKY_SULBARAN@YAHOO.COM		0414-7466065	0
08045536	RAFAEL	EDGARDO	AROCHA	HERNANDEZ	0	0	0	06				0
08046408	DAVID	JOSE	FLORES	ROJAS	0	0	0	01	INGDAVIDFLORES@GMAIL.COM			0
08046659	MILTON		SILVA		0	0	0	01				0
08048794	GRIZETA		UZCATEGUI	BARRIOS	0	0	0	01	JOANKTP@HOTAMIL.COM			0
08079222	MAGALY	ALICIA	VALERO	DE RODRIGUEZ	0	0	0	01	MAGAVA54@YAHOO.ES	0274 2522281	0416 0765906	0
08080375	MARIO		LANZA	CAMACARO	0	0	0	01	LANZA.C@HOTMAIL.COM			0
08080676	HERLINDA	CECILIA	MONTOYA	DE HIGUERA	0	0	0	01	LEORIANA@HOTMAIL.COM		04168876722	0
08087415	LIBIA	Y	MARQUEZ	C	0	0	0	01				0
08141857	BORIS	ASDRUBAL	ARROYO	VERGARA	0	0	0	05	ARROBOR@YAHOO.ES		04265741327	0
08331149	JESUS		VASQUEZ		0	0	0	01				0
08336414	JOSE		VASQUEZ		0	0	0	01				0
08656400	PEDRO		MANZANO		0	0	0	01				0
08683060	LILIAN	AURORA	PUENTES	PEÑA	0	0	0	01	LILIANPUENTES1@HOTMAIL.COM			0
08720054	HENRY	EDUARDO	GARMENDIA	PAREDES	0	0	0	01	HEGP2007@YAHOO.COM		0416-4853146	0
08958864	CARLOS		ROJAS		0	0	0	01				0
09027962	ALCIRA		MONTERO	QUIÑONEZ	0	0	0	06				0
09028433	MARITZA	JOSEFINA	PEÑA	CANDELA	0	0	0	01	MARI_P2005@HOTMAIL.COM		0412 6488488	0
09081546	SIMON	DE JESUS	HOYO	ARAUJO	0	0	0	06	SIMONDJHOYOA@HOTMAIL.COM			0
09234597	PEDRO		GUTIERREZ		0	0	0	01	PEDROGUTIERREZ202@HOTMAIL.COM			0
09346062	YRAIDA	YNDIRA	CASTILLO	CAMARGO	0	0	0	06				0
09472514	JOSE	LUIS	MARQUEZ		0	0	0	01				0
09473151	JAIRO	RAMON	PEÑA	PEÑA	0	0	0	01				0
09473374	FREDY	ENRIQUE	RIVAS	VALERO	0	0	0	01	INGORIVAS@HOTMAIL.COM		0416-5025988	0
09473423	IDALBA	DEL SOCORRO	PEREZ	MORA	0	0	0	01	IDALSER@YAHOO.COM		0416-5719995	0
09473567	LISBETH	JANE	DIAZ	DE GARCIA	0	0	0	01	LISBETHJANE@GMAIL.COM			0
09473852	CARLOS	MANUEL	SANCHEZ	GARCIA	0	0	0	01				0
09476268	LUSBETH	DEL VALLE	RAMIREZ	PALAZZI	0	0	0	01	LULYRP@HOTMAIL.COM			0
09478674	CARLOS	ANTONIO	ZORDAN	ZORDAN	0	0	0	01				0
09501330	ORLANDO	ANTONIO	OBERTO	URBINA	0	0	0	01	ORLANDOOBERTO@YAHOO.COM			0
09678973	MARTA	ESTELA	ERAZO		0	0	0	05	MARTHAERASO@HOTMAIL.COM		0416-5708218	0
09906067	OMEL	JOSE	SIFONTES		0	0	0	01	OMELSIFONTES@GMAIL.COM			0
09906615	TERESA	DE JESUS	MEDINA	DE RODRIGUEZ	0	0	0	01	TERESAMERO@GMAIL.COM		04120759473	0
10092487	MIGDALIA	BETHSABE	MARTINEZ	CARRERO	0	0	0	01	MIGBETHSAMAR03@HOTMAIL.COM		0414-7381102	0
10100205	GERMAN		ROJAS		0	0	0	01	RGERMAN75@YAHOO.ES	0274-2214285	0424-7071381	0
10102820	BELEN		LEON	ARAUJO	0	0	0	00				0
10108462	DULCE		PEÑA		0	0	0	00			04147454900	0
10712338	LUIS		SOLORZANO		0	0	0	00				0
10719923	LAURA		CUEVAS		0	0	0	00				0
10795287	JOSE	EUGENIO	RODRIGUEZ	MORENO	0	0	0	00				0
10896107	BLANCA		GUZMAN		0	0	0	00				0
10940629	NELSON	STALIN	NAVA	ALFONZO	0	0	0	00				0
11174533	RAQUEL		GONZALEZ		0	0	0	00				0
11496709	JUAN	D	VARGAS	S	0	0	0	00				0
11959818	JESUS	GREGORIO	SULBARAN	ALBARRAN	0	0	0	00		02744169580		0
11959905	JHOANA		TORRES		0	0	0	00				0
12797606	JOSE		SOTO		0	0	0	00				0
12799845	EDITH		GARCIA		0	0	0	00				0
13014423	LUIS		GUILLEN		0	0	0	00				0
13017695	LORIAN		PINTO		0	0	0	00				0
10108950	JAVIER	ALBERTO	PAREDES	QUINTERO	0	0	0	01	JPAREDES71@GMAIL.COM		0426-5729180	0
10109087	VERONICA		SANCHEZ	RACHAUS	0	0	0	01				0
10178133	ANGELA	ROSSANA	UREÑA		0	0	0	05	ROSSANAURENA@HOTMAIL.COM			0
10314511	DENISSE	VICTORIA	PAZOS	BRICEÑO	0	0	0	01	DENISSEPAZOS@HOTMAIL.COM		0414-1773720	0
10712408	WALTER	ALEXANDER	ESPINOZA	RANGEL	0	0	0	01				0
10713529	ROXY	COROMOTO	GUILLEN		0	0	0	01	ROXYCG@GMAIL.COM		0414-7039494	0
08044725	YUDITH		SANCHEZ		1	2	1	01	YUDITSAME@YAHOO.ES,YUDITSAME@HOTMAIL.COM			17
08084432	LUZ	MARINA	RONDON	RINCON	1	1	1	01				0
09201868	PEDRO	ANTONIO	MARTINEZ	HERRERA	3	2	3	01	MHPA65@HOTMAIL.COM		0412-5499476	0
09389944	CRISTINA	ANTONIA	SANDOVAL	BRICEÑO	1	1	1	01	CRISTINASANDOVALB@HOTMAIL.COM			15
09474147	LIGIA		RIVAS	MARQUEZ	1	2	1	01	MIGELIEN@YAHOO.COM			0
10087275	MARILYN	COROMOTO	MEDINA	LEON	1	5	2	01	MARILYNML_68@HOTMAIL.COM			0
10104966	RODRIGO	JOSE	GUILLEN	GUILLEN	1	2	1	01	PINTOSALINASVCMERIDA2006@YAHOO.ES, MOROCOIUTE@YAHOO.COM.VE			0
09499979	RODOLFO	JOSE	GONZALEZ	GOMEZ	1	2	1	01				18
10256095	DUBERLIS	DEL VALLE	GONZALEZ		1	2	1	01	DUBERLISG@GMAIL.COM		04141790063	18
10714070	KATIUSKA		MENDEZ		0	0	0	01				0
10715404	JOSE	GREGORIO	MALDONADO	SANTIAGO	0	0	0	01				0
10718393	MAYULY	COROMOTO	VILLAMIZAR	ARAQUE	0	0	0	01		02742210348		0
10718091	OMAR	ALONZO	BALZA	CARRILLO	0	0	0	01	BALZAOMAR@HOTMAIL.COM	0274-4166125	0424-7728962	0
10720364	JOSE	TIMOTEO	MILLA	MONSALVE	0	0	0	01	MILLAMJO@ULA.VE, MILLAMJO@HOTMAIL.COM, ILLAMJO@HOTMAIL.COM		0414 9797481	0
10797122	ROSANELA		GALINDO	CHIRINOS	0	0	0	01	ROSANELA.GALINDO@GMAIL.COM			0
11067484	ANNELINE		ALVARADO	MACHADO	0	0	0	01	annelinea@gmail.com			0
11108398	OLGA	INES	CONTRERAS	RODRIGUEZ	0	0	0	01				0
11319364	MARILU		ANDARA	CASTELLANO	0	0	0	01				0
11460000	ESTHER	ZULAY	ROSAS	LOBO	0	0	0	01	EROSASLOBO@GMAIL.COM			0
11460813	SULY	COROMOTO	CONTRERAS	FERNANDEZ	0	0	0	01	YLUS8@YAHOO.ES			0
11462979	MARTHA	IVONNE	TRIANA	VARGAS	0	0	0	01		02742715952	04247145086	0
11465653	WENDY	DEL CARMEN	SALAS	AVENDAÑO	0	0	0	01	WENDYSA_W10@YAHOO.COM			0
11467397	YASMELI		PERNIA	DE CARDOZA	0	0	0	01	ONDASINFANTILES@HOTMAIL.COM		04141793292	0
11467713	DOUGLAS	JOSE	NOGUERA	GOMEZ	0	0	0	01	DNOGUERA2005@GMAIL.COM		0414-5425457	0
11468201	LOREN 	DEL VALLE	AROCHA	HERNANDEZ	0	0	0	01	AROCHALOREN@HOTMAIL.COM	02712217283	04242636665	0
11783461	MARIA		VENEGAS		0	0	0	01				0
11912316	AMELYREN		BASABE		0	0	0	01	AMELYRENBASABE@HOTMAIL.COM			0
11952770	LUCY	MARGARITA	NAVA	MONSALVE	0	0	0	01	NAVALUCY@YAHOO.COM		04145775471	0
11959505	ZIOLY	D.	CALDERON		0	0	0	01	ZIOCADY@GMAIL.COM			0
12048353	ALEJANDRO	MIGUEL	OCHOA		0	0	0	01	ALEJANDROMIGUEL31@YAHOO.ES,  ALEJANDROMIGUEL31@GMAIL.COM	0274-2620175	04165028872	0
12329797	OMAR	JAVIER	VALERO	ALEJO	0	0	0	05	OJVALERO@HOTMAIL.COM			0
12346208	RAIZA	COROMOTO	ESCALONA	SALINAS	0	0	0	01				0
12352023	YENNY	CARIBAY	ARAUJO	GUILLEN	0	0	0	01	YENNYGUI@HOTMAIL.COM		0412-5499346	0
12353031	GEORGE	DE JESUS	GONZALEZ	GONZALEZ	0	0	0	01	CCCLESIASTICUM@GMAIL.COM			0
12458260	YOSMAR	ENRRIQUE	SULBARAN	GARCIA	0	0	0	01	SYOSMAR@GMAIL.COM		0426-5758267	0
12776731	ALVARO		PEÑA	PEÑA	0	0	0	01	ALPE02@HOTMAIL.COM			0
12779069	VIORALBA		CALDERON	ASEBEDO	0	0	0	01	VIORALBAC@HOTMAIL.COM			0
12779975	LEWING	EDUARDO	RANGEL	NAVA	0	0	0	01	LEDWIGH_ERN@HOTMAIL.COM		0426-5738282	0
12817844	JOSE	ISAIAS	CURVELO	GOMEZ	0	0	0	01				0
12839616	ANGEL	DARIO	PAEZ	VALENCILLOS	0	0	0	05	DEPORTESAP@HOTMAIL.COM		0416-4712058	0
13013152	ALEJANDRO		ROJAS	CEBALLOS	0	0	0	01				0
13014707	MEIGLYN	COROMOTO	ANGULO	ANGULO	0	0	0	01	MEIGLYNANGULO@GMAIL.COM		04162782958	0
13098188	JOSE	GREGORIO	PEREZ	MORA	0	0	0	01	PEREZMORAJG@CANTV.NET	0274-2210845	0416-3732589	0
13098422	LEVIS	ARNALDO	QUINTERO	TREJO	0	0	0	01	LEVISQ25@HOTMAIL.COM	2452466	04165762470	0
13099230	DENY		AVENDAÑO		0	0	0	00				0
13803898	ANA	MARIA	CONTRERAS	MARQUEZ	0	0	0	00				0
15234461	LISANDRO	EDUARDO	USECHE	MACIAS	0	0	0	00				0
15913325	LUZ	MARIA	GONZALEZ	SIERRA	0	0	0	00				0
16445105	RAUL	ALEJANDRO	CARNEVALI	GARCIA	0	0	0	00				0
16657360	YAJAIRA		IBARRA		0	0	0	00				0
16680396	JUAN	ROMAN	ROMAN	RAMOS	0	0	0	00				0
13098948	FEDERICO		DEL CURA	DELGADO	0	0	0	01	FEDERICO.DELCURA@GMAIL.COM		0416-7759881	0
13099384	JOSE	MELANIO	PEÑA	SANCHEZ	0	0	0	01	JOMEPESAS@HOTMAIL.COM		0426-7799987	0
13524820	LISBETH	FABIOLA	RIVAS	VIELMA	0	0	0	01	FABIOLARIVAS17777@GMAIL.COM	02742214331	04167749828	0
13525905	MARIELBA		OBALLOS	BENAVIDES	0	0	0	01	OBALLOSM@YAHOO.ES,OBALLOSM@HOTMAIL.COM		0414-7202547	0
13649962	YIMI	LEANDRO	MARQUEZ		0	0	0	01	MARQUEZYIMI@HOTMAIL.COM		04265731501	0
13803490	HEIDY	DAYANA	BITORAJES	DIAZ	0	0	0	01	ABRAMOVIC@HOTMAIL.COM, ABRAMOVIC2002@HOTMAIL.ES		0416-2924280	0
13947142	YUNE	PAULA	NOVOA	CACERES 	0	0	0	05	YUNENOVOA@HOTMAIL.COM		042-68795453	0
13966605	NERVIS	NAKARY	CARRILLO	SANTIAGO	0	0	0	01				0
13967486	MERVIN	JAVIER	MARQUEZ	QUINTERO	0	0	0	01	MERVIN_MARQUEZ@YAHOO.ES		0424-7372826	0
14249554	RUBEN	DARIO	BOSCAN	SANCHEZ	0	0	0	06				0
14131053	ANA	LUCIA	ANGULO	BONILLA	0	0	0	06				0
14267842	ERNESTO		VERGARA	MONTOYA	0	0	0	01	ERNESTOVERGARA@HOTMAIL.COM		0416-3793398	0
14400087	ALEIXANDRE	DENNISON	VILLARROEL	GOMEZ	0	0	0	01	ALDEVIGO@GMAIL.COM		0414-1794286	0
14589222	YAMMY	KARELYS	GUILLEN		0	0	0	01				0
14700296	JENNY	KATHERINNE	OSORIO	ALBARRAN	0	0	0	01	KATH97355@HOTMAIL.COM			0
11960173	EDGAR	ALEXANDER	ROSALES	RUBIO	1	5	2	01	EDWSALEX@HOTMAIL.COM			14
14268612	HUGO	JOSE	CERRADA	MARQUEZ	1	1	1	01	HUGOCERRADA@HOTMAIL.COM, HUGOCERRADA@GMAIL.COM	0274-2442691	0414-7459824	0
10898072	JESUS	ALBER	ROMERO	CUBILLOS	1	1	2	01	ALBER_ROMERO@HOTMAIL.COM			15
11303172	MONICA	AURORA	ROSCIANO	TOLOSA	1	2	1	01	MONICAROSCIANO23@GMAIL.COM			15
11466224	JIMI	JOSE	QUINTERO	DUGARTE	3	2	3	01	JJIMIQ@GMAIL.COM, J_JIMIQ@GMAIL.COM	02742635434	04147555034	0
11705856	CARLOS	LUIS	SARMIENTO	FERNANDEZ	3	2	3	01	SARMIENTO.11@GMAIL.COM	02742213623	04165763133	0
11954144	ANTONIO	JOSE	MONTILLA	MONTILLA	3	2	1	01	EANTONIOJOSEMONTILLA@GMAIL.COM	0424 7721070	0426 5719369	0
11956576	AGNI	CAROLINA	SARACHE	BALZA	1	1	1	01	CAROLINA_SARACHE@YAHOO.ES,CAROLINA_SARACHE@HOTMAIL.COM	0274-2664556	0416-4708970	0
13014569	NELMA	DEL VALLE	UZCATEGUI	DE BARRETO	1	1	1	01	REDES.ASESORIA@GMAIL.COM		0414-7416984	0
13524109	DARWIN	JAVIER	PERNIA	RODRIGUEZ	1	2	1	01	DARWINPERNIA@GMAIL.COM			0
13723698	AIDA	VIDALINA	AVILA	ZAVALA	3	2	1	01	AIDIVI@GMAIL.COM			0
14401340	MAYRA	IRLANDA	PEÑA	RODRIGUEZ	3	2	1	01	MAYPE123@HOTMAIL.COM			0
13966054	ANNA	YUSMARIE	DUGARTE	SANCHEZ	1	5	1	01	DUGARTEA@GMAIL.COM			17
14839454	LILIANA	ELVIRA	URBINA	DIAZ	0	0	0	01	ELVIREX@HOTMAIL.COM		0414-5425457	0
14866857	JOSE	VICENTE	RUIZ		0	0	0	05				0
14917365	JOHAN	ALEJANDRO	ZERPA	TORRES	0	0	0	01	JAZT23@HOTMAIL.COM		0426-7730348	0
15142314	PABLO	MARTIN	SILGUERO	SOTO	0	0	0	01	PABLOSILGUERO@HOTMAIL.COM			0
14917541	EMY	CAROLINA	LINERO	ROMERO	0	0	0	06				0
15175795	SILVIA	JOSEFINA	GONZALEZ	FERNANDEZ	0	0	0	01	SILVIAJ9730@HOTMAIL.COM		0416-0988076	0
15223533	SAUL	ELIAS	GUAIMARA	RONDON	0	0	0	01	SAELIG@HOTMAIL.COM		04247194467	0
15381185	RUTH	MELANIA	CASTILLO	OMAÑA	0	0	0	01	RUTHMELANIA82@YAHOO.COM		04166469011	0
15516303	HEBERT	JOEL	AVENDAÑO	LA CRUZ	0	0	0	01				0
15516332	KATHERIN	JOAN	TREJO	PERNIA	0	0	0	01	JOANKTP@YAHOO.COM		0414-1792774	0
15565857	NORKYS	MAGALY	BUSTOS	ZAMBRANO	0	0	0	01	NORKYSBUSTO@HOTMAIL.COM		0414-0802546	0
15622903	LEIDA 	TAMARA	SALCEDO	PEÑALOZA	0	0	0	01	LEIDATSALCEDO@GMAIL.COM	02746574546	04265712890	0
15754922	JORGE	LUIS	ALTUVE		0	0	0	01	JORGELUISALTUVE@YAHOO.ES			0
15754311	KEIBYS	EDUARDO	COLMENARES		0	0	0	01	COLMENARES.KEIBYS@GMAIL.COM		04168750063	0
15756979	MARIA	JOSE	SALAS	MEDINA	0	0	0	01				0
15920086	DANIEL	RICARDO	SALAS	CONTRERAS	0	0	0	01	DANIELS2030@GMAIL.COM			0
15920291	JORGE	GUILLERMO	ANGULO	SALAZAR	0	0	0	01	ALE_ALITO8_@HOTMAIL.COM			0
15921593	BELISARIO		TORO		0	0	0	01	TORO_AI@HOTMAIL.COM			0
16020374	CATERLING	VANESSA	MELENDEZ	MONTOYA	0	0	0	01	CATERLING_M@HOTMAIL.COM		0414-9790618	0
16285988	LUISANA		FONSECA	CADENAS	0	0	0	01	LUISANAFONSECA12@GMAIL.COM			0
16377291	YOSMELY		RAMIREZ		0	0	0	01	YOSMELY_RAMIREZ@HOTMAIL.COM		0416-4704092	0
16514402	EDUARDO	ISMAEL	NOGUERA	PALENCIA	0	0	0	05	EINOGUERAP@HOTMAIL.COM, EINOGUERAP@GMAIL.COM		0414-5679393	0
16964770	SARAI	MARGARITA	SOJO	PORTILLO	0	0	0	01	SARFER60@HOTMAIL.COM		04147425566	0
17130729	ONELIA	KARINA	FERNANDEZ	SOSA	0	0	0	01	ONEFS@HOTMAIL.COM			0
17129511	YULY	SOFIA	QUINTERO	FLORES	0	0	0	06				0
17238348	CARLA	VANESSA	PACHECO	GUERRERO	0	0	0	01				0
17456574	MANUEL	ALBERTO	LUJAN	ANZOLA	0	0	0	01	LUJANOANZOLA@YAHOO.COM			0
17499585	MARIANA	ALEJANDRA	PEREZ	ROMERO	0	0	0	01	MARIANAPEREZ908@GMAIL.COM		04265583956	0
17456954	MAHICETH	CECILIA	QUINTERO	VALERO	0	0	0	01	MAHICETH.QUINTERO@GMAIL.COM		0416-1194076	0
16199115	ELIO	D' JESUS	RAMIREZ	CRUCES	0	0	0	01			0416-3769937	0
17523454	MERILIN	LILIANA	MONSALVE	ROJAS	0	0	0	01	MERILINMONSALVE@HOTMAIL.COM		04247523196	0
17664938	YESSIKA	CAROLYN	SAIZ	VIELMA	0	0	0	01	UPTM_ING_YESSIKA_SAIZ@HOTMAIL.COM	02742217626	041436742428	0
17770813	DELFIN	ALEXANDER	MOLINA	MARQUEZ	0	0	0	06				0
18310574	ANGEL	GRABIEL	ALBORNOZ	RIVAS	0	0	0	06	ANGEL_15_1986@HOTMAIL.COM		0416-0758247	0
18581024	HUMBERTO	JOSE	GELVES	MOLINA	0	0	0	01	HUMBERTOG18@HOTMAIL.COM		04141272004	0
18796815	GUSTAVO	ARMANDO	RIVAS	RANGEL	0	0	0	01				0
18796996	WALTER	ALCIBIADES	RIVAS	CUEVAS	0	0	0	01				0
18962414	MANUEL	ANTONIO	OLIVEROS	OMAÑA	0	0	0	06	MAOOS2414@HOTMAIL.COM		04121695339	0
19421996	BECKY	LILIBETH	SOSA	DUQUE	0	0	0	01	BECKYSOSA@GMAIL.COM		0414-7340911	0
19440209	JUAN	PABLO	BRACHO	OLIVEROS	0	0	0	06	JUPABRAO@GMAIL.COM		04265728983	0
81423693	MAURICIO	ALEJANDRO	RAVANAL	ZEPEDA	0	0	0	01	MAURICIO.RAVANAL@GMAIL.COM		0414-7160365	0
12345678	NOMBRE		APELLIDO		0	0	0	01	CORREO@SERVIDOR.COM	01231234567	02741234567	0
87654321	NOMBRE	\N	APELLIDO	\N	0	0	0	01	\N	\N	\N	0
09240195	MIGUEL		ACEVEDO		0	0	0	01	1AA.MIGUEL@GMAIL.COM,MIGUELAA1@CANTV.NET			0
14400356	MARIA	EUGENIA	ACOSTA	GARCIA	0	0	0	01	MARUAG22@HOTMAIL.COM		0424-7013663	0
14916156	YAMILE	MERCEDES	ALAM	PASTOR	0	0	0	01	YMAP1999@YAHOO.COM		0416-3796721	0
05655983	BLANCA	ELENA	ALVIAREZ	DE MALDONADO	1	3	2	01	BLANCALVI@GMAIL.COM			13.5
03966127	OSWALDO	ADELIS	ABARCA	MONTILLA	1	1	2	01				0
06547603	JUDITH	TIBISAY	COLINA	MIRENA	1	1	2	01	JUDITHC8@HOTMAIL.COM			0
07509507	LORENZO	ANTONIO	VASQUEZ	ROJAS	1	2	2	01	NATABIR@GMAIL.COM			0
07832738	MARIA	ASUNCION	SOCORRO		1	5	2	01	MARIASOVE@YAHOO.COM			0
09475173	YADIRA	YELITZA	MARQUEZ	SANTIAGO	1	2	1	01	YAYMS@HOTMAIL.COM	02742660082	04140760466	0
09476031	JAVIER	ANTONIO	CASTILLO	TORRES	3	2	1	01	JACT5455@HOTMAIL.COM		0416-4749446	0
13477378	SUSANA	DEL PILAR	BRICEÑO	JAIMES	3	2	1	01	SUSANABJ@GMAIL.COM	02747903567	04247259745	0
13648603	RAQUEL	AILYN	ZAMBRANO	DE PASCARELLA	1	1	1	01	RAQUELZAMBRANO@HOTMAIL.COM			0
12722185	SOLANGE	ANIREE	LEAL	LEAL	1	1	1	01	SOLANGELEAL@YAHOO.COM	0274-2623282	0416-2755134	12.5
08047120	DIONY	GINETTE	ALVIAREZ	PAREDES	1	3	2	01	GDIONY@YAHOO.ES			14
14917178	JOHANNA	YECENIA	GOMEZ	ALVAREZ	1	2	1	01	JOHANNNA.GA@GMAIL.COM			16
\.


--
-- Data for Name: seccion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY seccion (id) FROM stdin;
A
B
C
D
\.


--
-- Data for Name: sede; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sede (s, d, dir, t, f) FROM stdin;
01	EJIDO	AV. NOVIEMBRE	0274-2210746	2009-03-03
02	SANTA JUANA	SECTOR SANTA JUANA, MERIDA	SIN ASIGNAR	2009-03-03
03	BAILADORES	BAILADORES	SIN ASIGNAR	2009-03-03
04	TUCANI	TUCANI	SIN ASIGNAR	2009-03-03
05	EXT. BARINAS	BARINAS	SIN ASIGNAR	2009-11-12
06	EXT SANTA LUCIA	SANTA LUCIA	SIN ASIGNAR	2010-09-25
07	EXT. EL VIGIA	EL VIGIA	SIN ASIGNAR	2013-01-01
00	SIN ASIGNAR	SIN ASIGNAR	SIN ASIGNAR	1970-01-01
\.


--
-- Data for Name: uc; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uc (cuc, d, t, tr, ht, hp, ce, cc, cm, lab) FROM stdin;
AGAGE242	AGROEPISTEMOLOGÍA	2	2	0	0	5	01	1	0
AGANA262	ALIMENTACIÓN Y NUTRICIÓN ANIMAL ALTERNATIVA	2	2	0	0	2	01	1	0
AGATMA242	APLICACIÓN DE TÉCNICAS Y METODOLOGÍAS AGROECOLOGICAS	2	2	0	0	2	01	1	0
AGATMA242	APLICACIÓN DE TÉCNICAS Y METODOLOGÍAS AGROECOLOGICAS	2	3	0	0	2	01	1	0
AGATMA246	TÉCNICAS Y METODOLOGÍAS AGROECOLOGICAS	2	2	0	0	2	01	1	0
AGBFSPV242	BOTÁNICA, FISIOLOGÍA Y SISTEMAS DE PRODUCCIÓN VEGETAL	2	2	0	0	2	01	1	0
AGBFSPV242	BOTÁNICA, FISIOLOGÍA Y SISTEMAS DE PRODUCCIÓN VEGETAL	2	3	0	0	2	01	1	0
ADM6032	ADMINISTRACIÓN DE MERCADEO	3	2	0	0	2	04	1	0
AGANA342	ALIMENTACIÓN Y NUTRICIÓN ANIMAL ALTERNATIVA	3	2	0	0	2	01	1	0
AGANM342	ANÁLISIS MATEMÁTICO	3	2	0	0	2	01	1	0
AGANM362	ANÁLISIS MATEMÁTICO	3	2	0	0	2	01	1	0
AGGAE342	GESTIÓN AGROECOLÓGICA	3	2	0	0	2	01	1	0
AGGAE362	GESTIÓN AGROECOLÓGICA	3	2	0	0	2	01	1	0
AEPS6033	ELECTIVA III: ADM DE EMPRESAS DE PRODUCCION Y PROPIEDAD SOCI	4	2	0	0	2	04	1	0
AGECC442	ECOCONSTRUCCIONES	4	2	0	0	2	01	1	0
AGPEP442	PEDAGOGÍA Y POLÍTICA	4	2	0	0	5	01	1	0
AGSPV262	SISTEMAS DE PRODUCCION VEGETAL	2	2	0	0	2	01	1	0
AGZFSPA242	ZOOLOGÍA, FISIOLOGÍA Y SISTEMAS DE PRODUCCIÓN ANIMAL	2	2	0	0	2	01	1	0
AGZFSPA242	ZOOLOGÍA, FISIOLOGÍA Y SISTEMAS DE PRODUCCIÓN ANIMAL	2	3	0	0	2	01	1	0
COC9023	CONTABILIDAD DE COSTOS	2	2	0	0	2	07	1	0
CON12024	CONTABILIDAD II	2	2	0	0	2	04	1	0
CON12024	CONTABILIDAD II	2	3	0	0	2	04	1	0
CON15025	CONTABILIDAD II	2	2	0	0	2	07	1	0
CON15025	CONTABILIDAD II	2	3	0	0	2	07	1	0
CON9023	CONTABILIDAD II	2	2	0	0	2	04	1	0
DCCTT2-1445	DESARROLLO Y CALIDAD DE VIDA DE LAS COMUNIDADES TURISTICAS	2	2	0	0	5	06	1	0
DCCTT2-1445	DESARROLLO Y CALIDAD DE VIDA DE LAS COMUNIDADES TURISTICAS	2	3	0	0	5	06	1	0
DIAGINAU-245	DIAGNOSTICO E INTERVENCION AUDITIVA I	2	2	0	0	2	08	1	0
DIAGINAU-245	DIAGNOSTICO E INTERVENCION AUDITIVA I	2	3	0	0	2	08	1	0
DIAGINHA-256	DIAGNOSTICO E INTERVENCION DEL HABLA	2	2	0	0	2	08	1	0
DIAGINHA-256	DIAGNOSTICO E INTERVENCION DEL HABLA	2	3	0	0	2	08	1	0
DIAGINLE-256	DIAGNOSTICO E INTERVENCION DEL LENGUAJE I	2	2	0	0	2	08	1	0
DIAGINLE-256	DIAGNOSTICO E INTERVENCION DEL LENGUAJE I	2	3	0	0	2	08	1	0
AGPFIII3126	PROYECTO FORMATIVO III	3	2	0	0	3	01	1	0
AGPFIII3126	PROYECTO FORMATIVO III	3	3	0	0	3	01	1	0
AGPFIII3166	PROYECTO FORMATIVO III	3	2	0	0	3	01	1	0
AGPFIII3166	PROYECTO FORMATIVO III	3	3	0	0	3	01	1	0
AGPSLC342	PENSAMIENTO SOCIOPOLÍTICO LATINOAMERICANO Y DEL CARIBE	3	2	0	0	5	01	1	0
AGSPA262	SISTEMAS DE PRODUCCIÓN ANIMAL	3	2	0	0	2	01	1	0
AUD9033	AUDITORIA I	3	2	0	0	2	07	1	0
DAR9033	DEPORTE ARTE Y RECREACIÓN II	3	2	0	0	2	04	1	0
DEPORECR-322	DEPORTE Y RECREACION	3	2	0	0	2	08	1	0
DEPORECR-322	DEPORTE Y RECREACION	3	3	0	0	2	08	1	0
DIAGINAU-345	DIAGNOSTICO E INTERVENCION AUDITIVA II	3	2	0	0	2	08	1	0
DIAGINAU-345	DIAGNOSTICO E INTERVENCION AUDITIVA II	3	3	0	0	2	08	1	0
DIAGINLE-345	DIAGNOSTICO E INTERVENCION DEL LENGUAJE II	3	2	0	0	2	08	1	0
DIAGINLE-345	DIAGNOSTICO E INTERVENCION DEL LENGUAJE II	3	3	0	0	2	08	1	0
DIAGINVO-345	DIAGNOSTICO E INTERVENCION DE LA VOZ I	3	2	0	0	2	08	1	0
DIAGINVO-345	DIAGNOSTICO E INTERVENCION DE LA VOZ I	3	3	0	0	2	08	1	0
AGPFIV41	PROYECTO FORMATIVO IV	4	2	0	0	3	01	1	0
AGPFIV41	PROYECTO FORMATIVO IV	4	3	0	0	3	01	1	0
AGPFIV4166	PROYECTO FORMATIVO IV	4	2	0	0	3	01	1	0
AGPFIV4166	PROYECTO FORMATIVO IV	4	3	0	0	3	01	1	0
AGSCSNI442	SISTEMAS DE CERTIFICACIÓN SOCIAL NACIONAL E INTERNACIONAL	4	2	0	0	2	01	1	0
APUALC15045	ADM EN LOS PROCESOS DE UNIDAD DE AMÉRICA LATINA EL CARIBE	4	2	0	0	5	04	1	0
APUALC15045	ADM EN LOS PROCESOS DE UNIDAD DE AMÉRICA LATINA EL CARIBE	4	3	0	0	5	04	1	0
AUD9043	AUDITORIA II	4	2	0	0	2	07	1	0
COE9043	CONTABILIDAD ESPECIALIZADA	4	2	0	0	2	07	1	0
DIAGINAU-457	DIAGNOSTICO E INTERVENCION AUDITIVA III	4	2	0	0	2	08	1	0
DIAGINAU-457	DIAGNOSTICO E INTERVENCION AUDITIVA III	4	3	0	0	2	08	1	0
DIAGINVO-447	DIAGNOSTICO E INTERVENCION DE LA VOZ II	4	2	0	0	2	08	1	0
DIAGINVO-447	DIAGNOSTICO E INTERVENCION DE LA VOZ II	4	3	0	0	2	08	1	0
ELEC19023	ELECTIVA I	2	2	0	0	2	04	1	0
ELEC29023	ELECTIVA II	2	2	0	0	2	04	1	0
ELECTIVA-222	ELECTIVA II	2	2	0	0	2	08	1	0
ELECTIVA-222	ELECTIVA II	2	3	0	0	2	08	1	0
ESMD15025	ECONOMÍA, SUSTENTABILIDAD Y MODELOS DE DESARROLLO	2	2	0	0	5	04	1	0
ESMD15025	ECONOMÍA, SUSTENTABILIDAD Y MODELOS DE DESARROLLO	2	3	0	0	5	04	1	0
FSC18026	FORMACION SOCIO CRITICA II	2	2	0	0	5	04	1	0
FSC18026	FORMACION SOCIO CRITICA II	2	3	0	0	5	04	1	0
IDIOT2-2167	IDIOMAS II	2	2	0	0	2	06	1	0
IDIOT2-2167	IDIOMAS II	2	3	0	0	2	06	1	0
NEUROLIN-245	NEUROLINGUISTICA	2	2	0	0	2	08	1	0
NEUROLIN-245	NEUROLINGUISTICA	2	3	0	0	2	08	1	0
OUPST2-61220	OPER. UNIDADES PROD. SOCIAL Y FACILITACION DE SERV. TURIST.	2	2	0	0	3	06	1	0
OUPST2-61220	OPER. UNIDADES PROD. SOCIAL Y FACILITACION DE SERV. TURIST.	2	3	0	0	3	06	1	0
OYS9023	ORGANIZACIÓN Y SISTEMAS	2	2	0	0	2	04	1	0
PATOCOHU-256	PATOLOGIA DE LA COMUNICACION HUMANA	2	2	0	0	2	08	1	0
PATOCOHU-256	PATOLOGIA DE LA COMUNICACION HUMANA	2	3	0	0	2	08	1	0
DSRST3-1445	DES. SUSTENTABLE Y SOST. DE LOS RECURSOS Y SERV. TUR.	3	2	0	0	5	06	1	0
DSRST3-1445	DES. SUSTENTABLE Y SOST. DE LOS RECURSOS Y SERV. TUR.	3	3	0	0	5	06	1	0
DTCST3-61220	DESARROLLO DEL TURISMO COMUNITARIO Y SOCIAL	3	2	0	0	3	06	1	0
DTCST3-61220	DESARROLLO DEL TURISMO COMUNITARIO Y SOCIAL	3	3	0	0	3	06	1	0
ELECTIVA-322	ELECTIVA III	3	2	0	0	2	08	1	0
ELECTIVA-322	ELECTIVA III	3	3	0	0	2	08	1	0
FEVP001	FORMULACIÓN Y EVALUACIÓN DE PROYECTOS	3	2	0	0	2	07	1	0
FSC18036	FORMACION SOCIO CRITICA III	3	2	0	0	5	04	1	0
FSC18036	FORMACION SOCIO CRITICA III	3	3	0	0	5	04	1	0
GDTUT3-2167	GESTIÓN DE DESTINOS TURÍSTICOS	3	2	0	0	2	06	1	0
GDTUT3-2167	GESTIÓN DE DESTINOS TURÍSTICOS	3	3	0	0	2	06	1	0
GEC9033	GERENCIA DE COSTOS	3	2	0	0	2	07	1	0
GEF9033	GESTIÓN FINANCIERA	3	2	0	0	2	07	1	0
IDI9033	IDIOMAS II	3	2	0	0	2	04	1	0
IDIOT3-28810	IDIOMAS III	3	2	0	0	2	06	1	0
IDIOT3-28810	IDIOMAS III	3	3	0	0	2	06	1	0
ING9033	INGLES II	3	2	0	0	2	04	1	0
MOTRORAL-334	MOTRICIDAD ORAL	3	2	0	0	2	08	1	0
MOTRORAL-334	MOTRICIDAD ORAL	3	3	0	0	2	08	1	0
EDUCAMBI-434	EDUCACION AMBIENTAL	4	2	0	0	2	08	1	0
EDUCAMBI-434	EDUCACION AMBIENTAL	4	3	0	0	2	08	1	0
ELEC39043	ELECTIVA III	4	2	0	0	2	04	1	0
ELEC49043	ELECTIVA IV	4	2	0	0	2	04	1	0
ELECTIVA-422	ELECTIVA IV	4	2	0	0	2	08	1	0
ELECTIVA-422	ELECTIVA IV	4	3	0	0	2	08	1	0
ETCAT4-1806	ESTUDIOS DEL TURISMO EN EL GRAN CARIBE Y LOS PAISES DEL ALBA	4	2	0	0	5	06	1	0
ETCAT4-1806	ESTUDIOS DEL TURISMO EN EL GRAN CARIBE Y LOS PAISES DEL ALBA	4	3	0	0	5	06	1	0
FEP9043	FORMULACION Y EVALUACIÓN DE PROYECTOS	4	2	0	0	2	04	1	0
FSC18046	FORMACION SOCIO CRITICA IV	4	2	0	0	5	04	1	0
FSC18046	FORMACION SOCIO CRITICA IV	4	3	0	0	5	04	1	0
GEPTT4-61220	GESTION DE PROYECTOS TURISTICOS	4	2	0	0	3	06	1	0
GEPTT4-61220	GESTION DE PROYECTOS TURISTICOS	4	3	0	0	3	06	1	0
GESTADFO-457	GESTION ADMINISTRATIVA EN FONOAUDIOLOGIA	4	2	0	0	2	08	1	0
GESTADFO-457	GESTION ADMINISTRATIVA EN FONOAUDIOLOGIA	4	3	0	0	2	08	1	0
GHAT9043	GESTION HUMANA Y AMBIENTE DE TRABAJO	4	2	0	0	2	07	1	0
IDIOT4-2167	IDIOMAS IV	4	2	0	0	2	06	1	0
IDIOT4-2167	IDIOMAS IV	4	3	0	0	2	06	1	0
PCC211409	TUTORIA DE PROYECTO II	2	2	0	0	3	02	1	0
PCC211409	TUTORIA DE PROYECTO II	2	3	0	0	3	02	1	0
PCC223309	ADMINISTRACION DE OBRAS	2	2	0	0	2	02	1	0
PCEP9023	PRESUPUESTO Y CONTABILIDAD PARA ENTES PUBLICOS	2	2	0	0	2	07	1	0
PCC311409	TUTORIA DE PROYECTO III	3	2	0	0	3	02	1	0
PCC311409	TUTORIA DE PROYECTO III	3	3	0	0	3	02	1	0
PCC325309	DISEÑO VIAL	3	2	0	0	2	02	1	0
PCC411409	TUTORIA DE PROYECTO IV	4	2	0	0	3	02	1	0
PCC411409	TUTORIA DE PROYECTO IV	4	3	0	0	3	02	1	0
PCC423309	MANTENIMIENTO DE OBRAS CIVILES	4	2	0	0	2	02	1	0
PGT21	PETROLOGIA	2	2	0	0	2	05	1	0
PGT23	FISICA	2	2	0	0	2	05	1	0
PGT23	FISICA	2	3	0	0	2	05	1	0
PG316	PROYECTO III	3	2	0	0	3	05	1	0
PG316	PROYECTO III	3	3	0	0	3	05	1	0
PGT31	YACIMIENTOS MINERALES	3	2	0	0	2	05	1	0
PGT31	YACIMIENTOS MINERALES	3	3	0	0	2	05	1	0
PGT32	EXPLORACION	3	2	0	0	2	05	1	0
PGT32	EXPLORACION	3	3	0	0	2	05	1	0
PGT33	GEOMECANICA	3	2	0	0	2	05	1	0
PGT33	GEOMECANICA	3	3	0	0	2	05	1	0
PGT34	MINERIA II	3	2	0	0	2	05	1	0
PGT34	MINERIA II	3	3	0	0	2	05	1	0
PG416	PROYECTO IV	4	2	0	0	3	05	1	0
PG416	PROYECTO IV	4	3	0	0	3	05	1	0
PGT41	GEOLOGIA DE VENEZUELA	4	2	0	0	2	05	1	0
PGT41	GEOLOGIA DE VENEZUELA	4	3	0	0	2	05	1	0
PGT42	GEOLOGIA DE LOS HIDROCARBUROS	4	2	0	0	2	05	1	0
PGT42	GEOLOGIA DE LOS HIDROCARBUROS	4	3	0	0	2	05	1	0
PGT43	HIDROLOGIA	4	2	0	0	2	05	1	0
PGT43	HIDROLOGIA	4	3	0	0	2	05	1	0
PGT44	BENEFICIO MINERAL	4	2	0	0	2	05	1	0
PGT44	BENEFICIO MINERAL	4	3	0	0	2	05	1	0
PGT45	GERENCIA	4	2	0	0	2	05	1	0
PGT45	GERENCIA	4	3	0	0	2	05	1	0
PGT46	ELECTIVA II	4	2	0	0	2	05	1	0
PGT46	ELECTIVA II	4	3	0	0	2	05	1	0
PGT47	PROYECTO IV	4	2	0	0	3	05	1	0
PGT47	PROYECTO IV	4	3	0	0	3	05	1	0
PRACPROF-2120	PRACTICAS PROFESIONALES I	2	2	0	0	2	08	1	0
PRACPROF-2120	PRACTICAS PROFESIONALES I	2	3	0	0	2	08	1	0
PRO57019	SUPERVISIÓN Y CONDUCCIÓN TÉCNICA DE PROCESOS ADM.	2	2	0	0	3	04	1	0
PRO57019	SUPERVISIÓN Y CONDUCCIÓN TÉCNICA DE PROCESOS ADM.	2	3	0	0	3	04	1	0
DAR9013	DEPORTE ARTE Y RECREACIÓN I	1	2	0	0	2	04	1	0
PRO700224	SUPERVISIÓN Y CONDUCCIÓN TÉCNICA DE PROCESOS ADM.	2	2	0	0	3	04	1	0
PRO700224	SUPERVISIÓN Y CONDUCCIÓN TÉCNICA DE PROCESOS ADM.	2	3	0	0	3	04	1	0
PPR9033	PRESUPUESTO PRIVADO	3	2	0	0	2	07	1	0
PRACPROF-3120	PRACTICAS PROFESIONALES II	3	2	0	0	2	08	1	0
PRACPROF-3120	PRACTICAS PROFESIONALES II	3	3	0	0	2	08	1	0
PROYSOCI-334	PROYECTO SOCIOINTEGRADOR III	3	2	0	0	3	08	1	0
PROYSOCI-334	PROYECTO SOCIOINTEGRADOR III	3	3	0	0	3	08	1	0
PSICOMOT-323	PSICOMOTRICIDAD	3	2	0	0	2	08	1	0
PSICOMOT-323	PSICOMOTRICIDAD	3	3	0	0	2	08	1	0
PORTINST-434	PORTUGUES INSTRUMENTAL	4	2	0	0	2	08	1	0
PORTINST-434	PORTUGUES INSTRUMENTAL	4	3	0	0	2	08	1	0
PRACPROF-41216	PRACTICAS PROFESIONALES III	4	2	0	0	2	08	1	0
PRACPROF-41216	PRACTICAS PROFESIONALES III	4	3	0	0	2	08	1	0
PRO570419	DIRECCIÓN, CONTROL Y EVALUACIÓN DE SISTEMAS ADM	4	2	0	0	3	04	1	0
PRO570419	DIRECCIÓN, CONTROL Y EVALUACIÓN DE SISTEMAS ADM	4	3	0	0	3	04	1	0
PRO660422	DESARROLLO DE NUEVAS TENDENCIAS EN LA GESTION CONTABLE FINAN	4	2	0	0	3	07	1	0
PRO660422	DESARROLLO DE NUEVAS TENDENCIAS EN LA GESTION CONTABLE FINAN	4	3	0	0	3	07	1	0
PRO700424	DIRECCIÓN, CONTROL Y EVALUACIÓN DE SISTEMAS ADM	4	2	0	0	3	04	1	0
PRO700424	DIRECCIÓN, CONTROL Y EVALUACIÓN DE SISTEMAS ADM	4	3	0	0	3	04	1	0
PROYSOCI-479	PROYECTO SOCIOINTEGRADOR IV	4	2	0	0	3	08	1	0
PROYSOCI-479	PROYECTO SOCIOINTEGRADOR IV	4	3	0	0	3	08	1	0
SALUOCFO-456	SALUD OCUPACIONAL EN FONOAUDIOLOGIA	4	2	0	0	2	08	1	0
SALUOCFO-456	SALUD OCUPACIONAL EN FONOAUDIOLOGIA	4	3	0	0	2	08	1	0
SHDD9043	SEMINARIO HABILIDADES DIRECTIVAS II	4	2	0	0	2	04	1	0
AGBSD142	BIODIVERSIDAD Y SOCIODIVERSIDAD	1	2	0	0	2	01	1	0
AGBSD142	BIODIVERSIDAD Y SOCIODIVERSIDAD	1	3	0	0	2	01	1	0
AGPFI1126	PROYECTO FORMATIVO I	1	2	0	0	3	01	1	0
AGPFI1126	PROYECTO FORMATIVO I	1	3	0	0	3	01	1	0
AGPFI1166	PROYECTO FORMATIVO I	1	2	0	0	3	01	1	0
AGPFI1166	PROYECTO FORMATIVO I	1	3	0	0	3	01	1	0
AGPRA142	PRINCIPIOS DE AGROECOLOGIA	1	2	0	0	2	01	1	0
AGPRA142	PRINCIPIOS DE AGROECOLOGIA	1	3	0	0	2	01	1	0
AGPRA162	PRINCIPIOS DE AGROECOLOGIA	1	2	0	0	2	01	1	0
AGSALC14	SOCIOHISTORIA DE LA AGRICULTURA LATINOAMER. Y DEL CARIBE	1	2	0	0	5	01	1	0
AGSALC142	SOCIOHISTORIA DE LA AGRICULTURA LATINOAMER. Y DEL CARIBE	1	2	0	0	5	01	1	0
AGSALC142	SOCIOHISTORIA DE LA AGRICULTURA LATINOAMER. Y DEL CARIBE	1	3	0	0	5	01	1	0
APN15015	ADMINISTRACIÓN PÚBLICA NACIONAL	1	2	0	0	5	04	1	0
APN15015	ADMINISTRACIÓN PÚBLICA NACIONAL	1	3	0	0	5	04	1	0
BASEACCO-156	BASES ACUSTICAS DE LA COMUNICACION	1	2	0	0	2	08	1	0
BASEACCO-156	BASES ACUSTICAS DE LA COMUNICACION	1	3	0	0	2	08	1	0
BASEPRFO-156	BASES DE LA PRACTICA FONOAUDIOLOGICA	1	2	0	0	2	08	1	0
BASEPRFO-156	BASES DE LA PRACTICA FONOAUDIOLOGICA	1	3	0	0	2	08	1	0
CON12014	CONTABILIDAD I	1	2	0	0	2	04	1	0
CON12014	CONTABILIDAD I	1	3	0	0	2	04	1	0
CON18016	CONTABILIDAD I	1	2	0	0	2	07	1	0
CON18016	CONTABILIDAD I	1	3	0	0	2	07	1	0
ELECTIVA-122	ELECTIVA I	1	2	0	0	2	08	1	0
ELECTIVA-122	ELECTIVA I	1	3	0	0	2	08	1	0
ESTRFUCO-156	ESTRUCTURA Y FUNCION DE LA COMUNICACION	1	2	0	0	2	08	1	0
ESTRFUCO-156	ESTRUCTURA Y FUNCION DE LA COMUNICACION	1	3	0	0	2	08	1	0
FA12014	FUNDAMENTOS DE LA ADMINISTRACIÓN	1	2	0	0	2	04	1	0
FONEFONO-134	FONETICA Y FONOLOGIA	1	2	0	0	2	08	1	0
FONEFONO-134	FONETICA Y FONOLOGIA	1	3	0	0	2	08	1	0
FPNTT1-61220	FOMENTO DEL PATRIMONIO NACIONAL Y TURISTICO	1	2	0	0	3	06	1	0
FPNTT1-61220	FOMENTO DEL PATRIMONIO NACIONAL Y TURISTICO	1	3	0	0	3	06	1	0
IDI9013	IDIOMAS I	1	2	0	0	2	04	1	0
IDIOT1-2167	IDIOMAS I	1	2	0	0	2	06	1	0
IDIOT1-2167	IDIOMAS I	1	3	0	0	2	06	1	0
ING9013	INGLES I	1	2	0	0	2	04	1	0
INGLINST-134	INGLES INSTRUMENTAL	1	2	0	0	2	08	1	0
INGLINST-134	INGLES INSTRUMENTAL	1	3	0	0	2	08	1	0
ORGAPACO-134	ORGANIZACION Y PARTICIPACION COMUNITARIA	1	2	0	0	2	08	1	0
ORGAPACO-134	ORGANIZACION Y PARTICIPACION COMUNITARIA	1	3	0	0	2	08	1	0
PANTT1-1445	PATRIMONIO NACIONAL Y TURÍSTICO	1	2	0	0	5	06	1	0
PANTT1-1445	PATRIMONIO NACIONAL Y TURÍSTICO	1	3	0	0	5	06	1	0
PCC111409	TUTORIA DE PROYECTO	1	2	0	0	3	02	1	0
PCC111409	TUTORIA DE PROYECTO	1	3	0	0	3	02	1	0
PCC113309	MATEMATICA	1	2	0	0	2	02	1	0
PCC115309	TOPOGRAFIA	1	2	0	0	2	02	1	0
PCC115309	TOPOGRAFIA	1	3	0	0	2	02	1	0
PCC116309	EXPRESION GRAFICA Y DIBUJO DE PROYECTO	1	2	0	0	2	02	1	0
PCC116309	EXPRESION GRAFICA Y DIBUJO DE PROYECTO	1	3	0	0	2	02	1	0
THAT9023	TALENTO HUMANO Y AMBIENTE DE TRABAJO	2	2	0	0	2	04	1	0
TECNTEFO-456	TECNICAS Y TECNOLOGIAS EN FONOAUDIOLOGIA	4	2	0	0	2	08	1	0
TECNTEFO-456	TECNICAS Y TECNOLOGIAS EN FONOAUDIOLOGIA	4	3	0	0	2	08	1	0
PG116	PROYECTO I	1	2	0	0	3	05	1	0
PG116	PROYECTO I	1	3	0	0	3	05	1	0
PGT11	MATEMATICA	1	2	0	0	2	05	1	0
PGT11	MATEMATICA	1	3	0	0	2	05	1	0
PGT12	TOPOGRAFIA	1	2	0	0	2	05	1	0
PGT12	TOPOGRAFIA	1	3	0	0	2	05	1	0
PGT13	QUIMICA	1	2	0	0	2	05	1	0
PGT13	QUIMICA	1	3	0	0	2	05	1	0
PGT14	GEOLOGIA GENERAL	1	2	0	0	2	05	1	0
PGT14	GEOLOGIA GENERAL	1	3	0	0	2	05	1	0
PGT13	QUIMICA	1	1	0	0	2	05	1	0
PGT15	DIMENSION HUMANA	1	2	0	0	5	05	1	0
PGT15	DIMENSION HUMANA	1	3	0	0	5	05	1	0
PGT16	ACREDITABLE I	1	2	0	0	1	05	1	0
PGT16	ACREDITABLE I	1	3	0	0	1	05	1	0
PGT17	PROYECTO I	1	2	0	0	3	05	1	0
PGT17	PROYECTO I	1	3	0	0	3	05	1	0
PIFC1	FORMACIÓN CRÍTICA I	1	2	0	0	5	03	1	0
PIFC1	FORMACIÓN CRÍTICA I	1	3	0	0	5	03	1	0
PRO570119	IDENTIFICAR Y CONOCER LOS PROCESOS ADMINISTRATIVOS EN DISTIN	1	2	0	0	3	04	1	0
PRO570119	IDENTIFICAR Y CONOCER LOS PROCESOS ADMINISTRATIVOS EN DISTIN	1	3	0	0	3	04	1	0
PRO700124	ANÁL Y EJEC DE LOS PROCESOS ADM EN LAS DISTINTAS ORGANIZ.	1	2	0	0	3	04	1	0
PRO700124	ANÁL Y EJEC DE LOS PROCESOS ADM EN LAS DISTINTAS ORGANIZ.	1	3	0	0	3	04	1	0
PRO750125	ANÁLISIS Y EJECUCIÓN DE LOS PROCESOS COMPATIBLES APLICADOS	1	2	0	0	3	07	1	0
PRO750125	ANÁLISIS Y EJECUCIÓN DE LOS PROCESOS COMPATIBLES APLICADOS	1	3	0	0	3	07	1	0
PROYSOCI-145	PROYECTO SOCIOINTEGRADOR I	1	2	0	0	3	08	1	0
PROYSOCI-145	PROYECTO SOCIOINTEGRADOR I	1	3	0	0	3	08	1	0
SEM15015	ORÍGEN Y EVOLUCIÓN DEL SISTEMA SOCIOECONÓMICO MUNDIAL	1	2	0	0	5	07	1	0
SEM15015	ORÍGEN Y EVOLUCIÓN DEL SISTEMA SOCIOECONÓMICO MUNDIAL	1	3	0	0	5	07	1	0
AGPFII2126	PROYECTO FORMATIVO II	2	2	0	0	3	01	1	0
AGPFII2126	PROYECTO FORMATIVO II	2	3	0	0	3	01	1	0
AGPFII2166	PROYECTO FORMATIVO II	2	2	0	0	3	01	1	0
AGPFII2166	PROYECTO FORMATIVO II	2	3	0	0	3	01	1	0
PG216	PROYECTO II	2	2	0	0	3	05	1	0
PG216	PROYECTO II	2	3	0	0	3	05	1	0
PGT22	CARTOGRAFIA GEOLOGICA	2	2	0	0	2	05	1	0
PGT22	CARTOGRAFIA GEOLOGICA	2	3	0	0	2	05	1	0
PGT24	MINERIA I	2	2	0	0	2	05	1	0
PGT24	MINERIA I	2	3	0	0	2	05	1	0
PGT25	ESTRATIGRAFIA	2	2	0	0	2	05	1	0
PGT26	ELECTIVA I	2	2	0	0	2	05	1	0
PGT26	ELECTIVA I	2	3	0	0	2	05	1	0
PGT27	PROYECTO II	2	2	0	0	3	05	1	0
PGT27	PROYECTO II	2	3	0	0	3	05	1	0
PROYSOCI-234	PROYECTO SOCIOINTEGRADOR II	2	2	0	0	3	08	1	0
PROYSOCI-234	PROYECTO SOCIOINTEGRADOR II	2	3	0	0	3	08	1	0
RECUPSFO-245	RECURSOS PSICOTERAPEUTICOS EN FONOAUDIOLOGIA	2	2	0	0	2	08	1	0
RECUPSFO-245	RECURSOS PSICOTERAPEUTICOS EN FONOAUDIOLOGIA	2	3	0	0	2	08	1	0
SEV15025	SISTEMA ECONOMICO Y MODELOS DE DESARROLLO VENEZOLANO	2	2	0	0	5	07	1	0
SEV15025	SISTEMA ECONOMICO Y MODELOS DE DESARROLLO VENEZOLANO	2	3	0	0	5	07	1	0
AGMSA342	MANEJO SANITARIO ANIMAL	3	2	0	0	2	01	1	0
PGT35	AMBIENTE	3	2	0	0	2	05	1	0
PGT35	AMBIENTE	3	3	0	0	2	05	1	0
PGT36	ACREDITABLE II	3	2	0	0	1	05	1	0
PGT36	ACREDITABLE II	3	3	0	0	1	05	1	0
PGT37	PROYECTO III	3	2	0	0	3	05	1	0
PGT37	PROYECTO III	3	3	0	0	3	05	1	0
PRO6604223	ELECTIVA III	4	1	0	0	2	07	1	0
070002	SEMINARIO NIIF PARA PYMES	0	1	0	0	2	07	1	0
AGFIAIP	FISICA APLICADA	0	1	0	0	2	01	1	0
070013	ELECTIVA II	2	1	0	0	2	07	1	0
ACACT2	ACTIVIDADES ACREDITABLES II	2	1	0	0	1	06	1	0
ADC6022	ADMINISTRACIÓN DE COSTOS	2	1	0	0	2	04	1	0
ADETT2-722	ADMINISTRACION DE EMPRESAS TURISTICAS	2	1	0	0	2	06	1	0
AGAGC242	AGROCLIMATOLOGÍA 	2	1	0	0	2	01	1	0
AGAGE242	AGROEPISTEMOLOGÍA	2	1	0	0	5	01	1	0
AGANA262	ALIMENTACIÓN Y NUTRICIÓN ANIMAL ALTERNATIVA	2	1	0	0	2	01	1	0
AGATMA242	APLICACIÓN DE TÉCNICAS Y METODOLOGÍAS AGROECOLOGICAS	2	1	0	0	2	01	1	0
AGATMA246	TÉCNICAS Y METODOLOGÍAS AGROECOLOGICAS	2	1	0	0	2	01	1	0
AGBFSPV242	BOTÁNICA, FISIOLOGÍA Y SISTEMAS DE PRODUCCIÓN VEGETAL	2	1	0	0	2	01	1	0
AGDREV242	DISEMINACIÓN Y REPROD. DE ESPECIES VEGETALES	2	1	0	0	2	01	1	0
AGDRV242	DISEMINACIÓN Y REPROD. DE ESPECIES VEGETALES	2	1	0	0	2	01	1	0
AGDSRC142	DEPORTE, SALUD, RECREACIÓN Y CULTURA	2	1	0	0	1	01	1	0
AGMCA242	MICROBIOLOGIA DE LOS ALIMENTOS	2	1	0	0	5	01	1	0
AGMCB262	MICROBIOLOGÍA	2	1	0	0	5	01	1	0
AGMIC242	MICROBIOLOGÍA 	2	1	0	0	2	01	1	0
AGORS242	ORGANIZACIONES SOCIOPRODUCTIVAS	2	1	0	0	5	01	1	0
070003	DEPORTE, ARTE Y RECREACION II	3	1	0	0	2	07	1	0
AGETD362	ESTADÍSTICA	3	1	0	0	2	01	1	0
070006	HERRAMIENTAS TECNOLÓGICAS II	3	1	0	0	2	07	1	0
070011	AJUSTE POR INFLACION FINANCIERO	3	1	0	0	2	07	1	0
070012	BASES EPISTEMOLOGICAS DE LAS CIENCIAS CONTABLES I	3	1	0	0	2	07	1	0
ACACT3	ACTIVIDADES ACREDITABLES III	3	1	0	0	1	06	1	0
ADM6032	ADMINISTRACIÓN DE MERCADEO	3	1	0	0	2	04	1	0
ADP6032	ADMINISTRACIÓN DE LA PRODUCCIÓN	3	1	0	0	2	04	1	0
ADP9033	ADMINISTRACIÓN DE LA PRODUCCIÓN	3	1	0	0	2	04	1	0
AEF9032	ANÁLISIS E INTERPRETACIÓN DE ESTADOS FINANCIEROS	3	1	0	0	2	04	1	0
AGAGR342	AGROESTADÍSTICA	3	1	0	0	2	01	1	0
AGAMI001	METODOLOGÍA DE LA INVESTIGACIÓN	3	1	0	0	1	01	1	0
AGANA342	ALIMENTACIÓN Y NUTRICIÓN ANIMAL ALTERNATIVA	3	1	0	0	2	01	1	0
AGANM342	ANÁLISIS MATEMÁTICO	3	1	0	0	2	01	1	0
AGANM362	ANÁLISIS MATEMÁTICO	3	1	0	0	2	01	1	0
AGEPS342	ECONOMÍA POLÍTICA Y SOCIAL I	3	1	0	0	5	01	1	0
AGGAE342	GESTIÓN AGROECOLÓGICA	3	1	0	0	2	01	1	0
AGGAE362	GESTIÓN AGROECOLÓGICA	3	1	0	0	2	01	1	0
AGMEI362	MANEJO ECOLÓGICO DE INSECTOS Y ENFERMEDADES	3	1	0	0	5	01	1	0
ACACT4	ACTIVIDADES ACREDITABLES IV	4	1	0	0	1	06	1	0
ADF6042	ADMINISTRACIÓN FINANCIERA	4	1	0	0	2	04	1	0
AEPS6033	ELECTIVA III: ADM DE EMPRESAS DE PRODUCCION Y PROPIEDAD SOCI	4	1	0	0	2	04	1	0
AF6042	ADMINISTRACIÓN FINANCIERA	4	1	0	0	2	04	1	0
AGCTS442	CIENCIA, TECNOLOGÍA Y SOCIEDAD.	4	1	0	0	5	01	1	0
AGCTS462	CIENCIA, TECNOLOGÍA Y SOCIEDAD	4	1	0	0	5	01	1	0
AGECC442	ECOCONSTRUCCIONES	4	1	0	0	2	01	1	0
AGECE442	ECONOMÍA ECOLÓGICA	4	1	0	0	2	01	1	0
AGECR462	ECORREGIONES	4	1	0	0	2	01	1	0
AGECR4C42	ECORREGIONES	4	1	0	0	4	01	1	0
AGEPS442	ECONOMÍA POLÍTICA Y SOCIAL II	4	1	0	0	5	01	1	0
AGFMP442	FITOMEJORAMIENTO PARTICIPATIVO	4	1	0	0	2	01	1	0
AGFMP462	FITOMEJORAMIENTO PARTICIPATIVO	4	1	0	0	2	01	1	0
AGHCA462	HIGIENE Y CONTROL DE CALIDAD EN LOS ALIMENTOS	4	1	0	0	2	01	1	0
AGHCCA442	HIGIENE Y CONTROL DE CALIDAD EN LOS ALIMENTOS	4	1	0	0	2	01	1	0
AGMAP442	MEJORAMIENTO ANIMAL PARTICIPATIVO	4	1	0	0	2	01	1	0
AGMAP46	MEJORAMIENTO ANIMAL PARTICIPATIVO	4	1	0	0	2	01	1	0
AGMEI442	MAQUINARIAS, EQUIPOS E IMPLEMENTOS AGRÍCOLAS ALTERNATIVOS	4	1	0	0	2	01	1	0
AGPEP442	PEDAGOGÍA Y POLÍTICA	4	1	0	0	5	01	1	0
AGPEP462	PEDAGOGÍA Y POLÍTICA	4	1	0	0	5	01	1	0
AGPN003	PROY. NAC. Y NUEVA CIUDADANIA	0	1	0	0	5	01	1	0
PCC000002	MECANICA APLICADA	0	1	0	0	2	02	1	0
AGPRAIP	PRINCIPIOS DE AGROECOLOGIA	0	1	0	0	2	01	1	0
AGTI002	TALLER INTROD. UNIVERS. PROGR.	0	1	0	0	5	01	1	0
CPNMS6002	LA CONTADURIA PUBLICA EN EL NUEVO MODELO SOCIAL	0	1	0	0	2	07	1	0
DEINTI-301	DESARROLLO INTEGRAL	0	1	0	0	2	06	1	0
DI6002	DESARROLLO INTEGRAL	0	1	0	0	2	07	1	0
DIE002	DESARROLLO INTEGRAL	0	1	0	0	2	04	1	0
DIE6002	DESARROLLO INTEGRAL	0	1	0	0	2	04	1	0
AGREA242	REPRODUCCIÓN DE ESPECIES ANIMALES 	2	1	0	0	2	01	1	0
AGREA262	REPRODUCCIÓN DE ESPECIES ANIMALES	2	1	0	0	2	01	1	0
AGSC00	SERVICIO COMUNITARIO	2	1	0	0	5	01	1	0
AGSEA242	SUELO, ECOLOGÍA Y AGRICULTURA	2	1	0	0	2	01	1	0
AGSEA262	SUELO, ECOLOGÍA Y AGRICULTURA	2	1	0	0	2	01	1	0
AGSPV262	SISTEMAS DE PRODUCCION VEGETAL	2	1	0	0	2	01	1	0
AGTCSI242	TOPOGRAFÍA CATASTRO Y SISTEMAS DE INFORMACIÓN GEOGRÁFICA	2	1	0	0	2	01	1	0
AGTOG262	TOPOGRAFÍA	2	1	0	0	2	01	1	0
AGZFSPA242	ZOOLOGÍA, FISIOLOGÍA Y SISTEMAS DE PRODUCCIÓN ANIMAL	2	1	0	0	2	01	1	0
AVTTT2-1084	ADMINISTRACION DE AGENCIAS DE VIAJES Y TRANSPORTE TURISTICO	2	1	0	0	2	06	1	0
PCCP11309	PROYECTO NACIONAL Y NUEVA CIUDADANIA	0	1	0	0	5	02	1	0
PCCP12209	TALLER DE INDUCCION A LA UNIVERSIDAD Y AL PROGRAMA	0	1	0	0	5	02	1	0
PCCP13509	MATEMATICA DE NIVELACION	0	1	0	0	2	02	1	0
CGA9023	ELECTIVA I: CALIDAD Y GESTION AMBIENTAL	2	1	0	0	2	04	1	0
COC9023	CONTABILIDAD DE COSTOS	2	1	0	0	2	07	1	0
CON12024	CONTABILIDAD II	2	1	0	0	2	04	1	0
CON15025	CONTABILIDAD II	2	1	0	0	2	07	1	0
CON9023	CONTABILIDAD II	2	1	0	0	2	04	1	0
DCCTT2-1445	DESARROLLO Y CALIDAD DE VIDA DE LAS COMUNIDADES TURISTICAS	2	1	0	0	5	06	1	0
DIAGINAU-245	DIAGNOSTICO E INTERVENCION AUDITIVA I	2	1	0	0	2	08	1	0
DIAGINHA-256	DIAGNOSTICO E INTERVENCION DEL HABLA	2	1	0	0	2	08	1	0
DIAGINLE-256	DIAGNOSTICO E INTERVENCION DEL LENGUAJE I	2	1	0	0	2	08	1	0
AGPFIII3126	PROYECTO FORMATIVO III	3	1	0	0	3	01	1	0
AGPFIII3166	PROYECTO FORMATIVO III	3	1	0	0	3	01	1	0
AGPSLC342	PENSAMIENTO SOCIOPOLÍTICO LATINOAMERICANO Y DEL CARIBE	3	1	0	0	5	01	1	0
AGSIP342	SISTEMAS INTEGRALES DE PRODUCCIÓN	3	1	0	0	2	01	1	0
AGSPA262	SISTEMAS DE PRODUCCIÓN ANIMAL	3	1	0	0	2	01	1	0
AGSRD342	SISTEMAS DE RIEGO Y DRENAJE	3	1	0	0	2	01	1	0
AGSRD362	SISTEMAS DE RIEGO Y DRENAJE	3	1	0	0	2	01	1	0
AUD9033	AUDITORIA I	3	1	0	0	2	07	1	0
DAR9033	DEPORTE ARTE Y RECREACIÓN II	3	1	0	0	2	04	1	0
DEPORECR-322	DEPORTE Y RECREACION	3	1	0	0	2	08	1	0
DIAGINAU-345	DIAGNOSTICO E INTERVENCION AUDITIVA II	3	1	0	0	2	08	1	0
DIAGINLE-345	DIAGNOSTICO E INTERVENCION DEL LENGUAJE II	3	1	0	0	2	08	1	0
DIAGINVO-345	DIAGNOSTICO E INTERVENCION DE LA VOZ I	3	1	0	0	2	08	1	0
AGPFIV41	PROYECTO FORMATIVO IV	4	1	0	0	3	01	1	0
AGPFIV4166	PROYECTO FORMATIVO IV	4	1	0	0	3	01	1	0
AGPLE442	PLANIFICACIÓN ECORREGIONAL	4	1	0	0	2	01	1	0
AGPLE462	PLANIFICACIÓN ECORREGIONAL	4	1	0	0	2	01	1	0
AGPSL362	PENSAMIENTO SOCIOPOLÍTICO LATINOAMERICANO Y DEL CARIBE	4	1	0	0	5	01	1	0
AGSCSNI442	SISTEMAS DE CERTIFICACIÓN SOCIAL NACIONAL E INTERNACIONAL	4	1	0	0	2	01	1	0
AGSIG462	SISTEMAS DE INFORMACIÓN GEOGRÁFICA	4	1	0	0	2	01	1	0
AGSIP362	SISTEMAS INTEGRALES DE PRODUCCIÓN	4	1	0	0	2	01	1	0
AIEF6042	ANÁLISIS E INTERPRETACIÓN DE ESTADOS FINANCIEROS	4	1	0	0	2	04	1	0
APAA3041	AUDITORIA ADMINISTRATIVA	4	1	0	0	2	04	1	0
APUALC15045	ADM EN LOS PROCESOS DE UNIDAD DE AMÉRICA LATINA EL CARIBE	4	1	0	0	5	04	1	0
AUD9043	AUDITORIA II	4	1	0	0	2	07	1	0
COE9043	CONTABILIDAD ESPECIALIZADA	4	1	0	0	2	07	1	0
COMET4-963	COMERCIO ELECTRONICO	4	1	0	0	2	06	1	0
COO6042	COMPORTAMIENTO ORGANIZACIONAL	4	1	0	0	2	07	1	0
DEPTT4-963	DISEÑO Y EVALUACION DE PROYECTOS TURISTICOS	4	1	0	0	2	06	1	0
DET6042	DIMENSIONES ETICAS APLICADAS AL EJERCICIO PROFESIONAL	4	1	0	0	2	07	1	0
DETHT4-722	DESARROLLO DEL TALENTO HUMANO	4	1	0	0	2	06	1	0
DIAGINAU-457	DIAGNOSTICO E INTERVENCION AUDITIVA III	4	1	0	0	2	08	1	0
DIAGINVO-447	DIAGNOSTICO E INTERVENCION DE LA VOZ II	4	1	0	0	2	08	1	0
FISICAFO-03	FISICA	0	1	0	0	2	08	1	0
GRPC3001	GESTIÓN DE RIESGOS Y PROTECCIÓN CIVIL	0	1	0	0	2	04	1	0
HERTECFO-05	HERRAMIENTAS TECNOLOGICAS	0	1	0	0	2	08	1	0
IDIOTI-602	IDIOMAS	0	1	0	0	2	06	1	0
IDIOTT-48	IDIOMAS	0	1	0	0	2	06	1	0
INPNFOFO-05	INTRODUCCION AL PNF EN FONOAUDIOLOGIA	0	1	0	0	2	08	1	0
IUTSTI-482	INTR. A LA UNIV. Y EL TURISMO EN EL NUEVO MODELO SOCIAL	0	1	0	0	2	06	1	0
IUTSTT-36	INTRODUCCION A LA UNIVERSIDAD Y EL TURISMO	0	1	0	0	2	06	1	0
LECCOMFO-05	LECTURA Y COMPRENSION	0	1	0	0	2	08	1	0
MA6002	MATEMATICA	0	1	0	0	2	04	1	0
MAT6002	MATEMATICA	0	1	0	0	2	04	1	0
MATETI-963	MATEMATICAS	0	1	0	0	2	06	1	0
PCC012209	TALLER DE INDUCCION A LA UNIVERSIDAD POL.	0	1	0	0	5	02	1	0
PCC013509	MATEMATICA INICIAL	0	1	0	0	2	02	1	0
PCC014209	OPTATIVA INSTITUCIONAL	0	1	0	0	2	02	1	0
PCC015209	CONSTRUCCION CIVIL Y SOCIEDAD	0	1	0	0	2	02	1	0
PCC011309	PROYECTO NACIONAL Y NUEVA CIUDADANIA	0	1	5	0	5	02	1	0
ELEC19023	ELECTIVA I	2	1	0	0	2	04	1	0
ELEC29023	ELECTIVA II	2	1	0	0	2	04	1	0
ELECTIVA-222	ELECTIVA II	2	1	0	0	2	08	1	0
ESMD15025	ECONOMÍA, SUSTENTABILIDAD Y MODELOS DE DESARROLLO	2	1	0	0	5	04	1	0
FSC18026	FORMACION SOCIO CRITICA II	2	1	0	0	5	04	1	0
PIMT005	MATEMATICA	0	1	0	0	2	01	1	0
GABET2-843	GESTION DE ALIMENTOS Y BEBIDAS	2	1	0	0	2	06	1	0
GEDAT2-1084	GESTION DE ALOJAMIENTO	2	1	0	0	2	06	1	0
GORET2-722	GESTION DE OCIO Y RECREACION	2	1	0	0	2	06	1	0
IDIOT2-2167	IDIOMAS II	2	1	0	0	2	06	1	0
LLS6022	LEGISLACION LABORAL Y SEGURIDAD SOCIAL	2	1	0	0	2	07	1	0
PG113	QUIMICA I	1	1	0	0	2	05	1	0
MLO0602	MARCO LEGAL DE LAS ORGANIZACIONES	2	1	0	0	2	04	1	0
NEUROLIN-245	NEUROLINGUISTICA	2	1	0	0	2	08	1	0
OM6022	ORGANIZACIÓN Y MÉTODOS	2	1	0	0	2	04	1	0
OUPST2-61220	OPER. UNIDADES PROD. SOCIAL Y FACILITACION DE SERV. TURIST.	2	1	0	0	3	06	1	0
OYS9023	ORGANIZACIÓN Y SISTEMAS	2	1	0	0	2	04	1	0
PATOCOHU-256	PATOLOGIA DE LA COMUNICACION HUMANA	2	1	0	0	2	08	1	0
DSRST3-1445	DES. SUSTENTABLE Y SOST. DE LOS RECURSOS Y SERV. TUR.	3	1	0	0	5	06	1	0
DTCST3-61220	DESARROLLO DEL TURISMO COMUNITARIO Y SOCIAL	3	1	0	0	3	06	1	0
ELECTIVA-322	ELECTIVA III	3	1	0	0	2	08	1	0
FEP3031	FORMULACIÓN Y EVALUACIÓN DE PROYECTO	3	1	0	0	2	04	1	0
FEVP001	FORMULACIÓN Y EVALUACIÓN DE PROYECTOS	3	1	0	0	2	07	1	0
FSC18036	FORMACION SOCIO CRITICA III	3	1	0	0	5	04	1	0
GDTUT3-2167	GESTIÓN DE DESTINOS TURÍSTICOS	3	1	0	0	2	06	1	0
GEC9033	GERENCIA DE COSTOS	3	1	0	0	2	07	1	0
GEF9033	GESTIÓN FINANCIERA	3	1	0	0	2	07	1	0
IDI9033	IDIOMAS II	3	1	0	0	2	04	1	0
IDIOT3-28810	IDIOMAS III	3	1	0	0	2	06	1	0
ING9033	INGLES II	3	1	0	0	2	04	1	0
INMET3-963	INVESTIGACIÓN DE MERCADOS EMISORES	3	1	0	0	2	06	1	0
MOTRORAL-334	MOTRICIDAD ORAL	3	1	0	0	2	08	1	0
MOTUT3-963	MODALIDADES TURÍSTICAS	3	1	0	0	2	06	1	0
EDUCAMBI-434	EDUCACION AMBIENTAL	4	1	0	0	2	08	1	0
ELEC39043	ELECTIVA III	4	1	0	0	2	04	1	0
ELEC49043	ELECTIVA IV	4	1	0	0	2	04	1	0
ELECTIVA-422	ELECTIVA IV	4	1	0	0	2	08	1	0
ETCAT4-1806	ESTUDIOS DEL TURISMO EN EL GRAN CARIBE Y LOS PAISES DEL ALBA	4	1	0	0	5	06	1	0
FAPTT4-963	FACTIBILIDAD DE PROYECTOS TURISTICOS	4	1	0	0	2	06	1	0
FEP9043	FORMULACION Y EVALUACIÓN DE PROYECTOS	4	1	0	0	2	04	1	0
FSC18046	FORMACION SOCIO CRITICA IV	4	1	0	0	5	04	1	0
GEPTT4-61220	GESTION DE PROYECTOS TURISTICOS	4	1	0	0	3	06	1	0
GESTADFO-457	GESTION ADMINISTRATIVA EN FONOAUDIOLOGIA	4	1	0	0	2	08	1	0
GFETT4-963	GESTION FINANCIERA DE LAS EMPRESAS TURISTICAS	4	1	0	0	2	06	1	0
GHAT9043	GESTION HUMANA Y AMBIENTE DE TRABAJO	4	1	0	0	2	07	1	0
IDIOT4-2167	IDIOMAS IV	4	1	0	0	2	06	1	0
NETUT4-963	NEGOCIACION TURISTICAS	4	1	0	0	2	06	1	0
PCC117109	SALUD FISICA	0	1	0	0	1	02	1	0
PCCP14209	MECANICA APLICADA	0	1	0	0	1	02	1	0
PCC133209	GESTION DE OBRAS SOSTENIBLES	2	1	0	0	2	02	1	0
PCC200	SERVICIO COMUNITARIO	2	1	0	0	5	02	1	0
PCC211409	TUTORIA DE PROYECTO II	2	1	0	0	3	02	1	0
PCC211410	PARTICIPACIÓN COMUNITARIA	2	1	0	0	1	02	1	0
PCC212109	HIGIENE Y SEGURIDAD INDUSTRIAL	2	1	0	0	5	02	1	0
PCC213309	MATERIALES DE CONSTRUCCION	2	1	0	0	2	02	1	0
PCC214109	RESISTENCIA DE MATERIALES	2	1	0	0	2	02	1	0
PCC217109	IDIOMAS	2	1	0	0	1	02	1	0
PCC222109	IMPACTO AMBIENTAL EN LA CONSTRUCCION	2	1	0	0	5	02	1	0
PCC223309	ADMINISTRACION DE OBRAS	2	1	0	0	2	02	1	0
PCC224309	TECNOLOGIA DE LA CONSTRUCCION	2	1	0	0	2	02	1	0
PCC225309	MECANICA DE SUELOS	2	1	0	0	2	02	1	0
PCC226209	INSTALACIONES SANITARIAS Y DE GAS	2	1	0	0	2	02	1	0
PCC232109	DESARROLLO PROFESIONAL Y ETICA	2	1	0	0	5	02	1	0
PCC234209	ELECTRICIDAD Y MECANICA	2	1	0	0	2	02	1	0
PCC235309	OBRAS VIALES	2	1	0	0	2	02	1	0
PCC236209	SISTEMAS HIDROSANITARIOS	2	1	0	0	2	02	1	0
PCC237109	ELECTIVA I	2	1	0	0	1	02	1	0
PCEP9023	PRESUPUESTO Y CONTABILIDAD PARA ENTES PUBLICOS	2	1	0	0	2	07	1	0
PCG3011	CONTABILIDAD GUBERNAMENTAL	2	1	0	0	2	04	1	0
PDF3012	DEBERES FORMALES DEL CONTRIBUYENTE II (ISLR)	2	1	0	0	2	04	1	0
PG211	PETROLOGÃƒÂ­A	2	1	0	0	2	05	1	0
PCC311409	TUTORIA DE PROYECTO III	3	1	0	0	3	02	1	0
PCC312109	DESARROLLO ENDOGENO EN LA CONSTRUCCION	3	1	0	0	5	02	1	0
PCC313309	ALGEBRA LINEAL	3	1	0	0	2	02	1	0
PCC314309	GEOMETRIA DESCRIPTIVA	3	1	0	0	2	02	1	0
PCC315309	GEOLOGIA APLICADA	3	1	0	0	2	02	1	0
PCC316309	MECANICA DE LOS FLUIDOS PARA INGENIEROS	3	1	0	0	2	02	1	0
PCC322109	ORGANISMOS Y CONVENIOS INTERNACIONALES	3	1	0	0	5	02	1	0
PCC323309	MATEMATICA PARA INGENIEROS	3	1	0	0	2	02	1	0
PCC324309	ANALISIS ESTRUCTURAL	3	1	0	0	2	02	1	0
PCC325309	DISEÑO VIAL	3	1	0	0	2	02	1	0
PCC326309	RESISTENCIA DE MATERIALES PARA INGENIEROS	3	1	0	0	2	02	1	0
PCC332109	POLITICA DE HABITAT Y VIVIENDA	3	1	0	0	5	02	1	0
PCC333309	ECONOMIA Y GERENCIA DE PROYECTOS	3	1	0	0	2	02	1	0
PCC334309	CONCRETO ARMADO	3	1	0	0	2	02	1	0
PCC336309	HIDROLOGIA	3	1	0	0	2	02	1	0
PCC416309	ACUEDUCTOS DE CLOACAS Y DRENAJES	3	1	0	0	2	02	1	0
PCC411409	TUTORIA DE PROYECTO IV	4	1	0	0	3	02	1	0
PCC412109	INGENIERIA Y PATRIMONIO 	4	1	0	0	5	02	1	0
PCC413309	URBANISMOS Y EDIFICACIONES	4	1	0	0	2	02	1	0
PCC415309	INGENIERIA DE TRANSITO	4	1	0	0	2	02	1	0
PCC422109	GERENCIA SOCIAL	4	1	0	0	5	02	1	0
PCC423309	MANTENIMIENTO DE OBRAS CIVILES	4	1	0	0	2	02	1	0
PCC424309	DISEÑO ESTRUCTURAL	4	1	0	0	2	02	1	0
PCC425309	PAVIMENTOS	4	1	0	0	2	02	1	0
PCC426309	SANEAMIENTOS Y CONSERVACION AMBIENTAL	4	1	0	0	2	02	1	0
PCC432109	EVALUACION AMBIENTAL	4	1	0	0	5	02	1	0
PCC434309	FUNDACIONES Y MUROS	4	1	0	0	2	02	1	0
PGTI1	MATEMATICA INICAL	0	1	0	0	2	05	1	0
PGTI2	PROYECTO NACIONAL Y NUEVA CIUDADANIA	0	1	0	0	5	05	1	0
PGTI3	INTRODUCCION A LA UNIVERSIDAD POLITECNICA Y PNF	0	1	0	0	2	05	1	0
PGTI4	INTRODUCCION A LOS PROYECTOS Y AL PNF	0	1	0	0	5	05	1	0
PGTI5	EDUCACION FISICA	0	1	0	0	2	05	1	0
PGTT1	MATEMATICA III	0	1	0	0	2	05	1	0
PGTT2	INDUCCION A LA GEOCIENCIAS	0	1	0	0	2	05	1	0
PGTT3	PROYECTO NACIONAL Y NUEVA CIUDADANIA INT UNIV. POL. Y PNF	0	1	0	0	5	05	1	0
PGTT4	PRINCIPIOS DE FISICA Y MECANICA	0	1	0	0	2	05	1	0
PG221	SEDIMENTOLOGÍA	2	1	0	0	2	05	1	0
PG222	GEOMORFOLOGÍA Y TELEDETECCIÓN	2	1	0	0	2	05	1	0
PG223	FÍSICA APLICADA	2	1	0	0	2	05	1	0
PG224	MINERÃƒÂ­A I	2	1	0	0	2	05	1	0
PG225	SOBERANIA POLÍTICA E INDEPENDENCIA ECONÓMICA II	2	1	0	0	5	05	1	0
PG231	ESTRATIGRAFÍA	2	1	0	0	2	05	1	0
PG232	GEOLOGÍA DE CAMPO	2	1	0	0	2	05	1	0
PG233	MECANICA RACIONAL	2	1	0	0	2	05	1	0
PG234	MINERÃƒÂ­A II	2	1	0	0	2	05	1	0
PG235	POLÍTICAS ENERGETICAS	2	1	0	0	5	05	1	0
PGT21	PETROLOGIA	2	1	0	0	2	05	1	0
PGT23	FISICA	2	1	0	0	2	05	1	0
PG311	ESTADISTICA	3	1	0	0	2	05	1	0
PG312	MECANICA DE FLUIDOS	3	1	0	0	2	05	1	0
PG313	RESISTENCIA DE MATERIALES	3	1	0	0	2	05	1	0
PG314	SERVICIO DE MINAS	3	1	0	0	2	05	1	0
PG315	CIENCIA Y TECNOLOGÍA I	3	1	0	0	5	05	1	0
PG316	PROYECTO III	3	1	0	0	3	05	1	0
PG321	GEOLOGÍA DE YACIMIENTOS	3	1	0	0	2	05	1	0
PG322	HIDROLOGÍA	3	1	0	0	2	05	1	0
PG323	MECANICA DE ROCAS Y SUELOS	3	1	0	0	2	05	1	0
PG324	DISEÑO DE SISTEMAS MINEROS	3	1	0	0	2	05	1	0
PG325	CIENCIA Y TECNOLOGÍA II	3	1	0	0	5	05	1	0
PG331	EVALUACIÓN DE YACIMIENTOS	3	1	0	0	2	05	1	0
PG332	HIDROGEOLOGÍA	3	1	0	0	2	05	1	0
PG333	GEOTÉCNIA	3	1	0	0	2	05	1	0
PG334	LEGISLACIÓN MINERA Y PETROLERA	3	1	0	0	2	05	1	0
PG335	LÓGICA DIALECTICA	3	1	0	0	5	05	1	0
PGT31	YACIMIENTOS MINERALES	3	1	0	0	2	05	1	0
PGT32	EXPLORACION	3	1	0	0	2	05	1	0
PGT33	GEOMECANICA	3	1	0	0	2	05	1	0
PGT34	MINERIA II	3	1	0	0	2	05	1	0
PG411	GEOLOGÍA HISTÓRICA	4	1	0	0	2	05	1	0
PG412	EXPLORACIÓN GEOFÍSICA	4	1	0	0	2	05	1	0
PG413	SEGURIDAD, HIGIENE Y AMBIENTE	4	1	0	0	2	05	1	0
PG414	PREPARACIÓN Y CONCENTRACIÓN DE MINERALES I	4	1	0	0	2	05	1	0
PG415	ECONOMÍA POLÍTICA I	4	1	0	0	5	05	1	0
PG416	PROYECTO IV	4	1	0	0	3	05	1	0
PG421	GEOLOGÍA DE VENEZUELA	4	1	0	0	2	05	1	0
PG422	EXPLORACION GEOQUÍMICA	4	1	0	0	2	05	1	0
PG423	GESTIÓN AMBIENTAL 	4	1	0	0	2	05	1	0
PG424	PREPARACIÓN Y CONCENTRACIÓN DE MINERALES II	4	1	0	0	2	05	1	0
PG425	ECONOMÍA POLÍTICA II	4	1	0	0	5	05	1	0
PG431	GEOLOGÍA DEL PETRÓLEO	4	1	0	0	2	05	1	0
PG432	GERENCIA DE PROYECTOS	4	1	0	0	2	05	1	0
PG433	EVALUACIÓN Y GESTIÓN DE RIESGOS GEOLÓGICOS	4	1	0	0	2	05	1	0
PG434	DISEÑO DE PLANTAS MINERAS	4	1	0	0	2	05	1	0
PG435	ECONOMÍA POLÍTICA III	4	1	0	0	5	05	1	0
PGT41	GEOLOGIA DE VENEZUELA	4	1	0	0	2	05	1	0
PGT42	GEOLOGIA DE LOS HIDROCARBUROS	4	1	0	0	2	05	1	0
PGT43	HIDROLOGIA	4	1	0	0	2	05	1	0
PGT44	BENEFICIO MINERAL	4	1	0	0	2	05	1	0
PGT45	GERENCIA	4	1	0	0	2	05	1	0
PGT46	ELECTIVA II	4	1	0	0	2	05	1	0
PGT47	PROYECTO IV	4	1	0	0	3	05	1	0
PIPN003	PROY. NAC. Y NUEVA CIUDADANIA	0	1	0	0	5	01	1	0
PITI002	TALLER INTROD. UNIVERS. PROGR.	0	1	0	0	5	01	1	0
PNNC8003	PROYECTO NACIONAL Y NUEVA CIUDADANIA	0	1	0	0	5	07	1	0
PNNC9003	PROYECTO NACIONAL Y NUEVA CIUDADANIA	0	1	0	0	5	04	1	0
PNNCTI-963	PROYECTO NACIONAL Y NUEVA CIUDADANIA	0	1	0	0	5	06	1	0
PNNCTT-48	PROYECTO NACIONAL Y NUEVA CIUDADANIA	0	1	0	0	5	06	1	0
PRNANCFO-03	PROYECTO NACIONAL Y NUEVA CIUDADANIA	0	1	0	0	5	08	1	0
PRO6002	LA ADMINISTRACIÓN EN EL NUEVO MODELO SOCIAL	0	1	0	0	2	04	1	0
SALPUBFO-04	SALUD PUBLICA	0	1	0	0	2	08	1	0
PIMT004	MATEMÁTICA	0	1	5	0	2	03	1	0
TCPNMS6002	LA CONTADURIA PUBLICA EN EL NUEVO MODELO SOCIAL	0	1	0	0	2	07	1	0
PIRI2	COMPRESIÓN DE LA LECTURA Y REDACCIÓN DE TEXTOS ACADÉMICOS	2	1	0	0	1	03	1	0
PRACPROF-2120	PRACTICAS PROFESIONALES I	2	1	0	0	2	08	1	0
PRO57019	SUPERVISIÓN Y CONDUCCIÓN TÉCNICA DE PROCESOS ADM.	2	1	0	0	3	04	1	0
DAR9013	DEPORTE ARTE Y RECREACIÓN I	1	1	0	0	2	04	1	0
PRO700224	SUPERVISIÓN Y CONDUCCIÓN TÉCNICA DE PROCESOS ADM.	2	1	0	0	3	04	1	0
PRO7502251	INGLES II	2	1	0	0	2	07	1	0
PRO7502252	FUNDAMENTOS TECNICOS Y JURIDICOS DE LA ADMON PUBLICA	2	1	0	0	2	07	1	0
SC00	SERVICIO COMUNITARIO	2	1	0	0	5	04	1	0
PLMTT3-963	PLAN DE MERCADEO TURÍSTICO	3	1	0	0	2	06	1	0
PPL6032	PLANIFICACIÓN	3	1	0	0	2	04	1	0
PPR3031	PRESUPUESTO PRIVADO	3	1	0	0	2	04	1	0
PPR9033	PRESUPUESTO PRIVADO	3	1	0	0	2	07	1	0
PPU4032	PRESUPUESTO PÚBLICO	3	1	0	0	2	04	1	0
PRACPROF-3120	PRACTICAS PROFESIONALES II	3	1	0	0	2	08	1	0
PRE9033	PRESUPUESTO PÚBLICO Y PRIVADO	3	1	0	0	2	04	1	0
PROYSOCI-334	PROYECTO SOCIOINTEGRADOR III	3	1	0	0	3	08	1	0
PSICOMOT-323	PSICOMOTRICIDAD	3	1	0	0	2	08	1	0
PORTINST-434	PORTUGUES INSTRUMENTAL	4	1	0	0	2	08	1	0
PP13041	PAQUETES INFORMATICOS APLICADOS A LOS PROC ADMINIST	4	1	0	0	2	04	1	0
PRACPROF-41216	PRACTICAS PROFESIONALES III	4	1	0	0	2	08	1	0
PRO570419	DIRECCIÓN, CONTROL Y EVALUACIÓN DE SISTEMAS ADM	4	1	0	0	3	04	1	0
PRO660422	DESARROLLO DE NUEVAS TENDENCIAS EN LA GESTION CONTABLE FINAN	4	1	0	0	3	07	1	0
PRO6604221	HERRAMIENTAS TECNOLOGICAS III	4	1	0	0	2	07	1	0
PRO6604222	BASES EPISTEMOLOGICAS DE LA CIENCIA CONTABLE II	4	1	0	0	2	07	1	0
PRO6604224	GESTION SOCIAL	4	1	0	0	2	07	1	0
PRO6604226	LIDERAZGO Y TOMA DE DECISIONES	4	1	0	0	2	07	1	0
PRO6604227	RESPONSABILIDAD SOCIAL	4	1	0	0	2	07	1	0
PRO700424	DIRECCIÓN, CONTROL Y EVALUACIÓN DE SISTEMAS ADM	4	1	0	0	3	04	1	0
PROYSOCI-479	PROYECTO SOCIOINTEGRADOR IV	4	1	0	0	3	08	1	0
SALUOCFO-456	SALUD OCUPACIONAL EN FONOAUDIOLOGIA	4	1	0	0	2	08	1	0
SFN6042	SISTEMA FINANCIERO NACIONAL	4	1	0	0	2	04	1	0
SHDD9043	SEMINARIO HABILIDADES DIRECTIVAS II	4	1	0	0	2	04	1	0
SIF6042	SISTEMAS FINANCIEROS 	4	1	0	0	2	04	1	0
TECOTI-361	TECNOLOGIAS DE LA COMUNICACION	0	1	0	0	2	06	1	0
TECOTT-48	TECNOLOGIAS DE LA COMUNICACION	0	1	0	0	2	06	1	0
THERTECFO-03	HERRAMIENTAS TECNOLOGICAS	0	1	0	0	2	08	1	0
TINVESAFO-04	INVESTIGACION EN SALUD	0	1	0	0	2	08	1	0
TPNNC8003	PROYECTO NACIONAL Y NUEVA CIUDADANIA	0	1	0	0	5	07	1	0
TPORTINFO-03	PORTUGUES INSTRUMENTAL	0	1	0	0	2	08	1	0
TPRNANCFO-03	PROYECTO NACIONAL Y NUEVA CIUDADANIA	0	1	0	0	5	08	1	0
PCC000001	FISICA APLICADA	0	1	3	2	2	02	1	0
070001	DEPORTE, ARTE Y RECREACION I	1	1	0	0	2	07	1	0
070004	TECNOLOGÍA DE LA COMUNICACIÓN E INFORMACIÓN	1	1	0	0	2	07	1	0
070005	FUNDAMENTOS DE LA ADMINISTRACIÓN	1	1	0	0	2	07	1	0
070008	ELECTIVA I	1	1	0	0	2	07	1	0
070009	INGLES I	1	1	0	0	2	07	1	0
070010	DEBERES FORMALES DEL CONTRIBUYENTE	1	1	0	0	2	07	1	0
ACACT1	ACTIVIDADES ACREDITABLES I	1	1	0	0	1	06	1	0
AGBFV162	BOTÁNICA Y FISIOLOGÍA VEGETAL	1	1	0	0	2	01	1	0
AGBSD142	BIODIVERSIDAD Y SOCIODIVERSIDAD	1	1	0	0	2	01	1	0
AGBSD162	BIODIVERSIDAD Y SOCIODIVERSIDAD	1	1	0	0	2	01	1	0
AGCGA142	CÁLCULO GEOMÉTRICO APLICADO	1	1	0	0	2	01	1	0
AGCGA16	CÁLCULO GEOMÉTRICO APLICADO	1	1	0	0	2	01	1	0
AGFIA142	FÍSICA APLICADA	1	1	0	0	2	01	1	0
AGFIA162	FÍSICA APLICADA	1	1	0	0	2	01	1	0
AGMAA16	MATEMATICA APLICADA	1	1	0	0	2	01	1	0
AGMAT142	MANEJO DE LAS TIC	1	1	0	0	1	01	1	0
AGMEI162	MAQUINARIAS, EQUIPOS E IMPLEMENTOS AGRÍCOLAS ALTERNATIVOS	1	1	0	0	2	01	1	0
AGPFI1126	PROYECTO FORMATIVO I	1	1	0	0	3	01	1	0
AGPFI1166	PROYECTO FORMATIVO I	1	1	0	0	3	01	1	0
AGPLA142	POLÍTICAS Y LEGISLACIÓN AGRARIA	1	1	0	0	2	01	1	0
AGPLA162	POLÍTICAS Y LEGISLACIÓN AGRARIA	1	1	0	0	5	01	1	0
PIGP4	GESTIÓN DE PROYECTOS INFORMÁTICOS	4	1	3	3	2	03	1	0
AGPRA142	PRINCIPIOS DE AGROECOLOGIA	1	1	0	0	2	01	1	0
AGPRA162	PRINCIPIOS DE AGROECOLOGIA	1	1	0	0	2	01	1	0
AGPRB142	PRINCIPIOS DE BIOLOGÍA 	1	1	0	0	2	01	1	0
AGPRB162	PRINCIPIOS DE BIOLOGÍA	1	1	0	0	5	01	1	0
AGPRBQ142	PRINCIPIOS DE BIOQUÍMICA	1	1	0	0	2	01	1	0
AGPRBQ162	PRINCIPIOS DE BIOQUÍMICA	1	1	0	0	5	01	1	0
AGQGA142	QUÍMICA GENERAL APLICADA	1	1	0	0	2	01	1	0
AGQGA16	QUÍMICA GENERAL APLICADA	1	1	0	0	2	01	1	0
AGSALC14	SOCIOHISTORIA DE LA AGRICULTURA LATINOAMER. Y DEL CARIBE	1	1	0	0	5	01	1	0
AGSALC142	SOCIOHISTORIA DE LA AGRICULTURA LATINOAMER. Y DEL CARIBE	1	1	0	0	5	01	1	0
AGZFA162	ZOOLOGÍA Y FISIOLOGÍA ANIMAL	1	1	0	0	2	01	1	0
APN15015	ADMINISTRACIÓN PÚBLICA NACIONAL	1	1	0	0	5	04	1	0
BASEACCO-156	BASES ACUSTICAS DE LA COMUNICACION	1	1	0	0	2	08	1	0
BASEPRFO-156	BASES DE LA PRACTICA FONOAUDIOLOGICA	1	1	0	0	2	08	1	0
CASTT1-722	CALIDAD DE LOS SERVICIOS TURISTICOS	1	1	0	0	2	06	1	0
CON12014	CONTABILIDAD I	1	1	0	0	2	04	1	0
CON18016	CONTABILIDAD I	1	1	0	0	2	07	1	0
DFC6012	DEBERES FORMALES DEL CONTRIBUYENTE (RETENCIONES)	1	1	0	0	2	04	1	0
DIPTT1-601	DISEÑO DE PRODUCTO TURÍSTICO	1	1	0	0	2	06	1	0
ECC001	ELEMENTOS CONTABLES EN LAS COOPERATIVAS	1	1	0	0	2	07	1	0
ELECTIVA-122	ELECTIVA I	1	1	0	0	2	08	1	0
ES3011	ESTADÍSTICA	1	1	0	0	2	04	1	0
ESTRFUCO-156	ESTRUCTURA Y FUNCION DE LA COMUNICACION	1	1	0	0	2	08	1	0
FA12014	FUNDAMENTOS DE LA ADMINISTRACIÓN	1	1	0	0	2	04	1	0
FE6012	FUNDAMENTOS DE LA ECONOMIA	1	1	0	0	2	07	1	0
FONEFONO-134	FONETICA Y FONOLOGIA	1	1	0	0	2	08	1	0
FPNTT1-61220	FOMENTO DEL PATRIMONIO NACIONAL Y TURISTICO	1	1	0	0	3	06	1	0
GETUT1-602	GEOGRAFÍA TURÍSTICA	1	1	0	0	2	06	1	0
IDI9013	IDIOMAS I	1	1	0	0	2	04	1	0
IDIOT1-2167	IDIOMAS I	1	1	0	0	2	06	1	0
ING9013	INGLES I	1	1	0	0	2	04	1	0
INGLINST-134	INGLES INSTRUMENTAL	1	1	0	0	2	08	1	0
MLE6012	MARCO LEGAL DE LAS ENTIDADES	1	1	0	0	2	07	1	0
OF6012	OPERACIONES FINANCIERAS	1	1	0	0	2	04	1	0
ORGAPACO-134	ORGANIZACION Y PARTICIPACION COMUNITARIA	1	1	0	0	2	08	1	0
PANTT1-1445	PATRIMONIO NACIONAL Y TURÍSTICO	1	1	0	0	5	06	1	0
PCC111409	TUTORIA DE PROYECTO	1	1	0	0	3	02	1	0
PCC112109	ESTRUCTURA ORGANIZATIVA DEL ESTADO	1	1	0	0	5	02	1	0
PCC113309	MATEMATICA	1	1	0	0	2	02	1	0
PCC114109	CONSTRUCCION DE DOCUMENTOS	1	1	0	0	5	02	1	0
PCC114111	LENGUAJE Y COMUNICACIÓN	1	1	0	0	1	02	1	0
PCC115309	TOPOGRAFIA	1	1	0	0	2	02	1	0
PCC116309	EXPRESION GRAFICA Y DIBUJO DE PROYECTO	1	1	0	0	2	02	1	0
PCC118109	CULTURA	1	1	0	0	1	02	1	0
THAT9023	TALENTO HUMANO Y AMBIENTE DE TRABAJO	2	1	0	0	2	04	1	0
TRI6022	TRIBUTACIÓN I	2	1	0	0	2	07	1	0
TDR3031	DECLARACIÓN DE RENTAS	3	1	0	0	2	04	1	0
TIC6032	TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN III	3	1	0	0	2	04	1	0
TRI6032	TRIBUTACION II	3	1	0	0	2	07	1	0
TECNTEFO-456	TECNICAS Y TECNOLOGIAS EN FONOAUDIOLOGIA	4	1	0	0	2	08	1	0
PCC414309	ACERO Y MADERA	4	1	3	2	2	02	1	0
PCC122109	GEOGRAFIA Y HABITAT	1	1	0	0	5	02	1	0
PCC124109	INFORMATICA INSTRUMENTAL	1	1	0	0	1	02	1	0
PCC127209	FISICA APLICADA	1	1	0	0	2	02	1	0
PCC132109	ECONOMIA Y PRODUCCION	1	1	0	0	5	02	1	0
PCC134209	MECANICA	1	1	0	0	2	02	1	0
PCC137109	QUIMICA GENERAL	1	1	0	0	2	02	1	0
PCC215309	ANALISIS ESTADISTICOS	1	1	0	0	2	02	1	0
PG111	MATEMATICA I	1	1	0	0	2	05	1	0
PG112	SISTEMAS DE REPRESENTACION GRAFICA	1	1	0	0	2	05	1	0
PG114	INTRODUCCION A LA GEOCIENCIA	1	1	0	0	2	05	1	0
PG115	DIMENSION UNIVERSAL DEL HOMBRE I	1	1	0	0	5	05	1	0
PG116	PROYECTO I	1	1	0	0	3	05	1	0
PG117	REDACCIÓN DE INFORMES TÉCNICOS	1	1	0	0	1	05	1	0
PG121	MATEMATICA II	1	1	0	0	2	05	1	0
PG122	TOPOGRAFIA	1	1	0	0	2	05	1	0
PG123	QUIMICA II	1	1	0	0	2	05	1	0
PG124	GEOLOGIA GENERAL	1	1	0	0	2	05	1	0
PG125	DIMENSION UNIVERSAL DEL HOMBRE II	1	1	0	0	5	05	1	0
PG131	MATEMATICA III	1	1	0	0	2	05	1	0
PG132	TOPOGRAFIA APLICADA	1	1	0	0	2	05	1	0
PG133	MINERALOGIA	1	1	0	0	2	05	1	0
PG134	GEOQUIMICA	1	1	0	0	2	05	1	0
PG135	ANALISIS CRITICO DE LA REALIDAD VENEZOLANA	1	1	0	0	5	05	1	0
PGT11	MATEMATICA	1	1	0	0	2	05	1	0
PGT12	TOPOGRAFIA	1	1	0	0	2	05	1	0
PGT14	GEOLOGIA GENERAL	1	1	0	0	2	05	1	0
PGT15	DIMENSION HUMANA	1	1	0	0	5	05	1	0
PGT16	ACREDITABLE I	1	1	0	0	1	05	1	0
PGT17	PROYECTO I	1	1	0	0	3	05	1	0
PI1108	OFIMÁTICA	1	1	0	0	1	03	1	0
PIFC1	FORMACIÓN CRÍTICA I	1	1	0	0	5	03	1	0
PLTUT1-722	PLANIFICACIÓN TURÍSTICA	1	1	0	0	2	06	1	0
PRO570119	IDENTIFICAR Y CONOCER LOS PROCESOS ADMINISTRATIVOS EN DISTIN	1	1	0	0	3	04	1	0
PRO700124	ANÁL Y EJEC DE LOS PROCESOS ADM EN LAS DISTINTAS ORGANIZ.	1	1	0	0	3	04	1	0
PRO750125	ANÁLISIS Y EJECUCIÓN DE LOS PROCESOS COMPATIBLES APLICADOS	1	1	0	0	3	07	1	0
PROYSOCI-145	PROYECTO SOCIOINTEGRADOR I	1	1	0	0	3	08	1	0
PSICOLOG-134	PSICOLOGIA	1	1	0	0	2	08	1	0
PTE3011	TECNICAS DE EXPRESIÓN ORAL Y ESCRITA	1	1	0	0	2	04	1	0
PTI6012	TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACION I	1	1	0	0	2	04	1	0
SEM15015	ORÍGEN Y EVOLUCIÓN DEL SISTEMA SOCIOECONÓMICO MUNDIAL	1	1	0	0	5	07	1	0
SPC001	SISTEMAS Y PROCEDIMIENTOS CONTABLES	1	1	0	0	2	07	1	0
TETUT1-602	TEORÍA DEL TURISMO	1	1	0	0	2	06	1	0
TPM6012	TEORÍA Y PRÁCTICA DEL MERCADEO	1	1	0	0	2	04	1	0
TPM9013	TEORÍA Y PRÁCTICA DEL MERCADEO	1	1	0	0	2	04	1	0
TPTUT1-722	TECNICAS DE PROMOCION TURISTICA	1	1	0	0	2	06	1	0
AGPFII2126	PROYECTO FORMATIVO II	2	1	0	0	3	01	1	0
AGPFII2166	PROYECTO FORMATIVO II	2	1	0	0	3	01	1	0
PG212	GEOLOGÍA ESTRUCTURAL Y GEOTECTÓNICA	2	1	0	0	2	05	1	0
PG213	FÍSICA	2	1	0	0	2	05	1	0
PG214	MÉTODOS DE PERFORACIÓN	2	1	0	0	2	05	1	0
PCC216309	MECANICA DE LOS FLUIDOS	2	1	3	2	2	02	1	0
PG215	SOBERANIA POLÍTICA E INDEPENDENCIA ECONÓMICA I	2	1	0	0	5	05	1	0
PG216	PROYECTO II	2	1	0	0	3	05	1	0
PG217	T.I.C.	2	1	0	0	1	05	1	0
PGT22	CARTOGRAFIA GEOLOGICA	2	1	0	0	2	05	1	0
PGT24	MINERIA I	2	1	0	0	2	05	1	0
PGT25	ESTRATIGRAFIA	2	1	0	0	2	05	1	0
PGT26	ELECTIVA I	2	1	0	0	2	05	1	0
PGT27	PROYECTO II	2	1	0	0	3	05	1	0
PRO7502253	SISTEMA BANCARIO VENEZOLANO	2	1	0	0	2	07	1	0
PRO7502254	ORGANIZACION Y METODOS	2	1	0	0	2	07	1	0
PRO7502255	HERRAMIENTAS TECNOLOGICAS I	2	1	0	0	2	07	1	0
PRO7502256	TENDENCIAS CONTEMPORANEAS DE LA CONTABILIDAD	2	1	0	0	2	07	1	0
PROTT2-722	PROCESOS Y OPERACIONES TURISTICAS	2	1	0	0	2	06	1	0
PROYSOCI-234	PROYECTO SOCIOINTEGRADOR II	2	1	0	0	3	08	1	0
PTI6022	TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN II	2	1	0	0	2	04	1	0
RECUPSFO-245	RECURSOS PSICOTERAPEUTICOS EN FONOAUDIOLOGIA	2	1	0	0	2	08	1	0
SEV15025	SISTEMA ECONOMICO Y MODELOS DE DESARROLLO VENEZOLANO	2	1	0	0	5	07	1	0
SHA9023	SEMINARIO HABILIDADES DIRECTIVAS I	2	1	0	0	2	04	1	0
AGMEIE342	MANEJO ECOLÓGICO DE INSECTOS Y ENFERMEDADES	3	1	0	0	2	01	1	0
AGMSA342	MANEJO SANITARIO ANIMAL	3	1	0	0	2	01	1	0
AGOTA362	OPERACIONES BÁSICAS EN LA TRANSFORMACIÓN DE ALIMENTOS	3	1	0	0	2	01	1	0
PGT35	AMBIENTE	3	1	0	0	2	05	1	0
PGT36	ACREDITABLE II	3	1	0	0	1	05	1	0
PGT37	PROYECTO III	3	1	0	0	3	05	1	0
PCC434310	OBRAS DE SISTEMAS DE TRANSITO	4	1	0	0	2	02	1	0
PCC435109	ELECTIVA II	4	1	0	0	1	02	1	0
PCC436309	OBRAS HIDRAULICAS	4	1	0	0	2	02	1	0
PCC437109	ELECTIVA III	4	1	0	0	1	02	1	0
PCG6042	CONTROL DE GESTION ADMINISTRATIVA	4	1	0	0	2	04	1	0
PITIP02	TALLER DE INTRODUCIóN A LA UNIVERSIDAD Y AL PROGRAMA	0	1	0	0	5	03	1	0
00000000001	ALFABETIZACIóN TECNOLóGICA	0	1	2	3	2	03	1	1
PIPT2	PROYECTO SOCIO TECNOLÓGICO II	2	1	3	3	3	03	1	0
PIPT2	PROYECTO SOCIO TECNOLÓGICO II	2	2	3	3	3	03	1	0
PIPT2	PROYECTO SOCIO TECNOLÓGICO II	2	3	3	3	3	03	1	0
PISI4	SEGURIDAD INFORMÁTICA	4	2	2	3	2	03	1	0
PIFC4	FORMACIÓN CRÍTICA IV	4	1	2	0	5	03	1	0
PIFC4	FORMACIÓN CRÍTICA IV	4	2	2	0	5	03	1	0
PIFC4	FORMACIÓN CRÍTICA IV	4	3	2	0	5	03	1	0
PIMA3	MATEMÁTICA APLICADA	3	1	2	3	2	03	1	0
PIMA3	MATEMÁTICA APLICADA	3	2	2	3	2	03	1	0
PIAB4	ADMINISTRACIÓN DE BASE DE DATOS	4	1	2	3	2	03	1	0
PIAI4	AUDITORÍA INFORMÁTICA	4	3	2	3	2	03	1	0
PIMB3	MODELADO DE BASE DE DATOS	3	2	2	3	2	03	1	0
PIBD2	BASE DE DATOS	2	2	2	3	2	03	1	0
aapoo	ACTIVIDAD ACREDITABLE PROGRAMACIÓN ORIENTADA A OBJETOS	3	1	0	3	1	03	1	1
PIPP2	PROGRAMACIÓN II	2	1	2	4	2	03	1	1
PIPP2	PROGRAMACIÓN II	2	2	2	4	2	03	1	1
PIPP2	PROGRAMACIÓN II	2	3	2	4	2	03	1	1
EFSI	ELECTIVA FUNDAMENTOS DE SISTEMAS DE INFORMACIÓN	1	2	2	3	2	03	1	0
adAW	ELECTIVA DESARROLLO DE APLICACIONES EN LA WEB	4	3	2	3	2	03	1	0
PIPT1	PROYECTO SOCIOTECNOLÓGICO I	1	1	3	3	3	03	1	0
PIPT1	PROYECTO SOCIOTECNOLÓGICO I	1	2	3	3	3	03	1	0
PIPT1	PROYECTO SOCIOTECNOLÓGICO I	1	3	3	3	3	03	1	0
PIAP1	ALGORÍTMICA Y PROGRAMACIÓN  I	1	1	2	4	2	03	1	0
PIAP1	ALGORÍTMICA Y PROGRAMACIÓN  I	1	2	2	4	2	03	1	0
PIAP1	ALGORÍTMICA Y PROGRAMACIÓN  I	1	3	2	4	2	03	1	0
PIPT3	PROYECTO SOCIOTECNOLÓGICO III	3	1	3	3	3	03	1	0
PIPT3	PROYECTO SOCIOTECNOLÓGICO III	3	2	3	3	3	03	1	0
PIPT3	PROYECTO SOCIOTECNOLÓGICO III	3	3	3	3	3	03	1	0
PIPT4	PROYECTO SOCIOTECNOLÓGICO IV	4	1	3	3	3	03	1	0
PIPT4	PROYECTO SOCIOTECNOLÓGICO IV	4	2	3	3	3	03	1	0
PIPT4	PROYECTO SOCIOTECNOLÓGICO IV	4	3	3	3	3	03	1	0
PIMT1	MATEMÁTICA I	1	1	2	3	2	03	1	0
PIMT1	MATEMÁTICA I	1	2	2	3	2	03	1	0
PIMT1	MATEMÁTICA I	1	3	2	3	2	03	1	0
PIIS3	INGENIERÍA DEL SOFTWARE II	3	1	2	3	2	03	1	0
PIIS3	INGENIERÍA DEL SOFTWARE II	3	2	2	3	2	03	1	0
PIIS3	INGENIERÍA DEL SOFTWARE II	3	3	2	3	2	03	1	0
PIID1	IDIOMAS	1	1	2	0	2	03	1	0
PIID1	IDIOMAS	1	2	2	0	2	03	1	0
PIID1	IDIOMAS	1	3	2	0	2	03	1	0
PIID4	IDIOMAS	4	1	2	0	2	03	1	0
PIID4	IDIOMAS	4	2	2	0	2	03	1	0
PIID4	IDIOMAS	4	3	2	0	2	03	1	0
PIRC2	REDES DE COMPUTADORES	2	1	2	3	2	03	1	0
PIRC2	REDES DE COMPUTADORES	2	2	2	3	2	03	1	0
PIAC1	ARQUITECTURA DEL COMPUTADOR	1	1	2	3	2	03	1	1
PIAC1	ARQUITECTURA DEL COMPUTADOR	1	2	2	3	2	03	1	1
PIAC1	ARQUITECTURA DEL COMPUTADOR	1	3	2	3	2	03	1	1
PIMT2	MATEMÁTICA II	2	1	2	3	2	03	1	0
PIMT2	MATEMÁTICA II	2	2	2	3	2	03	1	0
PIFC2	FORMACIÓN CRITICA II	2	1	2	0	5	03	1	0
PIFC2	FORMACIÓN CRITICA II	2	2	2	0	5	03	1	0
PIFC2	FORMACIÓN CRITICA II	2	3	2	0	5	03	1	0
PIEL2	ELECTIVA II	2	3	0	0	2	03	1	0
PIIO3	INVESTIGACIÓN DE OPERACIONES	3	3	5	0	2	03	1	0
PISO3	SISTEMAS OPERATIVOS	3	1	2	3	2	03	1	0
PIFC3	FORMACIÓN CRITICA III	3	1	2	0	5	03	1	0
PIFC3	FORMACIÓN CRITICA III	3	2	2	0	5	03	1	0
PIFC3	FORMACIÓN CRITICA III	3	3	2	0	5	03	1	0
PIEL3	ELECTIVA III	3	3	0	0	2	03	1	0
pIS03	INGENIERÍA DEL SOFTWARE I	2	3	2	3	2	03	1	0
PIRA4	REDES AVANZADAS	4	2	2	3	2	03	1	1
PIPNP03	PROYECTO NACIONAL Y NUEVA CIUDADANIA	0	1	4	0	5	03	1	0
\.


--
-- Name: uc_cc_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('uc_cc_seq', 1, false);


--
-- Name: uc_e_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('uc_e_seq', 1, false);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: -
--

COPY usuario (ci, pw, r, n) FROM stdin;
12345678	1234	1234	2
4321	4321	eeee	1
87654321	1234	1234	2
\.


--
-- Name: carga_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY carga
    ADD CONSTRAINT carga_pkey PRIMARY KEY (cuc, ci, p, tr, cm);


--
-- Name: carrera_d_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY carrera
    ADD CONSTRAINT carrera_d_key UNIQUE (d);


--
-- Name: carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY carrera
    ADD CONSTRAINT carrera_pkey PRIMARY KEY (cc);


--
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (cat);


--
-- Name: condicion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY condicion
    ADD CONSTRAINT condicion_pkey PRIMARY KEY (c);


--
-- Name: coordinacion_ci_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coordinacion
    ADD CONSTRAINT coordinacion_ci_key UNIQUE (ci);


--
-- Name: coordinacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coordinacion
    ADD CONSTRAINT coordinacion_pkey PRIMARY KEY (ci, cc, s);


--
-- Name: dedicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dedicacion
    ADD CONSTRAINT dedicacion_pkey PRIMARY KEY (ded);


--
-- Name: departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY area
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (ca);


--
-- Name: dicta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY perfil
    ADD CONSTRAINT dicta_pkey PRIMARY KEY (cuc, ci);


--
-- Name: eje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eje
    ADD CONSTRAINT eje_pkey PRIMARY KEY (ce);


--
-- Name: historial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY historial
    ADD CONSTRAINT historial_pkey PRIMARY KEY (d, f);


--
-- Name: malla_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY malla
    ADD CONSTRAINT malla_pkey PRIMARY KEY (cm, cc);


--
-- Name: observacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY observacion
    ADD CONSTRAINT observacion_pkey PRIMARY KEY (p, ci);


--
-- Name: p_obtenida_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY estudios
    ADD CONSTRAINT p_obtenida_pkey PRIMARY KEY (cp, ci);


--
-- Name: periodo_ff_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT periodo_ff_key UNIQUE (ff);


--
-- Name: periodo_fi_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT periodo_fi_key UNIQUE (fi);


--
-- Name: pertenece_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pertenece
    ADD CONSTRAINT pertenece_pkey PRIMARY KEY (ci, cc);


--
-- Name: profesion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY profesion
    ADD CONSTRAINT profesion_pkey PRIMARY KEY (cp);


--
-- Name: profesor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY profesor
    ADD CONSTRAINT profesor_pkey PRIMARY KEY (ci);


--
-- Name: seccion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY seccion
    ADD CONSTRAINT seccion_pkey PRIMARY KEY (id);


--
-- Name: sede_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sede
    ADD CONSTRAINT sede_pkey PRIMARY KEY (s);


--
-- Name: uc_cuc_tr_cm_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uc
    ADD CONSTRAINT uc_cuc_tr_cm_key UNIQUE (cuc, tr, cm);


--
-- Name: uc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uc
    ADD CONSTRAINT uc_pkey PRIMARY KEY (cuc, tr, cc, cm);


--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (ci);


--
-- Name: carga_cuc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY carga
    ADD CONSTRAINT carga_cuc_fkey FOREIGN KEY (cuc, tr, cm) REFERENCES uc(cuc, tr, cm) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: carrera_cd_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY carrera
    ADD CONSTRAINT carrera_cd_fkey FOREIGN KEY (ca) REFERENCES area(ca) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: coordinacion_cc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coordinacion
    ADD CONSTRAINT coordinacion_cc_fkey FOREIGN KEY (cc) REFERENCES carrera(cc) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: coordinacion_ci_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coordinacion
    ADD CONSTRAINT coordinacion_ci_fkey FOREIGN KEY (ci) REFERENCES profesor(ci) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: coordinacion_s_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coordinacion
    ADD CONSTRAINT coordinacion_s_fkey FOREIGN KEY (s) REFERENCES sede(s) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dicta_ci_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY perfil
    ADD CONSTRAINT dicta_ci_fkey FOREIGN KEY (ci) REFERENCES profesor(ci) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: historial_ci_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY historial
    ADD CONSTRAINT historial_ci_fkey FOREIGN KEY (ci) REFERENCES usuario(ci) ON UPDATE CASCADE;


--
-- Name: malla_cc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY malla
    ADD CONSTRAINT malla_cc_fkey FOREIGN KEY (cc) REFERENCES carrera(cc) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: p_obtenida_ci_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY estudios
    ADD CONSTRAINT p_obtenida_ci_fkey FOREIGN KEY (ci) REFERENCES profesor(ci) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: p_obtenida_cp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY estudios
    ADD CONSTRAINT p_obtenida_cp_fkey FOREIGN KEY (cp) REFERENCES profesion(cp) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pertenece_cc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pertenece
    ADD CONSTRAINT pertenece_cc_fkey FOREIGN KEY (cc) REFERENCES carrera(cc) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pertenece_ci_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pertenece
    ADD CONSTRAINT pertenece_ci_fkey FOREIGN KEY (ci) REFERENCES profesor(ci) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: profesor_c_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY profesor
    ADD CONSTRAINT profesor_c_fkey FOREIGN KEY (c) REFERENCES condicion(c) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: profesor_cat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY profesor
    ADD CONSTRAINT profesor_cat_fkey FOREIGN KEY (cat) REFERENCES categoria(cat) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: profesor_ded_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY profesor
    ADD CONSTRAINT profesor_ded_fkey FOREIGN KEY (ded) REFERENCES dedicacion(ded) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: profesor_s_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY profesor
    ADD CONSTRAINT profesor_s_fkey FOREIGN KEY (s) REFERENCES sede(s) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: uc_cc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uc
    ADD CONSTRAINT uc_cc_fkey FOREIGN KEY (cc, cm) REFERENCES malla(cc, cm) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: uc_ce_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uc
    ADD CONSTRAINT uc_ce_fkey FOREIGN KEY (ce) REFERENCES eje(ce) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

