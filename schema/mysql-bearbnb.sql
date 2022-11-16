/********************************
*         Create Database       *
********************************/
DROP DATABASE `Bearbnb`
CREATE DATABASE `Bearbnb`
GO

USE `Bearbnb`


/********************************
*         Remove Tables         *
********************************/
/*
DROP TABLE "hello"

ALTER TABLE "room"
    DROP CONSTRAINT "fk_room_front_cover_to_photo"

DROP TABLE "order"
DROP TABLE "order_status"
DROP TABLE "room_photo"
DROP TABLE "room_to_room_restrict"
DROP TABLE "room_restrict"
DROP TABLE "room_to_room_device"
DROP TABLE "room_device"
DROP TABLE "room_to_room_serve"
DROP TABLE "room_serve"
DROP TABLE "room_comment"
DROP TABLE "room_information"
DROP TABLE "room_type"
DROP TABLE "room"
DROP TABLE "room_status"
DROP TABLE "city"
DROP TABLE "account_photo"
DROP TABLE "chat_detail"
DROP TABLE "chatroom"
DROP TABLE "account_information"
DROP TABLE "account"
DROP TABLE "account_status"
DROP TABLE "account_identity"
*/


/********************************
*         Create Tables         *
********************************/
CREATE TABLE `hello` (
    `id`                    BIGINT              PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `uuid`                  VARCHAR(36)          NOT NULL UNIQUE,
    `greeting`              NVARCHAR(63)        NOT NULL DEFAULT 'hello, world.',
    `created_at`            DATETIME            NOT NULL DEFAULT NOW()
)

CREATE TRIGGER `hello_before_insert` 
BEFORE INSERT ON `hello` FOR EACH ROW 
BEGIN
  IF new.uuid IS NULL THEN
    SET new.uuid = uuid();
  END IF;
END;

CREATE TABLE `account_identity` (
    `id`                    INT                 PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)         NOT NULL UNIQUE
)

CREATE TABLE `account_status` (
    `id`                    INT                 PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE
)

