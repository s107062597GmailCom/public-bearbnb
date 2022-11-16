/********************************
*         Check Database        *
********************************/
IF NOT EXISTS ( SELECT * FROM "sys"."databases" WHERE "name" = 'Bearbnb' )
BEGIN
    PRINT 'ERROR: Database "Bearbnb" does not exist.'
    PRINT 'ERROR: Process terminated.'
    USE "master"
    RETURN
END

USE "Bearbnb"


/********************************
*          Check Tables         *
********************************/
DECLARE @ERROR_TABLE_FLAG INT
SET @ERROR_TABLE_FLAG = 0

IF OBJECT_ID ( 'dbo.fk_room_front_cover_to_photo' ) IS NULL
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'hello' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'order' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'order_status' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_photo' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_to_room_restrict' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_restrict' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_to_room_device' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_device' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_to_room_serve' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_serve' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_comment' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_information' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_type' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_status' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'city' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'account_photo' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'chat_detail' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'chatroom' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'account_information' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'account' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'account_status' )
    SET @ERROR_TABLE_FLAG = 1

IF NOT EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'account_identity' )
    SET @ERROR_TABLE_FLAG = 1

IF @ERROR_TABLE_FLAG = 1
BEGIN
    PRINT 'ERROR: Some tables are missing.'
    PRINT 'ERROR: Process terminated.'
    USE "master"
    RETURN
END


/********************************
*          Insert Data          *
********************************/
INSERT "Hello"
    ( "greeting" )
VALUES
    ( 'hello, world.' ),
    ( 'hello, SQL' )


INSERT "account_identity"
    ( "title" )
VALUES
    ( '使用者' ),
    ( '網站管理者' )


INSERT "account_status"
    ( "title" )
VALUES
    ( '已認證' ),
    ( '未認證' ),
    ( '禁止使用' )


INSERT "city"
    ( "title" )
VALUES
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


INSERT "room_status"
    ( "title" )
VALUES
    ( '未開放' ),
    ( '準備中' ),
    ( '可使用' ),
    ( '使用中' ),
    ( '禁止使用' )


INSERT "room_type"
    ( "title" )
VALUES
    ( '套房' ),
    ( '雅房' ),
    ( '合宿' )


INSERT "room_serve"
    ( "title", "icon_tag" )
VALUES
    ( '提供早餐', 'fa-sharp fa-solid fa-mug-saucer' ),
    ( '按摩服務', 'fa-solid fa-spa' )


INSERT "room_device"
    ( "title", "icon_tag" )
VALUES
    ( 'WiFi', 'fa-solid fa-wifi' ),
    ( '滅火器', 'fa-solid fa-fire-extinguisher' ),
    ( '冷氣', 'fa-sharp fa-solid fa-snowflake' ),
    ( '暖氣', 'fa-solid fa-square-h' ),
    ( '急救包', 'fa-solid fa-briefcase-medical' ),
    ( '冰箱', 'fa-solid fa-icicles' )


INSERT "room_restrict"
    ( "title", "icon_tag" )
VALUES
    ( '不可吸菸', 'fa-solid fa-ban-smoking' ),
    ( '不可喧鬧', 'fa-solid fa-volume-xmark' ),
    ( '不可開伙', 'fa-solid fa-fire-burner' )


INSERT "order_status"
    ( "title" )
VALUES
    ( '待確認' ),
    ( '已確認' ),
    ( '住宿中' ),
    ( '待評價' ),
    ( '已評價' ),
    ( '已取消' )


-- Insert users
INSERT "account" (
    "uuid",
    "username",
    "password",
    "fk_account_identity_id",
    "fk_account_status_id",
    "salt"
) VALUES (
    'BE70CA5D-E522-40AE-BE3E-634E9E06C66A',
    'username1',
    'f390e329455ed4d73520d56faf30d554',
    1,
    1,
    '01CB24EFC2384E9799F1011544161B1C'
), (
    '43B6DEAD-97DE-47DC-914B-89D3777AB897',
    'username2',
    '8e54b49eb05c922eb916c46cf86715b5',
    1,
    1,
    'E104B9758E784521A6B512B3DC768892'
), (
    '12984198-2A69-4273-A294-D4BED1F0F7B3',
    'username3',
    '6de1f543dd45684d4ac17d7423c6833f',
    1,
    1,
    'CC3584849867407C99FC4D7CE4CD4C61'
), (
    '7F0E7396-AABF-478E-A312-0F22F4CB5D07',
    'username4',
    '34904a96d0c358902836875b11656663',
    1,
    1,
    'ABB6FF81EBD041C8B66DABF725A724BB'
), (
    '5A096DED-B1C6-49FE-9EF4-E4D4EA5780D9',
    'username5',
    '9abb4296d0b6c3413fc4d146d8a887f0',
    1,
    1,
    'CF62025F76BF4CB287EC990501E24711'
), (
    '4AD8855B-1AD4-4717-AE31-CFCB1CCA7277',
    'username6',
    '1d416eafc0d33115c584e2eee7e4c571',
    1,
    1,
    'A0EBC4813FCC4BB3B02E79FBE634CBF2'
), (
    '53FA1226-18B2-46F9-B57A-6062B4CCE6A6',
    'username7',
    'f3b97870c51aedba2a2df7999b340858',
    1,
    1,
    '93F3AC5D0C4C4683ABEBFA472DF9A28F'
), (
    'F5752BD6-2113-4AA3-A2D8-04BCCDF4F94A',
    'username8',
    'bc69129be08bd894babe32b1ab49980f',
    1,
    1,
    'DB50A7752C344E158481217941B5FDAC'
), (
    '337D2378-4B54-43A2-AB30-1968F8132211',
    'username9',
    '923151476434827921186d762367f360',
    1,
    1,
    '1D0049DF3A644FCBB07DD2DB2E1132EE'
), (
    '8F4AAB7A-7F4C-4392-89BD-2D084847CC5D',
    'username10',
    '1e22f06d3cdd69b8344439dc4bb6b108',
    1,
    1,
    'F1F253DD56014514A0B3C55290E242BB'
), (
    '1EEAEFE9-37C0-4990-BD40-A105607EB694',
    'username11',
    'f1dae58e9c70a89b64329891529a8bf1',
    1,
    1,
    'B4DAAF24027947C1A087466BE47924A3'
), (
    'F8C13985-1B0A-4DBE-A8F5-2DF6BD7BF800',
    'username12',
    '1bc8b166df80ead0a090d582c40c38a9',
    1,
    1,
    '1E314AAF980C4B41BF673CBAEE8225EC'
)

INSERT "account_information" (
    "fk_account_id",
    "first_name",
    "last_name",
    "gender",
    "phone_number",
    "email",
    "birthday"
) VALUES (
    1,
    '史蒂芬',
    '羅傑斯',
    'm',
    '0900000001',
    'user1@bearbnb.com',
    '2000-01-01'
), (
    2,
    '娜塔莎',
    '羅曼諾夫',
    'f',
    '0900000002',
    'user2@bearbnb.com',
    '2000-01-02'
), (
    3,
    '東尼',
    '史塔克',
    'm',
    '0900000003',
    'user3@bearbnb.com',
    '2000-01-03'
), (
    4,
    '維吉妮雅',
    '波茲',
    'f',
    '0900000004',
    'user4@bearbnb.com',
    '2000-01-04'
), (
    5,
    '索爾',
    '雷神',
    'm',
    '0900000005',
    'user5@bearbnb.com',
    '2000-01-05'
), (
    6,
    '珍',
    '霍絲特',
    'f',
    '0900000006',
    'user6@bearbnb.com',
    '2000-01-06'
), (
    7,
    '強尼',
    '戴普',
    'm',
    '0900000007',
    'user7@bearbnb.com',
    '2000-01-07'
), (
    8,
    '安柏',
    '赫德',
    'f',
    '0900000008',
    'user8@bearbnb.com',
    '2000-01-08'
), (
    9,
    '李奧納多',
    '狄卡皮歐',
    'm',
    '0900000009',
    'user9@bearbnb.com',
    '2000-01-09'
), (
    10,
    '凱特',
    '溫斯蕾',
    'f',
    '0900000010',
    'user10@bearbnb.com',
    '2000-01-10'
), (
    11,
    '哈利',
    '波特',
    'm',
    '0900000011',
    'proviworld34@gmail.com',
    '2000-01-11'
), (
    12,
    '金妮',
    '衛斯理',
    'f',
    '0900000012',
    'proviworld34jp@gmail.com',
    '2000-01-12'
)

INSERT "account_photo"
    ( "uuid", "fk_account_id" )
VALUES
    ( '0BCDF0DD-A77C-4DA3-8E69-4561230DB4D0', 1 ),
    ( '2FBA3B6D-C8BA-47EE-9DBC-5F7D2D07BF79', 2 ),
    ( 'D42F39B4-32A0-42DD-B572-8ED89CFC8F3B', 3 ),
    ( '0E070830-AA88-4861-AD21-312F7F98A26B', 4 ),
    ( 'FE3B0473-7C1F-4199-B11E-1F481B259120', 5 ),
    ( '6F127C5F-5741-461E-8E02-4CF32FDAF7AE', 6 ),
    ( 'B1E34429-3C36-49FB-AFBC-310F7BCF0712', 7 ),
    ( 'EF48CE95-1A16-4CAE-80ED-1E14528AFB28', 8 ),
    ( '8488ADAE-35ED-4680-BBE8-0B0521FC3A4A', 9 ),
    ( '527C68C8-EB5A-4525-AB44-BDC406F63C38', 10 ),
    ( 'F7322A09-0BCD-4D01-910B-5006A635C95F', 11 ),
    ( 'D02C53E6-05CB-4C19-875D-02F25AD81215', 12 )



