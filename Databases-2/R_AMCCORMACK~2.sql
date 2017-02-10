Error starting at line : 2 in command -
DROP TABLE CD_ATTENDS CASCADE CONSTRAINTS PURGE
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 4 in command -
DROP TABLE CD_SESSION_RUNS CASCADE CONSTRAINTS PURGE
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 6 in command -
DROP TABLE CD_FACILITATOR CASCADE CONSTRAINTS PURGE
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 8 in command -
DROP TABLE CD_SPECIALITY CASCADE CONSTRAINTS PURGE
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 10 in command -
DROP TABLE CD_CODING_SESSION CASCADE CONSTRAINTS PURGE
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 12 in command -
DROP TABLE CD_ORGANIZER CASCADE CONSTRAINTS PURGE
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 14 in command -
DROP TABLE CD_LOCATION CASCADE CONSTRAINTS PURGE
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
Error starting at line : 16 in command -
DROP TABLE CD_ATTENDEE CASCADE CONSTRAINTS PURGE
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 18 in command -
CREATE TABLE CD_ATTENDEE
(
	Coder_Id             number(6) primary key,
	Coder_Name           VARCHAR2(50) not NULL ,
	Coder_Phone          CHAR(14) NULL ,
	Coder_Email          VARCHAR2(30) NULL ,
	Coder_Date_Of_Birth  DATE not NULL 
)
Error at Command Line : 18 Column : 1
Error report -
SQL Error: ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to change the current username or password
           without the appropriate privilege. This error also occurs if
           attempting to install a database without the necessary operating
           system privileges.
           When Trusted Oracle is configure in DBMS MAC, this error may occur
           if the user was granted the necessary privilege at a higher label
           than the current login.
*Action:   Ask the database administrator to perform the operation or grant
           the required privileges.
           For Trusted Oracle users getting this error although granted the
           the appropriate privilege at a higher label, ask the database
           administrator to regrant the privilege at the appropriate label.

Error starting at line : 26 in command -
insert into CD_ATTENDEE (Coder_id, Coder_Name, Coder_Email, coder_date_of_Birth) values  
(4000,'Barry Keenan','barry@hmail.com', '10-Feb-2000') 
Error at Command Line : 26 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 28 in command -
insert into CD_ATTENDEE (Coder_id, Coder_Name, Coder_Email, coder_date_of_Birth) values  
(4001,'Pauline Brennan','pbrennan33@hmail.com', '31-Aug-1998') 
Error at Command Line : 28 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 30 in command -
insert into CD_ATTENDEE (Coder_id, Coder_Name, Coder_Email, coder_date_of_Birth) values  
(4002,'Ryan Kelleher','ryank55@hmail.com', '24-Apr-2000') 
Error at Command Line : 30 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 32 in command -
CREATE TABLE CD_LOCATION
(
	loc_id               CHAR(6) NOT NULL ,
	loc_name             VARCHAR2(30) NULL ,
	Loc_Contact_Name     VARCHAR2(50) NULL ,
	Loc_Phone            CHAR(14) NULL ,
	Loc_email            VARCHAR2(30) not NULL ,
 PRIMARY KEY (loc_id)
)
Error at Command Line : 32 Column : 1
Error report -
SQL Error: ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to change the current username or password
           without the appropriate privilege. This error also occurs if
           attempting to install a database without the necessary operating
           system privileges.
           When Trusted Oracle is configure in DBMS MAC, this error may occur
           if the user was granted the necessary privilege at a higher label
           than the current login.
*Action:   Ask the database administrator to perform the operation or grant
           the required privileges.
           For Trusted Oracle users getting this error although granted the
           the appropriate privilege at a higher label, ask the database
           administrator to regrant the privilege at the appropriate label.

