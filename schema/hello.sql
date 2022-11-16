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





DROP DATABASE Bearbnb

CREATE DATABASE Bearbnb

USE Bearbnb

DROP DATABASE Beartest

CREATE DATABASE Beartest

USE Beartest

CREATE TABLE `account_identity` (
    `id`                    INT                 PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE
)

INSERT INTO `account_identity` (`title`)
VALUES ('admin');

INSERT INTO `account_identity`(`title`)
VALUES ('member');

CREATE TABLE `account_status` (
    `id`                    INT                 PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE
)

INSERT INTO `account_status`(`title`)
VALUES ('OPEN');

INSERT INTO `account_status`(`title`)
VALUES ('EXPIRED');

CREATE TABLE `account` (
    `id`                    BIGINT              PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
		`uuid`                  VARCHAR(36)         NOT NULL UNIQUE NOT NULL,
    `username`              VARCHAR(255)        NOT NULL UNIQUE,
    `password`              VARCHAR(255)		CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `fk_account_identity_id`    INT             DEFAULT NULL,
    `fk_account_status_id`  INT                 DEFAULT NULL,
    `created_at`            DATETIME            NOT NULL DEFAULT NOW(),
    `salt_at`               VARCHAR(255)        DEFAULT NULL,

    FOREIGN KEY( `fk_account_identity_id` )     REFERENCES `account_identity`( `id` )
                                                    ON DELETE SET NULL,
    FOREIGN KEY( `fk_account_status_id` )       REFERENCES `account_status`( `id` )
                                                    ON DELETE SET NULL
)

CREATE TRIGGER `account_before_insert`
BEFORE INSERT ON `account` FOR EACH ROW
BEGIN
  IF new.uuid IS NULL THEN
    SET new.uuid = uuid();
  END IF;
END;;

INSERT INTO `account`(`username`,`password`,`fk_account_identity_id`,`fk_account_status_id`)
VALUES ('Dhomos','dhomos0911',1,1);

INSERT INTO `account`(`username`,`password`,`fk_account_identity_id`,`fk_account_status_id`)
VALUES ('Jerry','JerrY666',2,1);

SELECT * FROM ACCOUNT

CREATE TABLE `account_information` (
    `id`                    BIGINT              PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `fk_account_id`         BIGINT              NOT NULL UNIQUE,
    `first_name`            NVARCHAR(255)       NOT NULL,
    `last_name`             NVARCHAR(255)       NOT NULL,
    `gender`                CHAR                DEFAULT NULL,
    `phone_number`          VARCHAR(63)         NOT NULL UNIQUE,
    `email`                 VARCHAR(255)        NOT NULL UNIQUE,
    `birthday`              DATE                DEFAULT NULL,

    FOREIGN KEY( `fk_account_id` )              REFERENCES `account`( `id` )
)

INSERT INTO `account_information`(`fk_account_id`,`first_name`,`last_name`,`gender`,`phone_number`,`email`,`birthday`)
VALUES (1,'宜陽','馮','m','0937463028','proviworld34@gmail.com','1996-09-11');

INSERT INTO `account_information`(`fk_account_id`,`first_name`,`last_name`,`gender`,`phone_number`,`email`,`birthday`)
VALUES (2,'Jerry','Dai','m','0966666666','jerryoop66@gmail.com','1990-07-04');

CREATE TABLE `order`(
     `id`                    BIGINT              PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
		 `title`                 NVARCHAR(63)        NOT NULL UNIQUE
)

SELECT * FROM `order`

INSERT INTO `order`(`title`)
VALUES('哈哈')