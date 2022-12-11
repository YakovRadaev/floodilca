--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-12-10 23:31:07

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
-- TOC entry 2 (class 3079 OID 17106)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 17065)
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17368)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17369)
-- Name: message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message (
    id bigint NOT NULL,
    filename character varying(255),
    tag character varying(255),
    text character varying(2048),
    user_id bigint,
    status boolean,
    timecreate date
);


ALTER TABLE public.message OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17427)
-- Name: message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.message_id_seq OWNER TO postgres;

--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 219
-- Name: message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.message_id_seq OWNED BY public.message.id;


--
-- TOC entry 215 (class 1259 OID 17376)
-- Name: message_likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message_likes (
    message_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.message_likes OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17173)
-- Name: spring_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spring_session (
    primary_id character(36) NOT NULL,
    session_id character(36) NOT NULL,
    creation_time bigint NOT NULL,
    last_access_time bigint NOT NULL,
    max_inactive_interval integer NOT NULL,
    expiry_time bigint NOT NULL,
    principal_name character varying(100)
);


ALTER TABLE public.spring_session OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17181)
-- Name: spring_session_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spring_session_attributes (
    session_primary_id character(36) NOT NULL,
    attribute_name character varying(200) NOT NULL,
    attribute_bytes bytea NOT NULL
);


ALTER TABLE public.spring_session_attributes OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17381)
-- Name: user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role (
    user_id bigint NOT NULL,
    roles character varying(255)
);


ALTER TABLE public.user_role OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17384)
-- Name: user_subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_subscriptions (
    subscriber_id bigint NOT NULL,
    channel_id bigint NOT NULL
);


ALTER TABLE public.user_subscriptions OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17389)
-- Name: usr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usr (
    id bigint NOT NULL,
    activation_code character varying(255),
    active boolean NOT NULL,
    email character varying(255),
    password character varying(255),
    username character varying(255)
);


ALTER TABLE public.usr OWNER TO postgres;

--
-- TOC entry 3231 (class 2604 OID 17428)
-- Name: message id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message ALTER COLUMN id SET DEFAULT nextval('public.message_id_seq'::regclass);


--
-- TOC entry 3396 (class 0 OID 17065)
-- Dependencies: 210
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (1, '1', 'Init DB', 'SQL', 'V1__Init_DB.sql', 861246912, 'postgres', '2022-12-04 18:33:44.653056', 51, true);
INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (2, '2', 'Add admin', 'SQL', 'V2__Add_admin.sql', -426933476, 'postgres', '2022-12-04 18:33:44.72228', 6, true);
INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (3, '3', 'Encode passwords', 'SQL', 'V3__Encode_passwords.sql', -1018751363, 'postgres', '2022-12-04 18:33:44.73687', 86, true);
INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (4, '4', 'Add subscriptions table', 'SQL', 'V4__Add_subscriptions_table.sql', -1018211939, 'postgres', '2022-12-04 18:33:44.831638', 9, true);
INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (5, '5', 'Add message likes', 'SQL', 'V5__Add_message_likes.sql', -1217612959, 'postgres', '2022-12-04 18:33:44.846664', 7, true);


