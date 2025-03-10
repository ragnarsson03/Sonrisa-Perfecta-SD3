--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2025-03-05 00:57:19

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
-- TOC entry 229 (class 1259 OID 28856)
-- Name: citas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.citas (
    id bigint NOT NULL,
    paciente_id bigint NOT NULL,
    dentista_id bigint NOT NULL,
    fecha_hora timestamp(0) without time zone NOT NULL,
    tipo_cita character varying(255) NOT NULL,
    estado character varying(255) NOT NULL,
    notas text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    fecha date,
    hora time(0) without time zone,
    CONSTRAINT citas_estado_check CHECK (((estado)::text = ANY ((ARRAY['Programada'::character varying, 'Confirmada'::character varying, 'Cancelada'::character varying, 'Completada'::character varying])::text[])))
);


ALTER TABLE public.citas OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 28855)
-- Name: citas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.citas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.citas_id_seq OWNER TO postgres;

--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 228
-- Name: citas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.citas_id_seq OWNED BY public.citas.id;


--
-- TOC entry 223 (class 1259 OID 28817)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 28816)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 222
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 231 (class 1259 OID 28876)
-- Name: historiales_clinicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historiales_clinicos (
    id bigint NOT NULL,
    paciente_id bigint NOT NULL,
    dentista_id bigint NOT NULL,
    fecha_consulta date NOT NULL,
    diagnostico text NOT NULL,
    tratamiento text NOT NULL,
    observaciones text,
    radiografia_url character varying(255),
    prescripcion text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    medicamentos text,
    estado character varying(255) DEFAULT 'En Progreso'::character varying NOT NULL
);


ALTER TABLE public.historiales_clinicos OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 28875)
-- Name: historiales_clinicos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historiales_clinicos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historiales_clinicos_id_seq OWNER TO postgres;

--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 230
-- Name: historiales_clinicos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historiales_clinicos_id_seq OWNED BY public.historiales_clinicos.id;


--
-- TOC entry 235 (class 1259 OID 28928)
-- Name: inventario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventario (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text,
    cantidad integer NOT NULL,
    cantidad_minima integer DEFAULT 10 NOT NULL,
    proveedor character varying(255) NOT NULL,
    fecha_caducidad date,
    precio_unitario numeric(10,2) NOT NULL,
    ubicacion character varying(255),
    activo boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.inventario OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 28927)
-- Name: inventario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventario_id_seq OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 234
-- Name: inventario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventario_id_seq OWNED BY public.inventario.id;


--
-- TOC entry 218 (class 1259 OID 28792)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 28791)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 217
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 227 (class 1259 OID 28841)
-- Name: pacientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pacientes (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    apellidos character varying(255) NOT NULL,
    dni character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    direccion text NOT NULL,
    fecha_nacimiento date NOT NULL,
    genero character varying(255) NOT NULL,
    alergias text,
    antecedentes_medicos text,
    activo boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    CONSTRAINT pacientes_genero_check CHECK (((genero)::text = ANY ((ARRAY['M'::character varying, 'F'::character varying, 'Otro'::character varying])::text[])))
);


ALTER TABLE public.pacientes OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 28840)
-- Name: pacientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pacientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pacientes_id_seq OWNER TO postgres;

--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 226
-- Name: pacientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pacientes_id_seq OWNED BY public.pacientes.id;


--
-- TOC entry 241 (class 1259 OID 28972)
-- Name: pagos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagos (
    id bigint NOT NULL,
    paciente_id bigint NOT NULL,
    tratamiento_id bigint,
    monto numeric(10,2) NOT NULL,
    metodo_pago character varying(255) NOT NULL,
    estado character varying(255) NOT NULL,
    fecha_pago date,
    numero_factura character varying(255),
    notas text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    CONSTRAINT pagos_estado_check CHECK (((estado)::text = ANY ((ARRAY['Pendiente'::character varying, 'Completado'::character varying, 'Cancelado'::character varying])::text[]))),
    CONSTRAINT pagos_metodo_pago_check CHECK (((metodo_pago)::text = ANY ((ARRAY['Efectivo'::character varying, 'Tarjeta'::character varying, 'Transferencia'::character varying])::text[])))
);


ALTER TABLE public.pagos OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 28971)
-- Name: pagos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pagos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pagos_id_seq OWNER TO postgres;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 240
-- Name: pagos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagos_id_seq OWNED BY public.pagos.id;


