USE master
GO

IF EXISTS(SELECT name FROM sys.databases WHERE name = 'heartland_escapes')
DROP DATABASE heartland_escapes
GO

CREATE DATABASE heartland_escapes;
GO

USE heartland_escapes
GO

CREATE TABLE dbo.[customer] (
	customer_id varchar(36) NOT NULL PRIMARY KEY,
	first_name varchar(40) NOT NULL,
	last_name varchar(50) NOT NULL,
	email varchar(256) NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE dbo.[product] (
	product_id varchar(36) NOT NULL PRIMARY KEY,
	product_image_url varchar(2048) NULL,
	name varchar(80) NOT NULL,
	description varchar(2048) NULL,
	author_id varchar(36) NULL,
	price_per_unit decimal(18, 2) NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE dbo.[store] (
	store_id varchar(36) NOT NULL PRIMARY KEY,
	name varchar(40) NOT NULL,
	state_code varchar(3) NOT NULL,
	city varchar(20) NOT NULL,
	street_address varchar(50) NOT NULL,
	zip_code int NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE dbo.[store_inventory] (
	store_inventory_id varchar(36) NOT NULL PRIMARY KEY,
	store_id varchar(36) NOT NULL,
	product_id varchar(36) NOT NULL,
	quantity int NOT NULL,
	restock_threshold int NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE dbo.[address] (
	address_id varchar(36) NOT NULL PRIMARY KEY,
	customer_id varchar(36) NOT NULL,
	country_code varchar(3) NOT NULL,
	state_code varchar(3) NOT NULL,
	city varchar(60) NOT NULL,
	street_address varchar(80) NOT NULL,
	zip_code varchar(20) NOT NULL,
	is_default bit NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE dbo.[order] (
	order_id varchar(36) NOT NULL PRIMARY KEY,
	promotion_id varchar(36) NULL,
	store_id varchar(36) NOT NULL,
	customer_id varchar(36) NOT NULL,
	address_id varchar(36) NULL,
	in_store_pickup bit NOT NULL,
	order_status_id int NOT NULL,
	processed_timestamp datetimeoffset NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE dbo.[order_status] (
	order_status_id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	name varchar(20) NOT NULL,
	description varchar(256) NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE dbo.[order_line_item] (
	order_line_item_id varchar(36) NOT NULL PRIMARY KEY,
	order_id varchar(36) NOT NULL,
	product_id varchar(36) NOT NULL,
	quantity int NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE dbo.[event] (
	event_id varchar(36) NOT NULL PRIMARY KEY,
	store_id varchar(36) NOT NULL,
	pomotion_id varchar(36) NULL,
	name varchar(40) NOT NULL,
	image_url varchar(2048) NULL,
	image_2_url varchar(2048) NULL,
	description varchar(2048) NOT NULL,
	start_timestamp datetimeoffset NOT NULL,
	end_timestamp datetimeoffset NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE dbo.[event_featured_product] (
	event_featured_product_id varchar(36) NOT NULL PRIMARY KEY,
	event_id varchar(36) NOT NULL,
	product_id varchar(36) NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE dbo.[product_category] (
	product_category_id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	parent_id int NULL,
	name varchar(40) NOT NULL,
	description varchar(256) NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE dbo.[author] (
	author_id varchar(36) NOT NULL PRIMARY KEY,
	author_image_url varchar(2048) NULL,
	first_name varchar(40) NOT NULL,
	last_name varchar(50) NULL,
	biography varchar(2048) NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE dbo.[deliverable_regions] (
	deliverable_region_id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	country_code varchar(3) NOT NULL,
	state_code varchar(3) NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE dbo.[product_category_map] (
	product_category_map_id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	product_id varchar(36) NOT NULL,
	product_category_id int NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE dbo.[promotion] (
	promotion_id varchar(36) NOT NULL PRIMARY KEY,
	name varchar(40) NOT NULL,
	description varchar(80) NOT NULL,
	discount_percentage varchar(36) NULL,
	start_timestamp datetimeoffset NOT NULL,
	end_timestamp datetimeoffset NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE dbo.[product_promotion] (
	product_promotion_id varchar(36) NOT NULL PRIMARY KEY,
	promotion_id varchar(36) NOT NULL,
	product_id varchar(36) NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

ALTER TABLE dbo.[product]
	ADD CONSTRAINT FK_product_author_id
	FOREIGN KEY (author_id) REFERENCES heartland_escapes.dbo.[author](author_id);

ALTER TABLE dbo.[store_inventory]
	ADD CONSTRAINT FK_store_inventory_store_id
	FOREIGN KEY (store_id) REFERENCES heartland_escapes.dbo.[store](store_id);

ALTER TABLE dbo.[store_inventory]
	ADD CONSTRAINT FK_store_inventory_product_id
	FOREIGN KEY (product_id) REFERENCES heartland_escapes.dbo.[product](product_id);

ALTER TABLE dbo.[address]
	ADD CONSTRAINT FK_address_customer_id
	FOREIGN KEY (customer_id) REFERENCES heartland_escapes.dbo.[customer](customer_id);

ALTER TABLE dbo.[order]
	ADD CONSTRAINT FK_order_promotion_id
	FOREIGN KEY (promotion_id) REFERENCES heartland_escapes.dbo.[promotion](promotion_id);

ALTER TABLE dbo.[order]
	ADD CONSTRAINT FK_order_store_id
	FOREIGN KEY (store_id) REFERENCES heartland_escapes.dbo.[store](store_id);

ALTER TABLE dbo.[order]
	ADD CONSTRAINT FK_order_customer_id
	FOREIGN KEY (customer_id) REFERENCES heartland_escapes.dbo.[customer](customer_id);

ALTER TABLE dbo.[order]
	ADD CONSTRAINT FK_order_address_id
	FOREIGN KEY (address_id) REFERENCES heartland_escapes.dbo.[address](address_id);

ALTER TABLE dbo.[order]
	ADD CONSTRAINT FK_order_order_status_id
	FOREIGN KEY (order_status_id) REFERENCES heartland_escapes.dbo.[order_status](order_status_id);

ALTER TABLE dbo.[order_line_item]
	ADD CONSTRAINT FK_order_line_item_order_id
	FOREIGN KEY (order_id) REFERENCES heartland_escapes.dbo.[order](order_id);

ALTER TABLE dbo.[order_line_item]
	ADD CONSTRAINT FK_order_line_item_product_id
	FOREIGN KEY (product_id) REFERENCES heartland_escapes.dbo.[product](product_id);

ALTER TABLE dbo.[event]
	ADD CONSTRAINT FK_event_store_id
	FOREIGN KEY (store_id) REFERENCES heartland_escapes.dbo.[store](store_id);

ALTER TABLE dbo.[event_featured_product]
	ADD CONSTRAINT FK_event_featured_product_event_id
	FOREIGN KEY (event_id) REFERENCES heartland_escapes.dbo.[event](event_id);

ALTER TABLE dbo.[event_featured_product]
	ADD CONSTRAINT FK_event_featured_product_product_id
	FOREIGN KEY (product_id) REFERENCES heartland_escapes.dbo.[product](product_id);

ALTER TABLE dbo.[product_category]
	ADD CONSTRAINT FK_product_category_parent_id
	FOREIGN KEY (parent_id) REFERENCES heartland_escapes.dbo.[product_category](product_category_id);

ALTER TABLE dbo.[product_category_map]
	ADD CONSTRAINT FK_product_category_map_product_id
	FOREIGN KEY (product_id) REFERENCES heartland_escapes.dbo.[product](product_id);

ALTER TABLE dbo.[product_category_map]
	ADD CONSTRAINT FK_product_category_map_product_category_id
	FOREIGN KEY (product_category_id) REFERENCES heartland_escapes.dbo.[product_category](product_category_id);

ALTER TABLE dbo.[product_promotion]
	ADD CONSTRAINT FK_product_promotion_promotion_id
	FOREIGN KEY (promotion_id) REFERENCES heartland_escapes.dbo.[promotion](promotion_id);

ALTER TABLE dbo.[product_promotion]
	ADD CONSTRAINT FK_product_promotion_product_id
	FOREIGN KEY (product_id) REFERENCES heartland_escapes.dbo.[product](product_id);