--
-- TOC entry 3400 (class 0 OID 17369)
-- Dependencies: 214
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.message (id, filename, tag, text, user_id, status, timecreate) VALUES (17, NULL, 'Анекдот', 'Объявление на столбе: «Лечу от всех болезней». Мимо проходит мужик и говорит себе под нос: «Лети, лети, от всех не улетишь».', 8, true, NULL);
INSERT INTO public.message (id, filename, tag, text, user_id, status, timecreate) VALUES (3, '1bd42c13-d0f9-4bc9-a49b-82a40dc1a7b8.jpg', '?', '123', 1, true, NULL);
INSERT INTO public.message (id, filename, tag, text, user_id, status, timecreate) VALUES (19, 'd047c90f-bf46-42f0-b1c9-5cdd16f78af5.stragi.jpg', 'Фильм', 'Ожидаемые новинки 2023. Ммммм... звучит заманчиво!! Буду ждать', 6, true, NULL);
INSERT INTO public.message (id, filename, tag, text, user_id, status, timecreate) VALUES (2, 'a68a36b8-e6fb-41de-8c62-b30df743a0eb.jpg', '1', 'message with user', 1, true, NULL);
INSERT INTO public.message (id, filename, tag, text, user_id, status, timecreate) VALUES (9, '994ab921-0571-4745-b737-fc0084767e83.image-7.jpg', 'вот', 'Дело мастера боится, а от дилетанта просто в ужасе..', 8, true, NULL);
INSERT INTO public.message (id, filename, tag, text, user_id, status, timecreate) VALUES (7, 'e14c47f9-dcf5-4872-b4fd-40ba9a1ce720.finch.jpg', 'Фильм', 'Финча видел кто? Ставьте лайк кому зашло.', 6, true, NULL);
INSERT INTO public.message (id, filename, tag, text, user_id, status, timecreate) VALUES (10, NULL, 'мем', 'Привет, админ. Это я, твой единственный подписчик. Я на протяжении многих лет создавал иллюзию того, что тебя читают много людей, но это был я. Сейчас напишу это сообщение со всех аккаунтов.', 8, true, NULL);
INSERT INTO public.message (id, filename, tag, text, user_id, status, timecreate) VALUES (14, '2ecda188-a042-4676-8371-708809b2110c.50291376.jpg', 'Фильм', 'Уже в кино', 1, true, NULL);
INSERT INTO public.message (id, filename, tag, text, user_id, status, timecreate) VALUES (21, 'b7018159-639a-41c9-ad69-f5046d3aa328.2.jpg', 'тест', 'тест', 1, true, NULL);
INSERT INTO public.message (id, filename, tag, text, user_id, status, timecreate) VALUES (22, 'c138e77d-2930-4c7d-925c-dc9902aaf582.freemarker.jpg', 'тест', 'Еше тест', 6, true, NULL);
INSERT INTO public.message (id, filename, tag, text, user_id, status, timecreate) VALUES (4, '48173283-b54a-42d9-ae1e-4ef3a8571fd3.123.jpg', 'котэ', 'запомните,вот так спать гораздо удобнее', 1, true, NULL);
INSERT INTO public.message (id, filename, tag, text, user_id, status, timecreate) VALUES (5, 'a7f584d8-69c4-4896-a19d-c3c479311206.einstein.jpg', 'цитата', 'Логика может привести Вас от пункта А к пункту Б, а воображение — куда угодно.', 1, true, NULL);
INSERT INTO public.message (id, filename, tag, text, user_id, status, timecreate) VALUES (12, NULL, 'Анекдот про программистов', 'Жил—был программист и было у него два сына — Антон и Неантон.', 11, true, NULL);
INSERT INTO public.message (id, filename, tag, text, user_id, status, timecreate) VALUES (13, '981d6fe0-ae4d-4bf9-bdb5-a72442a3147d.5476023.jpg', 'объява', 'Ох уж эта цифровизация', 11, true, NULL);
INSERT INTO public.message (id, filename, tag, text, user_id, status, timecreate) VALUES (15, '88d1ec54-01a0-4e82-a8ce-cab52263ed08.b-shou.jpg', 'Цитата', 'Чем старше и мудрее человек, тем меньше ему хочется выяснять отношения. Хочется просто встать, пожелать всего хорошего и уйти. Б.Шоу', 8, true, NULL);
INSERT INTO public.message (id, filename, tag, text, user_id, status, timecreate) VALUES (16, NULL, 'Анекдот', 'Встречаются два мужика. Один другому: – Я вчера на охоте был, ежей настрелял – жене на воротник, теще стельки в боты.', 8, true, NULL);


