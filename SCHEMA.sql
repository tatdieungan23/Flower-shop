-- Tạo bảng thể loại
CREATE TABLE theloai
(
 matheloai char(10) not null primary key,
 chatlieu char(100)
);

-- Tạo bảng nhà cung cấp
CREATE TABLE nhacungcap
(
maNCC char(10) not null primary key,
tenNCC char(100),
sđt char(10),
email char(200),
diachi char(200)
);

-- Tạo bảng hoa
CREATE TABLE hoa
(
mahoa char(10) not null primary key,
tenhoa char(100),
maNCC char(10),
soluong int default(0),
maTL char(10) not null,
foreign key (maTL) references theloai(matheloai)
);

-- xóa cột
alter table hoa 
drop column maNCC;

-- Tạo bảng hoa.ncc
CREATE TABLE hoa_NCC
(
mahoa char(10) not null,
maNCC char(10) not null,
constraint PK_HOA_NCC primary key (mahoa, maNCC),
foreign key (mahoa) references hoa(mahoa),
foreign key (maNCC) references nhacungcap(maNCC)
);

-- Tạo bảng khachhang
CREATE TABLE khachhang
(
maKH char(10) not null primary key,
hoKH char(100),
tenKH char(100),
sdt char(10),
email char(10), 
diachi char(100),
madonhang char(10)
);

-- Xóa cột
alter table khachhang
drop column madonhang;

-- Thay đổi kiểu dữ liệu
alter table hoa
MODIFY column tenhoa char(200);

alter table nhacungcap
MODIFY column diachi char(250);

alter table khachhang
MODIFY column email char(200);

-- Tạo bảng nhanvien
CREATE TABLE nhanvien
(
manv char(10) not null primary key,
honv char(50),
tennv char(50),
 gioitinh char(5) check(gioitinh in('Nam','Nữ')),
ngsinh date,
sđt char(10),
manvql char(10),
email char(200),
dchi char(200)
);

-- Tạo khóa ngoại
alter table nhanvien
add constraint PK_NHANVIEN_NHANVIEN foreign key (manvql) references nhanvien(manv);

-- Tạo bảng hoadon
CREATE TABLE hoadon
(
mahoadon char(10) not null primary key,
makh char(10),
ngay date,
manv char(10),
theloai char(3) not null
);

-- tạo bảng chitietdonhang
CREATE TABLE chitietdonhang
(
mahoadon char(10) not null,
mahoa char(10) not null,
trangthaidonhang int,
soluong int,
giatien float,
foreign key (mahoa) references hoa(mahoa)
);

-- Thêm ràng buộc
alter table chitietdonhang 
add constraint FK_chitietdonhang_hdmua foreign key (mahoadon) references hoadon(mahoadon);

alter table hoadon
add constraint FK_HOADON_NHANVIEN foreign key (manv) references nhanvien (manv);

alter table hoadon
add constraint FK_HOADON_KHACHHANG foreign key (makh) references khachhang(makh);

-- thêm cột
alter table chitietdonhang
add giamgia float;