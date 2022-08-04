--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-08-04 13:01:19

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 17380)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17383)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 211 (class 1259 OID 17384)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17387)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 213 (class 1259 OID 17388)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17391)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 215 (class 1259 OID 17392)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17397)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17400)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 217
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 218 (class 1259 OID 17401)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 218
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 219 (class 1259 OID 17402)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17405)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 220
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 221 (class 1259 OID 17406)
-- Name: book_author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_author (
    id bigint NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    father_name character varying(100),
    country character varying(100) NOT NULL,
    birthday date NOT NULL,
    language jsonb NOT NULL,
    date_add timestamp with time zone NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.book_author OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17411)
-- Name: book_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_author_id_seq OWNER TO postgres;

--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 222
-- Name: book_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_author_id_seq OWNED BY public.book_author.id;


--
-- TOC entry 223 (class 1259 OID 17412)
-- Name: book_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_book (
    id bigint NOT NULL,
    book_name character varying(1024) NOT NULL,
    description text NOT NULL,
    book_image character varying(100),
    date_add date NOT NULL,
    date_create date NOT NULL,
    is_deleted boolean NOT NULL,
    genre_id bigint NOT NULL,
    publishing_house_id bigint,
    slug character varying(255)
);


ALTER TABLE public.book_book OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17417)
-- Name: book_book_author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_book_author (
    id bigint NOT NULL,
    book_id bigint NOT NULL,
    author_id bigint NOT NULL
);


ALTER TABLE public.book_book_author OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17420)
-- Name: book_book_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_book_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_book_author_id_seq OWNER TO postgres;

--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 225
-- Name: book_book_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_book_author_id_seq OWNED BY public.book_book_author.id;


--
-- TOC entry 226 (class 1259 OID 17421)
-- Name: book_book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_book_id_seq OWNER TO postgres;

--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 226
-- Name: book_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_book_id_seq OWNED BY public.book_book.id;


--
-- TOC entry 227 (class 1259 OID 17422)
-- Name: book_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_genre (
    id bigint NOT NULL,
    genre_name character varying(512) NOT NULL,
    is_deleted boolean NOT NULL,
    slug character varying(255)
);


ALTER TABLE public.book_genre OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17427)
-- Name: book_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_genre_id_seq OWNER TO postgres;

--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 228
-- Name: book_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_genre_id_seq OWNED BY public.book_genre.id;


--
-- TOC entry 229 (class 1259 OID 17428)
-- Name: book_publishinghouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_publishinghouse (
    id bigint NOT NULL,
    publishing_house_name character varying(300) NOT NULL,
    address character varying(1500) NOT NULL,
    contact_phone character varying(12) NOT NULL,
    email character varying(254) NOT NULL,
    website_link character varying(255),
    date_add timestamp with time zone NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.book_publishinghouse OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17433)
-- Name: book_publishinghouse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_publishinghouse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_publishinghouse_id_seq OWNER TO postgres;

--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 230
-- Name: book_publishinghouse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_publishinghouse_id_seq OWNED BY public.book_publishinghouse.id;


