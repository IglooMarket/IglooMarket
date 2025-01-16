CREATE TABLE users (
    user_id int auto_increment primary key,
    email varchar(50) not null unique,
    pwd varchar(50) not null,
    phone_number varchar(50) not null,
    name varchar(50) not null
);
select * from users;

drop table products;

create table products(
	product_id int auto_increment primary key,
	owner_id int not null,
	product_name varchar(50) not null,
	price int not null,
	status varchar(50) not null,
	datetime date,
	description text,
	foreign key (owner_id) REFERENCES users(user_id)
);

select * from products;
drop table messages;
create table messages(
	room_id int not null,
	receiver_id int not null,
	sender_id int not null,
	content text,
	PRIMARY KEY (room_id, receiver_id, sender_id),
	foreign key (receiver_id) REFERENCES users(user_id),
	foreign key (sender_id) REFERENCES users(user_id),
	foreign key (room_id) REFERENCES chatrooms(room_id)
);

select * from messages;

CREATE TABLE chatrooms(
	room_id int not null primary key,
	receiver_id int not null,
	sender_id int not null,
	product_id int,
	foreign key (receiver_id) REFERENCES users(user_id),
	foreign key (sender_id) REFERENCES users(user_id),
	foreign key (product_id) REFERENCES products(product_id)
);
