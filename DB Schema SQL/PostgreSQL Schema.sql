/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     2023/8/8 PM 11:17:17                         */
/*==============================================================*/


drop table TB_JOBS;

drop table TB_JOB_EXECUTE_LOGS;

drop table TB_JOB_EXECUTE_STATUS;

drop table TB_JOB_SYSTEMS;

/*==============================================================*/
/* Table: TB_JOBS                                               */
/*==============================================================*/
create table TB_JOBS (
   ID                   VARCHAR(36)          not null,
   TB_JOB_SYSTEMS_ID    VARCHAR(36)          not null,
   NAME                 VARCHAR(50)          not null,
   CODE                 VARCHAR(20)          not null,
   CLASS_NAME           VARCHAR(200)         not null,
   JOB_DETAIL_BEAN_NAME VARCHAR(80)          not null,
   CREATE_DATE          DATE                 not null default current_date,
   UPDATE_DATE          DATE                 null,
   constraint PK_TB_JOBS primary key (ID),
   constraint AK_TB_JOBS_UK1 unique (TB_JOB_SYSTEMS_ID, CODE)
);

comment on table TB_JOBS is
'Job';

comment on column TB_JOBS.ID is
'ID';

comment on column TB_JOBS.TB_JOB_SYSTEMS_ID is
'Job system''s ID';

comment on column TB_JOBS.NAME is
'Name';

comment on column TB_JOBS.CODE is
'Code';

comment on column TB_JOBS.CLASS_NAME is
'Java class name';

comment on column TB_JOBS.JOB_DETAIL_BEAN_NAME is
'Spring job detail bean name';

comment on column TB_JOBS.CREATE_DATE is
'Create date';

comment on column TB_JOBS.UPDATE_DATE is
'Update date';

/*==============================================================*/
/* Table: TB_JOB_EXECUTE_LOGS                                   */
/*==============================================================*/
create table TB_JOB_EXECUTE_LOGS (
   ID                   VARCHAR(36)          not null,
   TB_JOBS_ID           VARCHAR(36)          not null,
   TB_JOB_EXECUTE_STATUS_ID VARCHAR(36)          not null,
   CREATE_DATE          DATE                 not null default current_date,
   UPDATE_DATE          DATE                 null,
   constraint PK_TB_JOB_EXECUTE_LOGS primary key (ID)
);

comment on table TB_JOB_EXECUTE_LOGS is
'Job execute log';

comment on column TB_JOB_EXECUTE_LOGS.ID is
'ID';

comment on column TB_JOB_EXECUTE_LOGS.TB_JOBS_ID is
'Job''s ID';

comment on column TB_JOB_EXECUTE_LOGS.TB_JOB_EXECUTE_STATUS_ID is
'Job execute status''s ID';

comment on column TB_JOB_EXECUTE_LOGS.CREATE_DATE is
'Create date';

comment on column TB_JOB_EXECUTE_LOGS.UPDATE_DATE is
'Update date';

/*==============================================================*/
/* Table: TB_JOB_EXECUTE_STATUS                                 */
/*==============================================================*/
create table TB_JOB_EXECUTE_STATUS (
   ID                   VARCHAR(36)          not null,
   NAME                 VARCHAR(50)          not null,
   CODE                 VARCHAR(20)          not null,
   constraint PK_TB_JOB_EXECUTE_STATUS primary key (ID),
   constraint AK_TB_JOB_EXECUTE_STA_TB_JOB_E unique (CODE)
);

comment on table TB_JOB_EXECUTE_STATUS is
'Job execute status';

comment on column TB_JOB_EXECUTE_STATUS.ID is
'ID';

comment on column TB_JOB_EXECUTE_STATUS.NAME is
'Name';

comment on column TB_JOB_EXECUTE_STATUS.CODE is
'Code';

/*==============================================================*/
/* Table: TB_JOB_SYSTEMS                                        */
/*==============================================================*/
create table TB_JOB_SYSTEMS (
   ID                   VARCHAR(36)          not null,
   NAME                 VARCHAR(50)          not null,
   CODE                 VARCHAR(20)          not null,
   constraint PK_TB_JOB_SYSTEMS primary key (ID),
   constraint AK_TB_JOB_SYSTEMS_UK1_TB_JOB_S unique (CODE)
);

comment on table TB_JOB_SYSTEMS is
'Job system';

comment on column TB_JOB_SYSTEMS.ID is
'ID';

comment on column TB_JOB_SYSTEMS.NAME is
'Name';

comment on column TB_JOB_SYSTEMS.CODE is
'Code';

alter table TB_JOBS
   add constraint FK_TB_0001 foreign key (TB_JOB_SYSTEMS_ID)
      references TB_JOB_SYSTEMS (ID)
      on delete restrict on update restrict;

alter table TB_JOB_EXECUTE_LOGS
   add constraint FK_TB_0002 foreign key (TB_JOB_EXECUTE_STATUS_ID)
      references TB_JOB_EXECUTE_STATUS (ID)
      on delete restrict on update restrict;

alter table TB_JOB_EXECUTE_LOGS
   add constraint FK_TB_0003 foreign key (TB_JOBS_ID)
      references TB_JOBS (ID)
      on delete restrict on update restrict;

