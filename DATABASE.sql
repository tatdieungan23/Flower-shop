-- thêm dữ liệu bảng theloai
insert into theloai values ('HT01', 'Hoa tươi');
insert into theloai values ('HK02', 'Hoa khô');
insert into theloai values ('HS03','Hoa sáp');

-- Xem lại dữ liệu
select * from theloai;

-- Thêm dữ liệu bảng nhacungcap
insert into nhacungcap values('001', 'SaiGon Rose', '0223458669', 'sr@gmail.com','412 Lê Hồng Phong, HCM');
insert into nhacungcap values('002','DaLat Hasfarm', '0456788931', 'sales@DH.com', '225 Phạm Thế Hiển, HCM');
insert into nhacungcap values('003','Flower Box','036228554','fb@gmail.com','14 Đống Đa, Hà Nội');
insert into nhacungcap values('004','Degree Flowers','0355676592','order@DF.com','26 Hoàng Sa, Đà Nẵng');
insert into nhacungcap values('005', 'EVE Flowers','0188965547','ef@gmail.com','12 Hai Bà Trứng, Hà Nội');

-- Xem lại dữ liệu
select * from nhacungcap;

-- Thêm dữ liệu vào bảng hoa
insert into Hoa values('HHD01','Hoa hồng đỏ','100','HT01');
insert into Hoa values('HHD02','Hoa hồng đỏ','100','HK02');
insert into Hoa values('HHD','Hoa hồng đỏ','100','HS03');
insert into Hoa values('HL','Hoa Ly','20','HT01');
insert into Hoa values ('HPL','Hoa phong lan','30','HT01');
insert into Hoa values('HCTC','Hoa cẩm tú cầu','50','HT01');
insert into Hoa values('HCC','Hoa cẩm chướng','30','HT01');
insert into Hoa values('HCMD1','Hoa cúc mẫu đơn','50','HT01');
insert into Hoa values('HCMD2','Hoa cúc mẫu đơn','50','HK02');
insert into Hoa values('HLO','Hoa lay ơn','30','HT01');
insert into Hoa values('HCHM1','Hoa cúc họa mi', '50','HT01');
insert into Hoa values('HCHM2','Hoa cúc họa mi', '50','HK02');
insert into Hoa values('HT1','Hoa Tulip','20','HT01');
insert into Hoa values('HT2','Hoa Tulip','20','HS03');
insert into Hoa values('HHX','Hoa hồng xanh','30','HT01');

-- update dữ liệu
update hoa
set mahoa='HHD03'
where mahoa='HHD';

-- Xem lại dữ liệu
select* from Hoa;

-- nhập dữ liệu bảng hoa-ncc
insert into hoa_NCC values('HHD01','001');
insert into hoa_NCC values('HHD02','001');
insert into hoa_NCC values ('HHD03','001');
insert into hoa_NCC values('HL','002');
insert into hoa_NCC values('HCTC','002');
insert into hoa_NCC values('HPL','002');
insert into hoa_NCC values('HCC','003');
insert into hoa_NCC values('HCMD1','003');
insert into hoa_NCC values('HCMD2','003');
insert into hoa_NCC values('HLO','004');
insert into hoa_NCC values('HCHM1','004');
insert into hoa_NCC values('HCHM2','004');
insert into hoa_NCC values('HT1','004');
insert into hoa_NCC values('HT2','004');
insert into hoa_NCC values('HHX','005');

-- Xem lại dữ liệu
select * from hoa_NCC;

