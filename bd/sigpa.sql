--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

create database "SIGPA" with template=template0 encoding='UTF-8';
\connect "SIGPA"

--
-- Name: area; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE area (
    ca character(2) NOT NULL,
    d character varying(50) NOT NULL
);


ALTER TABLE public.area OWNER TO "www-data";

--
-- Name: carga; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
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


ALTER TABLE public.carga OWNER TO "www-data";

--
-- Name: carrera; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE carrera (
    cc character varying(2) NOT NULL,
    d character varying(50) NOT NULL,
    ca character(2) NOT NULL
);


ALTER TABLE public.carrera OWNER TO "www-data";

--
-- Name: categoria; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE categoria (
    cat character(1) NOT NULL,
    abrv character varying(5) NOT NULL,
    d character varying(50) NOT NULL
);


ALTER TABLE public.categoria OWNER TO "www-data";

--
-- Name: condicion; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE condicion (
    c character(1) NOT NULL,
    d character varying(50) NOT NULL
);


ALTER TABLE public.condicion OWNER TO "www-data";

--
-- Name: coordinacion; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE coordinacion (
    ci character varying(8) NOT NULL,
    cc character varying(2) NOT NULL,
    s character varying(2) NOT NULL
);


ALTER TABLE public.coordinacion OWNER TO "www-data";

--
-- Name: dedicacion; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE dedicacion (
    ded character(1) NOT NULL,
    abrv character varying(5) NOT NULL,
    d character varying(50) NOT NULL,
    h smallint NOT NULL
);


ALTER TABLE public.dedicacion OWNER TO "www-data";

--
-- Name: eje; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE eje (
    ce character(1) NOT NULL,
    d character varying(15) NOT NULL
);


ALTER TABLE public.eje OWNER TO "www-data";

--
-- Name: estudios; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE estudios (
    cp character(3) NOT NULL,
    ci character varying(8) NOT NULL
);


ALTER TABLE public.estudios OWNER TO "www-data";

