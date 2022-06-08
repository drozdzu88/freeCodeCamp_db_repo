--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: scoreboard; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.scoreboard (
    user_id integer NOT NULL,
    username character varying(20) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer DEFAULT 0
);


ALTER TABLE public.scoreboard OWNER TO freecodecamp;

--
-- Name: scoreboard_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.scoreboard_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scoreboard_user_id_seq OWNER TO freecodecamp;

--
-- Name: scoreboard_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.scoreboard_user_id_seq OWNED BY public.scoreboard.user_id;


--
-- Name: scoreboard user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scoreboard ALTER COLUMN user_id SET DEFAULT nextval('public.scoreboard_user_id_seq'::regclass);


--
-- Data for Name: scoreboard; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.scoreboard VALUES (28, 'lukasz', 3, 9);
INSERT INTO public.scoreboard VALUES (40, 'user_1654718467316', 2, 151);
INSERT INTO public.scoreboard VALUES (52, 'user_1654718557390', 2, 47);
INSERT INTO public.scoreboard VALUES (30, 'user_1654718241591', 2, 158);
INSERT INTO public.scoreboard VALUES (29, 'user_1654718241592', 5, 138);
INSERT INTO public.scoreboard VALUES (39, 'user_1654718467317', 5, 51);
INSERT INTO public.scoreboard VALUES (51, 'user_1654718557391', 5, 124);
INSERT INTO public.scoreboard VALUES (32, 'user_1654718249981', 2, 60);
INSERT INTO public.scoreboard VALUES (31, 'user_1654718249982', 5, 60);
INSERT INTO public.scoreboard VALUES (42, 'user_1654718482281', 2, 174);
INSERT INTO public.scoreboard VALUES (34, 'user_1654718346928', 2, 577);
INSERT INTO public.scoreboard VALUES (41, 'user_1654718482282', 5, 204);
INSERT INTO public.scoreboard VALUES (33, 'user_1654718346929', 5, 215);
INSERT INTO public.scoreboard VALUES (54, 'user_1654718572706', 2, 72);
INSERT INTO public.scoreboard VALUES (36, 'user_1654718364746', 2, 324);
INSERT INTO public.scoreboard VALUES (53, 'user_1654718572707', 5, 123);
INSERT INTO public.scoreboard VALUES (35, 'user_1654718364747', 5, 188);
INSERT INTO public.scoreboard VALUES (44, 'user_1654718493141', 2, 91);
INSERT INTO public.scoreboard VALUES (43, 'user_1654718493142', 5, 128);
INSERT INTO public.scoreboard VALUES (38, 'user_1654718411840', 2, 820);
INSERT INTO public.scoreboard VALUES (37, 'user_1654718411841', 5, 329);
INSERT INTO public.scoreboard VALUES (46, 'user_1654718499428', 2, 122);
INSERT INTO public.scoreboard VALUES (45, 'user_1654718499429', 5, 391);
INSERT INTO public.scoreboard VALUES (48, 'user_1654718512775', 2, 459);
INSERT INTO public.scoreboard VALUES (47, 'user_1654718512776', 5, 229);
INSERT INTO public.scoreboard VALUES (50, 'user_1654718536593', 2, 162);
INSERT INTO public.scoreboard VALUES (49, 'user_1654718536594', 5, 46);


--
-- Name: scoreboard_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.scoreboard_user_id_seq', 54, true);


--
-- Name: scoreboard scoreboard_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scoreboard
    ADD CONSTRAINT scoreboard_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

