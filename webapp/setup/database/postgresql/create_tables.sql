CREATE TABLE CMS_USERS (
	USER_ID VARCHAR(36) NOT NULL,
	USER_NAME VARCHAR(64) NOT NULL,
	USER_PASSWORD VARCHAR(32) NOT NULL,
	USER_DESCRIPTION VARCHAR(255) NOT NULL,
	USER_FIRSTNAME VARCHAR(50) NOT NULL,
	USER_LASTNAME VARCHAR(50) NOT NULL,
	USER_EMAIL VARCHAR(100) NOT NULL,
	USER_LASTLOGIN BIGINT NOT NULL,
	USER_FLAGS INT NOT NULL,
	USER_INFO BYTEA,
	USER_ADDRESS VARCHAR(100) NOT NULL,
	USER_TYPE INT NOT NULL,
	PRIMARY KEY(USER_ID),
	UNIQUE(USER_NAME)
);

CREATE TABLE CMS_PROJECTS (
	PROJECT_ID INT NOT NULL,
	PROJECT_NAME VARCHAR(64) NOT NULL,
	PROJECT_DESCRIPTION VARCHAR(255) NOT NULL,
	PROJECT_FLAGS INT NOT NULL,
	PROJECT_TYPE INT NOT NULL,
	USER_ID VARCHAR(36) NOT NULL,
	GROUP_ID VARCHAR(36) NOT NULL,
	MANAGERGROUP_ID VARCHAR(36) NOT NULL,
	TASK_ID INT NOT NULL,
	DATE_CREATED BIGINT NOT NULL,
	PRIMARY KEY (PROJECT_ID),
	UNIQUE(PROJECT_NAME,DATE_CREATED)
);

CREATE TABLE CMS_BACKUP_PROJECTS (
	PROJECT_ID INT NOT NULL,
	PROJECT_NAME VARCHAR(64) NOT NULL,
	PROJECT_DESCRIPTION VARCHAR(255) NOT NULL,
	PROJECT_TYPE INT NOT NULL,
	USER_ID VARCHAR(36) NOT NULL,
	GROUP_ID VARCHAR(36) NOT NULL,
	MANAGERGROUP_ID VARCHAR(36) NOT NULL,
	TASK_ID INT NOT NULL,
	DATE_CREATED BIGINT NOT NULL,
	PUBLISH_TAG INT NOT NULL,
	PROJECT_PUBLISHDATE TIMESTAMP,			--DATE
	PROJECT_PUBLISHED_BY VARCHAR(36) NOT NULL,
	PROJECT_PUBLISHED_BY_NAME VARCHAR(167),
	USER_NAME VARCHAR(167),
	GROUP_NAME VARCHAR(64),
	MANAGERGROUP_NAME VARCHAR(64),
	PRIMARY KEY(PUBLISH_TAG)
);

CREATE TABLE CMS_PROJECTRESOURCES (
	PROJECT_ID INT NOT NULL,
	RESOURCE_PATH TEXT NOT NULL,
	PRIMARY KEY(PROJECT_ID, RESOURCE_PATH)
);

CREATE TABLE CMS_BACKUP_PROJECTRESOURCES (
	PUBLISH_TAG INT NOT NULL,
	PROJECT_ID INT NOT NULL,
	RESOURCE_PATH TEXT NOT NULL,
	PRIMARY KEY (PUBLISH_TAG, PROJECT_ID, RESOURCE_PATH)
);

CREATE TABLE CMS_OFFLINE_PROPERTYDEF (
	PROPERTYDEF_ID VARCHAR(36) NOT NULL,
	PROPERTYDEF_NAME VARCHAR(128) NOT NULL,
	PRIMARY KEY(PROPERTYDEF_ID),
	UNIQUE(PROPERTYDEF_NAME)
);

CREATE TABLE CMS_ONLINE_PROPERTYDEF (
	PROPERTYDEF_ID VARCHAR(36) NOT NULL,
	PROPERTYDEF_NAME VARCHAR(128) NOT NULL,
	PRIMARY KEY(PROPERTYDEF_ID),
	UNIQUE(PROPERTYDEF_NAME)
);

CREATE TABLE CMS_BACKUP_PROPERTYDEF (
	PROPERTYDEF_ID VARCHAR(36) NOT NULL,
	PROPERTYDEF_NAME VARCHAR(128) NOT NULL,
	PRIMARY KEY(PROPERTYDEF_ID),
	UNIQUE(PROPERTYDEF_NAME)
);

