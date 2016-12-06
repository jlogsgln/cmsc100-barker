-- CREATE USER 'project'@'localhost' IDENTIFIED BY 'tiger';
-- GRANT ALL ON project.* TO 'project'@'localhost';
CREATE DATABASE barker;

USE barker;

create table if not exists User(
	userid int auto_increment,
	user_full_name varchar(16) not null,
	user_handle varchar(16) not null unique,
	password varchar(16) not null,
	email varchar (50) not null,
	constraint User_userid_pk primary key(userid)
);

create table if not exists Tweets(
	tweetid int auto_increment,
	tweet varchar(140) not null,
	tweet_time dateTime not null,
	tweet_likes int,
	tweet_retweets int,
	userid int not null,
	constraint Tweets_tweetid_pk primary key(tweetid),
	constraint User_userid_fk foreign key(userid) references User(userid)
);

create table if not exists Replies(
	replyid int auto_increment,
	reply varchar(140) not null,
	reply_time dateTime not null,
	reply_likes int,
	reply_retweets int,
	tweetid int not null,
	userid int not null,
	constraint Replies_replyid_pk primary key(replyid),
	constraint Tweets_tweetid_fk foreign key(tweetid) references Tweets(tweetid) on delete cascade on update cascade
);

create table if not exists Follows(
	followid int auto_increment,
	userid_follows int not null,
	userid_followed int not null,
	constraint Follows_followid_pk primary key(followid),
	constraint User_userid_follows_fk foreign key(userid_follows) references User(userid),
	constraint User_userid_followed_fk foreign key(userid_followed) references User(userid)
);

insert into User (userid, user_full_name, user_handle, password, email) values (1, 'Julia Fields', '@jfields0', 'yQ0QADp', 'jfields0@goo.gl');
insert into User (userid, user_full_name, user_handle, password, email) values (2, 'Martha Burke', '@mburke1', 'CLORV15d8g', 'mburke1@ucoz.ru');
insert into User (userid, user_full_name, user_handle, password, email) values (3, 'Jesse Mills', '@jmills2', 'YTZxaYs', 'jmills2@walmart.com');
insert into User (userid, user_full_name, user_handle, password, email) values (4, 'Bruce Bradley', '@bbradley3', '1P2ZXlX', 'bbradley3@shareasale.com');
insert into User (userid, user_full_name, user_handle, password, email) values (5, 'Frances Kelley', '@fkelley4', 'SIJ0igj4n', 'fkelley4@merriam-webster.com');
insert into User (userid, user_full_name, user_handle, password, email) values (6, 'Kenneth Franklin', '@kfranklin5', 'tvXG8aBVs', 'kfranklin5@mysql.com');
insert into User (userid, user_full_name, user_handle, password, email) values (7, 'Louis Ferguson', '@lferguson6', 'QODjTX', 'lferguson6@wordpress.com');
insert into User (userid, user_full_name, user_handle, password, email) values (8, 'Rachel Cook', '@rcook7', 'ZMuTcs', 'rcook7@forbes.com');
insert into User (userid, user_full_name, user_handle, password, email) values (9, 'Lois Jacobs', '@ljacobs8', '3SY4i1KofoLX', 'ljacobs8@shareasale.com');
insert into User (userid, user_full_name, user_handle, password, email) values (10, 'Eugene Hayes', '@ehayes9', 'N5a1MO7ZLO', 'ehayes9@photobucket.com');
insert into User (userid, user_full_name, user_handle, password, email) values (11, 'David Adams', '@dadamsa', 'cfkKtyK', 'dadamsa@ed.gov');
insert into User (userid, user_full_name, user_handle, password, email) values (12, 'Carl Palmer', '@cpalmerb', 'LT1HWA4bDVD', 'cpalmerb@posterous.com');
insert into User (userid, user_full_name, user_handle, password, email) values (13, 'Virginia Holmes', '@vholmesc', 'NbE1Iw', 'vholmesc@google.nl');
insert into User (userid, user_full_name, user_handle, password, email) values (14, 'Philip Medina', '@pmedinad', 'flM4byP1y', 'pmedinad@diigo.com');
insert into User (userid, user_full_name, user_handle, password, email) values (15, 'Stephen Jenkins', '@sjenkinse', 'Pyv3j69V', 'sjenkinse@clickbank.net');
insert into User (userid, user_full_name, user_handle, password, email) values (16, 'Adam Andrews', '@aandrewsf', 'lw3SaDOV', 'aandrewsf@cnet.com');
insert into User (userid, user_full_name, user_handle, password, email) values (17, 'Joseph Morris', '@jmorrisg', 'lalyMZ', 'jmorrisg@mail.ru');
insert into User (userid, user_full_name, user_handle, password, email) values (18, 'Kathleen Peters', '@kpetersh', 'aBrZpYkx2g', 'kpetersh@infoseek.co.jp');
insert into User (userid, user_full_name, user_handle, password, email) values (19, 'Ronald Banks', '@rbanksi', 'uDMkm2', 'rbanksi@dagondesign.com');
insert into User (userid, user_full_name, user_handle, password, email) values (20, 'Elizabeth Rice', '@ericej', 'id6z2gzY1mf', 'ericej@nih.gov');
insert into User (userid, user_full_name, user_handle, password, email) values (21, 'Antonio Ford', '@afordk', 'FF0B4AI', 'afordk@engadget.com');
insert into User (userid, user_full_name, user_handle, password, email) values (22, 'Terry Hunter', '@thunterl', 'SS1L5IzuL', 'thunterl@princeton.edu');
insert into User (userid, user_full_name, user_handle, password, email) values (23, 'Susan Berry', '@sberrym', 'Ek0sMn2dAd', 'sberrym@wikipedia.org');
insert into User (userid, user_full_name, user_handle, password, email) values (24, 'Jesse Miller', '@jmillern', 'JsjMtCF0E', 'jmillern@redcross.org');
insert into User (userid, user_full_name, user_handle, password, email) values (25, 'Joshua Lawrence', '@jlawrenceo', '8RUjuYqxD0SO', 'jlawrenceo@photobucket.com', 10);

