DROP TABLE IF EXISTS muon_sach CASCADE;
DROP TABLE IF EXISTS sach CASCADE;
DROP TABLE IF EXISTS doc_gia CASCADE;
DROP TABLE IF EXISTS the_loai CASCADE;
-- 1. Bảng the_loai (Thể loại sách)
CREATE TABLE the_loai (
    ma_tl VARCHAR(5) PRIMARY KEY,
    ten_tl VARCHAR(50) NOT NULL UNIQUE
);

-- 2. Bảng doc_gia (Độc giả)
CREATE TABLE doc_gia (
    ma_dg VARCHAR(10) PRIMARY KEY,
    ho_ten VARCHAR(80) NOT NULL,
    khoa VARCHAR(40) NULL,
    ngay_dang_ky DATE NOT NULL DEFAULT CURRENT_DATE
);

-- 3. Bảng sach (Sách)
CREATE TABLE sach (
    ma_sach VARCHAR(10) PRIMARY KEY,
    ten_sach VARCHAR(120) NOT NULL,
    tac_gia VARCHAR(80) NULL,
    nam_xb INTEGER CHECK (nam_xb >= 1900),
    so_ban INTEGER NOT NULL DEFAULT 1 CHECK (so_ban >= 0),
    ma_tl VARCHAR(5) NOT NULL,
    CONSTRAINT fk_sach_theloai FOREIGN KEY (ma_tl) REFERENCES the_loai(ma_tl)
);

-- 4. Bảng muon_sach (Lượt mượn sách)
CREATE TABLE muon_sach (
    ma_dg VARCHAR(10) NOT NULL,
    ma_sach VARCHAR(10) NOT NULL,
    ngay_muon DATE NOT NULL,
    ngay_tra DATE NULL,
    CONSTRAINT pk_muon_sach PRIMARY KEY (ma_dg, ma_sach, ngay_muon),
    CONSTRAINT fk_muon_docgia FOREIGN KEY (ma_dg) REFERENCES doc_gia(ma_dg),
    CONSTRAINT fk_muon_sach FOREIGN KEY (ma_sach) REFERENCES sach(ma_sach),
    CONSTRAINT ck_ngay_tra CHECK (ngay_tra IS NULL OR ngay_tra >= ngay_muon)
);