CREATE TABLE CMS_OFFLINE_PROPERTIES (
	PROPERTY_ID VARCHAR(36) NOT NULL,
	PROPERTYDEF_ID VARCHAR(36) NOT NULL,
	PROPERTY_MAPPING_ID VARCHAR(36) NOT NULL,
	PROPERTY_MAPPING_TYPE INT NOT NULL,	
	PROPERTY_VALUE TEXT NOT NULL,
	PRIMARY KEY(PROPERTY_ID)
);

CREATE TABLE CMS_ONLINE_PROPERTIES (
	PROPERTY_ID VARCHAR(36) NOT NULL,
	PROPERTYDEF_ID VARCHAR(36) NOT NULL,
	PROPERTY_MAPPING_ID VARCHAR(36) NOT NULL,
	PROPERTY_MAPPING_TYPE INT NOT NULL,	
	PROPERTY_VALUE TEXT NOT NULL,
	PRIMARY KEY(PROPERTY_ID)
);

CREATE TABLE CMS_BACKUP_PROPERTIES (
    	BACKUP_ID VARCHAR(36) NOT NULL,
	PROPERTY_ID VARCHAR(36) NOT NULL,
	PROPERTYDEF_ID VARCHAR(36) NOT NULL,
	PROPERTY_MAPPING_ID VARCHAR(36) NOT NULL,
	PROPERTY_MAPPING_TYPE INT NOT NULL,		
	PROPERTY_VALUE TEXT NOT NULL,
	PUBLISH_TAG INT,
	VERSION_ID INT,
	PRIMARY KEY(PROPERTY_ID)
);

CREATE TABLE CMS_OFFLINE_RESOURCES (
	RESOURCE_ID VARCHAR(36) NOT NULL,
	RESOURCE_TYPE INT NOT NULL,
	RESOURCE_FLAGS INT NOT NULL,
	RESOURCE_STATE INT NOT NULL,
	RESOURCE_SIZE INT NOT NULL,
	SIBLING_COUNT INT NOT NULL,	
	DATE_CREATED BIGINT NOT NULL,
	DATE_LASTMODIFIED BIGINT NOT NULL,
	USER_CREATED VARCHAR(36) NOT NULL,
	USER_LASTMODIFIED VARCHAR(36) NOT NULL,
	PROJECT_LASTMODIFIED SMALLINT NOT NULL,
	PRIMARY KEY(RESOURCE_ID)
);

CREATE TABLE CMS_ONLINE_RESOURCES (
	RESOURCE_ID VARCHAR(36) NOT NULL,
	RESOURCE_TYPE INT NOT NULL,
	RESOURCE_FLAGS INT NOT NULL,
	RESOURCE_STATE SMALLINT NOT NULL,
	RESOURCE_SIZE INT NOT NULL,
	SIBLING_COUNT INT NOT NULL,	
	DATE_CREATED BIGINT NOT NULL,
	DATE_LASTMODIFIED BIGINT NOT NULL,
	USER_CREATED VARCHAR(36) NOT NULL,
	USER_LASTMODIFIED VARCHAR(36) NOT NULL,
	PROJECT_LASTMODIFIED SMALLINT NOT NULL,
	PRIMARY KEY(RESOURCE_ID)
);

CREATE TABLE CMS_BACKUP_RESOURCES (
	BACKUP_ID VARCHAR(36) NOT NULL,
	RESOURCE_ID VARCHAR(36) NOT NULL,
	RESOURCE_TYPE INT NOT NULL,
	RESOURCE_FLAGS INT NOT NULL,
	RESOURCE_STATE SMALLINT NOT NULL,
	RESOURCE_SIZE INT NOT NULL,
	SIBLING_COUNT INT NOT NULL,	
	DATE_CREATED BIGINT NOT NULL,
	DATE_LASTMODIFIED BIGINT NOT NULL,
	USER_CREATED VARCHAR(36) NOT NULL,
	USER_LASTMODIFIED VARCHAR(36) NOT NULL,
	PROJECT_LASTMODIFIED SMALLINT NOT NULL,
	PUBLISH_TAG INT NOT NULL,
	VERSION_ID INT NOT NULL,
	USER_CREATED_NAME VARCHAR(64) NOT NULL,
	USER_LASTMODIFIED_NAME VARCHAR(64) NOT NULL,
	PRIMARY KEY(BACKUP_ID),
	UNIQUE(VERSION_ID,RESOURCE_ID)
);

