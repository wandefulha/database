/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     2021/6/30 18:48:05                           */
/*==============================================================*/


if exists (select 1
          from sysobjects
          where id = object_id('updateAllStuId')
          and type = 'TR')
   drop trigger updateAllStuId
go

if exists (select 1
          from sysobjects
          where id = object_id('updateClassNum')
          and type = 'TR')
   drop trigger updateClassNum
go

if exists (select 1
          from sysobjects
          where id = object_id('updateDeparStuNum')
          and type = 'TR')
   drop trigger updateDeparStuNum
go

if exists (select 1
          from sysobjects
          where id = object_id('updateAllTeacId')
          and type = 'TR')
   drop trigger updateAllTeacId
go

if exists (select 1
          from sysobjects
          where id = object_id('updateDeparTeacNum')
          and type = 'TR')
   drop trigger updateDeparTeacNum
go

if exists (select 1
          from sysobjects
          where  id = object_id('getAvgGradesByCourseId')
          and type in ('P','PC'))
   drop procedure getAvgGradesByCourseId
go

if exists (select 1
          from sysobjects
          where  id = object_id('getNotQualByCourseId')
          and type in ('P','PC'))
   drop procedure getNotQualByCourseId
go

if exists (select 1
          from sysobjects
          where  id = object_id('getStuCountByClassId')
          and type in ('P','PC'))
   drop procedure getStuCountByClassId
go

if exists (select 1
          from sysobjects
          where  id = object_id('getTeacCountByDeparId')
          and type in ('P','PC'))
   drop procedure getTeacCountByDeparId
go

if exists (select 1
          from sysobjects
          where  id = object_id('tenPerAbsentStu')
          and type in ('P','PC'))
   drop procedure tenPerAbsentStu
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('StuFee') and o.name = 'FK_STUFEE_STUFEE_CLASS')
alter table StuFee
   drop constraint FK_STUFEE_STUFEE_CLASS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('StuFee') and o.name = 'FK_STUFEE_STUFEE2_STUDENT')
alter table StuFee
   drop constraint FK_STUFEE_STUFEE2_STUDENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('StuShift') and o.name = 'FK_STUSHIFT_HAVESHIFT_STUDENT')
alter table StuShift
   drop constraint FK_STUSHIFT_HAVESHIFT_STUDENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('class') and o.name = 'FK_CLASS_包含2_DEPARTME')
alter table class
   drop constraint FK_CLASS_包含2_DEPARTME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('class') and o.name = 'FK_CLASS_担任_TEACHER')
alter table class
   drop constraint FK_CLASS_担任_TEACHER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('class') and o.name = 'FK_CLASS_有班长_STUDENT')
alter table class
   drop constraint FK_CLASS_有班长_STUDENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('course') and o.name = 'FK_COURSE_HAVECOURS_DEPARTME')
alter table course
   drop constraint FK_COURSE_HAVECOURS_DEPARTME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('courseTeacher') and o.name = 'FK_COURSETE_COURSETEA_TEACHER')
alter table courseTeacher
   drop constraint FK_COURSETE_COURSETEA_TEACHER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('courseTeacher') and o.name = 'FK_COURSETE_COURSETEA_COURSE')
alter table courseTeacher
   drop constraint FK_COURSETE_COURSETEA_COURSE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('courseTeacher') and o.name = 'FK_COURSETE_COURSETEA_CLASS')
alter table courseTeacher
   drop constraint FK_COURSETE_COURSETEA_CLASS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('department') and o.name = 'FK_DEPARTME_CTRLDEPAR_TEACHER')
alter table department
   drop constraint FK_DEPARTME_CTRLDEPAR_TEACHER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('evaluation') and o.name = 'FK_EVALUATI_EVALUATIO_STUDENT')
alter table evaluation
   drop constraint FK_EVALUATI_EVALUATIO_STUDENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('evaluation') and o.name = 'FK_EVALUATI_EVALUATIO_TEACHER')
alter table evaluation
   drop constraint FK_EVALUATI_EVALUATIO_TEACHER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('evaluation') and o.name = 'FK_EVALUATI_EVALUATIO_COURSE')
alter table evaluation
   drop constraint FK_EVALUATI_EVALUATIO_COURSE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('student') and o.name = 'FK_STUDENT_拥有_CLASS')
alter table student
   drop constraint FK_STUDENT_拥有_CLASS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('studentAbsent') and o.name = 'FK_STUDENTA_STUDENTAB_STUDENT')
