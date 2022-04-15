create database hier;
use hier;
CREATE TABLE `user`(
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `job` varchar(50) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `profile_image` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `type` int NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `interest` varchar(50) DEFAULT NULL,
  `nickname` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
);
create table f_info(
    f_id int not null,
    address varchar(100) not null,
    address2 varchar(100),
    introduction varchar(1000),
    switchAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    foreign key(f_id) references user(user_id)
    ON UPDATE cascade ON DELETE cascade
);
create table product(
	product_id int primary key,
    seller_id int not null,
    is_available TINYINT not null,
    category VARCHAR(30) not null,
    title varchar(255) not null,
    filename1 VARCHAR(100), 
    filename2 VARCHAR(100), 
    filename3 VARCHAR(100), 
    filename4 VARCHAR(100), 
    filename5 VARCHAR(100), 
    filename6 VARCHAR(100), 
    filename7 VARCHAR(100), 
    filename8 VARCHAR(100),
    content longtext,
    revisionPolicy varchar(500),
    refundPolicy varchar(500),
    otherInformation varchar(500),
    createdAt DATETIME not null, 
    foreign key(seller_id) references user(user_id)
    ON UPDATE cascade ON DELETE cascade
);
create table price_info (
	product_price_id int not null,
	b_pkg_description varchar(100) not null,
    s_pkg_description varchar(100) not null, 
    p_pkg_description varchar(100) not null, 
    b_original_image char(10) not null,
    s_original_image char(10) not null,
    p_original_image char(10) not null,
    b_commercial char(10) not null,
    s_commercial char(10) not null,
    p_commercial char(10) not null,
    b_sns_Kit char(10) not null,
    s_sns_Kit char(10) not null,
    p_sns_Kit char(10) not null,
    b_draft int not null,
    s_draft int not null,
    p_draft int not null,
    b_revision int not null,
    s_revision int not null,
    p_revision int not null,
    b_default_delivery int not null,
    s_default_delivery int not null,
    p_default_delivery int not null,
    b_minimum_delivery int not null,
    s_minimum_delivery int not null,
    p_minimum_delivery int not null,
    b_additional_price int not null,
    s_additional_price int not null,
    p_additional_price int not null,
    b_price int not null,
    s_price int not null,
    p_price int not null,
    foreign key(product_price_id) references product(product_id)
    ON UPDATE cascade ON DELETE cascade
);

create table likes(
	like_id int not null auto_increment primary key,
    product_id int,
	like_userid int,
    liked_userid int,
    createdAt DATETIME,
    foreign key(like_userid) references user(user_id)
    ON UPDATE cascade ON DELETE cascade,
    foreign key(product_id) references product(product_id)
    ON UPDATE cascade ON DELETE cascade,
    foreign key(liked_userid) references product(seller_id)
    ON UPDATE cascade ON DELETE cascade
);

create table report(
	reason char(10) not null,
    product_id int not null,
	reported_userid int,
    report_userid int,
	createdAt DATETIME
);

CREATE TABLE `review` (
  `review_id` int NOT NULL auto_increment,
  `review_wid` int NOT NULL,
  `product_id` int NOT NULL,
  `seller_id` int NOT NULL,
  `content` varchar(100) NOT NULL,
  `star_point` int NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `product` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_3` FOREIGN KEY (`review_wid`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

create table orders(
	order_id int not null,
    product_id int not null,
    seller_id int not null,
    buyer_id int not null,
    order_status int not null DEFAULT '0',
    order_pkg varchar(50) not null,
    delivery_date int not null,
    order_qty int not null,
    order_price int not null,
    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (order_id)
);

create table messages(
	msg_id int not null auto_increment primary key,
    send_user_id int not null,
	recv_user_id int  not null,
    title VARCHAR(100),
    content varchar(1000),
    send_time DATETIME default CURRENT_TIMESTAMP not null,
    read_chk int default '1' not null,
    foreign key(send_user_id) references user(user_id)
    ON UPDATE cascade ON DELETE cascade,
    foreign key(recv_user_id) references user(user_id)
    ON UPDATE cascade ON DELETE cascade
)default character set utf8 collate utf8_general_ci;