-- F.L.'s user
INSERT "account" (
    "uuid",
    "username",
    "password",
    "fk_account_identity_id",
    "fk_account_status_id",
    "salt"
) VALUES (
    '7BAB25B4-3664-4A86-B645-36996C512D4C',
    'username501',
    'ea24ab4484fc262ce84773b43740af4c',
    2,
    1,
    '800D2C625B2D4B8390DAE90E42CBBECC'
)

INSERT "account_information" (
    "fk_account_id",
    "first_name",
    "last_name",
    "gender",
    "phone_number",
    "email",
    "birthday"
) VALUES (
    13,
    '依林',
    '蔡',
    'f',
    '0900000501',
    'username501@gmail.com',
    '2000-01-01'
)

INSERT "account_photo"
    ( "uuid", "fk_account_id" )
VALUES
    ( '824A6DD1-EB84-45FA-9C79-82F78583C41A', 13 )

-- Ricky's user
INSERT "account" (
    "uuid",
    "username",
    "password",
    "fk_account_identity_id",
    "fk_account_status_id",
    "salt"
) VALUES (
    '1C50DCFC-89C2-478A-9A3A-ABC94244E175',
    'user300',
    '4d43bcfaeac4c6ed6e001646a839ff41',
    1,
    1,
    '572BE5405C804F0FA42C4A747019175E'
)

INSERT "account_information" (
    "fk_account_id",
    "first_name",
    "last_name",
    "gender",
    "phone_number",
    "email",
    "birthday"
) VALUES (
    14,
    '四郎',
    '黃',
    'm',
    '0900123456',
    'user300@gmail.com',
    '2000-01-01'
)

INSERT "account_photo"
    ( "uuid", "fk_account_id" )
VALUES
    ( '9194978F-F5A9-48D4-B898-47D892AD0FA5', 14 )

-- C.N.'s user
INSERT "account" (
    "uuid",
    "username",
    "password",
    "fk_account_identity_id",
    "fk_account_status_id",
    "salt"
) VALUES (
    '2CFBE856-F45B-4E39-910D-642F081BB95F',
    'username200',
    '75fc60519c48bae1d2cb8ef5c7b7631f',
    1,
    1,
    'EDF55048084946D1A5E27CBFD7916C6C'
), (
    '21112FD4-3427-445C-998A-84B70EB95D3E',
    'username201',
    '38ccef510a149fea747903068064eb8b',
    1,
    1,
    '61BFD9835F474F93B34D8A18EB845796'
)

INSERT "account_information" (
    "fk_account_id",
    "first_name",
    "last_name",
    "gender",
    "phone_number",
    "email",
    "birthday"
) VALUES (
    15,
    '武',
    '金城',
    'm',
    '0900000200',
    'username200@bearbnb.com',
    '2000-02-01'
), (
    16,
    '比爾',
    '凱子',
    'm',
    '0900000201',
    'username201@bearbnb.com',
    '2000-02-02'
)

INSERT "account_photo"
    ( "uuid", "fk_account_id" )
VALUES
    ( '64CB3D90-BCF5-4CEE-A9DB-7DB30E20E275', 15 ),
    ( '8486EC45-CE59-432C-95D6-19A0DCA9AB46', 16 )


