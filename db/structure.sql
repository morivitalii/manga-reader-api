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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: artist_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artist_translations (
    id bigint NOT NULL,
    content_language_id bigint NOT NULL,
    resource_id bigint NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    edited_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: artist_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.artist_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: artist_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.artist_translations_id_seq OWNED BY public.artist_translations.id;


--
-- Name: artists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artists (
    id bigint NOT NULL,
    user_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.artists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- Name: content_language_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.content_language_translations (
    id bigint NOT NULL,
    content_language_id bigint,
    resource_id bigint NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    edited_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: content_language_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.content_language_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: content_language_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.content_language_translations_id_seq OWNED BY public.content_language_translations.id;


--
-- Name: content_languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.content_languages (
    id bigint NOT NULL,
    locale_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: content_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.content_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: content_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.content_languages_id_seq OWNED BY public.content_languages.id;


--
-- Name: demographics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.demographics (
    id bigint NOT NULL,
    tag_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: demographics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.demographics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demographics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.demographics_id_seq OWNED BY public.demographics.id;


--
-- Name: formats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.formats (
    id bigint NOT NULL,
    tag_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: formats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.formats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: formats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.formats_id_seq OWNED BY public.formats.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres (
    id bigint NOT NULL,
    tag_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: group_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.group_users (
    id bigint NOT NULL,
    group_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: group_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.group_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: group_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.group_users_id_seq OWNED BY public.group_users.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.groups (
    id bigint NOT NULL,
    title character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: interface_language_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.interface_language_translations (
    id bigint NOT NULL,
    content_language_id bigint NOT NULL,
    resource_id bigint NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    edited_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: interface_language_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.interface_language_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: interface_language_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.interface_language_translations_id_seq OWNED BY public.interface_language_translations.id;


--
-- Name: interface_languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.interface_languages (
    id bigint NOT NULL,
    locale_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: interface_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.interface_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: interface_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.interface_languages_id_seq OWNED BY public.interface_languages.id;


--
-- Name: locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.locales (
    id bigint NOT NULL,
    key character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.locales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.locales_id_seq OWNED BY public.locales.id;


--
-- Name: marks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.marks (
    id bigint NOT NULL,
    tag_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: marks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.marks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: marks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.marks_id_seq OWNED BY public.marks.id;


--
-- Name: resource_artists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resource_artists (
    id bigint NOT NULL,
    artist_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    artist_type character varying NOT NULL
);


--
-- Name: resource_artists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resource_artists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resource_artists_id_seq OWNED BY public.resource_artists.id;


--
-- Name: resource_demographics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resource_demographics (
    id bigint NOT NULL,
    demographic_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: resource_demographics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resource_demographics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_demographics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resource_demographics_id_seq OWNED BY public.resource_demographics.id;


--
-- Name: resource_formats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resource_formats (
    id bigint NOT NULL,
    format_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: resource_formats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resource_formats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_formats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resource_formats_id_seq OWNED BY public.resource_formats.id;


--
-- Name: resource_genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resource_genres (
    id bigint NOT NULL,
    genre_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: resource_genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resource_genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resource_genres_id_seq OWNED BY public.resource_genres.id;


--
-- Name: resource_marks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resource_marks (
    id bigint NOT NULL,
    mark_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: resource_marks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resource_marks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_marks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resource_marks_id_seq OWNED BY public.resource_marks.id;


--
-- Name: resource_themes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resource_themes (
    id bigint NOT NULL,
    theme_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: resource_themes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resource_themes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resource_themes_id_seq OWNED BY public.resource_themes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: tag_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tag_translations (
    id bigint NOT NULL,
    content_language_id bigint NOT NULL,
    resource_id bigint NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    edited_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: tag_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tag_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tag_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tag_translations_id_seq OWNED BY public.tag_translations.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    key character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: themes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.themes (
    id bigint NOT NULL,
    tag_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: themes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.themes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.themes_id_seq OWNED BY public.themes.id;


--
-- Name: title_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.title_translations (
    id bigint NOT NULL,
    content_language_id bigint NOT NULL,
    resource_id bigint NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    edited_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: title_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.title_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: title_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.title_translations_id_seq OWNED BY public.title_translations.id;


--
-- Name: titles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.titles (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: titles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.titles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: titles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.titles_id_seq OWNED BY public.titles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying NOT NULL,
    email character varying NOT NULL,
    password_digest character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: writers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.writers (
    id bigint NOT NULL,
    artist_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: writers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.writers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: writers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.writers_id_seq OWNED BY public.writers.id;


--
-- Name: artist_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_translations ALTER COLUMN id SET DEFAULT nextval('public.artist_translations_id_seq'::regclass);


--
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- Name: content_language_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_language_translations ALTER COLUMN id SET DEFAULT nextval('public.content_language_translations_id_seq'::regclass);


--
-- Name: content_languages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_languages ALTER COLUMN id SET DEFAULT nextval('public.content_languages_id_seq'::regclass);


--
-- Name: demographics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demographics ALTER COLUMN id SET DEFAULT nextval('public.demographics_id_seq'::regclass);


--
-- Name: formats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.formats ALTER COLUMN id SET DEFAULT nextval('public.formats_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: group_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_users ALTER COLUMN id SET DEFAULT nextval('public.group_users_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: interface_language_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interface_language_translations ALTER COLUMN id SET DEFAULT nextval('public.interface_language_translations_id_seq'::regclass);


--
-- Name: interface_languages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interface_languages ALTER COLUMN id SET DEFAULT nextval('public.interface_languages_id_seq'::regclass);


--
-- Name: locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locales ALTER COLUMN id SET DEFAULT nextval('public.locales_id_seq'::regclass);


--
-- Name: marks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marks ALTER COLUMN id SET DEFAULT nextval('public.marks_id_seq'::regclass);


--
-- Name: resource_artists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_artists ALTER COLUMN id SET DEFAULT nextval('public.resource_artists_id_seq'::regclass);


--
-- Name: resource_demographics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_demographics ALTER COLUMN id SET DEFAULT nextval('public.resource_demographics_id_seq'::regclass);


--
-- Name: resource_formats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_formats ALTER COLUMN id SET DEFAULT nextval('public.resource_formats_id_seq'::regclass);


--
-- Name: resource_genres id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_genres ALTER COLUMN id SET DEFAULT nextval('public.resource_genres_id_seq'::regclass);


--
-- Name: resource_marks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_marks ALTER COLUMN id SET DEFAULT nextval('public.resource_marks_id_seq'::regclass);


--
-- Name: resource_themes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_themes ALTER COLUMN id SET DEFAULT nextval('public.resource_themes_id_seq'::regclass);


--
-- Name: tag_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag_translations ALTER COLUMN id SET DEFAULT nextval('public.tag_translations_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: themes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.themes ALTER COLUMN id SET DEFAULT nextval('public.themes_id_seq'::regclass);


--
-- Name: title_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.title_translations ALTER COLUMN id SET DEFAULT nextval('public.title_translations_id_seq'::regclass);


--
-- Name: titles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titles ALTER COLUMN id SET DEFAULT nextval('public.titles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: writers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.writers ALTER COLUMN id SET DEFAULT nextval('public.writers_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: artist_translations artist_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_translations
    ADD CONSTRAINT artist_translations_pkey PRIMARY KEY (id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: content_language_translations content_language_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_language_translations
    ADD CONSTRAINT content_language_translations_pkey PRIMARY KEY (id);


--
-- Name: content_languages content_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_languages
    ADD CONSTRAINT content_languages_pkey PRIMARY KEY (id);


--
-- Name: demographics demographics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demographics
    ADD CONSTRAINT demographics_pkey PRIMARY KEY (id);


--
-- Name: formats formats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.formats
    ADD CONSTRAINT formats_pkey PRIMARY KEY (id);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: group_users group_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_users
    ADD CONSTRAINT group_users_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: interface_language_translations interface_language_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interface_language_translations
    ADD CONSTRAINT interface_language_translations_pkey PRIMARY KEY (id);


--
-- Name: interface_languages interface_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interface_languages
    ADD CONSTRAINT interface_languages_pkey PRIMARY KEY (id);


--
-- Name: locales locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locales
    ADD CONSTRAINT locales_pkey PRIMARY KEY (id);


--
-- Name: marks marks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT marks_pkey PRIMARY KEY (id);


--
-- Name: resource_artists resource_artists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_artists
    ADD CONSTRAINT resource_artists_pkey PRIMARY KEY (id);


--
-- Name: resource_demographics resource_demographics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_demographics
    ADD CONSTRAINT resource_demographics_pkey PRIMARY KEY (id);


--
-- Name: resource_formats resource_formats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_formats
    ADD CONSTRAINT resource_formats_pkey PRIMARY KEY (id);


--
-- Name: resource_genres resource_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_genres
    ADD CONSTRAINT resource_genres_pkey PRIMARY KEY (id);


--
-- Name: resource_marks resource_marks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_marks
    ADD CONSTRAINT resource_marks_pkey PRIMARY KEY (id);


--
-- Name: resource_themes resource_themes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_themes
    ADD CONSTRAINT resource_themes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tag_translations tag_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag_translations
    ADD CONSTRAINT tag_translations_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: themes themes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);


--
-- Name: title_translations title_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.title_translations
    ADD CONSTRAINT title_translations_pkey PRIMARY KEY (id);


--
-- Name: titles titles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: writers writers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.writers
    ADD CONSTRAINT writers_pkey PRIMARY KEY (id);


--
-- Name: index_artist_translations_on_content_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_artist_translations_on_content_language_id ON public.artist_translations USING btree (content_language_id);


--
-- Name: index_artist_translations_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_artist_translations_on_name ON public.artist_translations USING btree (name);


--
-- Name: index_artist_translations_on_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_artist_translations_on_resource_id ON public.artist_translations USING btree (resource_id);


--
-- Name: index_artist_translations_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_artist_translations_uniqueness ON public.artist_translations USING btree (resource_id, content_language_id);


--
-- Name: index_artists_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_artists_on_user_id ON public.artists USING btree (user_id);


--
-- Name: index_content_language_translations_on_content_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_content_language_translations_on_content_language_id ON public.content_language_translations USING btree (content_language_id);


--
-- Name: index_content_language_translations_on_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_content_language_translations_on_resource_id ON public.content_language_translations USING btree (resource_id);


--
-- Name: index_content_language_translations_on_title; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_content_language_translations_on_title ON public.content_language_translations USING btree (title);


--
-- Name: index_content_language_translations_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_content_language_translations_uniqueness ON public.content_language_translations USING btree (resource_id, content_language_id);


--
-- Name: index_content_languages_on_locale_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_content_languages_on_locale_id ON public.content_languages USING btree (locale_id);


--
-- Name: index_demographics_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_demographics_on_tag_id ON public.demographics USING btree (tag_id);


--
-- Name: index_formats_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_formats_on_tag_id ON public.formats USING btree (tag_id);


--
-- Name: index_genres_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_genres_on_tag_id ON public.genres USING btree (tag_id);


--
-- Name: index_group_users_on_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_group_users_on_group_id ON public.group_users USING btree (group_id);


--
-- Name: index_group_users_on_group_id_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_group_users_on_group_id_and_user_id ON public.group_users USING btree (group_id, user_id);


--
-- Name: index_group_users_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_group_users_on_user_id ON public.group_users USING btree (user_id);


--
-- Name: index_interface_language_translations_on_content_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_interface_language_translations_on_content_language_id ON public.interface_language_translations USING btree (content_language_id);


--
-- Name: index_interface_language_translations_on_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_interface_language_translations_on_resource_id ON public.interface_language_translations USING btree (resource_id);


--
-- Name: index_interface_language_translations_on_title; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_interface_language_translations_on_title ON public.interface_language_translations USING btree (title);


--
-- Name: index_interface_language_translations_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_interface_language_translations_uniqueness ON public.interface_language_translations USING btree (resource_id, content_language_id);


--
-- Name: index_interface_languages_on_locale_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_interface_languages_on_locale_id ON public.interface_languages USING btree (locale_id);


--
-- Name: index_locales_on_lower_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_locales_on_lower_key ON public.locales USING btree (lower((key)::text));


--
-- Name: index_marks_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_marks_on_tag_id ON public.marks USING btree (tag_id);


--
-- Name: index_resource_artists_on_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_artists_on_artist_id ON public.resource_artists USING btree (artist_id);


--
-- Name: index_resource_artists_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_artists_on_resource ON public.resource_artists USING btree (resource_type, resource_id);


--
-- Name: index_resource_artists_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_resource_artists_uniqueness ON public.resource_artists USING btree (artist_id, artist_type, resource_type, resource_id);


--
-- Name: index_resource_demographics_on_demographic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_demographics_on_demographic_id ON public.resource_demographics USING btree (demographic_id);


--
-- Name: index_resource_demographics_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_demographics_on_resource ON public.resource_demographics USING btree (resource_type, resource_id);


--
-- Name: index_resource_demographics_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_resource_demographics_uniqueness ON public.resource_demographics USING btree (demographic_id, resource_type, resource_id);


--
-- Name: index_resource_formats_on_format_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_formats_on_format_id ON public.resource_formats USING btree (format_id);


--
-- Name: index_resource_formats_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_formats_on_resource ON public.resource_formats USING btree (resource_type, resource_id);


--
-- Name: index_resource_formats_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_resource_formats_uniqueness ON public.resource_formats USING btree (format_id, resource_type, resource_id);


--
-- Name: index_resource_genres_on_genre_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_genres_on_genre_id ON public.resource_genres USING btree (genre_id);


--
-- Name: index_resource_genres_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_genres_on_resource ON public.resource_genres USING btree (resource_type, resource_id);


--
-- Name: index_resource_genres_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_resource_genres_uniqueness ON public.resource_genres USING btree (genre_id, resource_type, resource_id);


--
-- Name: index_resource_marks_on_mark_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_marks_on_mark_id ON public.resource_marks USING btree (mark_id);


--
-- Name: index_resource_marks_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_marks_on_resource ON public.resource_marks USING btree (resource_type, resource_id);


--
-- Name: index_resource_marks_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_resource_marks_uniqueness ON public.resource_marks USING btree (mark_id, resource_type, resource_id);


--
-- Name: index_resource_themes_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_themes_on_resource ON public.resource_themes USING btree (resource_type, resource_id);


--
-- Name: index_resource_themes_on_theme_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_themes_on_theme_id ON public.resource_themes USING btree (theme_id);


--
-- Name: index_resource_themes_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_resource_themes_uniqueness ON public.resource_themes USING btree (theme_id, resource_type, resource_id);


--
-- Name: index_tag_translations_on_content_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tag_translations_on_content_language_id ON public.tag_translations USING btree (content_language_id);


--
-- Name: index_tag_translations_on_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tag_translations_on_resource_id ON public.tag_translations USING btree (resource_id);


--
-- Name: index_tag_translations_on_title; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tag_translations_on_title ON public.tag_translations USING btree (title);


--
-- Name: index_tag_translations_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tag_translations_uniqueness ON public.tag_translations USING btree (resource_id, content_language_id);


--
-- Name: index_tags_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tags_on_key ON public.tags USING btree (key);


--
-- Name: index_themes_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_themes_on_tag_id ON public.themes USING btree (tag_id);


--
-- Name: index_title_translations_on_content_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_title_translations_on_content_language_id ON public.title_translations USING btree (content_language_id);


--
-- Name: index_title_translations_on_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_title_translations_on_resource_id ON public.title_translations USING btree (resource_id);


--
-- Name: index_title_translations_on_title; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_title_translations_on_title ON public.title_translations USING btree (title);


--
-- Name: index_title_translations_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_title_translations_uniqueness ON public.title_translations USING btree (resource_id, content_language_id);


--
-- Name: index_users_on_lower_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_lower_email ON public.users USING btree (lower((email)::text));


--
-- Name: index_users_on_lower_username; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_lower_username ON public.users USING btree (lower((username)::text));


--
-- Name: index_writers_on_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_writers_on_artist_id ON public.writers USING btree (artist_id);


--
-- Name: formats fk_rails_0400824e47; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.formats
    ADD CONSTRAINT fk_rails_0400824e47 FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: themes fk_rails_0495226a20; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT fk_rails_0495226a20 FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: title_translations fk_rails_0d3349eccd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.title_translations
    ADD CONSTRAINT fk_rails_0d3349eccd FOREIGN KEY (resource_id) REFERENCES public.titles(id);


--
-- Name: group_users fk_rails_1486913327; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_users
    ADD CONSTRAINT fk_rails_1486913327 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: tag_translations fk_rails_1635fa7614; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag_translations
    ADD CONSTRAINT fk_rails_1635fa7614 FOREIGN KEY (content_language_id) REFERENCES public.content_languages(id);


--
-- Name: resource_artists fk_rails_25cea7c2c7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_artists
    ADD CONSTRAINT fk_rails_25cea7c2c7 FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- Name: content_language_translations fk_rails_2768f33fbe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_language_translations
    ADD CONSTRAINT fk_rails_2768f33fbe FOREIGN KEY (content_language_id) REFERENCES public.content_languages(id);


--
-- Name: writers fk_rails_2942212f78; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.writers
    ADD CONSTRAINT fk_rails_2942212f78 FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- Name: content_language_translations fk_rails_38abb8969d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_language_translations
    ADD CONSTRAINT fk_rails_38abb8969d FOREIGN KEY (resource_id) REFERENCES public.content_languages(id);


--
-- Name: title_translations fk_rails_3c716d17ad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.title_translations
    ADD CONSTRAINT fk_rails_3c716d17ad FOREIGN KEY (content_language_id) REFERENCES public.content_languages(id);


--
-- Name: interface_language_translations fk_rails_4a3cd8d21f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interface_language_translations
    ADD CONSTRAINT fk_rails_4a3cd8d21f FOREIGN KEY (resource_id) REFERENCES public.interface_languages(id);


--
-- Name: tag_translations fk_rails_60cffa4907; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag_translations
    ADD CONSTRAINT fk_rails_60cffa4907 FOREIGN KEY (resource_id) REFERENCES public.tags(id);


--
-- Name: artists fk_rails_6bcbebdd23; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT fk_rails_6bcbebdd23 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: content_languages fk_rails_83d548600f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_languages
    ADD CONSTRAINT fk_rails_83d548600f FOREIGN KEY (locale_id) REFERENCES public.locales(id);


--
-- Name: group_users fk_rails_a9d5f48449; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_users
    ADD CONSTRAINT fk_rails_a9d5f48449 FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: marks fk_rails_ac66cf165f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT fk_rails_ac66cf165f FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: artist_translations fk_rails_e6907ab812; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_translations
    ADD CONSTRAINT fk_rails_e6907ab812 FOREIGN KEY (content_language_id) REFERENCES public.content_languages(id);


--
-- Name: artist_translations fk_rails_ea87634ab3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_translations
    ADD CONSTRAINT fk_rails_ea87634ab3 FOREIGN KEY (resource_id) REFERENCES public.artists(id);


--
-- Name: interface_language_translations fk_rails_ee7b55ca7d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interface_language_translations
    ADD CONSTRAINT fk_rails_ee7b55ca7d FOREIGN KEY (content_language_id) REFERENCES public.content_languages(id);


--
-- Name: interface_languages fk_rails_f4d2cc267e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interface_languages
    ADD CONSTRAINT fk_rails_f4d2cc267e FOREIGN KEY (locale_id) REFERENCES public.locales(id);


--
-- Name: demographics fk_rails_fedc0e7479; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demographics
    ADD CONSTRAINT fk_rails_fedc0e7479 FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: genres fk_rails_ffa5e79962; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT fk_rails_ffa5e79962 FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20201220193038'),
('20201221114759'),
('20201221154503'),
('20201226002544'),
('20201226002925'),
('20201226014809'),
('20201226014814'),
('20201226022318'),
('20201226022326'),
('20201226025537'),
('20201226041301'),
('20201226042855'),
('20201226050013'),
('20201230071033'),
('20201230071805'),
('20210101204321'),
('20210101204852'),
('20210101205700'),
('20210101205909'),
('20210103101139'),
('20210103102854'),
('20210104071533'),
('20210109173047'),
('20210109173359'),
('20210110213257'),
('20210110215953'),
('20210111023707'),
('20210111023920'),
('20210129194750'),
('20210129194913'),
('20210129194918'),
('20210129194925'),
('20210129194930'),
('20210129194936');