--
-- TOC entry 3401 (class 0 OID 17376)
-- Dependencies: 215
-- Data for Name: message_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.message_likes (message_id, user_id) VALUES (3, 1);
INSERT INTO public.message_likes (message_id, user_id) VALUES (5, 6);
INSERT INTO public.message_likes (message_id, user_id) VALUES (2, 8);
INSERT INTO public.message_likes (message_id, user_id) VALUES (3, 6);
INSERT INTO public.message_likes (message_id, user_id) VALUES (19, 20);
INSERT INTO public.message_likes (message_id, user_id) VALUES (16, 1);
INSERT INTO public.message_likes (message_id, user_id) VALUES (22, 1);


--
-- TOC entry 3397 (class 0 OID 17173)
-- Dependencies: 211
-- Data for Name: spring_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.spring_session (primary_id, session_id, creation_time, last_access_time, max_inactive_interval, expiry_time, principal_name) VALUES ('c8524c94-a20b-4e76-8835-751c2b7c2fbf', '4b8622b6-ebfa-4423-966a-1498cb9fbf8b', 1670697677612, 1670697777941, 1800, 1670699577941, 'admin');


--
-- TOC entry 3398 (class 0 OID 17181)
-- Dependencies: 212
-- Data for Name: spring_session_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('c8524c94-a20b-4e76-8835-751c2b7c2fbf', 'SPRING_SECURITY_CONTEXT', '\xaced00057372003d6f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e636f6e746578742e5365637572697479436f6e74657874496d706c000000000000023a0200014c000e61757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b78707372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e000000000000023a0200024c000b63726564656e7469616c737400124c6a6176612f6c616e672f4f626a6563743b4c00097072696e636970616c71007e0004787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c7371007e0004787001737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00067870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e72001d72752e6578616d2e666c6f6f64696c63612e646f6d61696e2e526f6c6500000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074000541444d494e7871007e000d737200486f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e61757468656e7469636174696f6e2e57656241757468656e7469636174696f6e44657461696c73000000000000023a0200024c000d72656d6f7465416464726573737400124c6a6176612f6c616e672f537472696e673b4c000973657373696f6e496471007e0013787074000f303a303a303a303a303a303a303a3174002436393561353236302d616339392d343366622d383737372d363966356131343962626234707372001d72752e6578616d2e666c6f6f64696c63612e646f6d61696e2e557365725f20aea91328ca4202000a5a00066163746976654c000e61637469766174696f6e436f646571007e00134c0005656d61696c71007e00134c000269647400104c6a6176612f6c616e672f4c6f6e673b4c00086d6573736167657374000f4c6a6176612f7574696c2f5365743b4c000870617373776f726471007e00134c0005726f6c657371007e00194c000b737562736372696265727371007e00194c000d737562736372697074696f6e7371007e00194c0008757365726e616d6571007e001378700174002431306363333930322d393466612d343232642d613233612d33663932323238636433636374001862303330617563783178406b6c6f76656e6f64652e636f6d7372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000000000000000067372002f6f72672e68696265726e6174652e636f6c6c656374696f6e2e696e7465726e616c2e50657273697374656e745365748b47ef79d4c9917d0200014c000373657471007e00197872003e6f72672e68696265726e6174652e636f6c6c656374696f6e2e696e7465726e616c2e416273747261637450657273697374656e74436f6c6c656374696f6e5718b75d8aba735402000b5a001b616c6c6f774c6f61644f7574736964655472616e73616374696f6e49000a63616368656453697a655a000564697274795a000e656c656d656e7452656d6f7665645a000b696e697469616c697a65645a000d697354656d7053657373696f6e4c00036b65797400164c6a6176612f696f2f53657269616c697a61626c653b4c00056f776e657271007e00044c0004726f6c6571007e00134c001273657373696f6e466163746f72795575696471007e00134c000e73746f726564536e617073686f7471007e0022787000ffffffff0000000071007e001f71007e001a74002672752e6578616d2e666c6f6f64696c63612e646f6d61696e2e557365722e6d6573736167657370707074003c243261243038245a434f454e6b43644d63367637525751442e424d43654b5a31546c31546a576573476b594b2e2e454f4c4c594459315149366259797371007e002000ffffffff0000010071007e001f71007e001a74002372752e6578616d2e666c6f6f64696c63612e646f6d61696e2e557365722e726f6c657370737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000017708000000020000000171007e001071007e001078737200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000171007e0010787371007e002000ffffffff0000000071007e001f71007e001a74002972752e6578616d2e666c6f6f64696c63612e646f6d61696e2e557365722e73756273637269626572737070707371007e002000ffffffff0000000071007e001f71007e001a74002b72752e6578616d2e666c6f6f64696c63612e646f6d61696e2e557365722e737562736372697074696f6e7370707074000561646d696e');
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('c8524c94-a20b-4e76-8835-751c2b7c2fbf', 'org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN', '\xaced0005737200366f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e637372662e44656661756c7443737266546f6b656e5aefb7c82fa2fbd50200034c000a6865616465724e616d657400124c6a6176612f6c616e672f537472696e673b4c000d706172616d657465724e616d6571007e00014c0005746f6b656e71007e0001787074000c582d435352462d544f4b454e7400055f6373726674002433336434663033372d656134372d346135362d616139392d356535376461366535636665');