Error starting at line : 41 in command -
insert into CD_LOCATION values ('UNIV01','University','Professor','9999999','prof@univ.com')
Error at Command Line : 41 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 42 in command -
insert into CD_LOCATION values ('HALL01','Community Hall','Joe Bloggs','9999998','joe@hall.com')
Error at Command Line : 42 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
Error starting at line : 43 in command -
insert into CD_LOCATION values ('SCH001','Local School','Teacher','9989999','teacher@school.com')
Error at Command Line : 43 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 44 in command -
CREATE TABLE CD_ORGANIZER
(
	Organizer_Id         number(6) primary key,
	Organizer_Name       VARCHAR2(50) not NULL ,
	Organizer_phone      CHAR(14) NULL ,
	Organizer_email      VARCHAR2(30) not NULL 
)
Error at Command Line : 44 Column : 1
Error report -
SQL Error: ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to change the current username or password
           without the appropriate privilege. This error also occurs if
           attempting to install a database without the necessary operating
           system privileges.
           When Trusted Oracle is configure in DBMS MAC, this error may occur
           if the user was granted the necessary privilege at a higher label
           than the current login.
*Action:   Ask the database administrator to perform the operation or grant
           the required privileges.
           For Trusted Oracle users getting this error although granted the
           the appropriate privilege at a higher label, ask the database
           administrator to regrant the privilege at the appropriate label.

Error starting at line : 51 in command -
insert into CD_ORGANIZER (organizer_id, organizer_name, organizer_email) 
values (1,'Peter','peter@home.org')
Error at Command Line : 51 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 53 in command -
insert into CD_ORGANIZER (organizer_id, organizer_name, organizer_email) 
values (2,'Jane','Jane@home.org')
Error at Command Line : 53 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 55 in command -
insert into CD_ORGANIZER (organizer_id, organizer_name, organizer_email) 
values (3,'Brian','Brian@home.org')
Error at Command Line : 55 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 57 in command -
insert into CD_ORGANIZER (organizer_id, organizer_name, organizer_email) 
values (4,'Sandra','Sandra@home.org')
Error at Command Line : 57 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 59 in command -
insert into CD_ORGANIZER (organizer_id, organizer_name, organizer_email)
values (5, 'Mark','mark@coder.com')
Error at Command Line : 59 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 61 in command -
CREATE TABLE CD_CODING_SESSION
(
	S_start              TIMESTAMP NOT NULL ,
	loc_id               CHAR(6) NOT NULL references CD_LOCATION,
	S_end                TIMESTAMP NULL ,
	Organizer_Id         number(6) NULL references CD_ORGANIZER,
 PRIMARY KEY (S_start,loc_id))
Error at Command Line : 61 Column : 1
Error report -
SQL Error: ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to change the current username or password
           without the appropriate privilege. This error also occurs if
           attempting to install a database without the necessary operating
           system privileges.
           When Trusted Oracle is configure in DBMS MAC, this error may occur
           if the user was granted the necessary privilege at a higher label
           than the current login.
*Action:   Ask the database administrator to perform the operation or grant
           the required privileges.
           For Trusted Oracle users getting this error although granted the
           the appropriate privilege at a higher label, ask the database
           administrator to regrant the privilege at the appropriate label.

