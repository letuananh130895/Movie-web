create table Account(
	USER_NAME varchar(64) not null primary key,
	PASSWORD varchar(64) not null,
	EMAIL varchar(64),
	VIP_POINT int,
	VIP_TIME int,
	PER tinyint not null
);
create table Movie(
	ID smallint NOT NULL AUTO_INCREMENT primary key,
	NAME varchar(64) not null, 
	IMG varchar(64) not null,
	YEAR year not null,
	TYPE varchar(64) not null,
	DES varchar(512),
	URL varchar(64) not null,
	VIEW int unsigned
);

create table History(
	USER_NAME varchar(64) not null,
	ACTION varchar(64) not null,
	LOG_TIME int unsigned not null primary key,
	TOPUP smallint,
	POINT_USED smallint,
	foreign key(USER_NAME) references Account(USER_NAME)
);

create table Contact(
	NAME varchar(64) not null,
	EMAIL varchar(64) not null,
	MESSAGE varchar(512) not null,
	

TIME int unsigned not null primary key
);


create table Card(CODE varchar(10) not null primary key, POINT smallint not null);
insert into Card values ('1',10);
insert into Card values ('2',20);
insert into Card values ('3',30);
insert into Card values ('4',40);
insert into Card values ('5',50);
insert into Card values ('6',60);
insert into Card values ('7',70);
insert into Card values ('8',80);
insert into Card values ('9',90);
insert into Card values ('10',100);



create table Captcha(img char(4) not null primary key, code char(4) not null);
insert into Captcha values('3565','3565');
insert into Captcha values('3783','3783');
insert into Captcha values('5853','5853');
insert into Captcha values('7209','7209');
insert into Captcha values('7232','7232');
insert into Captcha values('7264','7264');
insert into Captcha values('7774','7774');
insert into Captcha values('8033','8033');
insert into Captcha values('8232','8232');
insert into Captcha values('9761','9761');
insert into Captcha values('1004','1004');
insert into Captcha values('1303','1303');
insert into Captcha values('1386','1386');
insert into Captcha values('2305','2305');
insert into Captcha values('2453','2453');
insert into Captcha values('2576','2576');
insert into Captcha values('2996','2996');
insert into Captcha values('7008','7008');
insert into Captcha values('8424','8424');
insert into Captcha values('9183','9183');
insert into Captcha values('9501','9501');
insert into Captcha values('9887','9887');
insert into Captcha values('1336','1336');
insert into Captcha values('1518','1518');
insert into Captcha values('1771','1771');
insert into Captcha values('1843','1843');
insert into Captcha values('2052','2052');
insert into Captcha values('2214','2214');
insert into Captcha values('3294','3294');
insert into Captcha values('4535','4535');
insert into Captcha values('5219','5219');
insert into Captcha values('5453','5453');
insert into Captcha values('5678','5678');
insert into Captcha values('5957','5957');
insert into Captcha values('6478','6478');
insert into Captcha values('6994','6994');
insert into Captcha values('7023','7023');
insert into Captcha values('7444','7444');
insert into Captcha values('8281','8281');
insert into Captcha values('8399','8399');
insert into Captcha values('9292','9292');
insert into Captcha values('9804','9804');


delimiter $$
create trigger error1 before insert
on Account for each row
begin
if char_length(new.USER_NAME) not between 1 and 8
then signal sqlstate value '45000'
set message_text='Your user name is not valid! (1-8 characters)';
end if;
if new.USER_NAME like '% %'
then signal sqlstate value '45000'
set message_text='Your user name has white space!';
end if;
if char_length(new.PASSWORD) not between 1 and 16
then signal sqlstate value '45000'
set message_text='Your password is not valid! (1-16 characters)';
end if;
if new.PASSWORD like '% %'
then signal sqlstate value '45000'
set message_text='Your password has white space!';
end if;
if char_length(new.EMAIL) not between 6 and 20
then signal sqlstate value '45000'
set message_text='Your email is not valid! (6-20 characters)';
end if;
if new.EMAIL not like '%@%.%'
then signal sqlstate value '45000'
set message_text='Your email is not valid! (Sample: ***@***.***)';
end if;
if new.email like '% %'
then signal sqlstate value '45000'
set message_text='Your email has white space!';
end if;
end;
$$

delimiter $$
create trigger error2 before update
on Account for each row
begin
if char_length(new.PASSWORD) not between 1 and 16
then signal sqlstate value '45000'
set message_text='Password is not valid! (1-16 characters)';
end if;
if new.PASSWORD like '% %'
then signal sqlstate value '45000'
set message_text='Password has white space!';
end if;
if char_length(new.EMAIL) not between 6 and 20
then signal sqlstate value '45000'
set message_text='Email is not valid! (6-20 characters)';
end if;
if new.EMAIL not like '%@%.%'
then signal sqlstate value '45000'
set message_text='Email is not valid! (Sample: ***@***.***)';
end if;
if new.email like '% %'
then signal sqlstate value '45000'
set message_text='Email has white space!';
end if;
end;
$$

delimiter $$
create trigger error3 before insert
on Contact for each row
begin
if char_length(new.NAME) not between 1 and 30
then signal sqlstate value '45000'
set message_text='Your name is not valid! (1-30 characters)';
end if;
if new.NAME like '% %'
then signal sqlstate value '45000'
set message_text='Your name has white space';
end if;
if char_length(new.EMAIL) not between 6 and 20
then signal sqlstate value '45000'
set message_text='Your email is not valid! (6-20 chracters)';
end if;
if new.EMAIL not like '%@%.%'
then signal sqlstate value '45000'
set message_text='Your email is not valid! (Sample: ***@***.***)';
end if;
if new.EMAIL like '% %'
then signal sqlstate value '45000'
set message_text='Your email has white space!';
end if;
if char_length(new.MESSAGE) not between 1 and 365
then signal sqlstate value '45000'
set message_text='Your message is not valid! (1->365 characters)';
end if;
end;
$$