alter table studentAbsent
   drop constraint FK_STUDENTA_STUDENTAB_STUDENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('studentAbsent') and o.name = 'FK_STUDENTA_STUDENTAB_COURSE')
alter table studentAbsent
   drop constraint FK_STUDENTA_STUDENTAB_COURSE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('studentAbsent') and o.name = 'FK_STUDENTA_STUDENTAB_TEACHER')
alter table studentAbsent
   drop constraint FK_STUDENTA_STUDENTAB_TEACHER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('studentGrade') and o.name = 'FK_STUDENTG_STUDENTGR_STUDENT')
alter table studentGrade
   drop constraint FK_STUDENTG_STUDENTGR_STUDENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('studentGrade') and o.name = 'FK_STUDENTG_STUDENTGR_COURSE')
alter table studentGrade
   drop constraint FK_STUDENTG_STUDENTGR_COURSE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('teacAbsent') and o.name = 'FK_TEACABSE_TEACABSEN_COURSE')
alter table teacAbsent
   drop constraint FK_TEACABSE_TEACABSEN_COURSE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('teacAbsent') and o.name = 'FK_TEACABSE_TEACABSEN_CLASS')
alter table teacAbsent
   drop constraint FK_TEACABSE_TEACABSEN_CLASS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('teacAbsent') and o.name = 'FK_TEACABSE_TEACABSEN_TEACHER')
alter table teacAbsent
   drop constraint FK_TEACABSE_TEACABSEN_TEACHER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('teacher') and o.name = 'FK_TEACHER_包含有2_DEPARTME')
alter table teacher
   drop constraint FK_TEACHER_包含有2_DEPARTME
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tenPercentStudentAbsent')
            and   type = 'V')
   drop view tenPercentStudentAbsent
go

if exists (select 1
            from  sysobjects
           where  id = object_id('teacherRank')
            and   type = 'V')
   drop view teacherRank
go

if exists (select 1
            from  sysobjects
           where  id = object_id('studentRank')
            and   type = 'V')
   drop view studentRank
go

if exists (select 1
            from  sysobjects
           where  id = object_id('stuFeeList')
            and   type = 'V')
   drop view stuFeeList
go

