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
    name character varying(20) NOT NULL,
    distance_to_closest_galaxy integer,
    distance_to_closest_earth integer,
    habitable boolean,
    description text
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
-- Name: galaxy_planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_planet_moon (
    galaxy_planet_moon_id integer NOT NULL,
    moon_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer,
    galaxy_id integer,
    distance numeric(13,3),
    name character varying(20),
    description text
);


ALTER TABLE public.galaxy_planet_moon OWNER TO freecodecamp;

--
-- Name: galaxy_planet_moon_gpm_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_planet_moon_gpm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_planet_moon_gpm_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_planet_moon_gpm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_planet_moon_gpm_id_seq OWNED BY public.galaxy_planet_moon.galaxy_planet_moon_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    distance_to_closest_galaxy integer NOT NULL,
    distance_to_closest_earth integer,
    habitable boolean,
    planet_id integer,
    description text
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
    name character varying(20) NOT NULL,
    distance_to_closest_galaxy integer NOT NULL,
    distance_to_closest_earth integer,
    habitable boolean,
    star_id integer,
    description text
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
    name character varying(20) NOT NULL,
    distance_to_closest_galaxy integer NOT NULL,
    distance_to_closest_earth integer,
    red_dwarf boolean,
    galaxy_id integer,
    description text
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
-- Name: galaxy_planet_moon galaxy_planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet_moon ALTER COLUMN galaxy_planet_moon_id SET DEFAULT nextval('public.galaxy_planet_moon_gpm_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'MilkWay', 2, 0, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Alpha Centauri', 1, 0, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Crab', 3, 0, false, NULL);
INSERT INTO public.galaxy VALUES (4, 'Beta Centauri', 4, 0, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Gamma Centauri', 4, 0, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'MilkWay', 2, 0, true, NULL);
INSERT INTO public.galaxy VALUES (7, 'Alpha Centauri', 1, 0, true, NULL);
INSERT INTO public.galaxy VALUES (8, 'Crab', 3, 0, false, NULL);
INSERT INTO public.galaxy VALUES (9, 'Beta Centauri', 4, 0, false, NULL);
INSERT INTO public.galaxy VALUES (10, 'Gamma Centauri', 4, 0, true, NULL);
INSERT INTO public.galaxy VALUES (11, 'MilkWay', 2, 0, true, NULL);
INSERT INTO public.galaxy VALUES (12, 'Alpha Centauri', 1, 0, true, NULL);
INSERT INTO public.galaxy VALUES (13, 'Crab', 3, 0, false, NULL);
INSERT INTO public.galaxy VALUES (14, 'Beta Centauri', 4, 0, false, NULL);
INSERT INTO public.galaxy VALUES (15, 'Gamma Centauri', 4, 0, true, NULL);
INSERT INTO public.galaxy VALUES (16, 'MilkWay', 2, 0, true, NULL);
INSERT INTO public.galaxy VALUES (17, 'Alpha Centauri', 1, 0, true, NULL);
INSERT INTO public.galaxy VALUES (18, 'Crab', 3, 0, false, NULL);
INSERT INTO public.galaxy VALUES (19, 'Beta Centauri', 4, 0, false, NULL);
INSERT INTO public.galaxy VALUES (20, 'Gamma Centauri', 4, 0, true, NULL);
INSERT INTO public.galaxy VALUES (21, 'MilkWay', 2, 0, true, NULL);
INSERT INTO public.galaxy VALUES (22, 'Alpha Centauri', 1, 0, true, NULL);
INSERT INTO public.galaxy VALUES (23, 'Crab', 3, 0, false, NULL);
INSERT INTO public.galaxy VALUES (24, 'Beta Centauri', 4, 0, false, NULL);
INSERT INTO public.galaxy VALUES (25, 'Gamma Centauri', 4, 0, true, NULL);
INSERT INTO public.galaxy VALUES (26, 'MilkWay', 2, 0, true, NULL);
INSERT INTO public.galaxy VALUES (27, 'Alpha Centauri', 1, 0, true, NULL);
INSERT INTO public.galaxy VALUES (28, 'Crab', 3, 0, false, NULL);
INSERT INTO public.galaxy VALUES (29, 'Beta Centauri', 4, 0, false, NULL);
INSERT INTO public.galaxy VALUES (30, 'Gamma Centauri', 4, 0, true, NULL);
INSERT INTO public.galaxy VALUES (31, 'MilkWay', 2, 0, true, NULL);
INSERT INTO public.galaxy VALUES (32, 'Alpha Centauri', 1, 0, true, NULL);
INSERT INTO public.galaxy VALUES (33, 'Crab', 3, 0, false, NULL);
INSERT INTO public.galaxy VALUES (34, 'Beta Centauri', 4, 0, false, NULL);
INSERT INTO public.galaxy VALUES (35, 'Gamma Centauri', 4, 0, true, NULL);
INSERT INTO public.galaxy VALUES (36, 'MilkWay', 2, 0, true, NULL);
INSERT INTO public.galaxy VALUES (37, 'Alpha Centauri', 1, 0, true, NULL);
INSERT INTO public.galaxy VALUES (38, 'Crab', 3, 0, false, NULL);
INSERT INTO public.galaxy VALUES (39, 'Beta Centauri', 4, 0, false, NULL);
INSERT INTO public.galaxy VALUES (40, 'Gamma Centauri', 4, 0, true, NULL);
INSERT INTO public.galaxy VALUES (41, 'MilkWay', 2, 0, true, NULL);
INSERT INTO public.galaxy VALUES (42, 'Alpha Centauri', 1, 0, true, NULL);
INSERT INTO public.galaxy VALUES (43, 'Crab', 3, 0, false, NULL);
INSERT INTO public.galaxy VALUES (44, 'Beta Centauri', 4, 0, false, NULL);
INSERT INTO public.galaxy VALUES (45, 'Gamma Centauri', 4, 0, true, NULL);
INSERT INTO public.galaxy VALUES (46, 'MilkWay', 2, 0, true, NULL);
INSERT INTO public.galaxy VALUES (47, 'Alpha Centauri', 1, 0, true, NULL);
INSERT INTO public.galaxy VALUES (48, 'Crab', 3, 0, false, NULL);
INSERT INTO public.galaxy VALUES (49, 'Beta Centauri', 4, 0, false, NULL);
INSERT INTO public.galaxy VALUES (50, 'Gamma Centauri', 4, 0, true, NULL);
INSERT INTO public.galaxy VALUES (51, 'MilkWay', 2, 0, true, NULL);
INSERT INTO public.galaxy VALUES (52, 'Alpha Centauri', 1, 0, true, NULL);
INSERT INTO public.galaxy VALUES (53, 'Crab', 3, 0, false, NULL);
INSERT INTO public.galaxy VALUES (54, 'Beta Centauri', 4, 0, false, NULL);
INSERT INTO public.galaxy VALUES (55, 'Gamma Centauri', 4, 0, true, NULL);
INSERT INTO public.galaxy VALUES (56, 'MilkWay', 2, 0, true, NULL);
INSERT INTO public.galaxy VALUES (57, 'Alpha Centauri', 1, 0, true, NULL);
INSERT INTO public.galaxy VALUES (58, 'Crab', 3, 0, false, NULL);
INSERT INTO public.galaxy VALUES (59, 'Beta Centauri', 4, 0, false, NULL);
INSERT INTO public.galaxy VALUES (60, 'Gamma Centauri', 4, 0, true, NULL);


--
-- Data for Name: galaxy_planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_planet_moon VALUES (56, 89, 2, 28, 4, NULL, NULL, NULL);
INSERT INTO public.galaxy_planet_moon VALUES (57, 90, 3, 29, 5, NULL, NULL, NULL);
INSERT INTO public.galaxy_planet_moon VALUES (58, 91, 4, 30, 1, NULL, NULL, NULL);
INSERT INTO public.galaxy_planet_moon VALUES (59, 92, 3, 25, 1, NULL, NULL, NULL);
INSERT INTO public.galaxy_planet_moon VALUES (60, 93, 4, 26, 1, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (89, 'Luna', 0, 100, true, 25, NULL);
INSERT INTO public.moon VALUES (90, 'Io', 1, 2000, true, 26, NULL);
INSERT INTO public.moon VALUES (91, 'Luce', 1, 27, false, 27, NULL);
INSERT INTO public.moon VALUES (92, 'Hera', 20000, 200000, false, 28, NULL);
INSERT INTO public.moon VALUES (93, 'Persephone', 1, 1, true, 26, NULL);
INSERT INTO public.moon VALUES (94, 'Euricide', 0, 100, true, 29, NULL);
INSERT INTO public.moon VALUES (95, 'Mica', 1, 2000, true, 25, NULL);
INSERT INTO public.moon VALUES (96, 'Earendil', 1, 20, false, 26, NULL);
INSERT INTO public.moon VALUES (97, 'Oma', 20000, 200000, false, 27, NULL);
INSERT INTO public.moon VALUES (98, 'Pi', 1, 1, true, 28, NULL);
INSERT INTO public.moon VALUES (99, 'Uni', 20000, 200000, false, 30, NULL);
INSERT INTO public.moon VALUES (100, 'Sammi', 1, 1, true, 29, NULL);
INSERT INTO public.moon VALUES (101, 'Lu', 1, 20, false, 30, NULL);
INSERT INTO public.moon VALUES (102, 'Timo', 20000, 200000, false, 25, NULL);
INSERT INTO public.moon VALUES (103, 'Corey', 1, 1, true, 26, NULL);
INSERT INTO public.moon VALUES (104, 'Tachy', 0, 100, true, 28, NULL);
INSERT INTO public.moon VALUES (105, 'Poly', 1, 2000, true, 29, NULL);
INSERT INTO public.moon VALUES (106, 'Khan', 1, 20, false, 27, NULL);
INSERT INTO public.moon VALUES (107, 'Opa', 20000, 200000, false, 30, NULL);
INSERT INTO public.moon VALUES (108, 'Pips', 1, 1, true, 29, NULL);
INSERT INTO public.moon VALUES (109, 'Unity', 20000, 200000, false, 28, NULL);
INSERT INTO public.moon VALUES (110, 'Sammimich', 1, 1, true, 27, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (25, 'Earth', 0, 100, true, 1, NULL);
INSERT INTO public.planet VALUES (26, 'Mars', 1, 2000, true, 2, NULL);
INSERT INTO public.planet VALUES (27, 'Pluto', 1, 20, false, 3, NULL);
INSERT INTO public.planet VALUES (28, 'Jupiter', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (29, 'Bibriru', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (30, 'Nibiru', 0, 100, true, 1, NULL);
INSERT INTO public.planet VALUES (31, 'Saturn', 1, 2000, true, 2, NULL);
INSERT INTO public.planet VALUES (32, 'Uranus', 1, 20, false, 3, NULL);
INSERT INTO public.planet VALUES (33, 'Mercury', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (34, 'Venus', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (35, 'Minos', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (36, 'Achilles', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (37, 'Earth', 0, 100, true, 1, NULL);
INSERT INTO public.planet VALUES (38, 'Mars', 1, 2000, true, 2, NULL);
INSERT INTO public.planet VALUES (39, 'Pluto', 1, 20, false, 3, NULL);
INSERT INTO public.planet VALUES (40, 'Jupiter', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (41, 'Bibriru', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (42, 'Nibiru', 0, 100, true, 1, NULL);
INSERT INTO public.planet VALUES (43, 'Saturn', 1, 2000, true, 2, NULL);
INSERT INTO public.planet VALUES (44, 'Uranus', 1, 20, false, 3, NULL);
INSERT INTO public.planet VALUES (45, 'Mercury', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (46, 'Venus', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (47, 'Minos', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (48, 'Achilles', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (49, 'Earth', 0, 100, true, 1, NULL);
INSERT INTO public.planet VALUES (50, 'Mars', 1, 2000, true, 2, NULL);
INSERT INTO public.planet VALUES (51, 'Pluto', 1, 20, false, 3, NULL);
INSERT INTO public.planet VALUES (52, 'Jupiter', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (53, 'Bibriru', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (54, 'Nibiru', 0, 100, true, 1, NULL);
INSERT INTO public.planet VALUES (55, 'Saturn', 1, 2000, true, 2, NULL);
INSERT INTO public.planet VALUES (56, 'Uranus', 1, 20, false, 3, NULL);
INSERT INTO public.planet VALUES (57, 'Mercury', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (58, 'Venus', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (59, 'Minos', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (60, 'Achilles', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (61, 'Earth', 0, 100, true, 1, NULL);
INSERT INTO public.planet VALUES (62, 'Mars', 1, 2000, true, 2, NULL);
INSERT INTO public.planet VALUES (63, 'Pluto', 1, 20, false, 3, NULL);
INSERT INTO public.planet VALUES (64, 'Jupiter', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (65, 'Bibriru', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (66, 'Nibiru', 0, 100, true, 1, NULL);
INSERT INTO public.planet VALUES (67, 'Saturn', 1, 2000, true, 2, NULL);
INSERT INTO public.planet VALUES (68, 'Uranus', 1, 20, false, 3, NULL);
INSERT INTO public.planet VALUES (69, 'Mercury', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (70, 'Venus', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (71, 'Minos', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (72, 'Achilles', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (73, 'Earth', 0, 100, true, 1, NULL);
INSERT INTO public.planet VALUES (74, 'Mars', 1, 2000, true, 2, NULL);
INSERT INTO public.planet VALUES (75, 'Pluto', 1, 20, false, 3, NULL);
INSERT INTO public.planet VALUES (76, 'Jupiter', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (77, 'Bibriru', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (78, 'Nibiru', 0, 100, true, 1, NULL);
INSERT INTO public.planet VALUES (79, 'Saturn', 1, 2000, true, 2, NULL);
INSERT INTO public.planet VALUES (80, 'Uranus', 1, 20, false, 3, NULL);
INSERT INTO public.planet VALUES (81, 'Mercury', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (82, 'Venus', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (83, 'Minos', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (84, 'Achilles', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (85, 'Earth', 0, 100, true, 1, NULL);
INSERT INTO public.planet VALUES (86, 'Mars', 1, 2000, true, 2, NULL);
INSERT INTO public.planet VALUES (87, 'Pluto', 1, 20, false, 3, NULL);
INSERT INTO public.planet VALUES (88, 'Jupiter', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (89, 'Bibriru', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (90, 'Nibiru', 0, 100, true, 1, NULL);
INSERT INTO public.planet VALUES (91, 'Saturn', 1, 2000, true, 2, NULL);
INSERT INTO public.planet VALUES (92, 'Uranus', 1, 20, false, 3, NULL);
INSERT INTO public.planet VALUES (93, 'Mercury', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (94, 'Venus', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (95, 'Minos', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (96, 'Achilles', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (97, 'Earth', 0, 100, true, 1, NULL);
INSERT INTO public.planet VALUES (98, 'Mars', 1, 2000, true, 2, NULL);
INSERT INTO public.planet VALUES (99, 'Pluto', 1, 20, false, 3, NULL);
INSERT INTO public.planet VALUES (100, 'Jupiter', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (101, 'Bibriru', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (102, 'Nibiru', 0, 100, true, 1, NULL);
INSERT INTO public.planet VALUES (103, 'Saturn', 1, 2000, true, 2, NULL);
INSERT INTO public.planet VALUES (104, 'Uranus', 1, 20, false, 3, NULL);
INSERT INTO public.planet VALUES (105, 'Mercury', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (106, 'Venus', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (107, 'Minos', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (108, 'Achilles', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (109, 'Earth', 0, 100, true, 1, NULL);
INSERT INTO public.planet VALUES (110, 'Mars', 1, 2000, true, 2, NULL);
INSERT INTO public.planet VALUES (111, 'Pluto', 1, 20, false, 3, NULL);
INSERT INTO public.planet VALUES (112, 'Jupiter', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (113, 'Bibriru', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (114, 'Nibiru', 0, 100, true, 1, NULL);
INSERT INTO public.planet VALUES (115, 'Saturn', 1, 2000, true, 2, NULL);
INSERT INTO public.planet VALUES (116, 'Uranus', 1, 20, false, 3, NULL);
INSERT INTO public.planet VALUES (117, 'Mercury', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (118, 'Venus', 1, 1, true, 4, NULL);
INSERT INTO public.planet VALUES (119, 'Minos', 20000, 200000, false, 3, NULL);
INSERT INTO public.planet VALUES (120, 'Achilles', 1, 1, true, 4, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Soliel', 0, 100, true, 1, NULL);
INSERT INTO public.star VALUES (2, 'Estrella', 1, 2000, true, 2, NULL);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 20, false, 3, NULL);
INSERT INTO public.star VALUES (4, 'Beetlejuice', 20000, 200000, false, 3, NULL);
INSERT INTO public.star VALUES (5, 'Pole', 1, 1, true, 4, NULL);
INSERT INTO public.star VALUES (6, 'Soliel', 0, 100, true, 1, NULL);
INSERT INTO public.star VALUES (7, 'Estrella', 1, 2000, true, 2, NULL);
INSERT INTO public.star VALUES (8, 'Sirius', 1, 20, false, 3, NULL);
INSERT INTO public.star VALUES (9, 'Beetlejuice', 20000, 200000, false, 3, NULL);
INSERT INTO public.star VALUES (10, 'Pole', 1, 1, true, 4, NULL);
INSERT INTO public.star VALUES (11, 'Soliel', 0, 100, true, 1, NULL);
INSERT INTO public.star VALUES (12, 'Estrella', 1, 2000, true, 2, NULL);
INSERT INTO public.star VALUES (13, 'Sirius', 1, 20, false, 3, NULL);
INSERT INTO public.star VALUES (14, 'Beetlejuice', 20000, 200000, false, 3, NULL);
INSERT INTO public.star VALUES (15, 'Pole', 1, 1, true, 4, NULL);
INSERT INTO public.star VALUES (16, 'Soliel', 0, 100, true, 1, NULL);
INSERT INTO public.star VALUES (17, 'Estrella', 1, 2000, true, 2, NULL);
INSERT INTO public.star VALUES (18, 'Sirius', 1, 20, false, 3, NULL);
INSERT INTO public.star VALUES (19, 'Beetlejuice', 20000, 200000, false, 3, NULL);
INSERT INTO public.star VALUES (20, 'Pole', 1, 1, true, 4, NULL);
INSERT INTO public.star VALUES (21, 'Soliel', 0, 100, true, 1, NULL);
INSERT INTO public.star VALUES (22, 'Estrella', 1, 2000, true, 2, NULL);
INSERT INTO public.star VALUES (23, 'Sirius', 1, 20, false, 3, NULL);
INSERT INTO public.star VALUES (24, 'Beetlejuice', 20000, 200000, false, 3, NULL);
INSERT INTO public.star VALUES (25, 'Pole', 1, 1, true, 4, NULL);
INSERT INTO public.star VALUES (26, 'Soliel', 0, 100, true, 1, NULL);
INSERT INTO public.star VALUES (27, 'Estrella', 1, 2000, true, 2, NULL);
INSERT INTO public.star VALUES (28, 'Sirius', 1, 20, false, 3, NULL);
INSERT INTO public.star VALUES (29, 'Beetlejuice', 20000, 200000, false, 3, NULL);
INSERT INTO public.star VALUES (30, 'Pole', 1, 1, true, 4, NULL);
INSERT INTO public.star VALUES (31, 'Soliel', 0, 100, true, 1, NULL);
INSERT INTO public.star VALUES (32, 'Estrella', 1, 2000, true, 2, NULL);
INSERT INTO public.star VALUES (33, 'Sirius', 1, 20, false, 3, NULL);
INSERT INTO public.star VALUES (34, 'Beetlejuice', 20000, 200000, false, 3, NULL);
INSERT INTO public.star VALUES (35, 'Pole', 1, 1, true, 4, NULL);
INSERT INTO public.star VALUES (36, 'Soliel', 0, 100, true, 1, NULL);
INSERT INTO public.star VALUES (37, 'Estrella', 1, 2000, true, 2, NULL);
INSERT INTO public.star VALUES (38, 'Sirius', 1, 20, false, 3, NULL);
INSERT INTO public.star VALUES (39, 'Beetlejuice', 20000, 200000, false, 3, NULL);
INSERT INTO public.star VALUES (40, 'Pole', 1, 1, true, 4, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 60, true);


--
-- Name: galaxy_planet_moon_gpm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_planet_moon_gpm_id_seq', 60, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 111, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 120, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 40, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_planet_moon galaxy_planet_moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet_moon
    ADD CONSTRAINT galaxy_planet_moon_description_key UNIQUE (description);


--
-- Name: galaxy_planet_moon galaxy_planet_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet_moon
    ADD CONSTRAINT galaxy_planet_moon_name_key UNIQUE (name);


--
-- Name: galaxy_planet_moon galaxy_planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet_moon
    ADD CONSTRAINT galaxy_planet_moon_pkey PRIMARY KEY (galaxy_planet_moon_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


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
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon un_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT un_name UNIQUE (name);


--
-- Name: moon un_name1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT un_name1 UNIQUE (name);


--
-- Name: galaxy_planet_moon galaxy_planet_moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet_moon
    ADD CONSTRAINT galaxy_planet_moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_planet_moon galaxy_planet_moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet_moon
    ADD CONSTRAINT galaxy_planet_moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: galaxy_planet_moon galaxy_planet_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet_moon
    ADD CONSTRAINT galaxy_planet_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy_planet_moon galaxy_planet_moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet_moon
    ADD CONSTRAINT galaxy_planet_moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

