--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    guesses integer,
    best_game integer
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_info_user_id_seq OWNED BY public.user_info.user_id;


--
-- Name: user_info user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_user_id_seq'::regclass);


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES (34, 'Marcel', 3, 4, 1);
INSERT INTO public.user_info VALUES (53, 'user_1736118126871', 2, 1641, 688);
INSERT INTO public.user_info VALUES (36, 'user_1736117798172', 2, 191, 53);
INSERT INTO public.user_info VALUES (43, 'user_1736118019875', NULL, NULL, 150);
INSERT INTO public.user_info VALUES (44, 'user_1736118019875', NULL, NULL, 150);
INSERT INTO public.user_info VALUES (35, 'user_1736117798173', 5, 2720, 61);
INSERT INTO public.user_info VALUES (52, 'user_1736118126872', 5, 4006, 608);
INSERT INTO public.user_info VALUES (38, 'user_1736117836380', 2, 1358, 570);
INSERT INTO public.user_info VALUES (37, 'user_1736117836381', 5, 3401, 62);
INSERT INTO public.user_info VALUES (55, 'user_1736118167441', 2, 1904, 939);
INSERT INTO public.user_info VALUES (41, 'user_1736118019876', NULL, NULL, 175);
INSERT INTO public.user_info VALUES (42, 'user_1736118019876', NULL, NULL, 175);
INSERT INTO public.user_info VALUES (45, 'user_1736118019876', NULL, NULL, NULL);
INSERT INTO public.user_info VALUES (46, 'user_1736118019876', NULL, NULL, NULL);
INSERT INTO public.user_info VALUES (40, 'user_1736117874662', 2, 352, 72);
INSERT INTO public.user_info VALUES (47, 'user_1736118019876', NULL, NULL, NULL);
INSERT INTO public.user_info VALUES (54, 'user_1736118167442', 5, 2359, 304);
INSERT INTO public.user_info VALUES (39, 'user_1736117874663', 5, 1349, 148);
INSERT INTO public.user_info VALUES (49, 'user_1736118044482', 2, 876, 102);
INSERT INTO public.user_info VALUES (48, 'user_1736118044483', 5, 3237, 340);
INSERT INTO public.user_info VALUES (51, 'user_1736118075644', 2, 658, 13);
INSERT INTO public.user_info VALUES (50, 'user_1736118075645', 5, 2722, 241);


--
-- Name: user_info_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_info_user_id_seq', 55, true);


--
-- PostgreSQL database dump complete
--