if exists (select 1
            from  sysobjects
           where  id = object_id('retiredTeacher')
            and   type = 'V')
   drop view retiredTeacher
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('StuFee')
            and   name  = 'StuFee2_FK'
            and   indid > 0
            and   indid < 255)
   drop index StuFee.StuFee2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('StuFee')
            and   name  = 'StuFee_FK'
            and   indid > 0
            and   indid < 255)
   drop index StuFee.StuFee_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('StuFee')
            and   type = 'U')
   drop table StuFee
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('StuShift')
            and   name  = 'haveshifting_FK'
            and   indid > 0
            and   indid < 255)
   drop index StuShift.haveshifting_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('StuShift')
            and   type = 'U')
   drop table StuShift
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('class')
            and   name  = 'cls_index'
            and   indid > 0
            and   indid < 255)
   drop index class.cls_index
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('class')
            and   name  = '有班长_FK'
            and   indid > 0
            and   indid < 255)
   drop index class.有班长_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('class')
            and   name  = '担任_FK'
            and   indid > 0
            and   indid < 255)
   drop index class.担任_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('class')
            and   name  = '包含2_FK'
            and   indid > 0
            and   indid < 255)
   drop index class.包含2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('class')
            and   type = 'U')
   drop table class
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('course')
            and   name  = 'crs_index'
            and   indid > 0
            and   indid < 255)
   drop index course.crs_index
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('course')
            and   name  = 'havecourse_FK'
            and   indid > 0
            and   indid < 255)
   drop index course.havecourse_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('course')
            and   type = 'U')
   drop table course
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('courseTeacher')
            and   name  = 'courseTeacher3_FK'
            and   indid > 0
            and   indid < 255)
   drop index courseTeacher.courseTeacher3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('courseTeacher')
            and   name  = 'courseTeacher2_FK'
            and   indid > 0
            and   indid < 255)
   drop index courseTeacher.courseTeacher2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('courseTeacher')
            and   name  = 'courseTeacher_FK'
            and   indid > 0
            and   indid < 255)
   drop index courseTeacher.courseTeacher_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('courseTeacher')
            and   type = 'U')
   drop table courseTeacher
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('department')
            and   name  = 'dpt_index'
            and   indid > 0
            and   indid < 255)
   drop index department.dpt_index
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('department')
            and   name  = 'CtrlDepar_FK'
            and   indid > 0
            and   indid < 255)
   drop index department.CtrlDepar_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('department')
            and   type = 'U')
   drop table department
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('evaluation')
            and   name  = 'evaluation3_FK'
            and   indid > 0
            and   indid < 255)
   drop index evaluation.evaluation3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('evaluation')
            and   name  = 'evaluation2_FK'
            and   indid > 0
            and   indid < 255)
   drop index evaluation.evaluation2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('evaluation')
            and   name  = 'evaluation_FK'
            and   indid > 0
            and   indid < 255)
   drop index evaluation.evaluation_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('evaluation')
            and   type = 'U')
   drop table evaluation
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('student')
            and   name  = 'stu_index'
            and   indid > 0
            and   indid < 255)
   drop index student.stu_index
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('student')
            and   name  = '拥有_FK'
            and   indid > 0
            and   indid < 255)
   drop index student.拥有_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('student')
            and   type = 'U')
   drop table student
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('studentAbsent')
            and   name  = 'studentAbsent3_FK'
            and   indid > 0
            and   indid < 255)
   drop index studentAbsent.studentAbsent3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('studentAbsent')
            and   name  = 'studentAbsent2_FK'
            and   indid > 0
            and   indid < 255)
   drop index studentAbsent.studentAbsent2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('studentAbsent')
            and   name  = 'studentAbsent_FK'
            and   indid > 0
            and   indid < 255)
   drop index studentAbsent.studentAbsent_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('studentAbsent')
            and   type = 'U')
   drop table studentAbsent
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('studentGrade')
            and   name  = 'studentGrade2_FK'
            and   indid > 0
            and   indid < 255)
   drop index studentGrade.studentGrade2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('studentGrade')
            and   name  = 'studentGrade_FK'
            and   indid > 0
            and   indid < 255)
   drop index studentGrade.studentGrade_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('studentGrade')
            and   type = 'U')
   drop table studentGrade
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('teacAbsent')
            and   name  = 'teacAbsent3_FK'
            and   indid > 0
            and   indid < 255)
   drop index teacAbsent.teacAbsent3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('teacAbsent')
            and   name  = 'teacAbsent2_FK'
            and   indid > 0
            and   indid < 255)
   drop index teacAbsent.teacAbsent2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('teacAbsent')
            and   name  = 'teacAbsent_FK'
            and   indid > 0
            and   indid < 255)
   drop index teacAbsent.teacAbsent_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('teacAbsent')
            and   type = 'U')
   drop table teacAbsent
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('teacher')
            and   name  = 'teac_index'
            and   indid > 0
            and   indid < 255)
   drop index teacher.teac_index
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('teacher')
            and   name  = '包含有2_FK'
            and   indid > 0
            and   indid < 255)
   drop index teacher.包含有2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('teacher')
            and   type = 'U')
   drop table teacher
go

/*==============================================================*/
/* Table: StuFee                                                */
/*==============================================================*/
create table StuFee (
   class_id             varchar(6)           not null,
   stu_id               varchar(9)           not null,
   stuFee               int                  not null,
   feeYear              varchar(10)          not null,
   isTrue               bit                  not null,
   constraint PK_STUFEE primary key (class_id, stu_id, feeYear)
)
go

/*==============================================================*/
/* Index: StuFee_FK                                             */
/*==============================================================*/
create index StuFee_FK on StuFee (
class_id ASC
)
go

/*==============================================================*/
/* Index: StuFee2_FK                                            */
/*==============================================================*/
create index StuFee2_FK on StuFee (
stu_id ASC
)
go

/*==============================================================*/
/* Table: StuShift                                              */
/*==============================================================*/
create table StuShift (
   shift_start          datetime             not null,
   shift_end            datetime             not null,
   stu_id               varchar(9)           not null,
   shift_reason         varchar(100)         not null,
   constraint PK_STUSHIFT primary key (shift_start, shift_end, stu_id)
)
go

/*==============================================================*/
/* Index: haveshifting_FK                                       */
/*==============================================================*/
create index haveshifting_FK on StuShift (
stu_id ASC
)
go

/*==============================================================*/
/* Table: class                                                 */
/*==============================================================*/
create table class (
   class_id             varchar(6)           not null,
   teac_id              varchar(4)           null,
   stu_id               varchar(9)           null,
   depar_id             varchar(2)           null,
   class_name           varchar(20)          not null,
   class_num            int                  null,
   enroll_year          datetime             not null,
   class_genre          varchar(10)          not null,
   class_dur            smallint             not null,
   constraint PK_CLASS primary key nonclustered (class_id)
)
go

