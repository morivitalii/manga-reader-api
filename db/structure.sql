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
-- Name: access_rights; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.access_rights (
    id bigint NOT NULL,
    key character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: access_rights_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.access_rights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: access_rights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.access_rights_id_seq OWNED BY public.access_rights.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


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
    updated_at timestamp(6) without time zone NOT NULL,
    favorites_count bigint DEFAULT 0 NOT NULL
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
-- Name: bookmarks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bookmarks (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bookmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bookmarks_id_seq OWNED BY public.bookmarks.id;


--
-- Name: chapters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chapters (
    id bigint NOT NULL,
    title_id bigint NOT NULL,
    volume_id bigint,
    group_id bigint NOT NULL,
    number integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    status integer NOT NULL,
    views_count bigint DEFAULT 0 NOT NULL,
    bookmarks_count bigint DEFAULT 0 NOT NULL,
    pages_count bigint DEFAULT 0 NOT NULL,
    user_id bigint NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    content_language_id bigint NOT NULL
);


--
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chapters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chapters_id_seq OWNED BY public.chapters.id;


--
-- Name: cleaners; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cleaners (
    id bigint NOT NULL,
    artist_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: cleaners_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cleaners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cleaners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cleaners_id_seq OWNED BY public.cleaners.id;


--
-- Name: content_language_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.content_language_translations (
    id bigint NOT NULL,
    content_language_id bigint,
    resource_id bigint NOT NULL,
    title character varying DEFAULT ''::character varying,
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
-- Name: editors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.editors (
    id bigint NOT NULL,
    artist_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: editors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.editors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: editors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.editors_id_seq OWNED BY public.editors.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.favorites (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


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
    updated_at timestamp(6) without time zone NOT NULL,
    favorites_count bigint DEFAULT 0 NOT NULL,
    users_count bigint DEFAULT 0 NOT NULL
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
    title character varying DEFAULT ''::character varying,
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
-- Name: pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages (
    id bigint NOT NULL,
    chapter_id bigint NOT NULL,
    number integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    views_count bigint DEFAULT 0 NOT NULL,
    bookmarks_count bigint DEFAULT 0 NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: painters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.painters (
    id bigint NOT NULL,
    artist_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: painters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.painters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: painters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.painters_id_seq OWNED BY public.painters.id;


--
-- Name: resource_cleaners; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resource_cleaners (
    id bigint NOT NULL,
    cleaner_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: resource_cleaners_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resource_cleaners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_cleaners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resource_cleaners_id_seq OWNED BY public.resource_cleaners.id;


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
-- Name: resource_editors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resource_editors (
    id bigint NOT NULL,
    editor_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: resource_editors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resource_editors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_editors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resource_editors_id_seq OWNED BY public.resource_editors.id;


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
-- Name: resource_painters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resource_painters (
    id bigint NOT NULL,
    painter_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: resource_painters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resource_painters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_painters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resource_painters_id_seq OWNED BY public.resource_painters.id;


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
-- Name: resource_translators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resource_translators (
    id bigint NOT NULL,
    translator_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: resource_translators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resource_translators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_translators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resource_translators_id_seq OWNED BY public.resource_translators.id;


--
-- Name: resource_typers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resource_typers (
    id bigint NOT NULL,
    typer_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: resource_typers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resource_typers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_typers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resource_typers_id_seq OWNED BY public.resource_typers.id;


--
-- Name: resource_writers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resource_writers (
    id bigint NOT NULL,
    writer_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: resource_writers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resource_writers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_writers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resource_writers_id_seq OWNED BY public.resource_writers.id;


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
    updated_at timestamp(6) without time zone NOT NULL,
    description text DEFAULT ''::text NOT NULL
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
    updated_at timestamp(6) without time zone NOT NULL,
    description text DEFAULT ''::text NOT NULL
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
    updated_at timestamp(6) without time zone NOT NULL,
    publication_status integer NOT NULL,
    views_count bigint DEFAULT 0 NOT NULL,
    bookmarks_count bigint DEFAULT 0 NOT NULL,
    original_content_language_id bigint,
    favorites_count bigint DEFAULT 0 NOT NULL,
    status integer NOT NULL
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
-- Name: translators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.translators (
    id bigint NOT NULL,
    artist_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: translators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.translators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: translators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.translators_id_seq OWNED BY public.translators.id;


--
-- Name: typers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.typers (
    id bigint NOT NULL,
    artist_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: typers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.typers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: typers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.typers_id_seq OWNED BY public.typers.id;


--
-- Name: user_access_rights; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_access_rights (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    access_right_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: user_access_rights_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_access_rights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_access_rights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_access_rights_id_seq OWNED BY public.user_access_rights.id;


--
-- Name: user_content_languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_content_languages (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    content_language_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: user_content_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_content_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_content_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_content_languages_id_seq OWNED BY public.user_content_languages.id;


--
-- Name: user_excluded_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_excluded_tags (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    tag_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: user_excluded_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_excluded_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_excluded_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_excluded_tags_id_seq OWNED BY public.user_excluded_tags.id;


--
-- Name: user_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_settings (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    interface_language_id bigint,
    name character varying DEFAULT ''::character varying NOT NULL,
    surname character varying DEFAULT ''::character varying NOT NULL,
    sex integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: user_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_settings_id_seq OWNED BY public.user_settings.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying NOT NULL,
    email character varying NOT NULL,
    password_digest character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    favorites_count bigint DEFAULT 0 NOT NULL,
    bookmarks_count bigint DEFAULT 0 NOT NULL,
    views_count bigint DEFAULT 0 NOT NULL
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
-- Name: views; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.views (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: views_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.views_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: views_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.views_id_seq OWNED BY public.views.id;


--
-- Name: volumes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.volumes (
    id bigint NOT NULL,
    title_id bigint NOT NULL,
    number integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: volumes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.volumes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volumes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.volumes_id_seq OWNED BY public.volumes.id;


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
-- Name: access_rights id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.access_rights ALTER COLUMN id SET DEFAULT nextval('public.access_rights_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: artist_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_translations ALTER COLUMN id SET DEFAULT nextval('public.artist_translations_id_seq'::regclass);


--
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- Name: bookmarks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookmarks ALTER COLUMN id SET DEFAULT nextval('public.bookmarks_id_seq'::regclass);


--
-- Name: chapters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters ALTER COLUMN id SET DEFAULT nextval('public.chapters_id_seq'::regclass);


--
-- Name: cleaners id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cleaners ALTER COLUMN id SET DEFAULT nextval('public.cleaners_id_seq'::regclass);


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
-- Name: editors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.editors ALTER COLUMN id SET DEFAULT nextval('public.editors_id_seq'::regclass);


--
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


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
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: painters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.painters ALTER COLUMN id SET DEFAULT nextval('public.painters_id_seq'::regclass);


--
-- Name: resource_cleaners id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_cleaners ALTER COLUMN id SET DEFAULT nextval('public.resource_cleaners_id_seq'::regclass);


--
-- Name: resource_demographics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_demographics ALTER COLUMN id SET DEFAULT nextval('public.resource_demographics_id_seq'::regclass);


--
-- Name: resource_editors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_editors ALTER COLUMN id SET DEFAULT nextval('public.resource_editors_id_seq'::regclass);


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
-- Name: resource_painters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_painters ALTER COLUMN id SET DEFAULT nextval('public.resource_painters_id_seq'::regclass);


--
-- Name: resource_themes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_themes ALTER COLUMN id SET DEFAULT nextval('public.resource_themes_id_seq'::regclass);


--
-- Name: resource_translators id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_translators ALTER COLUMN id SET DEFAULT nextval('public.resource_translators_id_seq'::regclass);


--
-- Name: resource_typers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_typers ALTER COLUMN id SET DEFAULT nextval('public.resource_typers_id_seq'::regclass);


--
-- Name: resource_writers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_writers ALTER COLUMN id SET DEFAULT nextval('public.resource_writers_id_seq'::regclass);


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
-- Name: translators id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.translators ALTER COLUMN id SET DEFAULT nextval('public.translators_id_seq'::regclass);


--
-- Name: typers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.typers ALTER COLUMN id SET DEFAULT nextval('public.typers_id_seq'::regclass);


--
-- Name: user_access_rights id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_access_rights ALTER COLUMN id SET DEFAULT nextval('public.user_access_rights_id_seq'::regclass);


--
-- Name: user_content_languages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_content_languages ALTER COLUMN id SET DEFAULT nextval('public.user_content_languages_id_seq'::regclass);


--
-- Name: user_excluded_tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_excluded_tags ALTER COLUMN id SET DEFAULT nextval('public.user_excluded_tags_id_seq'::regclass);


--
-- Name: user_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_settings ALTER COLUMN id SET DEFAULT nextval('public.user_settings_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: views id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.views ALTER COLUMN id SET DEFAULT nextval('public.views_id_seq'::regclass);


--
-- Name: volumes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volumes ALTER COLUMN id SET DEFAULT nextval('public.volumes_id_seq'::regclass);


--
-- Name: writers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.writers ALTER COLUMN id SET DEFAULT nextval('public.writers_id_seq'::regclass);


--
-- Name: access_rights access_rights_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.access_rights
    ADD CONSTRAINT access_rights_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


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
-- Name: bookmarks bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_pkey PRIMARY KEY (id);


--
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- Name: cleaners cleaners_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cleaners
    ADD CONSTRAINT cleaners_pkey PRIMARY KEY (id);


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
-- Name: editors editors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.editors
    ADD CONSTRAINT editors_pkey PRIMARY KEY (id);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


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
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: painters painters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.painters
    ADD CONSTRAINT painters_pkey PRIMARY KEY (id);


--
-- Name: resource_cleaners resource_cleaners_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_cleaners
    ADD CONSTRAINT resource_cleaners_pkey PRIMARY KEY (id);


--
-- Name: resource_demographics resource_demographics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_demographics
    ADD CONSTRAINT resource_demographics_pkey PRIMARY KEY (id);


--
-- Name: resource_editors resource_editors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_editors
    ADD CONSTRAINT resource_editors_pkey PRIMARY KEY (id);


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
-- Name: resource_painters resource_painters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_painters
    ADD CONSTRAINT resource_painters_pkey PRIMARY KEY (id);


--
-- Name: resource_themes resource_themes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_themes
    ADD CONSTRAINT resource_themes_pkey PRIMARY KEY (id);


--
-- Name: resource_translators resource_translators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_translators
    ADD CONSTRAINT resource_translators_pkey PRIMARY KEY (id);


--
-- Name: resource_typers resource_typers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_typers
    ADD CONSTRAINT resource_typers_pkey PRIMARY KEY (id);


--
-- Name: resource_writers resource_writers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_writers
    ADD CONSTRAINT resource_writers_pkey PRIMARY KEY (id);


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
-- Name: translators translators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.translators
    ADD CONSTRAINT translators_pkey PRIMARY KEY (id);


--
-- Name: typers typers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.typers
    ADD CONSTRAINT typers_pkey PRIMARY KEY (id);


--
-- Name: user_access_rights user_access_rights_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_access_rights
    ADD CONSTRAINT user_access_rights_pkey PRIMARY KEY (id);


--
-- Name: user_content_languages user_content_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_content_languages
    ADD CONSTRAINT user_content_languages_pkey PRIMARY KEY (id);


--
-- Name: user_excluded_tags user_excluded_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_excluded_tags
    ADD CONSTRAINT user_excluded_tags_pkey PRIMARY KEY (id);


--
-- Name: user_settings user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: views views_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.views
    ADD CONSTRAINT views_pkey PRIMARY KEY (id);


--
-- Name: volumes volumes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volumes
    ADD CONSTRAINT volumes_pkey PRIMARY KEY (id);


--
-- Name: writers writers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.writers
    ADD CONSTRAINT writers_pkey PRIMARY KEY (id);


--
-- Name: index_access_rights_on_lower_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_access_rights_on_lower_key ON public.access_rights USING btree (lower((key)::text));


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


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
-- Name: index_bookmarks_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bookmarks_on_created_at ON public.bookmarks USING btree (created_at);


--
-- Name: index_bookmarks_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bookmarks_on_resource ON public.bookmarks USING btree (resource_type, resource_id);


--
-- Name: index_bookmarks_on_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bookmarks_on_updated_at ON public.bookmarks USING btree (updated_at);


--
-- Name: index_bookmarks_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bookmarks_on_user_id ON public.bookmarks USING btree (user_id);


--
-- Name: index_bookmarks_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_bookmarks_uniqueness ON public.bookmarks USING btree (user_id, resource_type, resource_id);


--
-- Name: index_chapters_on_content_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_chapters_on_content_language_id ON public.chapters USING btree (content_language_id);


--
-- Name: index_chapters_on_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_chapters_on_group_id ON public.chapters USING btree (group_id);


--
-- Name: index_chapters_on_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_chapters_on_number ON public.chapters USING btree (number);


--
-- Name: index_chapters_on_title_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_chapters_on_title_id ON public.chapters USING btree (title_id);


--
-- Name: index_chapters_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_chapters_on_user_id ON public.chapters USING btree (user_id);


--
-- Name: index_chapters_on_volume_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_chapters_on_volume_id ON public.chapters USING btree (volume_id);


--
-- Name: index_cleaners_on_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_cleaners_on_artist_id ON public.cleaners USING btree (artist_id);


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
-- Name: index_editors_on_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_editors_on_artist_id ON public.editors USING btree (artist_id);


--
-- Name: index_favorites_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_favorites_on_created_at ON public.favorites USING btree (created_at);


--
-- Name: index_favorites_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_favorites_on_resource ON public.favorites USING btree (resource_type, resource_id);


--
-- Name: index_favorites_on_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_favorites_on_updated_at ON public.favorites USING btree (updated_at);


--
-- Name: index_favorites_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_favorites_on_user_id ON public.favorites USING btree (user_id);


--
-- Name: index_favorites_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_favorites_uniqueness ON public.favorites USING btree (user_id, resource_type, resource_id);


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
-- Name: index_groups_on_title; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_groups_on_title ON public.groups USING btree (title);


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
-- Name: index_locales_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_locales_on_key ON public.locales USING btree (key);


--
-- Name: index_locales_on_lower_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_locales_on_lower_key ON public.locales USING btree (lower((key)::text));


--
-- Name: index_marks_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_marks_on_tag_id ON public.marks USING btree (tag_id);


--
-- Name: index_pages_on_chapter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pages_on_chapter_id ON public.pages USING btree (chapter_id);


--
-- Name: index_pages_on_chapter_id_and_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_pages_on_chapter_id_and_number ON public.pages USING btree (chapter_id, number);


--
-- Name: index_pages_on_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pages_on_number ON public.pages USING btree (number);


--
-- Name: index_pages_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pages_on_user_id ON public.pages USING btree (user_id);


--
-- Name: index_painters_on_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_painters_on_artist_id ON public.painters USING btree (artist_id);


--
-- Name: index_resource_cleaners_on_cleaner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_cleaners_on_cleaner_id ON public.resource_cleaners USING btree (cleaner_id);


--
-- Name: index_resource_cleaners_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_cleaners_on_resource ON public.resource_cleaners USING btree (resource_type, resource_id);


--
-- Name: index_resource_cleaners_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_resource_cleaners_uniqueness ON public.resource_cleaners USING btree (cleaner_id, resource_type, resource_id);


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
-- Name: index_resource_editors_on_editor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_editors_on_editor_id ON public.resource_editors USING btree (editor_id);


--
-- Name: index_resource_editors_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_editors_on_resource ON public.resource_editors USING btree (resource_type, resource_id);


--
-- Name: index_resource_editors_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_resource_editors_uniqueness ON public.resource_editors USING btree (editor_id, resource_type, resource_id);


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
-- Name: index_resource_painters_on_painter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_painters_on_painter_id ON public.resource_painters USING btree (painter_id);


--
-- Name: index_resource_painters_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_painters_on_resource ON public.resource_painters USING btree (resource_type, resource_id);


--
-- Name: index_resource_painters_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_resource_painters_uniqueness ON public.resource_painters USING btree (painter_id, resource_type, resource_id);


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
-- Name: index_resource_translators_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_translators_on_resource ON public.resource_translators USING btree (resource_type, resource_id);


--
-- Name: index_resource_translators_on_translator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_translators_on_translator_id ON public.resource_translators USING btree (translator_id);


--
-- Name: index_resource_translators_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_resource_translators_uniqueness ON public.resource_translators USING btree (translator_id, resource_type, resource_id);


--
-- Name: index_resource_typers_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_typers_on_resource ON public.resource_typers USING btree (resource_type, resource_id);


--
-- Name: index_resource_typers_on_typer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_typers_on_typer_id ON public.resource_typers USING btree (typer_id);


--
-- Name: index_resource_typers_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_resource_typers_uniqueness ON public.resource_typers USING btree (typer_id, resource_type, resource_id);


--
-- Name: index_resource_writers_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_writers_on_resource ON public.resource_writers USING btree (resource_type, resource_id);


--
-- Name: index_resource_writers_on_writer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_writers_on_writer_id ON public.resource_writers USING btree (writer_id);


--
-- Name: index_resource_writers_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_resource_writers_uniqueness ON public.resource_writers USING btree (writer_id, resource_type, resource_id);


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
-- Name: index_titles_on_original_content_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_titles_on_original_content_language_id ON public.titles USING btree (original_content_language_id);


--
-- Name: index_translators_on_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_translators_on_artist_id ON public.translators USING btree (artist_id);


--
-- Name: index_typers_on_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_typers_on_artist_id ON public.typers USING btree (artist_id);


--
-- Name: index_user_access_rights_on_access_right_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_access_rights_on_access_right_id ON public.user_access_rights USING btree (access_right_id);


--
-- Name: index_user_access_rights_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_access_rights_on_user_id ON public.user_access_rights USING btree (user_id);


--
-- Name: index_user_access_rights_on_user_id_and_access_right_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_user_access_rights_on_user_id_and_access_right_id ON public.user_access_rights USING btree (user_id, access_right_id);


--
-- Name: index_user_content_languages_on_content_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_content_languages_on_content_language_id ON public.user_content_languages USING btree (content_language_id);


--
-- Name: index_user_content_languages_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_content_languages_on_user_id ON public.user_content_languages USING btree (user_id);


--
-- Name: index_user_content_languages_on_user_id_and_content_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_user_content_languages_on_user_id_and_content_language_id ON public.user_content_languages USING btree (user_id, content_language_id);


--
-- Name: index_user_excluded_tags_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_excluded_tags_on_tag_id ON public.user_excluded_tags USING btree (tag_id);


--
-- Name: index_user_excluded_tags_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_excluded_tags_on_user_id ON public.user_excluded_tags USING btree (user_id);


--
-- Name: index_user_excluded_tags_on_user_id_and_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_user_excluded_tags_on_user_id_and_tag_id ON public.user_excluded_tags USING btree (user_id, tag_id);


--
-- Name: index_user_settings_on_interface_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_settings_on_interface_language_id ON public.user_settings USING btree (interface_language_id);


--
-- Name: index_user_settings_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_settings_on_user_id ON public.user_settings USING btree (user_id);


--
-- Name: index_users_on_lower_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_lower_email ON public.users USING btree (lower((email)::text));


--
-- Name: index_users_on_lower_username; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_lower_username ON public.users USING btree (lower((username)::text));


--
-- Name: index_views_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_views_on_created_at ON public.views USING btree (created_at);


--
-- Name: index_views_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_views_on_resource ON public.views USING btree (resource_type, resource_id);


--
-- Name: index_views_on_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_views_on_updated_at ON public.views USING btree (updated_at);


--
-- Name: index_views_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_views_on_user_id ON public.views USING btree (user_id);


--
-- Name: index_views_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_views_uniqueness ON public.views USING btree (user_id, resource_type, resource_id);


--
-- Name: index_volumes_on_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volumes_on_number ON public.volumes USING btree (number);


--
-- Name: index_volumes_on_title_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volumes_on_title_id ON public.volumes USING btree (title_id);


--
-- Name: index_volumes_on_title_id_and_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_volumes_on_title_id_and_number ON public.volumes USING btree (title_id, number);


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
-- Name: typers fk_rails_0517c27e66; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.typers
    ADD CONSTRAINT fk_rails_0517c27e66 FOREIGN KEY (artist_id) REFERENCES public.artists(id);


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
-- Name: user_excluded_tags fk_rails_220c1935e6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_excluded_tags
    ADD CONSTRAINT fk_rails_220c1935e6 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: chapters fk_rails_2587fa0bec; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT fk_rails_2587fa0bec FOREIGN KEY (content_language_id) REFERENCES public.content_languages(id);


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
-- Name: cleaners fk_rails_353656a73a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cleaners
    ADD CONSTRAINT fk_rails_353656a73a FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- Name: resource_themes fk_rails_378cf60425; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_themes
    ADD CONSTRAINT fk_rails_378cf60425 FOREIGN KEY (theme_id) REFERENCES public.themes(id);


--
-- Name: content_language_translations fk_rails_38abb8969d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_language_translations
    ADD CONSTRAINT fk_rails_38abb8969d FOREIGN KEY (resource_id) REFERENCES public.content_languages(id);


--
-- Name: user_access_rights fk_rails_39bc6d0bb4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_access_rights
    ADD CONSTRAINT fk_rails_39bc6d0bb4 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: title_translations fk_rails_3c716d17ad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.title_translations
    ADD CONSTRAINT fk_rails_3c716d17ad FOREIGN KEY (content_language_id) REFERENCES public.content_languages(id);


--
-- Name: painters fk_rails_45262d9d58; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.painters
    ADD CONSTRAINT fk_rails_45262d9d58 FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- Name: interface_language_translations fk_rails_4a3cd8d21f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interface_language_translations
    ADD CONSTRAINT fk_rails_4a3cd8d21f FOREIGN KEY (resource_id) REFERENCES public.interface_languages(id);


--
-- Name: resource_painters fk_rails_583e3f2803; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_painters
    ADD CONSTRAINT fk_rails_583e3f2803 FOREIGN KEY (painter_id) REFERENCES public.painters(id);


--
-- Name: resource_cleaners fk_rails_5a79e6e698; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_cleaners
    ADD CONSTRAINT fk_rails_5a79e6e698 FOREIGN KEY (cleaner_id) REFERENCES public.cleaners(id);


--
-- Name: tag_translations fk_rails_60cffa4907; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag_translations
    ADD CONSTRAINT fk_rails_60cffa4907 FOREIGN KEY (resource_id) REFERENCES public.tags(id);


--
-- Name: views fk_rails_6a13b72c28; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.views
    ADD CONSTRAINT fk_rails_6a13b72c28 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_excluded_tags fk_rails_6b5876baa7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_excluded_tags
    ADD CONSTRAINT fk_rails_6b5876baa7 FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: artists fk_rails_6bcbebdd23; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT fk_rails_6bcbebdd23 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_access_rights fk_rails_6bf3700622; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_access_rights
    ADD CONSTRAINT fk_rails_6bf3700622 FOREIGN KEY (access_right_id) REFERENCES public.access_rights(id);


--
-- Name: user_settings fk_rails_6f5ae6f6a1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT fk_rails_6f5ae6f6a1 FOREIGN KEY (interface_language_id) REFERENCES public.interface_languages(id);


--
-- Name: translators fk_rails_760b33c1d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.translators
    ADD CONSTRAINT fk_rails_760b33c1d3 FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- Name: content_languages fk_rails_83d548600f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_languages
    ADD CONSTRAINT fk_rails_83d548600f FOREIGN KEY (locale_id) REFERENCES public.locales(id);


--
-- Name: pages fk_rails_84a58494eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT fk_rails_84a58494eb FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: resource_formats fk_rails_8ab4963b64; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_formats
    ADD CONSTRAINT fk_rails_8ab4963b64 FOREIGN KEY (format_id) REFERENCES public.formats(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: chapters fk_rails_9eb9ab7f62; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT fk_rails_9eb9ab7f62 FOREIGN KEY (volume_id) REFERENCES public.volumes(id);


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
-- Name: resource_demographics fk_rails_ae8f6868ae; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_demographics
    ADD CONSTRAINT fk_rails_ae8f6868ae FOREIGN KEY (demographic_id) REFERENCES public.demographics(id);


--
-- Name: chapters fk_rails_afb14bec2e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT fk_rails_afb14bec2e FOREIGN KEY (title_id) REFERENCES public.titles(id);


--
-- Name: editors fk_rails_b0f81755d1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.editors
    ADD CONSTRAINT fk_rails_b0f81755d1 FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- Name: bookmarks fk_rails_c1ff6fa4ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT fk_rails_c1ff6fa4ac FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: titles fk_rails_c69f99c5a5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT fk_rails_c69f99c5a5 FOREIGN KEY (original_content_language_id) REFERENCES public.content_languages(id);


--
-- Name: chapters fk_rails_ca7ffbce5f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT fk_rails_ca7ffbce5f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: resource_genres fk_rails_cb4e5b0be0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_genres
    ADD CONSTRAINT fk_rails_cb4e5b0be0 FOREIGN KEY (genre_id) REFERENCES public.genres(id);


--
-- Name: user_content_languages fk_rails_cdf04b6b4c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_content_languages
    ADD CONSTRAINT fk_rails_cdf04b6b4c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: chapters fk_rails_cf8e4fa171; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT fk_rails_cf8e4fa171 FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: user_settings fk_rails_d1371c6356; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT fk_rails_d1371c6356 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: favorites fk_rails_d15744e438; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_d15744e438 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: resource_editors fk_rails_d6d5990eff; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_editors
    ADD CONSTRAINT fk_rails_d6d5990eff FOREIGN KEY (editor_id) REFERENCES public.editors(id);


--
-- Name: resource_marks fk_rails_e4cc00d08a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_marks
    ADD CONSTRAINT fk_rails_e4cc00d08a FOREIGN KEY (mark_id) REFERENCES public.marks(id);


--
-- Name: artist_translations fk_rails_e6907ab812; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_translations
    ADD CONSTRAINT fk_rails_e6907ab812 FOREIGN KEY (content_language_id) REFERENCES public.content_languages(id);


--
-- Name: volumes fk_rails_e944354970; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volumes
    ADD CONSTRAINT fk_rails_e944354970 FOREIGN KEY (title_id) REFERENCES public.titles(id);


--
-- Name: artist_translations fk_rails_ea87634ab3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_translations
    ADD CONSTRAINT fk_rails_ea87634ab3 FOREIGN KEY (resource_id) REFERENCES public.artists(id);


--
-- Name: resource_translators fk_rails_ec43776fa9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_translators
    ADD CONSTRAINT fk_rails_ec43776fa9 FOREIGN KEY (translator_id) REFERENCES public.translators(id);


--
-- Name: resource_typers fk_rails_edaede7625; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_typers
    ADD CONSTRAINT fk_rails_edaede7625 FOREIGN KEY (typer_id) REFERENCES public.typers(id);


--
-- Name: interface_language_translations fk_rails_ee7b55ca7d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interface_language_translations
    ADD CONSTRAINT fk_rails_ee7b55ca7d FOREIGN KEY (content_language_id) REFERENCES public.content_languages(id);


--
-- Name: pages fk_rails_f0e8ea3c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT fk_rails_f0e8ea3c93 FOREIGN KEY (chapter_id) REFERENCES public.chapters(id);


--
-- Name: interface_languages fk_rails_f4d2cc267e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interface_languages
    ADD CONSTRAINT fk_rails_f4d2cc267e FOREIGN KEY (locale_id) REFERENCES public.locales(id);


--
-- Name: resource_writers fk_rails_fba6c65c95; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_writers
    ADD CONSTRAINT fk_rails_fba6c65c95 FOREIGN KEY (writer_id) REFERENCES public.writers(id);


--
-- Name: user_content_languages fk_rails_fdb2557b4f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_content_languages
    ADD CONSTRAINT fk_rails_fdb2557b4f FOREIGN KEY (content_language_id) REFERENCES public.content_languages(id);


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
('20210129194936'),
('20210129204155'),
('20210129213225'),
('20210129214833'),
('20210129214838'),
('20210131163919'),
('20210131163923'),
('20210131173630'),
('20210131174300'),
('20210131174819'),
('20210131175109'),
('20210131175324'),
('20210131175634'),
('20210131175833'),
('20210131181018'),
('20210131181023'),
('20210131181328'),
('20210131181339'),
('20210131183049'),
('20210131183056'),
('20210131215607'),
('20210204191122'),
('20210205200336'),
('20210206144736'),
('20210206144902'),
('20210206151543'),
('20210206155355'),
('20210206161425'),
('20210207135558'),
('20210207142405'),
('20210212212358'),
('20210213095200'),
('20210213103335'),
('20210213103640'),
('20210213152754'),
('20210213152804'),
('20210213152813'),
('20210213152823'),
('20210214043326'),
('20210214044613'),
('20210214191951'),
('20210219203238'),
('20210219204157'),
('20210219204944'),
('20210219205348'),
('20210219210215'),
('20210221182110'),
('20210228133416'),
('20210228133424'),
('20210302181621'),
('20210302181910'),
('20210302181915'),
('20210302191146'),
('20210302191301'),
('20210302191307'),
('20210302191312'),
('20210303115840'),
('20210303194822'),
('20210303195017'),
('20210303195024'),
('20210303195041'),
('20210303195048'),
('20210305215630'),
('20210305220246'),
('20210305222349'),
('20210309040402'),
('20210309132530'),
('20210309141322'),
('20210309142454'),
('20210310063054'),
('20210311131331'),
('20210313233114'),
('20210313233215'),
('20210314005930'),
('20210314005957'),
('20210314010005'),
('20210319213717'),
('20210320055252'),
('20210320055508'),
('20210320055517'),
('20210320063546'),
('20210324141332');


