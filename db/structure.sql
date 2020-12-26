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
-- Name: content_language_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_language_translations ALTER COLUMN id SET DEFAULT nextval('public.content_language_translations_id_seq'::regclass);


--
-- Name: content_languages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_languages ALTER COLUMN id SET DEFAULT nextval('public.content_languages_id_seq'::regclass);


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
-- Name: tag_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag_translations ALTER COLUMN id SET DEFAULT nextval('public.tag_translations_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: title_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.title_translations ALTER COLUMN id SET DEFAULT nextval('public.title_translations_id_seq'::regclass);


--
-- Name: titles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titles ALTER COLUMN id SET DEFAULT nextval('public.titles_id_seq'::regclass);


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
-- Name: index_interface_language_translations_on_content_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_interface_language_translations_on_content_language_id ON public.interface_language_translations USING btree (content_language_id);


--
-- Name: index_interface_language_translations_on_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_interface_language_translations_on_resource_id ON public.interface_language_translations USING btree (resource_id);


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
-- Name: index_tag_translations_on_content_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tag_translations_on_content_language_id ON public.tag_translations USING btree (content_language_id);


--
-- Name: index_tag_translations_on_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tag_translations_on_resource_id ON public.tag_translations USING btree (resource_id);


--
-- Name: index_tag_translations_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tag_translations_uniqueness ON public.tag_translations USING btree (resource_id, content_language_id);


--
-- Name: index_tags_on_lower_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tags_on_lower_key ON public.tags USING btree (lower((key)::text));


--
-- Name: index_title_translations_on_content_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_title_translations_on_content_language_id ON public.title_translations USING btree (content_language_id);


--
-- Name: index_title_translations_on_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_title_translations_on_resource_id ON public.title_translations USING btree (resource_id);


--
-- Name: index_title_translations_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_title_translations_uniqueness ON public.title_translations USING btree (resource_id, content_language_id);


--
-- Name: title_translations fk_rails_0d3349eccd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.title_translations
    ADD CONSTRAINT fk_rails_0d3349eccd FOREIGN KEY (resource_id) REFERENCES public.titles(id);


--
-- Name: tag_translations fk_rails_1635fa7614; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag_translations
    ADD CONSTRAINT fk_rails_1635fa7614 FOREIGN KEY (content_language_id) REFERENCES public.content_languages(id);


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
-- Name: content_languages fk_rails_83d548600f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_languages
    ADD CONSTRAINT fk_rails_83d548600f FOREIGN KEY (locale_id) REFERENCES public.locales(id);


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
('20201226022326');


