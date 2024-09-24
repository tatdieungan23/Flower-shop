-- Lệnh truy vấn dữ liệu: SQL : 
-- a. Truy vấn 1 bảng.
-- a.1: Cho biết họ và tên của từng nhân viên thông tin hiển thị gồm có: họ và tên được xếp theo tên tăng dần, mã số nhân viên, số điện thoại, tuổi
SELECT manv, CONCAT((rtrim(honv)),' ',RTRIM(tennv)) as 'họ và tên', sđt, (year(now())-year(ngsinh)) as 'tuổi'
FROM nhanvien
ORDER BY hovaten;

-- a.2: Cho biết những nhân viên nào do ai quản lý
SELECT  CONCAT((rtrim(a.honv)),' ',RTRIM(a.tennv)) as 'họ và tên', CONCAT((rtrim(b.honv)),' ',RTRIM(b.tennv)) as 'nhân viên quản lý'
FROM nhanvien a JOIN nhanvien b on b.manvql=a.manv;

-- b. Truy vấn nhiều bảng (Phép kết)
-- b.1: Cho biết những loại hoa được cung cấp bởi những nhà cung cấp nào
SELECT nhacungcap.tenNCC, hoa.tenhoa, theloai.chatlieu
FROM nhacungcap, hoa_NCC, hoa, theloai
WHERE nhacungcap.mancc = hoa_NCC.mancc AND hoa.mahoa=hoa_NCC.mahoa AND theloai.matheloai=hoa.maTL
ORDER BY nhacungcap.tenNCC;

-- b.2: Cho biết những đơn hàng được bán, mua bởi nhân viên nào phụ trách. 
SELECT hoadon.mahoadon, CONCAT((rtrim(nhanvien.honv)),' ',RTRIM(nhanvien.tennv)) as 'họ và tên'
FROM hoadon, nhanvien
WHERE hoadon.manv=nhanvien.manv;

-- c. Truy vấn có điều kiện (and, or, like, between,….)
-- c.1: Chi biết những loại hoa có số lượng trên 50 hoa và chưa từng được bán.
SELECT hoa.mahoa
FROM hoa LEFT JOIN chitietdonhang ON hoa.mahoa = chitietdonhang.mahoa 
WHERE chitietdonhang.mahoa IS NULL AND hoa.soluong > 50;

-- c.2: Cho biết tên loại hoa mà từng khách hàng đã mua.
SELECT hoadon.makh, c.mahoa
FROM hoadon JOIN chitietdonhang c JOIN hoa ON c.mahoa=hoa.mahoa ON c.mahoadon = hoadon.mahoadon;

-- c.3: cho biết những nhà cung cấp có địa chỉ tại 'HCM' và email không có đuôi '@gmail.com'. 
select ncc.maNCC, ncc.tenNCC, h.mahoa, h.tenhoa
from (nhacungcap ncc join hoa_NCC hc on ncc.maNCC=hc.maNCC) join hoa h on hc.mahoa=h.mahoa
where ncc.diachi like '%HCM' and ncc.email not like '%@gmail.com';

-- d. Truy vấn tính toán
-- d.1: Tính tổng thành tiền hóa đơn bán chưa trừ đi giảm giá mỗi hóa đơn
select c.mahoadon, sum( (c.soluong*c.giatien) )as 'tổng tiền'
from chitietdonhang c, hoadon
WHERE hoadon.theloai='B'
group by c.mahoadon;

-- d.2: Hoa hồng mỗi đơn hàng cho nhân viên là 10%. Tính số tiền hoa hồng mỗi nhân viên nhận được khi bán hàng
SELECT CONCAT((rtrim(nhanvien.honv)),' ',RTRIM(nhanvien.tennv)) as 'Nhân viên' , ((c.soluong*c.giatien-c.soluong*c.giatien*c.giamgia)*0.1) as 'hoa hồng'
FROM chitietdonhang c JOIN nhanvien JOIN hoadon ON hoadon.manv = nhanvien.manv ON c.mahoadon= hoadon.mahoadon
WHERE hoadon.theloai = 'B';

-- e. Truy vấn có gom nhóm (group by)
-- e.1: Cho biết những nhà cung cấp cung cấp bao nhiêu loại hoa
SELECT ncc.maNCC, count(mahoa) as 'Số thể loại hoa cung cấp'
FROM hoa_NCC h JOIN nhacungcap ncc ON h.maNCC = ncc.maNCC
GROUP BY ncc.maNCC;

-- e.2: Cho biết tên những nv quản lý và số lượng người được quản lý bởi nhân viên quản lý đó.
SELECT CONCAT((rtrim(b.honv)),' ',RTRIM(b.tennv)) as 'Quản lý', count(a.manv) as 'Số nhân viên'
FROM nhanvien a JOIN nhanvien b ON a.manvql = b.manv
GROUP BY b.manv;

-- e.3:Tính tổng chi (M) và tổng thu (B)
SELECT SUM(CASE WHEN theloai = 'B' THEN total_amount ELSE 0 END) AS 'Bán', SUM(CASE WHEN theloai = 'M' THEN total_amount ELSE 0 END) AS 'Mua'
FROM (
SELECT sum((c.soluong*c.giatien)-(c.soluong*c.giatien)*c.giamgia) AS total_amount, hoadon.theloai
FROM chitietdonhang c JOIN hoadon ON hoadon.mahoadon = c.mahoadon
GROUP BY hoadon.theloai
) AS subquery;

-- f. Truy vấn gom nhóm có điều kiện (having)
-- f.1: Xuất ra tên nhân viên mà có số lượng hóa đơn bán >1
SELECT CONCAT((rtrim(nhanvien.honv)),' ',RTRIM(nhanvien.tennv)) as 'Nhân viên', COUNT(hoadon.mahoadon) as 'Số lượng đơn hàng đã bán'
FROM nhanvien JOIN hoadon ON hoadon.manv = nhanvien.manv
WHERE hoadon.theloai='B'
GROUP BY nhanvien.manv
HAVING COUNT(hoadon.mahoadon) > 1;

-- f.4: Những hóa đơn có nhiều hơn 1 loại hoa
SELECT mahoadon, count(mahoa) as 'Số loại hoa trong hóa đơn'
FROM chitietdonhang 
GROUP BY mahoadon
HAVING count(mahoa) >1;

-- g. Truy vấn con
-- g.1: Cho biết những nv chưa bán được đơn hàng nào và có tuổi lớn hơn 21
SELECT CONCAT((rtrim(nhanvien.honv)),' ',RTRIM(nhanvien.tennv))
FROM nhanvien 
WHERE manv IN (
SELECT DISTINCT manv 
FROM hoadon 
WHERE hoadon.theloai = 'B') AND (year(now())-year(ngsinh) > 21);

-- h. Truy vấn chéo
-- h.1: Tổng số đơn đã bán của mỗi nhân viên
SELECT SUM(CASE WHEN manv = '00001' THEN total ELSE 0 END) AS '00001', 
SUM(CASE WHEN manv = '00002' THEN total ELSE 0 END) AS '00002',
SUM(CASE WHEN manv = '00003' THEN total ELSE 0 END) AS '00003',
SUM(CASE WHEN manv = '00004' THEN total ELSE 0 END) AS '00004',
SUM(CASE WHEN manv = '00005' THEN total ELSE 0 END) AS '00005',
SUM(CASE WHEN manv = '00006' THEN total ELSE 0 END) AS '00006'
FROM ( 
SELECT manv, sum(mahoadon) as total
FROM hoadon 
WHERE theloai = 'B'
GROUP BY manv) AS derived_table;
