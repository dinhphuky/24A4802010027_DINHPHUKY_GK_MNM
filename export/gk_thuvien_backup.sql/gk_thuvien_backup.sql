--
-- PostgreSQL database dump
--

\restrict YOPP2iEH9uwrRNeFR81g7oGotXb3fTgsMghUjbDM5Eg9U0oHzI4Z1rD0iRDhFUD

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-10-14 20:58:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 17087)
-- Name: doc_gia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doc_gia (
    ma_dg character varying(10) NOT NULL,
    ho_ten character varying(80) NOT NULL,
    khoa character varying(40),
    ngay_dang_ky date DEFAULT CURRENT_DATE NOT NULL,
    sdt character varying(15)
);


ALTER TABLE public.doc_gia OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17113)
-- Name: muon_sach; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.muon_sach (
    ma_dg character varying(10) NOT NULL,
    ma_sach character varying(10) NOT NULL,
    ngay_muon date NOT NULL,
    ngay_tra date,
    CONSTRAINT ck_ngay_tra CHECK (((ngay_tra IS NULL) OR (ngay_tra >= ngay_muon)))
);


ALTER TABLE public.muon_sach OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17096)
-- Name: sach; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sach (
    ma_sach character varying(10) NOT NULL,
    ten_sach character varying(120) NOT NULL,
    tac_gia character varying(80),
    nam_xb integer,
    so_ban integer DEFAULT 1 NOT NULL,
    ma_tl character varying(5) NOT NULL,
    CONSTRAINT sach_nam_xb_check CHECK ((nam_xb >= 1900)),
    CONSTRAINT sach_so_ban_check CHECK ((so_ban >= 0))
);


ALTER TABLE public.sach OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17078)
-- Name: the_loai; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.the_loai (
    ma_tl character varying(5) NOT NULL,
    ten_tl character varying(50) NOT NULL
);


ALTER TABLE public.the_loai OWNER TO postgres;

--
-- TOC entry 4932 (class 0 OID 17087)
-- Dependencies: 220
-- Data for Name: doc_gia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doc_gia (ma_dg, ho_ten, khoa, ngay_dang_ky, sdt) FROM stdin;
DG02	Tran Quang Huy	CNTT	2025-09-05	\N
DG03	Le Thu Trang	Kinh te	2025-09-10	\N
DG04	Pham Duc Long	Hoa	2025-10-01	\N
DG05	Hoang Ngoc Mai	Kinh te	2026-02-15	\N
DG06	Vu Hai Dang	CNTT	2026-02-20	\N
DG07	Dang Thi Huong	Moi truong	2026-03-01	\N
DG08	Bui Van Khoa	Hoa	2026-03-02	\N
DG09	Ngo Van Phuc	Kinh te	2026-10-05	\N
DG01	Nguyen Minh Anh	CNTT	2025-09-05	0988000001
\.


--
-- TOC entry 4934 (class 0 OID 17113)
-- Dependencies: 222
-- Data for Name: muon_sach; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.muon_sach (ma_dg, ma_sach, ngay_muon, ngay_tra) FROM stdin;
DG01	S001	2026-09-01	2026-09-15
DG01	S002	2026-09-01	2026-09-15
DG01	S004	2026-09-20	2026-10-02
DG02	S001	2026-09-03	2026-09-17
DG02	S003	2026-09-10	2026-09-24
DG03	S006	2026-09-05	2026-09-19
DG03	S007	2026-09-05	\N
DG03	S004	2026-09-28	\N
DG04	S008	2026-09-12	2026-09-26
DG05	S009	2026-09-15	2026-09-29
DG05	S006	2026-10-01	\N
DG06	S002	2026-09-18	2026-10-01
DG06	S005	2026-10-02	\N
DG07	S009	2026-10-03	\N
DG09	S006	2026-10-05	\N
DG09	S009	2026-10-07	\N
\.


--
-- TOC entry 4933 (class 0 OID 17096)
-- Dependencies: 221
-- Data for Name: sach; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sach (ma_sach, ten_sach, tac_gia, nam_xb, so_ban, ma_tl) FROM stdin;
S004	Truyen Kieu	Nguyen Du	2015	6	VH
S005	So do	Vu Trong Phung	2018	4	VH
S006	Nguyen ly kinh te vi mo	Pham Quoc Bao	2020	5	KT
S007	Quan tri hoc	Dinh Thi Hoa	2016	3	KT
S008	Viet Nam su luoc	Tran Trong Kim	2014	2	LS
S009	Tieng Anh giao tiep	Hoang Anh Tuan	2022	6	NN
S001	Lap trinh Python co ban	Nguyen Van Hung	2021	9	TH
S002	Co so du lieu	Tran Minh Quang	2019	8	TH
S003	Mang may tinh	Le Thanh Son	2017	7	TH
\.


--
-- TOC entry 4931 (class 0 OID 17078)
-- Dependencies: 219
-- Data for Name: the_loai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.the_loai (ma_tl, ten_tl) FROM stdin;
TH	Tin hoc
VH	Van hoc
KT	Kinh te
LS	Lich su
NN	Ngoai ngu
\.


--
-- TOC entry 4776 (class 2606 OID 17095)
-- Name: doc_gia doc_gia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doc_gia
    ADD CONSTRAINT doc_gia_pkey PRIMARY KEY (ma_dg);


--
-- TOC entry 4780 (class 2606 OID 17121)
-- Name: muon_sach pk_muon_sach; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.muon_sach
    ADD CONSTRAINT pk_muon_sach PRIMARY KEY (ma_dg, ma_sach, ngay_muon);


--
-- TOC entry 4778 (class 2606 OID 17107)
-- Name: sach sach_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sach
    ADD CONSTRAINT sach_pkey PRIMARY KEY (ma_sach);


--
-- TOC entry 4772 (class 2606 OID 17084)
-- Name: the_loai the_loai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.the_loai
    ADD CONSTRAINT the_loai_pkey PRIMARY KEY (ma_tl);


--
-- TOC entry 4774 (class 2606 OID 17086)
-- Name: the_loai the_loai_ten_tl_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.the_loai
    ADD CONSTRAINT the_loai_ten_tl_key UNIQUE (ten_tl);


--
-- TOC entry 4782 (class 2606 OID 17122)
-- Name: muon_sach fk_muon_docgia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.muon_sach
    ADD CONSTRAINT fk_muon_docgia FOREIGN KEY (ma_dg) REFERENCES public.doc_gia(ma_dg);


--
-- TOC entry 4783 (class 2606 OID 17127)
-- Name: muon_sach fk_muon_sach; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.muon_sach
    ADD CONSTRAINT fk_muon_sach FOREIGN KEY (ma_sach) REFERENCES public.sach(ma_sach);


--
-- TOC entry 4781 (class 2606 OID 17108)
-- Name: sach fk_sach_theloai; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sach
    ADD CONSTRAINT fk_sach_theloai FOREIGN KEY (ma_tl) REFERENCES public.the_loai(ma_tl);


-- Completed on 2026-10-14 20:58:24

--
-- PostgreSQL database dump complete
--

\unrestrict YOPP2iEH9uwrRNeFR81g7oGotXb3fTgsMghUjbDM5Eg9U0oHzI4Z1rD0iRDhFUD