/*==============================================================*/
/* Index: 包含2_FK                                                */
/*==============================================================*/
create index 包含2_FK on class (
depar_id ASC
)
go

/*==============================================================*/
/* Index: 担任_FK                                                 */
/*==============================================================*/
create index 担任_FK on class (
teac_id ASC
)
go

/*==============================================================*/
/* Index: 有班长_FK                                                */
/*==============================================================*/
create index 有班长_FK on class (
stu_id ASC
)
go

/*==============================================================*/
/* Index: cls_index                                             */
/*==============================================================*/
create unique index cls_index on class (
class_id ASC,
depar_id ASC,
class_name ASC
)
go

/*==============================================================*/
/* Table: course                                                */
/*==============================================================*/
create table course (
   course_id            varchar(4)           not null,
   depar_id             varchar(2)           null,
   course_name          varchar(20)          not null,
   course_hour          smallint             not null,
   intoduce             varchar(200)         null,
   constraint PK_COURSE primary key nonclustered (course_id)
)
go

/*==============================================================*/
/* Index: havecourse_FK                                         */
/*==============================================================*/
create index havecourse_FK on course (
depar_id ASC
)
go

/*==============================================================*/
/* Index: crs_index                                             */
/*==============================================================*/
create unique index crs_index on course (
course_id ASC,
course_name ASC
)
go

/*==============================================================*/
/* Table: courseTeacher                                         */
/*==============================================================*/
create table courseTeacher (
   teac_id              varchar(4)           not null,
   course_id            varchar(4)           not null,
   class_id             varchar(6)           not null,
   TeacYear             varchar(10)          not null,
   TeacTerm             int                  not null,
   constraint PK_COURSETEACHER primary key (teac_id, course_id, class_id, TeacYear)
)
go

/*==============================================================*/
/* Index: courseTeacher_FK                                      */
/*==============================================================*/
create index courseTeacher_FK on courseTeacher (
teac_id ASC
)
go

/*==============================================================*/
/* Index: courseTeacher2_FK                                     */
/*==============================================================*/
create index courseTeacher2_FK on courseTeacher (
course_id ASC
)
go

/*==============================================================*/
/* Index: courseTeacher3_FK                                     */
/*==============================================================*/
create index courseTeacher3_FK on courseTeacher (
class_id ASC
)
go

/*==============================================================*/
/* Table: department                                            */
/*==============================================================*/
create table department (
   depar_id             varchar(2)           not null,
   teac_id              varchar(4)           null,
   depar_name           varchar(50)          not null,
   phone                varchar(15)          null,
   teac_num             int                  null,
   stu_num              int                  null,
   constraint PK_DEPARTMENT primary key nonclustered (depar_id)
)
go

/*==============================================================*/
/* Index: CtrlDepar_FK                                          */
/*==============================================================*/
create index CtrlDepar_FK on department (
teac_id ASC
)
go

/*==============================================================*/
/* Index: dpt_index                                             */
/*==============================================================*/
create unique index dpt_index on department (
depar_id ASC,
depar_name ASC
)
go

/*==============================================================*/
/* Table: evaluation                                            */
/*==============================================================*/
create table evaluation (
   stu_id               varchar(9)           not null,
   teac_id              varchar(4)           not null,
   course_id            varchar(4)           not null,
   score                int                  null,
   evalYear             varchar(10)          not null,
   evalTerm             int                  not null,
   constraint PK_EVALUATION primary key (stu_id, teac_id, course_id, evalYear, evalTerm)
)
go

/*==============================================================*/
/* Index: evaluation_FK                                         */
/*==============================================================*/
create index evaluation_FK on evaluation (
stu_id ASC
)
go

/*==============================================================*/
/* Index: evaluation2_FK                                        */
/*==============================================================*/
create index evaluation2_FK on evaluation (
teac_id ASC
)
go

/*==============================================================*/
/* Index: evaluation3_FK                                        */
/*==============================================================*/
create index evaluation3_FK on evaluation (
course_id ASC
)
go

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
create table student (
   stu_id               varchar(9)           not null,
   class_id             varchar(6)           null,
   stu_name             varchar(8)           not null,
   stu_sex              varchar(2)           not null,
   birthday             date                 null,
   phone                varchar(15)          null,
   address              varchar(100)         null,
   constraint PK_STUDENT primary key nonclustered (stu_id)
)
go

