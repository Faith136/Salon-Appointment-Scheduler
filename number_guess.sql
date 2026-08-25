--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'GiGI', 0, NULL);
INSERT INTO public.users VALUES (3, 'user_1787654031634', 0, NULL);
INSERT INTO public.users VALUES (4, 'user_1787654031633', 0, NULL);
INSERT INTO public.users VALUES (5, 'user_1787654058393', 0, NULL);
INSERT INTO public.users VALUES (6, 'user_1787654058392', 0, NULL);
INSERT INTO public.users VALUES (25, 'user_1787656106112', 2, 165);
INSERT INTO public.users VALUES (8, 'user_1787654361382', 2, 173);
INSERT INTO public.users VALUES (24, 'user_1787656106113', 5, 85);
INSERT INTO public.users VALUES (7, 'user_1787654361383', 5, 221);
INSERT INTO public.users VALUES (10, 'user_1787654756620', 2, 497);
INSERT INTO public.users VALUES (27, 'user_1787656294986', 2, 222);
INSERT INTO public.users VALUES (9, 'user_1787654756621', 5, 12);
INSERT INTO public.users VALUES (11, 'user_1787654939355', 0, NULL);
INSERT INTO public.users VALUES (12, 'user_1787654939354', 0, NULL);
INSERT INTO public.users VALUES (26, 'user_1787656294987', 5, 170);
INSERT INTO public.users VALUES (14, 'user_1787654980730', 2, 545);
INSERT INTO public.users VALUES (13, 'user_1787654980731', 5, 20);
INSERT INTO public.users VALUES (2, 'Faym', 2, 5);
INSERT INTO public.users VALUES (16, 'user_1787655121275', 2, 262);
INSERT INTO public.users VALUES (15, 'user_1787655121276', 5, 114);
INSERT INTO public.users VALUES (17, 'Fayt', 1, 11);
INSERT INTO public.users VALUES (19, 'user_1787655309251', 2, 435);
INSERT INTO public.users VALUES (18, 'user_1787655309252', 5, 390);
INSERT INTO public.users VALUES (21, 'user_1787655348624', 2, 217);
INSERT INTO public.users VALUES (20, 'user_1787655348625', 5, 69);
INSERT INTO public.users VALUES (23, 'user_1787655756120', 2, 12);
INSERT INTO public.users VALUES (22, 'user_1787655756121', 5, 300);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 27, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

