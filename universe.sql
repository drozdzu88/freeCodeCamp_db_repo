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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_type character varying(30),
    description text,
    age_in_thousands_of_light_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    weight numeric,
    radius numeric,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: objects_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.objects_type (
    objects_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(60)
);


ALTER TABLE public.objects_type OWNER TO freecodecamp;

--
-- Name: objects_type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.objects_type_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.objects_type_type_id_seq OWNER TO freecodecamp;

--
-- Name: objects_type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.objects_type_type_id_seq OWNED BY public.objects_type.objects_type_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    is_there_a_life boolean NOT NULL,
    weight numeric,
    radius numeric,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    has_more_than_one_moon boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age numeric,
    weight numeric,
    radius numeric,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: objects_type objects_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.objects_type ALTER COLUMN objects_type_id SET DEFAULT nextval('public.objects_type_type_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral galaxy', 'some text', 120);
INSERT INTO public.galaxy VALUES (2, 'NGC 3370', 'spiral galaxy', 'some text', 10000);
INSERT INTO public.galaxy VALUES (3, 'Messier 60', 'elliptical galaxy', 'some text', 100000);
INSERT INTO public.galaxy VALUES (4, 'NGC 3115', 'lenticular galaxy', 'some text', NULL);
INSERT INTO public.galaxy VALUES (5, 'NGC 1427A', 'irregular alaxy', 'some text', NULL);
INSERT INTO public.galaxy VALUES (6, 'NGC 8596', 'spiral galaxy', 'some_text', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon_1', 45.6, 0.65, 1);
INSERT INTO public.moon VALUES (2, 'moon_2', 45.6, 0.65, 2);
INSERT INTO public.moon VALUES (3, 'moon_3', 45.6, 0.65, 2);
INSERT INTO public.moon VALUES (4, 'moon_4', 45.6, 0.65, 3);
INSERT INTO public.moon VALUES (5, 'moon_5', 45.6, 0.65, 3);
INSERT INTO public.moon VALUES (6, 'moon_6', 45.6, 0.65, 3);
INSERT INTO public.moon VALUES (7, 'moon_7', 45.6, 0.65, 4);
INSERT INTO public.moon VALUES (8, 'moon_8', 45.6, 0.65, 4);
INSERT INTO public.moon VALUES (9, 'moon_9', 45.6, 0.65, 5);
INSERT INTO public.moon VALUES (10, 'moon_10', 45.6, 0.65, 5);
INSERT INTO public.moon VALUES (11, 'moon_11', 45.6, 0.65, 6);
INSERT INTO public.moon VALUES (12, 'moon_12', 45.6, 0.65, 6);
INSERT INTO public.moon VALUES (13, 'moon_13', 45.6, 0.65, 7);
INSERT INTO public.moon VALUES (14, 'moon_14', 45.6, 0.65, 7);
INSERT INTO public.moon VALUES (15, 'moon_15', 45.6, 0.65, 8);
INSERT INTO public.moon VALUES (16, 'moon_16', 45.6, 0.65, 8);
INSERT INTO public.moon VALUES (17, 'moon_17', 45.6, 0.65, 9);
INSERT INTO public.moon VALUES (18, 'moon_18', 45.6, 0.65, 10);
INSERT INTO public.moon VALUES (19, 'moon_19', 45.6, 0.65, 11);
INSERT INTO public.moon VALUES (20, 'moon_20', 45.6, 0.65, 12);


--
-- Data for Name: objects_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.objects_type VALUES (1, 'galaxy', 'some text');
INSERT INTO public.objects_type VALUES (2, 'star', 'some text');
INSERT INTO public.objects_type VALUES (3, 'planet', 'some text');
INSERT INTO public.objects_type VALUES (4, 'moon', 'some text');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet_1', true, 456.6, 86.0, 1, 1, false);
INSERT INTO public.planet VALUES (3, 'planet_3', false, 85.6, 86.0, 1, 1, true);
INSERT INTO public.planet VALUES (2, 'planet_2', false, 865.6, 886.0, 1, 1, false);
INSERT INTO public.planet VALUES (4, 'planet_4', false, 555.6, 6586.0, 1, 1, true);
INSERT INTO public.planet VALUES (5, 'planet_5', false, 555.6, 6586.0, 2, 2, true);
INSERT INTO public.planet VALUES (6, 'planet_6', false, 5.6, 86.0, 2, 2, true);
INSERT INTO public.planet VALUES (7, 'planet_7', false, 5.6, 86.0, 3, 3, true);
INSERT INTO public.planet VALUES (8, 'planet_8', false, 5.6, 86.0, 4, 4, true);
INSERT INTO public.planet VALUES (9, 'planet_9', false, 5.6, 86.0, 4, 4, true);
INSERT INTO public.planet VALUES (10, 'planet_10', false, 5.6, 86.0, 5, 5, true);
INSERT INTO public.planet VALUES (11, 'planet_11', false, 5.6, 86.0, 5, 5, true);
INSERT INTO public.planet VALUES (12, 'planet_12', false, 5.6, 86.0, 6, 6, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The_sun', 4.57, 333000.0, 109.0, 1);
INSERT INTO public.star VALUES (2, 'star_2', 5.2, 53000.0, 111.0, 2);
INSERT INTO public.star VALUES (4, 'star_3', 10.1, 859865.0, 570.0, 3);
INSERT INTO public.star VALUES (5, 'star_4', 58.1, 12546395.0, 690.0, 4);
INSERT INTO public.star VALUES (6, 'star_5', 9864.1, 1888846395.0, 986490.0, 5);
INSERT INTO public.star VALUES (7, 'star65', 98.451, 18556.0, 9650.0, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: objects_type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.objects_type_type_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: objects_type objects_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.objects_type
    ADD CONSTRAINT objects_type_pkey PRIMARY KEY (objects_type_id);


--
-- Name: objects_type objects_type_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.objects_type
    ADD CONSTRAINT objects_type_type_name_key UNIQUE (name);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