/*==============================================================*/
/* Index: 拥有_FK                                                 */
/*==============================================================*/
create index 拥有_FK on student (
class_id ASC
)
go

/*==============================================================*/
/* Index: stu_index                                             */
/*==============================================================*/
create unique index stu_index on student (
stu_id ASC,
class_id ASC,
stu_name ASC
)
go

/*==============================================================*/
/* Table: studentAbsent                                         */
/*==============================================================*/
create table studentAbsent (
   stu_id               varchar(9)           not null,
   course_id            varchar(4)           not null,
   teac_id              varchar(4)           not null,
   absentDate           datetime             not null,
   reason               varchar(100)         not null,
   constraint PK_STUDENTABSENT primary key (stu_id, course_id, teac_id, absentDate)
)
go

/*==============================================================*/
/* Index: studentAbsent_FK                                      */
/*==============================================================*/
create index studentAbsent_FK on studentAbsent (
stu_id ASC
)
go

/*==============================================================*/
/* Index: studentAbsent2_FK                                     */
/*==============================================================*/
create index studentAbsent2_FK on studentAbsent (
course_id ASC
)
go

/*==============================================================*/
/* Index: studentAbsent3_FK                                     */
/*==============================================================*/
create index studentAbsent3_FK on studentAbsent (
teac_id ASC
)
go

/*==============================================================*/
/* Table: studentGrade                                          */
/*==============================================================*/
create table studentGrade (
   stu_id               varchar(9)           not null,
   course_id            varchar(4)           not null,
   grade                smallint             null,
   selYear              varchar(10)          not null,
   selTerm              int                  not null,
   constraint PK_STUDENTGRADE primary key (stu_id, course_id, selYear, selTerm)
)
go

/*==============================================================*/
/* Index: studentGrade_FK                                       */
/*==============================================================*/
create index studentGrade_FK on studentGrade (
stu_id ASC
)
go

/*==============================================================*/
/* Index: studentGrade2_FK                                      */
/*==============================================================*/
create index studentGrade2_FK on studentGrade (
course_id ASC
)
go

/*==============================================================*/
/* Table: teacAbsent                                            */
/*==============================================================*/
create table teacAbsent (
   course_id            varchar(4)           not null,
   class_id             varchar(6)           not null,
   teac_id              varchar(4)           not null,
   absentDate           datetime             not null,
   reason               varchar(100)         not null,
   constraint PK_TEACABSENT primary key (course_id, class_id, teac_id, absentDate)
)
go

/*==============================================================*/
/* Index: teacAbsent_FK                                         */
/*==============================================================*/
create index teacAbsent_FK on teacAbsent (
course_id ASC
)
go

/*==============================================================*/
/* Index: teacAbsent2_FK                                        */
/*==============================================================*/
create index teacAbsent2_FK on teacAbsent (
class_id ASC
)
go

/*==============================================================*/
/* Index: teacAbsent3_FK                                        */
/*==============================================================*/
create index teacAbsent3_FK on teacAbsent (
teac_id ASC
)
go

/*==============================================================*/
/* Table: teacher                                               */
/*==============================================================*/
create table teacher (
   teac_id              varchar(4)           not null,
   depar_id             varchar(2)           null,
   teac_name            varchar(8)           not null,
   teac_sex             varchar(2)           null,
   birthday             datetime             null,
   techPost             varchar(10)          null,
   constraint PK_TEACHER primary key nonclustered (teac_id)
)
go

/*==============================================================*/
/* Index: 包含有2_FK                                               */
/*==============================================================*/
create index 包含有2_FK on teacher (
depar_id ASC
)
go

/*==============================================================*/
/* Index: teac_index                                            */
/*==============================================================*/
create unique index teac_index on teacher (
teac_id ASC,
depar_id ASC,
teac_name ASC
)
go

/*==============================================================*/
/* View: retiredTeacher                                         */
/*==============================================================*/
create view retiredTeacher as
select
   teacher.teac_id,
   teacher.teac_name
from
   teacher
where
   year(getdate())-year(teacher.birthday) > 55
   And teac_sex = '女'
union
select
   teacher.teac_id,
   teacher.teac_name
from
   teacher
where
   year(getdate())-year(teacher.birthday) > 60
   And teac_sex = '男'
go

/*==============================================================*/
/* View: stuFeeList                                             */
/*==============================================================*/
create view stuFeeList as

select
   student.stu_id,
   student.class_id,
   student.stu_name,
   StuFee.stuFee,
   StuFee.isTrue,
   StuFee.feeYear,
   class.class_name,
   dbo.isNotEmpty(StuShift.stu_id) as '学籍是否调动'
