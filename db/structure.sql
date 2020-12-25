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
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: content_language_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_language_translations ALTER COLUMN id SET DEFAULT nextval('public.content_language_translations_id_seq'::regclass);


--
-- Name: content_languages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_languages ALTER COLUMN id SET DEFAULT nextval('public.content_languages_id_seq'::regclass);


--
-- Name: locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locales ALTER COLUMN id SET DEFAULT nextval('public.locales_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


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
-- Name: locales locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locales
    ADD CONSTRAINT locales_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_content_language_translations_on_content_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_content_language_translations_on_content_language_id ON public.content_language_translations USING btree (content_language_id);


--
-- Name: index_content_language_translations_on_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_content_language_translations_on_resource_id ON public.content_language_translations USING btree (resource_id);


--
-- Name: index_content_language_translations_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_content_language_translations_uniqueness ON public.content_language_translations USING btree (resource_id, content_language_id);


--
-- Name: index_content_languages_on_locale_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_content_languages_on_locale_id ON public.content_languages USING btree (locale_id);


--
-- Name: index_locales_on_lower_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_locales_on_lower_key ON public.locales USING btree (lower((key)::text));


--
-- Name: content_language_translations fk_rails_2768f33fbe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_language_translations
    ADD CONSTRAINT fk_rails_2768f33fbe FOREIGN KEY (content_language_id) REFERENCES public.content_languages(id);


--
-- Name: content_language_translations fk_rails_38abb8969d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_language_translations
    ADD CONSTRAINT fk_rails_38abb8969d FOREIGN KEY (resource_id) REFERENCES public.content_languages(id);


--
-- Name: content_languages fk_rails_83d548600f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_languages
    ADD CONSTRAINT fk_rails_83d548600f FOREIGN KEY (locale_id) REFERENCES public.locales(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20201220193038'),
('20201221114759'),
('20201221154503');


