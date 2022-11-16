/********************************
*        Create Database        *
********************************/
-- IF EXISTS ( SELECT * FROM "sys"."databases" WHERE "name" = 'Bearbnb' )
-- BEGIN
--     USE "master"
--     DROP DATABASE "Bearbnb"
-- END

-- CREATE DATABASE "Bearbnb"
-- GO

USE "Bearbnb"


/********************************
*         Remove Tables         *
********************************/
IF OBJECT_ID ( 'dbo.fk_room_front_cover_to_photo' ) IS NOT NULL
    ALTER TABLE "room"
        DROP CONSTRAINT "fk_room_front_cover_to_photo"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'wish' )
    DROP TABLE "wish"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'hello' )
    DROP TABLE "hello"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'order' )
    DROP TABLE "order"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'order_status' )
    DROP TABLE "order_status"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_photo' )
    DROP TABLE "room_photo"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_to_room_restrict' )
    DROP TABLE "room_to_room_restrict"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_restrict' )
    DROP TABLE "room_restrict"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_to_room_device' )
    DROP TABLE "room_to_room_device"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_device' )
    DROP TABLE "room_device"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_to_room_serve' )
    DROP TABLE "room_to_room_serve"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_serve' )
    DROP TABLE "room_serve"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_comment' )
    DROP TABLE "room_comment"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_information' )
    DROP TABLE "room_information"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_type' )
    DROP TABLE "room_type"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room' )
    DROP TABLE "room"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'room_status' )
    DROP TABLE "room_status"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'city' )
    DROP TABLE "city"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'account_photo' )
    DROP TABLE "account_photo"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'chat_detail' )
    DROP TABLE "chat_detail"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'chatroom' )
    DROP TABLE "chatroom"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'account_information' )
    DROP TABLE "account_information"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'account' )
    DROP TABLE "account"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'account_status' )
    DROP TABLE "account_status"

IF EXISTS ( SELECT * FROM "sys"."tables" WHERE "name" = 'account_identity' )
    DROP TABLE "account_identity"


/********************************
*         Create Tables         *
********************************/
CREATE TABLE "hello" (
    "id"                    BIGINT              NOT NULL UNIQUE IDENTITY,
    "uuid"                  VARCHAR(36)         NOT NULL UNIQUE DEFAULT NEWID(),
    "greeting"              NVARCHAR(63)        NOT NULL DEFAULT 'hello, world.',
    "created_at"            DATETIME            NOT NULL DEFAULT GETDATE(),

    PRIMARY KEY("id")
)

CREATE TABLE "account_identity" (
    "id"                    INT                 NOT NULL UNIQUE IDENTITY,
    "title"                 NVARCHAR(63)        NOT NULL UNIQUE,

    PRIMARY KEY( "id" )
)

CREATE TABLE "account_status" (
    "id"                    INT                 NOT NULL UNIQUE IDENTITY,
    "title"                 NVARCHAR(63)        NOT NULL UNIQUE,

    PRIMARY KEY( "id" )
)

CREATE TABLE "account" (
    "id"                    BIGINT              NOT NULL UNIQUE IDENTITY,
    "uuid"                  VARCHAR(36)         NOT NULL UNIQUE DEFAULT NEWID(),
    "username"              VARCHAR(255)        NOT NULL UNIQUE,
    "password"              VARCHAR(255)		COLLATE Chinese_Taiwan_Stroke_CS_AS
                                                NOT NULL,
    "fk_account_identity_id"
                            INT         	    DEFAULT NULL,
    "fk_account_status_id"  INT                 DEFAULT NULL,
    "created_at"            DATETIME            NOT NULL DEFAULT GETDATE(),
    "salt"                  VARCHAR(255)        DEFAULT NULL,

    PRIMARY KEY( "id" ),
    FOREIGN KEY( "fk_account_identity_id" )     REFERENCES "account_identity"( "id" )
                                                    ON DELETE SET NULL,
    FOREIGN KEY( "fk_account_status_id" )       REFERENCES "account_status"( "id" )
                                                    ON DELETE SET NULL
)

CREATE TABLE "account_information" (
    "id"                    BIGINT              NOT NULL UNIQUE IDENTITY,
    "fk_account_id"         BIGINT              NOT NULL UNIQUE,
    "first_name"            NVARCHAR(255)       NOT NULL,
    "last_name"             NVARCHAR(255)       NOT NULL,
    "gender"                CHAR                DEFAULT NULL,
    "phone_number"          VARCHAR(63)         NOT NULL UNIQUE,
    "email"                 VARCHAR(255)        NOT NULL UNIQUE,
    "birthday"              DATE                DEFAULT NULL,

    PRIMARY KEY( "id" ),
    FOREIGN KEY( "fk_account_id" )              REFERENCES "account"( "id" )
)

CREATE TABLE "chatroom" (
    "id"                    BIGINT              NOT NULL UNIQUE IDENTITY,
    "fk_account_larger_id"  BIGINT              NOT NULL,
    "fk_account_smaller_id" BIGINT              NOT NULL,

    PRIMARY KEY( "id" ),
    FOREIGN KEY( "fk_account_larger_id" )       REFERENCES "account"( "id" ),
    FOREIGN KEY( "fk_account_smaller_id" )      REFERENCES "account"( "id" )
)

