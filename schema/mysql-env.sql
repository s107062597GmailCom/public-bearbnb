/********************************
*        Create Database        *
********************************/
CREATE DATABASE IF NOT EXISTS `Bearbnb`;

USE `Bearbnb`;


/********************************
*         Remove Tables         *
********************************/
ALTER TABLE `room`
    DROP CONSTRAINT `fk_room_front_cover_to_photo`;

DROP TABLE IF EXISTS `wish`;

DROP TABLE IF EXISTS `hello`;

DROP TABLE IF EXISTS `order`;

DROP TABLE IF EXISTS `order_status`;

DROP TABLE IF EXISTS `room_photo`;

DROP TABLE IF EXISTS `room_to_room_restrict`;

DROP TABLE IF EXISTS `room_restrict`;

DROP TABLE IF EXISTS `room_to_room_device`;

DROP TABLE IF EXISTS `room_device`;

DROP TABLE IF EXISTS `room_to_room_serve`;

DROP TABLE IF EXISTS `room_serve`;

DROP TABLE IF EXISTS `room_comment`;

DROP TABLE IF EXISTS `room_information`;

DROP TABLE IF EXISTS `room_type`;

DROP TABLE IF EXISTS `room`;

DROP TABLE IF EXISTS `room_status`;

DROP TABLE IF EXISTS `city`;

DROP TABLE IF EXISTS `account_photo`;

DROP TABLE IF EXISTS `chat_detail`;

DROP TABLE IF EXISTS `chatroom`;

DROP TABLE IF EXISTS `account_information`;

DROP TABLE IF EXISTS `account`;

DROP TABLE IF EXISTS `account_status`;

DROP TABLE IF EXISTS `account_identity`;


