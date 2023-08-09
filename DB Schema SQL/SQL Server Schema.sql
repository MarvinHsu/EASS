/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     2023/8/9 PM 05:20:57                         */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_JOBS') and o.name = 'FK_TB_0001')
alter table TB_JOBS
   drop constraint FK_TB_0001
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_JOB_EXECUTE_LOGS') and o.name = 'FK_TB_0002')
alter table TB_JOB_EXECUTE_LOGS
   drop constraint FK_TB_0002
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TB_JOB_EXECUTE_LOGS') and o.name = 'FK_TB_0003')
alter table TB_JOB_EXECUTE_LOGS
   drop constraint FK_TB_0003
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_JOBS')
            and   type = 'U')
   drop table TB_JOBS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_JOB_EXECUTE_LOGS')
            and   type = 'U')
   drop table TB_JOB_EXECUTE_LOGS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_JOB_EXECUTE_STATUS')
            and   type = 'U')
   drop table TB_JOB_EXECUTE_STATUS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TB_JOB_SYSTEMS')
            and   type = 'U')
   drop table TB_JOB_SYSTEMS
go

/*==============================================================*/
/* Table: TB_JOBS                                               */
/*==============================================================*/
create table TB_JOBS (
   ID                   varchar(36)          not null,
   TB_JOB_SYSTEMS_ID    varchar(36)          not null,
   NAME                 nvarchar(50)         not null,
   CODE                 varchar(20)          not null,
   CLASS_NAME           varchar(200)         not null,
   JOB_DETAIL_BEAN_NAME varchar(80)          not null,
   CREATE_DATE          datetime             not null default getdate(),
   UPDATE_DATE          datetime             null,
   constraint PK_TB_JOBS primary key nonclustered (ID),
   constraint AK_TB_JOBS_UK1 unique (TB_JOB_SYSTEMS_ID, CODE)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('TB_JOBS') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'TB_JOBS' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Job', 
   'user', @CurrentUser, 'table', 'TB_JOBS'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOBS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOBS', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ID',
   'user', @CurrentUser, 'table', 'TB_JOBS', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOBS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TB_JOB_SYSTEMS_ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOBS', 'column', 'TB_JOB_SYSTEMS_ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Job system''s ID',
   'user', @CurrentUser, 'table', 'TB_JOBS', 'column', 'TB_JOB_SYSTEMS_ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOBS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'NAME')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOBS', 'column', 'NAME'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Name',
   'user', @CurrentUser, 'table', 'TB_JOBS', 'column', 'NAME'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOBS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CODE')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOBS', 'column', 'CODE'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Code',
   'user', @CurrentUser, 'table', 'TB_JOBS', 'column', 'CODE'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOBS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CLASS_NAME')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOBS', 'column', 'CLASS_NAME'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Java class name',
   'user', @CurrentUser, 'table', 'TB_JOBS', 'column', 'CLASS_NAME'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOBS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'JOB_DETAIL_BEAN_NAME')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOBS', 'column', 'JOB_DETAIL_BEAN_NAME'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Spring job detail bean name',
   'user', @CurrentUser, 'table', 'TB_JOBS', 'column', 'JOB_DETAIL_BEAN_NAME'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOBS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CREATE_DATE')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOBS', 'column', 'CREATE_DATE'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Create date',
   'user', @CurrentUser, 'table', 'TB_JOBS', 'column', 'CREATE_DATE'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOBS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UPDATE_DATE')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOBS', 'column', 'UPDATE_DATE'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Update date',
   'user', @CurrentUser, 'table', 'TB_JOBS', 'column', 'UPDATE_DATE'
go

