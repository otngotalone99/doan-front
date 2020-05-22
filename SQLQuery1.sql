CREATE DATABASE doan_db2
GO

USE doan_db2
GO

CREATE TABLE NguoiDung  (
	ID int PRIMARY KEY,
	CustomID varchar(30),
	MatKhau varchar(30),
	Ho varchar(15),
	Ten varchar(15),
	TenPhu varchar(50),
	Email varchar(100),
	SDT varchar(15),
	NgaySinh Date,
	Bio varchar(50),
	GioiThieu varchar(500),
	CongTy varchar(150),
	TruongHoc varchar(150),
	DiaChi varchar(150),
	Website varchar(100),
	FacebookID varchar(100),
	TwitterID varchar(100),
	YoutubeID varchar(100),
	InstagramID varchar(100),
	NgayTao Date,
	NgayCapNhat DateTime,
	XacNhan bit,
	TrangThai char(30)
)

CREATE TABLE FanPage (
	ID int PRIMARY KEY,
	CustomID varchar(30),
	MatKhau varchar(30),
	TenTrang varchar(150),
	DanhMucID int,
	Email varchar(100),
	SDT varchar(15),
	MoTa varchar(500),
	DiaChi varchar(150),
	Website varchar(100),
	FacebookID varchar(100),
	TwitterID varchar(100),
	YoutubeID varchar(100),
	InstagramID varchar(100),
	NgayTao Date,
	NgayCapNhat DateTime,
	XacNhan bit,
	TrangThai char(30)
)

CREATE TABLE DanhMucFanPage (
	ID int PRIMARY KEY,
	TenDanhMuc varchar(150)
)

CREATE TABLE BaiViet (
	ID int PRIMARY KEY,
	UserID int,
	NgayDang DateTime,
	NoiDung varchar(500),
	IDAnh int,
	DiaDiem varchar(500),
	QuyenRiengTu int,
	TrangThai char(30),
	CamThay varchar(100),
	CPBL bit,
	LuotXem int
)

CREATE TABLE LuotThich (
	BaiVietID int,
	NguoiThichID int
)

CREATE TABLE BinhLuan (
	BaiVietID int,
	NguoiBLID int,
	NoiDung varchar(500),
	ThoiGian DateTime
)

CREATE TABLE TheoDoi (
	UserID int,
	NguoiTrangTheoDoiID int,
	NgayTheoDoi Date,
	TrangThai varchar(30)
)

CREATE TABLE BaiVietDaLuu (
	UserID int,
	BaiVietID int
)

CREATE TABLE CaiDatCaNhan (
	UserID int PRIMARY KEY,
	AmThanh bit,
	ThongBao bit
)

ALTER TABLE FanPage ADD FOREIGN KEY (DanhMucID) REFERENCES DanhMucFanPage (ID);
ALTER TABLE LuotThich ADD FOREIGN KEY (BaiVietID) REFERENCES BaiViet (ID);
ALTER TABLE LuotThich ADD FOREIGN KEY (NguoiThichID) REFERENCES NguoiDung (ID);
ALTER TABLE BinhLuan ADD FOREIGN KEY (BaiVietID) REFERENCES BaiViet (ID);
ALTER TABLE BinhLuan ADD FOREIGN KEY (NguoiBLID) REFERENCES NguoiDung (ID);
ALTER TABLE TheoDoi ADD FOREIGN KEY (UserID) REFERENCES NguoiDung (ID);
ALTER TABLE TheoDoi ADD FOREIGN KEY (NguoiTrangTheoDoiID) REFERENCES NguoiDung (ID);
ALTER TABLE TheoDoi ADD FOREIGN KEY (NguoiTrangTheoDoiID) REFERENCES Fanpage (ID);
ALTER TABLE CaiDatCaNhan ADD FOREIGN KEY (UserID) REFERENCES NguoiDung (ID);
ALTER TABLE BaiVietDaLuu ADD FOREIGN KEY (UserID) REFERENCES NguoiDung (ID);
ALTER TABLE BaiVietDaLuu ADD FOREIGN KEY (BaiVietID) REFERENCES BaiViet (ID);