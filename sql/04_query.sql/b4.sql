-- Cau 3.1 (0,5 đ) Liệt kê ma_sach, ten_sach, tac_gia, nam_xb của các sách xuất bản từ năm 2018 trở đi; sắp xếp giảm dần theo nam_xb, cùng năm thì theo ten_sach tăng dần.
SELECT ma_sach, ten_sach, tac_gia, nam_xb
FROM sach
WHERE nam_xb >= 2018
ORDER BY nam_xb DESC, ten_sach ASC;

-- Cau 3.2 (0,5 đ) Cho biết tổng số đầu sách (đặt tên cột so_dau_sach), tổng số bản (tong_so_ban) và năm xuất bản mới nhất (nam_xb_moi_nhat) của thư viện.
SELECT 
    COUNT(ma_sach) AS so_dau_sach, 
    SUM(so_ban) AS tong_so_ban, 
    MAX(nam_xb) AS nam_xb_moi_nhat
FROM sach;

-- Cau 3.3 (0,75 đ) Liệt kê ma_sach, ten_sach, ten_tl, so_ban của các sách thuộc thể loại Tin hoc hoặc Kinh te; sắp xếp theo ten_tl, sau đó theo ten_sach.
SELECT s.ma_sach, s.ten_sach, t.ten_tl, s.so_ban
FROM sach s
JOIN the_loai t ON s.ma_tl = t.ma_tl
WHERE t.ten_tl ILIKE '%Tin hoc%' OR t.ten_tl ILIKE '%Kinh te%'
ORDER BY t.ten_tl, s.ten_sach;

-- Cau 3.4 (0,75 đ) Thống kê số lượt mượn (cột so_luot_muon) theo từng thể loại (cột ten_tl); chỉ hiển thị các thể loại có từ 4 lượt mượn trở lên; sắp xếp giảm dần theo số lượt mượn.
SELECT t.ten_tl, COUNT(m.ma_sach) AS so_luot_muon
FROM muon_sach m
JOIN sach s ON m.ma_sach = s.ma_sach
JOIN the_loai t ON s.ma_tl = t.ma_tl
GROUP BY t.ten_tl
HAVING COUNT(m.ma_sach) >= 4
ORDER BY so_luot_muon DESC;

-- Cau 3.5 (1,0 đ) Liệt kê ma_dg, ho_ten, khoa của các độc giả chưa từng mượn sách thuộc thể loại Van hoc (bắt buộc dùng truy vấn con); sắp xếp theo ma_dg.
SELECT ma_dg, ho_ten, khoa
FROM doc_gia
WHERE ma_dg NOT IN (
    SELECT DISTINCT m.ma_dg
    FROM muon_sach m
    JOIN sach s ON m.ma_sach = s.ma_sach
    JOIN the_loai t ON s.ma_tl = t.ma_tl
    WHERE t.ten_tl ILIKE '%Van hoc%'
)
ORDER BY ma_dg;