/********************************
*         Create Tables         *
********************************/
CREATE TABLE IF NOT EXISTS `hello` (
    `id`                    BIGINT              PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `uuid`                  VARCHAR(36)         NOT NULL UNIQUE,
    `greeting`              NVARCHAR(63)        NOT NULL DEFAULT 'hello, world.',
    `created_at`            DATETIME            NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS `account_identity` (
    `id`                    INT                 PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS `account_status` (
    `id`                    INT                 PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS `account` (
    `id`                    BIGINT              PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `uuid`                  VARCHAR(36)         NOT NULL UNIQUE,
    `username`              VARCHAR(255)        NOT NULL UNIQUE,
    `password`              VARCHAR(255)		CHARACTER SET utf8 COLLATE utf8_bin
												NOT NULL,
    `fk_account_identity_id`
                            INT         	    DEFAULT NULL,
    `fk_account_status_id`  INT                 DEFAULT NULL,
    `created_at`            DATETIME            NOT NULL DEFAULT NOW(),
    `salt`                  VARCHAR(255)        DEFAULT NULL,

    FOREIGN KEY( `fk_account_identity_id` )     REFERENCES `account_identity`( `id` )
                                                    ON DELETE SET NULL,
    FOREIGN KEY( `fk_account_status_id` )       REFERENCES `account_status`( `id` )
                                                    ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS `account_information` (
    `id`                    BIGINT              PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `fk_account_id`         BIGINT              NOT NULL UNIQUE,
    `first_name`            NVARCHAR(255)       NOT NULL,
    `last_name`             NVARCHAR(255)       NOT NULL,
    `gender`                CHAR                DEFAULT NULL,
    `phone_number`          VARCHAR(63)         NOT NULL UNIQUE,
    `email`                 VARCHAR(255)        NOT NULL UNIQUE,
    `birthday`              DATE                DEFAULT NULL,

    FOREIGN KEY( `fk_account_id` )              REFERENCES `account`( `id` )
);

CREATE TABLE IF NOT EXISTS `chatroom` (
    `id`                    BIGINT              PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `fk_account_larger_id`  BIGINT              NOT NULL,
    `fk_account_smaller_id` BIGINT              NOT NULL,

    FOREIGN KEY( `fk_account_larger_id` )       REFERENCES `account`( `id` ),
    FOREIGN KEY( `fk_account_smaller_id` )      REFERENCES `account`( `id` )
);

CREATE TABLE IF NOT EXISTS `chat_detail` (
    `id`                    BIGINT              PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `fk_chatroom_id`        BIGINT              NOT NULL,
    `fk_speaker_id`         BIGINT              NOT NULL,
    `content_text`          NVARCHAR(1023)      NOT NULL,
    `created_at`            DATETIME            NOT NULL DEFAULT NOW(),
    `status`                INT                 DEFAULT 0,

    FOREIGN KEY( `fk_chatroom_id` )             REFERENCES `chatroom`( `id` ),
    FOREIGN KEY( `fk_speaker_id` )              REFERENCES `account`( `id` )
);

CREATE TABLE IF NOT EXISTS `account_photo` (
    `id`                    BIGINT              PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `uuid`                  VARCHAR(36)         NOT NULL UNIQUE,
    `fk_account_id`         BIGINT              NOT NULL UNIQUE,

    FOREIGN KEY( `fk_account_id` )              REFERENCES `account`( `id` )
);

CREATE TABLE IF NOT EXISTS `city` (
    `id`                    INT                 PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS `room_status` (
    `id`                    INT                 PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS `room` (
    `id`                    BIGINT              PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `uuid`                  VARCHAR(36)         NOT NULL UNIQUE,
    `fk_city_id`            INT                 DEFAULT NULL,
    `address`               NVARCHAR(255)       DEFAULT NULL,
    `fk_room_status_id`     INT                 DEFAULT NULL,
    `fk_front_cover_id`     BIGINT              DEFAULT NULL,
    `price`                 INT                 DEFAULT NULL,
    `fk_owner_id`           BIGINT              NOT NULL,

    FOREIGN KEY( `fk_owner_id` )                REFERENCES `account`( `id` ),
    FOREIGN KEY( `fk_city_id` )                 REFERENCES `city`( `id` )
                                                    ON DELETE SET NULL,
    FOREIGN KEY( `fk_room_status_id` )          REFERENCES `room_status`( `id` )
                                                    ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS `room_type` (
    `id`                    INT                 PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE,
    `lower_limit_price`     INT                 DEFAULT NULL,
    `upper_limit_price`     INT                 DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `room_information` (
    `id`                    BIGINT              PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `fk_room_id`            BIGINT              NOT NULL UNIQUE,
    `title`                 NVARCHAR(255)       DEFAULT NULL,
    `fk_room_type_id`       INT                 DEFAULT NULL,
    `longitude`             FLOAT               DEFAULT NULL,
    `latitude`              FLOAT               DEFAULT NULL,
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
);

CREATE TABLE IF NOT EXISTS `room_comment` (
    `id`                    BIGINT              PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `fk_room_id`            BIGINT              NOT NULL,
    `fk_author_id`          BIGINT              NOT NULL,
    `content_text`          NVARCHAR(1023)      NOT NULL,
    `point`                 INT                 NOT NULL,
    `created_at`            DATETIME            NOT NULL DEFAULT NOW(),

    FOREIGN KEY( `fk_room_id` )                 REFERENCES `room`( `id` ),
    FOREIGN KEY( `fk_author_id` )               REFERENCES `account`( `id` )
);

CREATE TABLE IF NOT EXISTS `room_serve` (
    `id`                    INT                 PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE,
    `icon_tag`              VARCHAR(255)        NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS `room_to_room_serve` (
    `fk_room_id`            BIGINT              NOT NULL,
    `fk_room_serve_id`      INT                 NOT NULL,

    FOREIGN KEY( `fk_room_id` )                 REFERENCES `room`( `id` ),
    FOREIGN KEY( `fk_room_serve_id` )           REFERENCES `room_serve`( `id` )
);

CREATE TABLE IF NOT EXISTS `room_device` (
    `id`                    INT                 PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE,
    `icon_tag`              VARCHAR(255)        NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS `room_to_room_device` (
    `fk_room_id`            BIGINT              NOT NULL,
    `fk_room_device_id`     INT                 NOT NULL,

    FOREIGN KEY( `fk_room_id` )                 REFERENCES `room`( `id` ),
    FOREIGN KEY( `fk_room_device_id` )          REFERENCES `room_device`( `id` )
);

CREATE TABLE IF NOT EXISTS `room_restrict` (
    `id`                    INT                 PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE,
    `icon_tag`              VARCHAR(255)        NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS `room_to_room_restrict` (
    `fk_room_id`            BIGINT              NOT NULL,
    `fk_room_restrict_id`   INT                 NOT NULL,

    FOREIGN KEY( `fk_room_id` )                 REFERENCES `room`( `id` ),
    FOREIGN KEY( `fk_room_restrict_id` )        REFERENCES `room_restrict`( `id` )
);

CREATE TABLE IF NOT EXISTS `room_photo` (
    `id`                    BIGINT              PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `uuid`                  VARCHAR(36)         NOT NULL UNIQUE,
    `fk_room_id`            BIGINT              NOT NULL,

    FOREIGN KEY( `fk_room_id` )                 REFERENCES `room`( `id` )
);

CREATE TABLE IF NOT EXISTS `order_status` (
    `id`                    INT                 PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `title`                 NVARCHAR(63)        NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS `order` (
    `id`                    BIGINT              PRIMARY KEY
                                                NOT NULL UNIQUE AUTO_INCREMENT,
    `uuid`                  VARCHAR(36)         NOT NULL UNIQUE DEFAULT ( UUID() ),
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
);

CREATE TABLE IF NOT EXISTS `wish` (
    `fk_account_id`         BIGINT              NOT NULL,
    `fk_room_id`            BIGINT              NOT NULL,

    FOREIGN KEY( `fk_account_id` )              REFERENCES `account`( `id` ),
    FOREIGN KEY( `fk_room_id` )                 REFERENCES `room`( `id` )
);

ALTER TABLE `room`
    ADD CONSTRAINT `fk_room_front_cover_to_photo`
        FOREIGN KEY ( `fk_front_cover_id` ) REFERENCES `room_photo`( `id` )
            ON DELETE SET NULL;
