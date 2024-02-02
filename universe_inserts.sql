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
    name character varying(30) NOT NULL,
    planet_count integer,
    description character varying(50),
    distance_from_earth integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    description text,
    particle_count integer NOT NULL,
    planet_id integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    circumference numeric(6,2),
    has_life boolean,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: space_junk; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_junk (
    space_junk_id integer NOT NULL,
    name character varying(30) NOT NULL,
    count integer,
    hazardous_to_humans boolean,
    galaxy_id integer
);


ALTER TABLE public.space_junk OWNER TO freecodecamp;

--
-- Name: space_junk_space_junk_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_junk_space_junk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_junk_space_junk_id_seq OWNER TO freecodecamp;

--
-- Name: space_junk_space_junk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_junk_space_junk_id_seq OWNED BY public.space_junk.space_junk_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    estimated_heat integer,
    star_type character varying(15),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: space_junk space_junk_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_junk ALTER COLUMN space_junk_id SET DEFAULT nextval('public.space_junk_space_junk_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Tiger', 23, 'It''s proonounced tea-jair', 99);
INSERT INTO public.galaxy VALUES (2, 'Macramus', 25, 'Rope City', 2345);
INSERT INTO public.galaxy VALUES (3, 'FastGrap', 2, 'Wrestling', 346);
INSERT INTO public.galaxy VALUES (4, 'Brodial', 63, NULL, 992387);
INSERT INTO public.galaxy VALUES (5, 'Gracebomb', 8, 'Classy', 3459);
INSERT INTO public.galaxy VALUES (6, 'Mishikaku', 99, 'Find old pottery in this galaxy', 9475);
INSERT INTO public.galaxy VALUES (7, 'Elephantine', 25, 'The largest, compared to some', 2976);
INSERT INTO public.galaxy VALUES (8, 'Sixty', 26, NULL, 22983);
INSERT INTO public.galaxy VALUES (9, 'Direneed', 18, 'Stay away from this one', 39395);
INSERT INTO public.galaxy VALUES (10, 'Splammel', 9, 'Don''t ask', 92359);


--
-- Data for Name: space_junk; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_junk VALUES (1, 'Satellite', 99232, true, 5);
INSERT INTO public.space_junk VALUES (2, 'Asteroid', 82332, true, 2);
INSERT INTO public.space_junk VALUES (3, 'Space Frog', 2, false, 4);
INSERT INTO public.space_junk VALUES (4, 'Hero Sandwich', 63, true, 5);
INSERT INTO public.space_junk VALUES (5, 'Glass', 6, true, 1);
INSERT INTO public.space_junk VALUES (6, 'Dinosaur', 77, true, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sam', 3394, 'Pulsar', 10);
INSERT INTO public.star VALUES (2, 'Earl', 7234, 'Quasar', 6);
INSERT INTO public.star VALUES (3, 'Valentine', 3986, 'Red Dwarf', 1);
INSERT INTO public.star VALUES (4, 'Grape', 3375, 'White Dwarf', 3);
INSERT INTO public.star VALUES (5, 'Tully', 784, 'Quasar', 6);
INSERT INTO public.star VALUES (6, 'Margaret', 2858, 'Pulsar', 3);

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.planet VALUES (1, 'ClamBake', 5.4, true, false, 4);
INSERT INTO public.planet VALUES (2, 'Pasquale', 25.4, false, true, 5);
INSERT INTO public.planet VALUES (3, 'Jupiter', 54.4, false, true, 1);
INSERT INTO public.planet VALUES (4, 'Uranus', 55.4, true, true, 5);
INSERT INTO public.planet VALUES (5, 'Urgano', 5.42, false, false, 6);
INSERT INTO public.planet VALUES (6, 'Cloptacus', 52.54, true, true, 2);
INSERT INTO public.planet VALUES (7, 'Neptune', 57.49, true, false, 3);
INSERT INTO public.planet VALUES (8, 'Spitball', 252.49, false, false, 6);
INSERT INTO public.planet VALUES (9, 'Monocle', 53.45, true, true, 1);
INSERT INTO public.planet VALUES (10, 'Blankspace', 523.44, false, true, 1);
INSERT INTO public.planet VALUES (11, 'Marriott', 867.44, false, false, 3);
INSERT INTO public.planet VALUES (12, 'Steve', 6.1, true, true, 4);

--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Andromydes', NULL, 234246, 3);
INSERT INTO public.moon VALUES (2, 'Anthripidae', NULL, 2367456, 6);
INSERT INTO public.moon VALUES (3, 'Baxter', NULL, 8456868, 1);
INSERT INTO public.moon VALUES (4, 'Cruller', NULL, 456868, 5);
INSERT INTO public.moon VALUES (5, 'Flasking', NULL, 23976, 4);
INSERT INTO public.moon VALUES (6, 'Paceton', NULL, 23040, 1);
INSERT INTO public.moon VALUES (7, 'Grampy', NULL, 5346, 2);
INSERT INTO public.moon VALUES (8, 'Amortice', NULL, 704390, 3);
INSERT INTO public.moon VALUES (9, 'Destino', NULL, 345354, 4);
INSERT INTO public.moon VALUES (10, 'Fallacino', NULL, 87686, 5);
INSERT INTO public.moon VALUES (11, 'Portobello', NULL, 933445, 8);
INSERT INTO public.moon VALUES (12, 'Stopper', NULL, 334573, 9);
INSERT INTO public.moon VALUES (13, 'Vino', NULL, 34583, 12);
INSERT INTO public.moon VALUES (14, 'Capo', NULL, 56793, 11);
INSERT INTO public.moon VALUES (15, 'Cellentani', NULL, 3345705, 8);
INSERT INTO public.moon VALUES (16, 'Throuple', NULL, 34578, 10);
INSERT INTO public.moon VALUES (17, 'Blastino', NULL, 3345, 11);
INSERT INTO public.moon VALUES (18, 'Neutrino', NULL, 4573, 7);
INSERT INTO public.moon VALUES (19, 'Tawny', NULL, 2837, 2);
INSERT INTO public.moon VALUES (20, 'Garlic', NULL, 383765, 6);

--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 1, false);


--
-- Name: space_junk_space_junk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_junk_space_junk_id_seq', 6, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


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
-- Name: planet name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_junk space_junk_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_junk
    ADD CONSTRAINT space_junk_name_key UNIQUE (name);


--
-- Name: space_junk space_junk_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_junk
    ADD CONSTRAINT space_junk_pkey PRIMARY KEY (space_junk_id);


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
-- Name: galaxy unique_not_null; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_not_null UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: space_junk space_junk_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_junk
    ADD CONSTRAINT space_junk_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