--
-- TOC entry 231 (class 1259 OID 17434)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17440)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 232
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 233 (class 1259 OID 17441)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17444)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 234
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 235 (class 1259 OID 17445)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17450)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 236
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 237 (class 1259 OID 17451)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 3233 (class 2604 OID 17456)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 17457)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 17458)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 17459)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 17460)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 17461)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 17462)
-- Name: book_author id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_author ALTER COLUMN id SET DEFAULT nextval('public.book_author_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 17463)
-- Name: book_book id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_book ALTER COLUMN id SET DEFAULT nextval('public.book_book_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 17464)
-- Name: book_book_author id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_book_author ALTER COLUMN id SET DEFAULT nextval('public.book_book_author_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 17465)
-- Name: book_genre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_genre ALTER COLUMN id SET DEFAULT nextval('public.book_genre_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 17466)
-- Name: book_publishinghouse id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_publishinghouse ALTER COLUMN id SET DEFAULT nextval('public.book_publishinghouse_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 17467)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 17468)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 17469)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3471 (class 0 OID 17380)
-- Dependencies: 209
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3473 (class 0 OID 17384)
-- Dependencies: 211
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3475 (class 0 OID 17388)
-- Dependencies: 213
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Автор	7	add_author
26	Can change Автор	7	change_author
27	Can delete Автор	7	delete_author
28	Can view Автор	7	view_author
29	Can add Жанр	8	add_genre
30	Can change Жанр	8	change_genre
31	Can delete Жанр	8	delete_genre
32	Can view Жанр	8	view_genre
33	Can add Издательство	9	add_publishinghouse
34	Can change Издательство	9	change_publishinghouse
35	Can delete Издательство	9	delete_publishinghouse
36	Can view Издательство	9	view_publishinghouse
37	Can add Книга	10	add_book
38	Can change Книга	10	change_book
39	Can delete Книга	10	delete_book
40	Can view Книга	10	view_book
\.


--
-- TOC entry 3477 (class 0 OID 17392)
-- Dependencies: 215
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$2qNHCk26mQHZS0o5nW47qi$fsDNUpjUONysFBNQ1xj6TRvzcxaVidkZv+fmaJSkaVM=	2022-08-01 09:35:38.041689+05	t	admin			sod12@yandex.ru	t	t	2022-08-01 09:35:10.889132+05
\.


--
-- TOC entry 3478 (class 0 OID 17397)
-- Dependencies: 216
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3481 (class 0 OID 17402)
-- Dependencies: 219
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3483 (class 0 OID 17406)
-- Dependencies: 221
-- Data for Name: book_author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_author (id, first_name, last_name, father_name, country, birthday, language, date_add, is_deleted) FROM stdin;
2	Александр	Дюма	\N	Франция	1802-06-24	{"0": "Французский"}	2022-08-01 12:06:04.385151+05	f
3	Антуан	де Сент-Экзюпери	\N	Франция	1900-06-29	{"0": "Французский"}	2022-08-01 12:09:55.440794+05	f
4	Джером	Клапка	Джером	Великобритания	1927-06-14	{"0": "Английский"}	2022-08-01 12:12:26.754546+05	f
1	Артур	Конан Дойл	\N	Шотландия	1859-05-22	{"0": "Английский"}	2022-08-01 11:30:33.733823+05	f
5	Евгений	Петров	\N	Россия	1902-12-13	{"0": "Русский"}	2022-08-01 12:15:40.742197+05	f
6	Илья	Ильф	\N	Россия	1897-10-15	{"0": "Русский"}	2022-08-01 12:16:53.566911+05	f
7	Терри	Пратчетт	\N	Великобритания	1948-03-15	{"0": "Английский"}	2022-08-01 12:32:53.039843+05	f
8	Нил	Гейман	\N	Великобритания	1960-11-10	{"0": "Английский"}	2022-08-01 12:34:00.079188+05	f
9	Марк	Твен	\N	Америка	1835-11-30	{"0": "Английский"}	2022-08-01 12:36:03.308882+05	f
10	Фаина	Раневская	\N	Россия	1896-08-27	{"0": "Русский"}	2022-08-01 12:37:59.557326+05	f
11	Юрий	Никулин	\N	Россия	1921-12-18	{"0": "Русский"}	2022-08-01 12:39:14.701881+05	f
12	Лейкин	Николай	Александрович	Россия	1841-12-19	{"0": "Русский"}	2022-08-01 12:51:23.424954+05	f
\.


--
-- TOC entry 3485 (class 0 OID 17412)
-- Dependencies: 223
-- Data for Name: book_book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_book (id, book_name, description, book_image, date_add, date_create, is_deleted, genre_id, publishing_house_id, slug) FROM stdin;
7	Приключения Тома Сойера	Марк Твен Беззаботный школьник Том Сойер — озорник и выдумщик, но у него доброе сердце и светлая голова. Он любит убегать из дома, купаться в речке и легко превращает наказание в развлечение. Вместе со своим другом Геком Финном он весело проводит время. Мальчишки пускаются в приключения, попадают в передряги и проказничают.\r\nИстория веселого, живого, озорного Тома Сойера — одна из самых лучезарных книг в мировой литературе.	books/2022/08/01/2930446_detail.jpg	2022-07-29	2022-01-01	f	2	1	priklyucheniya-toma-sojera
5	Двенадцать стульев	Евгений Петров , Илья Ильф "Двенадцать стульев" - это роман, написанный И. Ильфом и Е. Петровым в жанре сатирического фельетона. Главным героем произведения является Остап Бендер - великий комбинатор, знающий массу способов отъема денег у честного населения. Он знакомится с Ипполитом Воробьяниновым (или просто Кисой), от которого узнает историю о спрятанных в стуле бриллиантах. Спрятала их туда теща Воробьянинова, опасаясь обыска, и открыла тайну зятю только перед смертью. Теперь Остап и Киса будут охотиться за драгоценностями вместе, постоянно попадая в самые разные истории и сталкиваясь на своем пути с самыми разными людьми.	books/2022/08/01/37704.750x0.jpg	2022-07-29	2021-01-01	f	3	2	dvenadcat-stulev
2	Три мушкетера	Александр Дюма Написанный в середине XIX века историко-приключенческий роман А. Дюма "Три мушкетёра" до сих пор пользуется огромной популярностью у читателей всего мира. Это значит, что честь и достоинство, смелость и отвага, верность дружбе и взаимовыручка - эти поистине рыцарские ценности - не потеряют своей актуальности никогда.\r\nЧтение этого романа можно сравнить с увлекательным путешествием во времени и в пространстве. А замечательные иллюстрации заслуженного художника Российской Федерации Леонида Непомнящего помогут читателям ещё больше погрузиться в атмосферу приключений и романтики.\r\nДля старшего школьного возраста.	books/2022/08/01/2773970_detail.jpg	2022-07-29	2015-01-01	f	2	2	tri-mushketera
1	Весь Шерлок Холмс	Артур Конан Дойл (1859-1930) – английский писатель, отдавший дань практически всем литературным жанрам, но наиболее известный как автор детективных, историко-приключенческих и фантастических произведений. И, конечно же, как создатель знаменитого тандема – Шерлока Холмса и доктора Уотсона. Книги о гениальном сыщике и его простоватом напарнике переведены практически на все языки мира, Холмс и Уотсон стали героями бесчисленных литературных подражаний, экранизаций и театральных постановок.\r\nПрошло уже больше ста лет с того момента, как был напечатан первый рассказ, а читатели всего мира по-прежнему с упоением погружаются в мир туманных лондонских улиц, зловещих болот и вересковых пустошей.\r\nВ настоящем издании представлено полное собрание рассказов и повестей о великом сыщике с Бейкер-стрит.	books/2022/08/01/2725927_detail.jpg	2022-07-29	2019-01-01	f	1	1	ves-sherlok-holms
9	Записки Полкана. Повесть из собачьей жизни.	Репринт с издания. СПб., 1897. Лейкин Николай Александрович (1841-1906) - известный российский юморист. Род. в старинном петербургском купеческом семействе, образование получил в петерб. немецком реформатском училище, был приказчиком, служил в страховом обществе, но скоро оставил коммерческую деятельность. Последние 15 лет Л. принимает деятельное участие в спб. городской думе. Л. — чрезвычайно плодовитый писатель. Начав с небольших юмористических очерков и стихотворений в "Русском Мире", "Искре" и др. и поместив в журналах обратившие на себя внимание очерки "Апраксинцы" ("Библ. для Чтения", 1863), "Биржевые артельщики" ("Современник", 1864) и др., Л. с начала 1870-х гг. становится постоянным сотрудником "Петербургской Газеты" и здесь почти каждый день помещает "сцены" из купеческого, мещанского и низшего петербургского быта. Общее число написанных Л. сцен достигает 10 тысяч; только часть их вошла в сорок отдельно изданных томов. Более известные сборники сцен Л.: "Где апельсины зреют" (6 изд.), "Наши за границей" (11 изд.), "Цветы лазоревые", "Наши забавники", "Неунывающие россияне", "Шуты гороховые", "Саврасы без узды" и др. Юмор Л. не всегда гонится за типичностью и очень часто ограничивается стремлением потешать читателя смехотворными словечками. Но есть и серьезные стороны в его произведениях. Несмотря на то, что он почти всю жизнь пишет для аудитории "мелкой прессы", Л. никогда не угождает ее вкусам и по мере сил старается быть обличителем "темного царства". Редактируемый Л. с 1880 г. юмористический журнал "Осколки" свободен от порнографии, составляющей главную приманку многих юмористических изданий. Л. написал также несколько забавных пьес для сцены: "Привыкать надо", "Медаль", "Кум пожарный" и др.	books/2022/08/01/2902039_detail.jpg	2022-07-29	2010-01-01	f	3	2	zapiski-polkana-povest-iz-sobachej-zhizni
8	Потерял сознание, очнулся - гипс	Фаина Раневская и Юрий Никулин – настоящие культовые личности. Они обладали невероятным арсеналом моментально узнаваемых неповторимых масок, были понятны всем, вызвали самые светлые позитивные эмоции. И в этом – суть их таланта, суть настоящего творчества. А еще они оба обладали уникальным чувством юмора. Истории, собранные в этой книге, вызывают улыбку, добрый смех и неизменно дарят хорошее настроение. Они пересыпаны цитатами, афоризмами, остротами, мудрыми наблюдениями над жизнью, которые легко запоминаются и потом пересказываются друзьям и знакомым.	books/2022/08/01/2912192_detail.jpg	2022-07-29	2010-01-01	f	3	2	poteryal-soznanie-ochnulsya-gips
6	Благие знамения	Терри Пратчетт, Нил Гейман Первый (и последний по заверениям соавторов) совместный роман создателей "Плоского мира" и "Песочного человека". Комедийная история об ангеле и демоне, которые берутся предотвратить Апокалипсис. Так что будет всё - и четверка всадников, и поменянные местами младенцы, и… так и ненаступивший конец света!\r\nВремя пришло. Финальная схватка между силами Добра и Зла. Конец Всего. И Антихрист, дитя Князя Тьмы, был послан на землю. Не лично Князем Тьмы, естественно. Для этого существуют исполнители. Так сказать, демоны — и ангелы — полевые агенты. Самые опытные. Самые верные. Самые-самые. Собственно, ради этого момента агенты тысячелетиями вели сражения за души на Земле. В Конце Света сам смысл их существования. И вот пред ними раскрылись сияющие перспективы. Ангелу - вечность в раю - под музыку арф. Исключительно арф. Ни единой гитары. Или даже гобоя. А ангел как-то привык уже, знаете, к хорошему. А уж демону, современному, с мобильником, на совершенно пижонском Бентли 56 года выпуска, — ему перспективка провести остаток вечности, подбрасывая лопатой уголек к котлам грешников — хуже святой воды под ногти. А ничего не поделаешь... Или все-таки попробовать?	books/2022/08/01/2719253_detail.jpg	2022-07-29	2014-01-01	f	1	2	blagie-znameniya
4	Трое в лодке, не считая собаки. Заметки к ненаписанному роману. Трое на четырех колесах	Джером Клапка Джером Летом 1888 года английский писатель Джером К. Джером, только что вступивший в законный брак, провел медовый месяц на Темзе. Из путевых впечатлений и воспоминаний этой счастливой поры родилась идея одной из самых смешных книг в мировой литературе. Приключения незадачливых, добродушных англичан, путешествующих по Темзе, о которых Джером написал в романе «Трое в лодке, не считая собаки» и в его продолжении «Трое на четырех колесах» (а также созданный между ними небольшой шедевр «Заметки к ненаписанному роману», в котором узнаются все те же незабываемые герои), стали хорошо известны даже в самых отдаленных уголках планеты. С неизменной любовью читатели относятся к произведениям Джерома и в России, где его замечательный талант оценили едва ли не выше, чем на родине писателя. А благодаря блистательной экранизации романа, осуществленной в 1979 году, главные роли в которой сыграли Андрей Миронов, Александр Ширвиндт и Михаил Державин, Джером стал нам еще ближе и понятнее.\r\nВ настоящее издание вошли пять романов Джерома К. Джерома в лучших переводах («Заметки к ненаписанному роману» выходят в полном виде в новом блестящем переводе Александры Глебовской). Эти произведения — не просто идеальное лекарство от скуки и плохого настроения, но также подлинная классика на все времена!	books/2022/08/01/2907344_detail.jpg	2022-07-29	2022-01-01	f	2	1	troe-v-lodke-ne-schitaya-sobaki-zametki-k-nenapisannomu-romanu-troe-na-chetyreh-kolesah
3	Маленький принц	Антуан де Сент-Экзюпери "Маленький принц" — наиболее известное (переведено более чем на 180 языков) произведение Экзюпери, написанное незадолго до смерти автора и им же проиллюстрированное. Эта печальная, мудрая, человечная сказка предназначена, скорее, взрослым, чем детям. В ней рассказано о самом важном: о дружбе и любви, о долге и верности…Читая эту чудесную историю, и улыбнешься, и взгрустнешь, и непременно задумаешься, над тем, что не всегда можно понять разумом… Как говорил Маленький принц — "увидишь сердцем". В издание также включен сборник эссе "Планета людей".	books/2022/08/01/2530704_detail.jpg	2022-07-29	2021-01-01	f	2	1	malenkij-princ
11	Граф Монте-Кристо. Том 2	"Граф Монте-Кристо", один из самых популярных романов Александра Дюма, имеет ошеломительный успех у читателей. Его сюжет автор почерпнул из архивов парижской полиции. Подлинная жизнь сапожника Франсуа Пико, ставшего прототипом Эдмона Дантеса, под пером настоящего художника превратилась в захватывающую книгу о мученике замка Иф и о парижском ангеле мщения.	books/2022/08/03/2902521_detail.jpg	2022-08-03	2022-01-01	f	2	1	graf-monte-kristo-tom-2
10	Граф Монте-Кристо. Том 1	"Граф Монте-Кристо", один из самых популярных романов Александра Дюма, имеет ошеломительный успех у читателей. Его сюжет автор почерпнул из архивов парижской полиции. Подлинная жизнь сапожника Франсуа Пико, ставшего прототипом Эдмона Дантеса, под пером настоящего художника превратилась в захватывающую книгу о мученике замка Иф и о парижском ангеле мщения.	books/2022/08/03/2902520_detail.jpg	2022-08-03	2022-01-01	f	2	1	graf-monte-kristo-tom-1
12	Затерянный мир	Репортер Эдвард Мелоун и профессор Челленджер организуют научную экспедицию в Южную Америку, чтобы подтвердить или опровергнуть утверждение, о якобы сохранившихся там доисторических животных. Экспедиция действительно обнаруживает на загадочном плато динозавров…\r\n.Кроме увлекательного сюжета, ярких запоминающихся персонажей, в книге вы найдете интереснейшие комментарии, которые помогут глубже проникнуть в произведение, узнать о первобытных людях, разобраться в многочисленных доисторических животных, которые обитали на нашей Земле миллионы лет назад.	books/2022/08/03/2587042_detail.jpg	2022-08-03	2018-01-01	f	2	2	zateryannyj-mir
13	Счастье - это просто! Несерьезные серьезные письма	Юрий Владимирович Никулин… Люди смеялись его цирковым репризам (а среди них «Насос», «Лошадки», «Бревно», «Розы и шипы»), восхищались потрясающе сыгранными ролями в фильмах «Кавказская пленница…», «Пес Барбос и необычный кросс», «Самогонщики», «Бриллиантовая рука», «Старики-разбойники» (перечислять можно бесконечно), цитировали из них его остроумные фразы, ходили в знаменитый цирк на Цветном бульваре… Он был кумиром миллионов.\r\nНастоящая книга — трогательные и очень подробные письма артиста к матери — Лидии Николаевне, которые издаются впервые. Их география обширна — Америка, Канада, Австралия, Франция и другие страны, — и всюду Ю. Никулин вспоминал о доме и родных людях, что придавало ему сил и дарило вдохновение.\r\nСерьезные, слегка ироничные, в меру нежные, а порой и хлесткие, эти письма, словно звенья одной цепи, соединенные друг с другом, рассказывают, о чем думал, что чувствовал, где был и что делал всеми любимый артист Юрий Никулин в свои «золотые годы».	books/2022/08/04/2880020_detail.jpg	2022-08-04	2018-01-01	f	3	2	schaste-eto-prosto-nesereznye-sereznye-pisma
\.


--
-- TOC entry 3486 (class 0 OID 17417)
-- Dependencies: 224
-- Data for Name: book_book_author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_book_author (id, book_id, author_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	5	6
7	6	8
8	6	7
9	7	9
10	8	10
11	8	11
12	9	12
13	10	2
14	11	2
15	12	1
16	13	11
\.


--
-- TOC entry 3489 (class 0 OID 17422)
-- Dependencies: 227
-- Data for Name: book_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_genre (id, genre_name, is_deleted, slug) FROM stdin;
3	Юмор	f	yumor
2	Приключения	f	priklyucheniya
1	Детектив	f	detektiv
\.


--
-- TOC entry 3491 (class 0 OID 17428)
-- Dependencies: 229
-- Data for Name: book_publishinghouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_publishinghouse (id, publishing_house_name, address, contact_phone, email, website_link, date_add, is_deleted) FROM stdin;
1	Дрофа	127018, Москва, Сущевский вал, 49.	795-05-44	info@drofa.ru	http://www.drofa.ru	2022-08-01 11:23:09.597873+05	f
2	Утро	г. Санкт-Петербург, наб. реки Фонтанки, 51	88122728550	info@utro.ru	\N	2022-08-01 11:25:42.708399+05	f
\.


--
-- TOC entry 3493 (class 0 OID 17434)
-- Dependencies: 231
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-08-01 11:23:09.600866+05	1	Дрофа	1	[{"added": {}}]	9	1
2	2022-08-01 11:25:42.710363+05	2	Утро	1	[{"added": {}}]	9	1
3	2022-08-01 11:30:33.736785+05	1	Артур Конан Дойл	1	[{"added": {}}]	7	1
4	2022-08-01 11:31:33.362507+05	1	Весь Шерлок Холмс	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0438", "ID \\u0438\\u0437\\u0434\\u0430\\u0442\\u0435\\u043b\\u044c\\u0441\\u0442\\u0432\\u0430", "ID \\u0430\\u0432\\u0442\\u043e\\u0440\\u043e\\u0432"]}}]	10	1
5	2022-08-01 12:06:04.386181+05	2	Александр Дюма	1	[{"added": {}}]	7	1
6	2022-08-01 12:06:24.447706+05	2	Три мушкетера	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0438", "ID \\u0438\\u0437\\u0434\\u0430\\u0442\\u0435\\u043b\\u044c\\u0441\\u0442\\u0432\\u0430", "ID \\u0430\\u0432\\u0442\\u043e\\u0440\\u043e\\u0432"]}}]	10	1
7	2022-08-01 12:09:55.443757+05	3	Антуан де Сент-Экзюпери	1	[{"added": {}}]	7	1
8	2022-08-01 12:10:17.910711+05	3	Маленький принц	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0438", "ID \\u0438\\u0437\\u0434\\u0430\\u0442\\u0435\\u043b\\u044c\\u0441\\u0442\\u0432\\u0430", "ID \\u0430\\u0432\\u0442\\u043e\\u0440\\u043e\\u0432"]}}]	10	1
9	2022-08-01 12:12:26.755874+05	4	Джером Клапка	1	[{"added": {}}]	7	1
10	2022-08-01 12:12:51.938469+05	4	Джером Клапка	2	[{"changed": {"fields": ["\\u042f\\u0437\\u044b\\u043a\\u0438 \\u043d\\u0430 \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0437 \\u043f\\u0438\\u0441\\u0430\\u043b \\u0430\\u0432\\u0442\\u043e\\u0440"]}}]	7	1
11	2022-08-01 12:12:58.874385+05	1	Артур Конан Дойл	2	[{"changed": {"fields": ["\\u042f\\u0437\\u044b\\u043a\\u0438 \\u043d\\u0430 \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0437 \\u043f\\u0438\\u0441\\u0430\\u043b \\u0430\\u0432\\u0442\\u043e\\u0440"]}}]	7	1
12	2022-08-01 12:13:40.712613+05	4	Трое в лодке, не считая собаки. Заметки к ненаписанному роману. Трое на четырех колесах	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0438", "ID \\u0438\\u0437\\u0434\\u0430\\u0442\\u0435\\u043b\\u044c\\u0441\\u0442\\u0432\\u0430", "ID \\u0430\\u0432\\u0442\\u043e\\u0440\\u043e\\u0432"]}}]	10	1
13	2022-08-01 12:15:40.74516+05	5	Евгений Петров	1	[{"added": {}}]	7	1
14	2022-08-01 12:16:53.568905+05	6	Илья Ильф	1	[{"added": {}}]	7	1
15	2022-08-01 12:17:16.245883+05	5	Двенадцать стульев	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0438", "ID \\u0438\\u0437\\u0434\\u0430\\u0442\\u0435\\u043b\\u044c\\u0441\\u0442\\u0432\\u0430", "ID \\u0430\\u0432\\u0442\\u043e\\u0440\\u043e\\u0432"]}}]	10	1
16	2022-08-01 12:32:53.041871+05	7	Терри Пратчетт	1	[{"added": {}}]	7	1
17	2022-08-01 12:34:00.081154+05	8	Нил Гейман	1	[{"added": {}}]	7	1
18	2022-08-01 12:34:29.603444+05	6	Благие знамения	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u043a\\u043d\\u0438\\u0433\\u0438", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0438", "ID \\u0438\\u0437\\u0434\\u0430\\u0442\\u0435\\u043b\\u044c\\u0441\\u0442\\u0432\\u0430", "ID \\u0430\\u0432\\u0442\\u043e\\u0440\\u043e\\u0432"]}}]	10	1
19	2022-08-01 12:36:03.310877+05	9	Марк Твен	1	[{"added": {}}]	7	1
20	2022-08-01 12:36:22.757933+05	7	Приключения Тома Сойера	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0438", "ID \\u0438\\u0437\\u0434\\u0430\\u0442\\u0435\\u043b\\u044c\\u0441\\u0442\\u0432\\u0430", "ID \\u0430\\u0432\\u0442\\u043e\\u0440\\u043e\\u0432"]}}]	10	1
21	2022-08-01 12:37:59.558324+05	10	Фаина Раневская	1	[{"added": {}}]	7	1
22	2022-08-01 12:39:14.704232+05	11	Юрий Никулин	1	[{"added": {}}]	7	1
23	2022-08-01 12:39:56.897562+05	8	Потерял сознание, очнулся - гипс	2	[{"changed": {"fields": ["ID \\u0438\\u0437\\u0434\\u0430\\u0442\\u0435\\u043b\\u044c\\u0441\\u0442\\u0432\\u0430", "ID \\u0430\\u0432\\u0442\\u043e\\u0440\\u043e\\u0432"]}}]	10	1
24	2022-08-01 12:42:31.495534+05	8	Потерял сознание, очнулся - гипс	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0438"]}}]	10	1
25	2022-08-01 12:51:23.42774+05	12	Лейкин Николай	1	[{"added": {}}]	7	1
26	2022-08-01 12:52:12.681913+05	9	Записки Полкана. Повесть из собачьей жизни.	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0438", "ID \\u0438\\u0437\\u0434\\u0430\\u0442\\u0435\\u043b\\u044c\\u0441\\u0442\\u0432\\u0430", "ID \\u0430\\u0432\\u0442\\u043e\\u0440\\u043e\\u0432"]}}]	10	1
27	2022-08-02 14:53:42.615463+05	3	Юмор	2	[{"changed": {"fields": ["URL \\u0430\\u0434\\u0440\\u0435\\u0441"]}}]	8	1
28	2022-08-02 14:53:49.43487+05	2	Приключения	2	[{"changed": {"fields": ["URL \\u0430\\u0434\\u0440\\u0435\\u0441"]}}]	8	1
29	2022-08-02 14:53:54.358875+05	1	Детектив	2	[{"changed": {"fields": ["URL \\u0430\\u0434\\u0440\\u0435\\u0441"]}}]	8	1
30	2022-08-02 14:54:18.811586+05	1	Детектив	2	[]	8	1
31	2022-08-02 14:54:27.403228+05	9	Записки Полкана. Повесть из собачьей жизни.	2	[{"changed": {"fields": ["URL \\u0430\\u0434\\u0440\\u0435\\u0441"]}}]	10	1
32	2022-08-02 14:54:33.318165+05	8	Потерял сознание, очнулся - гипс	2	[{"changed": {"fields": ["URL \\u0430\\u0434\\u0440\\u0435\\u0441"]}}]	10	1
33	2022-08-02 14:54:38.769464+05	7	Приключения Тома Сойера	2	[{"changed": {"fields": ["URL \\u0430\\u0434\\u0440\\u0435\\u0441"]}}]	10	1
34	2022-08-02 14:54:44.781146+05	6	Благие знамения	2	[{"changed": {"fields": ["URL \\u0430\\u0434\\u0440\\u0435\\u0441"]}}]	10	1
35	2022-08-02 14:54:49.770234+05	5	Двенадцать стульев	2	[{"changed": {"fields": ["URL \\u0430\\u0434\\u0440\\u0435\\u0441"]}}]	10	1
36	2022-08-02 14:54:56.540468+05	4	Трое в лодке, не считая собаки. Заметки к ненаписанному роману. Трое на четырех колесах	2	[{"changed": {"fields": ["URL \\u0430\\u0434\\u0440\\u0435\\u0441"]}}]	10	1
37	2022-08-02 14:55:04.265115+05	3	Маленький принц	2	[{"changed": {"fields": ["URL \\u0430\\u0434\\u0440\\u0435\\u0441"]}}]	10	1
38	2022-08-02 14:55:09.045773+05	2	Три мушкетера	2	[{"changed": {"fields": ["URL \\u0430\\u0434\\u0440\\u0435\\u0441"]}}]	10	1
39	2022-08-02 14:55:14.279179+05	1	Весь Шерлок Холмс	2	[{"changed": {"fields": ["URL \\u0430\\u0434\\u0440\\u0435\\u0441"]}}]	10	1
40	2022-08-03 12:31:23.210089+05	10	Граф Монте-Кристо. Том 1	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0438"]}}]	10	1
41	2022-08-03 16:39:54.93001+05	11	Граф Монте-Кристо. Том 2	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0438"]}}]	10	1
\.


--
-- TOC entry 3495 (class 0 OID 17441)
-- Dependencies: 233
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	book	author
8	book	genre
9	book	publishinghouse
10	book	book
\.


--
-- TOC entry 3497 (class 0 OID 17445)
-- Dependencies: 235
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-07-30 20:45:43.195066+05
2	auth	0001_initial	2022-07-30 20:45:43.313112+05
3	admin	0001_initial	2022-07-30 20:45:43.346683+05
4	admin	0002_logentry_remove_auto_add	2022-07-30 20:45:43.357653+05
5	admin	0003_logentry_add_action_flag_choices	2022-07-30 20:45:43.364237+05
6	contenttypes	0002_remove_content_type_name	2022-07-30 20:45:43.383229+05
7	auth	0002_alter_permission_name_max_length	2022-07-30 20:45:43.392204+05
8	auth	0003_alter_user_email_max_length	2022-07-30 20:45:43.402176+05
9	auth	0004_alter_user_username_opts	2022-07-30 20:45:43.410189+05
10	auth	0005_alter_user_last_login_null	2022-07-30 20:45:43.420128+05
11	auth	0006_require_contenttypes_0002	2022-07-30 20:45:43.422124+05
12	auth	0007_alter_validators_add_error_messages	2022-07-30 20:45:43.428106+05
13	auth	0008_alter_user_username_max_length	2022-07-30 20:45:43.445259+05
14	auth	0009_alter_user_last_name_max_length	2022-07-30 20:45:43.455232+05
15	auth	0010_alter_group_name_max_length	2022-07-30 20:45:43.463208+05
16	auth	0011_update_proxy_permissions	2022-07-30 20:45:43.472941+05
17	auth	0012_alter_user_first_name_max_length	2022-07-30 20:45:43.478889+05
18	book	0001_initial	2022-07-30 20:45:43.561668+05
19	sessions	0001_initial	2022-07-30 20:45:43.5772+05
20	book	0002_alter_book_options	2022-08-01 12:56:51.452634+05
21	book	0003_book_slug_genre_slug	2022-08-01 17:03:06.39995+05
22	book	0004_alter_book_genre	2022-08-01 17:04:33.447341+05
23	book	0003_alter_book_genre	2022-08-02 08:53:19.270748+05
24	book	0004_book_slug_genre_slug	2022-08-02 08:59:10.652174+05
\.


--
-- TOC entry 3499 (class 0 OID 17451)
-- Dependencies: 237
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
j5p21h83in0r993tefl00gf88brkmitn	.eJxVjDEOwjAMRe-SGUUJTuLCyM4ZKie2SQG1UtNOiLtDpQ6w_vfef5me1qX2a5O5H9icjTeH3y1Teci4Ab7TeJtsmcZlHrLdFLvTZq8Ty_Oyu38HlVr91ioKx-BKCRE1gQK4kEkBg4uxcPbSsfoOSDgpu5MEjwmQkkSkgGjeH_EuOAk:1oIN9W:B22hwt-jzCki6bTB41n_klOzVtWid7_iJ7-bWVx4F3c	2022-08-15 09:35:38.045679+05
\.


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 217
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 218
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 220
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 222
-- Name: book_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_author_id_seq', 12, true);


--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 225
-- Name: book_book_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_book_author_id_seq', 16, true);


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 226
-- Name: book_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_book_id_seq', 13, true);


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 228
-- Name: book_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_genre_id_seq', 3, true);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 230
-- Name: book_publishinghouse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_publishinghouse_id_seq', 2, true);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 232
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 41, true);


--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 234
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 236
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- TOC entry 3250 (class 2606 OID 17471)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3255 (class 2606 OID 17473)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3258 (class 2606 OID 17475)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3252 (class 2606 OID 17477)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3261 (class 2606 OID 17479)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3263 (class 2606 OID 17481)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3271 (class 2606 OID 17483)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 17485)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 3265 (class 2606 OID 17487)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3277 (class 2606 OID 17489)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 17491)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 3268 (class 2606 OID 17493)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 3282 (class 2606 OID 17495)
-- Name: book_author book_author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT book_author_pkey PRIMARY KEY (id);