--
-- TOC entry 221 (class 1259 OID 28809)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 28829)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 28828)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 224
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 239 (class 1259 OID 28952)
-- Name: role_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_user (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    role_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.role_user OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 28951)
-- Name: role_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_user_id_seq OWNER TO postgres;

--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 238
-- Name: role_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_user_id_seq OWNED BY public.role_user.id;


--
-- TOC entry 237 (class 1259 OID 28939)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 28938)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 236
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 233 (class 1259 OID 28895)
-- Name: tratamientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tratamientos (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text NOT NULL,
    precio numeric(10,2) NOT NULL,
    duracion_aproximada integer NOT NULL,
    activo boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.tratamientos OWNER TO postgres;

--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN tratamientos.duracion_aproximada; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tratamientos.duracion_aproximada IS 'Duración en minutos';


--
-- TOC entry 232 (class 1259 OID 28894)
-- Name: tratamientos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tratamientos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tratamientos_id_seq OWNER TO postgres;

--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 232
-- Name: tratamientos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tratamientos_id_seq OWNED BY public.tratamientos.id;


--
-- TOC entry 220 (class 1259 OID 28799)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    role character varying(255) DEFAULT 'user'::character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 28798)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4708 (class 2604 OID 28859)
-- Name: citas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas ALTER COLUMN id SET DEFAULT nextval('public.citas_id_seq'::regclass);


--
-- TOC entry 4703 (class 2604 OID 28820)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 4709 (class 2604 OID 28879)
-- Name: historiales_clinicos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiales_clinicos ALTER COLUMN id SET DEFAULT nextval('public.historiales_clinicos_id_seq'::regclass);


--
-- TOC entry 4713 (class 2604 OID 28931)
-- Name: inventario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario ALTER COLUMN id SET DEFAULT nextval('public.inventario_id_seq'::regclass);


--
-- TOC entry 4700 (class 2604 OID 28795)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 4706 (class 2604 OID 28844)
-- Name: pacientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes ALTER COLUMN id SET DEFAULT nextval('public.pacientes_id_seq'::regclass);


--
-- TOC entry 4718 (class 2604 OID 28975)
-- Name: pagos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos ALTER COLUMN id SET DEFAULT nextval('public.pagos_id_seq'::regclass);


--
-- TOC entry 4705 (class 2604 OID 28832)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 4717 (class 2604 OID 28955)
-- Name: role_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user ALTER COLUMN id SET DEFAULT nextval('public.role_user_id_seq'::regclass);


--
-- TOC entry 4716 (class 2604 OID 28942)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 4711 (class 2604 OID 28898)
-- Name: tratamientos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratamientos ALTER COLUMN id SET DEFAULT nextval('public.tratamientos_id_seq'::regclass);


--
-- TOC entry 4701 (class 2604 OID 28802)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4933 (class 0 OID 28856)
-- Dependencies: 229
-- Data for Name: citas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.citas (id, paciente_id, dentista_id, fecha_hora, tipo_cita, estado, notas, created_at, updated_at, deleted_at, fecha, hora) FROM stdin;
1	1	1	0123-03-12 12:31:00	Limpieza Dental	Programada	123123	2025-02-17 05:36:20	2025-02-17 02:12:34	2025-02-17 02:12:34	\N	\N
2	1	1	2025-01-20 12:12:00	Emergencia	Programada	123	2025-02-17 02:13:07	2025-02-17 02:13:07	\N	\N	\N
\.


--
-- TOC entry 4927 (class 0 OID 28817)
-- Dependencies: 223
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 4935 (class 0 OID 28876)
-- Dependencies: 231
-- Data for Name: historiales_clinicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historiales_clinicos (id, paciente_id, dentista_id, fecha_consulta, diagnostico, tratamiento, observaciones, radiografia_url, prescripcion, created_at, updated_at, deleted_at, medicamentos, estado) FROM stdin;
6	1	1	2025-02-17	123	123123	3123	\N	\N	2025-02-17 05:29:12	2025-02-17 05:29:12	\N	12312	En Progreso
\.


