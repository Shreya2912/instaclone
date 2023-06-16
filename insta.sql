create database Insta;

use Insta;

-- select * from usnotificationser_details;
-- delete from user_details where user_name='Rohit';

-- update user_details set user_image='/nehak' where user_name='nehak';

-- Delimiter //
-- Create Trigger after_insert_details
-- after insert on  user_details for each row
-- begin
-- insert into  values(new.stud_id,new.stud_code,new.stud_name
-- ,new.subject,new.marks,new.phone,CURTIME());
-- END//

create table User_details(
	user_name varchar(255) primary key,
    bio varchar(255),
    email varchar(255) not null,
    full_name varchar(255) not null,
    -- user_image varchar(255),
    user_password varchar(255) not null,
    -- account_type boolean default '1',
    no_of_posts int
   --  follower_count int,
    -- following_count int
    
    );
 
 
create table posts(
	postid int primary key,
    -- caption varchar(100),
    postText longtext ,
    poster_username varchar(255) not null,
    time_stamp timestamp not null,
    no_of_likes int,
    foreign key(poster_username) references User_details(user_name)
); 

drop table posts;

create table saved_post(
	savep_id int primary key,
    post_id int,
    owner_username varchar(50),
    foreign key(post_id) references posts(postid),
    foreign key(owner_username) references User_details(user_name)
);    
 
 create table following(
	following_id int primary key,
    own_username varchar(50) not null,
    following_username varchar(50),
    foreign key(own_username) references User_details(user_name)
);

create table follower(
	follower_id int primary key,
    own_user_name varchar(50) not null,
    follower_username varchar(50),
    foreign key(own_user_name) references User_details(user_name)
	);
    
create table comments(
	comment_id int primary key,
    comment varchar(100),
    postId int,
    commenter_username varchar(50),
    foreign key(postId) references posts(postid)
    
);   

create table notifications(
	notifi_id int primary key,
    notification varchar(100),
    my_user_name varchar(50) not null,
    foreign key(my_user_name) references User_details(user_name)
);

create table Story(
	story_id int primary key,
    story_content longtext,
    username varchar(50) not null,
	time_stamp timestamp not null,
    foreign key(username) references User_details(user_name)
);

-- drop table user_details;    

select * from user_details;
select * from saved_post;
select * from posts;
select * from likes;
select * from following;
select * from follower;

-- drop table story;
select * from comments;
select * from  Story;

-- insert into user_details(user_name,email,full_name,user_password) values ("Rohit","rohit@gmail.com","rohit","1234");

-- alter table posts drop column post_text;

alter table posts modify time_stamp varchar(100);

insert into user_details(user_name,email,full_name,user_password,no_of_posts) values ("Neha","nehaa@gmail.com","Neha Koyande","12345","0");

insert into user_details(bio) values ("Hello World!! Welcome to Profile Page");

insert into user_details(user_name,bio,email,full_name,user_password) values ("Rohit","This is bio","rohit@gmail.com","rohit","12346");


select post_text from posts 
where poster_username='Shreya' and 
time_stamp=''