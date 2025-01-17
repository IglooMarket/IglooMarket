CREATE TABLE user (
    user_id int auto_increment primary key,
    email varchar(50) not null unique,
    pwd varchar(50) not null,
    phone_number varchar(50) not null,
    name varchar(50) not null
);
select * from user;

drop table product;

create table product(
	product_id int auto_increment primary key,
	owner_id int not null,
	product_name varchar(50) not null,
	price int not null,
	status varchar(50) not null,
	datetime date,
	description text,
	foreign key (owner_id) REFERENCES user(user_id)
);

select * from product;
drop table message;
create table message(
	room_id int not null,
	receiver_id int not null,
	sender_id int not null,
	content text,
	PRIMARY KEY (room_id, receiver_id, sender_id),
	foreign key (receiver_id) REFERENCES user(user_id),
	foreign key (sender_id) REFERENCES user(user_id),
	foreign key (room_id) REFERENCES chatroom(room_id)
);

select * from message;

CREATE TABLE chatroom(
	room_id int not null primary key,
	receiver_id int not null,
	sender_id int not null,
	product_id int,
	foreign key (receiver_id) REFERENCES user(user_id),
	foreign key (sender_id) REFERENCES user(user_id),
	foreign key (product_id) REFERENCES product(product_id)
);