--
-- TOC entry 3293 (class 2606 OID 17497)
-- Name: book_book_author book_book_author_book_id_author_id_35638b9e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_book_author
    ADD CONSTRAINT book_book_author_book_id_author_id_35638b9e_uniq UNIQUE (book_id, author_id);


--
-- TOC entry 3295 (class 2606 OID 17499)
-- Name: book_book_author book_book_author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_book_author
    ADD CONSTRAINT book_book_author_pkey PRIMARY KEY (id);


--
-- TOC entry 3285 (class 2606 OID 17501)
-- Name: book_book book_book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_book
    ADD CONSTRAINT book_book_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 17618)
-- Name: book_book book_book_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_book
    ADD CONSTRAINT book_book_slug_key UNIQUE (slug);


--
-- TOC entry 3299 (class 2606 OID 17503)
-- Name: book_genre book_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_genre
    ADD CONSTRAINT book_genre_pkey PRIMARY KEY (id);


--
-- TOC entry 3302 (class 2606 OID 17620)
-- Name: book_genre book_genre_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_genre
    ADD CONSTRAINT book_genre_slug_key UNIQUE (slug);


--
-- TOC entry 3304 (class 2606 OID 17505)
-- Name: book_publishinghouse book_publishinghouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_publishinghouse
    ADD CONSTRAINT book_publishinghouse_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 17507)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3310 (class 2606 OID 17509)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3312 (class 2606 OID 17511)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3314 (class 2606 OID 17513)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3317 (class 2606 OID 17515)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3248 (class 1259 OID 17516)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3253 (class 1259 OID 17517)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3256 (class 1259 OID 17518)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3259 (class 1259 OID 17519)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3269 (class 1259 OID 17520)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 3272 (class 1259 OID 17521)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 3275 (class 1259 OID 17522)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3278 (class 1259 OID 17523)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 3266 (class 1259 OID 17524)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 3290 (class 1259 OID 17525)