--
-- TOC entry 4939 (class 0 OID 28928)
-- Dependencies: 235
-- Data for Name: inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventario (id, nombre, descripcion, cantidad, cantidad_minima, proveedor, fecha_caducidad, precio_unitario, ubicacion, activo, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 4922 (class 0 OID 28792)
-- Dependencies: 218
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2019_08_19_000000_create_failed_jobs_table	1
4	2019_12_14_000001_create_personal_access_tokens_table	1
5	2025_02_15_222622_create_pacientes_table	1
6	2025_02_15_222633_create_citas_table	1
7	2025_02_15_222643_create_historiales_clinicos_table	1
8	2025_02_15_222653_create_tratamientos_table	1
9	2025_02_15_222703_create_pagos_table	1
10	2025_02_15_222759_create_inventario_table	1
11	2025_02_15_233400_create_roles_table	1
12	2025_02_17_024300_rename_tratamiento_realizado_to_tratamiento	1
13	2025_02_17_025700_add_role_to_users_table	1
14	2025_02_17_030800_modify_pagos_table	1
15	2025_02_17_031000_recreate_pagos_table	1
16	2025_02_17_051019_add_medicamentos_to_historiales_clinicos	2
17	2025_02_17_051830_rename_fecha_to_fecha_consulta_in_historiales_clinicos	3
19	2025_02_17_014152_add_estado_to_historiales_clinicos	4
20	2025_02_17_022726_add_fecha_pago_to_pagos_table	5
21	2025_02_17_024709_add_fecha_hora_to_citas_table	5
22	2025_02_17_031022_modify_pagos_estado_check	6
\.


--
-- TOC entry 4931 (class 0 OID 28841)
-- Dependencies: 227
-- Data for Name: pacientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pacientes (id, nombre, apellidos, dni, telefono, email, direccion, fecha_nacimiento, genero, alergias, antecedentes_medicos, activo, created_at, updated_at, deleted_at) FROM stdin;
1	Satoru	Gojo	30346056	041490838	samirduran1000@gmail.com	Los Jardines del Valle	2003-07-02	M	Ninguna	Ninguna	t	2025-02-17 03:12:47	2025-02-17 03:12:47	\N
\.


--
-- TOC entry 4945 (class 0 OID 28972)
-- Dependencies: 241
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pagos (id, paciente_id, tratamiento_id, monto, metodo_pago, estado, fecha_pago, numero_factura, notas, created_at, updated_at, deleted_at) FROM stdin;
1	1	\N	123123.00	Transferencia	Completado	2025-02-17	\N	123123	2025-02-17 03:58:53	2025-02-17 02:11:36	2025-02-17 02:11:36
2	1	\N	123123.00	Tarjeta	Pendiente	2025-02-25	\N	123123	2025-02-17 02:12:02	2025-02-17 02:12:02	\N
\.


--
-- TOC entry 4925 (class 0 OID 28809)
-- Dependencies: 221
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 4929 (class 0 OID 28829)
-- Dependencies: 225
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4943 (class 0 OID 28952)
-- Dependencies: 239
-- Data for Name: role_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_user (id, user_id, role_id, created_at, updated_at) FROM stdin;
1	1	1	\N	\N
\.


--
-- TOC entry 4941 (class 0 OID 28939)
-- Dependencies: 237
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, slug, description, created_at, updated_at) FROM stdin;
1	Administrador	admin	Acceso total al sistema	2025-02-17 03:11:10	2025-02-17 03:11:10
2	Dentista	dentist	Acceso a historiales clínicos, citas y tratamientos	2025-02-17 03:11:10	2025-02-17 03:11:10
3	Recepcionista	receptionist	Acceso a gestión de citas y pagos	2025-02-17 03:11:10	2025-02-17 03:11:10
\.


--
-- TOC entry 4937 (class 0 OID 28895)
-- Dependencies: 233
-- Data for Name: tratamientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tratamientos (id, nombre, descripcion, precio, duracion_aproximada, activo, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 4924 (class 0 OID 28799)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role) FROM stdin;
1	Admin	admin@admin.com	\N	$2y$10$Xb1st2HxAv/BJhFCJ8R4auPJPymRubhjeOWGthrdd7/FWPT2QOD6.	\N	2025-02-17 03:11:10	2025-02-17 03:11:10	admin
\.


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 228
-- Name: citas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.citas_id_seq', 2, true);


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 222
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 230
-- Name: historiales_clinicos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historiales_clinicos_id_seq', 6, true);


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 234
-- Name: inventario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventario_id_seq', 1, false);


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 217
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 22, true);


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 226
-- Name: pacientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pacientes_id_seq', 1, true);


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 240
-- Name: pagos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagos_id_seq', 2, true);


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 224
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 238
-- Name: role_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_user_id_seq', 1, true);


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 236
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 232
-- Name: tratamientos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tratamientos_id_seq', 1, false);


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 4747 (class 2606 OID 28864)
-- Name: citas citas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_pkey PRIMARY KEY (id);


