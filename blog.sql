--
-- PostgreSQL database dump
--

-- Started on 2009-02-25 21:20:13 GMT

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1749 (class 1262 OID 16644)
-- Name: blog; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE blog WITH TEMPLATE = template0 ENCODING = 'UTF8';


\connect blog

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 297 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1469 (class 1259 OID 16645)
-- Dependencies: 6
-- Name: comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comments (
    comment_id integer NOT NULL,
    post_id integer NOT NULL,
    author character(255) NOT NULL,
    body text NOT NULL
);


--
-- TOC entry 1470 (class 1259 OID 16651)
-- Dependencies: 6
-- Name: posts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE posts (
    title character(255) NOT NULL,
    body text NOT NULL,
    _id integer NOT NULL,
    created_at timestamp with time zone
);


--
-- TOC entry 1471 (class 1259 OID 16657)
-- Dependencies: 1469 6
-- Name: comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1752 (class 0 OID 0)
-- Dependencies: 1471
-- Name: comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_comment_id_seq OWNED BY comments.comment_id;


--
-- TOC entry 1472 (class 1259 OID 16659)
-- Dependencies: 1470 6
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1753 (class 0 OID 0)
-- Dependencies: 1472
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE posts_id_seq OWNED BY posts._id;


--
-- TOC entry 1739 (class 2604 OID 16661)
-- Dependencies: 1471 1469
-- Name: comment_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE comments ALTER COLUMN comment_id SET DEFAULT nextval('comments_comment_id_seq'::regclass);


--
-- TOC entry 1740 (class 2604 OID 16662)
-- Dependencies: 1472 1470
-- Name: _id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE posts ALTER COLUMN _id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- TOC entry 1742 (class 2606 OID 16664)
-- Dependencies: 1469 1469
-- Name: comment_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comment_id PRIMARY KEY (comment_id);


--
-- TOC entry 1745 (class 2606 OID 16666)
-- Dependencies: 1470 1470
-- Name: id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT id PRIMARY KEY (_id);


--
-- TOC entry 1743 (class 1259 OID 16667)
-- Dependencies: 1469
-- Name: fki_post_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_post_id ON comments USING btree (post_id);


--
-- TOC entry 1746 (class 2606 OID 16668)
-- Dependencies: 1469 1744 1470
-- Name: post_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT post_id FOREIGN KEY (post_id) REFERENCES posts(_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1751 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2009-02-25 21:20:13 GMT

--
-- PostgreSQL database dump complete
--

