INSERT INTO `user`
(`email`,`password`,`type`,`firstName`,`lastName`,`birth`,`gender`,`verifyQuestion`,`verifyAnswer`,`createdAt`,`updatedAt`)
VALUES
('admin@auniv.com','b59c67bf196a4758191e42f76670ceba', 'admin','admin','A','2000-01-01','Prefer not to disclose','Who is the founder of Alex University?','Alex Lee',NOW(),NOW());

alter table `course` modify `price` int null;

select*from user;
INSERT INTO `course`
(
`courseCode`,`courseName`,`description`,`price`,`createdAt`,`updatedAt`)
VALUES
('CS115','Intro Computer Science 1','Introduction to Computer Science/Online Class',150000,NOW(),NOW()),
('CS230','Intro Computers & Comp Sys',null,130000,NOW(),NOW()),
('CS240','Data Structures & Data Mgmt',null,100000,NOW(),NOW()),
('MATH135','Algebra (Honours)','ONLN',100000,NOW(),NOW()),
('CS100','Intro Computing Through Applic','Computer Science course for first year students.',100000,NOW(),NOW()),
('ECON102','Intro Macroeconomics','Introduction to Macroeconomics',170000,NOW(),NOW()),
('MATH137','Calculus 1 (Honours)','Calculus course for first year students',120000,NOW(),NOW()),
('MATH235','Linear Algebra 2 (Honours)',null,120000,NOW(),NOW()),
('ECON238W','Environmental Economics',null,170000,NOW(),NOW());