CREATE TABLE CMS_OFFLINE_CONTENTS (
	CONTENT_ID VARCHAR(36) NOT NULL,
	RESOURCE_ID VARCHAR(36) NOT NULL,
	FILE_CONTENT BYTEA NOT NULL,
	PRIMARY KEY (CONTENT_ID)
);

CREATE TABLE CMS_ONLINE_CONTENTS (
	CONTENT_ID VARCHAR(36) NOT NULL,
	RESOURCE_ID VARCHAR(36) NOT NULL,
	FILE_CONTENT BYTEA NOT NULL,
	PRIMARY KEY (CONTENT_ID)
);

CREATE TABLE CMS_BACKUP_CONTENTS (
	BACKUP_ID VARCHAR(36) NOT NULL,
	CONTENT_ID VARCHAR(36) NOT NULL,
	RESOURCE_ID VARCHAR(36) NOT NULL,
	FILE_CONTENT BYTEA NOT NULL,
	PUBLISH_TAG INT,
	VERSION_ID INT,
	PRIMARY KEY (BACKUP_ID)
);

CREATE TABLE CMS_GROUPS (
	GROUP_ID VARCHAR(36) NOT NULL,
	PARENT_GROUP_ID VARCHAR(36) NOT NULL,
	GROUP_NAME VARCHAR(64) NOT NULL,
	GROUP_DESCRIPTION VARCHAR(255) NOT NULL,
	GROUP_FLAGS INT NOT NULL,
	PRIMARY KEY(GROUP_ID),
	UNIQUE(GROUP_NAME)
);

CREATE TABLE CMS_SYSTEMID (
	TABLE_KEY VARCHAR(255) NOT NULL,
	ID INT NOT NULL,
	PRIMARY KEY (TABLE_KEY)
);

CREATE TABLE CMS_GROUPUSERS (
	GROUP_ID VARCHAR(36) NOT NULL,
	USER_ID VARCHAR(36) NOT NULL,
	GROUPUSER_FLAGS INT NOT NULL
);

CREATE TABLE CMS_TASK (
	AUTOFINISH INT,
	ENDTIME TIMESTAMP,      --DATE
	ESCALATIONTYPEREF INT,
	ID INT NOT NULL,
	INITIATORUSERREF VARCHAR(36),
	MILESTONEREF INT,
	NAME VARCHAR(254),
	ORIGINALUSERREF VARCHAR(36),
	AGENTUSERREF VARCHAR(36),
	PARENT INT,
	PERCENTAGE VARCHAR(50),
	PERMISSION VARCHAR(50),
	PRIORITYREF INT DEFAULT '2',
	ROLEREF VARCHAR(36),
	ROOT INT,
	STARTTIME TIMESTAMP,		--DATE
	STATE INT,
	TASKTYPEREF INT,
	TIMEOUT TIMESTAMP,		--DATE
	WAKEUPTIME TIMESTAMP,		--DATE
	HTMLLINK VARCHAR(254),
	ESTIMATETIME INT DEFAULT '86400',
	PRIMARY KEY(ID)
);

CREATE TABLE CMS_TASKTYPE (
	AUTOFINISH INT,
	ESCALATIONTYPEREF INT,
	HTMLLINK VARCHAR(254),
	ID INT NOT NULL,
	NAME VARCHAR(50),
	PERMISSION VARCHAR(50),
	PRIORITYREF INT,
	ROLEREF VARCHAR(36),
	PRIMARY KEY(ID)
);

CREATE TABLE CMS_TaskLog (
	COMENT BIGINT,
	EXTERNALUSERNAME VARCHAR(254),
	ID INT NOT NULL,
	STARTTIME TIMESTAMP,		--DATE
	TASKREF INT,
	USERREF VARCHAR(36),
	TYPE INT DEFAULT '0',
	PRIMARY KEY(ID)
);

CREATE TABLE CMS_TaskPar (
	ID INT NOT NULL,
	PARNAME VARCHAR(50),
	PARVALUE VARCHAR(50),
	REF INT,
	PRIMARY KEY(ID)
);

CREATE TABLE CMS_ONLINE_ACCESSCONTROL (
	RESOURCE_ID VARCHAR(36) NOT NULL,
	PRINCIPAL_ID VARCHAR(36) NOT NULL,
	ACCESS_ALLOWED INT,
	ACCESS_DENIED INT,
	ACCESS_FLAGS INT,
	PRIMARY KEY(RESOURCE_ID, PRINCIPAL_ID)
);