from
   student
Join
	stufee
On
	student.stu_id=stufee.stu_id
Join 
	class
on
	class.class_id=stufee.class_id
Right outer join
    StuShift
On
    stuShift.stu_id=stufee.stu_id
go

/*==============================================================*/
/* View: studentRank                                            */
/*==============================================================*/
create view studentRank (course_id, class_id, stu_name, stu_id, 成绩, "'排名'", "'年度'", "'学期'") as
select
   studentGrade.course_id,
   student.class_id,
   student.stu_name,
   studentGrade.stu_id,
   studentGrade.grade as '分数',
   dense_rank () OVER (PARTITION BY studentGrade.course_id,selyear,selterm ORDER BY studentGrade.grade desc) as '排名',
   selyear as '年度',
   selterm as '学期'
from
   student,
   studentGrade
where
   student.stu_id = studentGrade.stu_id
go

/*==============================================================*/
/* View: teacherRank                                            */
/*==============================================================*/
create view teacherRank (course_name, teac_name, teac_id, course_id, 分数, "'排名'", "'年度'", "'学期'") as
select
   course.course_name,
   teacher.teac_name,
   evaluation.teac_id,
   evaluation.course_id,
   avg (evaluation.score) as '分数',
   dense_rank () OVER (Partition by evalyear,evalterm ORDER BY (avg (evaluation.score)) desc) as '排名',
   evalyear as '年度',
   evalterm as '学期'
from
   course,
   student,
   teacher,
   evaluation
where 
   course.course_id=evaluation.course_id
   and
   student.stu_id=evaluation.stu_id
   and 
   teacher.teac_id=evaluation.teac_id
Group By
   evaluation.teac_id,
   evaluation.course_id,
   course.course_name,
   teacher.teac_name,
   evalyear,
   evalterm
go

/*==============================================================*/
/* View: tenPercentStudentAbsent                                */
/*==============================================================*/
create view tenPercentStudentAbsent (stu_name, stu_id, count) as
select
   top 10 percent
   student.stu_name,
   studentAbsent.stu_id,
   count(*) as '请假次数'
from
   student,
   studentAbsent
Where
    student.stu_id=studentAbsent.stu_id
Group By
    student.stu_name,
    studentAbsent.stu_id
Order By  count(*) desc
go

alter table StuFee
   add constraint FK_STUFEE_STUFEE_CLASS foreign key (class_id)
      references class (class_id)
go

alter table StuFee
   add constraint FK_STUFEE_STUFEE2_STUDENT foreign key (stu_id)
      references student (stu_id)
go

alter table StuShift
   add constraint FK_STUSHIFT_HAVESHIFT_STUDENT foreign key (stu_id)
      references student (stu_id)
go

alter table class
   add constraint FK_CLASS_包含2_DEPARTME foreign key (depar_id)
      references department (depar_id)
go

alter table class
   add constraint FK_CLASS_担任_TEACHER foreign key (teac_id)
      references teacher (teac_id)
go

alter table class
   add constraint FK_CLASS_有班长_STUDENT foreign key (stu_id)
      references student (stu_id)
go

alter table course
   add constraint FK_COURSE_HAVECOURS_DEPARTME foreign key (depar_id)
      references department (depar_id)
go

alter table courseTeacher
   add constraint FK_COURSETE_COURSETEA_TEACHER foreign key (teac_id)
      references teacher (teac_id)
go

alter table courseTeacher
   add constraint FK_COURSETE_COURSETEA_COURSE foreign key (course_id)
      references course (course_id)
go

alter table courseTeacher
   add constraint FK_COURSETE_COURSETEA_CLASS foreign key (class_id)
      references class (class_id)
go

alter table department
   add constraint FK_DEPARTME_CTRLDEPAR_TEACHER foreign key (teac_id)
      references teacher (teac_id)
go

alter table evaluation
   add constraint FK_EVALUATI_EVALUATIO_STUDENT foreign key (stu_id)
      references student (stu_id)
go

alter table evaluation
   add constraint FK_EVALUATI_EVALUATIO_TEACHER foreign key (teac_id)
      references teacher (teac_id)
go

alter table evaluation
   add constraint FK_EVALUATI_EVALUATIO_COURSE foreign key (course_id)
      references course (course_id)
go

alter table student
   add constraint FK_STUDENT_拥有_CLASS foreign key (class_id)
      references class (class_id)
