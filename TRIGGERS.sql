-- Tạo trigger tự động cộng, trừ số lượng hoa tồn kho trong bảng hoa
-- Trigger trừ số lượng hoa từ hóa đơn bán
DELIMITER $$ 
CREATE TRIGGER FLOWER_INSERT_BAN
	AFTER INSERT ON chitietdonhang 
    FOR EACH ROW
BEGIN
	UPDATE hoa 
    SET soluong = soluong - NEW.soluong
    WHERE mahoa = NEW.mahoa AND EXISTS (
        SELECT 1 
        FROM hoadon
        WHERE hoadon.mahoadon = NEW.mahoadon
        AND hoadon.theloai = 'B'
    );
END $$ 
DELIMITER ;

-- Trigger CỘNG số lượng hoa từ hóa đơn MUA
DELIMITER $$ 
CREATE TRIGGER FLOWER_INSERT_MUA
	AFTER INSERT ON chitietdonhang 
    FOR EACH ROW
BEGIN
	UPDATE hoa 
    SET soluong = soluong + NEW.soluong
    WHERE mahoa = NEW.mahoa AND EXISTS (
        SELECT 1 
        FROM hoadon
        WHERE hoadon.mahoadon = NEW.mahoadon
        AND hoadon.theloai = 'M'
    );
END $$ 
DELIMITER ;

-- Trigger cộng số lượng hoa từ hủy hóa đơn bán
DELIMITER $$ 
CREATE TRIGGER FLOWER_DELETE_BAN
	AFTER INSERT ON chitietdonhang 
    FOR EACH ROW
BEGIN
	UPDATE hoa 
    SET soluong = soluong + NEW.soluong
    WHERE mahoa = NEW.mahoa AND EXISTS (
        SELECT 1 
        FROM hoadon
        WHERE hoadon.mahoadon = NEW.mahoadon
        AND hoadon.theloai = 'M'
    );
END $$ 
DELIMITER ;
