create table `user`(
	`email`	varchar(150) primary key	
	,`password`	varchar(120) not null
	,`studentNum` varchar(8)
	,`type` varchar(9) not null
	,`firstName` varchar(50) not null
	,`lastName` varchar(50) not null 
	,`birth` date not null
	,`gender`  varchar(50)
	,`faculty` varchar(120)
	,`subject` varchar(150)
    ,`verifyQuestion` varchar(200)
    ,`verifyAnswer` varchar(100)
	,`profileUrl` varchar(160)
    , `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP
    , `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

create table `course`(
	`courseCode` varchar(16) primary key
	,`courseName` varchar(150) not null
	,`description` text
	,`price` int not null
	,`createdAt` timestamp DEFAULT CURRENT_TIMESTAMP
    ,`updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

create table `class`(
	`id` int auto_increment primary key
	,`courseCode` varchar(16)
	,`profEmail` varchar(150) not null
	,`maxNum` int not null
	,`registerDueDate` timestamp not null
	,`monStartTime` timestamp
	,`tueStartTime` timestamp
	,`wedStartTime` timestamp
	,`thuStartTime` timestamp
	,`friStartTime` timestamp
	,`createdAt` timestamp DEFAULT CURRENT_TIMESTAMP
    ,`updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