--
-- TOC entry 3402 (class 0 OID 17381)
-- Dependencies: 216
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_role (user_id, roles) VALUES (6, 'ADMIN');
INSERT INTO public.user_role (user_id, roles) VALUES (8, 'USER');
INSERT INTO public.user_role (user_id, roles) VALUES (20, 'USER');
INSERT INTO public.user_role (user_id, roles) VALUES (11, 'USER');
INSERT INTO public.user_role (user_id, roles) VALUES (1, 'USER');


--
-- TOC entry 3403 (class 0 OID 17384)
-- Dependencies: 217
-- Data for Name: user_subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_subscriptions (subscriber_id, channel_id) VALUES (6, 1);
INSERT INTO public.user_subscriptions (subscriber_id, channel_id) VALUES (20, 6);
INSERT INTO public.user_subscriptions (subscriber_id, channel_id) VALUES (6, 8);
INSERT INTO public.user_subscriptions (subscriber_id, channel_id) VALUES (6, 11);
INSERT INTO public.user_subscriptions (subscriber_id, channel_id) VALUES (1, 6);


--
-- TOC entry 3404 (class 0 OID 17389)
-- Dependencies: 218
-- Data for Name: usr; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usr (id, activation_code, active, email, password, username) VALUES (6, '10cc3902-94fa-422d-a23a-3f92228cd3cc', true, 'b030aucx1x@klovenode.com', '$2a$08$ZCOENkCdMc6v7RWQD.BMCeKZ1Tl1TjWesGkYK..EOLLYDY1QI6bYy', 'admin');
INSERT INTO public.usr (id, activation_code, active, email, password, username) VALUES (8, NULL, true, 'fulkubmhon@waterisgone.com', '$2a$08$0qmS1WBz6eQ.LgoioQDVP.rC2ehhL7of4sNT0gcnA.N.GGZ6u1BtC', 'Тестовый');
INSERT INTO public.usr (id, activation_code, active, email, password, username) VALUES (11, NULL, true, 'j0dxpt8eyv@drowblock.com', '$2a$08$GAmbnO/Nphh.MbJhIpO4qud1zyfCDecQXWjO0aAIIRGz.gh7XyU4q', 'Java');
INSERT INTO public.usr (id, activation_code, active, email, password, username) VALUES (20, NULL, true, '0zsuhp32op@blondemorkin.com', '$2a$08$J0pLdEf8BekIS9N9bdiRnurRuOkaU09YshagaCIaL3dUmu9BqVtRa', 'test');
INSERT INTO public.usr (id, activation_code, active, email, password, username) VALUES (1, NULL, true, 'njynmrbxn9@paperpapyrus.com', '$2a$08$ioHOgAPjL9agqk1kYH1JvO2UTJZB5eLFO1KEOmGfe96t62nrW6cV6', 'user');