-- Insert rooms
SET IDENTITY_INSERT [dbo].[room] ON 
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (1, N'449dae2a-859f-4daa-aefb-abcb802024d0', 1, N'基隆市暖暖區東勢街221號', 3, null, 5000, 1)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (2, N'90c945d2-6f2f-42a5-a3b6-ca71d92464d5', 2, N'台北市南港區東新街170號', 3, null, 7800, 2)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (3, N'415a84d4-a663-4d72-b760-2e2b96cf3309', 3, N'新北市八里區挖子尾街111號', 3, null, 10000, 3)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (4, N'2cf025ba-3d27-4462-9f23-065661156a29', 4, N'桃園市桃園區中正路1188號', 3, null, 8900, 4)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (5, N'12dc5fcf-f8f9-4425-9ab0-382b3671ff16', 4, N'桃園市復興區中山路2號', 3, null, 12200, 5)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (6, N'fb85f645-99ef-4a9f-86d7-efd2ea9c0ec3', 6, N'新竹市北區境福街201巷87號', 3, null, 13400, 6)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (7, N'a15c01b3-c87a-46cb-b2ed-199caf3eeefe', 7, N'新竹縣寶山鄉深井一路98號', 3, null, 3800, 7)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (8, N'74ea9bf3-f93f-4bf8-ad04-f212b6b851bc', 8, N'苗栗市國華路599號', 3, null, 4900, 8)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (9, N'2e08ebba-0e19-4e6d-ba52-edc210fd2f37', 10, N'台中市梧棲區中橫十一路18號', 3, null, 3300, 9)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (10, N'5ee2f72f-f330-46dc-93b7-cd9fa49f2572', 11, N'彰化縣秀水鄉彰水路二段341號', 3, null, 2300, 10)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (11, N'6cb7e468-273c-401f-ad59-4bab4ac86395', 13, N'南投市草屯鎮玉屏路161號', 3, null, 5200, 11)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (12, N'79b80499-b231-4d69-a5a7-088dd8d4ff68', 14, N'南投縣埔里鎮枇杷路94號', 3, null, 3000, 12)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (13, N'0a471510-0d2f-412f-8b45-3e8c0a9cc02c', 15, N'雲林縣古坑鄉湳仔路', 3, null, 4000, 1)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (14, N'5eb66893-6acb-4926-8aa2-02c473bcdd69', 16, N'嘉義縣新港鄉月眉村658號', 3, null, 2222, 2)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (15, N'dff6aef7-f3e4-4af5-b7cf-36d1c601c100', 18, N'台南市下營區中興南路336號', 3, null, 7777, 3)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (16, N'8837457a-c30c-4028-b65d-8489881fad47', 18, N'台南市新化區中興路123-1號', 3, null, 3000, 4)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (17, N'26477c59-56fa-44ef-b4d9-bacf779f9d6f', 19, N'高雄市那瑪夏區平和巷209之1號', 3, null, 3330, 5)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (18, N'e3905510-9077-474d-906f-a9c666c7d4c9', 20, N'屏東縣三地門鄉中正路二段168號', 3, null, 5200, 6)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (19, N'dfa04040-40f6-490a-b570-458feeec23ff', 20, N'屏東縣獅子鄉丹路一巷39號', 3, null, 4800, 7)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (20, N'38835761-de0e-4c98-a2cf-0d973e6f9bb1', 27, N'台東縣鹿野鄉寶華路82號', 3, null, 20000, 8)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (21, N'1d1f65bd-1fab-4ae9-8c56-ddfddebd485e', 24, N'花蓮縣瑞穗鄉中山路三段216-1號', 3, null, 3333, 9)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (22, N'4b286a05-e25d-4421-8362-9901cbce8a02', 24, N'花蓮縣秀林鄉海濱路50號', 3, null, 3340, 10)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (23, N'cd49c2c2-708f-4ba9-8976-b45fb21a7d91', 22, N'宜蘭縣三星鄉照林路二段103-12號', 3, null, 5000, 11)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (24, N'2e1dea44-5a4a-48c8-ae5e-eef8eb31f9a1', 13, N'南投市虎山路1號', 3, null, 99999, 12)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (25, N'6b58e95f-a77f-492e-83b4-1c8dbac66ac3', 2, N'台北市松山區復興北路313巷23號', 3, null, 1111, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (26, N'6afadeeb-0cb7-4be3-8e44-99fe79cd86b5', 2, N'台北市大安區忠孝東路四段216巷33弄15號', 3, null, 2222, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (27, N'fa15076a-fd0c-4d13-8c46-2fe71f91cd8a', 2, N'台北市大安區安和路一段78巷37號', 3, null, 3333, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (28, N'330ccf37-24f9-4520-af2f-3d59e52f0178', 2, N'台北市中山區雙城街25巷9號', 3, null, 4444, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (29, N'423a2862-592f-4dd3-95fa-d9ce4841be25', 2, N'台北市中山區中山北路一段83巷38號', 3, null, 5555, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (30, N'282933ef-3eaf-41bc-b639-ed67759cb14b', 2, N'台北市中山區中山北路二段42巷6號', 3, null, 6666, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (31, N'5dcab0b6-c5cf-42a2-b980-1662e8f6acac', 2, N'台北市松山區敦化北路166號5樓', 3, null, 6666, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (32, N'11db1583-b1e8-43bc-8970-63191ddc66a8', 2, N'台北市松山區敦化北路155巷110號', 3, null, 8888, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (33, N'80a3b33a-db2a-4093-9821-a533039402da', 2, N'台北市信義區仁愛路四段452巷6號', 3, null, 9999, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (34, N'bdadc7ce-6838-4485-b6bd-fa6df3d37623', 2, N'台北市大安區敦化南路一段235號2樓', 3, null, 1010, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (35, N'f327b96c-b133-4988-a891-12fa9d33d8c4', 2, N'台北市大安區安和路一段102巷4號', 3, null, 1111, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (36, N'ac1b3bcf-b19b-4c72-a974-f327d9d0d402', 2, N'台北市中山區敬業二路199號5樓', 3, null, 1212, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (37, N'21fb3694-9e1d-40f9-ba67-5547f5c391e9', 3, N'新北市三重區新北大道一段3號', 3, null, 1111, 15)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (38, N'4ef106a9-ba6f-4d28-ac10-92959eba52a4', 3, N'新北市蘆洲區民族路488號', 3, null, 2222, 15)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (39, N'1d4812e4-8ef3-4fdb-86cd-985bf5a6b990', 3, N'新北市泰山區南林路118號', 3, null, 1212, 15)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (40, N'8fb8dd4c-e1fd-455e-8a4d-ec542afdd36e', 3, N'新北市林口區文化二路二段299號', 3, null, 4444, 15)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (41, N'd614605a-7e64-4034-8a86-ab8202a06e71', 3, N'新北市中和區中山路三段122號', 3, null, 3333, 15)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (42, N'79f1c5f0-205e-45d2-b417-2428889b00a3', 2, N'台北市大同區重慶北路三段318號', 3, null, 1313, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (43, N'7acce3ac-bd7d-4c85-a9fc-808a284dbbe6', 2, N'台北市中正區北平東路14號', 3, null, 1414, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (44, N'ac8bfaec-88c5-495b-bc83-e5da277b6113', 2, N'台北市大安區敦化南路一段329巷16號', 3, null, 1515, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (45, N'c73055f3-b748-4218-b3f7-d81831ca5ffd', 2, N'台北市大安區敦化南路一段324號', 3, null, 1616, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (46, N'57f2dd3d-a3df-41f9-b8e2-ce3cc4c1bbcc', 2, N'台北市大安區信義路四段152號', 3, null, 1717, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (47, N'227472da-d969-4b71-8772-c7734b29bb86', 2, N'台北市大安區大安路一段135號B1', 3, null, 1818, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (48, N'3c92c0f1-866c-4b57-b26d-ce9fae15541f', 2, N'台北市中山區吉林路327號', 3, null, 1919, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (49, N'32b3bfb9-e9d6-4db6-af0d-fa36c343f435', 2, N'台北市信義區吳興街239號', 3, null, 2020, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (50, N'8d12d503-cda4-4f07-95b7-1d52c7431d5a', 2, N'台北市松山區敦化北路158號6樓', 3, null, 2121, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (51, N'11c50c2b-eb25-4054-b1ab-5ac226250e83', 2, N'台北市內湖區新湖二路250巷33號', 3, null, 2222, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (52, N'90ac4e46-3fde-4d60-a154-b28066861a0a', 2, N'台北市大同區承德路一段3號6樓', 3, null, 2323, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (53, N'3ed68dcb-c690-4426-8537-35eade03d684', 2, N'台北市大安區瑞安街141號', 3, null, 2424, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (54, N'7dcdab9d-1e77-4527-b62a-bfed6c4a49e2', 2, N'台北市中正區重慶南路一段129號2F', 3, null, 2000, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (55, N'3ec8dc38-1209-4d4a-bf13-562485baf8f7', 2, N'台北市中山區松江路253號', 3, null, 2000, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (56, N'ac5df25b-82e0-4610-b9db-6b0bfe84eb94', 2, N'台北市萬華區廣州街247號', 3, null, 1415, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (57, N'0978129e-0719-4d11-991b-87e0f53731f7', 2, N'台北市中山區興安街62號', 3, null, 2705, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (58, N'484dc46c-34c9-431a-9fc5-f2dcab6ab50d', 2, N'台北市中山區吉林路49號', 3, null, 3900, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (59, N'e59f5d21-e144-4c98-bd4a-93031a573e55', 2, N'台北市中正區金山南路一段71號', 3, null, 2005, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (60, N'ba81235a-737b-4a23-90a3-0e817dedbbea', 2, N'台北市大安區和平東路一段147號', 3, null, 1580, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (61, N'38666308-cfbc-4728-93c7-3c0c413d0d7c', 2, N'台北市萬華區環河南路二段282號', 3, null, 1800, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (62, N'917d0104-340e-4a5e-a6e3-773532129bc4', 2, N'台北市萬華區西藏路192號', 3, null, 1180, 14)
GO
INSERT [dbo].[room] ([id], [uuid], [fk_city_id], [address], [fk_room_status_id], [fk_front_cover_id], [price], [fk_owner_id]) VALUES (63, N'd2126f77-cfed-4b39-bd0e-9ffba5016843', 2, N'台北市中山區建國北路一段61號', 3, null, 4088, 14)
GO
SET IDENTITY_INSERT [dbo].[room] OFF
GO

SET IDENTITY_INSERT [dbo].[room_information] ON 
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (1, 1, N'樹中雨林小屋', 1, 121.7550898, 25.0769876, 8, 1, 4, 2, 0, 2, 4, 40, N'感受雨林中帶來的大自然的芬芳，享受旅行的每一天')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (2, 2, N'崖邊山林眺望台', 1, 121.5912019, 25.0459966, 4, 1, 0, 2, 0, 4, 1, 50, N'整天在風中欣賞美麗的天空，沉靜在自然的氛圍。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (3, 3, N'空中泳池豪華套房', 1, 121.4111882, 25.1650418, 20, 1, 0, 10, 0, 10, 10, 100, N'低調奢華的享受陽光與泳池')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (4, 4, N'半山腰上臥龍山莊', 2, 121.2986658, 25.0175106, 20, 1, 20, 0, 0, 10, 10, 100, N'享受在山林中游泳的快感')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (5, 5, N'人造北極圈冰雪小屋', 3, 121.3507705, 24.8141777, 4, 1, 0, 2, 0, 10, 4, 50, N'共同體驗雪中探險的休憩小站')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (6, 6, N'奢華大富愛斯基摩別墅', 1, 120.9574625, 24.818598, 8, 1, 8, 0, 0, 8, 8, 240, N'愛斯基摩人是過著什麼樣的生活呢？歡迎來此地體驗體驗！')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (7, 7, N'夏天的溫馨小套房', 3, 120.9443326, 24.7121965, 8, 1, 0, 4, 0, 10, 10, 160, N'歡迎世界各地的朋友來這裡慶祝開派對')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (8, 8, N'臨海豪華莊園', 3, 120.8177692, 24.5734594, 30, 1, 0, 15, 0, 15, 15, 20, N'方便前往各個遊樂設施及海岸的絕美地點')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (9, 9, N'樸素古色古香的三角小屋', 2, 120.5309764, 24.2712309, 4, 1, 0, 0, 4, 1, 2, 20, N'高挑天花板及出門即可活動的空間，適合嚮往自由的你')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (10, 10, N'前衛風格時尚住宅', 1, 120.4931037, 24.0266029, 10, 1, 0, 5, 0, 2, 4, 80, N'試試看吧，這是個好地方')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (11, 11, N'水晶星空浪漫泡泡屋', 2, 120.7045613, 23.9898899, 2, 1, 0, 1, 0, 1, 1, 8, N'帶著你的另一半來此享受浪漫的夜晚吧')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (12, 12, N'豪華泳池套房', 2, 120.989445, 23.9514212, 8, 1, 8, 0, 0, 4, 4, 240, N'豪華的泳池大豪宅')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (13, 13, N'汪洋中的歸宿', 1, 120.5423015, 23.650477, 4, 1, 0, 2, 0, 1, 1, 15, N'遠離塵囂，享受待在世界角落的恬靜')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (14, 14, N'觀海小屋', 1, 120.3567495, 23.5232134, 1, 1, 1, 0, 0, 1, 1, 10, N'文青入門必住套房')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (15, 15, N'山林小屋', 1, 120.2707119, 23.2292817, 10, 1, 0, 5, 0, 5, 1, 110, N'遊客們的好去處')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (16, 16, N'返璞歸真洞穴居', 1, 120.3342506, 23.0258733, 8, 1, 8, 0, 0, 4, 2, 40, N'雖然沒有冷氣，但這裡非常涼爽，各位別怕')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (17, 17, N'綠意盎然小別墅', 1, 120.6924966, 23.2560565, 8, 1, 4, 2, 0, 2, 2, 60, N'這邊住起來很舒服唷')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (18, 18, N'這是一台露營車', 1, 120.6650333, 22.7208621, 4, 1, 0, 2, 0, 1, 1, 10, N'這台露營車其實哪裡都能去，只是要再登記地點還車唷')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (19, 19, N'德州貨櫃屋', 2, 120.7512782, 22.2033133, 8, 1, 0, 4, 0, 2, 2, 40, N'這裡可以體會到住在貨櫃裡的感覺喔')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (20, 20, N'美麗絕倫巨型城堡', 1, 121.1725035, 22.9739293, 16, 1, 0, 8, 0, 8, 1, 1000, N'公主病養成聖地')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (21, 21, N'樸實無華三角屋', 1, 121.4003743, 23.4910684, 8, 1, 0, 4, 0, 1, 2, 40, N'看起來比想像的還大的三角屋')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (22, 22, N'國家公園內的民宿', 2, 121.6539144, 24.1679508, 2, 1, 0, 1, 0, 1, 1, 8, N'簡易的住宿旅店')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (23, 23, N'潮牌貨櫃屋', 3, 121.6799921, 24.6720137, 2, 1, 2, 0, 0, 1, 1, 8, N'真的很潮的貨櫃屋')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (24, 24, N'四次元空間未來小屋', 1, 120.6860835, 23.956645, 100, 1, 100, 50, 100, 100, 100, 10000, N'這是來自未來的機器貓所建造的小屋，可以滿足您所有的需求')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (25, 25, N'日本橋玉井', 1, 121.5459449, 25.0590283, 4, 1, 4, 0, 0, 1, 1, 20, N'歡迎來到黃四郎的1號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (26, 26, N'Yuu', 1, 121.5537799, 25.0395433, 4, 1, 4, 0, 0, 1, 1, 30, N'歡迎來到黃四郎的2號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (27, 27, N'筌', 1, 121.5501498, 25.0351784, 2, 1, 2, 0, 0, 1, 1, 10, N'歡迎來到黃四郎的3號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (28, 28, N'月夜岩', 1, 121.5250459, 25.0662737, 4, 1, 0, 0, 4, 1, 1, 20, N'歡迎來到黃四郎的4號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (29, 29, N'山秋', 2, 121.5243148, 25.0497015, 6, 1, 0, 3, 0, 2, 2, 20, N'歡迎來到黃四郎的5號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (30, 30, N'笹鮨', 3, 121.5220915, 25.0545531, 12, 1, 0, 0, 12, 1, 2, 40, N'歡迎來到黃四郎的6號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (31, 31, N'鮨增田', 3, 121.5484628, 25.055637, 6, 1, 6, 0, 0, 1, 1, 25, N'歡迎來到黃四郎的7號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (32, 32, N'鮨翁', 2, 121.5526124, 25.0543444, 8, 1, 8, 0, 0, 1, 1, 20, N'歡迎來到黃四郎的8號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (33, 33, N'鮨七海', 1, 121.5591116, 25.037106, 4, 1, 0, 2, 0, 1, 1, 20, N'歡迎來到黃四郎的9號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (34, 34, N'梵燒肉', 1, 121.5493353, 25.0401289, 4, 1, 4, 0, 0, 4, 2, 10, N'歡迎來到黃四郎的10號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (35, 35, N'八和', 3, 121.5518831, 25.0342391, 8, 1, 8, 0, 0, 2, 2, 1, N'歡迎來到黃四郎的11號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (36, 36, N'大腕', 1, 121.5542264, 25.0843562, 8, 1, 0, 4, 0, 2, 2, 20, N'歡迎來到黃四郎的12號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (37, 37, N'新北市立聯合醫院', 1, 121.4902027, 25.0609301, 16, 1, 16, 0, 0, 16, 4, 80, N'歡迎來到金城武的1號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (38, 38, N'學校操場', 3, 121.4706203, 25.091179, 1000, 1, 0, 0, 1000, 1, 1, 500, N'歡迎來到金城武的2號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (39, 39, N'1號新北房間', 1, 121.4086545, 25.0456826, 4, 1, 4, 0, 0, 1, 1, 10, N'歡迎來到金城武的2號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (40, 40, N'舒適休閒度假小屋', 2, 121.3805174, 25.0863749, 8, 1, 8, 0, 0, 1, 2, 30, N'歡迎來到金城武的4號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (41, 41, N'四季的溫馨小套房', 1, 121.4747789, 25.0066724, 9, 1, 9, 0, 0, 1, 1, 50, N'歡迎來到金城武的房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (42, 42, N'陽明春天', 1, 121.5135502, 25.0742939, 8, 1, 8, 0, 0, 2, 2, 40, N'歡迎來到金城武的13號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (43, 43, N'鈺善閣', 1, 121.5244825, 25.0459756, 4, 1, 0, 2, 0, 2, 2, 20, N'歡迎來到金城武的14號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (44, 44, N'五月雪', 1, 121.5499613, 25.0340455, 16, 1, 4, 6, 0, 4, 4, 80, N'歡迎來到金城武的15號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (45, 45, N'驥園川菜', 3, 121.5484757, 25.0353196, 5, 1, 5, 0, 0, 1, 1, 30, N'歡迎來到金城武的16號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (46, 46, N'申浦尚宴', 3, 121.5503741, 25.033067, 1, 1, 1, 0, 0, 1, 1, 10, N'歡迎來到金城武的17號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (47, 47, N'橘色涮涮屋', 3, 121.5462439, 25.0387244, 2, 1, 0, 1, 0, 1, 1, 10, N'歡迎來到金城武的18號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (48, 48, N'林家蔬菜小套房', 2, 121.5304749, 25.0638544, 2, 1, 0, 1, 0, 1, 1, 20, N'歡迎來到金城武的19號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (49, 49, N'穆記', 2, 121.5634879, 25.0275658, 4, 1, 4, 0, 0, 1, 1, 15, N'歡迎來到金城武的房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (50, 50, N'文華東方酒店', 2, 121.547999, 25.0557778, 1, 1, 1, 0, 0, 1, 1, 10, N'歡迎來到金城武的21號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (51, 51, N'Pasti Trattoria', 2, 121.582232, 25.0657419, 1, 1, 0, 0, 1, 1, 1, 10, N'歡迎來到金城武的22號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (52, 52, N'大同區承德路一段3號6樓', 1, 121.5168741, 25.0494693, 2, 1, 2, 0, 0, 1, 1, 44, N'歡迎來到金城武的23號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (53, 53, N'老烤箱', 1, 121.5397114, 25.0266754, 7, 1, 7, 0, 0, 1, 1, 40, N'歡迎來到金城武的24號房間。
這是一間舒適的睡眠小屋，是我們最新加入的房型。公寓擁有美麗的景設...從您的廚房窗口可以欣賞長頸鹿在遊戲保留地瀏覽！
這間小屋非常適合週末放鬆身心、長期住宿，甚至從機場到這裡時只需不到一天。
我們距離高速公路僅不到五小時的路程。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (54, 54, N'TASTY西堤牛排台北重慶南店', 1, 121.513329, 25.041988, 4, 1, 4, 0, 0, 1, 1, 20, N'TASTY西堤牛排台北重慶南店')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (55, 55, N'CHECK inn 雀客旅館台北松江', 1, 121.5333727, 25.0594356, 4, 1, 0, 2, 0, 1, 1, 20, N'以展出當代藝術的臺北市立美術館、高檔餐廳與 KTV 聞名的繁華行政區。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (56, 56, N'禾順商旅 YOUR hotel', 1, 121.4974218, 25.0368538, 4, 1, 4, 0, 0, 1, 2, 20, N'繁忙的行政區，以古色古香的龍山寺、歷史建築與華西街夜市小吃聞名。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (57, 57, N'甲山林湯旅', 1, 121.5398514, 25.0559709, 4, 1, 2, 1, 0, 1, 1, 20, N'以展出當代藝術的臺北市立美術館、高檔餐廳與 KTV 聞名的繁華行政區。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (58, 58, N'美侖商旅 PARKVIEW TAIPEI', 1, 121.530352, 25.0531472, 20, 1, 0, 10, 0, 10, 10, 10, N'以展出當代藝術的臺北市立美術館、高檔餐廳與 KTV 聞名的繁華行政區。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (59, 59, N'金來商旅 Royal Biz Taipei', 1, 121.5282793, 25.0372317, 8, 1, 8, 0, 0, 2, 2, 20, N'充滿活力的地區，坐擁舉辦藝術展與活動的華山 1914 文化創意產業園區，以及匯集了許多美食攤位的東門市場。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (60, 60, N'谷墨商旅 GoodMore Hotel', 1, 121.5308004, 25.0266803, 8, 1, 0, 4, 0, 4, 4, 20, N'以台灣大學、公館夜市小吃和氣氛酒吧聞名的文教區。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (61, 61, N'Sevenday Hotel', 1, 121.4911973, 25.0320972, 4, 1, 4, 0, 0, 2, 2, 10, N'繁忙的行政區，以古色古香的龍山寺、歷史建築與華西街夜市小吃聞名。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (62, 62, N'貴都大飯店', 2, 121.502894, 25.0299974, 4, 1, 4, 0, 0, 1, 1, 30, N'繁忙的行政區，以古色古香的龍山寺、歷史建築與華西街夜市小吃聞名。')
GO
INSERT [dbo].[room_information] ([id], [fk_room_id], [title], [fk_room_type_id], [longitude], [latitude], [max_people_capacity], [min_people_capacity], [single_size_bed_count], [double_size_bed_count], [floor_mattress_count], [bedroom_count], [bathroom_count], [area], [introduction]) VALUES (63, 63, N'Hotel MVSA 慕舍酒店', 1, 121.537112, 25.050657, 2, 1, 0, 1, 0, 1, 1, 15, N'以展出當代藝術的臺北市立美術館、高檔餐廳與 KTV 聞名的繁華行政區。')
GO
SET IDENTITY_INSERT [dbo].[room_information] OFF
GO

SET IDENTITY_INSERT [dbo].[room_photo] ON 
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (1, N'54856d30-1a87-461b-810e-fa25e86fd2bd', 1)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (2, N'cfd6f98c-dde4-4891-b5f2-e1e2d98fbf41', 1)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (3, N'9d18b617-4e84-4f1c-9b8b-cac44c852d12', 1)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (4, N'da75a5a9-06f7-44ba-bf20-be67df264b9e', 1)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (5, N'386df15e-07a0-42dc-b033-588e9f905967', 1)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (6, N'77095d03-6acb-449a-a76d-fb8c8ebead50', 2)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (7, N'8b9b47f4-3bf8-4141-8919-c28c429d4185', 2)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (8, N'864aa367-149d-4d15-9514-3ff9cb772e83', 2)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (9, N'd48abf37-1ea1-43dc-a800-2f951b821ba1', 2)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (10, N'd875ff34-afd0-459e-b1a2-da020b068623', 2)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (11, N'1374fc78-e48d-4f0a-8c32-5a5cdfce83aa', 3)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (12, N'5d8c1c63-88ed-4c23-b194-e1f472e6a2cf', 3)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (13, N'9c7560c9-f2b4-4093-9a5b-36acf7e7f3f9', 3)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (14, N'41b15780-d9db-4ece-9e27-7fef76fdd2c0', 3)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (15, N'96d971a3-30f3-40fb-91d4-47f1a6e6f319', 3)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (16, N'1892cad2-ace9-449f-87d0-fe5a36562ccf', 4)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (17, N'4726d9e9-6e5c-4259-983c-b6b6650a1e85', 4)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (18, N'96128bf0-738a-41af-b997-1da8c47439d1', 4)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (19, N'4fc9dc91-cd23-4f6d-ab62-89123423faf0', 4)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (20, N'3c7503c2-3381-4d9a-b8e8-23d7d7014e5e', 4)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (21, N'07e4fe1e-46c7-46eb-9493-76f94666bb16', 5)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (22, N'40a61bfc-3e5f-47ec-942d-40ac0a126a0c', 5)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (23, N'ee8466fc-e3a1-4784-b36e-b53ad7af9656', 5)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (24, N'7ed37a39-53bb-4d30-b92f-9ad29fa3110a', 5)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (25, N'a267e85f-0cf7-42d5-b30c-ac9f59e88fc6', 5)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (26, N'a0d0d44b-57fa-46e8-9535-93a9e2585a5f', 6)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (27, N'1e7de5c7-a384-4646-960e-c9709e918f4d', 6)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (28, N'5e4be445-2246-4f97-85f2-084d5f43c0ce', 6)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (29, N'adb7af6b-850f-4b8e-bb21-71e5e3d24ce1', 6)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (30, N'dfbb51bb-312c-4951-bfd6-f29a40663545', 6)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (31, N'1d731715-a3df-48ba-abf4-9cd05623215b', 7)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (32, N'bb3ad2af-d89e-46c6-a290-d48e8d759bbe', 7)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (33, N'c4b09b81-bbd6-41e9-b10c-02348777c39d', 7)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (34, N'a0f4aa09-306e-4e85-92f5-92cc09c9904e', 7)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (35, N'e1d8c813-3e8e-489d-b7ce-c8f2d2ffd343', 7)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (36, N'7030e417-f0fb-4ded-ba76-70ea24ef0c87', 8)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (37, N'c0b26a2b-3440-464d-a31e-d221e2370d66', 8)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (38, N'b883d5c7-9f10-4821-be78-304885fd6338', 8)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (39, N'a82260c1-fb65-4808-aa32-8201ff8f31f8', 8)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (40, N'f3fb589b-983a-44e0-b856-69ca40584448', 8)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (41, N'53d1e424-5e03-4abd-8dc1-183c200e69ae', 9)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (42, N'b8b61adb-dd47-449e-846d-ea7d6a0959d1', 9)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (43, N'8852a6d3-1ae3-474d-92d3-34aeb4b3b4ad', 9)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (44, N'c29531a3-76cf-480e-b122-f0647e5ef591', 9)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (45, N'e45db78c-f5dd-462b-a79a-282494fb4aaa', 9)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (46, N'1992ee8b-b228-4bcd-966b-f51704806cf8', 10)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (47, N'c8619c6d-3f2e-499c-8345-c0b0efcb44f3', 10)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (48, N'5aac74fa-87c5-499d-bf82-ba0a695997a2', 10)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (49, N'cb0a9a94-a77c-4b58-861e-7849ae8247c6', 10)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (50, N'2f3d75ff-9dc2-421a-97ba-fce1c624f87c', 10)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (51, N'864e588c-234f-4508-b948-cfed3d8a6726', 11)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (52, N'1a022207-39c8-4bfa-9f77-5688f3c8a22c', 11)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (53, N'd41e7c11-4b84-43b2-9d1f-52093ac831b1', 11)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (54, N'b4725a3d-314b-4d8d-86b1-8f78aba7be98', 11)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (55, N'0dc4cabc-017c-4e2e-8bdb-6474c0c65611', 11)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (56, N'60000e1e-c1e9-43f9-a143-d31641780118', 12)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (57, N'723b7283-2566-42f9-83dd-9ae4d9c0124e', 12)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (58, N'abf645c8-184e-4633-86b4-8dbc894917da', 12)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (59, N'ccb263b7-3a57-42b8-aa9c-ccb43717ed5e', 12)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (60, N'fd7332e9-15d1-49a6-8829-fb19e997e47c', 12)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (61, N'19d7dd12-4abb-4fe1-b16e-5aeb674b396c', 13)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (62, N'03a5c791-8302-4e98-92b4-db222a2a5885', 13)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (63, N'd93b9a53-38ff-4355-b204-807c313c06b1', 13)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (64, N'e81836c8-430b-48bd-ab4e-d365b3dfac86', 13)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (65, N'723eeff6-8310-444d-b268-9d286eba4f63', 13)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (66, N'7692d55e-0e41-4fdc-aa8b-56ee7d9ebaa9', 14)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (67, N'55adb2bf-27d5-47a0-b76f-78cdd8d27648', 14)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (68, N'a6dc5b05-82af-409b-bd3e-30737a91d3ae', 14)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (69, N'c0c3603c-d836-4abe-900a-77e8653dd00c', 14)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (70, N'943fe2e8-5237-477f-8c70-5f9e4ebc3f19', 14)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (71, N'4520463c-faac-4008-8048-574cb92758e6', 15)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (72, N'3ca883c5-ce84-49d2-a8b4-24dec83417cc', 15)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (73, N'652ee097-7fe3-49a7-832c-cc8ffbbdd073', 15)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (74, N'6450cbe3-e9f5-40fd-9ec2-85182f50c90a', 15)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (75, N'04e23408-c498-4379-805d-42f8695300b5', 15)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (76, N'1a5686e3-c3d1-400a-9932-8783f64420d7', 16)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (77, N'4bb6e908-3150-4cc9-8b94-82ecea87b1e0', 16)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (78, N'c342da44-4a57-4a51-a805-c20e01d1a897', 16)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (79, N'763e317d-4710-4df2-b828-33445be7c80b', 16)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (80, N'a1e94008-5bcd-4883-a4d2-f1a8d35a46f5', 16)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (81, N'979a0e8f-c8bb-4df1-b1ae-d44a02f83c8b', 17)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (82, N'1d7970a4-4977-4534-8da9-e4d289fa7481', 17)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (83, N'1307ba85-503c-4065-89b8-67b496b7edda', 17)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (84, N'2e2340aa-eedd-444c-8de2-182b9b87eb41', 17)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (85, N'0dbb174a-1674-4d2c-87c6-e22f1fd9ea31', 17)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (86, N'c00e3967-310c-444f-a829-8361399b69f9', 18)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (87, N'1d6745ac-845f-457b-b3e4-7905d36b6f89', 18)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (88, N'a2dcff17-464a-4c89-8d80-874af80e4384', 18)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (89, N'39a7025f-7520-4a7c-83e4-48ca20498be4', 18)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (90, N'c5e93c6a-2ff7-481f-9900-5eee9aa4ede8', 18)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (91, N'7536eae3-bb2d-465c-8356-662219ab0386', 19)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (92, N'cd2d7799-ac46-436e-b6b0-89d61839845f', 19)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (93, N'9654df7c-813c-49aa-a680-76685c80175c', 19)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (94, N'2ff0c7ef-bba5-44ce-8c12-047b06fd4327', 19)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (95, N'5767ad1c-7d01-4bea-a0ed-22ca4419d4ce', 19)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (96, N'0ce2924e-0a50-4884-8db4-b238c09d33ee', 20)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (97, N'a8481c9e-6e74-46f9-8c86-898045b8c84c', 20)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (98, N'8ea38d83-4dd3-4140-a348-5ea350e458dd', 20)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (99, N'b3a2e0f8-d9ac-4d71-aaae-aac2b4f42ff4', 20)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (100, N'34d6efbd-5c74-49a4-9fb8-9d880a3aefe8', 20)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (101, N'76fb8608-d17f-4261-ac2a-94e2ada151ad', 21)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (102, N'fcde1e67-9967-4b5f-9d8d-a39acf07f64d', 21)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (103, N'd9eaab59-4e3a-4fda-85d4-fa3de25a7bfa', 21)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (104, N'ac7edcfb-85c0-4a0d-90cb-748a99c9996a', 21)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (105, N'1391bad7-7d88-422f-930f-8094a5545dfb', 21)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (106, N'd080003b-bafd-4b9b-b550-cd9ffed94f19', 22)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (107, N'1e346dbb-d009-4f9f-8035-9008bb999c1f', 22)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (108, N'1dd9beb2-0657-42a5-ac00-f2f934e2a9ad', 22)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (109, N'93eb8c7c-b8e4-418f-9388-508a1fd7f660', 22)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (110, N'a175b355-8f5d-4164-a463-d18d677985a3', 22)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (111, N'9648219d-49b4-44cb-824c-8a4958f95154', 23)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (112, N'17a8c461-77fa-43a5-bc83-243b589bc97a', 23)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (113, N'707ed4b9-47d6-4d46-8d3d-ecac63516ba9', 23)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (114, N'd1706fa7-a457-4cbf-a12f-5124debb11bc', 23)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (115, N'fe0b995d-dc62-45ce-b3dd-ddc75edd068f', 23)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (116, N'f71e59a3-7352-4dca-8ed6-8673c91c4355', 24)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (117, N'3a6ae632-a882-405c-a7cf-da73a3276d08', 24)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (118, N'92919243-5d14-4f15-a62a-1cccfea921ee', 24)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (119, N'a6d77ff1-3786-4bf5-b232-15b4ce1b84e7', 24)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (120, N'd9e4e3e9-ffbb-4e16-bdf3-605880f61403', 24)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (121, N'0e7f4728-4c0f-4875-afe1-7d3c64c78665', 25)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (122, N'8fce7af0-eb81-4264-8074-593b56c796d3', 25)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (123, N'311b7ac8-343e-4707-a346-859f9a6aaee0', 25)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (124, N'a306d38d-ab24-4928-b40b-f59650209944', 25)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (125, N'0546f1b6-00b5-4286-a525-139fb080f6e5', 25)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (126, N'43db77a1-cec6-46e0-933f-9d46e739217a', 26)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (127, N'35be08d8-7976-4371-b191-a6d8384591f0', 26)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (128, N'c6977df3-20bb-4ad0-8a5c-169f85a72606', 26)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (129, N'4c69acb2-316d-4df8-a752-3f88b5080e58', 26)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (130, N'c4ccd758-de83-453c-aa11-ed4b9097e6fc', 26)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (131, N'864f1380-e4ef-455f-b339-917931e33413', 27)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (132, N'9de7a1af-5f66-46d3-8778-d43c78a38aef', 27)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (133, N'7a908723-0231-4c9c-a448-c97c0d54570d', 27)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (134, N'd96c913f-d395-423c-aef2-1ff2a57e739c', 27)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (135, N'6b822af6-1373-49d9-bf62-ee663dd3e538', 27)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (136, N'032faa50-bede-4ec3-9194-45b201c9b1bf', 28)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (137, N'ce65ed5c-84c5-49bf-889f-d5bb0ae5c77a', 28)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (138, N'66fe849b-0eb5-4f3c-a1b8-1b0e160ee093', 28)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (139, N'458f9eed-201c-488d-a551-6c667d9db86b', 28)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (140, N'fb55dfce-7c3d-4231-b4d4-a6f67744b412', 28)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (141, N'e0bdae25-0674-4677-b05d-e7bbf6d8a641', 29)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (142, N'ed75fe3d-6aaf-449a-95b1-50dbd9b5b9c9', 29)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (143, N'37ffd805-d65a-422c-8403-03035de3d080', 29)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (144, N'e1c95992-19f5-476c-bbfb-561b5ff2b083', 29)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (145, N'96d2af47-1151-4199-91a0-7c823d06c4a1', 29)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (146, N'88e805ea-367e-4bee-8648-e994d6c3716f', 30)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (147, N'fc929c0f-cb35-44aa-b705-88436464cac2', 30)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (148, N'6f163eea-7ee5-4216-82b4-70cfaf7e4d67', 30)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (149, N'f4962d5e-a7d6-4011-9c61-0abeadc26fff', 30)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (150, N'ca78cd0d-bc80-42d4-8cf5-93c447773a14', 30)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (151, N'ea69e4ef-bc88-4685-9418-8d859ebe6283', 31)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (152, N'117da935-5e3e-4d94-8541-393fa6f19c44', 31)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (153, N'b895f2eb-9811-4bdc-bb11-81e1475744a3', 31)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (154, N'a4d65599-d886-498c-91a6-78add874bd91', 31)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (155, N'021c454e-50a4-4c86-a671-bad458b09732', 31)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (156, N'dfd5ff24-0788-4a48-be77-e301126ba141', 32)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (157, N'3a01edf8-6454-49c4-b6c5-aaa70e7d7f84', 32)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (158, N'f68c00bc-32fa-44db-a756-a3275574380b', 32)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (159, N'357ef6ac-ee77-4787-b898-b1f307cd1a8e', 32)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (160, N'061e5780-acf5-4943-a027-7e5012205d28', 32)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (161, N'54988b7f-6ca6-4c7c-8bcf-7fa85dc684e9', 33)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (162, N'a183ab44-ac5f-40ba-a381-e57c17b1693b', 33)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (163, N'f3c38620-7156-4fc8-9f61-df9eb8ee01bb', 33)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (164, N'7d40826c-fadc-4052-9849-7ffea9fc873d', 33)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (165, N'17b50ce5-5b02-4956-b5cf-973add3dd04e', 33)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (166, N'58c7810f-ec56-465e-9d7b-5d8a32fa8a3c', 34)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (167, N'90efefdb-21c9-4897-b51a-038305795117', 34)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (168, N'745592aa-db4f-45f7-bcc4-d8bbbc2bcc9a', 34)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (169, N'6fb081e2-6734-4d7a-8f79-4d460de62dcd', 34)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (170, N'fcc17172-33dc-4ce7-9285-c631b454d736', 34)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (171, N'6c02a8c6-f93b-439f-9d40-10d1f83c0314', 35)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (172, N'a76f0d79-435c-4b1f-a5df-955ded84a5a3', 35)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (173, N'415b6b63-17ed-4e4c-be51-682e1a58a694', 35)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (174, N'bcc97821-3441-4617-9075-76be052dd4ec', 35)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (175, N'eef35e34-b73c-4fe1-b857-097646f9e976', 35)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (176, N'5bb5dc95-cbcf-442e-8659-20e62481324b', 36)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (177, N'b4b6c700-91bb-4610-bfff-a5b774429c6d', 36)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (178, N'163b2249-6be6-4951-a015-bda649dec095', 36)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (179, N'78184c64-12d0-4dda-9b36-1b3e594e7f97', 36)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (180, N'd322b9be-ee37-4f16-946b-8b3e4de66447', 36)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (181, N'3ddb82f1-7d01-4ffe-afcb-a960b29ea3e7', 37)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (182, N'4ca6dd89-cd7c-4426-82f8-77d8cf40f798', 37)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (183, N'c1dbe428-4aae-4717-b512-6a220b89660a', 37)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (184, N'bedb7ebe-dd05-4902-9ed4-f49294acb9a3', 37)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (185, N'805415de-82cb-471f-a662-528671bf2386', 37)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (186, N'e2ec90f3-96c8-4d84-b9cd-bbbd168a5762', 38)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (187, N'dfe7a164-0407-409e-89df-712bb8439347', 38)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (188, N'6dedf026-af98-4819-a0e7-5837885c7238', 38)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (189, N'612e3435-4b4b-44d2-861f-ad32cf9c2e17', 38)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (190, N'6c18e8f3-f410-4659-af19-2596104e94a8', 38)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (191, N'0970bc0e-fcce-4806-8d5e-009cb08b577c', 39)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (192, N'd21763af-c541-4a09-8ded-2e03b3604dc8', 39)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (193, N'b65bd92e-7cf9-4377-82d2-2ce8e7044e26', 39)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (194, N'f4014a00-7348-4b6b-933f-41ba4c106fb1', 39)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (195, N'f2004541-88c5-46e9-9e86-5e7adc1cd69f', 39)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (196, N'f1d438f6-9697-4134-8e82-d249075f69cf', 40)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (197, N'078516e0-02fe-419e-8e91-532b1f3ef254', 40)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (198, N'84817459-3594-41bc-b2f5-2d85ca3e6813', 40)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (199, N'21daa338-a03d-4766-8044-89d73c5cf7a9', 40)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (200, N'bf5da74b-4cfe-4a27-b792-7eca5f8ff34b', 40)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (201, N'c0b89e57-bc4e-4233-b0ca-04ed7b73cb2d', 41)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (202, N'edf16170-a41a-4693-9d6a-aebbac2ec5e5', 41)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (203, N'8202764e-4f3e-426c-b3dd-ca2f24a76d69', 41)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (204, N'283b6037-08ae-4c93-8153-d4fe9314f713', 41)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (205, N'9032f535-7e7b-4f50-acfd-34c649af158c', 41)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (206, N'92f215d9-64d5-4eeb-83b8-e050a81561f3', 42)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (207, N'58019c5b-1729-4065-8ea1-378b74cae70f', 42)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (208, N'77a135c4-fada-4dc0-bd7e-3fe5a388b327', 42)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (209, N'7162e7e4-ab99-40a2-b2a3-c97f7322839e', 42)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (210, N'6e810729-3314-4214-bd36-44f73922af2a', 42)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (211, N'0f26470f-fdf0-45c7-b2a5-14430e41acbc', 43)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (212, N'ad30e501-4d1d-4dd0-a904-d3341b25139c', 43)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (213, N'012db999-7263-4aeb-afcc-8e79d0819849', 43)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (214, N'a47897a7-9c72-47bb-afd9-96786d63c549', 43)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (215, N'b759c98a-ef23-4991-b041-18e6f29e9845', 43)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (216, N'2089b97f-8ade-4244-9510-446a83fa9de1', 44)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (217, N'56584544-705e-4526-aba5-7f9988df7ab5', 44)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (218, N'7c32edf4-d69a-4723-bfe6-83c04ad5eb93', 44)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (219, N'160951fc-f6fe-496d-b50a-a494baee6e40', 44)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (220, N'98c61b59-1b64-47a9-acb5-0424737b0a99', 44)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (221, N'6d8be032-bc3d-42f8-ac69-c00cf8f67ab9', 45)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (222, N'490399a9-c9d7-4ce2-886b-a28e2ac787ae', 45)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (223, N'5a3e637f-39bb-4a9a-b1e7-0fd146eaafe7', 45)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (224, N'b1f3c396-8e3c-44f9-a29b-654e771faebc', 45)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (225, N'2859b268-0d14-4ab1-9cf9-eda9abe521f7', 45)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (226, N'430afb18-838a-49de-bd5c-05a9dcff2e00', 46)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (227, N'5187e95d-47a1-4fb5-9419-974b390d5706', 46)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (228, N'6cb7d2e9-bef3-41ba-892a-49be5fb281e3', 46)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (229, N'569d086f-4526-4cc8-926f-3eae4bade9f5', 46)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (230, N'e2fabf02-00be-4bd7-b067-f08179d95c21', 46)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (231, N'46c6a28e-f97e-411a-8302-ddc7e188b069', 47)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (232, N'36c6fdf6-4499-4dfc-8647-06abf8a5d6a2', 47)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (233, N'f7425862-f202-4240-a262-20c953721539', 47)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (234, N'9e602d99-57be-4ae0-a01e-0805403dde22', 47)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (235, N'c3aa9f70-cfbd-4f9b-bb29-ca219bb89356', 47)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (236, N'4f8bb20f-2189-4b09-aa66-34f0f26782d3', 48)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (237, N'ce15c3ef-e2d8-459b-846c-c582be3b0261', 48)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (238, N'c94a65ce-626b-453a-99fd-b886e505fcb0', 48)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (239, N'3a753405-21e4-4de3-ba38-846e8cb8e8db', 48)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (240, N'e07c9a84-6f3d-4b03-89ee-d9fc5ba6e983', 48)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (241, N'74cc0045-5f23-4128-99a0-e9bfce28f421', 49)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (242, N'9b710933-7cdf-4eec-a9c1-566c1c28c65e', 49)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (243, N'f407790d-e246-416e-b4c7-6751503b8d27', 49)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (244, N'208947a6-8f7a-4076-aa0e-09048611bcd6', 49)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (245, N'75568c8c-f564-4d19-87d4-de617bfd3bec', 49)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (246, N'92298acd-cb8f-43a6-8e6d-cd893876ab4d', 50)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (247, N'7730f7d2-65ad-41ed-a43c-f5f28dd7ad11', 50)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (248, N'afe00580-b424-428d-8550-92aaa6e508da', 50)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (249, N'60853917-d201-428a-a635-bde942826a79', 50)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (250, N'8b48e6fe-22d1-4ad2-a160-e282a9b893fa', 50)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (251, N'c03b6b6b-6438-441b-a1b8-00d17970fc3a', 51)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (252, N'217a9f61-25fd-42f7-ae84-580115218966', 51)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (253, N'c630dbf1-9ca2-40d6-9d71-569524948750', 51)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (254, N'b94b6268-148b-4ef5-91a7-c82d8c3e61b8', 51)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (255, N'f9df2e36-ffff-4ebd-87a7-2a4182b8837d', 51)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (256, N'1dae1baf-ca5e-44bc-95a7-638684a4bb01', 52)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (257, N'02a29713-e0b9-4371-8651-2147215397c8', 52)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (258, N'f164809d-5fe0-4a43-b380-018a6ff89eca', 52)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (259, N'48a928a1-de79-4f63-a7a3-a07328981073', 52)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (260, N'2583639d-dfb9-4283-a052-309dbd234651', 52)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (261, N'c87c460d-7726-482f-a603-7da1516418ec', 53)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (262, N'50981ffd-9d3b-4e17-bf2c-ff272553ead8', 53)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (263, N'cd69038c-74c8-4157-974b-ded87f707f30', 53)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (264, N'eaef983a-ddd5-4154-a751-f4702f170ea1', 53)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (265, N'2a14b067-a819-44cb-aca1-d1a586433ed2', 53)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (266, N'4b7b87b9-c988-4b46-b340-13f4a6767885', 54)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (267, N'96804e24-4def-465a-bb8b-f71ff107bec4', 54)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (268, N'a8639db7-61de-4774-af9a-0a59140525ce', 54)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (269, N'd91b7ecc-2593-4a1b-99f6-9ec7ee5cbc76', 54)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (270, N'a341bfb0-4db6-466a-896d-db80a5cf6ed1', 54)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (271, N'10264c33-e6bb-49a0-b792-be6a35d4588d', 55)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (272, N'4a25b449-c534-4ce8-898b-894e6f2874af', 55)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (273, N'b745aae3-428b-4052-8868-6cae121b018c', 55)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (274, N'b3891b4e-031d-47de-89d3-9b222c76099d', 55)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (275, N'2a14aa87-6d93-4536-b95b-e8484313e38a', 55)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (276, N'b0bb0ab1-55bd-42ba-96e1-18da847c2dee', 56)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (277, N'f0ca464c-0c5d-4d19-bed5-c8f6ec56f510', 56)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (278, N'd9fd4490-1e23-4719-a6fd-fde3fc0e636e', 56)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (279, N'1a859a05-fc0f-4ad6-a5e3-6bd0750587d3', 56)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (280, N'1d6671ad-a550-418e-83ac-bf5ab7dc3a3c', 56)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (281, N'2f36d319-05d7-424e-af0a-bd0b6f686182', 57)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (282, N'c5499b9c-9e80-4314-b99d-b431436ac895', 57)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (283, N'26e84f3b-cf6c-4e3c-a5b1-c5b1c6705625', 57)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (284, N'8b2f0f9b-8027-4a25-b4cd-710345b6880b', 57)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (285, N'11a9c79e-af8a-4b1d-b14a-eab9f9721aac', 57)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (286, N'b6f1593b-05bb-4978-adcc-67e75fad0773', 58)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (287, N'a068fdb4-68f2-4ad3-811f-7a173d902311', 58)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (288, N'60610e9e-5123-4e3c-99ba-923a82a5894d', 58)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (289, N'd9dcad2b-d2bf-4ba1-ac72-c3d379c26501', 58)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (290, N'86ed3f78-8db5-4728-98a5-4a10899d3d2b', 58)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (291, N'd6a13022-299c-4611-a7b6-73e40b7c6afa', 59)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (292, N'9c1cf046-2a28-4bd0-a5d5-754b29433ba4', 59)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (293, N'63b135df-8d77-481a-83a4-4835da83fc6b', 59)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (294, N'2efb9618-e42b-42f8-92c3-d90951a75aed', 59)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (295, N'9a5e415c-de62-41f3-b642-1fa145a1f411', 59)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (296, N'd5f4962e-9ab7-4d6f-80c1-af7b360559cf', 60)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (297, N'6c44edcb-1703-4091-96b8-fc07fb1e4542', 60)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (298, N'9eb552ec-1413-4e15-827e-7750d7c3a87d', 60)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (299, N'7587ffac-0cd1-4331-bf8b-f82aca8e8e37', 60)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (300, N'8eded9cc-39ad-49d6-aee6-e8a2cae49fed', 60)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (301, N'448e1036-520c-43fe-a2c0-b6be9c2f966a', 61)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (302, N'394dd9eb-7855-4bcf-9188-a9178caa6156', 61)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (303, N'd63fb99d-944e-42bb-af61-1fb8546cbacf', 61)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (304, N'39a214a0-3b68-482a-992d-65c3b28a5d73', 61)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (305, N'631250ae-029b-4e48-98cd-c48d90cc7b5e', 61)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (306, N'58db123b-c6c0-4391-bade-606dc457bfde', 62)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (307, N'7022971a-684d-4839-897b-9764818e06b4', 62)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (308, N'30eb9c0f-79bc-4d27-a57e-7bf70a29e3a4', 62)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (309, N'8e4031ab-5816-464a-9462-7a3456915265', 62)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (310, N'cf1d34b8-0c48-40c8-b8d4-caabad087708', 62)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (311, N'9e7d007d-6946-4498-8638-221734b00873', 63)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (312, N'b3c13c61-023a-4335-8cae-d0c5f3d6934f', 63)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (313, N'62abf82a-ee5e-43cb-86c8-2d0db9a7ef02', 63)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (314, N'3e5af3e2-ddde-4a2b-85e8-b6f01eb096dd', 63)
GO
INSERT [dbo].[room_photo] ([id], [uuid], [fk_room_id]) VALUES (315, N'34862e54-d23b-489e-8622-0a5bf4b4a6a2', 63)
GO
SET IDENTITY_INSERT [dbo].[room_photo] OFF
GO

UPDATE [dbo].[room] SET [fk_front_cover_id] = ([id] - 1) * 5 + 1

INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (1, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (1, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (1, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (1, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (1, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (1, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (2, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (2, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (2, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (2, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (2, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (2, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (3, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (3, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (3, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (3, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (3, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (3, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (4, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (4, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (4, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (4, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (4, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (4, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (5, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (5, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (6, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (6, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (6, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (7, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (7, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (7, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (7, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (7, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (7, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (8, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (8, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (8, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (8, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (8, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (8, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (9, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (9, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (9, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (9, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (9, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (9, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (10, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (10, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (10, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (10, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (10, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (10, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (11, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (11, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (11, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (11, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (12, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (12, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (12, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (12, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (12, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (12, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (13, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (13, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (13, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (13, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (13, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (14, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (14, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (14, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (14, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (14, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (15, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (15, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (15, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (15, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (15, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (16, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (16, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (16, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (16, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (17, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (17, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (17, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (17, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (17, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (17, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (18, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (18, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (18, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (18, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (18, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (18, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (19, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (19, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (19, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (19, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (19, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (19, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (20, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (20, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (20, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (20, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (20, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (20, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (21, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (21, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (21, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (21, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (21, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (21, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (23, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (23, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (23, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (23, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (24, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (24, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (24, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (24, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (24, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (24, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (22, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (22, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (22, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (25, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (25, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (25, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (30, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (30, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (30, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (30, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (32, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (32, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (32, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (32, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (34, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (34, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (34, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (34, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (35, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (35, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (35, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (35, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (44, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (44, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (44, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (44, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (53, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (53, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (53, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (53, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (53, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (56, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (56, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (56, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (56, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (57, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (57, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (57, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (60, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (60, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (60, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (60, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (62, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (62, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (62, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (62, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (62, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (62, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (63, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (63, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (63, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (63, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (63, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (63, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (25, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (26, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (26, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (26, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (27, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (27, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (27, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (27, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (27, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (27, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (28, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (28, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (28, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (28, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (29, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (29, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (29, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (29, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (31, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (31, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (31, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (31, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (33, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (33, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (33, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (33, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (36, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (36, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (36, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (37, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (37, 5)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (37, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (37, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (37, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (37, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (39, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (39, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (39, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (39, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (40, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (40, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (40, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (40, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (41, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (41, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (41, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (41, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (42, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (42, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (42, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (43, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (43, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (43, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (43, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (45, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (45, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (45, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (46, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (46, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (46, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (46, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (47, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (47, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (47, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (47, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (48, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (48, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (48, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (48, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (49, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (49, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (49, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (49, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (50, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (50, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (50, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (50, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (50, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (51, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (51, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (51, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (52, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (52, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (52, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (52, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (52, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (54, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (54, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (54, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (54, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (54, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (55, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (55, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (55, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (55, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (58, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (58, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (58, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (58, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (58, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (59, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (59, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (59, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (59, 1)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (61, 6)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (61, 4)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (61, 3)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (61, 2)
GO
INSERT [dbo].[room_to_room_device] ([fk_room_id], [fk_room_device_id]) VALUES (61, 1)
GO

INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (1, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (1, 2)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (1, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (2, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (2, 2)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (2, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (3, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (3, 2)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (3, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (4, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (4, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (5, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (5, 2)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (5, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (6, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (6, 2)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (6, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (7, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (8, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (9, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (9, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (10, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (11, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (12, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (13, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (13, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (14, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (15, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (15, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (16, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (16, 2)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (16, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (17, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (17, 2)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (17, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (19, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (25, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (26, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (27, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (30, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (30, 2)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (30, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (32, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (34, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (35, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (44, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (53, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (56, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (57, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (57, 2)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (57, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (60, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (60, 2)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (62, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (62, 2)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (62, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (63, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (63, 2)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (63, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (28, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (29, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (31, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (31, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (33, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (36, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (37, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (37, 2)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (37, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (38, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (39, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (40, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (41, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (42, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (43, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (45, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (46, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (46, 2)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (46, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (47, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (47, 2)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (47, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (48, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (49, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (50, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (51, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (52, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (52, 2)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (52, 1)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (54, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (55, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (58, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (59, 3)
GO
INSERT [dbo].[room_to_room_restrict] ([fk_room_id], [fk_room_restrict_id]) VALUES (61, 3)
GO

INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (1, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (1, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (2, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (2, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (3, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (3, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (4, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (4, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (5, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (6, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (7, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (7, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (8, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (10, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (10, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (11, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (12, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (12, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (13, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (14, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (15, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (15, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (16, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (17, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (17, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (19, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (19, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (20, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (24, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (24, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (22, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (25, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (25, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (26, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (30, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (32, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (34, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (35, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (44, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (53, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (56, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (57, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (60, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (62, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (62, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (63, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (26, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (27, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (27, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (29, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (31, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (31, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (33, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (36, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (36, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (37, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (40, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (41, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (42, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (43, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (43, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (45, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (46, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (47, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (47, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (48, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (49, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (50, 2)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (50, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (51, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (52, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (54, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (55, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (58, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (59, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (61, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (28, 1)
GO
INSERT [dbo].[room_to_room_serve] ([fk_room_id], [fk_room_serve_id]) VALUES (39, 1)
GO


-- Insert orders
INSERT "room_comment" (
    "fk_room_id",
    "fk_author_id",
    "content_text",
    "point"
)
VALUES
(23, 3, '<p>舒適的房間</p>', 5),
(23, 4, '<p>很喜歡</p><p>下次會再來</p>', 5),
(23, 5, '<p>房間有蟑螂</p><p>&lt;script&gt;alert(123)&lt;/script&gt;</p>', 1)


INSERT INTO "order" (
    "fk_visitor_id",
    "fk_room_id",
    "check_in_datetime",
    "check_out_datetime",
    "adult_count",
    "child_count",
    "price",
    "fk_order_status_id",
    "fk_room_comment_id"
) VALUES
(8, 1, '2022-11-05 09:00:00', '2022-11-20 09:00:00', 1, 0, 10000, 2, NULL),
(12, 23, '2022-12-05 09:00:00', '2022-12-07 09:00:00', 1, 0, 10000, 2, NULL),
(12, 23, '2022-11-01 09:00:00', '2022-11-10 09:00:00', 1, 0, 10000, 3, NULL),
(12, 23, '2022-09-01 09:00:00', '2022-09-02 09:00:00', 1, 0, 10000, 4, NULL),
(3, 23, '2022-08-01 09:00:00', '2022-08-02 09:00:00', 1, 0, 10000, 5, 1),
(4, 23, '2022-07-01 09:00:00', '2022-07-02 09:00:00', 1, 0, 10000, 5, 2),
(5, 23, '2022-10-01 09:00:00', '2022-10-02 09:00:00', 1, 0, 10000, 5, 3),
(13, 17, '2022-10-30 09:00:00', '2022-11-01 09:00:00', 1, 0, 9990, 4, NULL),
(13, 17, '2022-11-30 09:00:00', '2022-12-01 09:00:00', 1, 0, 6660, 2, NULL),
(14, 24, '2023-01-11 09:00:00', '2023-01-19 09:00:00', 1, 0, 799992, 1, NULL)


-- chatroom
SET IDENTITY_INSERT [dbo].[chatroom] ON 
GO
INSERT [dbo].[chatroom] ([id], [fk_account_larger_id], [fk_account_smaller_id]) VALUES (1, 14, 12)
GO
SET IDENTITY_INSERT [dbo].[chatroom] OFF
GO

SET IDENTITY_INSERT [dbo].[chat_detail] ON 
GO
INSERT [dbo].[chat_detail] ([id], [fk_chatroom_id], [fk_speaker_id], [content_text], [created_at], [status]) VALUES (1, 1, 12, N'感謝你的訂單,期待你的造訪如有相關問題可以在這裡告訴我~', CAST(N'2022-11-08T13:29:04.523' AS DateTime), 1)
GO
INSERT [dbo].[chat_detail] ([id], [fk_chatroom_id], [fk_speaker_id], [content_text], [created_at], [status]) VALUES (2, 1, 12, N'你好，我想確認一下今天的check in時間', CAST(N'2022-11-08T13:35:33.510' AS DateTime), 0)
GO
INSERT [dbo].[chat_detail] ([id], [fk_chatroom_id], [fk_speaker_id], [content_text], [created_at], [status]) VALUES (3, 1, 12, N'今天下午3點後都可以check in唷', CAST(N'2022-11-08T13:36:16.090' AS DateTime), 0)
GO
INSERT [dbo].[chat_detail] ([id], [fk_chatroom_id], [fk_speaker_id], [content_text], [created_at], [status]) VALUES (4, 1, 12, N'請問大概什麼時候會到呢', CAST(N'2022-11-08T13:36:33.723' AS DateTime), 0)
GO
INSERT [dbo].[chat_detail] ([id], [fk_chatroom_id], [fk_speaker_id], [content_text], [created_at], [status]) VALUES (5, 1, 12, N'還不確定，等快到了再通知你', CAST(N'2022-11-08T13:36:52.360' AS DateTime), 0)
GO
INSERT [dbo].[chat_detail] ([id], [fk_chatroom_id], [fk_speaker_id], [content_text], [created_at], [status]) VALUES (6, 1, 12, N'好的', CAST(N'2022-11-08T13:37:00.593' AS DateTime), 0)
GO
INSERT [dbo].[chat_detail] ([id], [fk_chatroom_id], [fk_speaker_id], [content_text], [created_at], [status]) VALUES (7, 1, 12, N'感謝', CAST(N'2022-11-08T13:37:03.980' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[chat_detail] OFF
GO

USE "master"


/********************************
*           Workarea            *
********************************/
-- USE "Bearbnb"