USE `Bearbnb`


-- Insert Default Data --
INSERT `Hello`
    ( `greeting` )
VALUES
    ( 'hello, SQL' )
    
INSERT  `account`
    (`username`,`password`,`fk_account_identity_id`,`fk_account_status_id`)
VALUES
    ('YukiOou','YukiOou0930',1,2),
    ('Jerry','JerrY666',2,2);
    
INSERT "account_information"
    ([fk_account_id],[first_name],[last_name],[gender],[phone_number],[email],[birthday])
VALUES
    ( 1,'Yuki','Oou','f','0987654321','yukiOouCard@gmail.com','1996-09-30' ),
    ( 2,'Jerry','Dai','m','0966666666','jerryoop66@gmail.com','1990-07-04' ); 	

INSERT `account_identity`
    ( `title` )
VALUES
    ( 'others' ),
    ( 'user' ),         -- 使用者
    ( 'webmaster' )     -- 網站管理者


INSERT `account_status`
    ( `title` )
VALUES
    ( 'others' ),
    ( 'verified' ),     -- 已認證
    ( 'unverified' ),   -- 未認證
    ( 'disabled' )      -- 禁止使用


INSERT `city`
    ( `title` )
VALUES
    ( 'others' ),
    ( '基隆市' ),
    ( '台北市' ),
    ( '新北市' ),
    ( '桃園市' ),
    ( '桃園縣' ),
    ( '新竹市' ),
    ( '新竹縣' ),
    ( '苗栗市' ),
    ( '苗栗縣' ),
    ( '台中市' ),
    ( '彰化縣' ),
    ( '彰化市' ),
    ( '南投市' ),
    ( '南投縣' ),
    ( '雲林縣' ),
    ( '嘉義縣' ),
    ( '嘉義市' ),
    ( '台南市' ),
    ( '高雄市' ),
    ( '屏東縣' ),
    ( '屏東市' ),
    ( '宜蘭縣' ),
    ( '宜蘭市' ),
    ( '花蓮縣' ),
    ( '花蓮市' ),
    ( '台東市' ),
    ( '台東縣' ),
    ( '澎湖縣' ),
    ( '綠島' ),
    ( '蘭嶼' ),
    ( '金門縣' ),
    ( '馬祖' ),
    ( '連江縣' )


INSERT `room_status`
    ( `title` )
VALUES
    ( 'others' ),
    ( 'private' ),      -- 未開放
    ( 'preparing' ),    -- 已開放，準備中
    ( 'ready' ),        -- 已開放，可使用
    ( 'used' ),         -- 已開放，使用中
    ( 'disabled' )      -- 強制禁止使用


INSERT `room_type`
    ( `title` )
VALUES
    ( 'others' ),
    ( 'suite' ),        -- 套房
    ( 'room' )          -- 雅房


--<<<<<<< HEAD
--INSERT `room_service`
--    ( `title` )
--=======
INSERT `room_serve`
    ( `title` )
VALUES
    ( 'others' ),
    ( '提供早餐' ),
    ( '按摩服務' )


INSERT `room_device`
    ( `title` )
VALUES
    ( 'others' ),
    ( 'WIFI' ),
    ( '滅火器' ),
    ( '冷氣' ),
    ( '暖氣' ),
    ( '急救包' ),
    ( '冰箱' )


INSERT `room_restrict`
    ( `title` )
VALUES
    ( 'others' ),
    ( '不可吸菸' ),
    ( '不可舉辦派對' ),
    ( '開伙' )
		
    
INSERT INTO `order_status`
    (`title`)
VALUES 
		('確認中'),
		('已確認'),
		('入住中'),
		('已完成 還未評價'),
		('已完成 已評價'),
		('不成立')




    
INSERT  "account"
    ([username],[password],[fk_account_identity_id],[fk_account_status_id])
VALUES
    ('YukiOou','b447e558199db3b5f4ca9b5c57a57e88',1,2),	--password: YukiOou0930
    ('Jerry','86c53be3acd551379c66a4ba08d95e47',2,2);	--password: JerrY666
    
INSERT "account_information"
    ([fk_account_id],[first_name],[last_name],[gender],[phone_number],[email],[birthday])
VALUES
    ( 1,'Yuki','Oou','f','0987654321','yukiOouCard@gmail.com','1996-09-30' ),
    ( 2,'Jerry','Dai','m','0966666666','jerryoop66@gmail.com','1990-07-04' ); 	