CREATE TABLE CMS_OFFLINE_ACCESSCONTROL (
	RESOURCE_ID VARCHAR(36) NOT NULL,
	PRINCIPAL_ID VARCHAR(36) NOT NULL,
	ACCESS_ALLOWED INT,
	ACCESS_DENIED INT,
	ACCESS_FLAGS INT,
	PRIMARY KEY(RESOURCE_ID, PRINCIPAL_ID)
);
   
CREATE TABLE CMS_OFFLINE_STRUCTURE (
	STRUCTURE_ID VARCHAR(36) NOT NULL,
	RESOURCE_ID VARCHAR(36) NOT NULL,
	PARENT_ID VARCHAR(36) NOT NULL,
	RESOURCE_PATH TEXT NOT NULL,
	STRUCTURE_STATE SMALLINT NOT NULL,
	DATE_RELEASED BIGINT NULL,
	DATE_EXPIRED BIGINT NULL,
	PRIMARY KEY(STRUCTURE_ID)
);

CREATE TABLE CMS_ONLINE_STRUCTURE (
	STRUCTURE_ID VARCHAR(36) NOT NULL,
	RESOURCE_ID VARCHAR(36) NOT NULL,
	PARENT_ID VARCHAR(36) NOT NULL,
	RESOURCE_PATH TEXT NOT NULL,
	STRUCTURE_STATE SMALLINT NOT NULL,	
	DATE_RELEASED BIGINT NOT NULL,
	DATE_EXPIRED BIGINT NOT NULL,
	PRIMARY KEY(STRUCTURE_ID)
);

CREATE TABLE CMS_BACKUP_STRUCTURE (
	BACKUP_ID VARCHAR(36) NOT NULL,
	PUBLISH_TAG INT NOT NULL,
	VERSION_ID INT NOT NULL,
	STRUCTURE_ID VARCHAR(36) NOT NULL,
	RESOURCE_ID VARCHAR(36) NOT NULL,
	RESOURCE_PATH TEXT NOT NULL,
	STRUCTURE_STATE SMALLINT NOT NULL,
	DATE_RELEASED BIGINT NOT NULL,
	DATE_EXPIRED BIGINT NOT NULL,
	PRIMARY KEY(BACKUP_ID)
);   
 
CREATE TABLE CMS_PUBLISH_HISTORY (
	HISTORY_ID VARCHAR(36) NOT NULL,
	PUBLISH_TAG INT NOT NULL,
	STRUCTURE_ID VARCHAR(36) NOT NULL,
	RESOURCE_ID VARCHAR(36) NOT NULL,
	RESOURCE_PATH TEXT NOT NULL,
	RESOURCE_STATE INT NOT NULL,
	RESOURCE_TYPE INT NOT NULL,
	SIBLING_COUNT INT NOT NULL,
	PRIMARY KEY(HISTORY_ID,PUBLISH_TAG,STRUCTURE_ID,RESOURCE_ID)
);

CREATE TABLE CMS_STATICEXPORT_LINKS (
	LINK_ID VARCHAR(36) NOT NULL,
	LINK_RFS_PATH TEXT NOT NULL,
	LINK_TYPE INT NOT NULL,
	LINK_PARAMETER TEXT,
	LINK_TIMESTAMP BIGINT,
	PRIMARY KEY(LINK_ID)	
);



CREATE INDEX IDX_PUBLISH_HISTORY_01 
	ON CMS_PUBLISH_HISTORY(HISTORY_ID);

CREATE INDEX IDX_GROUPS_01 
	ON CMS_GROUPS(PARENT_GROUP_ID);

CREATE INDEX IDX_GROUPUSERS_01 
	ON CMS_GROUPUSERS(GROUP_ID);
	
CREATE INDEX IDX_GROUPUSERS_02 
	ON CMS_GROUPUSERS(USER_ID);

CREATE INDEX IDX_PROJECTS_01 
	ON CMS_PROJECTS(GROUP_ID);
	
CREATE INDEX IDX_PROJECTS_02 
	ON CMS_PROJECTS(MANAGERGROUP_ID);
	
CREATE INDEX IDX_PROJECTS_03 
	ON CMS_PROJECTS(USER_ID);
	
