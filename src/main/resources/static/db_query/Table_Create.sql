CREATE TABLE `user` (
    `email` VARCHAR(150) PRIMARY KEY,
    `password` VARCHAR(120) NOT NULL,
    `studentNum` VARCHAR(8),
    `type` VARCHAR(9) NOT NULL,
    `firstName` VARCHAR(50) NOT NULL,
    `lastName` VARCHAR(50) NOT NULL,
    `birth` DATE NOT NULL,
    `gender` VARCHAR(50),
    `faculty` VARCHAR(120),
    `subject` VARCHAR(150),
    `verifyQuestion` VARCHAR(200),
    `verifyAnswer` VARCHAR(100),
    `profileUrl` VARCHAR(200),
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `course` (
    `courseCode` VARCHAR(16) PRIMARY KEY,
    `courseName` VARCHAR(150) NOT NULL,
    `description` TEXT,
    `price` INT NOT NULL,
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `class` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `courseCode` VARCHAR(16),
    `profEmail` VARCHAR(150) NOT NULL,
    `maxNum` INT NOT NULL,
    `registerDueDate` DATE NOT NULL,
    `monStartTime` INT,
    `tueStartTime` INT,
    `wedStartTime` INT,
    `thuStartTime` INT,
    `friStartTime` INT,
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `assignment` (
    `classId` INT NOT NULL,
    `asgmtId` INT NOT NULL,
    `asgmtType` VARCHAR(20) NOT NULL,
    `asgmtName` VARCHAR(200) NOT NULL,
    `content` TEXT,
    `filePath` TEXT,
    `maxScore` INT,
    `dueDate` DATE,
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `registry` (
    `classId` INT NOT NULL,
    `registerId` INT NOT NULL,
    `studentNum` VARCHAR(8) NOT NULL,
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE `submittedassignment` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `classId` INT NOT NULL,
    `asgmtId` INT NOT NULL,
    `studentNum` VARCHAR(8) NOT NULL,
    `content` TEXT,
    `filePath` TEXT,
    `score` INT,
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;