-- Nhập dữ liệu bảng nhân viên
insert into nhanvien values ('00001', 'Nguyễn Thị Tường', 'Vi', 'Nữ', '1999-10-11', '0446588923', NULL,'Vi@gmail.com',  '331 Trần Hưng Đạo');
insert into nhanvien values ('00002', 'Tất Diệu', 'Ngân', 'Nữ', '2002-05-02', '0662578937',null, 'Ngan@gmail.com', '187A Lê Văn Lương');
insert into nhanvien values ('00003', 'Trương Vũ Phương', 'Quỳnh', 'Nữ', '2001-06-02', '0123775869','00002', 'Quynh@gmail.com', '886 Tạ Quang Bửu');
insert into nhanvien values ('00004', 'Nguyễn Anh', 'Tuấn', 'Nam', '2003-05-06', '0548793211', '00001', 'Tuan@gmail.com', '158 Đồng Khởi');
insert into nhanvien values ('00005', 'Đỗ Chí', 'Quang', 'Nam', '1999-04-07', '0908420033', '00001', 'Quang@gmail.com', '193 Nguyễn Trãi');
insert into nhanvien values ('00006', 'Đỗ Hà', 'Linh', 'Nữ', '2004-08-09', '0908427733', '00001', 'linh@gmail.com', '193 Nguyễn Huệ');

-- Xem lại bảng nhanvien
select * from nhanvien;

-- Nhập dữ liệu table khachhang
insert into khachhang values ('001', 'Nguyễn Văn', 'An', '0115968745', 'an@gmail.com','32 Nguyễn Trãi, HCM');
insert into khachhang values ('002', 'Phạm', 'Dung', '0556987455', 'dung@gmail.com','46/13 Nguyễn Văn Linh, HCM');
insert into khachhang values ('003', 'Võ Lan', 'Vy', '0336547889', 'vy@gmail.com','9 Tạ Quang Bửu, HCM');
insert into khachhang values ('004', 'Nguyễn Hoàng', 'Hà', '0588697422', 'ha@gmail.com','15 Hai Bà Trưng, HCM');
insert into khachhang values ('005', 'Nguyễn Anh', 'Thư', '0456987332', 'thu@gmail.com','6 Nam Kỳ KHởi Nghĩa, HCM');
insert into khachhang values ('006', 'Trần Kim', 'Mỹ', '0889965423', 'my@gmail.com','12 Thuận Kiều, HCM');
insert into khachhang values ('007', 'Hà Anh','Tuấn', '077300988','tuan@cs.vn','677 Phạnm Thế Hiển,HCM');
insert into khachhang values ('008', 'Nguyễn Thiện','Anh', '0708492613',null,'406 Nguyễn Trãi,HCM');
insert into khachhang values ('009', 'Lê Thu','Anh', '0746276955','anhle@st.ueh.edu.vn','47 Nguyễn Kiệm,HCM');
insert into khachhang values ('010', 'Việt Phương','Hà', '0775463255','haviet@gmail.com','26 Lâm Văn Bền,HCM');
insert into khachhang values ('011', 'Ngô Bảo','Châu', '0795762144','chaungo@cfyc.vn','17/47 Lê Lợi,HCM');
insert into khachhang values ('012', 'Huỳnh Văn','Huy', '0369475681','huyhuynh@gmail.com','12 Nguyễn Văn Linh,HCM');
insert into khachhang values ('013', 'Ngô Hà','Vy', '0775889647',null,'60 Lê Lai,HCM');
insert into khachhang values ('014', 'Huỳnh Thị','Vân', '0747586625','Van@gmail.com','122 Võ Văn Kiệt,HCM');
insert into khachhang values ('015', 'Nguyễn Bá','Lộc', '0758879663','Loc@ds.vn','76 Lê Thiện Trị,HCM');
insert into khachhang values ('016', 'Từ Chí','Tài', '0754478996',null,'124 Phạm Hùng,HCM');
insert into khachhang values ('017', 'Ngô','Bảo', '0721147889','Bao@gmail.com','256 Phạm Thế Hiển,HCM');
insert into khachhang values ('018', 'Nguyễn Mỹ','Hạnh', '0727889661','Hanh@edu.com','56 Tạ Quang Bửu,HCM');
insert into khachhang values ('019', 'Từ Vân','Hạ', '0787759962',null,'677 Cách mạng tháng tám,HCM');