/*==============================================================*/
/* Table: TB_JOB_EXECUTE_LOGS                                   */
/*==============================================================*/
create table TB_JOB_EXECUTE_LOGS (
   ID                   varchar(36)          not null,
   TB_JOBS_ID           varchar(36)          not null,
   TB_JOB_EXECUTE_STATUS_ID varchar(36)          not null,
   CREATE_DATE          datetime             not null default getdate(),
   UPDATE_DATE          datetime             null,
   constraint PK_TB_JOB_EXECUTE_LOGS primary key nonclustered (ID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('TB_JOB_EXECUTE_LOGS') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_LOGS' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Job execute log', 
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_LOGS'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOB_EXECUTE_LOGS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_LOGS', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ID',
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_LOGS', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOB_EXECUTE_LOGS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TB_JOBS_ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_LOGS', 'column', 'TB_JOBS_ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Job''s ID',
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_LOGS', 'column', 'TB_JOBS_ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOB_EXECUTE_LOGS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TB_JOB_EXECUTE_STATUS_ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_LOGS', 'column', 'TB_JOB_EXECUTE_STATUS_ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Job execute status''s ID',
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_LOGS', 'column', 'TB_JOB_EXECUTE_STATUS_ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOB_EXECUTE_LOGS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CREATE_DATE')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_LOGS', 'column', 'CREATE_DATE'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Create date',
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_LOGS', 'column', 'CREATE_DATE'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOB_EXECUTE_LOGS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UPDATE_DATE')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_LOGS', 'column', 'UPDATE_DATE'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Update date',
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_LOGS', 'column', 'UPDATE_DATE'
go

/*==============================================================*/
/* Table: TB_JOB_EXECUTE_STATUS                                 */
/*==============================================================*/
create table TB_JOB_EXECUTE_STATUS (
   ID                   varchar(36)          not null,
   NAME                 nvarchar(50)         not null,
   CODE                 varchar(20)          not null,
   constraint PK_TB_JOB_EXECUTE_STATUS primary key nonclustered (ID),
   constraint AK_TB_JOB_EXECUTE_STA_TB_JOB_E unique (CODE)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('TB_JOB_EXECUTE_STATUS') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_STATUS' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Job execute status', 
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_STATUS'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOB_EXECUTE_STATUS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_STATUS', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ID',
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_STATUS', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOB_EXECUTE_STATUS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'NAME')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_STATUS', 'column', 'NAME'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Name',
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_STATUS', 'column', 'NAME'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOB_EXECUTE_STATUS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CODE')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_STATUS', 'column', 'CODE'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Code',
   'user', @CurrentUser, 'table', 'TB_JOB_EXECUTE_STATUS', 'column', 'CODE'
go

/*==============================================================*/
/* Table: TB_JOB_SYSTEMS                                        */
/*==============================================================*/
create table TB_JOB_SYSTEMS (
   ID                   varchar(36)          not null,
   NAME                 nvarchar(50)         not null,
   CODE                 varchar(20)          not null,
   constraint PK_TB_JOB_SYSTEMS primary key nonclustered (ID),
   constraint AK_TB_JOB_SYSTEMS_UK1_TB_JOB_S unique (CODE)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('TB_JOB_SYSTEMS') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'TB_JOB_SYSTEMS' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Job system', 
   'user', @CurrentUser, 'table', 'TB_JOB_SYSTEMS'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOB_SYSTEMS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOB_SYSTEMS', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ID',
   'user', @CurrentUser, 'table', 'TB_JOB_SYSTEMS', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOB_SYSTEMS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'NAME')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOB_SYSTEMS', 'column', 'NAME'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Name',
   'user', @CurrentUser, 'table', 'TB_JOB_SYSTEMS', 'column', 'NAME'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TB_JOB_SYSTEMS')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CODE')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TB_JOB_SYSTEMS', 'column', 'CODE'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Code',
   'user', @CurrentUser, 'table', 'TB_JOB_SYSTEMS', 'column', 'CODE'
go

alter table TB_JOBS
   add constraint FK_TB_0001 foreign key (TB_JOB_SYSTEMS_ID)
      references TB_JOB_SYSTEMS (ID)
go

alter table TB_JOB_EXECUTE_LOGS
   add constraint FK_TB_0002 foreign key (TB_JOB_EXECUTE_STATUS_ID)
      references TB_JOB_EXECUTE_STATUS (ID)
go

alter table TB_JOB_EXECUTE_LOGS
   add constraint FK_TB_0003 foreign key (TB_JOBS_ID)
      references TB_JOBS (ID)
go

