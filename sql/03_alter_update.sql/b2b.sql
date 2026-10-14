-- 2a (0,25 đ) Thêm cột sdt VARCHAR(15) vào bảng doc_gia; cập nhật sdt của độc giả DG01 thành 0988000001
--ALTER TABLE doc_gia ADD COLUMN sdt VARCHAR(15);
UPDATE doc_gia SET sdt = '0988000001' WHERE ma_dg = 'DG01';

-- 2b (0,25 đ) Bổ sung thêm 2 bản (tăng so_ban lên 2) cho mỗi đầu sách thuộc thể loại Tin học (ma_tl = 'TH')
UPDATE sach SET so_ban = so_ban + 2 WHERE ma_tl = 'TH';

-- 2c (0,25 đ) Thêm độc giả mới: DG09, Ngo Van Phuc, khoa Kinh te, ngày đăng ký 2026-10-05; thêm 2 lượt mượn của DG09: sách S006 ngày mượn 2026-10-05 và sách S009 ngày mượn 2026-10-07 (cả hai chưa trả)
--INSERT INTO doc_gia (ma_dg, ho_ten, khoa, ngay_dang_ky) 
VALUES ('DG09', 'Ngo Van Phuc', 'Kinh te', '2026-10-05');

--INSERT INTO muon_sach (ma_dg, ma_sach, ngay_muon, ngay_tra) 
VALUES 
('DG09', 'S006', '2026-10-05', NULL),
('DG09', 'S009', '2026-10-07', NULL);

-- 2d (0,25 đ) Xóa sách có mã S010
DELETE FROM sach WHERE ma_sach = 'S010';