--
-- Name: historial; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE historial (
    ci character varying(8) NOT NULL,
    d character varying(200) NOT NULL,
    f timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.historial OWNER TO "www-data";

--
-- Name: malla; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE malla (
    cm smallint NOT NULL,
    e character(1) DEFAULT 1 NOT NULL,
    f date DEFAULT now() NOT NULL,
    cc character varying(2) NOT NULL
);


ALTER TABLE public.malla OWNER TO "www-data";

--
-- Name: observacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE observacion (
    p character varying(6) NOT NULL,
    ci character varying(8) NOT NULL,
    d character varying(500)
);


ALTER TABLE public.observacion OWNER TO postgres;

--
-- Name: perfil; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE perfil (
    cuc character varying(15) NOT NULL,
    ci character varying(8) NOT NULL
);


ALTER TABLE public.perfil OWNER TO "www-data";

--
-- Name: periodo; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE periodo (
    fi date NOT NULL,
    ff date NOT NULL,
    t character(1) NOT NULL
);


ALTER TABLE public.periodo OWNER TO "www-data";

--
-- Name: pertenece; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE pertenece (
    ci character varying(8) NOT NULL,
    cc character(2) NOT NULL
);


ALTER TABLE public.pertenece OWNER TO "www-data";

--
-- Name: profesion; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE profesion (
    cp character(3) NOT NULL,
    d character varying(80) NOT NULL
);


ALTER TABLE public.profesion OWNER TO "www-data";

--
-- Name: profesor; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
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


ALTER TABLE public.profesor OWNER TO "www-data";

--
-- Name: seccion; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE seccion (
    id character(1) NOT NULL
);


ALTER TABLE public.seccion OWNER TO "www-data";

--
-- Name: sede; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE sede (
    s character(2) NOT NULL,
    d character varying(50) NOT NULL,
    dir character varying(80) NOT NULL,
    t character varying(30) NOT NULL,
    f date NOT NULL
);


ALTER TABLE public.sede OWNER TO "www-data";

--
-- Name: uc; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
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


ALTER TABLE public.uc OWNER TO "www-data";

--
-- Name: uc_cc_seq; Type: SEQUENCE; Schema: public; Owner: www-data
--

CREATE SEQUENCE uc_cc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uc_cc_seq OWNER TO "www-data";

--
-- Name: uc_cc_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: www-data
--

ALTER SEQUENCE uc_cc_seq OWNED BY uc.cc;


--
-- Name: uc_e_seq; Type: SEQUENCE; Schema: public; Owner: www-data
--

CREATE SEQUENCE uc_e_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uc_e_seq OWNER TO "www-data";

--
-- Name: uc_e_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: www-data
--

ALTER SEQUENCE uc_e_seq OWNED BY uc.ce;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE usuario (
    ci character varying(8) NOT NULL,
    pw character varying(15) NOT NULL,
    r character varying(50) NOT NULL,
    n smallint NOT NULL
);


ALTER TABLE public.usuario OWNER TO "www-data";

--
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO area VALUES ('01', 'TECNOLOGIA');
INSERT INTO area VALUES ('02', 'CIENCIAS SOCIALES');
INSERT INTO area VALUES ('03', 'CIENCIAS AGRICOLAS Y AMBIENTALES');


--
-- Data for Name: carga; Type: TABLE DATA; Schema: public; Owner: www-data
--



--
-- Data for Name: carrera; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO carrera VALUES ('01', 'PNF AGROALIMENTACIÓN', '03');
INSERT INTO carrera VALUES ('02', 'PNF CONSTRUCCIÓN CIVIL', '01');
INSERT INTO carrera VALUES ('03', 'PNF INFORMATICA', '01');
INSERT INTO carrera VALUES ('04', 'PNF ADMINISTRACIÓN', '02');
INSERT INTO carrera VALUES ('05', 'PNF GEOCIENCIAS', '01');
INSERT INTO carrera VALUES ('06', 'PNF TURISMO', '02');
INSERT INTO carrera VALUES ('07', 'PNF CONTADURIA', '02');
INSERT INTO carrera VALUES ('08', 'PNF FONOAUDIOLOGIA', '02');
INSERT INTO carrera VALUES ('09', 'PNF CULTURA Y SEGURIDAD ALIMENTARIA', '03');


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO categoria VALUES ('2', 'inst', 'INSTRUCTOR');
INSERT INTO categoria VALUES ('0', 'no', 'SIN ASIGNAR');
INSERT INTO categoria VALUES ('1', 'asist', 'ASISTENTE');


--
-- Data for Name: condicion; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO condicion VALUES ('1', 'ORDINARIO');
INSERT INTO condicion VALUES ('2', 'JUBILADO');
INSERT INTO condicion VALUES ('3', 'CONTRATADO');
INSERT INTO condicion VALUES ('4', 'SUPLENTE');
INSERT INTO condicion VALUES ('0', 'SIN ASIGNAR');


--
-- Data for Name: coordinacion; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO coordinacion VALUES ('12345678', '03', '01');
INSERT INTO coordinacion VALUES ('87654321', '02', '01');


--
-- Data for Name: dedicacion; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO dedicacion VALUES ('0', 'no', 'SIN ASIGNAR', 0);
INSERT INTO dedicacion VALUES ('1', 'tc', 'TIEMPO COMPLETO', 16);


--
-- Data for Name: eje; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO eje VALUES ('1', 'ACREDITABLE');
INSERT INTO eje VALUES ('2', 'PROFESIONAL');
INSERT INTO eje VALUES ('3', 'PROYECTO');
INSERT INTO eje VALUES ('4', 'SOCIO AMBIENTAL');
INSERT INTO eje VALUES ('5', 'SOCIO-CRITICO');


--
-- Data for Name: estudios; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO estudios VALUES ('000', '00222222');
INSERT INTO estudios VALUES ('000', '12722185');
INSERT INTO estudios VALUES ('000', '00584711');
INSERT INTO estudios VALUES ('000', '03048184');
INSERT INTO estudios VALUES ('000', '03574698');
INSERT INTO estudios VALUES ('000', '04468275');
INSERT INTO estudios VALUES ('000', '04768948');
INSERT INTO estudios VALUES ('000', '07080727');
INSERT INTO estudios VALUES ('000', '07168412');
INSERT INTO estudios VALUES ('000', '08013569');
INSERT INTO estudios VALUES ('000', '08039294');
INSERT INTO estudios VALUES ('000', '08039463');
INSERT INTO estudios VALUES ('000', '09198636');
INSERT INTO estudios VALUES ('000', '10102259');
INSERT INTO estudios VALUES ('000', '10102454');
INSERT INTO estudios VALUES ('000', '11463296');
INSERT INTO estudios VALUES ('000', '13098763');
INSERT INTO estudios VALUES ('000', '15296169');
INSERT INTO estudios VALUES ('000', '07357589');
INSERT INTO estudios VALUES ('000', '10718224');
INSERT INTO estudios VALUES ('000', '02149217');
INSERT INTO estudios VALUES ('000', '02287821');
INSERT INTO estudios VALUES ('000', '00678538');
INSERT INTO estudios VALUES ('000', '00976855');
INSERT INTO estudios VALUES ('000', '01111111');
INSERT INTO estudios VALUES ('000', '01146089');
INSERT INTO estudios VALUES ('000', '01656140');
INSERT INTO estudios VALUES ('000', '01687450');
INSERT INTO estudios VALUES ('000', '02286020');
INSERT INTO estudios VALUES ('000', '02362548');
INSERT INTO estudios VALUES ('000', '02455516');
INSERT INTO estudios VALUES ('000', '02457912');
INSERT INTO estudios VALUES ('000', '02617975');
INSERT INTO estudios VALUES ('000', '02737443');
INSERT INTO estudios VALUES ('000', '02814719');
INSERT INTO estudios VALUES ('000', '02838121');
INSERT INTO estudios VALUES ('000', '02850226');
INSERT INTO estudios VALUES ('000', '02890587');
INSERT INTO estudios VALUES ('000', '02957596');
INSERT INTO estudios VALUES ('000', '03006127');
INSERT INTO estudios VALUES ('000', '03032135');
INSERT INTO estudios VALUES ('000', '03038774');
INSERT INTO estudios VALUES ('000', '03062497');
INSERT INTO estudios VALUES ('000', '03082706');
INSERT INTO estudios VALUES ('000', '03293648');
INSERT INTO estudios VALUES ('000', '03309773');
INSERT INTO estudios VALUES ('000', '03370453');
INSERT INTO estudios VALUES ('000', '03385972');
INSERT INTO estudios VALUES ('000', '03428254');
INSERT INTO estudios VALUES ('000', '03442051');
INSERT INTO estudios VALUES ('000', '03469416');
INSERT INTO estudios VALUES ('000', '03474020');
INSERT INTO estudios VALUES ('000', '03479772');
INSERT INTO estudios VALUES ('000', '03496268');
INSERT INTO estudios VALUES ('000', '03498015');
INSERT INTO estudios VALUES ('000', '03498205');
INSERT INTO estudios VALUES ('000', '03499333');
INSERT INTO estudios VALUES ('000', '03522090');
INSERT INTO estudios VALUES ('000', '03549662');
INSERT INTO estudios VALUES ('000', '03554216');
INSERT INTO estudios VALUES ('000', '03586551');
INSERT INTO estudios VALUES ('000', '03635921');
INSERT INTO estudios VALUES ('000', '03726896');
INSERT INTO estudios VALUES ('000', '03752100');
INSERT INTO estudios VALUES ('000', '03766382');
INSERT INTO estudios VALUES ('000', '03767094');
INSERT INTO estudios VALUES ('000', '03813571');
INSERT INTO estudios VALUES ('000', '03814444');
INSERT INTO estudios VALUES ('000', '03824022');
INSERT INTO estudios VALUES ('000', '03853571');
INSERT INTO estudios VALUES ('000', '03939324');
INSERT INTO estudios VALUES ('000', '03939832');
INSERT INTO estudios VALUES ('000', '03991661');
INSERT INTO estudios VALUES ('000', '03992823');
INSERT INTO estudios VALUES ('000', '03995466');
INSERT INTO estudios VALUES ('000', '03995911');
INSERT INTO estudios VALUES ('000', '04041213');
INSERT INTO estudios VALUES ('000', '04059960');
INSERT INTO estudios VALUES ('000', '04063136');
INSERT INTO estudios VALUES ('000', '04092339');
INSERT INTO estudios VALUES ('000', '04143374');
INSERT INTO estudios VALUES ('000', '04145751');
INSERT INTO estudios VALUES ('000', '04163685');
INSERT INTO estudios VALUES ('000', '04173394');
INSERT INTO estudios VALUES ('000', '04203537');
INSERT INTO estudios VALUES ('000', '04206639');
INSERT INTO estudios VALUES ('000', '04246098');
INSERT INTO estudios VALUES ('000', '04271043');
INSERT INTO estudios VALUES ('000', '04323352');
INSERT INTO estudios VALUES ('000', '04324337');
INSERT INTO estudios VALUES ('000', '04334862');
INSERT INTO estudios VALUES ('000', '03485766');
INSERT INTO estudios VALUES ('000', '03661985');
INSERT INTO estudios VALUES ('000', '03692342');
INSERT INTO estudios VALUES ('000', '03727339');
INSERT INTO estudios VALUES ('000', '03767311');
INSERT INTO estudios VALUES ('000', '03830917');
INSERT INTO estudios VALUES ('000', '03791326');
INSERT INTO estudios VALUES ('000', '03907664');
INSERT INTO estudios VALUES ('000', '03910823');
INSERT INTO estudios VALUES ('000', '03939687');
INSERT INTO estudios VALUES ('000', '03941942');
INSERT INTO estudios VALUES ('000', '03966127');
INSERT INTO estudios VALUES ('000', '03990590');
INSERT INTO estudios VALUES ('000', '03992405');
INSERT INTO estudios VALUES ('000', '04054457');
INSERT INTO estudios VALUES ('000', '04194292');
INSERT INTO estudios VALUES ('000', '04319574');
INSERT INTO estudios VALUES ('000', '04323036');
INSERT INTO estudios VALUES ('000', '04327492');
INSERT INTO estudios VALUES ('000', '04353143');
INSERT INTO estudios VALUES ('000', '04330086');
INSERT INTO estudios VALUES ('000', '04356042');
INSERT INTO estudios VALUES ('000', '04397227');
INSERT INTO estudios VALUES ('000', '04491963');
INSERT INTO estudios VALUES ('000', '04530705');
INSERT INTO estudios VALUES ('000', '04703287');
INSERT INTO estudios VALUES ('000', '04768469');
INSERT INTO estudios VALUES ('000', '04946336');
INSERT INTO estudios VALUES ('000', '04977183');
INSERT INTO estudios VALUES ('000', '05024784');
INSERT INTO estudios VALUES ('000', '05032481');
INSERT INTO estudios VALUES ('000', '05054721');
INSERT INTO estudios VALUES ('000', '05116030');
INSERT INTO estudios VALUES ('000', '05131347');
INSERT INTO estudios VALUES ('000', '05199025');
INSERT INTO estudios VALUES ('000', '05200953');
INSERT INTO estudios VALUES ('000', '05202671');
INSERT INTO estudios VALUES ('000', '05203329');
INSERT INTO estudios VALUES ('000', '05206583');
INSERT INTO estudios VALUES ('000', '05206598');
INSERT INTO estudios VALUES ('000', '05206999');
INSERT INTO estudios VALUES ('000', '05307768');
INSERT INTO estudios VALUES ('000', '05351609');
INSERT INTO estudios VALUES ('000', '05435898');
INSERT INTO estudios VALUES ('000', '05439749');
INSERT INTO estudios VALUES ('000', '05446019');
INSERT INTO estudios VALUES ('000', '05446471');
INSERT INTO estudios VALUES ('000', '05446661');
INSERT INTO estudios VALUES ('000', '05485302');
INSERT INTO estudios VALUES ('000', '05509322');
INSERT INTO estudios VALUES ('000', '05654710');
INSERT INTO estudios VALUES ('000', '05654904');
INSERT INTO estudios VALUES ('000', '05655737');
INSERT INTO estudios VALUES ('000', '05728108');
INSERT INTO estudios VALUES ('000', '05892364');
INSERT INTO estudios VALUES ('000', '05945180');
INSERT INTO estudios VALUES ('000', '06018398');
INSERT INTO estudios VALUES ('000', '06308181');
INSERT INTO estudios VALUES ('000', '06426190');
INSERT INTO estudios VALUES ('000', '06908190');
INSERT INTO estudios VALUES ('000', '04472778');
INSERT INTO estudios VALUES ('000', '04484976');
INSERT INTO estudios VALUES ('000', '04488065');
INSERT INTO estudios VALUES ('000', '04488256');
INSERT INTO estudios VALUES ('000', '04488420');
INSERT INTO estudios VALUES ('000', '04489957');
INSERT INTO estudios VALUES ('000', '04490481');
INSERT INTO estudios VALUES ('000', '04491607');
INSERT INTO estudios VALUES ('000', '04491973');
INSERT INTO estudios VALUES ('000', '04492233');
INSERT INTO estudios VALUES ('000', '04492356');
INSERT INTO estudios VALUES ('000', '04583431');
INSERT INTO estudios VALUES ('000', '04633259');
INSERT INTO estudios VALUES ('000', '04589713');
INSERT INTO estudios VALUES ('000', '04769890');
INSERT INTO estudios VALUES ('000', '04953940');
INSERT INTO estudios VALUES ('000', '05124273');
INSERT INTO estudios VALUES ('000', '05021210');
INSERT INTO estudios VALUES ('000', '05201622');
INSERT INTO estudios VALUES ('000', '05201033');
INSERT INTO estudios VALUES ('000', '05203245');
INSERT INTO estudios VALUES ('000', '05206267');
INSERT INTO estudios VALUES ('000', '05206319');
INSERT INTO estudios VALUES ('000', '05206372');
INSERT INTO estudios VALUES ('000', '05239250');
INSERT INTO estudios VALUES ('000', '05355610');
INSERT INTO estudios VALUES ('000', '05447146');
INSERT INTO estudios VALUES ('000', '05466076');
INSERT INTO estudios VALUES ('000', '05507269');
INSERT INTO estudios VALUES ('000', '05559793');
INSERT INTO estudios VALUES ('000', '05561396');
INSERT INTO estudios VALUES ('000', '05660032');
INSERT INTO estudios VALUES ('000', '05740339');
INSERT INTO estudios VALUES ('000', '05753564');
INSERT INTO estudios VALUES ('000', '05794416');
INSERT INTO estudios VALUES ('000', '05863317');
INSERT INTO estudios VALUES ('000', '06167653');
INSERT INTO estudios VALUES ('000', '05952723');
INSERT INTO estudios VALUES ('000', '06547603');
INSERT INTO estudios VALUES ('000', '06558454');
INSERT INTO estudios VALUES ('000', '06940439');
INSERT INTO estudios VALUES ('000', '06953950');
INSERT INTO estudios VALUES ('000', '07199187');
INSERT INTO estudios VALUES ('000', '07218768');
INSERT INTO estudios VALUES ('000', '07545873');
INSERT INTO estudios VALUES ('000', '07725635');
INSERT INTO estudios VALUES ('000', '07772181');
INSERT INTO estudios VALUES ('000', '08000405');
INSERT INTO estudios VALUES ('000', '08001969');
INSERT INTO estudios VALUES ('000', '08004481');
INSERT INTO estudios VALUES ('000', '08005373');
INSERT INTO estudios VALUES ('000', '08006286');
INSERT INTO estudios VALUES ('000', '08008780');
INSERT INTO estudios VALUES ('000', '08011218');
INSERT INTO estudios VALUES ('000', '08011554');
INSERT INTO estudios VALUES ('000', '08021739');
INSERT INTO estudios VALUES ('000', '08022263');
INSERT INTO estudios VALUES ('000', '08023900');
INSERT INTO estudios VALUES ('000', '08025259');
INSERT INTO estudios VALUES ('000', '08025261');
INSERT INTO estudios VALUES ('000', '08025941');
INSERT INTO estudios VALUES ('000', '08029052');
INSERT INTO estudios VALUES ('000', '08029795');
INSERT INTO estudios VALUES ('000', '08031306');
INSERT INTO estudios VALUES ('000', '08031593');
INSERT INTO estudios VALUES ('000', '08031757');
INSERT INTO estudios VALUES ('000', '08031821');
INSERT INTO estudios VALUES ('000', '08034214');
INSERT INTO estudios VALUES ('000', '07383992');
INSERT INTO estudios VALUES ('000', '07326064');
INSERT INTO estudios VALUES ('000', '07525829');
INSERT INTO estudios VALUES ('000', '07648734');
INSERT INTO estudios VALUES ('000', '07775026');
INSERT INTO estudios VALUES ('000', '07824945');
INSERT INTO estudios VALUES ('000', '07832738');
INSERT INTO estudios VALUES ('000', '07934845');
INSERT INTO estudios VALUES ('000', '07940076');
INSERT INTO estudios VALUES ('000', '08000617');
INSERT INTO estudios VALUES ('000', '08002183');
INSERT INTO estudios VALUES ('000', '08002316');
INSERT INTO estudios VALUES ('000', '08002737');
INSERT INTO estudios VALUES ('000', '08004161');
INSERT INTO estudios VALUES ('000', '08005159');
INSERT INTO estudios VALUES ('000', '08006388');
INSERT INTO estudios VALUES ('000', '08006639');
INSERT INTO estudios VALUES ('000', '08012641');
INSERT INTO estudios VALUES ('000', '08019784');
INSERT INTO estudios VALUES ('000', '08013671');
INSERT INTO estudios VALUES ('000', '08020438');
INSERT INTO estudios VALUES ('000', '08020758');
INSERT INTO estudios VALUES ('000', '08021306');
INSERT INTO estudios VALUES ('000', '08021736');
INSERT INTO estudios VALUES ('000', '08021842');
INSERT INTO estudios VALUES ('000', '08022671');
INSERT INTO estudios VALUES ('000', '08022340');
INSERT INTO estudios VALUES ('000', '08024531');
INSERT INTO estudios VALUES ('000', '08025750');
INSERT INTO estudios VALUES ('000', '08026122');
INSERT INTO estudios VALUES ('000', '08026155');
INSERT INTO estudios VALUES ('000', '08027408');
INSERT INTO estudios VALUES ('000', '08027793');
INSERT INTO estudios VALUES ('000', '08028204');
INSERT INTO estudios VALUES ('000', '08029045');
INSERT INTO estudios VALUES ('000', '08029075');
INSERT INTO estudios VALUES ('000', '08029696');
INSERT INTO estudios VALUES ('000', '08031064');
INSERT INTO estudios VALUES ('000', '08032732');
INSERT INTO estudios VALUES ('000', '08034029');
INSERT INTO estudios VALUES ('000', '08034300');
INSERT INTO estudios VALUES ('000', '08034371');
INSERT INTO estudios VALUES ('000', '08035484');
INSERT INTO estudios VALUES ('000', '08037619');
INSERT INTO estudios VALUES ('000', '08038332');
INSERT INTO estudios VALUES ('000', '08038611');
INSERT INTO estudios VALUES ('000', '10102108');
INSERT INTO estudios VALUES ('000', '08039160');
INSERT INTO estudios VALUES ('000', '08040671');
INSERT INTO estudios VALUES ('000', '08041985');
INSERT INTO estudios VALUES ('000', '08045140');
INSERT INTO estudios VALUES ('000', '08081463');
INSERT INTO estudios VALUES ('000', '08081684');
INSERT INTO estudios VALUES ('000', '08458508');
INSERT INTO estudios VALUES ('000', '09170633');
INSERT INTO estudios VALUES ('000', '09222772');
INSERT INTO estudios VALUES ('000', '09279327');
INSERT INTO estudios VALUES ('000', '09372327');
INSERT INTO estudios VALUES ('000', '09398123');
INSERT INTO estudios VALUES ('000', '09470586');
INSERT INTO estudios VALUES ('000', '09471742');
INSERT INTO estudios VALUES ('000', '09472935');
INSERT INTO estudios VALUES ('000', '09473824');
INSERT INTO estudios VALUES ('000', '09474583');
INSERT INTO estudios VALUES ('000', '09476548');
INSERT INTO estudios VALUES ('000', '09476680');
INSERT INTO estudios VALUES ('000', '09496713');
INSERT INTO estudios VALUES ('000', '08039498');
INSERT INTO estudios VALUES ('000', '08040787');
INSERT INTO estudios VALUES ('000', '08041510');
INSERT INTO estudios VALUES ('000', '08041620');
INSERT INTO estudios VALUES ('000', '08042559');
INSERT INTO estudios VALUES ('000', '08044768');
INSERT INTO estudios VALUES ('000', '08044725');
INSERT INTO estudios VALUES ('000', '08045258');
INSERT INTO estudios VALUES ('000', '08045307');
INSERT INTO estudios VALUES ('000', '08045536');
INSERT INTO estudios VALUES ('000', '08046408');
INSERT INTO estudios VALUES ('000', '08046659');
INSERT INTO estudios VALUES ('000', '08048794');
INSERT INTO estudios VALUES ('000', '08079222');
INSERT INTO estudios VALUES ('000', '08080375');
INSERT INTO estudios VALUES ('000', '08080676');
INSERT INTO estudios VALUES ('000', '08084432');
INSERT INTO estudios VALUES ('000', '08087415');
INSERT INTO estudios VALUES ('000', '08141857');
INSERT INTO estudios VALUES ('000', '08331149');
INSERT INTO estudios VALUES ('000', '08336414');
INSERT INTO estudios VALUES ('000', '08656400');
INSERT INTO estudios VALUES ('000', '08683060');
INSERT INTO estudios VALUES ('000', '08720054');
INSERT INTO estudios VALUES ('000', '08958864');
INSERT INTO estudios VALUES ('000', '09027962');
INSERT INTO estudios VALUES ('000', '09028433');
INSERT INTO estudios VALUES ('000', '09201868');
INSERT INTO estudios VALUES ('000', '09081546');
INSERT INTO estudios VALUES ('000', '09234597');
INSERT INTO estudios VALUES ('000', '09346062');
INSERT INTO estudios VALUES ('000', '09389944');
INSERT INTO estudios VALUES ('000', '09472514');
INSERT INTO estudios VALUES ('000', '09473151');
INSERT INTO estudios VALUES ('000', '09473374');
INSERT INTO estudios VALUES ('000', '09473423');
INSERT INTO estudios VALUES ('000', '09473567');
INSERT INTO estudios VALUES ('000', '09473852');
INSERT INTO estudios VALUES ('000', '09474147');
INSERT INTO estudios VALUES ('000', '09475173');
INSERT INTO estudios VALUES ('000', '09476031');
INSERT INTO estudios VALUES ('000', '09476268');
INSERT INTO estudios VALUES ('000', '09478674');
INSERT INTO estudios VALUES ('000', '09499979');
INSERT INTO estudios VALUES ('000', '09501330');
INSERT INTO estudios VALUES ('000', '09678973');
INSERT INTO estudios VALUES ('000', '09906067');
INSERT INTO estudios VALUES ('000', '09906615');
INSERT INTO estudios VALUES ('000', '10087275');
INSERT INTO estudios VALUES ('000', '10092487');
INSERT INTO estudios VALUES ('000', '10100205');
INSERT INTO estudios VALUES ('000', '10102820');
INSERT INTO estudios VALUES ('000', '10108462');
INSERT INTO estudios VALUES ('000', '10712338');
INSERT INTO estudios VALUES ('000', '10719923');
INSERT INTO estudios VALUES ('000', '10795287');
INSERT INTO estudios VALUES ('000', '10896107');
INSERT INTO estudios VALUES ('000', '10940629');
INSERT INTO estudios VALUES ('000', '11174533');
INSERT INTO estudios VALUES ('000', '11496709');
INSERT INTO estudios VALUES ('000', '11959818');
INSERT INTO estudios VALUES ('000', '11959905');
INSERT INTO estudios VALUES ('000', '12797606');
INSERT INTO estudios VALUES ('000', '12799845');
INSERT INTO estudios VALUES ('000', '13014423');
INSERT INTO estudios VALUES ('000', '13017695');
INSERT INTO estudios VALUES ('000', '10104966');
INSERT INTO estudios VALUES ('000', '10108950');
INSERT INTO estudios VALUES ('000', '10109087');
INSERT INTO estudios VALUES ('000', '10178133');
INSERT INTO estudios VALUES ('000', '10256095');
INSERT INTO estudios VALUES ('000', '10314511');
INSERT INTO estudios VALUES ('000', '10712408');
INSERT INTO estudios VALUES ('000', '10713529');
INSERT INTO estudios VALUES ('000', '10714070');
INSERT INTO estudios VALUES ('000', '10715146');
INSERT INTO estudios VALUES ('000', '10715404');
INSERT INTO estudios VALUES ('000', '10718393');
INSERT INTO estudios VALUES ('000', '10718091');
INSERT INTO estudios VALUES ('000', '10720364');
INSERT INTO estudios VALUES ('000', '10797122');
INSERT INTO estudios VALUES ('000', '10898072');
INSERT INTO estudios VALUES ('000', '11067484');
INSERT INTO estudios VALUES ('000', '11108398');
INSERT INTO estudios VALUES ('000', '11215098');
INSERT INTO estudios VALUES ('000', '11303172');
INSERT INTO estudios VALUES ('000', '11319364');
INSERT INTO estudios VALUES ('000', '11460000');
INSERT INTO estudios VALUES ('000', '11460813');
INSERT INTO estudios VALUES ('000', '11462979');
INSERT INTO estudios VALUES ('000', '11465653');
INSERT INTO estudios VALUES ('000', '11466224');
INSERT INTO estudios VALUES ('000', '11467397');
INSERT INTO estudios VALUES ('000', '11467713');
INSERT INTO estudios VALUES ('000', '11468201');
INSERT INTO estudios VALUES ('000', '11705856');
INSERT INTO estudios VALUES ('000', '11783461');
INSERT INTO estudios VALUES ('000', '11912316');
INSERT INTO estudios VALUES ('000', '11952770');
INSERT INTO estudios VALUES ('000', '11954144');
INSERT INTO estudios VALUES ('000', '11956576');
INSERT INTO estudios VALUES ('000', '11959505');
INSERT INTO estudios VALUES ('000', '11960173');
INSERT INTO estudios VALUES ('000', '12048353');
INSERT INTO estudios VALUES ('000', '12329797');
INSERT INTO estudios VALUES ('000', '12346208');
INSERT INTO estudios VALUES ('000', '12352023');
INSERT INTO estudios VALUES ('000', '12353031');
INSERT INTO estudios VALUES ('000', '12353451');
INSERT INTO estudios VALUES ('000', '12458260');
INSERT INTO estudios VALUES ('000', '12776731');
INSERT INTO estudios VALUES ('000', '12779069');
INSERT INTO estudios VALUES ('000', '12779975');
INSERT INTO estudios VALUES ('000', '12817844');
INSERT INTO estudios VALUES ('000', '12839616');
INSERT INTO estudios VALUES ('000', '13013152');
INSERT INTO estudios VALUES ('000', '13014569');
INSERT INTO estudios VALUES ('000', '13014707');
INSERT INTO estudios VALUES ('000', '13098188');
INSERT INTO estudios VALUES ('000', '13098422');
INSERT INTO estudios VALUES ('000', '13099230');
INSERT INTO estudios VALUES ('000', '13803898');
INSERT INTO estudios VALUES ('000', '15234461');
INSERT INTO estudios VALUES ('000', '15913325');
INSERT INTO estudios VALUES ('000', '16445105');
INSERT INTO estudios VALUES ('000', '16657360');
INSERT INTO estudios VALUES ('000', '16680396');
INSERT INTO estudios VALUES ('000', '13098948');
INSERT INTO estudios VALUES ('000', '13099384');
INSERT INTO estudios VALUES ('000', '13477378');
INSERT INTO estudios VALUES ('000', '13524109');
INSERT INTO estudios VALUES ('000', '13524820');
INSERT INTO estudios VALUES ('000', '13525905');
INSERT INTO estudios VALUES ('000', '13649962');
INSERT INTO estudios VALUES ('000', '13723698');
INSERT INTO estudios VALUES ('000', '13803490');
INSERT INTO estudios VALUES ('000', '13947142');
INSERT INTO estudios VALUES ('000', '13966054');
INSERT INTO estudios VALUES ('000', '13966605');
INSERT INTO estudios VALUES ('000', '13967486');
INSERT INTO estudios VALUES ('000', '14249554');
INSERT INTO estudios VALUES ('000', '14131053');
INSERT INTO estudios VALUES ('000', '14267080');
INSERT INTO estudios VALUES ('000', '14267842');
INSERT INTO estudios VALUES ('000', '14268612');
INSERT INTO estudios VALUES ('000', '14400087');
INSERT INTO estudios VALUES ('000', '14340058');
INSERT INTO estudios VALUES ('000', '14401340');
INSERT INTO estudios VALUES ('000', '14589222');
INSERT INTO estudios VALUES ('000', '14700296');
INSERT INTO estudios VALUES ('000', '14839454');
INSERT INTO estudios VALUES ('000', '14866857');
INSERT INTO estudios VALUES ('000', '14917178');
INSERT INTO estudios VALUES ('000', '14917365');
INSERT INTO estudios VALUES ('000', '15142314');
INSERT INTO estudios VALUES ('000', '14917541');
INSERT INTO estudios VALUES ('000', '15175795');
INSERT INTO estudios VALUES ('000', '15175939');
INSERT INTO estudios VALUES ('000', '15223533');
INSERT INTO estudios VALUES ('000', '15381185');
INSERT INTO estudios VALUES ('000', '15454602');
INSERT INTO estudios VALUES ('000', '15516303');
INSERT INTO estudios VALUES ('000', '15516332');
INSERT INTO estudios VALUES ('000', '15565857');
INSERT INTO estudios VALUES ('000', '15622903');
INSERT INTO estudios VALUES ('000', '15754922');
INSERT INTO estudios VALUES ('000', '15754311');
INSERT INTO estudios VALUES ('000', '15756979');
INSERT INTO estudios VALUES ('000', '15920086');
INSERT INTO estudios VALUES ('000', '15920291');
INSERT INTO estudios VALUES ('000', '15921593');
INSERT INTO estudios VALUES ('000', '16020374');
INSERT INTO estudios VALUES ('000', '16285988');
INSERT INTO estudios VALUES ('000', '16377291');
INSERT INTO estudios VALUES ('000', '16514402');
INSERT INTO estudios VALUES ('000', '16964770');
INSERT INTO estudios VALUES ('000', '17130729');
INSERT INTO estudios VALUES ('000', '17129511');
INSERT INTO estudios VALUES ('000', '17238348');
INSERT INTO estudios VALUES ('000', '17456574');
INSERT INTO estudios VALUES ('000', '17499585');
INSERT INTO estudios VALUES ('000', '17456954');
INSERT INTO estudios VALUES ('000', '17521578');
INSERT INTO estudios VALUES ('000', '16199115');
INSERT INTO estudios VALUES ('000', '17523454');
INSERT INTO estudios VALUES ('000', '17664938');
INSERT INTO estudios VALUES ('000', '17769834');
INSERT INTO estudios VALUES ('000', '17770813');
INSERT INTO estudios VALUES ('000', '18310574');
INSERT INTO estudios VALUES ('000', '18581024');
INSERT INTO estudios VALUES ('000', '18796815');
INSERT INTO estudios VALUES ('000', '18796996');
INSERT INTO estudios VALUES ('000', '18962414');
INSERT INTO estudios VALUES ('000', '19421996');
INSERT INTO estudios VALUES ('000', '19440209');
INSERT INTO estudios VALUES ('000', '81423693');
INSERT INTO estudios VALUES ('000', '12345678');
INSERT INTO estudios VALUES ('000', '07509507');
INSERT INTO estudios VALUES ('000', '14786139');
INSERT INTO estudios VALUES ('000', '87654321');
INSERT INTO estudios VALUES ('000', '09240195');
INSERT INTO estudios VALUES ('000', '14400356');
INSERT INTO estudios VALUES ('000', '14916156');
INSERT INTO estudios VALUES ('000', '08047120');
INSERT INTO estudios VALUES ('016', '13648603');
INSERT INTO estudios VALUES ('001', '05655983');


--
-- Data for Name: historial; Type: TABLE DATA; Schema: public; Owner: www-data
--



--
-- Data for Name: malla; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO malla VALUES (1, '1', '2014-12-09', '01');
INSERT INTO malla VALUES (1, '1', '2014-12-09', '02');
INSERT INTO malla VALUES (1, '1', '2014-12-09', '04');
INSERT INTO malla VALUES (1, '1', '2014-12-09', '05');
INSERT INTO malla VALUES (1, '1', '2014-12-09', '06');
INSERT INTO malla VALUES (1, '1', '2014-12-09', '07');
INSERT INTO malla VALUES (1, '1', '2014-12-09', '08');
INSERT INTO malla VALUES (1, '1', '2014-12-09', '09');
INSERT INTO malla VALUES (1, '1', '2014-12-09', '03');


--
-- Data for Name: observacion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: www-data
--



--
-- Data for Name: periodo; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO periodo VALUES ('2015-01-25', '2015-04-17', 'a');
INSERT INTO periodo VALUES ('2014-11-10', '2015-01-24', 'p');


--
-- Data for Name: pertenece; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO pertenece VALUES ('00222222', '02');
INSERT INTO pertenece VALUES ('02149217', '05');
INSERT INTO pertenece VALUES ('02287821', '04');
INSERT INTO pertenece VALUES ('03048184', '01');
INSERT INTO pertenece VALUES ('03048184', '02');
INSERT INTO pertenece VALUES ('03485766', '01');
INSERT INTO pertenece VALUES ('03574698', '01');
INSERT INTO pertenece VALUES ('03661985', '08');
INSERT INTO pertenece VALUES ('03692342', '04');
INSERT INTO pertenece VALUES ('03727339', '01');
INSERT INTO pertenece VALUES ('03767311', '02');
INSERT INTO pertenece VALUES ('03767311', '05');
INSERT INTO pertenece VALUES ('03791326', '02');
INSERT INTO pertenece VALUES ('03791326', '05');
INSERT INTO pertenece VALUES ('03791326', '01');
INSERT INTO pertenece VALUES ('03830917', '01');
INSERT INTO pertenece VALUES ('03907664', '01');
INSERT INTO pertenece VALUES ('03910823', '06');
INSERT INTO pertenece VALUES ('03939687', '07');
INSERT INTO pertenece VALUES ('03941942', '03');
INSERT INTO pertenece VALUES ('03941942', '01');
INSERT INTO pertenece VALUES ('03941942', '05');
INSERT INTO pertenece VALUES ('03941942', '02');
INSERT INTO pertenece VALUES ('03966127', '04');
INSERT INTO pertenece VALUES ('03966127', '08');
INSERT INTO pertenece VALUES ('03966127', '03');
INSERT INTO pertenece VALUES ('03990590', '02');
INSERT INTO pertenece VALUES ('03992405', '07');
INSERT INTO pertenece VALUES ('04054457', '03');
INSERT INTO pertenece VALUES ('04054457', '02');
INSERT INTO pertenece VALUES ('04054457', '01');
INSERT INTO pertenece VALUES ('04194292', '01');
INSERT INTO pertenece VALUES ('04194292', '02');
INSERT INTO pertenece VALUES ('04319574', '06');
INSERT INTO pertenece VALUES ('04323036', '01');
INSERT INTO pertenece VALUES ('04327492', '01');
INSERT INTO pertenece VALUES ('04327492', '02');
INSERT INTO pertenece VALUES ('04330086', '01');
INSERT INTO pertenece VALUES ('04353143', '02');
INSERT INTO pertenece VALUES ('04356042', '08');
INSERT INTO pertenece VALUES ('04397227', '01');
INSERT INTO pertenece VALUES ('04468275', '03');
INSERT INTO pertenece VALUES ('04468275', '01');
INSERT INTO pertenece VALUES ('04472778', '02');
INSERT INTO pertenece VALUES ('04484976', '02');
INSERT INTO pertenece VALUES ('04484976', '03');
INSERT INTO pertenece VALUES ('04488065', '02');
INSERT INTO pertenece VALUES ('04488256', '01');
INSERT INTO pertenece VALUES ('04488420', '07');
INSERT INTO pertenece VALUES ('04489957', '06');
INSERT INTO pertenece VALUES ('04489957', '07');
INSERT INTO pertenece VALUES ('04489957', '04');
INSERT INTO pertenece VALUES ('04490481', '05');
INSERT INTO pertenece VALUES ('04491607', '02');
INSERT INTO pertenece VALUES ('04491607', '03');
INSERT INTO pertenece VALUES ('04491973', '03');
INSERT INTO pertenece VALUES ('04492233', '01');
INSERT INTO pertenece VALUES ('04492233', '02');
INSERT INTO pertenece VALUES ('04492356', '01');
INSERT INTO pertenece VALUES ('04583431', '02');
INSERT INTO pertenece VALUES ('04589713', '01');
INSERT INTO pertenece VALUES ('04633259', '01');
INSERT INTO pertenece VALUES ('04768948', '08');
INSERT INTO pertenece VALUES ('04769890', '05');
INSERT INTO pertenece VALUES ('04769890', '01');
INSERT INTO pertenece VALUES ('04769890', '02');
INSERT INTO pertenece VALUES ('04953940', '01');
INSERT INTO pertenece VALUES ('05021210', '01');
INSERT INTO pertenece VALUES ('05021210', '02');
INSERT INTO pertenece VALUES ('05021210', '05');
INSERT INTO pertenece VALUES ('05124273', '03');
INSERT INTO pertenece VALUES ('05201033', '01');
INSERT INTO pertenece VALUES ('05201622', '02');
INSERT INTO pertenece VALUES ('05203245', '03');
INSERT INTO pertenece VALUES ('05206267', '01');
INSERT INTO pertenece VALUES ('05206319', '03');
INSERT INTO pertenece VALUES ('05206372', '06');
INSERT INTO pertenece VALUES ('05239250', '03');
INSERT INTO pertenece VALUES ('05355610', '04');
INSERT INTO pertenece VALUES ('05355610', '07');
INSERT INTO pertenece VALUES ('05447146', '06');
INSERT INTO pertenece VALUES ('05447146', '04');
INSERT INTO pertenece VALUES ('05466076', '01');
INSERT INTO pertenece VALUES ('05507269', '07');
INSERT INTO pertenece VALUES ('05559793', '02');
INSERT INTO pertenece VALUES ('05561396', '01');
INSERT INTO pertenece VALUES ('05660032', '03');
INSERT INTO pertenece VALUES ('05740339', '07');
INSERT INTO pertenece VALUES ('05753564', '01');
INSERT INTO pertenece VALUES ('05753564', '04');
INSERT INTO pertenece VALUES ('05794416', '07');
INSERT INTO pertenece VALUES ('05794416', '04');
INSERT INTO pertenece VALUES ('05863317', '02');
INSERT INTO pertenece VALUES ('05952723', '01');
INSERT INTO pertenece VALUES ('06167653', '01');
INSERT INTO pertenece VALUES ('06547603', '03');
INSERT INTO pertenece VALUES ('06547603', '04');
INSERT INTO pertenece VALUES ('06558454', '01');
INSERT INTO pertenece VALUES ('06940439', '01');
INSERT INTO pertenece VALUES ('06940439', '02');
INSERT INTO pertenece VALUES ('06953950', '03');
INSERT INTO pertenece VALUES ('07080727', '01');
INSERT INTO pertenece VALUES ('07080727', '05');
INSERT INTO pertenece VALUES ('07168412', '03');
INSERT INTO pertenece VALUES ('07326064', '01');
INSERT INTO pertenece VALUES ('07383992', '03');
INSERT INTO pertenece VALUES ('07509507', '03');
INSERT INTO pertenece VALUES ('07525829', '06');
INSERT INTO pertenece VALUES ('07648734', '07');
INSERT INTO pertenece VALUES ('07648734', '01');
INSERT INTO pertenece VALUES ('07775026', '01');
INSERT INTO pertenece VALUES ('07824945', '01');
INSERT INTO pertenece VALUES ('07832738', '03');
INSERT INTO pertenece VALUES ('07934845', '04');
INSERT INTO pertenece VALUES ('07934845', '03');
INSERT INTO pertenece VALUES ('07940076', '01');
INSERT INTO pertenece VALUES ('08000617', '01');
INSERT INTO pertenece VALUES ('08002183', '03');
INSERT INTO pertenece VALUES ('08002316', '02');
INSERT INTO pertenece VALUES ('08002737', '06');
INSERT INTO pertenece VALUES ('08004161', '02');
INSERT INTO pertenece VALUES ('08005159', '01');
INSERT INTO pertenece VALUES ('08006388', '02');
INSERT INTO pertenece VALUES ('08006639', '03');
INSERT INTO pertenece VALUES ('08006639', '04');
INSERT INTO pertenece VALUES ('08006639', '01');
INSERT INTO pertenece VALUES ('08006639', '02');
INSERT INTO pertenece VALUES ('08006639', '07');
INSERT INTO pertenece VALUES ('08006639', '05');
INSERT INTO pertenece VALUES ('08012641', '05');
INSERT INTO pertenece VALUES ('08013569', '01');
INSERT INTO pertenece VALUES ('08013671', '01');
INSERT INTO pertenece VALUES ('08019784', '01');
INSERT INTO pertenece VALUES ('08019784', '02');
INSERT INTO pertenece VALUES ('08019784', '06');
INSERT INTO pertenece VALUES ('08020438', '04');
INSERT INTO pertenece VALUES ('08020438', '03');
INSERT INTO pertenece VALUES ('08020758', '02');
INSERT INTO pertenece VALUES ('08021306', '07');
INSERT INTO pertenece VALUES ('08021736', '04');
INSERT INTO pertenece VALUES ('08021736', '02');
INSERT INTO pertenece VALUES ('08021736', '08');
INSERT INTO pertenece VALUES ('08021842', '08');
INSERT INTO pertenece VALUES ('08022340', '01');
INSERT INTO pertenece VALUES ('08022671', '06');
INSERT INTO pertenece VALUES ('08022671', '04');
INSERT INTO pertenece VALUES ('08024531', '02');
INSERT INTO pertenece VALUES ('08025750', '02');
INSERT INTO pertenece VALUES ('08025750', '05');
INSERT INTO pertenece VALUES ('08026122', '02');
INSERT INTO pertenece VALUES ('08026122', '05');
INSERT INTO pertenece VALUES ('08026155', '02');
INSERT INTO pertenece VALUES ('08027408', '02');
INSERT INTO pertenece VALUES ('08027793', '03');
INSERT INTO pertenece VALUES ('08028204', '03');
INSERT INTO pertenece VALUES ('08029045', '01');
INSERT INTO pertenece VALUES ('08029045', '05');
INSERT INTO pertenece VALUES ('08029075', '03');
INSERT INTO pertenece VALUES ('08029696', '02');
INSERT INTO pertenece VALUES ('08031064', '02');
INSERT INTO pertenece VALUES ('08031064', '05');
INSERT INTO pertenece VALUES ('08032732', '02');
INSERT INTO pertenece VALUES ('08034029', '05');
INSERT INTO pertenece VALUES ('08034029', '02');
INSERT INTO pertenece VALUES ('08034300', '01');
INSERT INTO pertenece VALUES ('08034371', '05');
INSERT INTO pertenece VALUES ('08034371', '01');
INSERT INTO pertenece VALUES ('08035484', '01');
INSERT INTO pertenece VALUES ('08037619', '04');
INSERT INTO pertenece VALUES ('08038332', '05');
INSERT INTO pertenece VALUES ('08038332', '02');
INSERT INTO pertenece VALUES ('08038611', '01');
INSERT INTO pertenece VALUES ('08039294', '05');
INSERT INTO pertenece VALUES ('08039463', '01');
INSERT INTO pertenece VALUES ('08039498', '07');
INSERT INTO pertenece VALUES ('08039498', '05');
INSERT INTO pertenece VALUES ('08040787', '02');
INSERT INTO pertenece VALUES ('08040787', '04');
INSERT INTO pertenece VALUES ('08041510', '04');
INSERT INTO pertenece VALUES ('08041620', '02');
INSERT INTO pertenece VALUES ('08042559', '04');
INSERT INTO pertenece VALUES ('08044725', '03');
INSERT INTO pertenece VALUES ('08044768', '07');
INSERT INTO pertenece VALUES ('08044768', '04');
INSERT INTO pertenece VALUES ('08045258', '02');
INSERT INTO pertenece VALUES ('08045307', '02');
INSERT INTO pertenece VALUES ('08045307', '05');
INSERT INTO pertenece VALUES ('08045536', '01');
INSERT INTO pertenece VALUES ('08046408', '07');
INSERT INTO pertenece VALUES ('08046659', '01');
INSERT INTO pertenece VALUES ('08047120', '03');
INSERT INTO pertenece VALUES ('08048794', '07');
INSERT INTO pertenece VALUES ('08079222', '01');
INSERT INTO pertenece VALUES ('08080375', '01');
INSERT INTO pertenece VALUES ('08080375', '02');
INSERT INTO pertenece VALUES ('08080676', '02');
INSERT INTO pertenece VALUES ('08084432', '03');
INSERT INTO pertenece VALUES ('08087415', '02');
INSERT INTO pertenece VALUES ('08141857', '03');
INSERT INTO pertenece VALUES ('08331149', '05');
INSERT INTO pertenece VALUES ('08336414', '04');
INSERT INTO pertenece VALUES ('08656400', '07');
INSERT INTO pertenece VALUES ('08656400', '04');
INSERT INTO pertenece VALUES ('08683060', '04');
INSERT INTO pertenece VALUES ('08720054', '05');
INSERT INTO pertenece VALUES ('08958864', '05');
INSERT INTO pertenece VALUES ('08958864', '04');
INSERT INTO pertenece VALUES ('09027962', '01');
INSERT INTO pertenece VALUES ('09028433', '07');
INSERT INTO pertenece VALUES ('09028433', '04');
INSERT INTO pertenece VALUES ('09081546', '01');
INSERT INTO pertenece VALUES ('09198636', '02');
INSERT INTO pertenece VALUES ('09198636', '01');
INSERT INTO pertenece VALUES ('09201868', '03');
INSERT INTO pertenece VALUES ('09234597', '04');
INSERT INTO pertenece VALUES ('09346062', '01');
INSERT INTO pertenece VALUES ('09389944', '03');
INSERT INTO pertenece VALUES ('09389944', '01');
INSERT INTO pertenece VALUES ('09472514', '04');
INSERT INTO pertenece VALUES ('09473151', '05');
INSERT INTO pertenece VALUES ('09473374', '05');
INSERT INTO pertenece VALUES ('09473374', '02');
INSERT INTO pertenece VALUES ('09473423', '04');
INSERT INTO pertenece VALUES ('09473423', '02');
INSERT INTO pertenece VALUES ('09473567', '01');
INSERT INTO pertenece VALUES ('09473852', '08');
INSERT INTO pertenece VALUES ('09474147', '03');
INSERT INTO pertenece VALUES ('09475173', '04');
INSERT INTO pertenece VALUES ('09475173', '03');
INSERT INTO pertenece VALUES ('09476031', '03');
INSERT INTO pertenece VALUES ('09476268', '07');
INSERT INTO pertenece VALUES ('09478674', '01');
INSERT INTO pertenece VALUES ('09499979', '01');
INSERT INTO pertenece VALUES ('09499979', '04');
INSERT INTO pertenece VALUES ('09499979', '03');
INSERT INTO pertenece VALUES ('09501330', '01');
INSERT INTO pertenece VALUES ('09678973', '03');
INSERT INTO pertenece VALUES ('09906067', '04');
INSERT INTO pertenece VALUES ('09906067', '02');
INSERT INTO pertenece VALUES ('09906615', '01');
INSERT INTO pertenece VALUES ('10087275', '02');
INSERT INTO pertenece VALUES ('10087275', '05');
INSERT INTO pertenece VALUES ('10087275', '03');
INSERT INTO pertenece VALUES ('10092487', '06');
INSERT INTO pertenece VALUES ('10092487', '05');
INSERT INTO pertenece VALUES ('10092487', '02');
INSERT INTO pertenece VALUES ('10100205', '04');
INSERT INTO pertenece VALUES ('10102108', '01');
INSERT INTO pertenece VALUES ('10102259', '06');
INSERT INTO pertenece VALUES ('10102454', '02');
INSERT INTO pertenece VALUES ('10104966', '03');
INSERT INTO pertenece VALUES ('10104966', '04');
INSERT INTO pertenece VALUES ('10104966', '01');
INSERT INTO pertenece VALUES ('10108950', '05');
INSERT INTO pertenece VALUES ('10109087', '08');
INSERT INTO pertenece VALUES ('10178133', '03');
INSERT INTO pertenece VALUES ('10256095', '03');
INSERT INTO pertenece VALUES ('10314511', '04');
INSERT INTO pertenece VALUES ('10712408', '02');
INSERT INTO pertenece VALUES ('10713529', '02');
INSERT INTO pertenece VALUES ('10714070', '06');
INSERT INTO pertenece VALUES ('10715146', '03');
INSERT INTO pertenece VALUES ('10715404', '07');
INSERT INTO pertenece VALUES ('10718091', '01');
INSERT INTO pertenece VALUES ('10718224', '07');
INSERT INTO pertenece VALUES ('10718224', '04');
INSERT INTO pertenece VALUES ('10718224', '01');
INSERT INTO pertenece VALUES ('10718393', '04');
INSERT INTO pertenece VALUES ('10720364', '04');
INSERT INTO pertenece VALUES ('10720364', '05');
INSERT INTO pertenece VALUES ('10720364', '01');
INSERT INTO pertenece VALUES ('10797122', '05');
INSERT INTO pertenece VALUES ('10898072', '03');
INSERT INTO pertenece VALUES ('11067484', '07');
INSERT INTO pertenece VALUES ('11108398', '07');
INSERT INTO pertenece VALUES ('11108398', '04');
INSERT INTO pertenece VALUES ('11215098', '02');
INSERT INTO pertenece VALUES ('11215098', '03');
INSERT INTO pertenece VALUES ('11215098', '04');
INSERT INTO pertenece VALUES ('11303172', '03');
INSERT INTO pertenece VALUES ('11319364', '02');
INSERT INTO pertenece VALUES ('11460000', '04');
INSERT INTO pertenece VALUES ('11460000', '06');
INSERT INTO pertenece VALUES ('11460813', '02');
INSERT INTO pertenece VALUES ('11462979', '06');
INSERT INTO pertenece VALUES ('11462979', '01');
INSERT INTO pertenece VALUES ('11463296', '07');
INSERT INTO pertenece VALUES ('11465653', '07');
INSERT INTO pertenece VALUES ('11466224', '03');
INSERT INTO pertenece VALUES ('11467397', '04');
INSERT INTO pertenece VALUES ('11467713', '05');
INSERT INTO pertenece VALUES ('11468201', '05');
INSERT INTO pertenece VALUES ('11705856', '03');
INSERT INTO pertenece VALUES ('11705856', '04');
INSERT INTO pertenece VALUES ('11783461', '06');
INSERT INTO pertenece VALUES ('11912316', '04');
INSERT INTO pertenece VALUES ('11952770', '02');
INSERT INTO pertenece VALUES ('11952770', '04');
INSERT INTO pertenece VALUES ('11954144', '03');
INSERT INTO pertenece VALUES ('11956576', '03');
INSERT INTO pertenece VALUES ('11956576', '04');
INSERT INTO pertenece VALUES ('11959505', '05');
INSERT INTO pertenece VALUES ('11960173', '03');
INSERT INTO pertenece VALUES ('12048353', '04');
INSERT INTO pertenece VALUES ('12329797', '03');
INSERT INTO pertenece VALUES ('12346208', '07');
INSERT INTO pertenece VALUES ('12352023', '02');
INSERT INTO pertenece VALUES ('12353031', '01');
INSERT INTO pertenece VALUES ('12353451', '03');
INSERT INTO pertenece VALUES ('12458260', '02');
INSERT INTO pertenece VALUES ('12722185', '03');
INSERT INTO pertenece VALUES ('12776731', '04');
INSERT INTO pertenece VALUES ('12776731', '07');
INSERT INTO pertenece VALUES ('12776731', '05');
INSERT INTO pertenece VALUES ('12779069', '05');
INSERT INTO pertenece VALUES ('12779975', '02');
INSERT INTO pertenece VALUES ('12817844', '04');
INSERT INTO pertenece VALUES ('12839616', '03');
INSERT INTO pertenece VALUES ('13013152', '06');
INSERT INTO pertenece VALUES ('13014569', '03');
INSERT INTO pertenece VALUES ('13014707', '02');
INSERT INTO pertenece VALUES ('13098188', '02');
INSERT INTO pertenece VALUES ('13098422', '05');
INSERT INTO pertenece VALUES ('13098422', '02');
INSERT INTO pertenece VALUES ('13098763', '05');
INSERT INTO pertenece VALUES ('13098763', '02');
INSERT INTO pertenece VALUES ('13098948', '01');
INSERT INTO pertenece VALUES ('13099384', '04');
INSERT INTO pertenece VALUES ('13099384', '02');
INSERT INTO pertenece VALUES ('13099384', '01');
INSERT INTO pertenece VALUES ('13477378', '03');
INSERT INTO pertenece VALUES ('13524109', '03');
INSERT INTO pertenece VALUES ('13524109', '01');
INSERT INTO pertenece VALUES ('13524109', '04');
INSERT INTO pertenece VALUES ('13524820', '05');
INSERT INTO pertenece VALUES ('13524820', '01');
INSERT INTO pertenece VALUES ('13525905', '04');
INSERT INTO pertenece VALUES ('13649962', '01');
INSERT INTO pertenece VALUES ('13723698', '03');
INSERT INTO pertenece VALUES ('13803490', '02');
INSERT INTO pertenece VALUES ('13947142', '03');
INSERT INTO pertenece VALUES ('13966054', '03');
INSERT INTO pertenece VALUES ('13966605', '08');
INSERT INTO pertenece VALUES ('13967486', '03');
INSERT INTO pertenece VALUES ('14131053', '01');
INSERT INTO pertenece VALUES ('14249554', '01');
INSERT INTO pertenece VALUES ('14267080', '07');
INSERT INTO pertenece VALUES ('14267080', '04');
INSERT INTO pertenece VALUES ('14267842', '07');
INSERT INTO pertenece VALUES ('14268612', '03');
INSERT INTO pertenece VALUES ('14340058', '03');
INSERT INTO pertenece VALUES ('14340058', '01');
INSERT INTO pertenece VALUES ('14400087', '02');
INSERT INTO pertenece VALUES ('14401340', '03');
INSERT INTO pertenece VALUES ('14589222', '02');
INSERT INTO pertenece VALUES ('14700296', '07');
INSERT INTO pertenece VALUES ('14839454', '05');
INSERT INTO pertenece VALUES ('14866857', '03');
INSERT INTO pertenece VALUES ('14916156', '02');
INSERT INTO pertenece VALUES ('14916156', '01');
INSERT INTO pertenece VALUES ('14917178', '03');
INSERT INTO pertenece VALUES ('14917365', '01');
INSERT INTO pertenece VALUES ('14917541', '01');
INSERT INTO pertenece VALUES ('15142314', '01');
INSERT INTO pertenece VALUES ('15175795', '04');
INSERT INTO pertenece VALUES ('15175939', '03');
INSERT INTO pertenece VALUES ('14400356', '02');
INSERT INTO pertenece VALUES ('13648603', '03');
INSERT INTO pertenece VALUES ('15223533', '01');
INSERT INTO pertenece VALUES ('15296169', '03');
INSERT INTO pertenece VALUES ('15381185', '04');
INSERT INTO pertenece VALUES ('15454602', '03');
INSERT INTO pertenece VALUES ('15454602', '04');
INSERT INTO pertenece VALUES ('15516303', '02');
INSERT INTO pertenece VALUES ('15516303', '01');
INSERT INTO pertenece VALUES ('15516332', '04');
INSERT INTO pertenece VALUES ('15565857', '04');
INSERT INTO pertenece VALUES ('15622903', '05');
INSERT INTO pertenece VALUES ('15754311', '01');
INSERT INTO pertenece VALUES ('15754311', '02');
INSERT INTO pertenece VALUES ('15754922', '07');
INSERT INTO pertenece VALUES ('15756979', '05');
INSERT INTO pertenece VALUES ('15920086', '07');
INSERT INTO pertenece VALUES ('15920086', '04');
INSERT INTO pertenece VALUES ('15920291', '04');
INSERT INTO pertenece VALUES ('15920291', '07');
INSERT INTO pertenece VALUES ('15921593', '02');
INSERT INTO pertenece VALUES ('16020374', '02');
INSERT INTO pertenece VALUES ('16199115', '02');
INSERT INTO pertenece VALUES ('16199115', '01');
INSERT INTO pertenece VALUES ('16285988', '06');
INSERT INTO pertenece VALUES ('16285988', '01');
INSERT INTO pertenece VALUES ('16377291', '02');
INSERT INTO pertenece VALUES ('16514402', '03');
INSERT INTO pertenece VALUES ('16964770', '04');
INSERT INTO pertenece VALUES ('16964770', '07');
INSERT INTO pertenece VALUES ('17129511', '01');
INSERT INTO pertenece VALUES ('17130729', '07');
INSERT INTO pertenece VALUES ('17238348', '08');
INSERT INTO pertenece VALUES ('17456574', '01');
INSERT INTO pertenece VALUES ('17456954', '02');
INSERT INTO pertenece VALUES ('17456954', '05');
INSERT INTO pertenece VALUES ('17456954', '01');
INSERT INTO pertenece VALUES ('17499585', '02');
INSERT INTO pertenece VALUES ('17521578', '02');
INSERT INTO pertenece VALUES ('17521578', '03');
INSERT INTO pertenece VALUES ('17523454', '04');
INSERT INTO pertenece VALUES ('17664938', '05');
INSERT INTO pertenece VALUES ('17769834', '03');
INSERT INTO pertenece VALUES ('17770813', '01');
INSERT INTO pertenece VALUES ('18310574', '01');
INSERT INTO pertenece VALUES ('18581024', '07');
INSERT INTO pertenece VALUES ('18581024', '04');
INSERT INTO pertenece VALUES ('18796815', '02');
INSERT INTO pertenece VALUES ('18796996', '05');
INSERT INTO pertenece VALUES ('18796996', '02');
INSERT INTO pertenece VALUES ('18962414', '01');
INSERT INTO pertenece VALUES ('19421996', '08');
INSERT INTO pertenece VALUES ('19440209', '01');
INSERT INTO pertenece VALUES ('81423693', '02');
INSERT INTO pertenece VALUES ('12345678', '03');
INSERT INTO pertenece VALUES ('14786139', '03');
INSERT INTO pertenece VALUES ('87654321', '02');
INSERT INTO pertenece VALUES ('09240195', '02');
INSERT INTO pertenece VALUES ('05655983', '03');


--
-- Data for Name: profesion; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO profesion VALUES ('000', 'SIN ASIGNAR');
INSERT INTO profesion VALUES ('001', 'INGENIERO EN SISTEMAS');
INSERT INTO profesion VALUES ('002', 'LIC. CONTADURIA');
INSERT INTO profesion VALUES ('003', 'INGENIERO CIVIL');
INSERT INTO profesion VALUES ('005', 'T.S.U. CONTADURIA');
INSERT INTO profesion VALUES ('006', 'T.S.U. INFORMATICA');
INSERT INTO profesion VALUES ('007', 'T.S.U. AGROTECNIA');
INSERT INTO profesion VALUES ('008', 'T.S.U. C0NSTRUCCION CIVIL');
INSERT INTO profesion VALUES ('009', 'ING. QUIMICO');
INSERT INTO profesion VALUES ('010', 'T.S.U. MANEJO DE EMERGENCIAS A.C.D.');
INSERT INTO profesion VALUES ('011', 'LIC. EN ADMINISTRACION');
INSERT INTO profesion VALUES ('012', 'MATEMATICO');
INSERT INTO profesion VALUES ('013', 'INGENIERO INDUSTRIAL');
INSERT INTO profesion VALUES ('014', 'PSICOLOGO');
INSERT INTO profesion VALUES ('015', 'SOCIOLOGO');
INSERT INTO profesion VALUES ('016', 'ING. EN INFORMATICA');
INSERT INTO profesion VALUES ('017', 'ING. ELECTRICO');
INSERT INTO profesion VALUES ('018', 'ING. MECANICO');
INSERT INTO profesion VALUES ('020', 'TECNOLOGIA PECUARIA');
INSERT INTO profesion VALUES ('021', 'TECNOLOGIA AGRICOLA');
INSERT INTO profesion VALUES ('022', 'LIC. MATEMATICA');
INSERT INTO profesion VALUES ('023', 'INGENIERO FORESTAL');
INSERT INTO profesion VALUES ('024', 'LIC. COMUNICACION SOCIAL');
INSERT INTO profesion VALUES ('026', 'LIC. EDUCACION');
INSERT INTO profesion VALUES ('027', 'LIC. ADMINISTRACION EMPRESAS');
INSERT INTO profesion VALUES ('029', 'LIC. LETRAS');
INSERT INTO profesion VALUES ('030', 'LIC. EDUCACION FISICA');
INSERT INTO profesion VALUES ('031', 'ARQUITECTO');
INSERT INTO profesion VALUES ('032', 'INGENIERO DE MINAS');
INSERT INTO profesion VALUES ('033', 'LIC. NUTRICION');
INSERT INTO profesion VALUES ('034', 'MEDICO VETERINARIO');
INSERT INTO profesion VALUES ('035', 'ABOGADO');
INSERT INTO profesion VALUES ('036', 'POLITOLOGO');
INSERT INTO profesion VALUES ('037', 'CRIMINOLOGO');
INSERT INTO profesion VALUES ('038', 'LIC. HISTORIA');
INSERT INTO profesion VALUES ('039', 'LIC. IDIOMAS MODERNOS');
INSERT INTO profesion VALUES ('040', 'LIC. MEDIOS AUDIOVISUALES');
INSERT INTO profesion VALUES ('041', 'LIC. BIOLOGIA');
INSERT INTO profesion VALUES ('042', 'LIC. FISICA');
INSERT INTO profesion VALUES ('043', 'LIC. QUIMICA');
INSERT INTO profesion VALUES ('044', 'GEOGRAFO');
INSERT INTO profesion VALUES ('045', 'FARMACEUTICO');
INSERT INTO profesion VALUES ('046', 'LIC. BIOANALISIS');
INSERT INTO profesion VALUES ('047', 'MEDICO');
INSERT INTO profesion VALUES ('048', 'LIC. ENFERMERIA');
INSERT INTO profesion VALUES ('049', 'TECNICO SUPERIOR RADIOLOGO');
INSERT INTO profesion VALUES ('050', 'ODONTOLOGO');
INSERT INTO profesion VALUES ('051', 'ING. AGRICOLA');
INSERT INTO profesion VALUES ('052', 'LIC. DISEÑO INDUSTRIAL');
INSERT INTO profesion VALUES ('053', 'LIC. ESTADISTICA');
INSERT INTO profesion VALUES ('054', 'ECONOMISTA');
INSERT INTO profesion VALUES ('055', 'LIC. FILOSOFIA');
INSERT INTO profesion VALUES ('056', 'ING GEOLOGO');
INSERT INTO profesion VALUES ('057', 'FARMACEUTICA');


--
-- Data for Name: profesor; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO profesor VALUES ('03992405', 'MARIA', 'MAGALY', 'VALERO', 'LACRUZ', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('14267080', 'YULECXY ', 'AURORA', 'UZCATEGUI', 'ARAQUE', '0', '0', '0', '01', 'YULUZAR@HOTMAIL.COM', '0274-2528083', '0414-3751830', 0);
INSERT INTO profesor VALUES ('00222222', 'JESUS', '', 'RODRIGUEZ', 'IGNACIO', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('12722185', 'SOLANGE', 'ANIREE', 'LEAL', 'LEAL', '0', '0', '0', '01', 'SOLANGELEAL@YAHOO.COM', '0274-2623282', '0416-2755134', 0);
INSERT INTO profesor VALUES ('00584711', 'HECTOR', 'N', 'MEZA', 'F', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03048184', 'JOSE', '', 'SOLANO', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('03574698', 'ANGEL', 'SAUL', 'VALERA', 'PACHECO', '0', '0', '0', '01', 'DESMODUS.ROT@HOTMAIL.COM', '02754112264', '04149798302', 0);
INSERT INTO profesor VALUES ('04468275', 'JOSE', 'ALIRIO', 'RONDON', 'MARQUEZ', '0', '0', '0', '01', 'ALIRIORONDON48@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('04768948', 'BEATRIZ CAROLINA', 'DEL CARMEN', 'ANGELI', 'MAURY', '0', '0', '0', '01', 'BEATRIZCAROLINAANGELI@GMAIL.COM', '', '04247349806', 0);
INSERT INTO profesor VALUES ('07080727', 'IVAN', '', 'LOPEZ', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('07168412', 'JESUS', 'ANTONIO', 'DELGADO', 'MENDOZA', '0', '0', '0', '01', 'JESUSDELG1@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('08013569', 'JOSE', 'GREGORIO', 'RODRIGUEZ', 'ROJO', '0', '0', '0', '06', 'CARGREGOREME@HOTMAIL.COM', '', '0414-7474077', 0);
INSERT INTO profesor VALUES ('08039294', 'LILIANA', '', 'DURAN', '', '0', '0', '0', '01', 'LDGEOLOGA@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('08039463', 'RAMSES', 'ALONZO', 'PERNIA', 'SUAREZ', '0', '0', '0', '01', 'RAMSESPERNIA0606@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('09198636', 'LUIS', 'ALBERTO', 'MOLINA', 'GUTIERREZ', '0', '0', '0', '01', 'LUISALBERTOMOLINA1963@HOTMAIL.COM', '', '0416-6782813', 0);
INSERT INTO profesor VALUES ('10102259', 'ALIX', '', 'ANGULO', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('10102454', 'GERARDO', 'ALEXIS', 'VIELMA', 'SANCHEZ', '0', '0', '0', '01', 'GVS97@HOTMAIL.COM', '', '0416-1719906', 0);
INSERT INTO profesor VALUES ('11463296', 'KARY', 'YUSELIN', 'UZCATEGUI', 'NAVA', '0', '0', '0', '01', 'KARINANAVA2006@HOTMAIL.COM', '', '04265126395', 0);
INSERT INTO profesor VALUES ('13098763', 'AMALUZ', 'CAROLINA', 'ANGARITA', 'ALBORNOZ', '0', '0', '0', '01', 'AMALUZDELOPEZ@HOTMAIL.COM', '', '0426-5731334', 0);
INSERT INTO profesor VALUES ('15296169', 'ROSALY', 'CAROLINA', 'MENDOZA', 'MARQUEZ', '0', '0', '0', '01', 'MENDOZAROSALY@HOTMAIL.COM', '02742661228', '04264153365', 0);
INSERT INTO profesor VALUES ('07357589', 'CIRA', '', 'GIL', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('10718224', 'NORA', 'PATRICIA', 'ROJAS', 'FENANDEZ', '0', '0', '0', '01', 'PATRICIAROJAS73@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('02149217', 'CESAR', 'RAFAEL', 'GUTIERREZ', '', '0', '0', '0', '01', 'CESGUTIERREZ@HOTMAIL.COM', '02742211931', '', 0);
INSERT INTO profesor VALUES ('02287821', 'EDUARDO', 'ALI', 'CALDERON', 'MORA', '0', '0', '0', '01', 'CALDERONEDUARDO@INTER.COM.VE', '0274 2217690', '0414 7440176', 0);
INSERT INTO profesor VALUES ('00678538', 'HUGO', 'JOSE', 'SALAS', 'R', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('00976855', 'JOSE', 'J', 'MUÑOZ', 'U', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('01111111', 'JUAN ', 'CARLOS', 'VALERA', 'RUIZ', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('01146089', 'DILCAR', '', 'CARMONA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('01656140', 'NEVILLE', 'R', 'ROMAN', 'M', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('01687450', 'OTTO', '', 'ARAUJO', 'G', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('02286020', 'JOSE', 'L', 'RAMIREZ', 'M', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('02362548', 'ISRAEL', 'G', 'MEDINA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('02455516', 'JOSE', 'M', 'LEON', 'F', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('02457912', 'RICARDO', 'A', 'CORREDOR', 'T', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('02617975', 'ANTONIO', 'J', 'MORENO', '', '0', '0', '0', '00', 'MORENOCHACON39@HOTMAIL.COM', '0274 2633213', '0414 7410259', 0);
INSERT INTO profesor VALUES ('02737443', 'JESUS', '', 'PORTILLO', '', '0', '0', '0', '00', 'JESUSPORTILLOI@CANTV.NET', '0274 2716532', '0416 8742684', 0);
INSERT INTO profesor VALUES ('02814719', 'TERESA', '', 'OMAÑA', 'M', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('02838121', 'RAUL', '', 'LEON', 'PALENCIA', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('02850226', 'EDMART', '', 'HERNANDEZ', 'F', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('02890587', 'HERNANDO', '', 'CHACON', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('02957596', 'GABRIEL', '', 'GONZALEZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03006127', 'LUIS', 'A', 'RIVAS', 'P', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03032135', 'FRANLKIN', 'O', 'QUINTERO', 'D', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03038774', 'CARLOS', '', 'SANCHEZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03062497', 'ZAIRA', 'COROMOTO', 'BOUQUET', 'MOLINA', '0', '0', '0', '00', 'ZAIRA01BOUQUET@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('03082706', 'ORLANDO', '', 'GUTIERREZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03293648', 'EUTIMIO', '', 'CONTRERAS', 'R', '0', '0', '0', '00', 'ETICON@VANTV.NET', '0274 2662665', '0416 4726991', 0);
INSERT INTO profesor VALUES ('03309773', 'TOMAS', 'A', 'RIVAS', 'S', '0', '0', '0', '00', 'TOALRISA@YAHOO.ES', '', '0416 6743705', 0);
INSERT INTO profesor VALUES ('03370453', 'MAGDALENA', '', 'GONZALEZ', ' M', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03385972', 'HECTOR', '', 'SILVA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03428254', 'MARCIAL', '', 'SANCHEZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03442051', 'AQUILES', 'RAFAEL', 'MACUARE', 'MACURE', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03469416', 'SONIA', '', 'RUIZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03474020', 'NESTOR', '', 'OJEDA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03479772', 'VICTOR', 'E', 'PONCE', 'G', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03496268', 'RICARDO', '', 'PEREZ', 'D', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03498015', 'JOSE', 'A', 'VIELMA', 'M', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03498205', 'HOMERO', '', 'ANGULO', 'S', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03499333', 'LAUDELINO', '', 'QUINTERO', 'D', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03522090', 'JORGE', 'A', 'BASTIDAS', 'M', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03549662', 'OMAR', 'A', 'SINZA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03554216', 'ANA', 'L', 'TORO', 'A', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03586551', 'IRMA', '', 'MARTINEZ', 'USECHE', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03635921', 'IDA', '', 'LOAIZA', 'M', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03726896', 'ANTONIO', 'F', 'AYESTARAN', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03752100', 'MARCOS', 'J', 'RAMIREZ', 'H', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03766382', 'RIGOBERTO', '', 'ARAUJO', 'P', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03767094', 'ROMAURO', '', 'RODRIGUEZ', 'R', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03813571', 'TEODORO', '', 'PEARCE', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03814444', 'EDGAR', '', 'AMADO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03824022', 'GUSTAVO', '', 'DOMINGUEZ', 'S', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03853571', 'JEANNY', '', 'MEZA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03939324', 'CARLOS', 'E', 'QUINTERO', 'M', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03939832', 'AURA', 'J', 'BELANDRIA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03991661', 'JOSE', '', 'CAMACHO', 'R', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03992823', 'RAFAEL', '', 'MARQUEZ', 'C', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03995466', 'RODOLFO', '', 'NEWMAN', 'M', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03995911', 'ANTONIO', 'R', 'PEÑA', 'P', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04041213', 'FRANCISCA', '', 'QUINTERO', 'C', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04059960', 'ELIGIO', 'J', 'SALAS', 'P', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04063136', 'FREDDY', '', 'OLMOS', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04092339', 'DORA', '', 'ZAMBRANO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04143374', 'ROMEL', 'A', 'RODRIGUEZ', 'Z', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04145751', 'ANA', '', 'CONTRERAS', 'RAMIREZ', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04163685', 'ALEXIS', '', 'MARTINEZ', 'D', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04173394', 'CARMEN', 'I', 'REYES', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04203537', 'GERARDO', '', 'ESCALANTE', 'P', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04206639', 'ZONIA', 'R', 'RAMIREZ', 'S', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04246098', 'ALIS', '', 'MUJICA', 'A', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04271043', 'FREDY', '', 'GARCIA', 'R', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04323352', 'ALFREDO', '', 'PORTILLO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04324337', 'REBECA', '', 'URBANETA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04334862', 'ALEXI', '', 'LANDAETA', 'Y', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('03485766', 'HERNAN', 'ARMANDO', 'NIETO', 'VILLALOBOS', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('03661985', 'ODETTE', 'MARGARITA', 'REGGETI', 'DE PEREZ', '0', '0', '0', '01', 'Odette.pnffono@gmail.com', '', '0424-1507514', 0);
INSERT INTO profesor VALUES ('03692342', 'MIGDALIA ', 'DEL CARMEN', 'GARAY', 'AGUILAR', '0', '0', '0', '01', 'MIGDAGAR@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('03727339', 'NESTOR', 'ORLANDO', 'LEON', 'GONZALEZ', '0', '0', '0', '01', 'NESLANLEO@YAHOO.ES', '', '0416-8736738', 0);
INSERT INTO profesor VALUES ('03767311', 'MAGDALENA', 'JOSEFINA', 'TORRES', 'MORALES', '0', '0', '0', '01', 'MAGDALENATORRESM@GMAIL.COM', '', '0424-7040173', 0);
INSERT INTO profesor VALUES ('03830917', 'ORLANDO', 'RAFAEL', 'GARCIA', 'ROMERO', '0', '0', '0', '01', 'ORLANDOGARCIA@INTERCABLE.NET', '', '', 0);
INSERT INTO profesor VALUES ('03791326', 'CARLOS', 'HUMBERTO', 'GUTIERREZ', 'QUIROZ', '0', '0', '0', '01', 'CARLOSHGQ@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('03907664', 'CARMEN', '', 'MEDICCI ', 'B', '0', '0', '0', '06', '', '', '', 0);
INSERT INTO profesor VALUES ('03910823', 'EWALDO', '', 'SANDOVAL', 'S', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('03939687', 'MAGALI', 'ASTRID', 'MOLINA', 'ROJAS', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('03941942', 'NESTOR', 'ALI', 'ROSALES', 'PERNIA', '0', '0', '0', '01', 'NESTORYOALI@HOTMAIL.COM', '', '0426-5739060', 0);
INSERT INTO profesor VALUES ('03966127', 'OSWALDO', '', 'ABARCA', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('03990590', 'ANTONIO', 'JOSE', 'MEJIAS', 'MARQUINA', '0', '0', '0', '01', 'ANTONIOJMM@CANTV.NET', '', '', 0);
INSERT INTO profesor VALUES ('04054457', 'VICTOR', 'ALBERTO', 'MEZA', 'MORALES', '0', '0', '0', '01', 'VICTORMEZA02@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('04194292', 'ARVIN', 'ENRIQUE', 'PINEDA', 'QUERALES', '0', '0', '0', '01', 'ARVINP@CANTV.NET', '', '04164740981', 0);
INSERT INTO profesor VALUES ('04319574', 'IRAIDE', 'CELINA', 'ZERPA', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('04323036', 'LUIS', 'ABDENAGO', 'PERDOMO', 'PEREZ', '0', '0', '0', '06', '', '', '', 0);
INSERT INTO profesor VALUES ('04327492', 'RAMIRO', 'DE JESUS', 'GARCIA', 'MATOS', '0', '0', '0', '01', 'RAMIROGMATOS@GMAIL.COM', '', '0414-9742712', 0);
INSERT INTO profesor VALUES ('04353143', 'ABDEMAR', 'JOSE', 'AYESTARAN', 'FABIANI', '0', '0', '0', '01', 'ABDEMAR90@HOTMAIL.COM', '', '0416-6740678', 0);
INSERT INTO profesor VALUES ('04330086', 'MARCIAL', 'EVANAAN', 'BRACHO', '', '0', '0', '0', '06', 'MARCIALBRACHO@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('04356042', 'MYRIAM', 'TERESA', 'ANZOLA', 'DE DIAZ', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('04397227', 'RAFAEL', 'GREGORIO', 'BUSTAMANTE', '', '0', '0', '0', '01', 'BUSTARAF@ULA.VE', '', '', 0);
INSERT INTO profesor VALUES ('04491963', 'YOBEIRA', '', 'VARELA', 'PULIDO', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04530705', 'RUTH', '', 'BLANCO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04703287', 'ANGEL', '', 'ALASTRE', 'PEREZ', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04768469', 'MARINELLA', '', 'LOZADA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04946336', 'FREDDY', '', 'MOLINA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04977183', 'MARIA', '', 'GONZALEZ', 'V', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05024784', 'BELKIS', 'J', 'CONTRERAS', 'G', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05032481', 'LUIS', '', 'RAMIREZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05054721', 'CECILIA', '', 'PORTILLO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05116030', 'MARIA', 'M', 'BRICEÑO', 'B', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05131347', 'SUSANA', 'E', 'SCHULTS', 'B', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05199025', 'MARILU', '', 'CARRILLO', 'D', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05200953', 'RAFAEL', '', 'CAMACHO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05202671', 'GERARDO', '', 'PICON', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05203329', 'FRANCISCO', '', 'QUINTERO', 'R', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05206583', 'ALIZ', '', 'HERNANDEZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05206598', 'ALBERTO', '', 'RODRIGUEZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05206999', 'CARLOS', 'OMAR', 'SANTIAGO', '', '0', '0', '0', '00', 'CARLOSANTI5@HOTMAIL.COM', '0274 2638075', '0414 0786912', 0);
INSERT INTO profesor VALUES ('05307768', 'PEDRO', '', 'CANDELA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05351609', 'ARMANDA', '', 'OJEDA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05435898', 'IRNE', '', 'GIL', 'MATA', '0', '0', '0', '00', 'IRNE11GIL@HOTMAIL.COM', '', '0416 0709031', 0);
INSERT INTO profesor VALUES ('05439749', 'JUAN', 'J', 'ROMAN', 'R', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05446019', 'TERESITA', '', 'MONTOYA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05446471', 'MIRIAN', '', 'YEPEZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05446661', 'GALDYS', '', 'ROJAS', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05485302', 'VIRGILIO', '', 'RODRIGUEZ', 'P', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05509322', 'NIVIA', '', 'LEON', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05654710', 'JUAN', '', 'CACERES', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05654904', 'MIGUEL', '', 'MORENO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05655737', 'MORELA', 'SOLANGE', 'VILLAMIZAR', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05728108', 'IRMA', '', 'RAMIREZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05892364', 'INGRID', '', 'SOSA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('05945180', 'MARIA', 'TERESA', 'MALVACIAS', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('06018398', 'ARNOLDO', '', 'MARQUEZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('06308181', 'ENRIQUE', 'A', 'SALAZAR', 'B', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('06426190', 'ERIBEL', '', 'MARQUINA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('06908190', 'ALEJANDRO', '', 'LIÑAYO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('04472778', 'IGNACIO', 'ALEXIS', 'RODRIGUEZ', 'CARRERO', '0', '0', '0', '01', '', '02742445382', '', 0);
INSERT INTO profesor VALUES ('04484976', 'NELSON', 'ANTONIO', 'CORREDOR', 'TREJO', '0', '0', '0', '01', 'NCORREDORTREJO@GMAIL.COM', '0274 2442582', '', 0);
INSERT INTO profesor VALUES ('04488065', 'JOSE', 'ALEXANDER', 'PEREZ', 'MARQUEZ', '0', '0', '0', '01', 'APMJOSE@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('04488256', 'JUDITH', '', 'ANGARITA', '', '0', '0', '0', '03', '', '', '', 0);
INSERT INTO profesor VALUES ('04488420', 'JOSE', 'BALTAZAR', 'GUERRERO', 'DIAZ', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('04489957', 'ZOILA', 'TERESA', 'SOSA', 'BARRIOS', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('04490481', 'DORIS', 'M', 'MORANTES', 'R', '0', '0', '0', '01', 'MORANTESDORISM@HOTMAIL.COM', '', '0414-0814673', 0);
INSERT INTO profesor VALUES ('04491607', 'JESUS', 'ALFONSO', 'RIVAS', 'CHACON', '0', '0', '0', '01', 'ALFONSORIVAS17@HOTMAIL.COM', '', '0416-9980201', 0);
INSERT INTO profesor VALUES ('04491973', 'ANA', '', 'MUÑOZ', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('04492233', 'GILBERTO', 'VALDEMAR', 'BELANDRIA', 'SARMIENTO', '0', '0', '0', '01', 'BELANSAR57@YAHOO.COM', '', '', 0);
INSERT INTO profesor VALUES ('04492356', 'HUMBERTO', 'EGMIDIO', 'RIVAS', 'RIVAS', '0', '0', '0', '01', 'HRIVAS_2000@YAHOO.ES', '', '', 0);
INSERT INTO profesor VALUES ('04583431', 'CARLOS', 'G', 'MELENDEZ', 'D', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('04633259', 'OMAR', '', 'GUALDRON', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('04589713', 'HENRY', 'BALOY', 'PORRAS', '', '0', '0', '0', '06', 'HENBAPO@HOTMAIL.COM', '02742458034', '04166741960', 0);
INSERT INTO profesor VALUES ('04769890', 'VIRGINIA', 'ELENA', 'RAMIREZ', 'MAGO', '0', '0', '0', '01', 'RVIKY1@HOTMAIL.COM', '', '0416-6741109', 0);
INSERT INTO profesor VALUES ('04953940', 'WILFREDO', '', 'MOLINA', 'G', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('05124273', 'CANTO', '', 'CORRADO', '', '0', '0', '0', '01', 'CCANTOPACHECO@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('05021210', 'CARLOS', 'EVELIO', 'CASTILLO', 'BAUTISTA', '0', '0', '0', '01', 'INGCASTICAR@HOTMAIL.COM', '', '0416-4702766', 0);
INSERT INTO profesor VALUES ('05201622', 'ALBERTO', '', 'ARANGUREN', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('05201033', 'CARMEN', 'JUDITH', 'GRATEROL', 'ROJAS', '0', '0', '0', '06', 'GRATEROLJUDITH@HOTMAIL.COM', '', '0426-8298407', 0);
INSERT INTO profesor VALUES ('05203245', 'ALIS', 'E', 'SANCHEZ', 'V', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('05206267', 'GLADYS', 'COROMOTO', 'AGUILAR', 'GUERRERO', '0', '0', '0', '01', 'GLADYSAGUILAR@HOTMAIL.COM', '', '0414-9772740', 0);
INSERT INTO profesor VALUES ('05206319', 'BELKIS', 'O', 'MARQUEZ', 'O', '0', '0', '0', '01', 'MARQUEZBELKIS@GMAIL.COM', '', '0416-4716426', 0);
INSERT INTO profesor VALUES ('05206372', 'DENIS', '', 'ROMERO', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('05239250', 'GILBERT', '', 'SANTELIZ', '', '0', '0', '0', '01', 'GILBERTSANTELIZ@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('05355610', 'ALFREDO', 'SEGUNDO', 'LUJANO', 'VARELA', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('05447146', 'DOLLY', '', 'CARDOZO', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('05466076', 'ESTEBAN', '', 'BRICEÑO', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('05507269', 'LOURDES', 'F', 'VALVUENA', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('05559793', 'EDITH', 'IRAIZ', 'CALDERON', 'SARAS', '0', '0', '0', '01', 'EICS_AMIGOS@HOTMAIL.COM', '', '0414-7456832', 0);
INSERT INTO profesor VALUES ('05561396', 'MANUEL', 'ANTONIO', 'OLIVEROS', 'CARRUYO', '0', '0', '0', '01', 'MAO5561@HOTMAIL.COM', '0274-2216348', '0426-5580062', 0);
INSERT INTO profesor VALUES ('05660032', 'NANCY', 'TERESA', 'ANTOLINEZ', 'GONZALEZ', '0', '0', '0', '05', 'NANCYTER@GMAIL.COM', '', '0416-7769536', 0);
INSERT INTO profesor VALUES ('05740339', 'CECILIA', 'MAGDALENA', 'GRANADOS', 'DE BRITO', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('05753564', 'SANTO', 'SEGUNDO', 'ROMERO', 'CORONEL', '0', '0', '0', '01', 'VERVHIJA@YAHOO.ES', '', '', 0);
INSERT INTO profesor VALUES ('05794416', 'MARIELA', '', 'MENDOZA', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('05863317', 'OSCAR', 'GERONIMO', 'MUJICA', 'FIGUEROA', '0', '0', '0', '01', 'OSCAR.MUJICA_89@HOTMAIL.COM', '', '0426-5507175', 0);
INSERT INTO profesor VALUES ('06167653', 'JESUS', 'ALECIO', 'ROQUE', 'MORENO', '0', '0', '0', '06', 'CHUYALFA1@GMAIL.COM', '', '0414-0557319', 0);
INSERT INTO profesor VALUES ('05952723', 'LETICIA', 'DEL CARMEN', 'MOGOLLON', 'DE CHALBAUD', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('06547603', 'JUDITH', 'TIBISAY', 'COLINA', 'MIRENA', '0', '0', '0', '01', 'JUDITHC8@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('06558454', 'ANDRES', 'JULIAN', 'FORTI', 'CAVAZZONI', '0', '0', '0', '01', 'AFORTI1963@HOTMAIL.COM, AFORTI@INIA.GOB.VE', '', '', 0);
INSERT INTO profesor VALUES ('06940439', 'ZANDRA', 'VIRGINIA', 'ORTEGA', 'GUERRA', '0', '0', '0', '01', 'ZANDRAVIRGINIA@YAHOO.ES', '', '04146086140', 0);
INSERT INTO profesor VALUES ('06953950', 'ADOLFO', 'JOSE', 'ROMERO', '', '0', '0', '0', '01', 'ADROME67@YAHOO.ES', '', '', 0);
INSERT INTO profesor VALUES ('07199187', 'LUIS', '', 'ORDOÑEZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('07218768', 'ORQUIDEA', '', 'SALINAS', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('07545873', 'ERNESTINA', '', 'GALINDEZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('07725635', 'MARLENE', '', 'GARCIA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('07772181', 'ARTURO', 'L', 'SULBARAN', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08000405', 'WILLIAM', '', 'SARMIENTO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08001969', 'OLGA', '', 'MUÑOZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08004481', 'CIRO', '', 'VALERA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08005373', 'FLOR', 'G', 'GONZALEZ', 'M', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08006286', 'VIVIANA', 'C', 'LOBO', 'D', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08008780', 'JESUS', '', 'MENDEZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08011218', 'JORGE', '', 'MORENO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08011554', 'JOSE', '', 'BRICEÑOI', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08021739', 'SORAIDA', '', 'ANGULO', 'UZCATEGUI', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08022263', 'ARMANDO', 'A', 'PEREZ', 'D', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08023900', 'WISTON', '', 'BELANDRIA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08025259', 'ELENA', '', 'MORA', 'N', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08025261', 'MARY', '', 'MORA', 'N', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08025941', 'JESUS', '', 'MARQUEZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08029052', 'MARIA', '', 'CELIS', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08029795', 'CLARA', '', 'ARELLANO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08031306', 'MANUEL', '', 'FERNANDEZ', 'R', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08031593', 'ORLANDO', 'ALBERTO', 'QUINTERO', 'SUESCUN', '0', '0', '0', '00', 'ORLANDOQUIN2001@YAOO.COM', '', '', 0);
INSERT INTO profesor VALUES ('08031757', 'ANA', 'DEL CARMEN', 'RIVAS', 'RANGEL', '0', '0', '0', '00', '', '', '04149740520', 0);
INSERT INTO profesor VALUES ('08031821', 'ANTONIO', '', 'MARTINEZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08034214', 'ARGELIA', 'DEYANIRA', 'CONTRERAS', 'DAVILA', '0', '0', '0', '00', 'DEYA17@HOTMAIL.COM', '02746350044', '04141796765', 0);
INSERT INTO profesor VALUES ('07383992', 'ELIZABETH', 'DE LA TRINIDAD', 'MONTILLA', 'VALERO', '0', '0', '0', '05', 'LICHA_M20@HOTMAIL.COM', '', '0424-5693293', 0);
INSERT INTO profesor VALUES ('07326064', 'RAMON', 'FERNANDO', 'RIERA', 'TONA', '0', '0', '0', '01', 'RRIERA60@HOTMAIL.COM', '0274-2452722', '0416-6562052', 0);
INSERT INTO profesor VALUES ('07525829', 'CARMEN', 'YSOLINA', 'GUTIERREZ', 'PITTER', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('07648734', 'MARIA', 'TRINIDAD', 'OTALVORA', '', '0', '0', '0', '01', 'OTALVORAMM@HOTMAIL.COM', '0274 2211916', '0414 7459433', 0);
INSERT INTO profesor VALUES ('07775026', 'MARIELA', 'C', 'OLIVEROS', 'C', '0', '0', '0', '01', 'MARIELAOBRACHO@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('07824945', 'THAIS', 'COROMOTO', 'BRACHO', 'URDANETA', '0', '0', '0', '01', 'THAISBRACHO49@GMAIL.COM', '', '0414-7172393', 0);
INSERT INTO profesor VALUES ('07832738', 'MARIA', 'ASUNCION', 'SOCORRO', '', '0', '0', '0', '01', 'MARIASOVE@YAHOO.COM', '', '', 0);
INSERT INTO profesor VALUES ('07934845', 'MARIA', 'CAROLINA', 'MARQUEZ', 'UZCATEGUI', '0', '0', '0', '01', 'MCAROLINAMAR@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('07940076', 'JOSE', 'BONAMI', 'CANDALES', 'PEÑA', '0', '0', '0', '06', '', '', '', 0);
INSERT INTO profesor VALUES ('08000617', 'OMAR', 'ENRRIQUE', 'FERNANDEZ', 'CASTILLO', '0', '0', '0', '01', 'VENAOMAR88@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('08002183', 'LUIS', 'ENRIQUE', 'ROJAS', '', '0', '0', '0', '01', 'ROJASLUIS64@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('08002316', 'JESUS', 'MANUEL', 'SANCHEZ', 'VILLARREAL', '0', '0', '0', '01', 'SANVI_3@HOTMAIL.COM', '', '0414-5416339', 0);
INSERT INTO profesor VALUES ('08002737', 'JOSE', 'JUVENCIO', 'QUINTERO', 'DELGADO', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('08004161', 'MARIA', 'XIOMARA', 'GIL', 'OTAIZA', '0', '0', '0', '01', 'MAXIOGILO12@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('08005159', 'RIGOBERTO', '', 'PAREDES', '', '0', '0', '0', '01', '', '', '04144569878', 0);
INSERT INTO profesor VALUES ('08006388', 'ROMAN', 'ALI', 'MARQUEZ', '', '0', '0', '0', '01', 'TIERRACRUDA@HOTMAIL.COM', '', '0424-7160374', 0);
INSERT INTO profesor VALUES ('08006639', 'JOSE', 'DE JESUS', 'MARQUEZ', '', '0', '0', '0', '01', 'CHEPOMAR@HOTMAIL.COM', '2664709', '0414-7166051', 0);
INSERT INTO profesor VALUES ('08012641', 'ANA', 'TERESA', 'QUINTERO', 'DE RUGGERO', '0', '0', '0', '01', 'ANATQDR@GMAIL.COM', '', '0424-7671634', 0);
INSERT INTO profesor VALUES ('08019784', 'LIRIA', '', 'GUTIERREZ', 'DE ROJAS', '0', '0', '0', '01', 'LIRIOS_GUTIERREZ@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('08013671', 'AIDA', 'DOLORES', 'PEÑA', 'DE PUENTES', '0', '0', '0', '06', 'ARIES_AIDA@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('08020438', 'GENRI', 'A', 'SALI NAS', 'R', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('08020758', 'MARIA', 'GRAZIA', 'MOCCI', 'DERIU', '0', '0', '0', '01', 'CUADRIFOLIUM@YAHOO.COM', '02742667245', '04149721770', 0);
INSERT INTO profesor VALUES ('08021306', 'LUIS', 'APOLINAR', 'ALTUVE', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('08021736', 'ROSA', 'MARIA', 'VASQUEZ', 'FALCON', '0', '0', '0', '01', 'ROSA_MARIAVF@HOTMAIL.COM', '', '0416-2747257', 0);
INSERT INTO profesor VALUES ('08021842', 'JOSE', 'RAMON', 'DIAZ', '', '0', '0', '0', '01', 'joserdiazp@yahoo.es', '', '0274-4176258', 0);
INSERT INTO profesor VALUES ('08022671', 'JOSE ', 'HUMBERTO', 'QUINTERO', 'DAVILA', '0', '0', '0', '01', '', '02742631167', '04147444352', 0);
INSERT INTO profesor VALUES ('08022340', 'JAIRO', 'ALONZO', 'PEREZ', 'RUIZ', '0', '0', '0', '06', 'JAIRO_ALONSO_P_R@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('08024531', 'EMIRO', '', 'RIVAS', 'RIVAS', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('08025750', 'VICTOR', 'MANUEL', 'CONTRERAS', 'CONTRERAS', '0', '0', '0', '01', 'VIMACO7@HOTMAIL.COM', '', '0424-7214303', 0);
INSERT INTO profesor VALUES ('08026122', 'CARLA', '', 'SECCO', 'TRACK', '0', '0', '0', '01', 'CARLASECO@GMAIL.COM', '0274-2447227', '', 0);
INSERT INTO profesor VALUES ('08026155', 'AURA', 'YANIRA', 'SANTANA', 'VIVAS', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('08027408', 'OLGA', 'MARITZA', 'DE FRENZA', 'HERNANDEZ', '0', '0', '0', '01', 'MARIDEFREN@HOTMAIL.COM', '', '0412 6711531', 0);
INSERT INTO profesor VALUES ('08027793', 'JUDIT', '', 'RODRIGUEZ', '', '0', '0', '0', '01', 'RODRIGUEZ.JUDITH593@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('08028204', 'NANCY', 'MARGOT', 'VILLARREAL', 'VILLANUEVA', '0', '0', '0', '01', 'NANAVILLARREAL@GMAIL.COM', '', '04147451751', 0);
INSERT INTO profesor VALUES ('08029045', 'AMNERIS', 'TEOTISTE', 'GUERRERO', 'MOLINA', '0', '0', '0', '01', 'AMNERISGUERRERO@YAHOO.COM', '', '0426-5725885', 0);
INSERT INTO profesor VALUES ('08029075', 'JERSON', 'ORLANDO', 'ZAMBRANO', 'GUERRERO', '0', '0', '0', '01', 'JERSONZAMBRANO@YAHOO.COM', '', '04147170095', 0);
INSERT INTO profesor VALUES ('08029696', 'ANA', 'CRISTINA', 'PACHECO', 'LUGO', '0', '0', '0', '01', 'ANA_CRISTINAPACHECO@HOTMAIL.COM', '', '0416-6740590', 0);
INSERT INTO profesor VALUES ('08031064', 'GLADYS', 'ELENA', 'ARAUJO', 'DIAZ', '0', '0', '0', '01', 'GEAP54@YAHOO.COM', '02742522383', '0416-3795128', 0);
INSERT INTO profesor VALUES ('08032732', 'AURA', 'CECILIA', 'QUINTERO', 'D JESUS', '0', '0', '0', '01', 'AURACQD@HOTMAIL.COM', '', '0414-7466491', 0);
INSERT INTO profesor VALUES ('08034029', 'FRANCISCO', 'ALONSO', 'MARQUEZ', 'SOSA', '0', '0', '0', '01', 'FRANMARQ25@YAHOO.COM', '02742632918', '04149792750', 0);
INSERT INTO profesor VALUES ('08034300', 'PEDRO', 'WILLIAM', 'GONZALEZ', 'GUILLEN', '0', '0', '0', '01', 'PWGG@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('08034371', 'JAVIER', 'ALEXIS', 'TELLEZ', 'GIL', '0', '0', '0', '01', 'JATELL@HOTMAIL.COM', '', '0416-2704767', 0);
INSERT INTO profesor VALUES ('08035484', 'PIO', 'JOSE', 'MUÑOZ', 'ANGULO', '0', '0', '0', '01', 'PJOTA15@HOTMAIL.COM', '0274 22160322', '0416 5762472', 0);
INSERT INTO profesor VALUES ('08037619', 'MIRIAM', 'DEL CARMEN', 'MUÑOZ', 'RAMIREZ', '0', '0', '0', '01', 'PROF_MIRIAM_M@HOTMAIL.COM', '', '04267027698', 0);
INSERT INTO profesor VALUES ('08038332', 'MARJORIE', '', 'UZCATEGUI', '', '0', '0', '0', '01', 'MAYOUZCA@HOTMAIL.COM', '', '0416-7743326', 0);
INSERT INTO profesor VALUES ('08038611', 'FRANK', 'REINALDO', 'RODRIGUEZ', 'CALDERON', '0', '0', '0', '01', 'SRODRIGUEZ@INIA.GOB.VE', '', '', 0);
INSERT INTO profesor VALUES ('10102108', 'YASMELIA', 'DEL CARMEN', 'ZERPA', 'VIELMA', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('08039160', 'JOSE', 'GREGORIO', 'ANGULO', 'RODRIGUEZ', '0', '0', '0', '00', 'GREGORIOANGULO@YAHOO.COM', '0474 2210079', '0416 6740369', 0);
INSERT INTO profesor VALUES ('08040671', 'LEIRA', '', 'MORA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08041985', 'JESUS', '', 'MONTILLA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08045140', 'HERBERT', '', 'MORA', 'NEWMAN', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08081463', 'JOSE', 'MARIO', 'UZCATEGUI', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08081684', 'MARY', '', 'ARAUJO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08458508', 'MARIELA', '', 'RODRIGUEZ', '', '0', '0', '0', '00', 'MARTESAN3@YAHOO.COM', '0274 2218459', '0416 6746377', 0);
INSERT INTO profesor VALUES ('09170633', 'PEDRO', '', 'AREYANO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('09222772', 'NGUYEN', '', 'MANRIQUE', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('09279327', 'LUZ', 'MARINA', 'VASQUEZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('09372327', 'HERIMAR', '', 'QUINTERO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('09398123', 'ALBA', '', 'FUEMAYOR', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('09470586', 'MARIA', '', 'QUINTERO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('09471742', 'ALVIO', '', 'MARQUEZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('09472935', 'VIRGINIA', '', 'RONDON', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('09473824', 'MARIA', 'ADRIANA', 'LOBO', 'DUGARTE', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('09474583', 'YUDITH', '', 'MEZA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('09476548', 'DOUGLAS', '', 'GIL', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('09476680', 'FABIO', '', 'VIELMA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('09496713', 'ELVIRA', '', 'MORENO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('08039498', 'TIBAYRE', '', 'FERNANDEZ', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('08040787', 'RUBEN', 'DARIO', 'VOLCANES', 'CORREDOR', '0', '0', '0', '01', 'RUBENVOLCANES13@HOTMAIL.COM', '0274-2662756', '0426-5710547', 0);
INSERT INTO profesor VALUES ('08041510', 'EMIRO', 'ALFREDO', 'NAVA', 'FLORES', '0', '0', '0', '01', 'EMIRONAVA@HOTMAIL.COM, EMIRONAVA@CANTV.NET', '0274-2633054', '0416-6740835', 0);
INSERT INTO profesor VALUES ('08041620', 'RAMIRO', 'ENRIQUE', 'PRATO', 'VICUÑA', '0', '0', '0', '01', 'RAMIROPRATO@HOTMAIL.COM', '', '0414-7445995', 0);
INSERT INTO profesor VALUES ('08042559', 'JHONNY', 'ENRIQUE', 'SANCHEZ', 'VILLAREAL', '0', '0', '0', '01', 'JHONYSANCHEZV@YAHOO.COM', '', '0414-7179562', 0);
INSERT INTO profesor VALUES ('08044768', 'JORGE', 'LUIS', 'FLORES', 'CALDERON', '0', '0', '0', '01', 'JORGELFLORES5@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('08044725', 'YUDITH', '', 'SANCHEZ', '', '0', '0', '0', '01', 'YUDITSAME@YAHOO.ES,YUDITSAME@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('08045258', 'CARLOS', 'EDUARDO', 'SUESCUM', 'RODRIGUEZ', '0', '0', '0', '01', 'SUESCUM99@HOTMAIL.COM', '0274-2213072', '0414-9793280', 0);
INSERT INTO profesor VALUES ('08045307', 'BELKY', 'COROMOTO', 'SULBARAN', 'MALDONADO', '0', '0', '0', '01', 'BELKY_SULBARAN@YAHOO.COM', '', '0414-7466065', 0);
INSERT INTO profesor VALUES ('08045536', 'RAFAEL', 'EDGARDO', 'AROCHA', 'HERNANDEZ', '0', '0', '0', '06', '', '', '', 0);
INSERT INTO profesor VALUES ('08046408', 'DAVID', 'JOSE', 'FLORES', 'ROJAS', '0', '0', '0', '01', 'INGDAVIDFLORES@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('08046659', 'MILTON', '', 'SILVA', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('08048794', 'GRIZETA', '', 'UZCATEGUI', 'BARRIOS', '0', '0', '0', '01', 'JOANKTP@HOTAMIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('08079222', 'MAGALY', 'ALICIA', 'VALERO', 'DE RODRIGUEZ', '0', '0', '0', '01', 'MAGAVA54@YAHOO.ES', '0274 2522281', '0416 0765906', 0);
INSERT INTO profesor VALUES ('08080375', 'MARIO', '', 'LANZA', 'CAMACARO', '0', '0', '0', '01', 'LANZA.C@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('08080676', 'HERLINDA', 'CECILIA', 'MONTOYA', 'DE HIGUERA', '0', '0', '0', '01', 'LEORIANA@HOTMAIL.COM', '', '04168876722', 0);
INSERT INTO profesor VALUES ('08084432', 'LUZ', 'MARINA', 'RONDON', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('08087415', 'LIBIA', 'Y', 'MARQUEZ', 'C', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('08141857', 'BORIS', 'ASDRUBAL', 'ARROYO', 'VERGARA', '0', '0', '0', '05', 'ARROBOR@YAHOO.ES', '', '04265741327', 0);
INSERT INTO profesor VALUES ('08331149', 'JESUS', '', 'VASQUEZ', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('08336414', 'JOSE', '', 'VASQUEZ', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('08656400', 'PEDRO', '', 'MANZANO', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('08683060', 'LILIAN', 'AURORA', 'PUENTES', 'PEÑA', '0', '0', '0', '01', 'LILIANPUENTES1@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('08720054', 'HENRY', 'EDUARDO', 'GARMENDIA', 'PAREDES', '0', '0', '0', '01', 'HEGP2007@YAHOO.COM', '', '0416-4853146', 0);
INSERT INTO profesor VALUES ('08958864', 'CARLOS', '', 'ROJAS', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('09027962', 'ALCIRA', '', 'MONTERO', 'QUIÑONEZ', '0', '0', '0', '06', '', '', '', 0);
INSERT INTO profesor VALUES ('09028433', 'MARITZA', 'JOSEFINA', 'PEÑA', 'CANDELA', '0', '0', '0', '01', 'MARI_P2005@HOTMAIL.COM', '', '0412 6488488', 0);
INSERT INTO profesor VALUES ('09201868', 'PEDRO', 'ANTONIO', 'MARTINEZ', 'HERRERA', '0', '0', '0', '01', 'MHPA65@HOTMAIL.COM', '', '0412-5499476', 0);
INSERT INTO profesor VALUES ('09081546', 'SIMON', 'DE JESUS', 'HOYO', 'ARAUJO', '0', '0', '0', '06', 'SIMONDJHOYOA@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('09234597', 'PEDRO', '', 'GUTIERREZ', '', '0', '0', '0', '01', 'PEDROGUTIERREZ202@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('09346062', 'YRAIDA', 'YNDIRA', 'CASTILLO', 'CAMARGO', '0', '0', '0', '06', '', '', '', 0);
INSERT INTO profesor VALUES ('09389944', 'CRISTINA', '', 'SANDOVAL', '', '0', '0', '0', '01', 'CRISTINASANDOVALB@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('09472514', 'JOSE', 'LUIS', 'MARQUEZ', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('09473151', 'JAIRO', 'RAMON', 'PEÑA', 'PEÑA', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('09473374', 'FREDY', 'ENRIQUE', 'RIVAS', 'VALERO', '0', '0', '0', '01', 'INGORIVAS@HOTMAIL.COM', '', '0416-5025988', 0);
INSERT INTO profesor VALUES ('09473423', 'IDALBA', 'DEL SOCORRO', 'PEREZ', 'MORA', '0', '0', '0', '01', 'IDALSER@YAHOO.COM', '', '0416-5719995', 0);
INSERT INTO profesor VALUES ('09473567', 'LISBETH', 'JANE', 'DIAZ', 'DE GARCIA', '0', '0', '0', '01', 'LISBETHJANE@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('09473852', 'CARLOS', 'MANUEL', 'SANCHEZ', 'GARCIA', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('09474147', 'LIGIA', '', 'RIVAS', 'MARQUEZ', '0', '0', '0', '01', 'MIGELIEN@YAHOO.COM', '', '', 0);
INSERT INTO profesor VALUES ('09475173', 'YADIRA', 'YELITZA', 'MARQUEZ', 'SANTIAGO', '0', '0', '0', '01', 'YAYMS@HOTMAIL.COM', '02742660082', '04140760466', 0);
INSERT INTO profesor VALUES ('09476031', 'JAVIER', 'ANTONIO', 'CASTILLO', 'TORRES', '0', '0', '0', '01', 'JACT5455@HOTMAIL.COM', '', '0416-4749446', 0);
INSERT INTO profesor VALUES ('09476268', 'LUSBETH', 'DEL VALLE', 'RAMIREZ', 'PALAZZI', '0', '0', '0', '01', 'LULYRP@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('09478674', 'CARLOS', 'ANTONIO', 'ZORDAN', 'ZORDAN', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('09499979', 'RODOLFO', 'JOSE', 'GONZALEZ', 'GOMEZ', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('09501330', 'ORLANDO', 'ANTONIO', 'OBERTO', 'URBINA', '0', '0', '0', '01', 'ORLANDOOBERTO@YAHOO.COM', '', '', 0);
INSERT INTO profesor VALUES ('09678973', 'MARTA', 'ESTELA', 'ERAZO', '', '0', '0', '0', '05', 'MARTHAERASO@HOTMAIL.COM', '', '0416-5708218', 0);
INSERT INTO profesor VALUES ('09906067', 'OMEL', 'JOSE', 'SIFONTES', '', '0', '0', '0', '01', 'OMELSIFONTES@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('09906615', 'TERESA', 'DE JESUS', 'MEDINA', 'DE RODRIGUEZ', '0', '0', '0', '01', 'TERESAMERO@GMAIL.COM', '', '04120759473', 0);
INSERT INTO profesor VALUES ('10087275', 'MARILYN', 'COROMOTO', 'MEDINA', 'LEON', '0', '0', '0', '01', 'MARILYNML_68@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('10092487', 'MIGDALIA', 'BETHSABE', 'MARTINEZ', 'CARRERO', '0', '0', '0', '01', 'MIGBETHSAMAR03@HOTMAIL.COM', '', '0414-7381102', 0);
INSERT INTO profesor VALUES ('10100205', 'GERMAN', '', 'ROJAS', '', '0', '0', '0', '01', 'RGERMAN75@YAHOO.ES', '0274-2214285', '0424-7071381', 0);
INSERT INTO profesor VALUES ('10102820', 'BELEN', '', 'LEON', 'ARAUJO', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('10108462', 'DULCE', '', 'PEÑA', '', '0', '0', '0', '00', '', '', '04147454900', 0);
INSERT INTO profesor VALUES ('10712338', 'LUIS', '', 'SOLORZANO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('10719923', 'LAURA', '', 'CUEVAS', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('10795287', 'JOSE', 'EUGENIO', 'RODRIGUEZ', 'MORENO', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('10896107', 'BLANCA', '', 'GUZMAN', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('10940629', 'NELSON', 'STALIN', 'NAVA', 'ALFONZO', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('11174533', 'RAQUEL', '', 'GONZALEZ', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('11496709', 'JUAN', 'D', 'VARGAS', 'S', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('11959818', 'JESUS', 'GREGORIO', 'SULBARAN', 'ALBARRAN', '0', '0', '0', '00', '', '02744169580', '', 0);
INSERT INTO profesor VALUES ('11959905', 'JHOANA', '', 'TORRES', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('12797606', 'JOSE', '', 'SOTO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('12799845', 'EDITH', '', 'GARCIA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('13014423', 'LUIS', '', 'GUILLEN', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('13017695', 'LORIAN', '', 'PINTO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('10104966', 'RODRIGO', 'JOSE', 'GUILLEN', 'GUILLEN', '0', '0', '0', '01', 'PINTOSALINASVCMERIDA2006@YAHOO.ES, MOROCOIUTE@YAHOO.COM.VE', '', '', 0);
INSERT INTO profesor VALUES ('10108950', 'JAVIER', 'ALBERTO', 'PAREDES', 'QUINTERO', '0', '0', '0', '01', 'JPAREDES71@GMAIL.COM', '', '0426-5729180', 0);
INSERT INTO profesor VALUES ('10109087', 'VERONICA', '', 'SANCHEZ', 'RACHAUS', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('10178133', 'ANGELA', 'ROSSANA', 'UREÑA', '', '0', '0', '0', '05', 'ROSSANAURENA@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('10256095', 'DUBERLIS', 'DEL VALLE', 'GONZALEZ', '', '0', '0', '0', '01', 'DUBERLISG@GMAIL.COM', '', '04141790063', 0);
INSERT INTO profesor VALUES ('10314511', 'DENISSE', 'VICTORIA', 'PAZOS', 'BRICEÑO', '0', '0', '0', '01', 'DENISSEPAZOS@HOTMAIL.COM', '', '0414-1773720', 0);
INSERT INTO profesor VALUES ('10712408', 'WALTER', 'ALEXANDER', 'ESPINOZA', 'RANGEL', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('10713529', 'ROXY', 'COROMOTO', 'GUILLEN', '', '0', '0', '0', '01', 'ROXYCG@GMAIL.COM', '', '0414-7039494', 0);
INSERT INTO profesor VALUES ('10714070', 'KATIUSKA', '', 'MENDEZ', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('10715146', 'RICHARD', '', 'MAGGIORANI', '', '0', '0', '0', '01', 'RICHARD.MAGGIORANI@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('10715404', 'JOSE', 'GREGORIO', 'MALDONADO', 'SANTIAGO', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('10718393', 'MAYULY', 'COROMOTO', 'VILLAMIZAR', 'ARAQUE', '0', '0', '0', '01', '', '02742210348', '', 0);
INSERT INTO profesor VALUES ('10718091', 'OMAR', 'ALONZO', 'BALZA', 'CARRILLO', '0', '0', '0', '01', 'BALZAOMAR@HOTMAIL.COM', '0274-4166125', '0424-7728962', 0);
INSERT INTO profesor VALUES ('10720364', 'JOSE', 'TIMOTEO', 'MILLA', 'MONSALVE', '0', '0', '0', '01', 'MILLAMJO@ULA.VE, MILLAMJO@HOTMAIL.COM, ILLAMJO@HOTMAIL.COM', '', '0414 9797481', 0);
INSERT INTO profesor VALUES ('10797122', 'ROSANELA', '', 'GALINDO', 'CHIRINOS', '0', '0', '0', '01', 'ROSANELA.GALINDO@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('10898072', 'ALBER', '', 'ROMERO', '', '0', '0', '0', '01', 'ALBER_ROMERO@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('11067484', 'ANNELINE', '', 'ALVARADO', 'MACHADO', '0', '0', '0', '01', 'annelinea@gmail.com', '', '', 0);
INSERT INTO profesor VALUES ('11108398', 'OLGA', 'INES', 'CONTRERAS', 'RODRIGUEZ', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('11215098', 'ENEXIS', 'JOSE', 'ANTUNEZ', 'CHOURIO', '0', '0', '0', '01', 'ENEXISANT@YAHOO.ES', '', '04147179456', 0);
INSERT INTO profesor VALUES ('11303172', 'MONICA', 'A.', 'ROSCIANO', 'TOLOSA', '0', '0', '0', '01', 'MONICAROSCIANO23@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('11319364', 'MARILU', '', 'ANDARA', 'CASTELLANO', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('11460000', 'ESTHER', 'ZULAY', 'ROSAS', 'LOBO', '0', '0', '0', '01', 'EROSASLOBO@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('11460813', 'SULY', 'COROMOTO', 'CONTRERAS', 'FERNANDEZ', '0', '0', '0', '01', 'YLUS8@YAHOO.ES', '', '', 0);
INSERT INTO profesor VALUES ('11462979', 'MARTHA', 'IVONNE', 'TRIANA', 'VARGAS', '0', '0', '0', '01', '', '02742715952', '04247145086', 0);
INSERT INTO profesor VALUES ('11465653', 'WENDY', 'DEL CARMEN', 'SALAS', 'AVENDAÑO', '0', '0', '0', '01', 'WENDYSA_W10@YAHOO.COM', '', '', 0);
INSERT INTO profesor VALUES ('11466224', 'JIMI', 'JOSE', 'QUINTERO', 'DUGARTE', '0', '0', '0', '01', 'JJIMIQ@GMAIL.COM, J_JIMIQ@GMAIL.COM', '02742635434', '04147555034', 0);
INSERT INTO profesor VALUES ('11467397', 'YASMELI', '', 'PERNIA', 'DE CARDOZA', '0', '0', '0', '01', 'ONDASINFANTILES@HOTMAIL.COM', '', '04141793292', 0);
INSERT INTO profesor VALUES ('11467713', 'DOUGLAS', 'JOSE', 'NOGUERA', 'GOMEZ', '0', '0', '0', '01', 'DNOGUERA2005@GMAIL.COM', '', '0414-5425457', 0);
INSERT INTO profesor VALUES ('11468201', 'LOREN ', 'DEL VALLE', 'AROCHA', 'HERNANDEZ', '0', '0', '0', '01', 'AROCHALOREN@HOTMAIL.COM', '02712217283', '04242636665', 0);
INSERT INTO profesor VALUES ('11705856', 'CARLOS', 'LUIS', 'SARMIENTO', 'FERNANDEZ', '0', '0', '0', '01', 'SARMIENTO.11@GMAIL.COM', '02742213623', '04165763133', 0);
INSERT INTO profesor VALUES ('11783461', 'MARIA', '', 'VENEGAS', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('11912316', 'AMELYREN', '', 'BASABE', '', '0', '0', '0', '01', 'AMELYRENBASABE@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('11952770', 'LUCY', 'MARGARITA', 'NAVA', 'MONSALVE', '0', '0', '0', '01', 'NAVALUCY@YAHOO.COM', '', '04145775471', 0);
INSERT INTO profesor VALUES ('11954144', 'ANTONIO', 'JOSE', 'MONTILLA', 'MONTILLA', '0', '0', '0', '01', 'EANTONIOJOSEMONTILLA@GMAIL.COM', '0424 7721070', '0426 5719369', 0);
INSERT INTO profesor VALUES ('11956576', 'AGNI', 'CAROLINA', 'SARACHE', 'BALZA', '0', '0', '0', '01', 'CAROLINA_SARACHE@YAHOO.ES,CAROLINA_SARACHE@HOTMAIL.COM', '0274-2664556', '0416-4708970', 0);
INSERT INTO profesor VALUES ('11959505', 'ZIOLY', 'D.', 'CALDERON', '', '0', '0', '0', '01', 'ZIOCADY@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('11960173', 'EDGAR', 'ALEXANDER', 'ROSALES', 'RUBIO', '0', '0', '0', '01', 'EDWSALEX@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('12048353', 'ALEJANDRO', 'MIGUEL', 'OCHOA', '', '0', '0', '0', '01', 'ALEJANDROMIGUEL31@YAHOO.ES,  ALEJANDROMIGUEL31@GMAIL.COM', '0274-2620175', '04165028872', 0);
INSERT INTO profesor VALUES ('12329797', 'OMAR', 'JAVIER', 'VALERO', 'ALEJO', '0', '0', '0', '05', 'OJVALERO@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('12346208', 'RAIZA', 'COROMOTO', 'ESCALONA', 'SALINAS', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('12352023', 'YENNY', 'CARIBAY', 'ARAUJO', 'GUILLEN', '0', '0', '0', '01', 'YENNYGUI@HOTMAIL.COM', '', '0412-5499346', 0);
INSERT INTO profesor VALUES ('12353031', 'GEORGE', 'DE JESUS', 'GONZALEZ', 'GONZALEZ', '0', '0', '0', '01', 'CCCLESIASTICUM@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('12353451', 'YNMACULADA', 'NEVISCA', 'QUINTERO', 'BRAVO', '0', '0', '0', '01', 'MACUQ@YAHOO.COM', '0274-2212702', '0416-7742683', 0);
INSERT INTO profesor VALUES ('12458260', 'YOSMAR', 'ENRRIQUE', 'SULBARAN', 'GARCIA', '0', '0', '0', '01', 'SYOSMAR@GMAIL.COM', '', '0426-5758267', 0);
INSERT INTO profesor VALUES ('12776731', 'ALVARO', '', 'PEÑA', 'PEÑA', '0', '0', '0', '01', 'ALPE02@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('12779069', 'VIORALBA', '', 'CALDERON', 'ASEBEDO', '0', '0', '0', '01', 'VIORALBAC@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('12779975', 'LEWING', 'EDUARDO', 'RANGEL', 'NAVA', '0', '0', '0', '01', 'LEDWIGH_ERN@HOTMAIL.COM', '', '0426-5738282', 0);
INSERT INTO profesor VALUES ('12817844', 'JOSE', 'ISAIAS', 'CURVELO', 'GOMEZ', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('12839616', 'ANGEL', 'DARIO', 'PAEZ', 'VALENCILLOS', '0', '0', '0', '05', 'DEPORTESAP@HOTMAIL.COM', '', '0416-4712058', 0);
INSERT INTO profesor VALUES ('13013152', 'ALEJANDRO', '', 'ROJAS', 'CEBALLOS', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('13014569', 'NELMA', '', 'UZCATEGUI', 'DE BARRETO', '0', '0', '0', '01', 'REDES.ASESORIA@GMAIL.COM', '', '0414-7416984', 0);
INSERT INTO profesor VALUES ('13014707', 'MEIGLYN', 'COROMOTO', 'ANGULO', 'ANGULO', '0', '0', '0', '01', 'MEIGLYNANGULO@GMAIL.COM', '', '04162782958', 0);
INSERT INTO profesor VALUES ('13098188', 'JOSE', 'GREGORIO', 'PEREZ', 'MORA', '0', '0', '0', '01', 'PEREZMORAJG@CANTV.NET', '0274-2210845', '0416-3732589', 0);
INSERT INTO profesor VALUES ('13098422', 'LEVIS', 'ARNALDO', 'QUINTERO', 'TREJO', '0', '0', '0', '01', 'LEVISQ25@HOTMAIL.COM', '2452466', '04165762470', 0);
INSERT INTO profesor VALUES ('13099230', 'DENY', '', 'AVENDAÑO', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('13803898', 'ANA', 'MARIA', 'CONTRERAS', 'MARQUEZ', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('15234461', 'LISANDRO', 'EDUARDO', 'USECHE', 'MACIAS', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('15913325', 'LUZ', 'MARIA', 'GONZALEZ', 'SIERRA', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('16445105', 'RAUL', 'ALEJANDRO', 'CARNEVALI', 'GARCIA', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('16657360', 'YAJAIRA', '', 'IBARRA', '', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('16680396', 'JUAN', 'ROMAN', 'ROMAN', 'RAMOS', '0', '0', '0', '00', '', '', '', 0);
INSERT INTO profesor VALUES ('13098948', 'FEDERICO', '', 'DEL CURA', 'DELGADO', '0', '0', '0', '01', 'FEDERICO.DELCURA@GMAIL.COM', '', '0416-7759881', 0);
INSERT INTO profesor VALUES ('13099384', 'JOSE', 'MELANIO', 'PEÑA', 'SANCHEZ', '0', '0', '0', '01', 'JOMEPESAS@HOTMAIL.COM', '', '0426-7799987', 0);
INSERT INTO profesor VALUES ('13477378', 'SUSANA', 'DEL PILAR', 'BRICEÑO', 'JAIMES', '0', '0', '0', '01', 'SUSANABJ@GMAIL.COM', '02747903567', '04247259745', 0);
INSERT INTO profesor VALUES ('13524109', 'DARWIN', 'JAVIER', 'PERNIA', 'RODRIGUEZ', '0', '0', '0', '01', 'DARWINPERNIA@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('13524820', 'LISBETH', 'FABIOLA', 'RIVAS', 'VIELMA', '0', '0', '0', '01', 'FABIOLARIVAS17777@GMAIL.COM', '02742214331', '04167749828', 0);
INSERT INTO profesor VALUES ('13525905', 'MARIELBA', '', 'OBALLOS', 'BENAVIDES', '0', '0', '0', '01', 'OBALLOSM@YAHOO.ES,OBALLOSM@HOTMAIL.COM', '', '0414-7202547', 0);
INSERT INTO profesor VALUES ('13649962', 'YIMI', 'LEANDRO', 'MARQUEZ', '', '0', '0', '0', '01', 'MARQUEZYIMI@HOTMAIL.COM', '', '04265731501', 0);
INSERT INTO profesor VALUES ('13723698', 'AIDA', 'VIDALINA', 'AVILA', 'ZAVALA', '0', '0', '0', '01', 'AIDIVI@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('13803490', 'HEIDY', 'DAYANA', 'BITORAJES', 'DIAZ', '0', '0', '0', '01', 'ABRAMOVIC@HOTMAIL.COM, ABRAMOVIC2002@HOTMAIL.ES', '', '0416-2924280', 0);
INSERT INTO profesor VALUES ('13947142', 'YUNE', 'PAULA', 'NOVOA', 'CACERES ', '0', '0', '0', '05', 'YUNENOVOA@HOTMAIL.COM', '', '042-68795453', 0);
INSERT INTO profesor VALUES ('13966054', 'ANNA', 'YUSMARIE', 'DUGARTE', 'SANCHEZ', '0', '0', '0', '01', 'DUGARTEA@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('13966605', 'NERVIS', 'NAKARY', 'CARRILLO', 'SANTIAGO', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('13967486', 'MERVIN', 'JAVIER', 'MARQUEZ', 'QUINTERO', '0', '0', '0', '01', 'MERVIN_MARQUEZ@YAHOO.ES', '', '0424-7372826', 0);
INSERT INTO profesor VALUES ('14249554', 'RUBEN', 'DARIO', 'BOSCAN', 'SANCHEZ', '0', '0', '0', '06', '', '', '', 0);
INSERT INTO profesor VALUES ('14131053', 'ANA', 'LUCIA', 'ANGULO', 'BONILLA', '0', '0', '0', '06', '', '', '', 0);
INSERT INTO profesor VALUES ('14267842', 'ERNESTO', '', 'VERGARA', 'MONTOYA', '0', '0', '0', '01', 'ERNESTOVERGARA@HOTMAIL.COM', '', '0416-3793398', 0);
INSERT INTO profesor VALUES ('14268612', 'HUGO', 'JOSE', 'CERRADA', 'MARQUEZ', '0', '0', '0', '01', 'HUGOCERRADA@HOTMAIL.COM, HUGOCERRADA@GMAIL.COM', '0274-2442691', '0414-7459824', 0);
INSERT INTO profesor VALUES ('14400087', 'ALEIXANDRE', 'DENNISON', 'VILLARROEL', 'GOMEZ', '0', '0', '0', '01', 'ALDEVIGO@GMAIL.COM', '', '0414-1794286', 0);
INSERT INTO profesor VALUES ('14340058', 'CARLOS', 'ALBERTO', 'COLMENARES', 'BRAVO', '0', '0', '0', '01', 'CARLOSCOME80@YAHOO.ES', '', '0414 -5708419', 0);
INSERT INTO profesor VALUES ('14401340', 'MAYRA', '', 'PEÑA', 'RODRIGUEZ', '0', '0', '0', '01', 'MAYPE123@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('14589222', 'YAMMY', 'KARELYS', 'GUILLEN', '', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('14700296', 'JENNY', 'KATHERINNE', 'OSORIO', 'ALBARRAN', '0', '0', '0', '01', 'KATH97355@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('14839454', 'LILIANA', 'ELVIRA', 'URBINA', 'DIAZ', '0', '0', '0', '01', 'ELVIREX@HOTMAIL.COM', '', '0414-5425457', 0);
INSERT INTO profesor VALUES ('14866857', 'JOSE', 'VICENTE', 'RUIZ', '', '0', '0', '0', '05', '', '', '', 0);
INSERT INTO profesor VALUES ('14917178', 'JOHANNNA', 'YECENIA', 'GOMEZ', 'ALVAREZ', '0', '0', '0', '01', 'JOHANNNA.GA@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('14917365', 'JOHAN', 'ALEJANDRO', 'ZERPA', 'TORRES', '0', '0', '0', '01', 'JAZT23@HOTMAIL.COM', '', '0426-7730348', 0);
INSERT INTO profesor VALUES ('15142314', 'PABLO', 'MARTIN', 'SILGUERO', 'SOTO', '0', '0', '0', '01', 'PABLOSILGUERO@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('14917541', 'EMY', 'CAROLINA', 'LINERO', 'ROMERO', '0', '0', '0', '06', '', '', '', 0);
INSERT INTO profesor VALUES ('15175795', 'SILVIA', 'JOSEFINA', 'GONZALEZ', 'FERNANDEZ', '0', '0', '0', '01', 'SILVIAJ9730@HOTMAIL.COM', '', '0416-0988076', 0);
INSERT INTO profesor VALUES ('15175939', 'BELKYS', 'MARGARITA', 'CASTILLO', 'RIVAS', '0', '0', '0', '01', 'PROF.BELMCR@GMIAL.COM', '', '', 0);
INSERT INTO profesor VALUES ('15223533', 'SAUL', 'ELIAS', 'GUAIMARA', 'RONDON', '0', '0', '0', '01', 'SAELIG@HOTMAIL.COM', '', '04247194467', 0);
INSERT INTO profesor VALUES ('15381185', 'RUTH', 'MELANIA', 'CASTILLO', 'OMAÑA', '0', '0', '0', '01', 'RUTHMELANIA82@YAHOO.COM', '', '04166469011', 0);
INSERT INTO profesor VALUES ('15454602', 'VERONICA', 'MARIA', 'FUENMAYOR', 'CORREA', '0', '0', '0', '01', 'FUEVERONICA@GMAIL.COM', '', '04161477348', 0);
INSERT INTO profesor VALUES ('15516303', 'HEBERT', 'JOEL', 'AVENDAÑO', 'LA CRUZ', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('15516332', 'KATHERIN', 'JOAN', 'TREJO', 'PERNIA', '0', '0', '0', '01', 'JOANKTP@YAHOO.COM', '', '0414-1792774', 0);
INSERT INTO profesor VALUES ('15565857', 'NORKYS', 'MAGALY', 'BUSTOS', 'ZAMBRANO', '0', '0', '0', '01', 'NORKYSBUSTO@HOTMAIL.COM', '', '0414-0802546', 0);
INSERT INTO profesor VALUES ('15622903', 'LEIDA ', 'TAMARA', 'SALCEDO', 'PEÑALOZA', '0', '0', '0', '01', 'LEIDATSALCEDO@GMAIL.COM', '02746574546', '04265712890', 0);
INSERT INTO profesor VALUES ('15754922', 'JORGE', 'LUIS', 'ALTUVE', '', '0', '0', '0', '01', 'JORGELUISALTUVE@YAHOO.ES', '', '', 0);
INSERT INTO profesor VALUES ('15754311', 'KEIBYS', 'EDUARDO', 'COLMENARES', '', '0', '0', '0', '01', 'COLMENARES.KEIBYS@GMAIL.COM', '', '04168750063', 0);
INSERT INTO profesor VALUES ('15756979', 'MARIA', 'JOSE', 'SALAS', 'MEDINA', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('15920086', 'DANIEL', 'RICARDO', 'SALAS', 'CONTRERAS', '0', '0', '0', '01', 'DANIELS2030@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('15920291', 'JORGE', 'GUILLERMO', 'ANGULO', 'SALAZAR', '0', '0', '0', '01', 'ALE_ALITO8_@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('15921593', 'BELISARIO', '', 'TORO', '', '0', '0', '0', '01', 'TORO_AI@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('16020374', 'CATERLING', 'VANESSA', 'MELENDEZ', 'MONTOYA', '0', '0', '0', '01', 'CATERLING_M@HOTMAIL.COM', '', '0414-9790618', 0);
INSERT INTO profesor VALUES ('16285988', 'LUISANA', '', 'FONSECA', 'CADENAS', '0', '0', '0', '01', 'LUISANAFONSECA12@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('16377291', 'YOSMELY', '', 'RAMIREZ', '', '0', '0', '0', '01', 'YOSMELY_RAMIREZ@HOTMAIL.COM', '', '0416-4704092', 0);
INSERT INTO profesor VALUES ('16514402', 'EDUARDO', 'ISMAEL', 'NOGUERA', 'PALENCIA', '0', '0', '0', '05', 'EINOGUERAP@HOTMAIL.COM, EINOGUERAP@GMAIL.COM', '', '0414-5679393', 0);
INSERT INTO profesor VALUES ('16964770', 'SARAI', 'MARGARITA', 'SOJO', 'PORTILLO', '0', '0', '0', '01', 'SARFER60@HOTMAIL.COM', '', '04147425566', 0);
INSERT INTO profesor VALUES ('17130729', 'ONELIA', 'KARINA', 'FERNANDEZ', 'SOSA', '0', '0', '0', '01', 'ONEFS@HOTMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('17129511', 'YULY', 'SOFIA', 'QUINTERO', 'FLORES', '0', '0', '0', '06', '', '', '', 0);
INSERT INTO profesor VALUES ('17238348', 'CARLA', 'VANESSA', 'PACHECO', 'GUERRERO', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('17456574', 'MANUEL', 'ALBERTO', 'LUJAN', 'ANZOLA', '0', '0', '0', '01', 'LUJANOANZOLA@YAHOO.COM', '', '', 0);
INSERT INTO profesor VALUES ('17499585', 'MARIANA', 'ALEJANDRA', 'PEREZ', 'ROMERO', '0', '0', '0', '01', 'MARIANAPEREZ908@GMAIL.COM', '', '04265583956', 0);
INSERT INTO profesor VALUES ('17456954', 'MAHICETH', 'CECILIA', 'QUINTERO', 'VALERO', '0', '0', '0', '01', 'MAHICETH.QUINTERO@GMAIL.COM', '', '0416-1194076', 0);
INSERT INTO profesor VALUES ('17521578', 'YENNY', 'SHARINA', 'BUSTAMANTE', 'PUCCINI', '0', '0', '0', '01', 'YENBUST@GMAIL.COM', '', '0426-5363050', 0);
INSERT INTO profesor VALUES ('16199115', 'ELIO', 'D'' JESUS', 'RAMIREZ', 'CRUCES', '0', '0', '0', '01', '', '', '0416-3769937', 0);
INSERT INTO profesor VALUES ('17523454', 'MERILIN', 'LILIANA', 'MONSALVE', 'ROJAS', '0', '0', '0', '01', 'MERILINMONSALVE@HOTMAIL.COM', '', '04247523196', 0);
INSERT INTO profesor VALUES ('17664938', 'YESSIKA', 'CAROLYN', 'SAIZ', 'VIELMA', '0', '0', '0', '01', 'UPTM_ING_YESSIKA_SAIZ@HOTMAIL.COM', '02742217626', '041436742428', 0);
INSERT INTO profesor VALUES ('17769834', 'CARLA', 'PATRICIA', 'MELENDEZ', 'MONTOYA', '0', '0', '0', '01', 'CARLA.PMM@GMAIL.COM', '', '04264285173', 0);
INSERT INTO profesor VALUES ('17770813', 'DELFIN', 'ALEXANDER', 'MOLINA', 'MARQUEZ', '0', '0', '0', '06', '', '', '', 0);
INSERT INTO profesor VALUES ('18310574', 'ANGEL', 'GRABIEL', 'ALBORNOZ', 'RIVAS', '0', '0', '0', '06', 'ANGEL_15_1986@HOTMAIL.COM', '', '0416-0758247', 0);
INSERT INTO profesor VALUES ('18581024', 'HUMBERTO', 'JOSE', 'GELVES', 'MOLINA', '0', '0', '0', '01', 'HUMBERTOG18@HOTMAIL.COM', '', '04141272004', 0);
INSERT INTO profesor VALUES ('18796815', 'GUSTAVO', 'ARMANDO', 'RIVAS', 'RANGEL', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('18796996', 'WALTER', 'ALCIBIADES', 'RIVAS', 'CUEVAS', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('18962414', 'MANUEL', 'ANTONIO', 'OLIVEROS', 'OMAÑA', '0', '0', '0', '06', 'MAOOS2414@HOTMAIL.COM', '', '04121695339', 0);
INSERT INTO profesor VALUES ('19421996', 'BECKY', 'LILIBETH', 'SOSA', 'DUQUE', '0', '0', '0', '01', 'BECKYSOSA@GMAIL.COM', '', '0414-7340911', 0);
INSERT INTO profesor VALUES ('19440209', 'JUAN', 'PABLO', 'BRACHO', 'OLIVEROS', '0', '0', '0', '06', 'JUPABRAO@GMAIL.COM', '', '04265728983', 0);
INSERT INTO profesor VALUES ('81423693', 'MAURICIO', 'ALEJANDRO', 'RAVANAL', 'ZEPEDA', '0', '0', '0', '01', 'MAURICIO.RAVANAL@GMAIL.COM', '', '0414-7160365', 0);
INSERT INTO profesor VALUES ('12345678', 'NOMBRE', '', 'APELLIDO', '', '0', '0', '0', '01', 'CORREO@SERVIDOR.COM', '01231234567', '02741234567', 0);
INSERT INTO profesor VALUES ('14786139', 'JOSE', 'EDUARDO', 'MONTERO', 'RIVAS', '0', '0', '0', '01', '', '', '', 0);
INSERT INTO profesor VALUES ('87654321', 'NOMBRE', NULL, 'APELLIDO', NULL, '0', '0', '0', '01', NULL, NULL, NULL, 0);
INSERT INTO profesor VALUES ('09240195', 'MIGUEL', '', 'ACEVEDO', '', '0', '0', '0', '01', '1AA.MIGUEL@GMAIL.COM,MIGUELAA1@CANTV.NET', '', '', 0);
INSERT INTO profesor VALUES ('14400356', 'MARIA', 'EUGENIA', 'ACOSTA', 'GARCIA', '0', '0', '0', '01', 'MARUAG22@HOTMAIL.COM', '', '0424-7013663', 0);
INSERT INTO profesor VALUES ('14916156', 'YAMILE', 'MERCEDES', 'ALAM', 'PASTOR', '0', '0', '0', '01', 'YMAP1999@YAHOO.COM', '', '0416-3796721', 0);
INSERT INTO profesor VALUES ('08047120', 'DIONY', '', 'ALVIAREZ', '', '0', '0', '0', '01', 'GDIONY@YAHOO.ES', '', '', 0);
INSERT INTO profesor VALUES ('07509507', 'LORENZO', '', 'VASQUEZ', '', '0', '0', '0', '01', 'NATABIR@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('05655983', 'BLANCA', '', 'ALVIAREZ', '', '0', '0', '0', '01', 'BLANCALVI@GMAIL.COM', '', '', 0);
INSERT INTO profesor VALUES ('13648603', 'RAQUEL', 'AILYN', 'ZAMBRANO', 'DE PASCARELLA', '0', '0', '0', '01', 'RAQUELZAMBRANO@HOTMAIL.COM', '', '', 0);


--
-- Data for Name: seccion; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO seccion VALUES ('A');
INSERT INTO seccion VALUES ('B');
INSERT INTO seccion VALUES ('C');
INSERT INTO seccion VALUES ('D');


--
-- Data for Name: sede; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO sede VALUES ('01', 'EJIDO', 'AV. NOVIEMBRE', '0274-2210746', '2009-03-03');
INSERT INTO sede VALUES ('02', 'SANTA JUANA', 'SECTOR SANTA JUANA, MERIDA', 'SIN ASIGNAR', '2009-03-03');
INSERT INTO sede VALUES ('03', 'BAILADORES', 'BAILADORES', 'SIN ASIGNAR', '2009-03-03');
INSERT INTO sede VALUES ('04', 'TUCANI', 'TUCANI', 'SIN ASIGNAR', '2009-03-03');
INSERT INTO sede VALUES ('05', 'EXT. BARINAS', 'BARINAS', 'SIN ASIGNAR', '2009-11-12');
INSERT INTO sede VALUES ('06', 'EXT SANTA LUCIA', 'SANTA LUCIA', 'SIN ASIGNAR', '2010-09-25');
INSERT INTO sede VALUES ('07', 'EXT. EL VIGIA', 'EL VIGIA', 'SIN ASIGNAR', '2013-01-01');
INSERT INTO sede VALUES ('00', 'SIN ASIGNAR', 'SIN ASIGNAR', 'SIN ASIGNAR', '1970-01-01');


--
-- Data for Name: uc; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO uc VALUES ('AGAGE242', 'AGROEPISTEMOLOGÍA', '2', '2', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGANA262', 'ALIMENTACIÓN Y NUTRICIÓN ANIMAL ALTERNATIVA', '2', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGATMA242', 'APLICACIÓN DE TÉCNICAS Y METODOLOGÍAS AGROECOLOGICAS', '2', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGATMA242', 'APLICACIÓN DE TÉCNICAS Y METODOLOGÍAS AGROECOLOGICAS', '2', '3', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGATMA246', 'TÉCNICAS Y METODOLOGÍAS AGROECOLOGICAS', '2', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGBFSPV242', 'BOTÁNICA, FISIOLOGÍA Y SISTEMAS DE PRODUCCIÓN VEGETAL', '2', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGBFSPV242', 'BOTÁNICA, FISIOLOGÍA Y SISTEMAS DE PRODUCCIÓN VEGETAL', '2', '3', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('ADM6032', 'ADMINISTRACIÓN DE MERCADEO', '3', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('AGANA342', 'ALIMENTACIÓN Y NUTRICIÓN ANIMAL ALTERNATIVA', '3', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGANM342', 'ANÁLISIS MATEMÁTICO', '3', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGANM362', 'ANÁLISIS MATEMÁTICO', '3', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGGAE342', 'GESTIÓN AGROECOLÓGICA', '3', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGGAE362', 'GESTIÓN AGROECOLÓGICA', '3', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AEPS6033', 'ELECTIVA III: ADM DE EMPRESAS DE PRODUCCION Y PROPIEDAD SOCI', '4', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('AGECC442', 'ECOCONSTRUCCIONES', '4', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGPEP442', 'PEDAGOGÍA Y POLÍTICA', '4', '2', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGSPV262', 'SISTEMAS DE PRODUCCION VEGETAL', '2', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGZFSPA242', 'ZOOLOGÍA, FISIOLOGÍA Y SISTEMAS DE PRODUCCIÓN ANIMAL', '2', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGZFSPA242', 'ZOOLOGÍA, FISIOLOGÍA Y SISTEMAS DE PRODUCCIÓN ANIMAL', '2', '3', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('COC9023', 'CONTABILIDAD DE COSTOS', '2', '2', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('CON12024', 'CONTABILIDAD II', '2', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('CON12024', 'CONTABILIDAD II', '2', '3', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('CON15025', 'CONTABILIDAD II', '2', '2', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('CON15025', 'CONTABILIDAD II', '2', '3', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('CON9023', 'CONTABILIDAD II', '2', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('DCCTT2-1445', 'DESARROLLO Y CALIDAD DE VIDA DE LAS COMUNIDADES TURISTICAS', '2', '2', 0, 0, '5', '06', 1, '0');
INSERT INTO uc VALUES ('DCCTT2-1445', 'DESARROLLO Y CALIDAD DE VIDA DE LAS COMUNIDADES TURISTICAS', '2', '3', 0, 0, '5', '06', 1, '0');
INSERT INTO uc VALUES ('DIAGINAU-245', 'DIAGNOSTICO E INTERVENCION AUDITIVA I', '2', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINAU-245', 'DIAGNOSTICO E INTERVENCION AUDITIVA I', '2', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINHA-256', 'DIAGNOSTICO E INTERVENCION DEL HABLA', '2', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINHA-256', 'DIAGNOSTICO E INTERVENCION DEL HABLA', '2', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINLE-256', 'DIAGNOSTICO E INTERVENCION DEL LENGUAJE I', '2', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINLE-256', 'DIAGNOSTICO E INTERVENCION DEL LENGUAJE I', '2', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('AGPFIII3126', 'PROYECTO FORMATIVO III', '3', '2', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFIII3126', 'PROYECTO FORMATIVO III', '3', '3', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFIII3166', 'PROYECTO FORMATIVO III', '3', '2', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFIII3166', 'PROYECTO FORMATIVO III', '3', '3', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPSLC342', 'PENSAMIENTO SOCIOPOLÍTICO LATINOAMERICANO Y DEL CARIBE', '3', '2', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGSPA262', 'SISTEMAS DE PRODUCCIÓN ANIMAL', '3', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AUD9033', 'AUDITORIA I', '3', '2', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('DAR9033', 'DEPORTE ARTE Y RECREACIÓN II', '3', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('DEPORECR-322', 'DEPORTE Y RECREACION', '3', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DEPORECR-322', 'DEPORTE Y RECREACION', '3', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINAU-345', 'DIAGNOSTICO E INTERVENCION AUDITIVA II', '3', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINAU-345', 'DIAGNOSTICO E INTERVENCION AUDITIVA II', '3', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINLE-345', 'DIAGNOSTICO E INTERVENCION DEL LENGUAJE II', '3', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINLE-345', 'DIAGNOSTICO E INTERVENCION DEL LENGUAJE II', '3', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINVO-345', 'DIAGNOSTICO E INTERVENCION DE LA VOZ I', '3', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINVO-345', 'DIAGNOSTICO E INTERVENCION DE LA VOZ I', '3', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('AGPFIV41', 'PROYECTO FORMATIVO IV', '4', '2', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFIV41', 'PROYECTO FORMATIVO IV', '4', '3', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFIV4166', 'PROYECTO FORMATIVO IV', '4', '2', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFIV4166', 'PROYECTO FORMATIVO IV', '4', '3', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGSCSNI442', 'SISTEMAS DE CERTIFICACIÓN SOCIAL NACIONAL E INTERNACIONAL', '4', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('APUALC15045', 'ADM EN LOS PROCESOS DE UNIDAD DE AMÉRICA LATINA EL CARIBE', '4', '2', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('APUALC15045', 'ADM EN LOS PROCESOS DE UNIDAD DE AMÉRICA LATINA EL CARIBE', '4', '3', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('AUD9043', 'AUDITORIA II', '4', '2', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('COE9043', 'CONTABILIDAD ESPECIALIZADA', '4', '2', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('DIAGINAU-457', 'DIAGNOSTICO E INTERVENCION AUDITIVA III', '4', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINAU-457', 'DIAGNOSTICO E INTERVENCION AUDITIVA III', '4', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINVO-447', 'DIAGNOSTICO E INTERVENCION DE LA VOZ II', '4', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINVO-447', 'DIAGNOSTICO E INTERVENCION DE LA VOZ II', '4', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('ELEC19023', 'ELECTIVA I', '2', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('ELEC29023', 'ELECTIVA II', '2', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('ELECTIVA-222', 'ELECTIVA II', '2', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('ELECTIVA-222', 'ELECTIVA II', '2', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('ESMD15025', 'ECONOMÍA, SUSTENTABILIDAD Y MODELOS DE DESARROLLO', '2', '2', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('ESMD15025', 'ECONOMÍA, SUSTENTABILIDAD Y MODELOS DE DESARROLLO', '2', '3', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('FSC18026', 'FORMACION SOCIO CRITICA II', '2', '2', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('FSC18026', 'FORMACION SOCIO CRITICA II', '2', '3', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('IDIOT2-2167', 'IDIOMAS II', '2', '2', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('IDIOT2-2167', 'IDIOMAS II', '2', '3', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('NEUROLIN-245', 'NEUROLINGUISTICA', '2', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('NEUROLIN-245', 'NEUROLINGUISTICA', '2', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('OUPST2-61220', 'OPER. UNIDADES PROD. SOCIAL Y FACILITACION DE SERV. TURIST.', '2', '2', 0, 0, '3', '06', 1, '0');
INSERT INTO uc VALUES ('OUPST2-61220', 'OPER. UNIDADES PROD. SOCIAL Y FACILITACION DE SERV. TURIST.', '2', '3', 0, 0, '3', '06', 1, '0');
INSERT INTO uc VALUES ('OYS9023', 'ORGANIZACIÓN Y SISTEMAS', '2', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('PATOCOHU-256', 'PATOLOGIA DE LA COMUNICACION HUMANA', '2', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PATOCOHU-256', 'PATOLOGIA DE LA COMUNICACION HUMANA', '2', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DSRST3-1445', 'DES. SUSTENTABLE Y SOST. DE LOS RECURSOS Y SERV. TUR.', '3', '2', 0, 0, '5', '06', 1, '0');
INSERT INTO uc VALUES ('DSRST3-1445', 'DES. SUSTENTABLE Y SOST. DE LOS RECURSOS Y SERV. TUR.', '3', '3', 0, 0, '5', '06', 1, '0');
INSERT INTO uc VALUES ('DTCST3-61220', 'DESARROLLO DEL TURISMO COMUNITARIO Y SOCIAL', '3', '2', 0, 0, '3', '06', 1, '0');
INSERT INTO uc VALUES ('DTCST3-61220', 'DESARROLLO DEL TURISMO COMUNITARIO Y SOCIAL', '3', '3', 0, 0, '3', '06', 1, '0');
INSERT INTO uc VALUES ('ELECTIVA-322', 'ELECTIVA III', '3', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('ELECTIVA-322', 'ELECTIVA III', '3', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('FEVP001', 'FORMULACIÓN Y EVALUACIÓN DE PROYECTOS', '3', '2', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('FSC18036', 'FORMACION SOCIO CRITICA III', '3', '2', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('FSC18036', 'FORMACION SOCIO CRITICA III', '3', '3', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('GDTUT3-2167', 'GESTIÓN DE DESTINOS TURÍSTICOS', '3', '2', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('GDTUT3-2167', 'GESTIÓN DE DESTINOS TURÍSTICOS', '3', '3', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('GEC9033', 'GERENCIA DE COSTOS', '3', '2', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('GEF9033', 'GESTIÓN FINANCIERA', '3', '2', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('IDI9033', 'IDIOMAS II', '3', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('IDIOT3-28810', 'IDIOMAS III', '3', '2', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('IDIOT3-28810', 'IDIOMAS III', '3', '3', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('ING9033', 'INGLES II', '3', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('MOTRORAL-334', 'MOTRICIDAD ORAL', '3', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('MOTRORAL-334', 'MOTRICIDAD ORAL', '3', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('EDUCAMBI-434', 'EDUCACION AMBIENTAL', '4', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('EDUCAMBI-434', 'EDUCACION AMBIENTAL', '4', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('ELEC39043', 'ELECTIVA III', '4', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('ELEC49043', 'ELECTIVA IV', '4', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('ELECTIVA-422', 'ELECTIVA IV', '4', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('ELECTIVA-422', 'ELECTIVA IV', '4', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('ETCAT4-1806', 'ESTUDIOS DEL TURISMO EN EL GRAN CARIBE Y LOS PAISES DEL ALBA', '4', '2', 0, 0, '5', '06', 1, '0');
INSERT INTO uc VALUES ('ETCAT4-1806', 'ESTUDIOS DEL TURISMO EN EL GRAN CARIBE Y LOS PAISES DEL ALBA', '4', '3', 0, 0, '5', '06', 1, '0');
INSERT INTO uc VALUES ('FEP9043', 'FORMULACION Y EVALUACIÓN DE PROYECTOS', '4', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('FSC18046', 'FORMACION SOCIO CRITICA IV', '4', '2', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('FSC18046', 'FORMACION SOCIO CRITICA IV', '4', '3', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('GEPTT4-61220', 'GESTION DE PROYECTOS TURISTICOS', '4', '2', 0, 0, '3', '06', 1, '0');
INSERT INTO uc VALUES ('GEPTT4-61220', 'GESTION DE PROYECTOS TURISTICOS', '4', '3', 0, 0, '3', '06', 1, '0');
INSERT INTO uc VALUES ('GESTADFO-457', 'GESTION ADMINISTRATIVA EN FONOAUDIOLOGIA', '4', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('GESTADFO-457', 'GESTION ADMINISTRATIVA EN FONOAUDIOLOGIA', '4', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('GHAT9043', 'GESTION HUMANA Y AMBIENTE DE TRABAJO', '4', '2', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('IDIOT4-2167', 'IDIOMAS IV', '4', '2', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('IDIOT4-2167', 'IDIOMAS IV', '4', '3', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('PCC211409', 'TUTORIA DE PROYECTO II', '2', '2', 0, 0, '3', '02', 1, '0');
INSERT INTO uc VALUES ('PCC211409', 'TUTORIA DE PROYECTO II', '2', '3', 0, 0, '3', '02', 1, '0');
INSERT INTO uc VALUES ('PCC223309', 'ADMINISTRACION DE OBRAS', '2', '2', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCEP9023', 'PRESUPUESTO Y CONTABILIDAD PARA ENTES PUBLICOS', '2', '2', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('PCC311409', 'TUTORIA DE PROYECTO III', '3', '2', 0, 0, '3', '02', 1, '0');
INSERT INTO uc VALUES ('PCC311409', 'TUTORIA DE PROYECTO III', '3', '3', 0, 0, '3', '02', 1, '0');
INSERT INTO uc VALUES ('PCC325309', 'DISEÑO VIAL', '3', '2', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC411409', 'TUTORIA DE PROYECTO IV', '4', '2', 0, 0, '3', '02', 1, '0');
INSERT INTO uc VALUES ('PCC411409', 'TUTORIA DE PROYECTO IV', '4', '3', 0, 0, '3', '02', 1, '0');
INSERT INTO uc VALUES ('PIID4', 'IDIOMAS', '4', '2', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIID4', 'IDIOMAS', '4', '3', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PCC423309', 'MANTENIMIENTO DE OBRAS CIVILES', '4', '2', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PGT21', 'PETROLOGIA', '2', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT23', 'FISICA', '2', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT23', 'FISICA', '2', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG316', 'PROYECTO III', '3', '2', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PG316', 'PROYECTO III', '3', '3', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PGT31', 'YACIMIENTOS MINERALES', '3', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT31', 'YACIMIENTOS MINERALES', '3', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT32', 'EXPLORACION', '3', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT32', 'EXPLORACION', '3', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT33', 'GEOMECANICA', '3', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT33', 'GEOMECANICA', '3', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT34', 'MINERIA II', '3', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT34', 'MINERIA II', '3', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG416', 'PROYECTO IV', '4', '2', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PG416', 'PROYECTO IV', '4', '3', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PGT41', 'GEOLOGIA DE VENEZUELA', '4', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT41', 'GEOLOGIA DE VENEZUELA', '4', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT42', 'GEOLOGIA DE LOS HIDROCARBUROS', '4', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT42', 'GEOLOGIA DE LOS HIDROCARBUROS', '4', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT43', 'HIDROLOGIA', '4', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT43', 'HIDROLOGIA', '4', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT44', 'BENEFICIO MINERAL', '4', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT44', 'BENEFICIO MINERAL', '4', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT45', 'GERENCIA', '4', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT45', 'GERENCIA', '4', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT46', 'ELECTIVA II', '4', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT46', 'ELECTIVA II', '4', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT47', 'PROYECTO IV', '4', '2', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PGT47', 'PROYECTO IV', '4', '3', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PIMT2', 'MATEMATICA II', '2', '2', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIPP2', 'PROGRAMACIÓN II', '2', '2', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIPP2', 'PROGRAMACIÓN II', '2', '3', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIPT2', 'PROYECTO SOCIO TECNOLÓGICO II', '2', '2', 0, 0, '3', '03', 1, '0');
INSERT INTO uc VALUES ('PIPT2', 'PROYECTO SOCIO TECNOLÓGICO II', '2', '3', 0, 0, '3', '03', 1, '0');
INSERT INTO uc VALUES ('PIRC2', 'REDES DE COMPUTADORES', '2', '2', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PRACPROF-2120', 'PRACTICAS PROFESIONALES I', '2', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PRACPROF-2120', 'PRACTICAS PROFESIONALES I', '2', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PRO57019', 'SUPERVISIÓN Y CONDUCCIÓN TÉCNICA DE PROCESOS ADM.', '2', '2', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('PRO57019', 'SUPERVISIÓN Y CONDUCCIÓN TÉCNICA DE PROCESOS ADM.', '2', '3', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('DAR9013', 'DEPORTE ARTE Y RECREACIÓN I', '1', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('PRO700224', 'SUPERVISIÓN Y CONDUCCIÓN TÉCNICA DE PROCESOS ADM.', '2', '2', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('PRO700224', 'SUPERVISIÓN Y CONDUCCIÓN TÉCNICA DE PROCESOS ADM.', '2', '3', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('PIIS3', 'INGENIERÍA DEL SOFTWARE II', '3', '2', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIIS3', 'INGENIERÍA DEL SOFTWARE II', '3', '3', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIPT3', 'PROYECTO SOCIO TECNOLÓGICO III', '3', '2', 0, 0, '3', '03', 1, '0');
INSERT INTO uc VALUES ('PIPT3', 'PROYECTO SOCIO TECNOLÓGICO III', '3', '3', 0, 0, '3', '03', 1, '0');
INSERT INTO uc VALUES ('PPR9033', 'PRESUPUESTO PRIVADO', '3', '2', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('PRACPROF-3120', 'PRACTICAS PROFESIONALES II', '3', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PRACPROF-3120', 'PRACTICAS PROFESIONALES II', '3', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PROYSOCI-334', 'PROYECTO SOCIOINTEGRADOR III', '3', '2', 0, 0, '3', '08', 1, '0');
INSERT INTO uc VALUES ('PROYSOCI-334', 'PROYECTO SOCIOINTEGRADOR III', '3', '3', 0, 0, '3', '08', 1, '0');
INSERT INTO uc VALUES ('PSICOMOT-323', 'PSICOMOTRICIDAD', '3', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PSICOMOT-323', 'PSICOMOTRICIDAD', '3', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PIMA3', 'MATEMÁTICA APLICADA', '3', '2', 3, 2, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIPT4', 'PROYECTO SOCIO TECNOLÓGICO IV', '4', '2', 0, 0, '3', '03', 1, '0');
INSERT INTO uc VALUES ('PIPT4', 'PROYECTO SOCIO TECNOLÓGICO IV', '4', '3', 0, 0, '3', '03', 1, '0');
INSERT INTO uc VALUES ('PORTINST-434', 'PORTUGUES INSTRUMENTAL', '4', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PORTINST-434', 'PORTUGUES INSTRUMENTAL', '4', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PRACPROF-41216', 'PRACTICAS PROFESIONALES III', '4', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PRACPROF-41216', 'PRACTICAS PROFESIONALES III', '4', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PRO570419', 'DIRECCIÓN, CONTROL Y EVALUACIÓN DE SISTEMAS ADM', '4', '2', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('PRO570419', 'DIRECCIÓN, CONTROL Y EVALUACIÓN DE SISTEMAS ADM', '4', '3', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('PRO660422', 'DESARROLLO DE NUEVAS TENDENCIAS EN LA GESTION CONTABLE FINAN', '4', '2', 0, 0, '3', '07', 1, '0');
INSERT INTO uc VALUES ('PRO660422', 'DESARROLLO DE NUEVAS TENDENCIAS EN LA GESTION CONTABLE FINAN', '4', '3', 0, 0, '3', '07', 1, '0');
INSERT INTO uc VALUES ('PRO700424', 'DIRECCIÓN, CONTROL Y EVALUACIÓN DE SISTEMAS ADM', '4', '2', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('PRO700424', 'DIRECCIÓN, CONTROL Y EVALUACIÓN DE SISTEMAS ADM', '4', '3', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('PROYSOCI-479', 'PROYECTO SOCIOINTEGRADOR IV', '4', '2', 0, 0, '3', '08', 1, '0');
INSERT INTO uc VALUES ('PROYSOCI-479', 'PROYECTO SOCIOINTEGRADOR IV', '4', '3', 0, 0, '3', '08', 1, '0');
INSERT INTO uc VALUES ('SALUOCFO-456', 'SALUD OCUPACIONAL EN FONOAUDIOLOGIA', '4', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('SALUOCFO-456', 'SALUD OCUPACIONAL EN FONOAUDIOLOGIA', '4', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('SHDD9043', 'SEMINARIO HABILIDADES DIRECTIVAS II', '4', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('AGBSD142', 'BIODIVERSIDAD Y SOCIODIVERSIDAD', '1', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGBSD142', 'BIODIVERSIDAD Y SOCIODIVERSIDAD', '1', '3', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFI1126', 'PROYECTO FORMATIVO I', '1', '2', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFI1126', 'PROYECTO FORMATIVO I', '1', '3', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFI1166', 'PROYECTO FORMATIVO I', '1', '2', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFI1166', 'PROYECTO FORMATIVO I', '1', '3', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPRA142', 'PRINCIPIOS DE AGROECOLOGIA', '1', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGPRA142', 'PRINCIPIOS DE AGROECOLOGIA', '1', '3', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGPRA162', 'PRINCIPIOS DE AGROECOLOGIA', '1', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGSALC14', 'SOCIOHISTORIA DE LA AGRICULTURA LATINOAMER. Y DEL CARIBE', '1', '2', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGSALC142', 'SOCIOHISTORIA DE LA AGRICULTURA LATINOAMER. Y DEL CARIBE', '1', '2', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGSALC142', 'SOCIOHISTORIA DE LA AGRICULTURA LATINOAMER. Y DEL CARIBE', '1', '3', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('APN15015', 'ADMINISTRACIÓN PÚBLICA NACIONAL', '1', '2', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('APN15015', 'ADMINISTRACIÓN PÚBLICA NACIONAL', '1', '3', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('BASEACCO-156', 'BASES ACUSTICAS DE LA COMUNICACION', '1', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('BASEACCO-156', 'BASES ACUSTICAS DE LA COMUNICACION', '1', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('BASEPRFO-156', 'BASES DE LA PRACTICA FONOAUDIOLOGICA', '1', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('BASEPRFO-156', 'BASES DE LA PRACTICA FONOAUDIOLOGICA', '1', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('CON12014', 'CONTABILIDAD I', '1', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('CON12014', 'CONTABILIDAD I', '1', '3', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('CON18016', 'CONTABILIDAD I', '1', '2', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('CON18016', 'CONTABILIDAD I', '1', '3', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('ELECTIVA-122', 'ELECTIVA I', '1', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('ELECTIVA-122', 'ELECTIVA I', '1', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('ESTRFUCO-156', 'ESTRUCTURA Y FUNCION DE LA COMUNICACION', '1', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('ESTRFUCO-156', 'ESTRUCTURA Y FUNCION DE LA COMUNICACION', '1', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('FA12014', 'FUNDAMENTOS DE LA ADMINISTRACIÓN', '1', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('FONEFONO-134', 'FONETICA Y FONOLOGIA', '1', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('FONEFONO-134', 'FONETICA Y FONOLOGIA', '1', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('FPNTT1-61220', 'FOMENTO DEL PATRIMONIO NACIONAL Y TURISTICO', '1', '2', 0, 0, '3', '06', 1, '0');
INSERT INTO uc VALUES ('FPNTT1-61220', 'FOMENTO DEL PATRIMONIO NACIONAL Y TURISTICO', '1', '3', 0, 0, '3', '06', 1, '0');
INSERT INTO uc VALUES ('IDI9013', 'IDIOMAS I', '1', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('IDIOT1-2167', 'IDIOMAS I', '1', '2', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('IDIOT1-2167', 'IDIOMAS I', '1', '3', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('ING9013', 'INGLES I', '1', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('INGLINST-134', 'INGLES INSTRUMENTAL', '1', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('INGLINST-134', 'INGLES INSTRUMENTAL', '1', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('ORGAPACO-134', 'ORGANIZACION Y PARTICIPACION COMUNITARIA', '1', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('ORGAPACO-134', 'ORGANIZACION Y PARTICIPACION COMUNITARIA', '1', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PANTT1-1445', 'PATRIMONIO NACIONAL Y TURÍSTICO', '1', '2', 0, 0, '5', '06', 1, '0');
INSERT INTO uc VALUES ('PANTT1-1445', 'PATRIMONIO NACIONAL Y TURÍSTICO', '1', '3', 0, 0, '5', '06', 1, '0');
INSERT INTO uc VALUES ('PCC111409', 'TUTORIA DE PROYECTO', '1', '2', 0, 0, '3', '02', 1, '0');
INSERT INTO uc VALUES ('PCC111409', 'TUTORIA DE PROYECTO', '1', '3', 0, 0, '3', '02', 1, '0');
INSERT INTO uc VALUES ('PCC113309', 'MATEMATICA', '1', '2', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC115309', 'TOPOGRAFIA', '1', '2', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC115309', 'TOPOGRAFIA', '1', '3', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC116309', 'EXPRESION GRAFICA Y DIBUJO DE PROYECTO', '1', '2', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC116309', 'EXPRESION GRAFICA Y DIBUJO DE PROYECTO', '1', '3', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('THAT9023', 'TALENTO HUMANO Y AMBIENTE DE TRABAJO', '2', '2', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('TECNTEFO-456', 'TECNICAS Y TECNOLOGIAS EN FONOAUDIOLOGIA', '4', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('TECNTEFO-456', 'TECNICAS Y TECNOLOGIAS EN FONOAUDIOLOGIA', '4', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PG116', 'PROYECTO I', '1', '2', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PG116', 'PROYECTO I', '1', '3', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PGT11', 'MATEMATICA', '1', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT11', 'MATEMATICA', '1', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT12', 'TOPOGRAFIA', '1', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT12', 'TOPOGRAFIA', '1', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT13', 'QUIMICA', '1', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT13', 'QUIMICA', '1', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT14', 'GEOLOGIA GENERAL', '1', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT14', 'GEOLOGIA GENERAL', '1', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT13', 'QUIMICA', '1', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT15', 'DIMENSION HUMANA', '1', '2', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PGT15', 'DIMENSION HUMANA', '1', '3', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PGT16', 'ACREDITABLE I', '1', '2', 0, 0, '1', '05', 1, '0');
INSERT INTO uc VALUES ('PGT16', 'ACREDITABLE I', '1', '3', 0, 0, '1', '05', 1, '0');
INSERT INTO uc VALUES ('PGT17', 'PROYECTO I', '1', '2', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PGT17', 'PROYECTO I', '1', '3', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PIAC1', 'ARQUITECTURA DEL COMPUTADOR', '1', '2', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIAC1', 'ARQUITECTURA DEL COMPUTADOR', '1', '3', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIAP1', 'ALGORÍTMICA Y PROGRAMACIÓN', '1', '2', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIAP1', 'ALGORÍTMICA Y PROGRAMACIÓN', '1', '3', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIFC1', 'FORMACIÓN CRÍTICA I', '1', '2', 0, 0, '5', '03', 1, '0');
INSERT INTO uc VALUES ('PIFC1', 'FORMACIÓN CRÍTICA I', '1', '3', 0, 0, '5', '03', 1, '0');
INSERT INTO uc VALUES ('PIID1', 'IDIOMAS', '1', '2', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIID1', 'IDIOMAS', '1', '3', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIMT1', 'MATEMÁTICA I', '1', '2', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIMT1', 'MATEMÁTICA I', '1', '3', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PRO570119', 'IDENTIFICAR Y CONOCER LOS PROCESOS ADMINISTRATIVOS EN DISTIN', '1', '2', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('PRO570119', 'IDENTIFICAR Y CONOCER LOS PROCESOS ADMINISTRATIVOS EN DISTIN', '1', '3', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('PRO700124', 'ANÁL Y EJEC DE LOS PROCESOS ADM EN LAS DISTINTAS ORGANIZ.', '1', '2', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('PRO700124', 'ANÁL Y EJEC DE LOS PROCESOS ADM EN LAS DISTINTAS ORGANIZ.', '1', '3', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('PRO750125', 'ANÁLISIS Y EJECUCIÓN DE LOS PROCESOS COMPATIBLES APLICADOS', '1', '2', 0, 0, '3', '07', 1, '0');
INSERT INTO uc VALUES ('PRO750125', 'ANÁLISIS Y EJECUCIÓN DE LOS PROCESOS COMPATIBLES APLICADOS', '1', '3', 0, 0, '3', '07', 1, '0');
INSERT INTO uc VALUES ('PROYSOCI-145', 'PROYECTO SOCIOINTEGRADOR I', '1', '2', 0, 0, '3', '08', 1, '0');
INSERT INTO uc VALUES ('PROYSOCI-145', 'PROYECTO SOCIOINTEGRADOR I', '1', '3', 0, 0, '3', '08', 1, '0');
INSERT INTO uc VALUES ('SEM15015', 'ORÍGEN Y EVOLUCIÓN DEL SISTEMA SOCIOECONÓMICO MUNDIAL', '1', '2', 0, 0, '5', '07', 1, '0');
INSERT INTO uc VALUES ('SEM15015', 'ORÍGEN Y EVOLUCIÓN DEL SISTEMA SOCIOECONÓMICO MUNDIAL', '1', '3', 0, 0, '5', '07', 1, '0');
INSERT INTO uc VALUES ('PIPT1', 'PROYECTO SOCIO TECNOLÓGICO I', '1', '2', 5, 0, '3', '03', 1, '0');
INSERT INTO uc VALUES ('PIPT1', 'PROYECTO SOCIO TECNOLÓGICO I', '1', '3', 5, 0, '3', '03', 1, '0');
INSERT INTO uc VALUES ('AGPFII2126', 'PROYECTO FORMATIVO II', '2', '2', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFII2126', 'PROYECTO FORMATIVO II', '2', '3', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFII2166', 'PROYECTO FORMATIVO II', '2', '2', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFII2166', 'PROYECTO FORMATIVO II', '2', '3', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('PG216', 'PROYECTO II', '2', '2', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PG216', 'PROYECTO II', '2', '3', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PGT22', 'CARTOGRAFIA GEOLOGICA', '2', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT22', 'CARTOGRAFIA GEOLOGICA', '2', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT24', 'MINERIA I', '2', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT24', 'MINERIA I', '2', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT25', 'ESTRATIGRAFIA', '2', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT26', 'ELECTIVA I', '2', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT26', 'ELECTIVA I', '2', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT27', 'PROYECTO II', '2', '2', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PGT27', 'PROYECTO II', '2', '3', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PIFC2', 'FORMACIÓN CRÍTICA II', '2', '2', 0, 0, '5', '03', 1, '0');
INSERT INTO uc VALUES ('PIFC2', 'FORMACIÓN CRÍTICA II', '2', '3', 0, 0, '5', '03', 1, '0');
INSERT INTO uc VALUES ('PIID2', 'IDIOMAS', '2', '2', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIID2', 'IDIOMAS', '2', '3', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PROYSOCI-234', 'PROYECTO SOCIOINTEGRADOR II', '2', '2', 0, 0, '3', '08', 1, '0');
INSERT INTO uc VALUES ('PROYSOCI-234', 'PROYECTO SOCIOINTEGRADOR II', '2', '3', 0, 0, '3', '08', 1, '0');
INSERT INTO uc VALUES ('RECUPSFO-245', 'RECURSOS PSICOTERAPEUTICOS EN FONOAUDIOLOGIA', '2', '2', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('RECUPSFO-245', 'RECURSOS PSICOTERAPEUTICOS EN FONOAUDIOLOGIA', '2', '3', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('SEV15025', 'SISTEMA ECONOMICO Y MODELOS DE DESARROLLO VENEZOLANO', '2', '2', 0, 0, '5', '07', 1, '0');
INSERT INTO uc VALUES ('SEV15025', 'SISTEMA ECONOMICO Y MODELOS DE DESARROLLO VENEZOLANO', '2', '3', 0, 0, '5', '07', 1, '0');
INSERT INTO uc VALUES ('AGMSA342', 'MANEJO SANITARIO ANIMAL', '3', '2', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('PGT35', 'AMBIENTE', '3', '2', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT35', 'AMBIENTE', '3', '3', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT36', 'ACREDITABLE II', '3', '2', 0, 0, '1', '05', 1, '0');
INSERT INTO uc VALUES ('PGT36', 'ACREDITABLE II', '3', '3', 0, 0, '1', '05', 1, '0');
INSERT INTO uc VALUES ('PGT37', 'PROYECTO III', '3', '2', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PGT37', 'PROYECTO III', '3', '3', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PIFC3', 'FORMACIÓN CRÍTICA III', '3', '2', 0, 0, '5', '03', 1, '0');
INSERT INTO uc VALUES ('PIFC3', 'FORMACIÓN CRÍTICA III', '3', '3', 0, 0, '5', '03', 1, '0');
INSERT INTO uc VALUES ('PIFC4', 'FORMACIÓN CRÍTICA IV', '4', '2', 0, 0, '5', '03', 1, '0');
INSERT INTO uc VALUES ('PIFC4', 'FORMACIÓN CRÍTICA IV', '4', '3', 0, 0, '5', '03', 1, '0');
INSERT INTO uc VALUES ('PRO6604223', 'ELECTIVA III', '4', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('070002', 'SEMINARIO NIIF PARA PYMES', '0', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('AGFIAIP', 'FISICA APLICADA', '0', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('070013', 'ELECTIVA II', '2', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('ACACT2', 'ACTIVIDADES ACREDITABLES II', '2', '1', 0, 0, '1', '06', 1, '0');
INSERT INTO uc VALUES ('ADC6022', 'ADMINISTRACIÓN DE COSTOS', '2', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('ADETT2-722', 'ADMINISTRACION DE EMPRESAS TURISTICAS', '2', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('AGAGC242', 'AGROCLIMATOLOGÍA ', '2', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGAGE242', 'AGROEPISTEMOLOGÍA', '2', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGANA262', 'ALIMENTACIÓN Y NUTRICIÓN ANIMAL ALTERNATIVA', '2', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGATMA242', 'APLICACIÓN DE TÉCNICAS Y METODOLOGÍAS AGROECOLOGICAS', '2', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGATMA246', 'TÉCNICAS Y METODOLOGÍAS AGROECOLOGICAS', '2', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGBFSPV242', 'BOTÁNICA, FISIOLOGÍA Y SISTEMAS DE PRODUCCIÓN VEGETAL', '2', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGDREV242', 'DISEMINACIÓN Y REPROD. DE ESPECIES VEGETALES', '2', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGDRV242', 'DISEMINACIÓN Y REPROD. DE ESPECIES VEGETALES', '2', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGDSRC142', 'DEPORTE, SALUD, RECREACIÓN Y CULTURA', '2', '1', 0, 0, '1', '01', 1, '0');
INSERT INTO uc VALUES ('AGMCA242', 'MICROBIOLOGIA DE LOS ALIMENTOS', '2', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGMCB262', 'MICROBIOLOGÍA', '2', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGMIC242', 'MICROBIOLOGÍA ', '2', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGORS242', 'ORGANIZACIONES SOCIOPRODUCTIVAS', '2', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('070003', 'DEPORTE, ARTE Y RECREACION II', '3', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('AGETD362', 'ESTADÍSTICA', '3', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('070006', 'HERRAMIENTAS TECNOLÓGICAS II', '3', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('070011', 'AJUSTE POR INFLACION FINANCIERO', '3', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('070012', 'BASES EPISTEMOLOGICAS DE LAS CIENCIAS CONTABLES I', '3', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('ACACT3', 'ACTIVIDADES ACREDITABLES III', '3', '1', 0, 0, '1', '06', 1, '0');
INSERT INTO uc VALUES ('ADM6032', 'ADMINISTRACIÓN DE MERCADEO', '3', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('ADP6032', 'ADMINISTRACIÓN DE LA PRODUCCIÓN', '3', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('ADP9033', 'ADMINISTRACIÓN DE LA PRODUCCIÓN', '3', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('AEF9032', 'ANÁLISIS E INTERPRETACIÓN DE ESTADOS FINANCIEROS', '3', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('AGAGR342', 'AGROESTADÍSTICA', '3', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGAMI001', 'METODOLOGÍA DE LA INVESTIGACIÓN', '3', '1', 0, 0, '1', '01', 1, '0');
INSERT INTO uc VALUES ('AGANA342', 'ALIMENTACIÓN Y NUTRICIÓN ANIMAL ALTERNATIVA', '3', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGANM342', 'ANÁLISIS MATEMÁTICO', '3', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGANM362', 'ANÁLISIS MATEMÁTICO', '3', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGEPS342', 'ECONOMÍA POLÍTICA Y SOCIAL I', '3', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGGAE342', 'GESTIÓN AGROECOLÓGICA', '3', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGGAE362', 'GESTIÓN AGROECOLÓGICA', '3', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGMEI362', 'MANEJO ECOLÓGICO DE INSECTOS Y ENFERMEDADES', '3', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('ACACT4', 'ACTIVIDADES ACREDITABLES IV', '4', '1', 0, 0, '1', '06', 1, '0');
INSERT INTO uc VALUES ('ADF6042', 'ADMINISTRACIÓN FINANCIERA', '4', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('AEPS6033', 'ELECTIVA III: ADM DE EMPRESAS DE PRODUCCION Y PROPIEDAD SOCI', '4', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('AF6042', 'ADMINISTRACIÓN FINANCIERA', '4', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('AGCTS442', 'CIENCIA, TECNOLOGÍA Y SOCIEDAD.', '4', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGCTS462', 'CIENCIA, TECNOLOGÍA Y SOCIEDAD', '4', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGECC442', 'ECOCONSTRUCCIONES', '4', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGECE442', 'ECONOMÍA ECOLÓGICA', '4', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGECR462', 'ECORREGIONES', '4', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGECR4C42', 'ECORREGIONES', '4', '1', 0, 0, '4', '01', 1, '0');
INSERT INTO uc VALUES ('AGEPS442', 'ECONOMÍA POLÍTICA Y SOCIAL II', '4', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGFMP442', 'FITOMEJORAMIENTO PARTICIPATIVO', '4', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGFMP462', 'FITOMEJORAMIENTO PARTICIPATIVO', '4', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGHCA462', 'HIGIENE Y CONTROL DE CALIDAD EN LOS ALIMENTOS', '4', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGHCCA442', 'HIGIENE Y CONTROL DE CALIDAD EN LOS ALIMENTOS', '4', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGMAP442', 'MEJORAMIENTO ANIMAL PARTICIPATIVO', '4', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGMAP46', 'MEJORAMIENTO ANIMAL PARTICIPATIVO', '4', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGMEI442', 'MAQUINARIAS, EQUIPOS E IMPLEMENTOS AGRÍCOLAS ALTERNATIVOS', '4', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGPEP442', 'PEDAGOGÍA Y POLÍTICA', '4', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGPEP462', 'PEDAGOGÍA Y POLÍTICA', '4', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGPN003', 'PROY. NAC. Y NUEVA CIUDADANIA', '0', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('PCC000002', 'MECANICA APLICADA', '0', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('AGPRAIP', 'PRINCIPIOS DE AGROECOLOGIA', '0', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGTI002', 'TALLER INTROD. UNIVERS. PROGR.', '0', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('CPNMS6002', 'LA CONTADURIA PUBLICA EN EL NUEVO MODELO SOCIAL', '0', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('DEINTI-301', 'DESARROLLO INTEGRAL', '0', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('DI6002', 'DESARROLLO INTEGRAL', '0', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('DIE002', 'DESARROLLO INTEGRAL', '0', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('DIE6002', 'DESARROLLO INTEGRAL', '0', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('AGREA242', 'REPRODUCCIÓN DE ESPECIES ANIMALES ', '2', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGREA262', 'REPRODUCCIÓN DE ESPECIES ANIMALES', '2', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGSC00', 'SERVICIO COMUNITARIO', '2', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGSEA242', 'SUELO, ECOLOGÍA Y AGRICULTURA', '2', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGSEA262', 'SUELO, ECOLOGÍA Y AGRICULTURA', '2', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGSPV262', 'SISTEMAS DE PRODUCCION VEGETAL', '2', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGTCSI242', 'TOPOGRAFÍA CATASTRO Y SISTEMAS DE INFORMACIÓN GEOGRÁFICA', '2', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGTOG262', 'TOPOGRAFÍA', '2', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGZFSPA242', 'ZOOLOGÍA, FISIOLOGÍA Y SISTEMAS DE PRODUCCIÓN ANIMAL', '2', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AVTTT2-1084', 'ADMINISTRACION DE AGENCIAS DE VIAJES Y TRANSPORTE TURISTICO', '2', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('PCCP11309', 'PROYECTO NACIONAL Y NUEVA CIUDADANIA', '0', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PCCP12209', 'TALLER DE INDUCCION A LA UNIVERSIDAD Y AL PROGRAMA', '0', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PCCP13509', 'MATEMATICA DE NIVELACION', '0', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('CGA9023', 'ELECTIVA I: CALIDAD Y GESTION AMBIENTAL', '2', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('COC9023', 'CONTABILIDAD DE COSTOS', '2', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('CON12024', 'CONTABILIDAD II', '2', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('CON15025', 'CONTABILIDAD II', '2', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('CON9023', 'CONTABILIDAD II', '2', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('DCCTT2-1445', 'DESARROLLO Y CALIDAD DE VIDA DE LAS COMUNIDADES TURISTICAS', '2', '1', 0, 0, '5', '06', 1, '0');
INSERT INTO uc VALUES ('DIAGINAU-245', 'DIAGNOSTICO E INTERVENCION AUDITIVA I', '2', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINHA-256', 'DIAGNOSTICO E INTERVENCION DEL HABLA', '2', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINLE-256', 'DIAGNOSTICO E INTERVENCION DEL LENGUAJE I', '2', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('AGPFIII3126', 'PROYECTO FORMATIVO III', '3', '1', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFIII3166', 'PROYECTO FORMATIVO III', '3', '1', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPSLC342', 'PENSAMIENTO SOCIOPOLÍTICO LATINOAMERICANO Y DEL CARIBE', '3', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGSIP342', 'SISTEMAS INTEGRALES DE PRODUCCIÓN', '3', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGSPA262', 'SISTEMAS DE PRODUCCIÓN ANIMAL', '3', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGSRD342', 'SISTEMAS DE RIEGO Y DRENAJE', '3', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGSRD362', 'SISTEMAS DE RIEGO Y DRENAJE', '3', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AUD9033', 'AUDITORIA I', '3', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('DAR9033', 'DEPORTE ARTE Y RECREACIÓN II', '3', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('DEPORECR-322', 'DEPORTE Y RECREACION', '3', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINAU-345', 'DIAGNOSTICO E INTERVENCION AUDITIVA II', '3', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINLE-345', 'DIAGNOSTICO E INTERVENCION DEL LENGUAJE II', '3', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINVO-345', 'DIAGNOSTICO E INTERVENCION DE LA VOZ I', '3', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('AGPFIV41', 'PROYECTO FORMATIVO IV', '4', '1', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFIV4166', 'PROYECTO FORMATIVO IV', '4', '1', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPLE442', 'PLANIFICACIÓN ECORREGIONAL', '4', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGPLE462', 'PLANIFICACIÓN ECORREGIONAL', '4', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGPSL362', 'PENSAMIENTO SOCIOPOLÍTICO LATINOAMERICANO Y DEL CARIBE', '4', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGSCSNI442', 'SISTEMAS DE CERTIFICACIÓN SOCIAL NACIONAL E INTERNACIONAL', '4', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGSIG462', 'SISTEMAS DE INFORMACIÓN GEOGRÁFICA', '4', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGSIP362', 'SISTEMAS INTEGRALES DE PRODUCCIÓN', '4', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AIEF6042', 'ANÁLISIS E INTERPRETACIÓN DE ESTADOS FINANCIEROS', '4', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('APAA3041', 'AUDITORIA ADMINISTRATIVA', '4', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('APUALC15045', 'ADM EN LOS PROCESOS DE UNIDAD DE AMÉRICA LATINA EL CARIBE', '4', '1', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('AUD9043', 'AUDITORIA II', '4', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('COE9043', 'CONTABILIDAD ESPECIALIZADA', '4', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('COMET4-963', 'COMERCIO ELECTRONICO', '4', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('COO6042', 'COMPORTAMIENTO ORGANIZACIONAL', '4', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('DEPTT4-963', 'DISEÑO Y EVALUACION DE PROYECTOS TURISTICOS', '4', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('DET6042', 'DIMENSIONES ETICAS APLICADAS AL EJERCICIO PROFESIONAL', '4', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('DETHT4-722', 'DESARROLLO DEL TALENTO HUMANO', '4', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('DIAGINAU-457', 'DIAGNOSTICO E INTERVENCION AUDITIVA III', '4', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DIAGINVO-447', 'DIAGNOSTICO E INTERVENCION DE LA VOZ II', '4', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('FISICAFO-03', 'FISICA', '0', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('GRPC3001', 'GESTIÓN DE RIESGOS Y PROTECCIÓN CIVIL', '0', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('HERTECFO-05', 'HERRAMIENTAS TECNOLOGICAS', '0', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('IDIOTI-602', 'IDIOMAS', '0', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('IDIOTT-48', 'IDIOMAS', '0', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('INPNFOFO-05', 'INTRODUCCION AL PNF EN FONOAUDIOLOGIA', '0', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('IUTSTI-482', 'INTR. A LA UNIV. Y EL TURISMO EN EL NUEVO MODELO SOCIAL', '0', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('IUTSTT-36', 'INTRODUCCION A LA UNIVERSIDAD Y EL TURISMO', '0', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('LECCOMFO-05', 'LECTURA Y COMPRENSION', '0', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('MA6002', 'MATEMATICA', '0', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('MAT6002', 'MATEMATICA', '0', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('MATETI-963', 'MATEMATICAS', '0', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('PCC012209', 'TALLER DE INDUCCION A LA UNIVERSIDAD POL.', '0', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PCC013509', 'MATEMATICA INICIAL', '0', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC014209', 'OPTATIVA INSTITUCIONAL', '0', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC015209', 'CONSTRUCCION CIVIL Y SOCIEDAD', '0', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC011309', 'PROYECTO NACIONAL Y NUEVA CIUDADANIA', '0', '1', 5, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('ELEC19023', 'ELECTIVA I', '2', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('ELEC29023', 'ELECTIVA II', '2', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('ELECTIVA-222', 'ELECTIVA II', '2', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('ESMD15025', 'ECONOMÍA, SUSTENTABILIDAD Y MODELOS DE DESARROLLO', '2', '1', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('FSC18026', 'FORMACION SOCIO CRITICA II', '2', '1', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('PIMT005', 'MATEMATICA', '0', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('GABET2-843', 'GESTION DE ALIMENTOS Y BEBIDAS', '2', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('GEDAT2-1084', 'GESTION DE ALOJAMIENTO', '2', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('GORET2-722', 'GESTION DE OCIO Y RECREACION', '2', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('IDIOT2-2167', 'IDIOMAS II', '2', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('LLS6022', 'LEGISLACION LABORAL Y SEGURIDAD SOCIAL', '2', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('PG113', 'QUIMICA I', '1', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('MLO0602', 'MARCO LEGAL DE LAS ORGANIZACIONES', '2', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('NEUROLIN-245', 'NEUROLINGUISTICA', '2', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('OM6022', 'ORGANIZACIÓN Y MÉTODOS', '2', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('OUPST2-61220', 'OPER. UNIDADES PROD. SOCIAL Y FACILITACION DE SERV. TURIST.', '2', '1', 0, 0, '3', '06', 1, '0');
INSERT INTO uc VALUES ('OYS9023', 'ORGANIZACIÓN Y SISTEMAS', '2', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('PATOCOHU-256', 'PATOLOGIA DE LA COMUNICACION HUMANA', '2', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('DSRST3-1445', 'DES. SUSTENTABLE Y SOST. DE LOS RECURSOS Y SERV. TUR.', '3', '1', 0, 0, '5', '06', 1, '0');
INSERT INTO uc VALUES ('DTCST3-61220', 'DESARROLLO DEL TURISMO COMUNITARIO Y SOCIAL', '3', '1', 0, 0, '3', '06', 1, '0');
INSERT INTO uc VALUES ('ELECTIVA-322', 'ELECTIVA III', '3', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('FEP3031', 'FORMULACIÓN Y EVALUACIÓN DE PROYECTO', '3', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('FEVP001', 'FORMULACIÓN Y EVALUACIÓN DE PROYECTOS', '3', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('FSC18036', 'FORMACION SOCIO CRITICA III', '3', '1', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('GDTUT3-2167', 'GESTIÓN DE DESTINOS TURÍSTICOS', '3', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('GEC9033', 'GERENCIA DE COSTOS', '3', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('GEF9033', 'GESTIÓN FINANCIERA', '3', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('IDI9033', 'IDIOMAS II', '3', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('IDIOT3-28810', 'IDIOMAS III', '3', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('ING9033', 'INGLES II', '3', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('INMET3-963', 'INVESTIGACIÓN DE MERCADOS EMISORES', '3', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('MOTRORAL-334', 'MOTRICIDAD ORAL', '3', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('MOTUT3-963', 'MODALIDADES TURÍSTICAS', '3', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('EDUCAMBI-434', 'EDUCACION AMBIENTAL', '4', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('ELEC39043', 'ELECTIVA III', '4', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('ELEC49043', 'ELECTIVA IV', '4', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('ELECTIVA-422', 'ELECTIVA IV', '4', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('ETCAT4-1806', 'ESTUDIOS DEL TURISMO EN EL GRAN CARIBE Y LOS PAISES DEL ALBA', '4', '1', 0, 0, '5', '06', 1, '0');
INSERT INTO uc VALUES ('FAPTT4-963', 'FACTIBILIDAD DE PROYECTOS TURISTICOS', '4', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('FEP9043', 'FORMULACION Y EVALUACIÓN DE PROYECTOS', '4', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('FSC18046', 'FORMACION SOCIO CRITICA IV', '4', '1', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('GEPTT4-61220', 'GESTION DE PROYECTOS TURISTICOS', '4', '1', 0, 0, '3', '06', 1, '0');
INSERT INTO uc VALUES ('GESTADFO-457', 'GESTION ADMINISTRATIVA EN FONOAUDIOLOGIA', '4', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('GFETT4-963', 'GESTION FINANCIERA DE LAS EMPRESAS TURISTICAS', '4', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('GHAT9043', 'GESTION HUMANA Y AMBIENTE DE TRABAJO', '4', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('IDIOT4-2167', 'IDIOMAS IV', '4', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('NETUT4-963', 'NEGOCIACION TURISTICAS', '4', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('PCC117109', 'SALUD FISICA', '0', '1', 0, 0, '1', '02', 1, '0');
INSERT INTO uc VALUES ('PCCP14209', 'MECANICA APLICADA', '0', '1', 0, 0, '1', '02', 1, '0');
INSERT INTO uc VALUES ('PCC133209', 'GESTION DE OBRAS SOSTENIBLES', '2', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC200', 'SERVICIO COMUNITARIO', '2', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PCC211409', 'TUTORIA DE PROYECTO II', '2', '1', 0, 0, '3', '02', 1, '0');
INSERT INTO uc VALUES ('PCC211410', 'PARTICIPACIÓN COMUNITARIA', '2', '1', 0, 0, '1', '02', 1, '0');
INSERT INTO uc VALUES ('PCC212109', 'HIGIENE Y SEGURIDAD INDUSTRIAL', '2', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PCC213309', 'MATERIALES DE CONSTRUCCION', '2', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC214109', 'RESISTENCIA DE MATERIALES', '2', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC217109', 'IDIOMAS', '2', '1', 0, 0, '1', '02', 1, '0');
INSERT INTO uc VALUES ('PCC222109', 'IMPACTO AMBIENTAL EN LA CONSTRUCCION', '2', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PCC223309', 'ADMINISTRACION DE OBRAS', '2', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC224309', 'TECNOLOGIA DE LA CONSTRUCCION', '2', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC225309', 'MECANICA DE SUELOS', '2', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC226209', 'INSTALACIONES SANITARIAS Y DE GAS', '2', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC232109', 'DESARROLLO PROFESIONAL Y ETICA', '2', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PCC234209', 'ELECTRICIDAD Y MECANICA', '2', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC235309', 'OBRAS VIALES', '2', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC236209', 'SISTEMAS HIDROSANITARIOS', '2', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC237109', 'ELECTIVA I', '2', '1', 0, 0, '1', '02', 1, '0');
INSERT INTO uc VALUES ('PCEP9023', 'PRESUPUESTO Y CONTABILIDAD PARA ENTES PUBLICOS', '2', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('PCG3011', 'CONTABILIDAD GUBERNAMENTAL', '2', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('PDF3012', 'DEBERES FORMALES DEL CONTRIBUYENTE II (ISLR)', '2', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('PG211', 'PETROLOGÃƒÆ’Ã‚Â­A', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PCC311409', 'TUTORIA DE PROYECTO III', '3', '1', 0, 0, '3', '02', 1, '0');
INSERT INTO uc VALUES ('PCC312109', 'DESARROLLO ENDOGENO EN LA CONSTRUCCION', '3', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PCC313309', 'ALGEBRA LINEAL', '3', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC314309', 'GEOMETRIA DESCRIPTIVA', '3', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC315309', 'GEOLOGIA APLICADA', '3', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC316309', 'MECANICA DE LOS FLUIDOS PARA INGENIEROS', '3', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC322109', 'ORGANISMOS Y CONVENIOS INTERNACIONALES', '3', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PCC323309', 'MATEMATICA PARA INGENIEROS', '3', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC324309', 'ANALISIS ESTRUCTURAL', '3', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC325309', 'DISEÑO VIAL', '3', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC326309', 'RESISTENCIA DE MATERIALES PARA INGENIEROS', '3', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC332109', 'POLITICA DE HABITAT Y VIVIENDA', '3', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PCC333309', 'ECONOMIA Y GERENCIA DE PROYECTOS', '3', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC334309', 'CONCRETO ARMADO', '3', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC336309', 'HIDROLOGIA', '3', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC416309', 'ACUEDUCTOS DE CLOACAS Y DRENAJES', '3', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC411409', 'TUTORIA DE PROYECTO IV', '4', '1', 0, 0, '3', '02', 1, '0');
INSERT INTO uc VALUES ('PCC412109', 'INGENIERIA Y PATRIMONIO ', '4', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PCC413309', 'URBANISMOS Y EDIFICACIONES', '4', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC415309', 'INGENIERIA DE TRANSITO', '4', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC422109', 'GERENCIA SOCIAL', '4', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PIID4', 'IDIOMAS', '4', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PCC423309', 'MANTENIMIENTO DE OBRAS CIVILES', '4', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC424309', 'DISEÑO ESTRUCTURAL', '4', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC425309', 'PAVIMENTOS', '4', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC426309', 'SANEAMIENTOS Y CONSERVACION AMBIENTAL', '4', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC432109', 'EVALUACION AMBIENTAL', '4', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PCC434309', 'FUNDACIONES Y MUROS', '4', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PGTI1', 'MATEMATICA INICAL', '0', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGTI2', 'PROYECTO NACIONAL Y NUEVA CIUDADANIA', '0', '1', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PGTI3', 'INTRODUCCION A LA UNIVERSIDAD POLITECNICA Y PNF', '0', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGTI4', 'INTRODUCCION A LOS PROYECTOS Y AL PNF', '0', '1', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PGTI5', 'EDUCACION FISICA', '0', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGTT1', 'MATEMATICA III', '0', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGTT2', 'INDUCCION A LA GEOCIENCIAS', '0', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGTT3', 'PROYECTO NACIONAL Y NUEVA CIUDADANIA INT UNIV. POL. Y PNF', '0', '1', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PGTT4', 'PRINCIPIOS DE FISICA Y MECANICA', '0', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG221', 'SEDIMENTOLOGÍA', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG222', 'GEOMORFOLOGÍA Y TELEDETECCIÓN', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG223', 'FÍSICA APLICADA', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG224', 'MINERÃƒÆ’Ã‚Â­A I', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG225', 'SOBERANIA POLÍTICA E INDEPENDENCIA ECONÓMICA II', '2', '1', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PG231', 'ESTRATIGRAFÍA', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG232', 'GEOLOGÍA DE CAMPO', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG233', 'MECANICA RACIONAL', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG234', 'MINERÃƒÆ’Ã‚Â­A II', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG235', 'POLÍTICAS ENERGETICAS', '2', '1', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PGT21', 'PETROLOGIA', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT23', 'FISICA', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG311', 'ESTADISTICA', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG312', 'MECANICA DE FLUIDOS', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG313', 'RESISTENCIA DE MATERIALES', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG314', 'SERVICIO DE MINAS', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG315', 'CIENCIA Y TECNOLOGÍA I', '3', '1', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PG316', 'PROYECTO III', '3', '1', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PG321', 'GEOLOGÍA DE YACIMIENTOS', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG322', 'HIDROLOGÍA', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG323', 'MECANICA DE ROCAS Y SUELOS', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG324', 'DISEÑO DE SISTEMAS MINEROS', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG325', 'CIENCIA Y TECNOLOGÍA II', '3', '1', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PG331', 'EVALUACIÓN DE YACIMIENTOS', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG332', 'HIDROGEOLOGÍA', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG333', 'GEOTÉCNIA', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG334', 'LEGISLACIÓN MINERA Y PETROLERA', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG335', 'LÓGICA DIALECTICA', '3', '1', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PGT31', 'YACIMIENTOS MINERALES', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT32', 'EXPLORACION', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT33', 'GEOMECANICA', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT34', 'MINERIA II', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG411', 'GEOLOGÍA HISTÓRICA', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG412', 'EXPLORACIÓN GEOFÍSICA', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG413', 'SEGURIDAD, HIGIENE Y AMBIENTE', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG414', 'PREPARACIÓN Y CONCENTRACIÓN DE MINERALES I', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG415', 'ECONOMÍA POLÍTICA I', '4', '1', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PG416', 'PROYECTO IV', '4', '1', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PG421', 'GEOLOGÍA DE VENEZUELA', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG422', 'EXPLORACION GEOQUÍMICA', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG423', 'GESTIÓN AMBIENTAL ', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG424', 'PREPARACIÓN Y CONCENTRACIÓN DE MINERALES II', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG425', 'ECONOMÍA POLÍTICA II', '4', '1', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PG431', 'GEOLOGÍA DEL PETRÓLEO', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG432', 'GERENCIA DE PROYECTOS', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG433', 'EVALUACIÓN Y GESTIÓN DE RIESGOS GEOLÓGICOS', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG434', 'DISEÑO DE PLANTAS MINERAS', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG435', 'ECONOMÍA POLÍTICA III', '4', '1', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PGT41', 'GEOLOGIA DE VENEZUELA', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT42', 'GEOLOGIA DE LOS HIDROCARBUROS', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT43', 'HIDROLOGIA', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT44', 'BENEFICIO MINERAL', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT45', 'GERENCIA', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT46', 'ELECTIVA II', '4', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT47', 'PROYECTO IV', '4', '1', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PIAB4', 'ADMINISTRACIÓN DE BASE DE DATOS', '4', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIPN003', 'PROY. NAC. Y NUEVA CIUDADANIA', '0', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('PITI002', 'TALLER INTROD. UNIVERS. PROGR.', '0', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('PNNC8003', 'PROYECTO NACIONAL Y NUEVA CIUDADANIA', '0', '1', 0, 0, '5', '07', 1, '0');
INSERT INTO uc VALUES ('PNNC9003', 'PROYECTO NACIONAL Y NUEVA CIUDADANIA', '0', '1', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('PNNCTI-963', 'PROYECTO NACIONAL Y NUEVA CIUDADANIA', '0', '1', 0, 0, '5', '06', 1, '0');
INSERT INTO uc VALUES ('PNNCTT-48', 'PROYECTO NACIONAL Y NUEVA CIUDADANIA', '0', '1', 0, 0, '5', '06', 1, '0');
INSERT INTO uc VALUES ('PRNANCFO-03', 'PROYECTO NACIONAL Y NUEVA CIUDADANIA', '0', '1', 0, 0, '5', '08', 1, '0');
INSERT INTO uc VALUES ('PRO6002', 'LA ADMINISTRACIÓN EN EL NUEVO MODELO SOCIAL', '0', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('SALPUBFO-04', 'SALUD PUBLICA', '0', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PIMT004', 'MATEMÁTICA', '0', '1', 5, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('TCPNMS6002', 'LA CONTADURIA PUBLICA EN EL NUEVO MODELO SOCIAL', '0', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('PIMT2', 'MATEMATICA II', '2', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIPP2', 'PROGRAMACIÓN II', '2', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIPT2', 'PROYECTO SOCIO TECNOLÓGICO II', '2', '1', 0, 0, '3', '03', 1, '0');
INSERT INTO uc VALUES ('PIRC2', 'REDES DE COMPUTADORES', '2', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIRI2', 'COMPRESIÓN DE LA LECTURA Y REDACCIÓN DE TEXTOS ACADÉMICOS', '2', '1', 0, 0, '1', '03', 1, '0');
INSERT INTO uc VALUES ('PISC2', 'SERVICIO COMUNITARIO', '2', '1', 0, 0, '5', '03', 1, '0');
INSERT INTO uc VALUES ('PRACPROF-2120', 'PRACTICAS PROFESIONALES I', '2', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PRO57019', 'SUPERVISIÓN Y CONDUCCIÓN TÉCNICA DE PROCESOS ADM.', '2', '1', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('DAR9013', 'DEPORTE ARTE Y RECREACIÓN I', '1', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('PRO700224', 'SUPERVISIÓN Y CONDUCCIÓN TÉCNICA DE PROCESOS ADM.', '2', '1', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('PRO7502251', 'INGLES II', '2', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('PRO7502252', 'FUNDAMENTOS TECNICOS Y JURIDICOS DE LA ADMON PUBLICA', '2', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('SC00', 'SERVICIO COMUNITARIO', '2', '1', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('PIIS3', 'INGENIERÍA DEL SOFTWARE II', '3', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIMB3', 'MODELADO DE BASE DE DATOS', '3', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIPT3', 'PROYECTO SOCIO TECNOLÓGICO III', '3', '1', 0, 0, '3', '03', 1, '0');
INSERT INTO uc VALUES ('PISO3', 'SISTEMAS OPERATIVOS II', '3', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PLMTT3-963', 'PLAN DE MERCADEO TURÍSTICO', '3', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('PPL6032', 'PLANIFICACIÓN', '3', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('PPR3031', 'PRESUPUESTO PRIVADO', '3', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('PPR9033', 'PRESUPUESTO PRIVADO', '3', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('PPU4032', 'PRESUPUESTO PÚBLICO', '3', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('PRACPROF-3120', 'PRACTICAS PROFESIONALES II', '3', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PRE9033', 'PRESUPUESTO PÚBLICO Y PRIVADO', '3', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('PROYSOCI-334', 'PROYECTO SOCIOINTEGRADOR III', '3', '1', 0, 0, '3', '08', 1, '0');
INSERT INTO uc VALUES ('PSICOMOT-323', 'PSICOMOTRICIDAD', '3', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PIIO3', 'INVESTIGACIÓN DE OPERACIONES', '3', '1', 5, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIMA3', 'MATEMÁTICA APLICADA', '3', '1', 3, 2, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIPT4', 'PROYECTO SOCIO TECNOLÓGICO IV', '4', '1', 0, 0, '3', '03', 1, '0');
INSERT INTO uc VALUES ('PISI4', 'SEGURIDAD INFORMÁTICA', '4', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PORTINST-434', 'PORTUGUES INSTRUMENTAL', '4', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PP13041', 'PAQUETES INFORMATICOS APLICADOS A LOS PROC ADMINIST', '4', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('PRACPROF-41216', 'PRACTICAS PROFESIONALES III', '4', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PRO570419', 'DIRECCIÓN, CONTROL Y EVALUACIÓN DE SISTEMAS ADM', '4', '1', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('PRO660422', 'DESARROLLO DE NUEVAS TENDENCIAS EN LA GESTION CONTABLE FINAN', '4', '1', 0, 0, '3', '07', 1, '0');
INSERT INTO uc VALUES ('PRO6604221', 'HERRAMIENTAS TECNOLOGICAS III', '4', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('PRO6604222', 'BASES EPISTEMOLOGICAS DE LA CIENCIA CONTABLE II', '4', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('PRO6604224', 'GESTION SOCIAL', '4', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('PRO6604226', 'LIDERAZGO Y TOMA DE DECISIONES', '4', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('PRO6604227', 'RESPONSABILIDAD SOCIAL', '4', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('PRO700424', 'DIRECCIÓN, CONTROL Y EVALUACIÓN DE SISTEMAS ADM', '4', '1', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('PROYSOCI-479', 'PROYECTO SOCIOINTEGRADOR IV', '4', '1', 0, 0, '3', '08', 1, '0');
INSERT INTO uc VALUES ('PIGP4', 'GESTIÓN DE PROYECTOS INFORMÁTICOS', '4', '1', 5, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('SALUOCFO-456', 'SALUD OCUPACIONAL EN FONOAUDIOLOGIA', '4', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('SFN6042', 'SISTEMA FINANCIERO NACIONAL', '4', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('SHDD9043', 'SEMINARIO HABILIDADES DIRECTIVAS II', '4', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('SIF6042', 'SISTEMAS FINANCIEROS ', '4', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('TECOTI-361', 'TECNOLOGIAS DE LA COMUNICACION', '0', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('TECOTT-48', 'TECNOLOGIAS DE LA COMUNICACION', '0', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('THERTECFO-03', 'HERRAMIENTAS TECNOLOGICAS', '0', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('TINVESAFO-04', 'INVESTIGACION EN SALUD', '0', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('TPNNC8003', 'PROYECTO NACIONAL Y NUEVA CIUDADANIA', '0', '1', 0, 0, '5', '07', 1, '0');
INSERT INTO uc VALUES ('TPORTINFO-03', 'PORTUGUES INSTRUMENTAL', '0', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('TPRNANCFO-03', 'PROYECTO NACIONAL Y NUEVA CIUDADANIA', '0', '1', 0, 0, '5', '08', 1, '0');
INSERT INTO uc VALUES ('PCC000001', 'FISICA APLICADA', '0', '1', 3, 2, '2', '02', 1, '0');
INSERT INTO uc VALUES ('070001', 'DEPORTE, ARTE Y RECREACION I', '1', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('070004', 'TECNOLOGÍA DE LA COMUNICACIÓN E INFORMACIÓN', '1', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('070005', 'FUNDAMENTOS DE LA ADMINISTRACIÓN', '1', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('070008', 'ELECTIVA I', '1', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('070009', 'INGLES I', '1', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('070010', 'DEBERES FORMALES DEL CONTRIBUYENTE', '1', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('ACACT1', 'ACTIVIDADES ACREDITABLES I', '1', '1', 0, 0, '1', '06', 1, '0');
INSERT INTO uc VALUES ('AGBFV162', 'BOTÁNICA Y FISIOLOGÍA VEGETAL', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGBSD142', 'BIODIVERSIDAD Y SOCIODIVERSIDAD', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGBSD162', 'BIODIVERSIDAD Y SOCIODIVERSIDAD', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGCGA142', 'CÁLCULO GEOMÉTRICO APLICADO', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGCGA16', 'CÁLCULO GEOMÉTRICO APLICADO', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGFIA142', 'FÍSICA APLICADA', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGFIA162', 'FÍSICA APLICADA', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGMAA16', 'MATEMATICA APLICADA', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGMAT142', 'MANEJO DE LAS TIC', '1', '1', 0, 0, '1', '01', 1, '0');
INSERT INTO uc VALUES ('AGMEI162', 'MAQUINARIAS, EQUIPOS E IMPLEMENTOS AGRÍCOLAS ALTERNATIVOS', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFI1126', 'PROYECTO FORMATIVO I', '1', '1', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFI1166', 'PROYECTO FORMATIVO I', '1', '1', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPLA142', 'POLÍTICAS Y LEGISLACIÓN AGRARIA', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGPLA162', 'POLÍTICAS Y LEGISLACIÓN AGRARIA', '1', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGPRA142', 'PRINCIPIOS DE AGROECOLOGIA', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGPRA162', 'PRINCIPIOS DE AGROECOLOGIA', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGPRB142', 'PRINCIPIOS DE BIOLOGÍA ', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGPRB162', 'PRINCIPIOS DE BIOLOGÍA', '1', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGPRBQ142', 'PRINCIPIOS DE BIOQUÍMICA', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGPRBQ162', 'PRINCIPIOS DE BIOQUÍMICA', '1', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGQGA142', 'QUÍMICA GENERAL APLICADA', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGQGA16', 'QUÍMICA GENERAL APLICADA', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGSALC14', 'SOCIOHISTORIA DE LA AGRICULTURA LATINOAMER. Y DEL CARIBE', '1', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGSALC142', 'SOCIOHISTORIA DE LA AGRICULTURA LATINOAMER. Y DEL CARIBE', '1', '1', 0, 0, '5', '01', 1, '0');
INSERT INTO uc VALUES ('AGZFA162', 'ZOOLOGÍA Y FISIOLOGÍA ANIMAL', '1', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('APN15015', 'ADMINISTRACIÓN PÚBLICA NACIONAL', '1', '1', 0, 0, '5', '04', 1, '0');
INSERT INTO uc VALUES ('BASEACCO-156', 'BASES ACUSTICAS DE LA COMUNICACION', '1', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('BASEPRFO-156', 'BASES DE LA PRACTICA FONOAUDIOLOGICA', '1', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('CASTT1-722', 'CALIDAD DE LOS SERVICIOS TURISTICOS', '1', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('CON12014', 'CONTABILIDAD I', '1', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('CON18016', 'CONTABILIDAD I', '1', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('DFC6012', 'DEBERES FORMALES DEL CONTRIBUYENTE (RETENCIONES)', '1', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('DIPTT1-601', 'DISEÑO DE PRODUCTO TURÍSTICO', '1', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('ECC001', 'ELEMENTOS CONTABLES EN LAS COOPERATIVAS', '1', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('ELECTIVA-122', 'ELECTIVA I', '1', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('ES3011', 'ESTADÍSTICA', '1', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('ESTRFUCO-156', 'ESTRUCTURA Y FUNCION DE LA COMUNICACION', '1', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('FA12014', 'FUNDAMENTOS DE LA ADMINISTRACIÓN', '1', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('FE6012', 'FUNDAMENTOS DE LA ECONOMIA', '1', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('FONEFONO-134', 'FONETICA Y FONOLOGIA', '1', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('FPNTT1-61220', 'FOMENTO DEL PATRIMONIO NACIONAL Y TURISTICO', '1', '1', 0, 0, '3', '06', 1, '0');
INSERT INTO uc VALUES ('GETUT1-602', 'GEOGRAFÍA TURÍSTICA', '1', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('IDI9013', 'IDIOMAS I', '1', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('IDIOT1-2167', 'IDIOMAS I', '1', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('ING9013', 'INGLES I', '1', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('INGLINST-134', 'INGLES INSTRUMENTAL', '1', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('MLE6012', 'MARCO LEGAL DE LAS ENTIDADES', '1', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('OF6012', 'OPERACIONES FINANCIERAS', '1', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('ORGAPACO-134', 'ORGANIZACION Y PARTICIPACION COMUNITARIA', '1', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PANTT1-1445', 'PATRIMONIO NACIONAL Y TURÍSTICO', '1', '1', 0, 0, '5', '06', 1, '0');
INSERT INTO uc VALUES ('PCC111409', 'TUTORIA DE PROYECTO', '1', '1', 0, 0, '3', '02', 1, '0');
INSERT INTO uc VALUES ('PCC112109', 'ESTRUCTURA ORGANIZATIVA DEL ESTADO', '1', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PCC113309', 'MATEMATICA', '1', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC114109', 'CONSTRUCCION DE DOCUMENTOS', '1', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PCC114111', 'LENGUAJE Y COMUNICACIÓN', '1', '1', 0, 0, '1', '02', 1, '0');
INSERT INTO uc VALUES ('PCC115309', 'TOPOGRAFIA', '1', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC116309', 'EXPRESION GRAFICA Y DIBUJO DE PROYECTO', '1', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC118109', 'CULTURA', '1', '1', 0, 0, '1', '02', 1, '0');
INSERT INTO uc VALUES ('THAT9023', 'TALENTO HUMANO Y AMBIENTE DE TRABAJO', '2', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('TRI6022', 'TRIBUTACIÓN I', '2', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('TDR3031', 'DECLARACIÓN DE RENTAS', '3', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('TIC6032', 'TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN III', '3', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('TRI6032', 'TRIBUTACION II', '3', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('TECNTEFO-456', 'TECNICAS Y TECNOLOGIAS EN FONOAUDIOLOGIA', '4', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PCC414309', 'ACERO Y MADERA', '4', '1', 3, 2, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC122109', 'GEOGRAFIA Y HABITAT', '1', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PCC124109', 'INFORMÁTICA INSTRUMENTAL', '1', '1', 0, 0, '1', '02', 1, '0');
INSERT INTO uc VALUES ('PCC127209', 'FISICA APLICADA', '1', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC132109', 'ECONOMIA Y PRODUCCIÓN', '1', '1', 0, 0, '5', '02', 1, '0');
INSERT INTO uc VALUES ('PCC134209', 'MECANICA', '1', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC137109', 'QUIMICA GENERAL', '1', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC215309', 'ANALISIS ESTADISTICOS', '1', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PG111', 'MATEMATICA I', '1', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG112', 'SISTEMAS DE REPRESENTACIÓN GRÁFICA', '1', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG114', 'INTRODUCCION A LA GEOCIENCIA', '1', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG115', 'DIMENSION UNIVERSAL DEL HOMBRE I', '1', '1', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PG116', 'PROYECTO I', '1', '1', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PG117', 'REDACCIÓN DE INFORMES TÉCNICOS', '1', '1', 0, 0, '1', '05', 1, '0');
INSERT INTO uc VALUES ('PG121', 'MATEMATICA II', '1', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG122', 'TOPOGRAFIA', '1', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG123', 'QUIMICA II', '1', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG124', 'GEOLOGIA GENERAL', '1', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG125', 'DIMENSION UNIVERSAL DEL HOMBRE II', '1', '1', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PG131', 'MATEMATICA III', '1', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG132', 'TOPOGRAFIA APLICADA', '1', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG133', 'MINERALOGIA', '1', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG134', 'GEOQUIMICA', '1', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG135', 'ANALISIS CRITICO DE LA REALIDAD VENEZOLANA', '1', '1', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PGT11', 'MATEMATICA', '1', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT12', 'TOPOGRAFIA', '1', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT14', 'GEOLOGIA GENERAL', '1', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT15', 'DIMENSION HUMANA', '1', '1', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PGT16', 'ACREDITABLE I', '1', '1', 0, 0, '1', '05', 1, '0');
INSERT INTO uc VALUES ('PGT17', 'PROYECTO I', '1', '1', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PI1108', 'OFIMÁTICA', '1', '1', 0, 0, '1', '03', 1, '0');
INSERT INTO uc VALUES ('PIAC1', 'ARQUITECTURA DEL COMPUTADOR', '1', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIAP1', 'ALGORÍTMICA Y PROGRAMACIÓN', '1', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIEL1', 'ELECTIVA I', '1', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIFC1', 'FORMACIÓN CRÍTICA I', '1', '1', 0, 0, '5', '03', 1, '0');
INSERT INTO uc VALUES ('PIID1', 'IDIOMAS', '1', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIMT1', 'MATEMÁTICA I', '1', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PLTUT1-722', 'PLANIFICACIÓN TURÍSTICA', '1', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('PRO570119', 'IDENTIFICAR Y CONOCER LOS PROCESOS ADMINISTRATIVOS EN DISTIN', '1', '1', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('PRO700124', 'ANÁL Y EJEC DE LOS PROCESOS ADM EN LAS DISTINTAS ORGANIZ.', '1', '1', 0, 0, '3', '04', 1, '0');
INSERT INTO uc VALUES ('PRO750125', 'ANÁLISIS Y EJECUCIÓN DE LOS PROCESOS COMPATIBLES APLICADOS', '1', '1', 0, 0, '3', '07', 1, '0');
INSERT INTO uc VALUES ('PROYSOCI-145', 'PROYECTO SOCIOINTEGRADOR I', '1', '1', 0, 0, '3', '08', 1, '0');
INSERT INTO uc VALUES ('PSICOLOG-134', 'PSICOLOGIA', '1', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('PTE3011', 'TECNICAS DE EXPRESIÓN ORAL Y ESCRITA', '1', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('PTI6012', 'TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACION I', '1', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('SEM15015', 'ORÍGEN Y EVOLUCIÓN DEL SISTEMA SOCIOECONÓMICO MUNDIAL', '1', '1', 0, 0, '5', '07', 1, '0');
INSERT INTO uc VALUES ('SPC001', 'SISTEMAS Y PROCEDIMIENTOS CONTABLES', '1', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('TETUT1-602', 'TEORÍA DEL TURISMO', '1', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('TPM6012', 'TEORÍA Y PRÁCTICA DEL MERCADEO', '1', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('TPM9013', 'TEORÍA Y PRÁCTICA DEL MERCADEO', '1', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('TPTUT1-722', 'TECNICAS DE PROMOCION TURISTICA', '1', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('PIPT1', 'PROYECTO SOCIO TECNOLÓGICO I', '1', '1', 5, 0, '3', '03', 1, '0');
INSERT INTO uc VALUES ('AGPFII2126', 'PROYECTO FORMATIVO II', '2', '1', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('AGPFII2166', 'PROYECTO FORMATIVO II', '2', '1', 0, 0, '3', '01', 1, '0');
INSERT INTO uc VALUES ('PG212', 'GEOLOGÍA ESTRUCTURAL Y GEOTECTÓNICA', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG213', 'FÍSICA', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PG214', 'MÉTODOS DE PERFORACIÓN', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PCC216309', 'MECANICA DE LOS FLUIDOS', '2', '1', 3, 2, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PG215', 'SOBERANIA POLÍTICA E INDEPENDENCIA ECONÓMICA I', '2', '1', 0, 0, '5', '05', 1, '0');
INSERT INTO uc VALUES ('PG216', 'PROYECTO II', '2', '1', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PG217', 'T.I.C.', '2', '1', 0, 0, '1', '05', 1, '0');
INSERT INTO uc VALUES ('PGT22', 'CARTOGRAFIA GEOLOGICA', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT24', 'MINERIA I', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT25', 'ESTRATIGRAFIA', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT26', 'ELECTIVA I', '2', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT27', 'PROYECTO II', '2', '1', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PIBD2', 'BASE DE DATOS', '2', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIEL2', 'ELECTIVA II', '2', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIFC2', 'FORMACIÓN CRÍTICA II', '2', '1', 0, 0, '5', '03', 1, '0');
INSERT INTO uc VALUES ('PIID2', 'IDIOMAS', '2', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIIS2', 'INGENIERIA DEL SOFTWARE I', '2', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PRO7502253', 'SISTEMA BANCARIO VENEZOLANO', '2', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('PRO7502254', 'ORGANIZACION Y METODOS', '2', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('PRO7502255', 'HERRAMIENTAS TECNOLOGICAS I', '2', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('PRO7502256', 'TENDENCIAS CONTEMPORANEAS DE LA CONTABILIDAD', '2', '1', 0, 0, '2', '07', 1, '0');
INSERT INTO uc VALUES ('PROTT2-722', 'PROCESOS Y OPERACIONES TURISTICAS', '2', '1', 0, 0, '2', '06', 1, '0');
INSERT INTO uc VALUES ('PROYSOCI-234', 'PROYECTO SOCIOINTEGRADOR II', '2', '1', 0, 0, '3', '08', 1, '0');
INSERT INTO uc VALUES ('PTI6022', 'TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN II', '2', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('RECUPSFO-245', 'RECURSOS PSICOTERAPEUTICOS EN FONOAUDIOLOGIA', '2', '1', 0, 0, '2', '08', 1, '0');
INSERT INTO uc VALUES ('SEV15025', 'SISTEMA ECONOMICO Y MODELOS DE DESARROLLO VENEZOLANO', '2', '1', 0, 0, '5', '07', 1, '0');
INSERT INTO uc VALUES ('SHA9023', 'SEMINARIO HABILIDADES DIRECTIVAS I', '2', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('AGMEIE342', 'MANEJO ECOLÓGICO DE INSECTOS Y ENFERMEDADES', '3', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGMSA342', 'MANEJO SANITARIO ANIMAL', '3', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('AGOTA362', 'OPERACIONES BÁSICAS EN LA TRANSFORMACIÓN DE ALIMENTOS', '3', '1', 0, 0, '2', '01', 1, '0');
INSERT INTO uc VALUES ('PGT35', 'AMBIENTE', '3', '1', 0, 0, '2', '05', 1, '0');
INSERT INTO uc VALUES ('PGT36', 'ACREDITABLE II', '3', '1', 0, 0, '1', '05', 1, '0');
INSERT INTO uc VALUES ('PGT37', 'PROYECTO III', '3', '1', 0, 0, '3', '05', 1, '0');
INSERT INTO uc VALUES ('PIEL3', 'ELECTIVA III', '3', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIFC3', 'FORMACIÓN CRÍTICA III', '3', '1', 0, 0, '5', '03', 1, '0');
INSERT INTO uc VALUES ('PIGC3', 'GESTION COMUNITARIA', '3', '1', 0, 0, '1', '03', 1, '0');
INSERT INTO uc VALUES ('PCC434310', 'OBRAS DE SISTEMAS DE TRANSITO', '4', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC435109', 'ELECTIVA II', '4', '1', 0, 0, '1', '02', 1, '0');
INSERT INTO uc VALUES ('PCC436309', 'OBRAS HIDRAULICAS', '4', '1', 0, 0, '2', '02', 1, '0');
INSERT INTO uc VALUES ('PCC437109', 'ELECTIVA III', '4', '1', 0, 0, '1', '02', 1, '0');
INSERT INTO uc VALUES ('PCG6042', 'CONTROL DE GESTION ADMINISTRATIVA', '4', '1', 0, 0, '2', '04', 1, '0');
INSERT INTO uc VALUES ('PIAI4', 'AUDITORÍA INFORMÁTICA', '4', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIEL4', 'ELECTIVA IV', '4', '1', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIFC4', 'FORMACIÓN CRÍTICA IV', '4', '1', 0, 0, '5', '03', 1, '0');
INSERT INTO uc VALUES ('PITIP02', 'TALLER DE INTRODUCIÓN A LA UNIVERSIDAD Y AL PROGRAMA', '0', '1', 0, 0, '5', '03', 1, '0');
INSERT INTO uc VALUES ('PIRA4', 'REDES AVANZADAS', '4', '2', 0, 0, '2', '03', 1, '0');
INSERT INTO uc VALUES ('PIPNP03', 'PROYECTO NACIONAL Y NUEVA CIUDADANIA', '0', '1', 5, 0, '5', '03', 1, '0');
INSERT INTO uc VALUES ('00000000001', 'ALFABETIZACIÓN TECNOLÓGICA', '0', '1', 2, 3, '2', '03', 1, '1');


--
-- Name: uc_cc_seq; Type: SEQUENCE SET; Schema: public; Owner: www-data
--

SELECT pg_catalog.setval('uc_cc_seq', 1, false);


--
-- Name: uc_e_seq; Type: SEQUENCE SET; Schema: public; Owner: www-data
--

SELECT pg_catalog.setval('uc_e_seq', 1, false);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: www-data
--

INSERT INTO usuario VALUES ('12345678', '1234', '1234', 2);
INSERT INTO usuario VALUES ('4321', '4321', 'eeee', 1);
INSERT INTO usuario VALUES ('87654321', '1234', '1234', 2);


--
-- Name: carga_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY carga
    ADD CONSTRAINT carga_pkey PRIMARY KEY (cuc, ci, p, tr, cm);


--
-- Name: carrera_d_key; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY carrera
    ADD CONSTRAINT carrera_d_key UNIQUE (d);


--
-- Name: carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY carrera
    ADD CONSTRAINT carrera_pkey PRIMARY KEY (cc);


--
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (cat);


--
-- Name: condicion_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY condicion
    ADD CONSTRAINT condicion_pkey PRIMARY KEY (c);


--
-- Name: coordinacion_ci_key; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY coordinacion
    ADD CONSTRAINT coordinacion_ci_key UNIQUE (ci);


--
-- Name: coordinacion_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY coordinacion
    ADD CONSTRAINT coordinacion_pkey PRIMARY KEY (ci, cc, s);


--
-- Name: dedicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY dedicacion
    ADD CONSTRAINT dedicacion_pkey PRIMARY KEY (ded);


--
-- Name: departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY area
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (ca);


--
-- Name: dicta_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY perfil
    ADD CONSTRAINT dicta_pkey PRIMARY KEY (cuc, ci);


--
-- Name: eje_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY eje
    ADD CONSTRAINT eje_pkey PRIMARY KEY (ce);


--
-- Name: historial_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY historial
    ADD CONSTRAINT historial_pkey PRIMARY KEY (d, f);


--
-- Name: malla_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY malla
    ADD CONSTRAINT malla_pkey PRIMARY KEY (cm, cc);


--
-- Name: observacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY observacion
    ADD CONSTRAINT observacion_pkey PRIMARY KEY (p, ci);


--
-- Name: p_obtenida_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY estudios
    ADD CONSTRAINT p_obtenida_pkey PRIMARY KEY (cp, ci);


--
-- Name: periodo_ff_key; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT periodo_ff_key UNIQUE (ff);


--
-- Name: periodo_fi_key; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT periodo_fi_key UNIQUE (fi);


--
-- Name: pertenece_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY pertenece
    ADD CONSTRAINT pertenece_pkey PRIMARY KEY (ci, cc);


--
-- Name: profesion_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY profesion
    ADD CONSTRAINT profesion_pkey PRIMARY KEY (cp);


--
-- Name: profesor_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY profesor
    ADD CONSTRAINT profesor_pkey PRIMARY KEY (ci);


--
-- Name: seccion_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY seccion
    ADD CONSTRAINT seccion_pkey PRIMARY KEY (id);


--
-- Name: sede_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY sede
    ADD CONSTRAINT sede_pkey PRIMARY KEY (s);


--
-- Name: uc_cuc_tr_cm_key; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY uc
    ADD CONSTRAINT uc_cuc_tr_cm_key UNIQUE (cuc, tr, cm);


--
-- Name: uc_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY uc
    ADD CONSTRAINT uc_pkey PRIMARY KEY (cuc, tr, cc, cm);


--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (ci);


--
-- Name: carga_ci_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY carga
    ADD CONSTRAINT carga_ci_fkey FOREIGN KEY (cuc, ci) REFERENCES perfil(cuc, ci) ON UPDATE CASCADE;


--
-- Name: carga_cuc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY carga
    ADD CONSTRAINT carga_cuc_fkey FOREIGN KEY (cuc, tr, cm) REFERENCES uc(cuc, tr, cm) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: carrera_cd_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY carrera
    ADD CONSTRAINT carrera_cd_fkey FOREIGN KEY (ca) REFERENCES area(ca) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: coordinacion_cc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY coordinacion
    ADD CONSTRAINT coordinacion_cc_fkey FOREIGN KEY (cc) REFERENCES carrera(cc) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: coordinacion_ci_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY coordinacion
    ADD CONSTRAINT coordinacion_ci_fkey FOREIGN KEY (ci) REFERENCES profesor(ci) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: coordinacion_s_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY coordinacion
    ADD CONSTRAINT coordinacion_s_fkey FOREIGN KEY (s) REFERENCES sede(s) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dicta_ci_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY perfil
    ADD CONSTRAINT dicta_ci_fkey FOREIGN KEY (ci) REFERENCES profesor(ci) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: historial_ci_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY historial
    ADD CONSTRAINT historial_ci_fkey FOREIGN KEY (ci) REFERENCES usuario(ci) ON UPDATE CASCADE;


--
-- Name: malla_cc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY malla
    ADD CONSTRAINT malla_cc_fkey FOREIGN KEY (cc) REFERENCES carrera(cc) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: p_obtenida_ci_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY estudios
    ADD CONSTRAINT p_obtenida_ci_fkey FOREIGN KEY (ci) REFERENCES profesor(ci) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: p_obtenida_cp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY estudios
    ADD CONSTRAINT p_obtenida_cp_fkey FOREIGN KEY (cp) REFERENCES profesion(cp) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pertenece_cc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY pertenece
    ADD CONSTRAINT pertenece_cc_fkey FOREIGN KEY (cc) REFERENCES carrera(cc) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pertenece_ci_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY pertenece
    ADD CONSTRAINT pertenece_ci_fkey FOREIGN KEY (ci) REFERENCES profesor(ci) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: profesor_c_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY profesor
    ADD CONSTRAINT profesor_c_fkey FOREIGN KEY (c) REFERENCES condicion(c) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: profesor_cat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY profesor
    ADD CONSTRAINT profesor_cat_fkey FOREIGN KEY (cat) REFERENCES categoria(cat) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: profesor_ded_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY profesor
    ADD CONSTRAINT profesor_ded_fkey FOREIGN KEY (ded) REFERENCES dedicacion(ded) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: profesor_s_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY profesor
    ADD CONSTRAINT profesor_s_fkey FOREIGN KEY (s) REFERENCES sede(s) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: uc_cc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY uc
    ADD CONSTRAINT uc_cc_fkey FOREIGN KEY (cc, cm) REFERENCES malla(cc, cm) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: uc_ce_fkey; Type: FK CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY uc
    ADD CONSTRAINT uc_ce_fkey FOREIGN KEY (ce) REFERENCES eje(ce) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