-- Name: book_book_author_author_id_d92c9564; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX book_book_author_author_id_d92c9564 ON public.book_book_author USING btree (author_id);


--
-- TOC entry 3291 (class 1259 OID 17526)
-- Name: book_book_author_book_id_a2a4a10d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX book_book_author_book_id_a2a4a10d ON public.book_book_author USING btree (book_id);


--
-- TOC entry 3283 (class 1259 OID 17527)
-- Name: book_book_genre_id_bc3e2c4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX book_book_genre_id_bc3e2c4b ON public.book_book USING btree (genre_id);


--
-- TOC entry 3286 (class 1259 OID 17528)
-- Name: book_book_publishing_house_id_efd4328f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX book_book_publishing_house_id_efd4328f ON public.book_book USING btree (publishing_house_id);


--
-- TOC entry 3287 (class 1259 OID 17621)
-- Name: book_book_slug_685b2be3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX book_book_slug_685b2be3_like ON public.book_book USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3296 (class 1259 OID 17529)
-- Name: book_genre_genre_name_1ea54f56; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX book_genre_genre_name_1ea54f56 ON public.book_genre USING btree (genre_name);


--
-- TOC entry 3297 (class 1259 OID 17530)
-- Name: book_genre_genre_name_1ea54f56_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX book_genre_genre_name_1ea54f56_like ON public.book_genre USING btree (genre_name varchar_pattern_ops);