CREATE TABLE "chat_detail" (
    "id"                    BIGINT              NOT NULL UNIQUE IDENTITY,
    "fk_chatroom_id"        BIGINT              NOT NULL,
    "fk_speaker_id"         BIGINT              NOT NULL,
    "content_text"          NVARCHAR(1023)      NOT NULL,
    "created_at"            DATETIME            NOT NULL DEFAULT GETDATE(),
    "status"                INT                 DEFAULT 0,

    PRIMARY KEY( "id" ),
    FOREIGN KEY( "fk_chatroom_id" )             REFERENCES "chatroom"( "id" ),
    FOREIGN KEY( "fk_speaker_id" )              REFERENCES "account"( "id" )
)

CREATE TABLE "account_photo" (
    "id"                    BIGINT              NOT NULL UNIQUE IDENTITY,
    "uuid"                  VARCHAR(36)         NOT NULL UNIQUE DEFAULT NEWID(),
    "fk_account_id"         BIGINT              NOT NULL UNIQUE,

    PRIMARY KEY( "id" ),
    FOREIGN KEY( "fk_account_id" )              REFERENCES "account"( "id" )
)

CREATE TABLE "city" (
    "id"                    INT                 NOT NULL UNIQUE IDENTITY,
    "title"                 NVARCHAR(63)        NOT NULL UNIQUE,

    PRIMARY KEY( "id" )
)

CREATE TABLE "room_status" (
    "id"                    INT                 NOT NULL UNIQUE IDENTITY,
    "title"                 NVARCHAR(63)        NOT NULL UNIQUE,

    PRIMARY KEY( "id" )
)

CREATE TABLE "room" (
    "id"                    BIGINT              NOT NULL UNIQUE IDENTITY,
    "uuid"                  VARCHAR(36)         NOT NULL UNIQUE DEFAULT NEWID(),
    "fk_city_id"            INT                 DEFAULT NULL,
    "address"               NVARCHAR(255)       DEFAULT NULL,
    "fk_room_status_id"     INT                 DEFAULT NULL,
    "fk_front_cover_id"     BIGINT              DEFAULT NULL,
    "price"                 INT                 DEFAULT NULL,
    "fk_owner_id"           BIGINT              NOT NULL,

    PRIMARY KEY( "id" ),
    FOREIGN KEY( "fk_owner_id" )                REFERENCES "account"( "id" ),
    FOREIGN KEY( "fk_city_id" )                 REFERENCES "city"( "id" )
                                                    ON DELETE SET NULL,
    FOREIGN KEY( "fk_room_status_id" )          REFERENCES "room_status"( "id" )
                                                    ON DELETE SET NULL
)

CREATE TABLE "room_type" (
    "id"                    INT                 NOT NULL UNIQUE IDENTITY,
    "title"                 NVARCHAR(63)        NOT NULL UNIQUE,
    "lower_limit_price"     INT                 DEFAULT NULL,
    "upper_limit_price"     INT                 DEFAULT NULL,

    PRIMARY KEY( "id" )
)

CREATE TABLE "room_information" (
    "id"                    BIGINT              NOT NULL UNIQUE IDENTITY,
    "fk_room_id"            BIGINT              NOT NULL UNIQUE,
    "title"                 NVARCHAR(255)       DEFAULT NULL,
    "fk_room_type_id"       INT                 DEFAULT NULL,
    "longitude"             FLOAT               DEFAULT NULL,
    "latitude"              FLOAT               DEFAULT NULL,
    "max_people_capacity"   INT                 DEFAULT NULL,
    "min_people_capacity"   INT                 DEFAULT NULL,
    "single_size_bed_count" INT                 DEFAULT NULL,
    "double_size_bed_count" INT                 DEFAULT NULL,
    "floor_mattress_count"  INT                 DEFAULT NULL,
    "bedroom_count"         INT                 DEFAULT NULL,
    "bathroom_count"        INT                 DEFAULT NULL,
    "area"                  FLOAT               DEFAULT NULL,
    "introduction"          NVARCHAR(2047)      DEFAULT NULL,

    PRIMARY KEY( "id" ),
    FOREIGN KEY( "fk_room_id" )                 REFERENCES "room"( "id" ),
    FOREIGN KEY( "fk_room_type_id" )            REFERENCES "room_type"( "id" )
                                                    ON DELETE SET NULL
)

CREATE TABLE "room_comment" (
    "id"                    BIGINT              NOT NULL UNIQUE IDENTITY,
    "fk_room_id"            BIGINT              NOT NULL,
    "fk_author_id"          BIGINT              NOT NULL,
    "content_text"          NVARCHAR(1023)      NOT NULL,
    "point"                 INT                 NOT NULL,
    "created_at"            DATETIME            NOT NULL DEFAULT GETDATE(),

    PRIMARY KEY( "id" ),
    FOREIGN KEY( "fk_room_id" )                 REFERENCES "room"( "id" ),
    FOREIGN KEY( "fk_author_id" )               REFERENCES "account"( "id" )
)