Error starting at line : 68 in command -
insert into CD_CODING_SESSION  
values (to_timestamp('10-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
to_timestamp('10-Feb-2013 12:00:00','DD-Mon-YYYY HH24:Mi:SS'),1) 
Error at Command Line : 68 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
Error starting at line : 71 in command -
insert into CD_CODING_SESSION  
values (to_timestamp('17-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
to_timestamp('17-Feb-2013 12:00:00','DD-Mon-YYYY HH24:Mi:SS'),1) 
Error at Command Line : 71 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 74 in command -
insert into CD_CODING_SESSION  
values (to_timestamp('10-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
to_timestamp('10-Feb-2013 16:00:00','DD-Mon-YYYY HH24:Mi:SS'),2) 
Error at Command Line : 74 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 77 in command -
insert into CD_CODING_SESSION  
values (to_timestamp('17-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
to_timestamp('17-Feb-2013 16:00:00','DD-Mon-YYYY HH24:Mi:SS'),2) 
Error at Command Line : 77 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 80 in command -
insert into CD_CODING_SESSION  
values (to_timestamp('24-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
to_timestamp('24-Feb-2013 16:00:00','DD-Mon-YYYY HH24:Mi:SS'),2) 
Error at Command Line : 80 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 84 in command -
CREATE TABLE CD_SPECIALITY
(
	Spec_code            varchar2(6) NOT NULL ,
	Spec_name            VARCHAR2(30) NULL ,
	Spec_Equipment       VARCHAR2(50) NULL ,
	Spec_Software        varchar2(30) NULL ,
 PRIMARY KEY (Spec_code)
)
Error at Command Line : 84 Column : 1
Error report -
SQL Error: ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to change the current username or password
           without the appropriate privilege. This error also occurs if
           attempting to install a database without the necessary operating
           system privileges.
           When Trusted Oracle is configure in DBMS MAC, this error may occur
           if the user was granted the necessary privilege at a higher label
           than the current login.
*Action:   Ask the database administrator to perform the operation or grant
           the required privileges.
           For Trusted Oracle users getting this error although granted the
           the appropriate privilege at a higher label, ask the database
           administrator to regrant the privilege at the appropriate label.

Error starting at line : 92 in command -
insert into CD_SPECIALITY (spec_code, spec_name) values
('HTML','HTML')
Error at Command Line : 92 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 94 in command -
insert into CD_SPECIALITY (spec_code, spec_name) values
('SCRTCH','Scratch Programming')
Error at Command Line : 94 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 96 in command -
insert into CD_SPECIALITY (spec_code, spec_name) values
('GENG','Games Engines')
Error at Command Line : 96 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 98 in command -
insert into CD_SPECIALITY (spec_code, spec_name) values
('ROBOT','Robot programming')
Error at Command Line : 98 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 100 in command -
CREATE TABLE CD_FACILITATOR
(
	Facilitator_Id       number(6) primary key,
	Facilitator_name    varchar2(50) not NULL ,
	Facilitator_phone    CHAR(14) NULL ,
	Facilitator_email    VARCHAR2(30) not NULL
)
Error at Command Line : 100 Column : 1
Error report -
SQL Error: ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to change the current username or password
           without the appropriate privilege. This error also occurs if
           attempting to install a database without the necessary operating
           system privileges.
           When Trusted Oracle is configure in DBMS MAC, this error may occur
           if the user was granted the necessary privilege at a higher label
           than the current login.
*Action:   Ask the database administrator to perform the operation or grant
           the required privileges.
           For Trusted Oracle users getting this error although granted the
           the appropriate privilege at a higher label, ask the database
           administrator to regrant the privilege at the appropriate label.
Error starting at line : 107 in command -
insert into CD_FACILITATOR (facilitator_id, facilitator_name, Facilitator_email)
values (405, 'Mark Gladstone','markg@coder.com')
Error at Command Line : 107 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 109 in command -
insert into CD_FACILITATOR (facilitator_id, facilitator_name, Facilitator_email)
values (410, 'Mark','mark@coder.com')
Error at Command Line : 109 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 111 in command -
insert into CD_FACILITATOR (facilitator_id, facilitator_name, Facilitator_email)
values (415, 'Ken','ken@coder.com')
Error at Command Line : 111 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 113 in command -
insert into CD_FACILITATOR (facilitator_id, facilitator_name, Facilitator_email)
values (420, 'Deirdre','deirdre@coder.com')
Error at Command Line : 113 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 115 in command -
CREATE TABLE CD_SESSION_RUNS
(
	S_start              TIMESTAMP NOT NULL ,
	loc_id               CHAR(6) NOT NULL ,
	Spec_code            VARCHAR2(6) NOT NULL references CD_SPECIALITY,
	Facilitator_Id       number(6) NULL references CD_FACILITATOR,
 PRIMARY KEY (S_start,loc_id,Spec_code),
FOREIGN KEY (S_start, loc_id) REFERENCES CD_CODING_SESSION (S_start, loc_id))
Error at Command Line : 115 Column : 1
Error report -
SQL Error: ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to change the current username or password
           without the appropriate privilege. This error also occurs if
           attempting to install a database without the necessary operating
           system privileges.
           When Trusted Oracle is configure in DBMS MAC, this error may occur
           if the user was granted the necessary privilege at a higher label
           than the current login.
*Action:   Ask the database administrator to perform the operation or grant
           the required privileges.
           For Trusted Oracle users getting this error although granted the
           the appropriate privilege at a higher label, ask the database
           administrator to regrant the privilege at the appropriate label.

Error starting at line : 124 in command -
insert into CD_SESSION_RUNS 
values (to_timestamp('10-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'HTML',405) 
Error at Command Line : 124 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 127 in command -
insert into CD_SESSION_RUNS 
values (to_timestamp('17-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'HTML',405) 
Error at Command Line : 127 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 130 in command -
insert into CD_SESSION_RUNS 
values (to_timestamp('10-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'ROBOT',415) 
Error at Command Line : 130 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 133 in command -
insert into CD_SESSION_RUNS 
values (to_timestamp('17-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'ROBOT',415) 
Error at Command Line : 133 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 136 in command -
insert into CD_SESSION_RUNS 
values (to_timestamp('17-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
'HTML',405) 
Error at Command Line : 136 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
Error starting at line : 139 in command -
insert into CD_SESSION_RUNS 
values (to_timestamp('10-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
'HTML',405) 
Error at Command Line : 139 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 142 in command -
insert into CD_SESSION_RUNS 
values (to_timestamp('24-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
'HTML',405) 
Error at Command Line : 142 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 145 in command -
CREATE TABLE CD_ATTENDS
(
	Coder_Id             NUMBER NOT NULL references CD_ATTENDEE,
	S_start              TIMESTAMP NOT NULL ,
	loc_id               CHAR(6) NOT NULL ,
	Spec_code            VARCHAR2(6) NOT NULL ,
	Badge_Earned         VARCHAR2(6) NULL check(badge_earned in ('Basic','Junior','Senior','Master')),
	Belt_Earned          VARCHAR2(6) NULL check (belt_earned in ('Blue','Yellow','White')),
 PRIMARY KEY (Coder_Id,S_start,loc_id,Spec_code),
FOREIGN KEY (S_start, loc_id, Spec_code) REFERENCES CD_SESSION_RUNS (S_start, loc_id, Spec_code)
)
Error at Command Line : 145 Column : 1
Error report -
SQL Error: ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to change the current username or password
           without the appropriate privilege. This error also occurs if
           attempting to install a database without the necessary operating
           system privileges.
           When Trusted Oracle is configure in DBMS MAC, this error may occur
           if the user was granted the necessary privilege at a higher label
           than the current login.
*Action:   Ask the database administrator to perform the operation or grant
           the required privileges.
           For Trusted Oracle users getting this error although granted the
           the appropriate privilege at a higher label, ask the database
           administrator to regrant the privilege at the appropriate label.

Error starting at line : 156 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code) 
values (4000,to_timestamp('10-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'ROBOT') 
Error at Command Line : 156 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 159 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code) 
values (4000,to_timestamp('17-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'ROBOT') 
Error at Command Line : 159 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 162 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code) 
values (4001,to_timestamp('10-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'HTML') 
Error at Command Line : 162 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 165 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code) 
values (4001,to_timestamp('17-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'HTML') 
Error at Command Line : 165 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 168 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code) 
values (4001,to_timestamp('10-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
'HTML') 
Error at Command Line : 168 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 171 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code) 
values (4001,to_timestamp('17-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
'HTML') 
Error at Command Line : 171 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 174 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code,badge_earned) 
values (4001,to_timestamp('24-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
'HTML','Basic') 
Error at Command Line : 174 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 177 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code) 
values (4002,to_timestamp('10-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'ROBOT') 
Error at Command Line : 177 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 180 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code) 
values (4002,to_timestamp('17-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'ROBOT') 
Error at Command Line : 180 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
committed.
Error starting at line : 2 in command -
DROP TABLE CD_ATTENDS CASCADE CONSTRAINTS PURGE
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 4 in command -
DROP TABLE CD_SESSION_RUNS CASCADE CONSTRAINTS PURGE
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 6 in command -
DROP TABLE CD_FACILITATOR CASCADE CONSTRAINTS PURGE
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 8 in command -
DROP TABLE CD_SPECIALITY CASCADE CONSTRAINTS PURGE
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 10 in command -
DROP TABLE CD_CODING_SESSION CASCADE CONSTRAINTS PURGE
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 12 in command -
DROP TABLE CD_ORGANIZER CASCADE CONSTRAINTS PURGE
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 14 in command -
DROP TABLE CD_LOCATION CASCADE CONSTRAINTS PURGE
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 16 in command -
DROP TABLE CD_ATTENDEE CASCADE CONSTRAINTS PURGE
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
Error starting at line : 18 in command -
CREATE TABLE CD_ATTENDEE
(
	Coder_Id             number(6) primary key,
	Coder_Name           VARCHAR2(50) not NULL ,
	Coder_Phone          CHAR(14) NULL ,
	Coder_Email          VARCHAR2(30) NULL ,
	Coder_Date_Of_Birth  DATE not NULL 
)
Error at Command Line : 18 Column : 1
Error report -
SQL Error: ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to change the current username or password
           without the appropriate privilege. This error also occurs if
           attempting to install a database without the necessary operating
           system privileges.
           When Trusted Oracle is configure in DBMS MAC, this error may occur
           if the user was granted the necessary privilege at a higher label
           than the current login.
*Action:   Ask the database administrator to perform the operation or grant
           the required privileges.
           For Trusted Oracle users getting this error although granted the
           the appropriate privilege at a higher label, ask the database
           administrator to regrant the privilege at the appropriate label.

Error starting at line : 26 in command -
insert into CD_ATTENDEE (Coder_id, Coder_Name, Coder_Email, coder_date_of_Birth) values  
(4000,'Barry Keenan','barry@hmail.com', '10-Feb-2000') 
Error at Command Line : 26 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 28 in command -
insert into CD_ATTENDEE (Coder_id, Coder_Name, Coder_Email, coder_date_of_Birth) values  
(4001,'Pauline Brennan','pbrennan33@hmail.com', '31-Aug-1998') 
Error at Command Line : 28 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 30 in command -
insert into CD_ATTENDEE (Coder_id, Coder_Name, Coder_Email, coder_date_of_Birth) values  
(4002,'Ryan Kelleher','ryank55@hmail.com', '24-Apr-2000') 
Error at Command Line : 30 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 32 in command -
CREATE TABLE CD_LOCATION
(
	loc_id               CHAR(6) NOT NULL ,
	loc_name             VARCHAR2(30) NULL ,
	Loc_Contact_Name     VARCHAR2(50) NULL ,
	Loc_Phone            CHAR(14) NULL ,
	Loc_email            VARCHAR2(30) not NULL ,
 PRIMARY KEY (loc_id)
)
Error at Command Line : 32 Column : 1
Error report -
SQL Error: ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to change the current username or password
           without the appropriate privilege. This error also occurs if
           attempting to install a database without the necessary operating
           system privileges.
           When Trusted Oracle is configure in DBMS MAC, this error may occur
           if the user was granted the necessary privilege at a higher label
           than the current login.
*Action:   Ask the database administrator to perform the operation or grant
           the required privileges.
           For Trusted Oracle users getting this error although granted the
           the appropriate privilege at a higher label, ask the database
           administrator to regrant the privilege at the appropriate label.

Error starting at line : 41 in command -
insert into CD_LOCATION values ('UNIV01','University','Professor','9999999','prof@univ.com')
Error at Command Line : 41 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 42 in command -
insert into CD_LOCATION values ('HALL01','Community Hall','Joe Bloggs','9999998','joe@hall.com')
Error at Command Line : 42 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 43 in command -
insert into CD_LOCATION values ('SCH001','Local School','Teacher','9989999','teacher@school.com')
Error at Command Line : 43 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 44 in command -
CREATE TABLE CD_ORGANIZER
(
	Organizer_Id         number(6) primary key,
	Organizer_Name       VARCHAR2(50) not NULL ,
	Organizer_phone      CHAR(14) NULL ,
	Organizer_email      VARCHAR2(30) not NULL 
)
Error at Command Line : 44 Column : 1
Error report -
SQL Error: ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to change the current username or password
           without the appropriate privilege. This error also occurs if
           attempting to install a database without the necessary operating
           system privileges.
           When Trusted Oracle is configure in DBMS MAC, this error may occur
           if the user was granted the necessary privilege at a higher label
           than the current login.
*Action:   Ask the database administrator to perform the operation or grant
           the required privileges.
           For Trusted Oracle users getting this error although granted the
           the appropriate privilege at a higher label, ask the database
           administrator to regrant the privilege at the appropriate label.

Error starting at line : 51 in command -
insert into CD_ORGANIZER (organizer_id, organizer_name, organizer_email) 
values (1,'Peter','peter@home.org')
Error at Command Line : 51 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 53 in command -
insert into CD_ORGANIZER (organizer_id, organizer_name, organizer_email) 
values (2,'Jane','Jane@home.org')
Error at Command Line : 53 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 55 in command -
insert into CD_ORGANIZER (organizer_id, organizer_name, organizer_email) 
values (3,'Brian','Brian@home.org')
Error at Command Line : 55 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
Error starting at line : 57 in command -
insert into CD_ORGANIZER (organizer_id, organizer_name, organizer_email) 
values (4,'Sandra','Sandra@home.org')
Error at Command Line : 57 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 59 in command -
insert into CD_ORGANIZER (organizer_id, organizer_name, organizer_email)
values (5, 'Mark','mark@coder.com')
Error at Command Line : 59 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 61 in command -
CREATE TABLE CD_CODING_SESSION
(
	S_start              TIMESTAMP NOT NULL ,
	loc_id               CHAR(6) NOT NULL references CD_LOCATION,
	S_end                TIMESTAMP NULL ,
	Organizer_Id         number(6) NULL references CD_ORGANIZER,
 PRIMARY KEY (S_start,loc_id))
Error at Command Line : 61 Column : 1
Error report -
SQL Error: ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to change the current username or password
           without the appropriate privilege. This error also occurs if
           attempting to install a database without the necessary operating
           system privileges.
           When Trusted Oracle is configure in DBMS MAC, this error may occur
           if the user was granted the necessary privilege at a higher label
           than the current login.
*Action:   Ask the database administrator to perform the operation or grant
           the required privileges.
           For Trusted Oracle users getting this error although granted the
           the appropriate privilege at a higher label, ask the database
           administrator to regrant the privilege at the appropriate label.

Error starting at line : 68 in command -
insert into CD_CODING_SESSION  
values (to_timestamp('10-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
to_timestamp('10-Feb-2013 12:00:00','DD-Mon-YYYY HH24:Mi:SS'),1) 
Error at Command Line : 68 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 71 in command -
insert into CD_CODING_SESSION  
values (to_timestamp('17-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
to_timestamp('17-Feb-2013 12:00:00','DD-Mon-YYYY HH24:Mi:SS'),1) 
Error at Command Line : 71 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 74 in command -
insert into CD_CODING_SESSION  
values (to_timestamp('10-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
to_timestamp('10-Feb-2013 16:00:00','DD-Mon-YYYY HH24:Mi:SS'),2) 
Error at Command Line : 74 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 77 in command -
insert into CD_CODING_SESSION  
values (to_timestamp('17-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
to_timestamp('17-Feb-2013 16:00:00','DD-Mon-YYYY HH24:Mi:SS'),2) 
Error at Command Line : 77 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 80 in command -
insert into CD_CODING_SESSION  
values (to_timestamp('24-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
to_timestamp('24-Feb-2013 16:00:00','DD-Mon-YYYY HH24:Mi:SS'),2) 
Error at Command Line : 80 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 84 in command -
CREATE TABLE CD_SPECIALITY
(
	Spec_code            varchar2(6) NOT NULL ,
	Spec_name            VARCHAR2(30) NULL ,
	Spec_Equipment       VARCHAR2(50) NULL ,
	Spec_Software        varchar2(30) NULL ,
 PRIMARY KEY (Spec_code)
)
Error at Command Line : 84 Column : 1
Error report -
SQL Error: ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to change the current username or password
           without the appropriate privilege. This error also occurs if
           attempting to install a database without the necessary operating
           system privileges.
           When Trusted Oracle is configure in DBMS MAC, this error may occur
           if the user was granted the necessary privilege at a higher label
           than the current login.
*Action:   Ask the database administrator to perform the operation or grant
           the required privileges.
           For Trusted Oracle users getting this error although granted the
           the appropriate privilege at a higher label, ask the database
           administrator to regrant the privilege at the appropriate label.

Error starting at line : 92 in command -
insert into CD_SPECIALITY (spec_code, spec_name) values
('HTML','HTML')
Error at Command Line : 92 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 94 in command -
insert into CD_SPECIALITY (spec_code, spec_name) values
('SCRTCH','Scratch Programming')
Error at Command Line : 94 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 96 in command -
insert into CD_SPECIALITY (spec_code, spec_name) values
('GENG','Games Engines')
Error at Command Line : 96 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 98 in command -
insert into CD_SPECIALITY (spec_code, spec_name) values
('ROBOT','Robot programming')
Error at Command Line : 98 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
Error starting at line : 100 in command -
CREATE TABLE CD_FACILITATOR
(
	Facilitator_Id       number(6) primary key,
	Facilitator_name    varchar2(50) not NULL ,
	Facilitator_phone    CHAR(14) NULL ,
	Facilitator_email    VARCHAR2(30) not NULL
)
Error at Command Line : 100 Column : 1
Error report -
SQL Error: ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to change the current username or password
           without the appropriate privilege. This error also occurs if
           attempting to install a database without the necessary operating
           system privileges.
           When Trusted Oracle is configure in DBMS MAC, this error may occur
           if the user was granted the necessary privilege at a higher label
           than the current login.
*Action:   Ask the database administrator to perform the operation or grant
           the required privileges.
           For Trusted Oracle users getting this error although granted the
           the appropriate privilege at a higher label, ask the database
           administrator to regrant the privilege at the appropriate label.

Error starting at line : 107 in command -
insert into CD_FACILITATOR (facilitator_id, facilitator_name, Facilitator_email)
values (405, 'Mark Gladstone','markg@coder.com')
Error at Command Line : 107 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 109 in command -
insert into CD_FACILITATOR (facilitator_id, facilitator_name, Facilitator_email)
values (410, 'Mark','mark@coder.com')
Error at Command Line : 109 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 111 in command -
insert into CD_FACILITATOR (facilitator_id, facilitator_name, Facilitator_email)
values (415, 'Ken','ken@coder.com')
Error at Command Line : 111 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 113 in command -
insert into CD_FACILITATOR (facilitator_id, facilitator_name, Facilitator_email)
values (420, 'Deirdre','deirdre@coder.com')
Error at Command Line : 113 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 115 in command -
CREATE TABLE CD_SESSION_RUNS
(
	S_start              TIMESTAMP NOT NULL ,
	loc_id               CHAR(6) NOT NULL ,
	Spec_code            VARCHAR2(6) NOT NULL references CD_SPECIALITY,
	Facilitator_Id       number(6) NULL references CD_FACILITATOR,
 PRIMARY KEY (S_start,loc_id,Spec_code),
FOREIGN KEY (S_start, loc_id) REFERENCES CD_CODING_SESSION (S_start, loc_id))
Error at Command Line : 115 Column : 1
Error report -
SQL Error: ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to change the current username or password
           without the appropriate privilege. This error also occurs if
           attempting to install a database without the necessary operating
           system privileges.
           When Trusted Oracle is configure in DBMS MAC, this error may occur
           if the user was granted the necessary privilege at a higher label
           than the current login.
*Action:   Ask the database administrator to perform the operation or grant
           the required privileges.
           For Trusted Oracle users getting this error although granted the
           the appropriate privilege at a higher label, ask the database
           administrator to regrant the privilege at the appropriate label.

Error starting at line : 124 in command -
insert into CD_SESSION_RUNS 
values (to_timestamp('10-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'HTML',405) 
Error at Command Line : 124 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 127 in command -
insert into CD_SESSION_RUNS 
values (to_timestamp('17-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'HTML',405) 
Error at Command Line : 127 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 130 in command -
insert into CD_SESSION_RUNS 
values (to_timestamp('10-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'ROBOT',415) 
Error at Command Line : 130 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 133 in command -
insert into CD_SESSION_RUNS 
values (to_timestamp('17-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'ROBOT',415) 
Error at Command Line : 133 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 136 in command -
insert into CD_SESSION_RUNS 
values (to_timestamp('17-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
'HTML',405) 
Error at Command Line : 136 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 139 in command -
insert into CD_SESSION_RUNS 
values (to_timestamp('10-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
'HTML',405) 
Error at Command Line : 139 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
Error starting at line : 142 in command -
insert into CD_SESSION_RUNS 
values (to_timestamp('24-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
'HTML',405) 
Error at Command Line : 142 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 145 in command -
CREATE TABLE CD_ATTENDS
(
	Coder_Id             NUMBER NOT NULL references CD_ATTENDEE,
	S_start              TIMESTAMP NOT NULL ,
	loc_id               CHAR(6) NOT NULL ,
	Spec_code            VARCHAR2(6) NOT NULL ,
	Badge_Earned         VARCHAR2(6) NULL check(badge_earned in ('Basic','Junior','Senior','Master')),
	Belt_Earned          VARCHAR2(6) NULL check (belt_earned in ('Blue','Yellow','White')),
 PRIMARY KEY (Coder_Id,S_start,loc_id,Spec_code),
FOREIGN KEY (S_start, loc_id, Spec_code) REFERENCES CD_SESSION_RUNS (S_start, loc_id, Spec_code)
)
Error at Command Line : 145 Column : 1
Error report -
SQL Error: ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to change the current username or password
           without the appropriate privilege. This error also occurs if
           attempting to install a database without the necessary operating
           system privileges.
           When Trusted Oracle is configure in DBMS MAC, this error may occur
           if the user was granted the necessary privilege at a higher label
           than the current login.
*Action:   Ask the database administrator to perform the operation or grant
           the required privileges.
           For Trusted Oracle users getting this error although granted the
           the appropriate privilege at a higher label, ask the database
           administrator to regrant the privilege at the appropriate label.

Error starting at line : 156 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code) 
values (4000,to_timestamp('10-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'ROBOT') 
Error at Command Line : 156 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 159 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code) 
values (4000,to_timestamp('17-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'ROBOT') 
Error at Command Line : 159 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 162 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code) 
values (4001,to_timestamp('10-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'HTML') 
Error at Command Line : 162 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 165 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code) 
values (4001,to_timestamp('17-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'HTML') 
Error at Command Line : 165 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 168 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code) 
values (4001,to_timestamp('10-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
'HTML') 
Error at Command Line : 168 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 171 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code) 
values (4001,to_timestamp('17-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
'HTML') 
Error at Command Line : 171 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 174 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code,badge_earned) 
values (4001,to_timestamp('24-Feb-2013 14:00:00','DD-Mon-YYYY HH24:Mi:SS'),'HALL01', 
'HTML','Basic') 
Error at Command Line : 174 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 177 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code) 
values (4002,to_timestamp('10-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'ROBOT') 
Error at Command Line : 177 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error starting at line : 180 in command -
insert into CD_ATTENDS (coder_id, s_start, loc_id, spec_code) 
values (4002,to_timestamp('17-Feb-2013 10:00:00','DD-Mon-YYYY HH24:Mi:SS'),'UNIV01', 
'ROBOT') 
Error at Command Line : 180 Column : 13
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
committed.

Error starting at line : 186 in command -
SELECT Coder_Name, Coder_Age, Coder_Email FROM CD_ATTENDEE
Error at Command Line : 186 Column : 48
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