CREATE TABLE `account` (
    `id`                    BIGINT             PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `uuid`                  VARCHAR(36)          NOT NULL UNIQUE,
    `username`              VARCHAR(255)        NOT NULL UNIQUE,
    `password`              VARCHAR(255)			CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `fk_account_identity_id`
                            INT         	    DEFAULT NULL,
    `fk_account_status_id`  INT                 DEFAULT NULL,
    `created_at`            DATETIME            NOT NULL DEFAULT NOW(),
    `salt`                  VARCHAR(255)        DEFAULT NULL,

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
END;

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

CREATE TABLE `account_photo`(
 `id`                    INT                 PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
 `uuid`                  VARCHAR(36)          NOT NULL UNIQUE,
 `fk_account_id`         BIGINT              NOT NULL UNIQUE,
 FOREIGN KEY( `fk_account_id` )              REFERENCES `account`( `id` )
)

CREATE TRIGGER `account_photo_before_insert` 
BEFORE INSERT ON `account_photo` FOR EACH ROW 
BEGIN
  IF new.uuid IS NULL THEN
    SET new.uuid = uuid();
  END IF;
END;

CREATE TABLE `chatroom` (
    `id`                    BIGINT              PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `fk_account_larger_id`  BIGINT              NOT NULL,
    `fk_account_smaller_id` BIGINT              NOT NULL,

    FOREIGN KEY( `fk_account_larger_id` )       REFERENCES `account`( `id` ),
    FOREIGN KEY( `fk_account_smaller_id` )      REFERENCES `account`( `id` )
)

CREATE TABLE `chat_detail` (
    `id`                    BIGINT              PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `fk_chatroom_id`        BIGINT              NOT NULL,
    `fk_speaker_id`         BIGINT              NOT NULL,
    `content_text`          NVARCHAR(1023)      NOT NULL,
    `created_at`            DATETIME            NOT NULL DEFAULT NOW(),

    FOREIGN KEY( `fk_chatroom_id` )             REFERENCES `chatroom`( `id` ),
    FOREIGN KEY( `fk_speaker_id` )              REFERENCES `account`( `id` )
)


CREATE TABLE `city` (
    `id`                    INT                 PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE
)

CREATE TABLE `room_status` (
    `id`                    INT                 PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE
)

CREATE TABLE `room` (
    `id`                    BIGINT              PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `uuid`                  VARCHAR(36)         NOT NULL UNIQUE,
    `fk_city_id`            INT                 DEFAULT NULL,
    `address`               NVARCHAR(255)       NOT NULL,
    `fk_room_status_id`     INT                 DEFAULT NULL,
    `fk_front_cover_id`     BIGINT              DEFAULT NULL,
    `price`                 INT                 NOT NULL,
	`fk_owner_id`           BIGINT              NOT NULL,

    FOREIGN KEY( `fk_owner_id` )                REFERENCES `account`( `id` ),
    FOREIGN KEY( `fk_city_id` )                 REFERENCES `city`( `id` )
                                                    ON DELETE SET NULL,
    FOREIGN KEY( `fk_room_status_id` )          REFERENCES `room_status`( `id` )
                                                    ON DELETE SET NULL																				
)

CREATE TRIGGER `room_before_insert` 
BEFORE INSERT ON `room` FOR EACH ROW 
BEGIN
  IF new.uuid IS NULL THEN
    SET new.uuid = uuid();
  END IF;
END;



CREATE TABLE `room_type` (
    `id`                    INT                 PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE,
    `lower_limit_price`     INT                 DEFAULT NULL,
    `upper_limit_price`     INT                 DEFAULT NULL
)

CREATE TABLE `room_information` (
    `id`                    BIGINT              PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `fk_room_id`            BIGINT              NOT NULL UNIQUE,
    `title`                 NVARCHAR(255)       NOT NULL,
    `fk_room_type_id`       INT                 DEFAULT NULL,
    `longitude`             FLOAT               NOT NULL,
    `latitude`              FLOAT               NOT NULL,
		`max_people_capacity`   INT                 DEFAULT NULL,
    `min_people_capacity`   INT                 DEFAULT NULL,
    `single_size_bed_count` INT                 DEFAULT NULL,
    `double_size_bed_count` INT                 DEFAULT NULL,
    `floor_mattress_count`  INT                 DEFAULT NULL,
    `bedroom_count`         INT                 DEFAULT NULL,
    `bathroom_count`        INT                 DEFAULT NULL,
    `area`                  FLOAT               DEFAULT NULL,
    `introduction`          NVARCHAR(2047)      DEFAULT NULL,
    FOREIGN KEY( `fk_room_id` )                 REFERENCES `room`( `id` ),
    FOREIGN KEY( `fk_room_type_id` )            REFERENCES `room_type`( `id` )
                                                    ON DELETE SET NULL
)

CREATE TABLE `room_comment` (
    `id`                    BIGINT              PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `fk_room_id`            BIGINT              NOT NULL,
    `fk_author_id`          BIGINT              NOT NULL,
    `content_text`          NVARCHAR(1023)      NOT NULL,
    `point`                 INT                 NOT NULL,
    `created_at`            DATETIME            NOT NULL DEFAULT NOW(),
    FOREIGN KEY( `fk_room_id` )                 REFERENCES `room`( `id` ),
    FOREIGN KEY( `fk_author_id` )               REFERENCES `account`( `id` )
)

CREATE TABLE `room_serve` (
    `id`                    INT                PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE
		`icon_tag`              VARCHAR(255)        NOT NULL UNIQUE

)



CREATE TABLE `room_to_room_serve` (
    `fk_room_id`            BIGINT              NOT NULL,
    `fk_room_serve_id`    INT                 NOT NULL,

    FOREIGN KEY( `fk_room_id` )                 REFERENCES `room`( `id` ),
    FOREIGN KEY( `fk_room_serve_id` )         REFERENCES `room_serve`( `id` )
)

CREATE TABLE `room_device` (
    `id`                    INT                 PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE
)

CREATE TABLE `room_to_room_device` (
    `fk_room_id`            BIGINT              NOT NULL,
    `fk_room_device_id`     INT                 NOT NULL,

    FOREIGN KEY( `fk_room_id` )                 REFERENCES `room`( `id` ),
    FOREIGN KEY( `fk_room_device_id` )          REFERENCES `room_device`( `id` )
)

CREATE TABLE `room_restrict` (
    `id`                    INT                PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE
		)

CREATE TABLE `room_to_room_restrict` (
    `fk_room_id`            BIGINT              NOT NULL,
    `fk_room_restrict_id`   INT                 NOT NULL,

    FOREIGN KEY( `fk_room_id` )                 REFERENCES `room`( `id` ),
    FOREIGN KEY( `fk_room_restrict_id` )        REFERENCES `room_restrict`( `id` )
)

CREATE TABLE `room_photo` (
    `id`                    BIGINT              PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `uuid`                  VARCHAR(36)         NOT NULL UNIQUE,
    `fk_room_id`            BIGINT              NOT NULL,

    FOREIGN KEY( `fk_room_id` )                 REFERENCES `room`( `id` )
)

CREATE TRIGGER `room_photo_before_insert` 
BEFORE INSERT ON `room_photo` FOR EACH ROW 
BEGIN
  IF new.uuid IS NULL THEN
    SET new.uuid = uuid();
  END IF;
END;

ALTER TABLE `room`
    ADD CONSTRAINT `fk_room_front_cover_to_photo`
        FOREIGN KEY (`fk_front_cover_id`) REFERENCES `room_photo`( `id` )
                                            ON DELETE SET NULL



CREATE TABLE `order_status` (
    `id`                    INT                 PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE
)

CREATE TABLE `order` (
    `id`                    BIGINT              PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT, 
    `uuid`                  VARCHAR(36)         NOT NULL UNIQUE, 
    `fk_visitor_id`         BIGINT              NOT NULL, 
    `fk_room_id`            BIGINT              NOT NULL, 
    `check_in_datetime`     DATETIME            NOT NULL, 
    `check_out_datetime`    DATETIME            NOT NULL,
    `created_at`            DATETIME            NOT NULL DEFAULT NOW(), 
    `adult_count`           INT                 NOT NULL, 
    `child_count`           INT                 NOT NULL,
    `price`                 INT                 NOT NULL,
    `fk_order_status_id`    INT                 DEFAULT NULL, 
    `fk_room_comment_id`    BIGINT              DEFAULT NULL, 

    FOREIGN KEY( `fk_visitor_id` )              REFERENCES `account`( `id` ),
    FOREIGN KEY( `fk_room_id` )                 REFERENCES `room`( `id` ),
    FOREIGN KEY( `fk_order_status_id` )         REFERENCES `order_status`( `id` )
                                                    ON DELETE SET NULL,
    FOREIGN KEY( `fk_room_comment_id` )         REFERENCES `room_comment`( `id` )
                                                    ON DELETE SET NULL
)

CREATE TRIGGER `order_before_insert` 
BEFORE INSERT ON `order` FOR EACH ROW 
BEGIN
  IF new.uuid IS NULL THEN
    SET new.uuid = uuid();
  END IF;
END;