--
-- TOC entry 3300 (class 1259 OID 17622)
-- Name: book_genre_slug_e1ed67cc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX book_genre_slug_e1ed67cc_like ON public.book_genre USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3305 (class 1259 OID 17531)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3308 (class 1259 OID 17532)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3315 (class 1259 OID 17533)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3318 (class 1259 OID 17534)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3319 (class 2606 OID 17535)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3320 (class 2606 OID 17540)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3321 (class 2606 OID 17545)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3322 (class 2606 OID 17550)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3323 (class 2606 OID 17555)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3324 (class 2606 OID 17560)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3325 (class 2606 OID 17565)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3328 (class 2606 OID 17570)
-- Name: book_book_author book_book_author_author_id_d92c9564_fk_book_author_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_book_author
    ADD CONSTRAINT book_book_author_author_id_d92c9564_fk_book_author_id FOREIGN KEY (author_id) REFERENCES public.book_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3329 (class 2606 OID 17575)
-- Name: book_book_author book_book_author_book_id_a2a4a10d_fk_book_book_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_book_author
    ADD CONSTRAINT book_book_author_book_id_a2a4a10d_fk_book_book_id FOREIGN KEY (book_id) REFERENCES public.book_book(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3327 (class 2606 OID 17612)
-- Name: book_book book_book_genre_id_bc3e2c4b_fk_book_genre_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_book
    ADD CONSTRAINT book_book_genre_id_bc3e2c4b_fk_book_genre_id FOREIGN KEY (genre_id) REFERENCES public.book_genre(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3326 (class 2606 OID 17585)
-- Name: book_book book_book_publishing_house_id_efd4328f_fk_book_publ; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_book
    ADD CONSTRAINT book_book_publishing_house_id_efd4328f_fk_book_publ FOREIGN KEY (publishing_house_id) REFERENCES public.book_publishinghouse(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3330 (class 2606 OID 17590)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3331 (class 2606 OID 17595)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2022-08-04 13:01:19

--
-- PostgreSQL database dump complete
--