go

alter table studentAbsent
   add constraint FK_STUDENTA_STUDENTAB_STUDENT foreign key (stu_id)
      references student (stu_id)
go

alter table studentAbsent
   add constraint FK_STUDENTA_STUDENTAB_COURSE foreign key (course_id)
      references course (course_id)
go

alter table studentAbsent
   add constraint FK_STUDENTA_STUDENTAB_TEACHER foreign key (teac_id)
      references teacher (teac_id)
go

alter table studentGrade
   add constraint FK_STUDENTG_STUDENTGR_STUDENT foreign key (stu_id)
      references student (stu_id)
go

alter table studentGrade
   add constraint FK_STUDENTG_STUDENTGR_COURSE foreign key (course_id)
      references course (course_id)
go

alter table teacAbsent
   add constraint FK_TEACABSE_TEACABSEN_COURSE foreign key (course_id)
      references course (course_id)
go

alter table teacAbsent
   add constraint FK_TEACABSE_TEACABSEN_CLASS foreign key (class_id)
      references class (class_id)
go

alter table teacAbsent
   add constraint FK_TEACABSE_TEACABSEN_TEACHER foreign key (teac_id)
      references teacher (teac_id)
go

alter table teacher
   add constraint FK_TEACHER_包含有2_DEPARTME foreign key (depar_id)
      references department (depar_id)
go


create procedure getAvgGradesByCourseId
@CourseId int
as
begin
select Avg(grade) as '成绩',studentGrade.selyear as '年度' ,studentGrade.selterm as '学期'
from studentGrade
where studentGrade.course_id=@CourseId
Group By course_id,selyear,selterm;
end
go


create procedure getNotQualByCourseId
@CourseId int
as
begin
select count(*) as '人数' ,selyear as '年度' ,selterm as '学期'
from studentGrade
where studentGrade.course_id=@CourseId
Group By course_id,selyear,selterm;
end
go


create procedure getStuCountByClassId
@classId varchar(6),
@classNum int output
as
begin
select @classNum=count(*) From Student Where class_id=@classId
end
go


create procedure getTeacCountByDeparId
@deparId varchar(2),
@teacNum int output
as
begin
select @teacNum=count(*) From Teacher Where depar_id=@deparId
end
go


create procedure tenPerAbsentStu 
As
begin
select
   top 10 percent
   teacher.teac_name,
   teacAbsent.teac_id,
   count(*) as '请假次数'
from
   teacher,
   teacAbsent
Where
    teacher.teac_id=teacAbsent.teac_id
Group By
    teacher.teac_name,
    teacAbsent.teac_id
Order By  count(*) desc
end
go


Create trigger updateAllStuId On student
instead of update
as
if update(stu_id)
        begin
        Alter Table evaluation drop constraint FK_EVALUATI_EVALUATIO_STUDENT;
        Alter Table stuShift drop constraint FK_STUSHIFT_HAVESHIFT_STUDENT;
        Alter Table stuFee drop constraint FK_STUFEE_STUFEE2_STUDENT;
        Alter Table studentAbsent drop constraint FK_STUDENTA_STUDENTAB_STUDENT;
        Alter Table studentGrade drop constraint FK_STUDENTG_STUDENTGR_STUDENT;
        Alter Table class drop constraint FK_CLASS_有班长_STUDENT;
		update student Set stu_id=(Select stu_id From inserted) 
        Where stu_id=(Select stu_id From deleted);
        update stuShift Set stu_id=(Select stu_id From inserted) 
        Where stu_id=(Select stu_id From deleted);
        update stuFee Set stu_id=(Select stu_id From inserted) 
        Where stu_id=(Select stu_id From deleted);
        Update Class Set stu_id=(Select stu_id From inserted)
        Where stu_id=(Select stu_id From deleted);
        Update evaluation Set stu_id=(Select stu_id From inserted)
        Where stu_id=(Select stu_id From deleted);
        Update StudentAbsent Set stu_id=(Select stu_id From inserted)
        Where stu_id=(Select stu_id From deleted);
        Update StudentGrade Set stu_id=(Select stu_id From inserted)
        Where stu_id=(Select stu_id From deleted);
        
        Alter Table evaluation add constraint FK_EVALUATI_EVALUATIO_STUDENT Foreign key(stu_id) References student(stu_id);
        Alter Table stuShift add constraint FK_STUSHIFT_HAVESHIFT_STUDENT Foreign key(stu_id) References student(stu_id);
        Alter Table stuFee add constraint FK_STUFEE_STUFEE2_STUDENT Foreign key(stu_id) References student(stu_id);
        Alter Table studentAbsent add constraint FK_STUDENTA_STUDENTAB_STUDENT Foreign key(stu_id) References student(stu_id);
        Alter Table studentGrade add constraint FK_STUDENTG_STUDENTGR_STUDENT Foreign key(stu_id) References student(stu_id);
        Alter Table class add constraint FK_CLASS_有班长_STUDENT Foreign key(stu_id) References student(stu_id);
        end
		if update(stu_name) update student set stu_name=(select stu_name From inserted Where stu_id=inserted.stu_id);
		if update(stu_sex) update student set stu_sex=(select stu_sex From inserted Where stu_id=inserted.stu_id);
		if update(birthday) update student set birthday=(select birthday From inserted Where stu_id=inserted.stu_id);
		if update(phone) update student set phone=(select phone From inserted Where stu_id=inserted.stu_id);
		if update(address) update student set address=(select address From inserted Where stu_id=inserted.stu_id);