--
-- TOC entry 4732 (class 2606 OID 28825)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4734 (class 2606 OID 28827)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 4749 (class 2606 OID 28883)
-- Name: historiales_clinicos historiales_clinicos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiales_clinicos
    ADD CONSTRAINT historiales_clinicos_pkey PRIMARY KEY (id);


--
-- TOC entry 4753 (class 2606 OID 28937)
-- Name: inventario inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id);


--
-- TOC entry 4724 (class 2606 OID 28797)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4741 (class 2606 OID 28852)
-- Name: pacientes pacientes_dni_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_dni_unique UNIQUE (dni);


--
-- TOC entry 4743 (class 2606 OID 28854)
-- Name: pacientes pacientes_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_email_unique UNIQUE (email);


--
-- TOC entry 4745 (class 2606 OID 28850)
-- Name: pacientes pacientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id);


--
-- TOC entry 4765 (class 2606 OID 28993)
-- Name: pagos pagos_numero_factura_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_numero_factura_unique UNIQUE (numero_factura);


--
-- TOC entry 4767 (class 2606 OID 28981)
-- Name: pagos pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_pkey PRIMARY KEY (id);


--
-- TOC entry 4730 (class 2606 OID 28815)
-- Name: password_resets password_resets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_pkey PRIMARY KEY (email);


--
-- TOC entry 4736 (class 2606 OID 28836)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4738 (class 2606 OID 28839)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 4761 (class 2606 OID 28957)
-- Name: role_user role_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_pkey PRIMARY KEY (id);


--
-- TOC entry 4763 (class 2606 OID 28969)
-- Name: role_user role_user_user_id_role_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_user_id_role_id_unique UNIQUE (user_id, role_id);


--
-- TOC entry 4755 (class 2606 OID 28948)
-- Name: roles roles_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_unique UNIQUE (name);


--
-- TOC entry 4757 (class 2606 OID 28946)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4759 (class 2606 OID 28950)
-- Name: roles roles_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_slug_unique UNIQUE (slug);


--
-- TOC entry 4751 (class 2606 OID 28903)
-- Name: tratamientos tratamientos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratamientos
    ADD CONSTRAINT tratamientos_pkey PRIMARY KEY (id);


--
-- TOC entry 4726 (class 2606 OID 28808)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 4728 (class 2606 OID 28806)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4739 (class 1259 OID 28837)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 4768 (class 2606 OID 28870)
-- Name: citas citas_dentista_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_dentista_id_foreign FOREIGN KEY (dentista_id) REFERENCES public.users(id);


--
-- TOC entry 4769 (class 2606 OID 28865)
-- Name: citas citas_paciente_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_paciente_id_foreign FOREIGN KEY (paciente_id) REFERENCES public.pacientes(id);


--
-- TOC entry 4770 (class 2606 OID 28889)
-- Name: historiales_clinicos historiales_clinicos_dentista_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiales_clinicos
    ADD CONSTRAINT historiales_clinicos_dentista_id_foreign FOREIGN KEY (dentista_id) REFERENCES public.users(id);


--
-- TOC entry 4771 (class 2606 OID 28884)
-- Name: historiales_clinicos historiales_clinicos_paciente_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiales_clinicos
    ADD CONSTRAINT historiales_clinicos_paciente_id_foreign FOREIGN KEY (paciente_id) REFERENCES public.pacientes(id);


--
-- TOC entry 4774 (class 2606 OID 28982)
-- Name: pagos pagos_paciente_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_paciente_id_foreign FOREIGN KEY (paciente_id) REFERENCES public.pacientes(id);


--
-- TOC entry 4775 (class 2606 OID 28987)
-- Name: pagos pagos_tratamiento_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_tratamiento_id_foreign FOREIGN KEY (tratamiento_id) REFERENCES public.tratamientos(id);


--
-- TOC entry 4772 (class 2606 OID 28963)
-- Name: role_user role_user_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 4773 (class 2606 OID 28958)
-- Name: role_user role_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2025-03-05 00:57:21

--
-- PostgreSQL database dump complete
--