--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 213
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 22, true);


--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 219
-- Name: message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_id_seq', 1, false);


--
-- TOC entry 3233 (class 2606 OID 17072)
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- TOC entry 3245 (class 2606 OID 17380)
-- Name: message_likes message_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_likes
    ADD CONSTRAINT message_likes_pkey PRIMARY KEY (message_id, user_id);


--
-- TOC entry 3243 (class 2606 OID 17375)
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 17187)
-- Name: spring_session_attributes spring_session_attributes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_pk PRIMARY KEY (session_primary_id, attribute_name);


--
-- TOC entry 3239 (class 2606 OID 17177)
-- Name: spring_session spring_session_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spring_session
    ADD CONSTRAINT spring_session_pk PRIMARY KEY (primary_id);


--
-- TOC entry 3247 (class 2606 OID 17388)
-- Name: user_subscriptions user_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_subscriptions
    ADD CONSTRAINT user_subscriptions_pkey PRIMARY KEY (channel_id, subscriber_id);


--
-- TOC entry 3249 (class 2606 OID 17395)
-- Name: usr usr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usr
    ADD CONSTRAINT usr_pkey PRIMARY KEY (id);


--
-- TOC entry 3234 (class 1259 OID 17073)
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- TOC entry 3235 (class 1259 OID 17178)
-- Name: spring_session_ix1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX spring_session_ix1 ON public.spring_session USING btree (session_id);


--
-- TOC entry 3236 (class 1259 OID 17179)
-- Name: spring_session_ix2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX spring_session_ix2 ON public.spring_session USING btree (expiry_time);


--
-- TOC entry 3237 (class 1259 OID 17180)
-- Name: spring_session_ix3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX spring_session_ix3 ON public.spring_session USING btree (principal_name);


--
-- TOC entry 3251 (class 2606 OID 17396)
-- Name: message fk70bv6o4exfe3fbrho7nuotopf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT fk70bv6o4exfe3fbrho7nuotopf FOREIGN KEY (user_id) REFERENCES public.usr(id);


--
-- TOC entry 3255 (class 2606 OID 17416)
-- Name: user_subscriptions fk74b7d4i0rhhj8jljvidimewie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_subscriptions
    ADD CONSTRAINT fk74b7d4i0rhhj8jljvidimewie FOREIGN KEY (channel_id) REFERENCES public.usr(id);


--
-- TOC entry 3253 (class 2606 OID 17406)
-- Name: message_likes fkbldk7l0d886p3mfscd4ti3ppn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_likes
    ADD CONSTRAINT fkbldk7l0d886p3mfscd4ti3ppn FOREIGN KEY (message_id) REFERENCES public.message(id);


--
-- TOC entry 3254 (class 2606 OID 17411)
-- Name: user_role fkfpm8swft53ulq2hl11yplpr5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fkfpm8swft53ulq2hl11yplpr5 FOREIGN KEY (user_id) REFERENCES public.usr(id);


--
-- TOC entry 3256 (class 2606 OID 17421)
-- Name: user_subscriptions fkm69uaasbua17sgdnhsq10yxd5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_subscriptions
    ADD CONSTRAINT fkm69uaasbua17sgdnhsq10yxd5 FOREIGN KEY (subscriber_id) REFERENCES public.usr(id);


--
-- TOC entry 3252 (class 2606 OID 17401)
-- Name: message_likes fksitk1a427r8b4733gym5f173i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_likes
    ADD CONSTRAINT fksitk1a427r8b4733gym5f173i FOREIGN KEY (user_id) REFERENCES public.usr(id);


--
-- TOC entry 3250 (class 2606 OID 17188)
-- Name: spring_session_attributes spring_session_attributes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_fk FOREIGN KEY (session_primary_id) REFERENCES public.spring_session(primary_id) ON DELETE CASCADE;


-- Completed on 2022-12-10 23:31:07

--
-- PostgreSQL database dump complete
--