go


Create trigger updateClassNum On student
For insert,delete
    As
        Begin
            update Class set class_num=(select count(*) From student where class_id=(select class_id From inserted)) where class_id=(select class_id From inserted);
         End;
go


Create trigger updateDeparStuNum On student
After insert,delete
    As
        Begin
            update Department set stu_num=(select count(*) From student where depar_id=(select depar_id From class Where class_id=(select class_id From inserted))) where depar_id=(select depar_id From class Where class_id=(select class_id From inserted));
         End;
go


Create trigger updateAllTeacId On teacher
instead of update
As
    Begin
        if update(teac_id)
        begin
        Alter Table teacAbsent drop constraint FK_TEACABSE_TEACABSEN_TEACHER;
        Alter Table class drop constraint FK_CLASS_担任_TEACHER;
        Alter Table evaluation drop constraint FK_EVALUATI_EVALUATIO_TEACHER;
        Alter Table StudentAbsent drop constraint FK_STUDENTA_STUDENTAB_TEACHER;
        Alter Table courseTeacher drop constraint FK_COURSETE_COURSETEA_TEACHER;
        update teacher set teac_id=(select teac_id From inserted)
        Where teac_id=(select  teac_id From deleted);
        update teacAbsent Set teac_id=(Select teac_id From inserted) 
        Where teac_id=(Select teac_id From deleted);
        Update class Set teac_id=(Select teac_id From inserted)
        Where teac_id=(Select teac_id From deleted);
        Update evaluation Set teac_id=(Select teac_id From inserted)
        Where teac_id=(Select teac_id From deleted);
        Update StudentAbsent Set teac_id=(Select teac_id From inserted)
        Where teac_id=(Select teac_id From deleted);
        Update courseTeacher Set teac_id=(Select teac_id From inserted)
		Where teac_id=(Select teac_id From deleted);
        
        Alter Table teacAbsent add constraint FK_TEACABSE_TEACABSEN_TEACHER Foreign key(teac_id) References teacher(teac_id);
        Alter Table class add constraint FK_CLASS_担任_TEACHER Foreign key(teac_id) References teacher(teac_id);
        Alter Table evaluation add constraint FK_EVALUATI_EVALUATIO_TEACHER Foreign key(teac_id) References teacher(teac_id);
        Alter Table StudentAbsent add constraint FK_STUDENTA_STUDENTAB_TEACHER Foreign key(teac_id) References teacher(teac_id);
        Alter Table courseTeacher add constraint FK_COURSETE_COURSETEA_TEACHER Foreign key(teac_id) References teacher(teac_id);
        end
         if update(teac_name)
		update teacher set teac_name=(select teac_name From inserted Where teac_id=teacher.teac_id);
	    if update(depar_id)
        update teacher set depar_id=(select depar_id From inserted Where teac_id=teacher.teac_id);
		if update(teac_sex)
        update teacher set teac_sex=(select teac_sex From inserted Where teac_id=teacher.teac_id);
		if update(birthday)
        update teacher set birthday=(select birthday From inserted Where teac_id=teacher.teac_id);
		if update(techpost)
        update teacher set techpost=(select techpost From inserted Where teac_id=teacher.teac_id);

    End;
go


Create trigger updateDeparTeacNum On Teacher
After insert,delete
    As
        Begin
            update Department set teac_num=(select count(*) From Teacher where depar_id=(select depar_id From inserted)) where depar_id=(select depar_id From inserted);
         End;
go