CREATE TABLE "room_serve" (
    "id"                    INT                 NOT NULL UNIQUE IDENTITY,
    "title"                 NVARCHAR(63)        NOT NULL UNIQUE,
    "icon_tag"              VARCHAR(255)        NOT NULL UNIQUE,

    PRIMARY KEY( "id" )
)

CREATE TABLE "room_to_room_serve" (
    "fk_room_id"            BIGINT              NOT NULL,
    "fk_room_serve_id"      INT                 NOT NULL,

    FOREIGN KEY( "fk_room_id" )                 REFERENCES "room"( "id" ),
    FOREIGN KEY( "fk_room_serve_id" )         REFERENCES "room_serve"( "id" )
)

CREATE TABLE "room_device" (
    "id"                    INT                 NOT NULL UNIQUE IDENTITY,
    "title"                 NVARCHAR(63)        NOT NULL UNIQUE,
    "icon_tag"              VARCHAR(255)        NOT NULL UNIQUE,

    PRIMARY KEY( "id" )
)

CREATE TABLE "room_to_room_device" (
    "fk_room_id"            BIGINT              NOT NULL,
    "fk_room_device_id"     INT                 NOT NULL,

    FOREIGN KEY( "fk_room_id" )                 REFERENCES "room"( "id" ),
    FOREIGN KEY( "fk_room_device_id" )          REFERENCES "room_device"( "id" )
)

CREATE TABLE "room_restrict" (
    "id"                    INT                 NOT NULL UNIQUE IDENTITY,
    "title"                 NVARCHAR(63)        NOT NULL UNIQUE,
    "icon_tag"              VARCHAR(255)        NOT NULL UNIQUE,

    PRIMARY KEY( "id" )
)

CREATE TABLE "room_to_room_restrict" (
    "fk_room_id"            BIGINT              NOT NULL,
    "fk_room_restrict_id"   INT                 NOT NULL,

    FOREIGN KEY( "fk_room_id" )                 REFERENCES "room"( "id" ),
    FOREIGN KEY( "fk_room_restrict_id" )        REFERENCES "room_restrict"( "id" )
)

CREATE TABLE "room_photo" (
    "id"                    BIGINT              NOT NULL UNIQUE IDENTITY,
    "uuid"                  VARCHAR(36)         NOT NULL UNIQUE DEFAULT NEWID(),
    "fk_room_id"            BIGINT              NOT NULL,

    PRIMARY KEY( "id" ),
    FOREIGN KEY( "fk_room_id" )                 REFERENCES "room"( "id" )
)

CREATE TABLE "order_status" (
    "id"                    INT                 NOT NULL UNIQUE IDENTITY,
    "title"                 NVARCHAR(63)        NOT NULL UNIQUE,

    PRIMARY KEY( "id" )
)

CREATE TABLE "order" (
    "id"                    BIGINT              NOT NULL UNIQUE IDENTITY,
    "uuid"                  VARCHAR(36)         NOT NULL UNIQUE DEFAULT NEWID(),
    "fk_visitor_id"         BIGINT              NOT NULL,
    "fk_room_id"            BIGINT              NOT NULL,
    "check_in_datetime"     DATETIME            NOT NULL,
    "check_out_datetime"    DATETIME            NOT NULL,
    "created_at"            DATETIME            NOT NULL DEFAULT GETDATE(),
    "adult_count"           INT                 NOT NULL,
    "child_count"           INT                 NOT NULL,
    "price"                 INT                 NOT NULL,
    "fk_order_status_id"    INT                 DEFAULT NULL,
    "fk_room_comment_id"    BIGINT              DEFAULT NULL,

    PRIMARY KEY( "id" ),
    FOREIGN KEY( "fk_visitor_id" )              REFERENCES "account"( "id" ),
    FOREIGN KEY( "fk_room_id" )                 REFERENCES "room"( "id" ),
    FOREIGN KEY( "fk_order_status_id" )         REFERENCES "order_status"( "id" )
                                                    ON DELETE SET NULL,
    FOREIGN KEY( "fk_room_comment_id" )         REFERENCES "room_comment"( "id" )
                                                    ON DELETE SET NULL
)

CREATE TABLE "wish" (
    "fk_account_id"         BIGINT              NOT NULL,
    "fk_room_id"            BIGINT              NOT NULL,

    FOREIGN KEY( "fk_account_id" )              REFERENCES "account"( "id" ),
    FOREIGN KEY( "fk_room_id" )                 REFERENCES "room"( "id" )
)

ALTER TABLE "room"
    ADD CONSTRAINT "fk_room_front_cover_to_photo"
        FOREIGN KEY ("fk_front_cover_id") REFERENCES "room_photo"( "id" )
            ON DELETE SET NULL

USE "master"


/********************************
*           Workarea            *
********************************/
-- USE "Bearbnb"
