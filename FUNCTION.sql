-- Giả sử nếu những đơn hàng bán hoặc mua có số lượng hoa dưới 20 hoa sẽ không được chấp nhận. Viết hàm khi nhập số mã hóa đơn cho biết được chấp nhận hay không
DELIMITER $$

CREATE FUNCTION CHECKORDER (mahoadon CHAR(10))
RETURNS CHAR(100)
DETERMINISTIC
BEGIN
	DECLARE soluong INT;
    DECLARE ketqua CHAR(100);
    
	SELECT SUM(soluong) INTO soluong
    FROM chitietdonhang c JOIN hoadon ON hoadon.mahoadon = c.mahoadon
	WHERE c.mahoadon = mahoadon;
    
    IF soluong < 20 THEN
		SET ketqua := 'ĐƠN HÀNG KHÔNG ĐƯỢC CHẤP NHẬN';
	ELSE
		SET ketqua :='ĐƠN HÀNGCHẤP NHẬN';
	END IF;
    RETURN ketqua;
END $$

DELIMITER ;

-- Sử dụng function
SELECT CHECKORDER ('0001');