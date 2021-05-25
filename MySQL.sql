CREATE TABLE IF NOT EXISTS jobs(
  id int NOT NULL primary key AUTO_INCREMENT COMMENT 'primary key',
  title VARCHAR (255) COMMENT 'Job Title',
  location VARCHAR (255) COMMENT 'Job Location',
  description varchar(255) COMMENT 'Product Description',
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update'
) default charset utf8 COMMENT '';
CREATE TABLE IF NOT EXISTS contractors(
  id int NOT NULL primary key AUTO_INCREMENT COMMENT 'primary key',
  comapnyName VARCHAR (255) COMMENT 'Comany Name',
  location VARCHAR (255) COMMENT 'Job Location',
  skill varchar(255) COMMENT 'Skill Description',
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update'
) default charset utf8 COMMENT '';
COMMENT "===== JOBS DATA ====";
INSERT INTO
  jobs(title)
VALUES
  ("Google Intern");
INSERT INTO
  jobs(location, description)
VALUES
  ("Remote", "Alot of Googling");
COMMENT "=====contractors DATA====";
INSERT INTO
  contractors(comapnyName)
VALUES
  ("ABC XYZ.com");
INSERT INTO
  contractors(location, skill)
VALUES
  ("Idahome", "Full stack developer");
CREATE TABLE IF NOT EXISTS contractor_jobs(
    id int NOT NULL primary key AUTO_INCREMENT COMMENT 'primary key',
    contractorId int NOT NULL COMMENT 'FOREIGN KEY: CONTRACTOR Relationship',
    jobId int NOT NULL COMMENT 'FOREIGN KEY: JOB Relationship',
    FOREIGN KEY (contractorId) REFERENCES contractors(id) ON DELETE CASCADE,
    FOREIGN KEY (jobId) REFERENCES jobs(id) ON DELETE CASCADE,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update'
  );
INSERT INTO
  contractor_jobs (contractorId, jobId)
VALUES
  (1, 2);
INSERT INTO
  contractor_jobs (contractorId, jobId)
VALUES
  (2, 1);
SELECT
  j.*,
  c.location,
  cj.id as contractorjobsId,
  cj.contractorId as contractorId,
  cj.jobId as jobId
FROM
  contractor_jobs cj
  JOIN contractors c ON c.id = cj.contractorId
  JOIN jobs j ON j.id = cj.jobId
WHERE
  cj.contractorId = 2;