CREATE INDEX IDX_PROJECTS_04 
	ON CMS_PROJECTS(PROJECT_NAME);
	
CREATE INDEX IDX_PROJECTS_05 
	ON CMS_PROJECTS(TASK_ID);
	
CREATE INDEX IDX_PROJECTS_06 
	ON CMS_PROJECTS (PROJECT_FLAGS);
	
CREATE INDEX IDX_OFFLINE_RESOURCES_01 
	ON CMS_OFFLINE_RESOURCES (RESOURCE_TYPE);
  
CREATE INDEX IDX_ONLINE_RESOURCES_01 
	ON CMS_ONLINE_RESOURCES (RESOURCE_TYPE);

CREATE INDEX IDX_OFFLINE_STRUCTURE_01 
	ON CMS_OFFLINE_STRUCTURE (STRUCTURE_ID,RESOURCE_PATH);
	
CREATE INDEX IDX_OFFLINE_STRUCTURE_03 
	ON CMS_OFFLINE_STRUCTURE (STRUCTURE_ID,RESOURCE_ID);
	
CREATE INDEX IDX_OFFLINE_STRUCTURE_04 
	ON CMS_OFFLINE_STRUCTURE (STRUCTURE_STATE);
	
CREATE INDEX IDX_OFFLINE_STRUCTURE_05 
	ON CMS_OFFLINE_STRUCTURE (RESOURCE_ID);

CREATE INDEX IDX_ONLINE_STRUCTURE_01 
	ON CMS_ONLINE_STRUCTURE (STRUCTURE_ID,RESOURCE_PATH);
	
CREATE INDEX IDX_ONLINE_STRUCTURE_03 
	ON CMS_ONLINE_STRUCTURE (STRUCTURE_ID,RESOURCE_ID);
	
CREATE INDEX IDX_ONLINE_STRUCTURE_04 
	ON CMS_ONLINE_STRUCTURE (STRUCTURE_STATE);
	
CREATE INDEX IDX_ONLINE_STRUCTURE_05 
	ON CMS_ONLINE_STRUCTURE (RESOURCE_ID);  
	
CREATE INDEX IDX_OFFLINE_PROPERTIES_01 
	ON CMS_OFFLINE_PROPERTIES (PROPERTYDEF_ID,PROPERTY_MAPPING_ID,PROPERTY_MAPPING_TYPE);
	
CREATE INDEX IDX_OFFLINE_PROPERTIES_02 
	ON CMS_OFFLINE_PROPERTIES (PROPERTYDEF_ID);

CREATE INDEX IDX_ONLINE_PROPERTIES_01 
	ON CMS_ONLINE_PROPERTIES (PROPERTYDEF_ID,PROPERTY_MAPPING_ID,PROPERTY_MAPPING_TYPE);
	
CREATE INDEX IDX_ONLINE_PROPERTIES_02 
	ON CMS_ONLINE_PROPERTIES (PROPERTYDEF_ID);

CREATE INDEX IDX_OFFLINE_PROPERTYDEF_01 
	ON CMS_OFFLINE_PROPERTYDEF (PROPERTYDEF_ID);
	
CREATE INDEX IDX_OFFLINE_PROPERTYDEF_02 
	ON CMS_OFFLINE_PROPERTYDEF (PROPERTYDEF_NAME);
	
CREATE INDEX IDX_ONLINE_PROPERTYDEF_01 
	ON CMS_ONLINE_PROPERTYDEF (PROPERTYDEF_ID);
	
CREATE INDEX IDX_ONLINE_PROPERTYDEF_02
	ON CMS_ONLINE_PROPERTYDEF (PROPERTYDEF_NAME);

CREATE INDEX IDX_SYSTEMID_01 
	ON CMS_SYSTEMID(TABLE_KEY,ID);

CREATE INDEX IDX_TASK_01 
	ON CMS_TASK(PARENT);
	
CREATE INDEX IDX_TASK_02 
	ON CMS_TASK(TASKTYPEREF);

CREATE INDEX IDX_TASKLOG_01
	ON CMS_TASKLOG(TASKREF);
	
CREATE INDEX IDX_TASKLOG_02 
	ON CMS_TASKLOG(USERREF);

CREATE INDEX IDX_TASKPAR_01 
	ON CMS_TASKPAR(REF);
	
CREATE INDEX IDX_PROJECTRESOURCES_01 
	ON CMS_PROJECTRESOURCES(RESOURCE_PATH); 
