
BEGIN TRANSACTION
CREATE DATABASE heartland_escapes;

CREATE TABLE heartland_escapes.dbo.[customer] (
	customer_id varchar(36) NOT NULL PRIMARY KEY,
	first_name varchar(40) NOT NULL,
	last_name varchar(50) NOT NULL,
	email varchar(256) NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE heartland_escapes.dbo.[product] (
	product_id varchar(36) NOT NULL PRIMARY KEY,
	product_image_url varchar(2048) NULL,
	name varchar(80) NOT NULL,
	description varchar(2048) NULL,
	author_id varchar(36) NULL,
	price_per_unit decimal NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE heartland_escapes.dbo.[store] (
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

CREATE TABLE heartland_escapes.dbo.[store_inventory] (
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

CREATE TABLE heartland_escapes.dbo.[address] (
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

CREATE TABLE heartland_escapes.dbo.[order] (
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

CREATE TABLE heartland_escapes.dbo.[order_status] (
	order_status_id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	name varchar(20) NOT NULL,
	description varchar(256) NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE heartland_escapes.dbo.[order_line_item] (
	order_line_item_id varchar(36) NOT NULL PRIMARY KEY,
	order_id varchar(36) NOT NULL,
	product_id varchar(36) NOT NULL,
	quantity int NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE heartland_escapes.dbo.[event] (
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

CREATE TABLE heartland_escapes.dbo.[event_featured_product] (
	event_featured_product_id varchar(36) NOT NULL PRIMARY KEY,
	event_id varchar(36) NOT NULL,
	product_id varchar(36) NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE heartland_escapes.dbo.[product_category] (
	product_category_id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	parent_id int NULL,
	name varchar(40) NOT NULL,
	description varchar(256) NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE heartland_escapes.dbo.[author] (
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

CREATE TABLE heartland_escapes.dbo.[deliverable_regions] (
	deliverable_region_id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	country_code varchar(3) NOT NULL,
	state_code varchar(3) NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE heartland_escapes.dbo.[product_category_map] (
	product_category_map_id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	product_id varchar(36) NOT NULL,
	product_category_id int NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

CREATE TABLE heartland_escapes.dbo.[promotion] (
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

CREATE TABLE heartland_escapes.dbo.[product_promotion] (
	product_promotion_id varchar(36) NOT NULL PRIMARY KEY,
	promotion_id varchar(36) NOT NULL,
	product_id varchar(36) NOT NULL,
	create_username varchar(256) NOT NULL,
	create_timestamp datetimeoffset NOT NULL,
	modify_username varchar(256) NOT NULL,
	modify_timestamp datetimeoffset NOT NULL
);

ALTER TABLE heartland_escapes.dbo.[product]
	ADD CONSTRAINT FK_product_author_id
	FOREIGN KEY (author_id) REFERENCES heartland_escapes.dbo.[author](author_id);

ALTER TABLE heartland_escapes.dbo.[store_inventory]
	ADD CONSTRAINT FK_store_inventory_store_id
	FOREIGN KEY (store_id) REFERENCES heartland_escapes.dbo.[store](store_id);

ALTER TABLE heartland_escapes.dbo.[store_inventory]
	ADD CONSTRAINT FK_store_inventory_product_id
	FOREIGN KEY (product_id) REFERENCES heartland_escapes.dbo.[product](product_id);

ALTER TABLE heartland_escapes.dbo.[address]
	ADD CONSTRAINT FK_address_customer_id
	FOREIGN KEY (customer_id) REFERENCES heartland_escapes.dbo.[customer](customer_id);

ALTER TABLE heartland_escapes.dbo.[order]
	ADD CONSTRAINT FK_order_promotion_id
	FOREIGN KEY (promotion_id) REFERENCES heartland_escapes.dbo.[promotion](promotion_id);

ALTER TABLE heartland_escapes.dbo.[order]
	ADD CONSTRAINT FK_order_store_id
	FOREIGN KEY (store_id) REFERENCES heartland_escapes.dbo.[store](store_id);

ALTER TABLE heartland_escapes.dbo.[order]
	ADD CONSTRAINT FK_order_customer_id
	FOREIGN KEY (customer_id) REFERENCES heartland_escapes.dbo.[customer](customer_id);

ALTER TABLE heartland_escapes.dbo.[order]
	ADD CONSTRAINT FK_order_address_id
	FOREIGN KEY (address_id) REFERENCES heartland_escapes.dbo.[address](address_id);

ALTER TABLE heartland_escapes.dbo.[order]
	ADD CONSTRAINT FK_order_order_status_id
	FOREIGN KEY (order_status_id) REFERENCES heartland_escapes.dbo.[order_status](order_status_id);

ALTER TABLE heartland_escapes.dbo.[order_line_item]
	ADD CONSTRAINT FK_order_line_item_order_id
	FOREIGN KEY (order_id) REFERENCES heartland_escapes.dbo.[order](order_id);

ALTER TABLE heartland_escapes.dbo.[order_line_item]
	ADD CONSTRAINT FK_order_line_item_product_id
	FOREIGN KEY (product_id) REFERENCES heartland_escapes.dbo.[product](product_id);

ALTER TABLE heartland_escapes.dbo.[event]
	ADD CONSTRAINT FK_event_store_id
	FOREIGN KEY (store_id) REFERENCES heartland_escapes.dbo.[store](store_id);

ALTER TABLE heartland_escapes.dbo.[event_featured_product]
	ADD CONSTRAINT FK_event_featured_product_event_id
	FOREIGN KEY (event_id) REFERENCES heartland_escapes.dbo.[event](event_id);

ALTER TABLE heartland_escapes.dbo.[event_featured_product]
	ADD CONSTRAINT FK_event_featured_product_product_id
	FOREIGN KEY (product_id) REFERENCES heartland_escapes.dbo.[product](product_id);

ALTER TABLE heartland_escapes.dbo.[product_category]
	ADD CONSTRAINT FK_product_category_parent_id
	FOREIGN KEY (parent_id) REFERENCES heartland_escapes.dbo.[product_category](product_category_id);

ALTER TABLE heartland_escapes.dbo.[product_category_map]
	ADD CONSTRAINT FK_product_category_map_product_id
	FOREIGN KEY (product_id) REFERENCES heartland_escapes.dbo.[product](product_id);

ALTER TABLE heartland_escapes.dbo.[product_category_map]
	ADD CONSTRAINT FK_product_category_map_product_category_id
	FOREIGN KEY (product_category_id) REFERENCES heartland_escapes.dbo.[product_category](product_category_id);

ALTER TABLE heartland_escapes.dbo.[product_promotion]
	ADD CONSTRAINT FK_product_promotion_promotion_id
	FOREIGN KEY (promotion_id) REFERENCES heartland_escapes.dbo.[promotion](promotion_id);

ALTER TABLE heartland_escapes.dbo.[product_promotion]
	ADD CONSTRAINT FK_product_promotion_product_id
	FOREIGN KEY (product_id) REFERENCES heartland_escapes.dbo.[product](product_id);
	
-- insert customers
INSERT INTO dbo.customer (customer_id, first_name, last_name, email, create_username, create_timestamp, modify_username, modify_timestamp) 
VALUES 
('1d399f7b-5a54-4f6a-b54c-2c284cbcab00', 'Leigh', 'Winslett', 'lwinslett0@addthis.com', 'lwinslett0@gnu.org', '4/1/2024', 'lwinslett0@tiny.cc', '4/8/2023'),
('6f3d6da6-3d1d-42e3-b000-2618ebe4f41a', 'Kasper', 'Tolerton', 'ktolerton1@pcworld.com', 'ktolerton1@arstechnica.com', '1/18/2024', 'ktolerton1@mtv.com', '7/31/2023'),
('d4fd5b04-bcbd-4e4a-b67f-2a540ae3a922', 'Harlie', 'Bevir', 'hbevir2@dedecms.com', 'hbevir2@spotify.com', '3/25/2024', 'hbevir2@slashdot.org', '8/29/2023'),
('27a67efb-5bed-4996-8e8c-60bc30ab30a2', 'Tomas', 'Gussie', 'tgussie3@bravesites.com', 'tgussie3@gov.uk', '12/7/2023', 'tgussie3@amazonaws.com', '12/17/2023'),
('7335c014-7101-4d02-ad46-d41f100f5a79', 'Brook', 'Simnor', 'bsimnor4@zdnet.com', 'bsimnor4@comsenz.com', '7/26/2023', 'bsimnor4@netscape.com', '8/1/2023'),
('ac517728-ea52-4f2c-9840-8af8a5ebf6df', 'Court', 'Cardero', 'ccardero5@mapy.cz', 'ccardero5@japanpost.jp', '9/16/2023', 'ccardero5@studiopress.com', '12/17/2023'),
('2ac9a5b2-9e5f-4b77-92c3-aa1f31713555', 'Clareta', 'Rigden', 'crigden6@npr.org', 'crigden6@flavors.me', '4/12/2023', 'crigden6@artisteer.com', '9/6/2023'),
('3473473b-3feb-45b5-a6af-56c77524e7c6', 'Ulysses', 'Ball', 'uball7@google.com', 'uball7@amazon.de', '4/15/2023', 'uball7@nymag.com', '10/23/2023'),
('6257212f-56d6-4c51-a744-6386520dc8f6', 'Maryl', 'Dunbabin', 'mdunbabin8@mozilla.com', 'mdunbabin8@people.com.cn', '5/12/2023', 'mdunbabin8@wordpress.com', '7/4/2023'),
('0af497d3-02f1-4ffd-9b89-4c1e85103926', 'Abba', 'Cockman', 'acockman9@ucla.edu', 'acockman9@ameblo.jp', '3/25/2024', 'acockman9@cnet.com', '2/20/2024'),
('8e75f874-a241-480c-8752-4aa1825c52af', 'Carine', 'Kornyshev', 'ckornysheva@japanpost.jp', 'ckornysheva@github.io', '5/14/2023', 'ckornysheva@devhub.com', '5/8/2023'),
('41e8264d-800b-4291-829a-d6c92a62e5d4', 'Silas', 'Davys', 'sdavysb@mysql.com', 'sdavysb@mac.com', '7/27/2023', 'sdavysb@msn.com', '12/14/2023'),
('a9b19b81-496c-4d02-b127-07bb01c56a4b', 'Corissa', 'Lane', 'clanec@washington.edu', 'clanec@creativecommons.org', '9/11/2023', 'clanec@mapy.cz', '9/26/2023'),
('16a4336a-c0f1-4ab9-8d23-a92bbb12c322', 'Cristie', 'Wilcinskis', 'cwilcinskisd@google.de', 'cwilcinskisd@who.int', '10/27/2023', 'cwilcinskisd@microsoft.com', '11/24/2023'),
('60d1e496-ca5e-4515-bcb3-1511e15c3779', 'Lilla', 'Epilet', 'lepilete@amazon.com', 'lepilete@cam.ac.uk', '1/20/2024', 'lepilete@dell.com', '4/24/2023'),
('5b54964c-8151-44c6-bf4e-c53eb85788d7', 'Bonita', 'Shoutt', 'bshouttf@japanpost.jp', 'bshouttf@goo.ne.jp', '9/8/2023', 'bshouttf@barnesandnoble.com', '9/25/2023'),
('1d1fa47c-9800-4bce-a3ce-0768b2be6d46', 'Shell', 'Brisland', 'sbrislandg@desdev.cn', 'sbrislandg@exblog.jp', '6/8/2023', 'sbrislandg@list-manage.com', '12/10/2023'),
('28fc2227-2287-44af-b61a-810a4479ed65', 'Carlene', 'Kirkpatrick', 'ckirkpatrickh@wikimedia.org', 'ckirkpatrickh@prlog.org', '5/14/2023', 'ckirkpatrickh@ihg.com', '9/26/2023'),
('841717d4-dec4-4be9-aff0-27cd71b2e138', 'Padraic', 'Jeayes', 'pjeayesi@nps.gov', 'pjeayesi@admin.ch', '4/19/2023', 'pjeayesi@rambler.ru', '6/21/2023'),
('2f15d516-ab29-45e5-b922-3f1ad979ae50', 'Shannon', 'Macallam', 'smacallamj@netscape.com', 'smacallamj@nymag.com', '6/5/2023', 'smacallamj@4shared.com', '11/9/2023');

-- insert addresses
INSERT INTO address (address_id, customer_id, country_code, state_code, city, street_address, zip_code, is_default, create_username, create_timestamp, modify_username, modify_timestamp) 
VALUES 
('f9a85679-cf92-45d7-b2f0-c9979c8276ce', '1d399f7b-5a54-4f6a-b54c-2c284cbcab00', 'US', 'CA', 'San Francisco', '4 Hoard Lane', 19946, 1, 'kgiacobelli0@zimbio.com', '7/20/2023', 'cchancellor0@goodreads.com', '4/25/2023'),
('bd691b02-111d-4aab-8fa4-da70f500c9f2', '1d399f7b-5a54-4f6a-b54c-2c284cbcab00', 'US', 'CA', 'San Francisco', '8 Hoard Street', 19694, 0, 'kgiacobelli0@zimbio.com', '7/20/2023', 'cchancellor0@goodreads.com', '4/25/2023'),
('ba5b2561-57a2-4fa6-8e90-dd87ebb32c54', '6f3d6da6-3d1d-42e3-b000-2618ebe4f41a', 'US', 'MN', 'Minneapolis', '493 Acker Plaza', 92462, 1, 'fjurries1@businesswire.com', '2/20/2024', 'rboichat1@mozilla.org', '5/9/2023'),
('a0fdfa94-28e5-49e5-be5a-1be49f0e92bf', 'd4fd5b04-bcbd-4e4a-b67f-2a540ae3a922', 'US', 'CA', 'Fresno', '0 Comanche Circle', 16913, 1, 'avalsler2@fda.gov', '10/7/2023', 'hwinteringham2@a8.net', '8/11/2023'),
('5b7fb7cf-2ca0-4099-8dc5-dafc61ea6e50', '27a67efb-5bed-4996-8e8c-60bc30ab30a2', 'US', 'KY', 'Lexington', '0613 Almo Crossing', 98793, 1, 'njumonet3@tumblr.com', '12/23/2023', 'amccarrick3@skyrock.com', '3/24/2024'),
('e38c6f0a-7f48-4a86-bbe3-67a7acb81859', '7335c014-7101-4d02-ad46-d41f100f5a79', 'US', 'NY', 'New York City', '00 Vidon Court', 77996, 1, 'egosnall4@smh.com.au', '9/24/2023', 'vadamou4@desdev.cn', '9/29/2023'),
('9cf0cea0-6a60-479a-849c-fb65369b9018', 'ac517728-ea52-4f2c-9840-8af8a5ebf6df', 'US', 'CA', 'Orange', '9611 Dorton Street', 78996, 1, 'showorth5@elegantthemes.com', '12/13/2023', 'nfeatherstone5@answers.com', '8/12/2023'),
('3c077782-e1bd-4a3d-9357-b14498bf6d85', '2ac9a5b2-9e5f-4b77-92c3-aa1f31713555', 'US', 'OK', 'Oklahoma City', '59721 Pond Court', 87299, 1, 'dtrangmar6@360.cn', '5/31/2023', 'jgreensmith6@parallels.com', '3/5/2024'),
('04f9632b-796a-4b4e-88a5-171f0609e658', '3473473b-3feb-45b5-a6af-56c77524e7c6', 'US', 'CA', 'Inglewood', '73 Sutherland Circle', 66986, 1, 'ihutchcraft7@tripadvisor.com', '1/5/2024', 'bkellie7@webmd.com', '12/12/2023'),
('43f593ed-a28f-40c8-8e0d-00b782f7a258', '6257212f-56d6-4c51-a744-6386520dc8f6', 'US', 'FL', 'Orlando', '17 Mockingbird Center', 27842, 1, 'treedshaw8@oakley.com', '5/19/2023', 'cbinney8@wikipedia.org', '8/2/2023'),
('e7b83924-a2c7-417b-a22b-da9940c6ef80', '0af497d3-02f1-4ffd-9b89-4c1e85103926', 'US', 'MD', 'Laurel', '4 Hoepker Park', 59733, 1, 'gphippin9@bandcamp.com', '7/11/2023', 'lwoolger9@time.com', '12/21/2023'),
('2d086ba0-30e1-4be3-b506-1eaf31950f9a', '8e75f874-a241-480c-8752-4aa1825c52af', 'US', 'IA', 'Des Moines', '46 Milwaukee Street', 80153, 1, 'ngribblea@latimes.com', '7/13/2023', 'rmattocksa@nationalgeographic.com', '12/21/2023'),
('e5ee5f10-ebeb-4209-a8f1-532d85aa3657', '41e8264d-800b-4291-829a-d6c92a62e5d4', 'US', 'CT', 'New Haven', '32582 Lighthouse Bay Parkway', 33520, 1, 'kslackb@wikimedia.org', '3/14/2024', 'aivashintsovb@sfgate.com', '4/28/2023'),
('c298b71b-2602-4dd6-985e-2e107f8df983', 'a9b19b81-496c-4d02-b127-07bb01c56a4b', 'US', 'TX', 'El Paso', '430 West Road', 14021, 1, 'ldurnanc@prlog.org', '12/27/2023', 'jcornelissenc@friendfeed.com', '8/28/2023'),
('06e07600-a08c-4e5e-8157-f51b2c49d41a', '16a4336a-c0f1-4ab9-8d23-a92bbb12c322', 'US', 'PA', 'Harrisburg', '9876 Florence Court', 86618, 1, 'gpharod@mapy.cz', '1/20/2024', 'nstreatherd@blogs.com', '12/30/2023'),
('4cb8ebe7-022d-4454-b6fb-c587e87928d9', '60d1e496-ca5e-4515-bcb3-1511e15c3779', 'US', 'IA', 'Davenport', '49 Carioca Circle', 62582, 1, 'jorricke@cnbc.com', '6/9/2023', 'adowsette@php.net', '5/12/2023'),
('b1529ec9-8b3c-4d81-8dd1-73aacedf61b6', '5b54964c-8151-44c6-bf4e-c53eb85788d7', 'US', 'TX', 'El Paso', '702 Golf Course Lane', 59005, 1, 'jdelaeglisef@army.mil', '9/12/2023', 'lkemstonf@virginia.edu', '10/3/2023'),
('d3c0f494-9303-4845-b75d-5dcc2125d31b', '1d1fa47c-9800-4bce-a3ce-0768b2be6d46', 'US', 'HI', 'Honolulu', '475 1st Avenue', 35139, 1, 'livanenkovg@examiner.com', '6/10/2023', 'njursg@cnet.com', '10/26/2023'),
('c17ac17b-8420-4f98-89be-0e924ae7c629', '28fc2227-2287-44af-b61a-810a4479ed65', 'US', 'AL', 'Birmingham', '49454 Heath Trail', 48404, 1, 'ovinckh@gnu.org', '10/9/2023', 'ecrosettoh@oracle.com', '11/12/2023'),
('8972ced0-ad27-47f4-af84-73588bb226c0', '841717d4-dec4-4be9-aff0-27cd71b2e138', 'US', 'CA', 'San Diego', '821 Oak Valley Alley', 97376, 1, 'kbassilli@salon.com', '9/16/2023', 'eroperti@baidu.com', '12/8/2023');

INSERT INTO store (store_id, name, state_code, city, street_address, zip_code, create_username, create_timestamp, modify_username, modify_timestamp)
VALUES
('7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', 'Heartland Escapes Lincoln East', 'NE', 'Lincoln', '3753 70th Street', 68524, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('08535181-e45d-4765-8907-76dade3f5942', 'Heartland Escapes Lincoln West', 'NE', 'Lincoln', '2301 W Ramsey Rd', 68524, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('1f7845f9-23b6-40d1-b38e-b61945f640c7', 'Heartland Escapes Omaha', 'NE', 'Omaha', '1200 Dodge Street', 68524, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('5355bfc7-8607-4d9d-bed8-1be055aba058', 'Heartland Escapes Beatrice', 'NE', 'Beatrice', '604 Candy Cane Lane', 68524, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024');

INSERT INTO author (author_id, author_image_url, first_name, last_name, biography, create_username, create_timestamp, modify_username, modify_timestamp)
VALUES
('310edc5f-439e-4c6d-9982-999b3daa0c3c', 'some_url', 'J.R.R.', 'Tolkien', 'Wrote a bunch of books', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('a9140550-8942-4af2-a6a1-096ae4c58b4c', 'some_url', 'Dr.', 'Suess', 'Wrote a bunch of books', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('535034ab-093a-4b03-a012-835897315367', 'some_url', 'J.K.', 'Rowling', 'Wrote a bunch of books', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('d1cf74cc-1bdb-4cad-b5f1-944b7abef9b1', 'some_url', 'C.S.', 'Lewis', 'Wrote a bunch of books', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024');

INSERT INTO product (product_id, product_image_url, name, description, author_id, price_per_unit, create_username, create_timestamp, modify_username, modify_timestamp)
VALUES
('036b14ae-d6c0-469a-861a-b8224c6f33b2', 'some_url', 'Rubix Cube', 'cubic puzzle toy', null, 9.99, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('06420d25-7f98-4b64-aa76-f2b3195f78a6', 'some_url', 'Harry Potter and the Chamber of Secrets', 'Second book of the Harry Potter series', '535034ab-093a-4b03-a012-835897315367', 22.49, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('cf27d3d2-311c-4aab-8527-59b044c74986', 'some_url', 'Harry Potter and the Sorcerers Stone', 'First book of the Harry Potter series', '535034ab-093a-4b03-a012-835897315367', 22.49, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('be82b595-123a-48a3-8958-0b9f37b5078c', 'some_url', 'Harry Potter and the Goblet of Fire', 'Fourth book of the Harry Potter series', '535034ab-093a-4b03-a012-835897315367', 22.49, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('36f7f299-a742-4109-91e0-ca39a3298ed0', 'some_url', 'Harry Potter and the Prisoner of Azkaban', 'Third book of the Harry Potter series', '535034ab-093a-4b03-a012-835897315367', 22.49, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('4a677e8b-afdc-4a46-a98f-b3acfe8673fa', 'some_url', 'Harry Potter and the Deathly Hallows', 'Seventh book of the Harry Potter series', '535034ab-093a-4b03-a012-835897315367', 22.49, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('4d58eb8d-dcab-4f48-b3aa-f1007b3ddcfd', 'some_url', 'Harry Potter and the Order of the Phoenix', 'Sixth book of the Harry Potter series', '535034ab-093a-4b03-a012-835897315367', 22.49, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('2140f3d9-241f-40ba-8a38-c7b0c48b72ed', 'some_url', 'Harry Potter and the Half Blood Prince', 'Fifth book of the Harry Potter series', '535034ab-093a-4b03-a012-835897315367', 22.49, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('fe2b71f7-aad1-4e45-bc04-931bfc27ea36', 'some_url', 'The Hobbit', 'Prequil to the Lord of the Rings trilogy', '310edc5f-439e-4c6d-9982-999b3daa0c3c', 29.99, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('778ee728-4986-4aaa-946c-a73fe2bfa2a4', 'some_url', 'Lord of the Rings: The Fellowship of the Ring', 'First book of the Lord of the Rings trilogy', '310edc5f-439e-4c6d-9982-999b3daa0c3c', 25.69, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('400c16d0-352d-487f-ad20-7d4ea587f4a4', 'some_url', 'Lord of the Rings: The Two Towers', 'Second book of the Lord of the Rings trilogy', '310edc5f-439e-4c6d-9982-999b3daa0c3c', 25.69, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('20b62e82-6d40-483e-812a-33f80b957e1d', 'some_url', 'Lord of the Rings: The Return of the King', 'Third book of the Lord of the Rings trilogy', '310edc5f-439e-4c6d-9982-999b3daa0c3c', 25.69, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('abe6a521-8293-4476-a768-8a81a52b1583', 'some_url', 'Green Eggs and Ham', 'One of many works by Dr. Suess', 'a9140550-8942-4af2-a6a1-096ae4c58b4c', 9.99, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('f99eab0c-fd91-4e7c-a9d8-091fde7b8057', 'some_url', 'The Cat in the Hat', 'One of many works by Dr. Suess', 'a9140550-8942-4af2-a6a1-096ae4c58b4c', 9.99, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('1641be7f-5815-42ab-b2ad-b772370ae4db', 'some_url', 'Oh the Places You''ll Go', 'One of many works by Dr. Suess', 'a9140550-8942-4af2-a6a1-096ae4c58b4c', 9.99, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('66ed504a-e541-4885-8e6b-fe54e5ef888a', 'some_url', 'One Fish, Two Fish, Red Fish, Blue Fish', 'One of many works by Dr. Suess', 'a9140550-8942-4af2-a6a1-096ae4c58b4c', 9.99, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('ad6aaa6e-cf19-4b9e-b75e-d2bbcfbdb702', 'some_url', 'Biography of Dr. Suess', 'Dr. Suess''s Life Story', null, 18.50, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('586020c3-88e9-4ecd-88fb-38c2204354f5', 'some_url', 'The Adventures of Tom Bombadil', 'Poetry by J.R.R. Tolkien', '310edc5f-439e-4c6d-9982-999b3daa0c3c', 11.59, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('974e5b10-3c0b-477c-89b8-d1445ead9f26', 'some_url', 'Settlers of Catan', 'Board game that''s great for families', null, 55.00, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('00ff61e1-650d-4472-934e-a5691c982c9a', 'some_url', 'Risk', 'Board game that''s terrible for families', null, 33.99, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('9064b95a-a5c8-4530-886e-b179fb1d0de0', 'some_url', 'Mere Christianity', 'Book about exploring what it means to have a relationship with Christ by C.S. Lewis', 'd1cf74cc-1bdb-4cad-b5f1-944b7abef9b1', 15.00, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024');

INSERT INTO product_category(parent_id, name, description, create_username, create_timestamp, modify_username, modify_timestamp)
VALUES
(null, 'Books', 'some descriptive text', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
(null, 'Toys', 'some descriptive text', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
(1, 'Fantasy', 'some descriptive text', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
(1, 'For Children', 'some descriptive text', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
(1, 'Non Fiction', 'some descriptive text', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
(1, 'Christian', 'some descriptive text', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
(2, 'Puzzles', 'some descriptive text', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
(2, 'Games', 'some descriptive text', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
(1, 'Poetry', 'some descriptive text', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024');

INSERT INTO product_category_map(product_id, product_category_id, create_username, create_timestamp, modify_username, modify_timestamp)
VALUES
('036b14ae-d6c0-469a-861a-b8224c6f33b2', 7, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('06420d25-7f98-4b64-aa76-f2b3195f78a6', 3, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('cf27d3d2-311c-4aab-8527-59b044c74986', 3, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('be82b595-123a-48a3-8958-0b9f37b5078c', 3, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('36f7f299-a742-4109-91e0-ca39a3298ed0', 3, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('4a677e8b-afdc-4a46-a98f-b3acfe8673fa', 3, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('4d58eb8d-dcab-4f48-b3aa-f1007b3ddcfd', 3, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('2140f3d9-241f-40ba-8a38-c7b0c48b72ed', 3, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('fe2b71f7-aad1-4e45-bc04-931bfc27ea36', 3, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('778ee728-4986-4aaa-946c-a73fe2bfa2a4', 3, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('400c16d0-352d-487f-ad20-7d4ea587f4a4', 3, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('20b62e82-6d40-483e-812a-33f80b957e1d', 3, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('586020c3-88e9-4ecd-88fb-38c2204354f5', 9, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('586020c3-88e9-4ecd-88fb-38c2204354f5', 5, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('abe6a521-8293-4476-a768-8a81a52b1583', 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('f99eab0c-fd91-4e7c-a9d8-091fde7b8057', 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('1641be7f-5815-42ab-b2ad-b772370ae4db', 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('66ed504a-e541-4885-8e6b-fe54e5ef888a', 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('974e5b10-3c0b-477c-89b8-d1445ead9f26', 8, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('00ff61e1-650d-4472-934e-a5691c982c9a', 8, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('ad6aaa6e-cf19-4b9e-b75e-d2bbcfbdb702', 5, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('9064b95a-a5c8-4530-886e-b179fb1d0de0', 5, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('9064b95a-a5c8-4530-886e-b179fb1d0de0', 6, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024');

INSERT INTO store_inventory(store_inventory_id, store_id, product_id, quantity, restock_threshold, create_username, create_timestamp, modify_username, modify_timestamp)
VALUES
('8265b519-5f0d-4bea-81a1-624de84da236', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '036b14ae-d6c0-469a-861a-b8224c6f33b2', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('4a9bd472-1308-4c94-bcd3-b1cfa9672139', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '06420d25-7f98-4b64-aa76-f2b3195f78a6', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('ab18a72a-49ef-4409-9cac-ed6280230350', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', 'cf27d3d2-311c-4aab-8527-59b044c74986', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('eae48038-74fe-440d-b436-83b7c7ddb6bb', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', 'be82b595-123a-48a3-8958-0b9f37b5078c', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('161e9dc4-9df2-4c3b-b5d4-3e424063eff5', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '36f7f299-a742-4109-91e0-ca39a3298ed0', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('181a73f0-23c2-486a-a1d7-9862a165dffd', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '4a677e8b-afdc-4a46-a98f-b3acfe8673fa', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('94738ef5-28a2-4872-95e4-225172dd8405', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '4d58eb8d-dcab-4f48-b3aa-f1007b3ddcfd', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('650176ec-6151-4a6c-b018-8c2c722fb3ee', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '2140f3d9-241f-40ba-8a38-c7b0c48b72ed', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('58ebbec2-b64d-436c-883a-2c8c3e28c9cd', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', 'fe2b71f7-aad1-4e45-bc04-931bfc27ea36', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('2c885a28-bcd9-4772-875b-fe868390c466', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '778ee728-4986-4aaa-946c-a73fe2bfa2a4', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('4e75444b-785c-4015-a167-c7e0412348bd', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '400c16d0-352d-487f-ad20-7d4ea587f4a4', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('8d0b93ef-dea1-4a9c-9e28-95eae0306a2b', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '20b62e82-6d40-483e-812a-33f80b957e1d', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('28a862a2-971d-471c-bab0-864e00651b09', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '586020c3-88e9-4ecd-88fb-38c2204354f5', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('ae11a748-3f51-4066-b63b-3d3a22578969', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', 'abe6a521-8293-4476-a768-8a81a52b1583', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('525a0997-7eba-4db7-989e-9bfd049af510', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', 'f99eab0c-fd91-4e7c-a9d8-091fde7b8057', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('142b904f-e883-4080-b8d7-2ac78517a3ff', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '1641be7f-5815-42ab-b2ad-b772370ae4db', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('e46508ec-6188-47ab-b423-e394f0d7b49c', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '66ed504a-e541-4885-8e6b-fe54e5ef888a', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('e6c87d93-3d60-4248-bf31-06eca193bcf9', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '974e5b10-3c0b-477c-89b8-d1445ead9f26', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('8e1e0c3f-cccc-4590-8098-a1bb13d39c54', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '00ff61e1-650d-4472-934e-a5691c982c9a', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('3029c5cf-ca20-45a8-b999-7ea49bc4ad70', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', 'ad6aaa6e-cf19-4b9e-b75e-d2bbcfbdb702', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('41a0bf25-dab3-4b88-81dc-6476b3958318', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '9064b95a-a5c8-4530-886e-b179fb1d0de0', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('b17335b9-febb-44c0-80d8-9b629c2d7450', '08535181-e45d-4765-8907-76dade3f5942', '036b14ae-d6c0-469a-861a-b8224c6f33b2', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('01d48783-be5a-43ca-807d-74be8d060123', '08535181-e45d-4765-8907-76dade3f5942', '06420d25-7f98-4b64-aa76-f2b3195f78a6', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('8cdcb594-8da0-4746-8f05-624c1c248b17', '08535181-e45d-4765-8907-76dade3f5942', 'cf27d3d2-311c-4aab-8527-59b044c74986', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('62c2e19a-9934-4f7a-bac1-316325f1f40a', '08535181-e45d-4765-8907-76dade3f5942', 'be82b595-123a-48a3-8958-0b9f37b5078c', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('ceca00db-db4a-4cf8-b3c3-ebdc39d4224d', '08535181-e45d-4765-8907-76dade3f5942', '36f7f299-a742-4109-91e0-ca39a3298ed0', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('db31f87e-ea15-4842-b63e-da01d0564cfd', '08535181-e45d-4765-8907-76dade3f5942', '4a677e8b-afdc-4a46-a98f-b3acfe8673fa', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('a4406786-ad1a-4e9d-8d80-3d63f54d1b59', '08535181-e45d-4765-8907-76dade3f5942', '4d58eb8d-dcab-4f48-b3aa-f1007b3ddcfd', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('33ab57ab-3f97-460c-aa3d-e39a0370db04', '08535181-e45d-4765-8907-76dade3f5942', '2140f3d9-241f-40ba-8a38-c7b0c48b72ed', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('e18a3ce8-9bc1-49be-a903-017f53a620b1', '08535181-e45d-4765-8907-76dade3f5942', 'fe2b71f7-aad1-4e45-bc04-931bfc27ea36', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('1db376ca-3929-44f0-af99-9fbf07294470', '08535181-e45d-4765-8907-76dade3f5942', '778ee728-4986-4aaa-946c-a73fe2bfa2a4', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('ffe0c348-f0e2-4781-ac24-03a2e504787b', '08535181-e45d-4765-8907-76dade3f5942', '400c16d0-352d-487f-ad20-7d4ea587f4a4', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('269950b3-e9bf-4ccc-bbac-5b94e5515364', '08535181-e45d-4765-8907-76dade3f5942', '20b62e82-6d40-483e-812a-33f80b957e1d', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('40d793b4-c9d6-4715-8785-f89d05013e84', '08535181-e45d-4765-8907-76dade3f5942', '586020c3-88e9-4ecd-88fb-38c2204354f5', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('b212d483-cd15-40c9-b98a-4882315ad746', '08535181-e45d-4765-8907-76dade3f5942', 'abe6a521-8293-4476-a768-8a81a52b1583', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('4cbc1ff5-527d-4c61-8993-8995219198a4', '08535181-e45d-4765-8907-76dade3f5942', 'f99eab0c-fd91-4e7c-a9d8-091fde7b8057', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('b68e9ac8-ed7a-4876-a8a3-3502240bb5ea', '08535181-e45d-4765-8907-76dade3f5942', '1641be7f-5815-42ab-b2ad-b772370ae4db', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('4eebcdd8-f60b-4088-abb9-878d7586254b', '08535181-e45d-4765-8907-76dade3f5942', '66ed504a-e541-4885-8e6b-fe54e5ef888a', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('7ab0baee-a659-4246-83cf-bf3c968ca173', '08535181-e45d-4765-8907-76dade3f5942', '974e5b10-3c0b-477c-89b8-d1445ead9f26', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('8ee90ed1-c9e2-4c12-85e7-6fb7a43edcc9', '08535181-e45d-4765-8907-76dade3f5942', '00ff61e1-650d-4472-934e-a5691c982c9a', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('c86825e8-2188-4825-9f6f-5391747b3b35', '08535181-e45d-4765-8907-76dade3f5942', 'ad6aaa6e-cf19-4b9e-b75e-d2bbcfbdb702', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('a1010107-aee3-409a-ab25-3a41f2f1de14', '08535181-e45d-4765-8907-76dade3f5942', '9064b95a-a5c8-4530-886e-b179fb1d0de0', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('235622ca-5c4d-4198-ba5d-31ed9e7456cc', '1f7845f9-23b6-40d1-b38e-b61945f640c7', '036b14ae-d6c0-469a-861a-b8224c6f33b2', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('c024cdba-79fc-4513-bf33-8e17baeb60d0', '1f7845f9-23b6-40d1-b38e-b61945f640c7', '06420d25-7f98-4b64-aa76-f2b3195f78a6', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('e4a4f36f-7d2b-46c6-b520-c378dfb15a31', '1f7845f9-23b6-40d1-b38e-b61945f640c7', 'cf27d3d2-311c-4aab-8527-59b044c74986', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('76d4d163-84c3-4cd5-a75d-587b0b25df05', '1f7845f9-23b6-40d1-b38e-b61945f640c7', 'be82b595-123a-48a3-8958-0b9f37b5078c', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('c94e9066-780a-43f2-bd5b-b1d9d475c8f0', '1f7845f9-23b6-40d1-b38e-b61945f640c7', '36f7f299-a742-4109-91e0-ca39a3298ed0', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('15eb0286-0787-49ae-99dd-8fff4f7c7f08', '1f7845f9-23b6-40d1-b38e-b61945f640c7', '4a677e8b-afdc-4a46-a98f-b3acfe8673fa', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('3a2ce97f-d604-4750-995a-78edda96dcba', '1f7845f9-23b6-40d1-b38e-b61945f640c7', '4d58eb8d-dcab-4f48-b3aa-f1007b3ddcfd', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('2d1496a3-1d36-4431-b784-35ec0cf1073b', '1f7845f9-23b6-40d1-b38e-b61945f640c7', '2140f3d9-241f-40ba-8a38-c7b0c48b72ed', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('520c64e8-407a-45c4-af13-7c65f4016c05', '1f7845f9-23b6-40d1-b38e-b61945f640c7', 'fe2b71f7-aad1-4e45-bc04-931bfc27ea36', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('a20c28fa-a223-4a1d-9cef-f824b6cf79fb', '1f7845f9-23b6-40d1-b38e-b61945f640c7', '778ee728-4986-4aaa-946c-a73fe2bfa2a4', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('a9f71096-aabc-4d8a-a62c-e854686b2304', '1f7845f9-23b6-40d1-b38e-b61945f640c7', '400c16d0-352d-487f-ad20-7d4ea587f4a4', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('068d1e9c-9b22-4b2d-b0c0-06ce17a1de96', '1f7845f9-23b6-40d1-b38e-b61945f640c7', '20b62e82-6d40-483e-812a-33f80b957e1d', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('4da0ce70-48a7-4590-8b8a-6da31f849c50', '1f7845f9-23b6-40d1-b38e-b61945f640c7', '586020c3-88e9-4ecd-88fb-38c2204354f5', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('afb50887-bd35-49b0-9fd4-d7138dd87941', '1f7845f9-23b6-40d1-b38e-b61945f640c7', 'abe6a521-8293-4476-a768-8a81a52b1583', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('607ccc95-80f6-4f8f-b38d-f408f9b37f0e', '1f7845f9-23b6-40d1-b38e-b61945f640c7', 'f99eab0c-fd91-4e7c-a9d8-091fde7b8057', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('55bcf80a-2d87-44a9-9c77-6222bd7aabe8', '1f7845f9-23b6-40d1-b38e-b61945f640c7', '1641be7f-5815-42ab-b2ad-b772370ae4db', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('5a16aac0-b101-45c9-95a2-db7919289b40', '1f7845f9-23b6-40d1-b38e-b61945f640c7', '66ed504a-e541-4885-8e6b-fe54e5ef888a', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('bd65fccc-113a-4861-816b-96207daf66dd', '1f7845f9-23b6-40d1-b38e-b61945f640c7', '974e5b10-3c0b-477c-89b8-d1445ead9f26', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('c892a115-f386-473a-9c20-244278cb62f4', '1f7845f9-23b6-40d1-b38e-b61945f640c7', '00ff61e1-650d-4472-934e-a5691c982c9a', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('63caedf4-ff50-47ac-bde5-592d84605d28', '1f7845f9-23b6-40d1-b38e-b61945f640c7', 'ad6aaa6e-cf19-4b9e-b75e-d2bbcfbdb702', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('e506b458-a921-41a6-939a-9c7d4abcf58c', '1f7845f9-23b6-40d1-b38e-b61945f640c7', '9064b95a-a5c8-4530-886e-b179fb1d0de0', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('aa6dddb9-ffd9-4f24-9b38-72a71374eab9', '5355bfc7-8607-4d9d-bed8-1be055aba058', '036b14ae-d6c0-469a-861a-b8224c6f33b2', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('6c8916d1-dcf3-4db0-93ff-300f4d711b82', '5355bfc7-8607-4d9d-bed8-1be055aba058', '06420d25-7f98-4b64-aa76-f2b3195f78a6', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('d2770cf9-5f17-42b8-9b1d-27a73893cd9a', '5355bfc7-8607-4d9d-bed8-1be055aba058', 'cf27d3d2-311c-4aab-8527-59b044c74986', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('99560c2a-fcf4-4046-840a-dc92410692d8', '5355bfc7-8607-4d9d-bed8-1be055aba058', 'be82b595-123a-48a3-8958-0b9f37b5078c', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('adaa96d2-4290-405d-bf4b-b49cd792a430', '5355bfc7-8607-4d9d-bed8-1be055aba058', '36f7f299-a742-4109-91e0-ca39a3298ed0', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('8c02584c-e2e6-4a94-ad9c-f8a167bad646', '5355bfc7-8607-4d9d-bed8-1be055aba058', '4a677e8b-afdc-4a46-a98f-b3acfe8673fa', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('1bcce2b0-c6a7-4f89-8a02-4dbe3a615c40', '5355bfc7-8607-4d9d-bed8-1be055aba058', '4d58eb8d-dcab-4f48-b3aa-f1007b3ddcfd', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('107a0a62-8b92-4be6-9052-2701bf0e7752', '5355bfc7-8607-4d9d-bed8-1be055aba058', '2140f3d9-241f-40ba-8a38-c7b0c48b72ed', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('1a34478f-703d-42ad-90bc-c5dfd0d8fd25', '5355bfc7-8607-4d9d-bed8-1be055aba058', 'fe2b71f7-aad1-4e45-bc04-931bfc27ea36', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('8ba46a8a-0e86-476b-8bc9-c196732867c6', '5355bfc7-8607-4d9d-bed8-1be055aba058', '778ee728-4986-4aaa-946c-a73fe2bfa2a4', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('0614bdc3-3283-4b53-bf75-c89bcbae9d63', '5355bfc7-8607-4d9d-bed8-1be055aba058', '400c16d0-352d-487f-ad20-7d4ea587f4a4', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('e9c02f62-eb82-431e-8cae-88861adac065', '5355bfc7-8607-4d9d-bed8-1be055aba058', '20b62e82-6d40-483e-812a-33f80b957e1d', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('76a37a2a-1dc2-4920-be06-71eb27615c96', '5355bfc7-8607-4d9d-bed8-1be055aba058', '586020c3-88e9-4ecd-88fb-38c2204354f5', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('8ec10342-fb2b-4f49-8cc6-e3f692b95ff6', '5355bfc7-8607-4d9d-bed8-1be055aba058', 'abe6a521-8293-4476-a768-8a81a52b1583', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('8e5aeecd-c11b-4b27-9cfa-2bdbb5628109', '5355bfc7-8607-4d9d-bed8-1be055aba058', 'f99eab0c-fd91-4e7c-a9d8-091fde7b8057', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('914bc538-abb0-4ef5-b289-dd6d15ab7af0', '5355bfc7-8607-4d9d-bed8-1be055aba058', '1641be7f-5815-42ab-b2ad-b772370ae4db', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('2666595f-8ea6-4de6-b5ca-c97eb733e823', '5355bfc7-8607-4d9d-bed8-1be055aba058', '66ed504a-e541-4885-8e6b-fe54e5ef888a', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('3096b915-7941-488e-bbda-8e46c18f1c09', '5355bfc7-8607-4d9d-bed8-1be055aba058', '974e5b10-3c0b-477c-89b8-d1445ead9f26', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('6fba362e-23bf-4c99-9daa-af01991ca7f4', '5355bfc7-8607-4d9d-bed8-1be055aba058', '00ff61e1-650d-4472-934e-a5691c982c9a', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('3f97f734-8b30-44a9-9983-40741fdcbaa2', '5355bfc7-8607-4d9d-bed8-1be055aba058', 'ad6aaa6e-cf19-4b9e-b75e-d2bbcfbdb702', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('7d26679a-6de2-4a82-b61f-0f9acfaee4ec', '5355bfc7-8607-4d9d-bed8-1be055aba058', '9064b95a-a5c8-4530-886e-b179fb1d0de0', 20, 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024');

INSERT INTO order_status(name, description, create_username, create_timestamp, modify_username, modify_timestamp)
VALUES
('Received', 'Order has been sent to payment processor', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('Processed', 'Order has been paid for via payment processor', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('Shipped', 'Order has been shipped from store', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('Ready For Pickup', 'Order is ready for pickup from store', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('Cancelled', 'Order has been cancelled', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024');

INSERT INTO promotion(promotion_id, name, description, discount_percentage, start_timestamp, end_timestamp, create_username, create_timestamp, modify_username, modify_timestamp)
VALUES
('b96d0cd6-a7ac-4895-a1e8-03b8feb966a4', 'Happy Birthday Dr. Suess!', 'It''s Dr. Suess''s birthday! Let''s celebrate by reading his works!', 5.00, '04/06/2024', '04/15/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024');

INSERT INTO dbo.[order](order_id, promotion_id, store_id, customer_id, address_id, in_store_pickup, order_status_id, processed_timestamp, create_username, create_timestamp, modify_username, modify_timestamp)
VALUES
('2a2c0e97-c9af-4519-9b92-0969731d9c61', null, '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '1d399f7b-5a54-4f6a-b54c-2c284cbcab00', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('14321f55-7f40-4e5d-8ff9-85373fd2999b', null, '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '6f3d6da6-3d1d-42e3-b000-2618ebe4f41a', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('53d8da18-9458-432d-b83c-2f8124a2bbe6', null, '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', 'd4fd5b04-bcbd-4e4a-b67f-2a540ae3a922', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('f5ef9265-a4f8-4633-96a0-80f7de9e9e89', null, '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '27a67efb-5bed-4996-8e8c-60bc30ab30a2', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('98e3258b-c06b-4bab-9ae8-a45084c10415', null, '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '7335c014-7101-4d02-ad46-d41f100f5a79', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('d1de9421-72a8-467b-9eb1-ee0c30881c08', null, '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', 'ac517728-ea52-4f2c-9840-8af8a5ebf6df', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('2bb332ad-2139-48e8-b551-f877402ac2eb', null, '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '2ac9a5b2-9e5f-4b77-92c3-aa1f31713555', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('4675e1a9-b233-4d67-94f1-cd7b1eec2b7e', null, '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '3473473b-3feb-45b5-a6af-56c77524e7c6', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('a5072951-d4ba-4cbf-8016-e7e998201a5a', null, '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '6257212f-56d6-4c51-a744-6386520dc8f6', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('936074a7-8c26-4791-b199-4bf53f84a72e', null, '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '0af497d3-02f1-4ffd-9b89-4c1e85103926', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('3ee4cc24-ade3-4cf2-ab83-84e509952c6c', null, '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', '8e75f874-a241-480c-8752-4aa1825c52af', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('34b31cd3-e846-433f-85f0-88012a8d68f4', null, '08535181-e45d-4765-8907-76dade3f5942', '41e8264d-800b-4291-829a-d6c92a62e5d4', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('17d3363d-c788-4dfd-ab1c-4a827345baf7', null, '08535181-e45d-4765-8907-76dade3f5942', 'a9b19b81-496c-4d02-b127-07bb01c56a4b', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('5139f28e-d701-4160-a793-d87199905083', null, '08535181-e45d-4765-8907-76dade3f5942', '16a4336a-c0f1-4ab9-8d23-a92bbb12c322', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('d6bb642b-1859-4db1-b097-c3c5f184f97a', 'b96d0cd6-a7ac-4895-a1e8-03b8feb966a4', '08535181-e45d-4765-8907-76dade3f5942', '60d1e496-ca5e-4515-bcb3-1511e15c3779', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('0c5d9c3f-2c07-42df-85f2-4de4757ff3f6', 'b96d0cd6-a7ac-4895-a1e8-03b8feb966a4', '08535181-e45d-4765-8907-76dade3f5942', '5b54964c-8151-44c6-bf4e-c53eb85788d7', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('32277f17-43d1-4ff5-98e5-ecef91972b58', 'b96d0cd6-a7ac-4895-a1e8-03b8feb966a4', '08535181-e45d-4765-8907-76dade3f5942', '1d1fa47c-9800-4bce-a3ce-0768b2be6d46', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('d0fbb685-19ff-47d3-b6ac-63058b67a728', 'b96d0cd6-a7ac-4895-a1e8-03b8feb966a4', '08535181-e45d-4765-8907-76dade3f5942', '28fc2227-2287-44af-b61a-810a4479ed65', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('594644cb-91e6-4b37-9e5f-e4857e3c9842', 'b96d0cd6-a7ac-4895-a1e8-03b8feb966a4', '08535181-e45d-4765-8907-76dade3f5942', '841717d4-dec4-4be9-aff0-27cd71b2e138', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('0765f506-ddf9-47a1-bd79-374a3a226007', 'b96d0cd6-a7ac-4895-a1e8-03b8feb966a4', '08535181-e45d-4765-8907-76dade3f5942', '2f15d516-ab29-45e5-b922-3f1ad979ae50', null, 1, 1, '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024');

INSERT INTO order_line_item(order_line_item_id, order_id, product_id, quantity, create_username, create_timestamp, modify_username, modify_timestamp)
VALUES
('a6c9ea6a-43f1-482d-a278-4cb0b6970f96', '2a2c0e97-c9af-4519-9b92-0969731d9c61', '036b14ae-d6c0-469a-861a-b8224c6f33b2', 4, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('9a005c9d-86f9-4e8a-8c56-05ce942426c6', '14321f55-7f40-4e5d-8ff9-85373fd2999b', '036b14ae-d6c0-469a-861a-b8224c6f33b2', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('55e76234-b49c-4d6a-9895-13df113c48cc', '53d8da18-9458-432d-b83c-2f8124a2bbe6', '036b14ae-d6c0-469a-861a-b8224c6f33b2', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('57a30b6f-f6a2-4585-8834-6987cb4675b6', 'f5ef9265-a4f8-4633-96a0-80f7de9e9e89', '036b14ae-d6c0-469a-861a-b8224c6f33b2', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('b762e37d-5574-4e58-b970-8ded0fe3effd', '98e3258b-c06b-4bab-9ae8-a45084c10415', '974e5b10-3c0b-477c-89b8-d1445ead9f26', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('03b9026f-0690-4a08-ab0c-c89cd7c42424', 'd1de9421-72a8-467b-9eb1-ee0c30881c08', '974e5b10-3c0b-477c-89b8-d1445ead9f26', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('8b4d3e8b-46f2-4146-b903-89881d9cc554', '2bb332ad-2139-48e8-b551-f877402ac2eb', '974e5b10-3c0b-477c-89b8-d1445ead9f26', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('da11a03a-504a-485c-85c0-14c268e67477', '4675e1a9-b233-4d67-94f1-cd7b1eec2b7e', '778ee728-4986-4aaa-946c-a73fe2bfa2a4', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('c1c59f9b-1ba7-4dc2-8b04-11ca3f56edd9', '4675e1a9-b233-4d67-94f1-cd7b1eec2b7e', '400c16d0-352d-487f-ad20-7d4ea587f4a4', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('52ed3117-1779-4d6e-9637-c95a75bacdb3', '4675e1a9-b233-4d67-94f1-cd7b1eec2b7e', '20b62e82-6d40-483e-812a-33f80b957e1d', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('29a1372d-57a6-429a-a841-367d3080c52f', 'a5072951-d4ba-4cbf-8016-e7e998201a5a', '06420d25-7f98-4b64-aa76-f2b3195f78a6', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('3df1f5c5-3d54-447b-8e19-44eba923044f', 'a5072951-d4ba-4cbf-8016-e7e998201a5a', 'cf27d3d2-311c-4aab-8527-59b044c74986', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('6e6e45f5-fd5e-442b-b431-ff760d9c05fb', 'a5072951-d4ba-4cbf-8016-e7e998201a5a', 'be82b595-123a-48a3-8958-0b9f37b5078c', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('7382d5fb-fa8f-442a-8400-bc05422df070', 'a5072951-d4ba-4cbf-8016-e7e998201a5a', '36f7f299-a742-4109-91e0-ca39a3298ed0', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('111bff4a-55a8-4556-ab39-825947506eb5', 'a5072951-d4ba-4cbf-8016-e7e998201a5a', '4a677e8b-afdc-4a46-a98f-b3acfe8673fa', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('306fc2ac-9b4b-48c1-82c5-b823567e30ed', 'a5072951-d4ba-4cbf-8016-e7e998201a5a', '4d58eb8d-dcab-4f48-b3aa-f1007b3ddcfd', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('ed2e7dc4-2dc7-4572-b607-d63388c60430', 'a5072951-d4ba-4cbf-8016-e7e998201a5a', '2140f3d9-241f-40ba-8a38-c7b0c48b72ed', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('0c5a9e33-bc1f-4424-b353-fd4cde4efe37', '936074a7-8c26-4791-b199-4bf53f84a72e', 'fe2b71f7-aad1-4e45-bc04-931bfc27ea36', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('8537a1f1-6266-4df9-8d10-16a476f305ed', '3ee4cc24-ade3-4cf2-ab83-84e509952c6c', '9064b95a-a5c8-4530-886e-b179fb1d0de0', 15, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('f47c8c39-f654-4bc2-a945-4c186a43dbae', '34b31cd3-e846-433f-85f0-88012a8d68f4', 'f99eab0c-fd91-4e7c-a9d8-091fde7b8057', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('22a4f9b5-e438-4aa9-bbe4-7c4c2102f54d', '17d3363d-c788-4dfd-ab1c-4a827345baf7', 'f99eab0c-fd91-4e7c-a9d8-091fde7b8057', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('1e1683af-d95e-432b-a5a3-b99ab8f8bee3', '5139f28e-d701-4160-a793-d87199905083', 'f99eab0c-fd91-4e7c-a9d8-091fde7b8057', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('6e0dd227-bc48-4fd0-8ed4-a3826632affe', 'd6bb642b-1859-4db1-b097-c3c5f184f97a', 'abe6a521-8293-4476-a768-8a81a52b1583', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('003690c7-20ec-418a-ae06-6d3f78f340c7', 'd6bb642b-1859-4db1-b097-c3c5f184f97a', 'f99eab0c-fd91-4e7c-a9d8-091fde7b8057', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('9876f16e-ba4e-4343-ac6d-1e460573844d', 'd6bb642b-1859-4db1-b097-c3c5f184f97a', '1641be7f-5815-42ab-b2ad-b772370ae4db', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('d20a08ef-9c4d-45f3-b2de-184188e337b9', 'd6bb642b-1859-4db1-b097-c3c5f184f97a', '66ed504a-e541-4885-8e6b-fe54e5ef888a', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('7a1ed91b-5d55-42c6-ac40-990a47b25306', '0c5d9c3f-2c07-42df-85f2-4de4757ff3f6', 'abe6a521-8293-4476-a768-8a81a52b1583', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('0c5f5c9a-6395-4abd-b1fb-bce7e3977899', '0c5d9c3f-2c07-42df-85f2-4de4757ff3f6', 'f99eab0c-fd91-4e7c-a9d8-091fde7b8057', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('ab84b349-7a3b-4cbd-a99f-f82cd0ab8703', '0c5d9c3f-2c07-42df-85f2-4de4757ff3f6', '1641be7f-5815-42ab-b2ad-b772370ae4db', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('d9e15d5b-6878-4e14-9e79-6631d9f46777', '0c5d9c3f-2c07-42df-85f2-4de4757ff3f6', '66ed504a-e541-4885-8e6b-fe54e5ef888a', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('8bec5c1e-16db-4c13-851b-b61a6a9e2ac7', '0c5d9c3f-2c07-42df-85f2-4de4757ff3f6', 'ad6aaa6e-cf19-4b9e-b75e-d2bbcfbdb702', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('9b9d28b7-1340-42ef-b519-bd795148d113', '32277f17-43d1-4ff5-98e5-ecef91972b58', 'ad6aaa6e-cf19-4b9e-b75e-d2bbcfbdb702', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('70b1d80a-dd77-49b2-b36d-da0e083920bd', 'd0fbb685-19ff-47d3-b6ac-63058b67a728', 'ad6aaa6e-cf19-4b9e-b75e-d2bbcfbdb702', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('2274ee35-39a8-4b7a-a392-1201c44977bd', '594644cb-91e6-4b37-9e5f-e4857e3c9842', 'ad6aaa6e-cf19-4b9e-b75e-d2bbcfbdb702', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('458045a2-2b1a-4e93-bb52-197bf7c80fc4', '0765f506-ddf9-47a1-bd79-374a3a226007', 'ad6aaa6e-cf19-4b9e-b75e-d2bbcfbdb702', 1, 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024');

INSERT INTO product_promotion(product_promotion_id, promotion_id, product_id, create_username, create_timestamp, modify_username, modify_timestamp)
VALUES
('7edab0dc-5cd3-4602-88b2-3957f218d79d', 'b96d0cd6-a7ac-4895-a1e8-03b8feb966a4', 'abe6a521-8293-4476-a768-8a81a52b1583', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('6add130d-4944-4d77-b8be-0d7def8c1c2a', 'b96d0cd6-a7ac-4895-a1e8-03b8feb966a4', 'f99eab0c-fd91-4e7c-a9d8-091fde7b8057', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('4ff1eb4a-ff18-47df-8286-86fef5d78e94', 'b96d0cd6-a7ac-4895-a1e8-03b8feb966a4', '1641be7f-5815-42ab-b2ad-b772370ae4db', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('62791c79-6ed6-434b-8fd0-b8110ebe9131', 'b96d0cd6-a7ac-4895-a1e8-03b8feb966a4', '66ed504a-e541-4885-8e6b-fe54e5ef888a', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('ab1c4a6a-4123-4282-8573-400d76ebfdc2', 'b96d0cd6-a7ac-4895-a1e8-03b8feb966a4', 'ad6aaa6e-cf19-4b9e-b75e-d2bbcfbdb702', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024');

INSERT INTO event(event_id, store_id, pomotion_id, name, image_url, image_2_url, description, start_timestamp, end_timestamp, create_username, create_timestamp, modify_username, modify_timestamp)
VALUES
('34de8545-ecdf-4ec8-92ad-c388eed10303', '7461a9b9-b6f6-439d-aadb-04f9ba57e8c5', null, 'Summer Reading Program', 'some_url', 'some_url_2', 'Keep your kids reading over the summer!', '06/21/2024', '08/05/2024', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024');

INSERT INTO event_featured_product(event_featured_product_id, event_id, product_id, create_username, create_timestamp, modify_username, modify_timestamp)
VALUES
('3dc67ba0-9e39-49ee-8363-7ca57189a784', '34de8545-ecdf-4ec8-92ad-c388eed10303', '06420d25-7f98-4b64-aa76-f2b3195f78a6', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('8b675b62-b0cc-4a88-afc4-8a74cdaeef30', '34de8545-ecdf-4ec8-92ad-c388eed10303', 'cf27d3d2-311c-4aab-8527-59b044c74986', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('cb259b80-96ce-4fd0-97d4-9606a5ade889', '34de8545-ecdf-4ec8-92ad-c388eed10303', 'be82b595-123a-48a3-8958-0b9f37b5078c', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('b4e82272-4ddc-450f-9254-2f9b360a4c3b', '34de8545-ecdf-4ec8-92ad-c388eed10303', '36f7f299-a742-4109-91e0-ca39a3298ed0', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('2dc41ce7-3701-4013-bdd0-2a47f32c5ac7', '34de8545-ecdf-4ec8-92ad-c388eed10303', '4a677e8b-afdc-4a46-a98f-b3acfe8673fa', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('aa4d51a6-4296-4ac3-b732-35d6e6aa716c', '34de8545-ecdf-4ec8-92ad-c388eed10303', '4d58eb8d-dcab-4f48-b3aa-f1007b3ddcfd', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('e180465c-bcfa-48d4-883e-67ccb3214672', '34de8545-ecdf-4ec8-92ad-c388eed10303', '2140f3d9-241f-40ba-8a38-c7b0c48b72ed', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('4c4fc463-8fce-42c0-9705-6b2ce50465ca', '34de8545-ecdf-4ec8-92ad-c388eed10303', 'fe2b71f7-aad1-4e45-bc04-931bfc27ea36', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('1df1832b-b712-416b-a5f7-c3ee4ff61480', '34de8545-ecdf-4ec8-92ad-c388eed10303', '778ee728-4986-4aaa-946c-a73fe2bfa2a4', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('1e828a84-f2f8-40b0-b637-4e5349c78566', '34de8545-ecdf-4ec8-92ad-c388eed10303', '400c16d0-352d-487f-ad20-7d4ea587f4a4', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('896134f5-7f35-4abe-80ac-a8d61e099c45', '34de8545-ecdf-4ec8-92ad-c388eed10303', '20b62e82-6d40-483e-812a-33f80b957e1d', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('55b5460b-e5b0-4e19-ba77-1fed849a7006', '34de8545-ecdf-4ec8-92ad-c388eed10303', 'abe6a521-8293-4476-a768-8a81a52b1583', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('47cd0953-6e7b-4ac5-a419-649cd734537d', '34de8545-ecdf-4ec8-92ad-c388eed10303', 'f99eab0c-fd91-4e7c-a9d8-091fde7b8057', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('3a945596-6111-4b83-a7d7-44077d1d936b', '34de8545-ecdf-4ec8-92ad-c388eed10303', '1641be7f-5815-42ab-b2ad-b772370ae4db', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024'),
('7de52340-19eb-4960-b7eb-17377870eaec', '34de8545-ecdf-4ec8-92ad-c388eed10303', '66ed504a-e541-4885-8e6b-fe54e5ef888a', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024');

INSERT INTO deliverable_regions(country_code, state_code, create_username, create_timestamp, modify_username, modify_timestamp)
VALUES
('US', 'NE', 'aidan.polivka@gmail.com', '04/07/2024', 'aidan.polivka@gmail.com', '04/07/2024');

COMMIT TRANSACTION