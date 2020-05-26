CREATE DATABASE doan_db2
GO

USE doan_db2
GO

CREATE TABLE NguoiDung  (
	ID int PRIMARY KEY,
	CustomID varchar(30),
	MatKhau varchar(30),
	HoTen nvarchar(100),
	Email varchar(100),
	SDT varchar(15),
	NgaySinh Date,
	GioiTinh nvarchar(5),
	Bio nvarchar(50),
	CongTy nvarchar(150),
	TruongHoc nvarchar(150),
	DiaChi nvarchar(150),
	Website varchar(100),
	FacebookID varchar(100),
	TwitterID varchar(100),
	YoutubeID varchar(100),
	InstagramID varchar(100),
	ThoiGianOnline int,
	NgayTao Date,
	NgayCapNhat DateTime,
	XacNhan bit,
	TrangThai char(30)
)

CREATE TABLE DanhHieu (
	UserID int,
	DanhHieu varchar(200),
	TrangThai int
)

CREATE TABLE BaiViet (
	ID int PRIMARY KEY,
	UserID int,
	NgayDang DateTime,
	NoiDung nvarchar(500),
	IDAnh int,
	DiaDiem varchar(500),
	QuyenRiengTu int,
	TrangThai char(30),
	CPBL bit,
	LuotXem int
)

CREATE TABLE Hashtag (
	BaiVietID int,
	NoiDungHashtag varchar(50)
)

CREATE TABLE TinNhan (
	NguoiGuiID int,
	NguoiNhanID int,
	NoiDung nvarchar(150),
	ThoiGian datetime,
	TrangThai int
)

CREATE TABLE ThongBao (
	NguoiDungID int,
	Loai int,
	NguoiTuongTacID int,
	ThoiGian datetime,
	TrangThai int,
)

CREATE TABLE LuotThich (
	BaiVietID int,
	NguoiThichID int
)

CREATE TABLE BinhLuan (
	ID int PRIMARY KEY,
	BaiVietID int,
	NguoiBLID int,
	BLChaID int,
	NoiDung nvarchar(500),
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
	TinNhan bit,
	ThongBao bit
)

ALTER TABLE DanhHieu ADD FOREIGN KEY (UserID) REFERENCES NguoiDung (ID);
ALTER TABLE Hashtag ADD FOREIGN KEY (BaiVietID) REFERENCES BaiViet (ID);
ALTER TABLE LuotThich ADD FOREIGN KEY (BaiVietID) REFERENCES BaiViet (ID);
ALTER TABLE LuotThich ADD FOREIGN KEY (NguoiThichID) REFERENCES NguoiDung (ID);
ALTER TABLE BinhLuan ADD FOREIGN KEY (BaiVietID) REFERENCES BaiViet (ID);
ALTER TABLE BinhLuan ADD FOREIGN KEY (NguoiBLID) REFERENCES NguoiDung (ID);
ALTER TABLE BinhLuan ADD FOREIGN KEY (BLChaID) REFERENCES BinhLuan (ID);
ALTER TABLE TheoDoi ADD FOREIGN KEY (UserID) REFERENCES NguoiDung (ID);
ALTER TABLE TheoDoi ADD FOREIGN KEY (NguoiTrangTheoDoiID) REFERENCES NguoiDung (ID);
ALTER TABLE CaiDatCaNhan ADD FOREIGN KEY (UserID) REFERENCES NguoiDung (ID);
ALTER TABLE BaiVietDaLuu ADD FOREIGN KEY (UserID) REFERENCES NguoiDung (ID);
ALTER TABLE BaiVietDaLuu ADD FOREIGN KEY (BaiVietID) REFERENCES BaiViet (ID);
ALTER TABLE TinNhan ADD FOREIGN KEY (NguoiGuiID) REFERENCES NguoiDung (ID);
ALTER TABLE TinNhan ADD FOREIGN KEY (NguoiNhanID) REFERENCES NguoiDung (ID);
ALTER TABLE ThongBao ADD FOREIGN KEY (NguoiDungID) REFERENCES NguoiDung (ID);
ALTER TABLE ThongBao ADD FOREIGN KEY (NguoiTuongTacID) REFERENCES NguoiDung (ID);

drop database doan_db2