insert into Tweets (tweetid, tweet, tweet_time, tweet_likes, tweet_retweets, userid) values (1, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', '2016-08-06', 191, 104, 7);
insert into Tweets (tweetid, tweet, tweet_time, tweet_likes, tweet_retweets, userid) values (2, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2016-04-05', 485, 83, 24);
insert into Tweets (tweetid, tweet, tweet_time, tweet_likes, tweet_retweets, userid) values (3, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '2015-12-09', 1, 38, 6);
insert into Tweets (tweetid, tweet, tweet_time, tweet_likes, tweet_retweets, userid) values (4, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2015-12-08', 308, 114, 17);
insert into Tweets (tweetid, tweet, tweet_time, tweet_likes, tweet_retweets, userid) values (5, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '2016-11-25', 164, 235, 17);
insert into Tweets (tweetid, tweet, tweet_time, tweet_likes, tweet_retweets, userid) values (6, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2016-08-04', 131, 41, 19);
insert into Tweets (tweetid, tweet, tweet_time, tweet_likes, tweet_retweets, userid) values (7, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', '2016-10-23', 490, 128, 17);
insert into Tweets (tweetid, tweet, tweet_time, tweet_likes, tweet_retweets, userid) values (8, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', '2016-10-24', 60, 443, 25);
insert into Tweets (tweetid, tweet, tweet_time, tweet_likes, tweet_retweets, userid) values (9, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', '2016-10-17', 39, 80, 2);
insert into Tweets (tweetid, tweet, tweet_time, tweet_likes, tweet_retweets, userid) values (10, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2016-03-11', 469, 5, 5);

insert into Replies (replyid, reply, reply_time, reply_likes, reply_retweets, tweetid, userid) values (1, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', '2016-03-16', 6, 224, 5, 30);
insert into Replies (replyid, reply, reply_time, reply_likes, reply_retweets, tweetid, userid) values (2, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', '2016-07-24', 304, 153, 2, 26);
insert into Replies (replyid, reply, reply_time, reply_likes, reply_retweets, tweetid, userid) values (3, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2015-12-20', 423, 208, 6, 3);
insert into Replies (replyid, reply, reply_time, reply_likes, reply_retweets, tweetid, userid) values (4, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', '2016-06-07', 171, 437, 2, 34);
insert into Replies (replyid, reply, reply_time, reply_likes, reply_retweets, tweetid, userid) values (5, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2016-06-28', 442, 13, 8, 2);
insert into Replies (replyid, reply, reply_time, reply_likes, reply_retweets, tweetid, userid) values (6, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', '2016-10-08', 64, 231, 5, 8);
insert into Replies (replyid, reply, reply_time, reply_likes, reply_retweets, tweetid, userid) values (7, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', '2016-01-02', 347, 20, 5, 38);
insert into Replies (replyid, reply, reply_time, reply_likes, reply_retweets, tweetid, userid) values (8, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2016-07-04', 129, 362, 3, 21);
insert into Replies (replyid, reply, reply_time, reply_likes, reply_retweets, tweetid, userid) values (9, 'Fusce consequat. Nulla nisl. Nunc nisl.', '2016-04-24', 3, 265, 4, 49);
insert into Replies (replyid, reply, reply_time, reply_likes, reply_retweets, tweetid, userid) values (10, 'Fusce consequat. Nulla nisl. Nunc nisl.', '2016-09-12', 224, 422, 1, 3);

insert into Follows (followid, userid_follows, userid_followed) values (1, 2, 3);
insert into Follows (followid, userid_follows, userid_followed) values (2, 12, 13);
insert into Follows (followid, userid_follows, userid_followed) values (3, 22, 23);
insert into Follows (followid, userid_follows, userid_followed) values (4, 4, 7);
insert into Follows (followid, userid_follows, userid_followed) values (5, 8, 3);
insert into Follows (followid, userid_follows, userid_followed) values (6, 10, 3);
insert into Follows (followid, userid_follows, userid_followed) values (7, 4, 2);
insert into Follows (followid, userid_follows, userid_followed) values (8, 2, 6);
insert into Follows (followid, userid_follows, userid_followed) values (9, 1, 4);
insert into Follows (followid, userid_follows, userid_followed) values (10, 2, 1);
insert into Follows (followid, userid_follows, userid_followed) values (11, 3, 3);
insert into Follows (followid, userid_follows, userid_followed) values (12, 7, 20);
insert into Follows (followid, userid_follows, userid_followed) values (13, 15, 12);
insert into Follows (followid, userid_follows, userid_followed) values (14, 17, 17);
insert into Follows (followid, userid_follows, userid_followed) values (15, 23, 4);
insert into Follows (followid, userid_follows, userid_followed) values (16, 4, 3);
insert into Follows (followid, userid_follows, userid_followed) values (17, 2, 8);
insert into Follows (followid, userid_follows, userid_followed) values (18, 4, 19);