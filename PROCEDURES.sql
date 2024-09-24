-- Viết một hàm trả về dạng table đặt tên là demsoluongloaihoa theo nhà cung cấp
-- (@mahoa n char(10) đếm số lượng loại hoa theo mã nhà cung cấp)
DELIMITER $$

CREATE PROCEDURE demsoluongloaihoa (mancc char(10))
BEGIN 
    SELECT mancc, total AS 'SỐ LƯỢNG'
    FROM (SELECT COUNT(mahoa) AS 'TOTAL'
    FROM hoa_NCC
    WHERE maNCC = mancc) AS sub;
    
END $$

DELIMITER ;
DROP PROCEDURE demsoluongloaihoa;
-- Sử dụng funtion
CALL demsoluongloaihoa('001') 

-- Những nhân viên bán ít hơn quy định về số đơn hàng bắt buộc sẽ bị sa thải. Viết một thủ tục tìm ra những nhân viên bị sa thải
DELIMITER $$

CREATE PROCEDURE CHECK_FIRED (soluongbatbuoc INT)
BEGIN 
	SELECT manv
    FROM hoadon
    WHERE theloai ='B'
    GROUP BY manV
    HAVING SUM(mahoadon) < soluongbatbuoc;
END $$
DELIMITER ;

-- sử dụng thủ tục
CALL CHECK_FIRED(10);

-- Viết thủ tục tính lương cho mỗi nhân viên với mức lương là cho nhân viên là 5.000.000 và biết với mỗi hóa đơn bán ra nhân viên sẽ nhận được thêm một số tiên hoa hồng 
DELIMITER $$

CREATE PROCEDURE SALARY (COMMISSION float)
BEGIN
	SELECT manv, (SUM((C.soluong*C.giatien-C.soluong*C.giatien*C.giamgia)*COMMISSION)+5000000) AS 'LƯƠNG'
    FROM chitietdonhang C JOIN hoadon ON C.mahoadon=hoadon.mahoadon
    WHERE hoadon.theloai = 'B'
    GROUP BY manv ;
END $$
DELIMITER ;
-- Gọi thủ tục
CALL SALARY(0.1);