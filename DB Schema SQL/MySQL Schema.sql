/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2023/8/7 PM 10:29:40                         */
/*==============================================================*/


alter table TB_JOBS 
   drop foreign key FK_TB_0001;

alter table TB_JOB_EXECUTE_LOGS 
   drop foreign key FK_TB_0002;

alter table TB_JOB_EXECUTE_LOGS 
   drop foreign key FK_TB_0003;


alter table TB_JOBS 
   drop foreign key FK_TB_0001;

drop table if exists TB_JOBS;


alter table TB_JOB_EXECUTE_LOGS 
   drop foreign key FK_TB_0002;

alter table TB_JOB_EXECUTE_LOGS 
   drop foreign key FK_TB_0003;

drop table if exists TB_JOB_EXECUTE_LOGS;

drop table if exists TB_JOB_EXECUTE_STATUS;

drop table if exists TB_JOB_SYSTEMS;

/*==============================================================*/
/* Table: TB_JOBS                                               */
/*==============================================================*/
create table TB_JOBS
(
   ID                   varchar(36) not null  comment 'ID',
   TB_JOB_SYSTEMS_ID    varchar(36) not null  comment 'Job system''s ID',
   NAME                 varchar(50) not null  comment 'Name',
   CODE                 varchar(20) not null  comment 'Code',
   CLASS_NAME           varchar(200) not null  comment 'Java class name',
   JOB_DETAIL_BEAN_NAME varchar(80) not null  comment 'Spring job detail bean name',
   CREATE_DATE          datetime not null default CURRENT_TIMESTAMP  comment 'Create date',
   UPDATE_DATE          datetime  comment 'Update date',
   primary key (ID)
);

alter table TB_JOBS comment 'Job';

/*==============================================================*/
/* Table: TB_JOB_EXECUTE_LOGS                                   */
/*==============================================================*/
create table TB_JOB_EXECUTE_LOGS
(
   ID                   varchar(36) not null  comment 'ID',
   TB_JOBS_ID           varchar(36) not null  comment 'Job''s ID',
   TB_JOB_EXECUTE_STATUS_ID varchar(36) not null  comment 'Job execute status''s ID',
   CREATE_DATE          datetime not null default CURRENT_TIMESTAMP  comment 'Create date',
   UPDATE_DATE          datetime  comment 'Update date',
   primary key (ID)
);

alter table TB_JOB_EXECUTE_LOGS comment 'Job execute log';

/*==============================================================*/
/* Table: TB_JOB_EXECUTE_STATUS                                 */
/*==============================================================*/
create table TB_JOB_EXECUTE_STATUS
(
   ID                   varchar(36) not null  comment 'ID',
   NAME                 varchar(50) not null  comment 'Name',
   CODE                 varchar(20) not null  comment 'Code',
   primary key (ID),
   key AK_TB_JOB_EXECUTE_STATUS_UK1 (CODE)
);

alter table TB_JOB_EXECUTE_STATUS comment 'Job execute status';

/*==============================================================*/
/* Table: TB_JOB_SYSTEMS                                        */
/*==============================================================*/
create table TB_JOB_SYSTEMS
(
   ID                   varchar(36) not null  comment 'ID',
   NAME                 varchar(50) not null  comment 'Name',
   CODE                 varchar(20) not null  comment 'Code',
   primary key (ID),
   key AK_TB_JOB_SYSTEMS_UK1 (CODE)
);

alter table TB_JOB_SYSTEMS comment 'Job system';

alter table TB_JOBS add constraint FK_TB_0001 foreign key (TB_JOB_SYSTEMS_ID)
      references TB_JOB_SYSTEMS (ID) on delete restrict on update restrict;

alter table TB_JOB_EXECUTE_LOGS add constraint FK_TB_0002 foreign key (TB_JOB_EXECUTE_STATUS_ID)
      references TB_JOB_EXECUTE_STATUS (ID) on delete restrict on update restrict;

alter table TB_JOB_EXECUTE_LOGS add constraint FK_TB_0003 foreign key (TB_JOBS_ID)
      references TB_JOBS (ID) on delete restrict on update restrict;