-- Xem lại bảng khachhang
select * from khachhang;

-- Thêm dữ liệu table hoadon
insert into hoadon values ('0001', '001', '2024-10-30', '00001','B');
insert into hoadon values ('0002', '004', '2024-11-29','00002','B');
insert into hoadon values ('0003', '002', '2024-07-08', '00001','B');
insert into hoadon values ('0004', '003', '2024-04-05', '00003','B');
insert into hoadon values ('0005', '004', '2024-06-07', '00004','B');
insert into hoadon values ('0006', '001', '2024-08-30','00005','M');
insert into hoadon values ('0007', '005', '2024-07-09', '00004','B');
insert into hoadon values ('0008', '004', '2024-09-08', '00002','B');
insert into hoadon values ('0009', '019', '2024-11-11', '00006','B');
insert into hoadon values ('0010', '014', '2024-12-11', '00003','B');
insert into hoadon values ('0011', '009', '2024-10-12', '00001','B');
insert into hoadon values ('0012', '010', '2024-11-12', '00004','B');
insert into hoadon values ('0013', '007', '2024-10-10', '00004','B');
insert into hoadon values ('0014', '011', '2024-10-30', '00003','B');
insert into hoadon values ('0015', '013', '2024-07-08', '00005','M');
insert into hoadon values ('0016', '015', '2024-09-09', '00004','B');
insert into hoadon values ('0017', '006', '2024-09-05', '00003','B');

-- update dữ liệu
update hoadon
set theloai='M'
Where mahoadon='0002';

update hoadon
set makh= null
Where mahoadon='0002' or mahoadon='0006' or  mahoadon='0016';

-- Xem lại bảng hoadon
select * from hoadon;

-- Thêm dữ liệu table chitiethoadon
insert into chitietdonhang values ('0001', 'HCC', '1', '10', '75', '0.2');
insert into chitietdonhang values ('0001', 'HHD01', '1', '15', '80000', '0.2');
insert into chitietdonhang values ('0002', 'HT2', '2', '20', '20000', '0.0');
insert into chitietdonhang values ('0003', 'HHX', '1', '10', '150000', '0.3');
insert into chitietdonhang values ('0003', 'HPL', '1', '6', '95000', '0.3');
insert into chitietdonhang values ('0004', 'HLO', '3', '8', '60000', '0.2');
insert into chitietdonhang values ('0005', 'HL', '2', '20', '20000', '0.0');
insert into chitietdonhang values ('0006', 'HHD03', '1', '15', '100000', '0.3');
insert into chitietdonhang values ('0007', 'HCC', '1', '20', '60000', '0.2');
insert into chitietdonhang values ('0008', 'HCHM2', '2', '15', '10000', '0.1');
insert into chitietdonhang values ('0009', 'HCMD1', '2', '25','15000', '0.0');
insert into chitietdonhang values ('0009', 'HCMD2', '3', '24','17000', '0.0');
insert into chitietdonhang values ('0010', 'HHX', '3', '31', '15000', '0.2');
insert into chitietdonhang values ('0011', 'HPL', '1', '21', '25000', '0.1');
insert into chitietdonhang values ('0011', 'HHD01', '1', '30', '20000', '0.1');
insert into chitietdonhang values ('0012', 'HLO', '3', '25', '18000', '0.1');
insert into chitietdonhang values ('0013', 'HL', '2', '10', '20000', '0.2');
insert into chitietdonhang values ('0014', 'HCC', '1', '15', '15000', '0.2');
insert into chitietdonhang values ('0015', 'HHX', '2', '17', '15000', '0.1');
insert into chitietdonhang values ('0016', 'HT2', '3', '24', '17000', '0.1');
insert into chitietdonhang values ('0017', 'HHD03', '1', '39', '10000', '0.0');

-- update thay đổi giá
UPDATE chitietdonhang
SET giatien='75000'
WHERE mahoadon='0001';
