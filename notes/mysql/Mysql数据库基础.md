# Mysql数据库基础

### 1 SQL语句

SQL 是**结构化查询语言 Structured Query Language** 的缩写，用来访问和操作数据库系统。SQL 语句既可以查询数据库中的数据，也可以添加、更新和删除数据库中的数据，还可以对数据库进行管理和维护操作。不同的数据库，都支持 SQL，这样，我们通过学习 SQL 这一种语言，就可以操作各种不同的数据库。

> SQL定义了这么几种操作数据库的能力：

- **DDL：Data Definition Language**

DDL允许用户定义数据，也就是创建表、删除表、修改表结构这些操作。通常，DDL由数据库管理员执行。

- **DML：Data Manipulation Language**

DML为用户提供添加、删除、更新数据的能力，这些是应用程序对数据库的日常操作。

- **DQL：Data Query Language**

DQL允许用户查询数据，这也是通常最频繁的数据库日常操作。

即：

- ***\*DDL-定义数据（增删表，修改表结构）\****
- ***\*DML-管理数据（增删改数据）\****
- ***\*DQL-查询数据\****

### 2 MySQL

MySQL是目前应用最广泛的开源关系数据库。 和其他关系数据库有所不同的是，MySQL本身实际上只是一个SQL接口，它的内部还包含了多种**数据引擎**，常用的包括：

- **InnoDB**：由Innobase Oy公司开发的一款支持事务的数据库引擎，2006年被Oracle收购；
- MyISAM：MySQL早期集成的默认数据库引擎，不支持事务。

1、安装MySQL

Debian和Ubuntu用户可以简单地通过命令 **apt-get install mysql-server** 安装最新的MySQL版本。

 2、运行MySQL

输入 **`mysql -u root -p`**，然后输入口令，如果一切正确，就会连接到MySQL服务器，同时提示符变为 `mysql>`。输入**`exit`**退出MySQL命令行。

1 关系模型

**关系数据库是建立在关系模型上的。而关系模型本质上就是若干个存储数据的二维表**，可以把它们看作很多Excel表。

**表的每一行称为记录（Record），记录是一个逻辑意义上的数据。**

**表的每一列称为字段（Column），同一个表的每一行记录都拥有相同的若干字段。**

字段定义了数据类型（整型、浮点型、字符串、日期等），以及是否允许为`NULL`。注意`NULL`表示字段数据不存在。一个整型字段如果为`NULL`不表示它的值为`0`，同样的，一个字符串型字段为`NULL`也不表示它的值为空串''。

和Excel表有所不同的是，**关系数据库的表和表之间需要建立“一对多”，“多对一”和“一对一”的关系，这样才能够按照应用程序的逻辑来组织和存储数据**。

在关系数据库中，关系是通过**主键**和**外键**来维护的。

 2 主键

在关系数据库中，一张表中的每一行数据被称为一条记录。一条记录就是由多个字段组成的。**对于关系表，有个很重要的约束，就是任意两条记录不能重复。**不能重复不是指两条记录不完全相同，而是指能够通过某个字段唯一区分出不同的记录，这个字段被称为**主键**。

**选取主键的一个基本原则**是：不使用任何业务相关的字段作为主键。

作为主键最好是完全业务无关的字段，我们一般把这个字段命名为**`id`**。常见的可作为**`id`字段**的类型有：

1. **自增整数类型**：数据库会在插入数据时自动为每一条记录分配一个自增整数，这样我们就完全不用担心主键重复，也不用自己预先生成主键；
2. **全局唯一GUID类型**：使用一种全局唯一的字符串作为主键，类似`8f55d96b-8acc-4636-8cb8-76bf8abc2f57`。GUID算法通过网卡MAC地址、时间戳和随机数保证任意计算机在任意时间生成的字符串都是不同的，大部分编程语言都内置了GUID算法，可以自己预算出主键。

对于大部分应用来说，通常自增类型的主键就能满足需求。

关系数据库实际上还允许通过多个字段唯一标识记录，即两个或更多的字段都设置为主键，这种主键被称为**联合主键**。没有必要的情况下，我们尽量不使用联合主键，因为它给关系表带来了复杂度的上升。

***\*小结：\****主键是关系表中记录的唯一标识。主键的选取非常重要：主键不要带有业务含义，而应该使用BIGINT自增或者GUID类型。主键也不应该允许`NULL`。可以使用多个列作为联合主键，但联合主键并不常用。

> 3 外键

 在`students`表中，通过`class_id`的字段，可以把数据与另一张表 classes 关联起来，这种列称为**外键**。外键并不是通过列名实现的，而是通过**定义外键约束**实现的。**由于外键约束会降低数据库的性能，大部分互联网应用程序为了追求速度，并不设置外键约束，而是仅靠应用程序自身来保证逻辑的正确性**。这种情况下，`class_id`仅仅是一个普通的列，只是它起到了外键的作用而已。

**通过一个表的外键关联到另一个表，我们可以定义出\**一对多\**关系。**有些时候，还需要定义“多对多”关系。例如，一个老师可以对应多个班级，一个班级也可以对应多个老师，因此，班级表和老师表存在多对多关系。**多对多关系实际上是通过两个一对多关系实现的，即通过一个中间表，关联两个一对多关系，就形成了多对多关系。**

**一对一关系****是指，一个表的记录对应到另一个表的唯一一个记录。**

**小结：**关系数据库通过外键可以实现一对多、多对多和一对一的关系。外键既可以通过数据库来约束，也可以不设置约束，仅依靠应用程序的逻辑来保证。

> 4 索引

**索引是关系数据库中对某一列或多个列的值进行预排序的数据结构。**通过使用索引，可以让数据库系统不必扫描整个表，而是直接定位到符合条件的记录，这样就大大加快了查询速度。

索引的效率取决于索引列的值是否散列，即该列的值如果越互不相同，那么索引效率越高。反过来，如果记录的列存在大量相同的值，例如`gender`列，大约一半的记录值是`M`，另一半是`F`，因此，对该列创建索引就没有意义。

可以对一张表创建多个索引。**索引的优点是提高了查询效率，缺点是在插入、更新和删除记录时，需要同时修改索引，因此，索引越多，插入、更新和删除记录的速度就越慢。**

**对于主键，关系数据库会自动对其创建主键索引。使用主键索引的效率是最高的，因为主键会保证绝对唯一。**

**唯一索引：**在设计关系数据表的时候，看上去唯一的列，例如身份证号、邮箱地址等，因为他们具有业务含义，因此不宜作为主键。但是，这些列根据业务要求，又具有唯一性约束：即不能出现两条记录存储了同一个身份证号。这个时候，就可以给该列添加一个唯一索引。

**小结：**

**通过对数据库表创建索引，可以提高查询速度。**

**通过创建唯一索引，可以保证某一列的值具有唯一性。**

**数据库索引对于用户和应用程序来说都是透明的。**

### 3 基本操作 

**关系数据库的基本操作就是增删改查，即CRUD：Create、Retrieve、Update、Delete。**

查询 

- **SELECT** 查询语句

- **INSERT**：插入新记录；
- **UPDATE**：更新已有记录；
- **DELETE**：删除已有记录。

1、事务

**把多条语句作为一个整体进行操作的功能，被称为数据库\**事务\**。**数据库事务可以确保该事务范围内的所有操作都可以全部成功或者全部失败。如果事务失败，那么效果就和没有执行这些SQL一样，不会对数据库数据有任何改动。

可见，数据库事务具有**ACID这4个特性**：

- A：**Atomic，原子性**，将所有SQL作为原子工作单元执行，要么全部执行，要么全部不执行；
- C：**Consistent，一致性**，事务完成后，所有数据的状态都是一致的，即A账户只要减去了100，B账户则必定加上了100；
- I：**Isolation，隔离性**，如果有多个事务并发执行，每个事务作出的修改必须与其他事务隔离；
- D：**Duration，持久性**，即事务完成后，对数据库数据的修改被持久化存储。

对于单条SQL语句，数据库系统自动将其作为一个事务执行，这种事务被称为**隐式事务**。

要手动把多条SQL语句作为一个事务执行，使用`BEGIN`开启一个事务，使用`COMMIT`提交一个事务，这种事务被称为**显式事务**。很显然多条SQL语句要想作为一个事务执行，就必须使用显式事务。

有些时候，我们希望主动让事务失败，这时，可以用`ROLLBACK`**回滚事务**，整个事务会失败。

**小结：**数据库事务具有ACID特性，用来保证多条SQL的全部执行。

2、隔离级别

对于两个并发执行的事务，如果涉及到操作同一条记录的时候，可能会发生问题。因为并发操作会带来**数据的不一致性**，包括**脏读、不可重复读、幻读**等。数据库系统提供了隔离级别来让我们有针对性地选择事务的**隔离级别**，避免数据不一致的问题。

**Read Uncommitted**是隔离级别最低的一种事务级别。在这种隔离级别下，一个事务会读到另一个事务更新后但未提交的数据，如果另一个事务回滚，那么当前事务读到的数据就是脏数据，这就是**脏读（Dirty Read）**。

在**Read Committed**隔离级别下，一个事务可能会遇到**不可重复读（Non Repeatable Read）**的问题。不可重复读是指，在一个事务内，多次读同一数据，在这个事务还没有结束时，如果另一个事务恰好修改了这个数据，那么，在第一个事务中，两次读取的数据就可能不一致。

在**Repeatable Read**隔离级别下，一个事务可能会遇到**幻读（Phantom Read）**的问题。幻读是指，在一个事务中，第一次查询某条记录，发现没有，但是，当试图更新这条不存在的记录时，竟然能成功，并且，再次读取同一条记录，它就神奇地出现了。

**Serializable**是最严格的隔离级别。在Serializable隔离级别下，所有事务按照次序依次执行，因此，脏读、不可重复读、幻读都不会出现。虽然Serializable隔离级别下的事务具有最高的安全性，但是，由于事务是**串行执行**，所以效率会大大下降，应用程序的性能会急剧降低。如果没有特别重要的情景，一般都不会使用Serializable隔离级别。

如果没有指定隔离级别，数据库就会使用**默认的隔离级别**。在MySQL中，如果使用InnoDB，默认的隔离级别是Repeatable Read。

###  4 连接数据库操作 

```sql
/*连接mysql*/
mysql -h 地址 -P 端口 -u 用户名 -p 密码
例如: mysql -h 127.0.0.1 -P 3306 -u root -p ****

/*退出mysql*/
exit;
```

### 5  **数据库操作** 

```sql
#数据库操作
/*关键字:create 创建数据库(增)*/
create database 数据库名 [数据库选项];
例如: create database test default charset utf8 collate utf8_bin;
/*数据库选项:字符集和校对规则*/
字符集:一般默认utf8;
校对规则常见: ⑴ci结尾的:不分区大小写 ⑵cs结尾的:区分大小写 ⑶bin结尾的：二进制编码进行比较

/*关键字:show 查看当前有哪些数据库(查)*/
show databases;

/*查看数据库的创建语句*/
show create database 数据库名;

/*关键字:alter 修改数据库的选项信息(改)*/
alter database 数据库名 [新的数据库选项];
例如: alter database test default charset gbk;

/*关键字:drop  删除数据库(删)*/
drop database 数据库名;

/*关键字:use 进入指定的数据库*/
use 数据库名;
```

### 6 **表的操作** 

```sql
#表的操作
/*关键字:create 创建数据表(增)*/
create table 表名(
字段1  字段1类型 [字段选项],
字段2  字段2类型 [字段选项],
字段n  字段n类型 [字段选项]
)表选项信息;

例如: create table test(
  id int(10) unsigned not null auto_increment comment 'id',
  content varchar(100) not null default '' comment '内容',
  time int(10) not null default 0 comment '时间',
  primary key (id)
)engine=InnoDB default charset=utf8 comment='测试表';

语法解析(下文MySQL列属性单独解析):
如果不想字段为NULL可以设置字段的属性为NOT NUL,在操作数据库时如果输入该字段的数据为NULL,就会报错.
AUTO_INCREMENT定义列为自增的属性,一般用于主键,数值会自动加1.
PRIMARY KEY关键字用于定义列为主键.可以使用多列来定义主键,列间以逗号分隔.
ENGINE 设置存储引擎,CHARSET 设置编码, comment 备注信息.
/*关键字:show 查询当前数据库下有哪些数据表(查)*/
show tables;

/*关键字:like 模糊查询*/
通配符：_可以代表任意的单个字符，%可以代表任意的字符
show tables like '模糊查询表名%';

/*查看表的创建语句*/
show create table 表名;

/*查看表的结构*/
desc 表名;

/*关键字:drop  删除数据表(删)*/
drop table [if exists] 表名
例如: drop table if exists test;

/*关键字:alter 修改表名(改)*/
alter table 旧表名 rename to 新表名;

/*修改列定义*/
/*关键字:add 增加一列*/
alter table 表名 add 新列名 字段类型 [字段选项];
例如: alter table test add name char(10) not null default '' comment '名字';

/*关键字:drop 删除一列*/
alter table 表名 drop 字段名;
例如: alter table test drop content;

/*关键字:modify 修改字段类型*/
alter table 表名 modify 字段名 新的字段类型 [新的字段选项];
例如: alter table test modify name varchar(100) not null default 'admin' comment '修改后名字';

/*关键字:first 修改字段排序,把某个字段放在最前面*/
alter table 表名 modify 字段名 字段类型 [字段选项] first;
例如: alter table test modify name varchar(100) not null default 'admin' comment '最前面' first;


/*关键字:after 修改字段排序,字段名1放在字段名2的后面*/
alter table 表名 modify 字段名1 字段类型 [字段选项] after 字段名2;
例如: alter table test modify name varchar(100) not null default 'admin' comment 'time字段后面' after time;

/*关键字:change 重命名字段*/
alter table 表名 change 原字段名 新字段名 新的字段类型 [新的字段选项];
例如: alter table test change name username varchar(50) not null default '' comment '用户名字';

/*修改表选项*/ 
alter table 表名 表选项信息;
例如: alter table test engine Myisam default charset gbk; --修改存储引擎和修改表的字符集
```

### 7 数据操作 

```sql
#数据操作
/*关键字:insert 插入数据(增)*/
insert into 表名(字段列表) values(值列表);
例如: create table user(
  id int(10) unsigned not null auto_increment comment 'id',
  name char(10) not null default '' comment '名字',
  age int(3) not null default 0 comment '年龄',
  primary key (id)
)engine=InnoDB default charset=utf8 comment='用户表';
--插入数据
insert into user(id,name,age) values(1,'admin_a',50);
insert into user(name) values('admin_b');

/*关键字:select 查询数据(查)*/
select *[字段列表] from 表名[查询条件];
例如: select * from user;--查全部字段用*代替

select name from user where age>0;--查name字段,age大于0

/*关键字:delete 删除数据(删)*/
delete from 表名[删除条件];
例如: delete from user where age<1;--删除age小于1数据

/*关键字:update 修改数据(改)*/
update 表名 set 字段1=新值1,字段n=新值n [修改条件];
例如: update user set age=100 where name='admin_a';

```

### 8 MySQL数据类型

```sql
#MySQL数据类型
/*MySQL三大数据类型:数值型、字符串型和日期时间型*/
```

![](C:\Users\CM\Desktop\Typora\mysql图片\mysql数据类型.png)

### 9 MySQL列属性

```sql
#MySQL列属性
/*null、not null、default、primary key、auto_increment、comment*/
MySQL真正约束字段的是数据类型,但是数据类型的约束太单一,需要有一些额外的约束,来更加保证数据的合法性.
MySQL常用列属性有：null、not null、default、primary key、auto_increment、comment.

/*空属性: null和not null*/
空属性: null(空,默认) 和 not null(不为空). mysql数据库默认字段都是为null的,实际开发过程中尽可能保证所有的数据都不应该为null,空数据没有意义.
例如: create table test(
    a int not null,
    b int
);
insert into test (a,b) values(10,null);
insert into test (a,b) values(null,10);--报错

/*默认值: default*/
default: 自定义默认值属性,通常配合not null一起使用.
例如: create table test1(
    a int not null default 200,
    b int
);
insert into test1(b) values(20);--或 insert into test1(a,b) values(default,20);

/*主键|唯一索引*/
Mysql中提供了多种索引? (下文索引更多解析)
1.主键索引:primary key
2.唯一索引:unique key
3.全文索引:fulltext index
4.普通索引:key 或 index

主键:primary key  一张表中只能有一个字段可以使用对应的主键,用来唯一的约束该字段里面的数据,不能重复和不能为null.
设置主键有两种方式：
(1)在定义一个字段的时候直接在后面进行设置primary key
例如: create table test2(
  id int(10) unsigned not null primary key,
  name char(20) not null default ''
);

(2)定义完字段后再定义主键
例如: create table test3(
  id int(10) unsigned not null,
  name char(20) not null default '',
  primary key (id)
);

唯一键:unique key 解决表中多个字段需要唯一性约束的问题.
例如:create table test4(
  id int(10) unsigned not null,
  name char(20) not null default '',
  goods varchar(100) not null default '',
  primary key (id),
  unique key (name,goods)
);

/*自动增长: auto_increment*/
自增长属性:每次插入记录的时候,自动的为某个字段的值加1(基于上一个记录). 通常跟主键搭配.
自增长规则：(1)任何一个字段要做自增长前提必须是一个索引  (2)自增长字段必须是整型数字
例如: create table test5(
  id int(10) unsigned not null auto_increment,
  name char(20) not null default '',
  primary key (id)
);

/*列描述 comment*/
列描述(注释):comment 与其他的注释符不同之处在于,这里的注释内容属于列定义的一部分.
例如:create table user(
  id int(10) unsigned not null auto_increment comment 'id',
  name char(20) not null default '' comment '名字',
  primary key (id)
)engine=InnoDB default charset=utf8 comment='用户表';


```



```sql
SELECT * FROM itpux_m1 WHERE AGE=20;
SELECT * FROM itpux_m1 WHERE AGE!=20;
SELECT * FROM itpux_m1 WHERE AGE<20;
SELECT * FROM itpux_m1 WHERE AGE>20;
SELECT * FROM itpux_m1 WHERE AGE<=20;
SELECT * FROM itpux_m1 WHERE AGE>=20;
SELECT 1 = 10, NULL <=> NULL;
SELECT * FROM itpux_m1 WHERE AGE BETWEEN 10 AND 20;
SELECT * FROM itpux_m1 WHERE AGE NOT BETWEEN 10 AND 20;
SELECT * FROM itpux_m1 WHERE AGE>=10 AND AGE<=20;
SELECT * FROM itpux_m1 WHERE AGE>=10 && AGE<=20;
SELECT * FROM itpux_m1 WHERE AGE IN(18,22,28);
SELECT * FROM itpux_m1 WHERE AGE NOT IN(18,22,28);
-- 模糊查询
SELECT * FROM itpux_m1 WHERE `NAME` LIKE 'itpux%';
SELECT * FROM itpux_m1 WHERE EMAIL LIKE '222%';
-- 组合查询
SELECT * FROM itpux_m1 WHERE AGE = 22 AND SEX = '男';
SELECT * FROM itpux_m1 WHERE TEL IS NULL;
SELECT * FROM itpux_m1 WHERE TEL IS NOT NULL;
SELECT * FROM itpux_m1 WHERE REGION LIKE '湖北省%';
-- 查询分组与排序
SELECT * FROM itpux_sales;
SELECT GOODS,COUNT(*) FROM itpux_sales GROUP BY GOODS;
SELECT GOODS,COUNT(*) FROM itpux_sales GROUP BY 1 ORDER BY 2 DESC;
SELECT GOODS,COUNT(*) FROM itpux_sales GROUP BY 1 ORDER BY 2 DESC LIMIT 1;

-- 计算本月发了多少工资
SELECT SUM(SALARY) FROM yg;

-- 组合字段分组
SELECT * FROM itpux_yg;
SELECT REGION,DEPT,SUM(SALARY) FROM itpux_yg GROUP BY REGION,DEPT;
SELECT REGION,SUM(SALARY) FROM itpux_yg GROUP BY REGION;

SELECT REGION,SUM(SALARY) FROM itpux_yg GROUP BY REGION ORDER BY 2;
SELECT REGION,SUM(SALARY) FROM itpux_yg GROUP BY REGION ORDER BY 2 DESC;

SELECT REGION,SUM(SALARY) FROM itpux_yg WHERE SALARY>10000 GROUP BY REGION ORDER BY 2 DESC;


-- with rollup 利用组合条件进行统计后，再次统计。
SELECT REGION,DEPT,SUM(SALARY) FROM itpux_yg GROUP BY REGION,DEPT WITH ROLLUP;

-- order by 多列排列
SELECT * FROM itpux_yg ORDER BY REGION,AGE;
SELECT * FROM itpux_yg ORDER BY JOBID,AGE;

-- limit 限制返回行数
SELECT * FROM yg;
SELECT * FROM yg LIMIT 5;
SELECT * FROM yg LIMIT 2,4;

-- disitinct 去除重复记录
SELECT SEX FROM itpux_yg;
SELECT DISTINCT SEX FROM itpux_yg;

-- all 
SELECT SEX FROM itpux_yg;
SELECT ALL SEX FROM itpux_yg;

-- union 无重并集：把多个结果组合去重
SELECT `NAME` FROM itpux_yg UNION SELECT `NAME` FROM itpux_m1;

-- union all 有重并集：把多个结果组合不去重，不排序。
SELECT `NAME` FROM itpux_yg UNION ALL SELECT `NAME` FROM itpux_m1;

-- update 锁表
SELECT * FROM itpux_yg FOR UPDATE;
```

```
select itpux_yg.REGION,itpux_yg.SEX,COUNT(*),SUM(SALARY)
       from itpux_yg inner join itpux_m1 
			 on itpux_yg.AGE = itpux_m1.AGE AND itpux_yg.SEX = itpux_m1.SEX AND itpux_yg.REGION = itpux_m1.REGION  
	 GROUP BY REGION,SEX;
```

```sql
-- 表的复制
CREATE TABLE aa AS SELECT * FROM untitled WHERE 1=1;
-- 普通的插入数据
INSERT INTO aa (id,aa) VALUES ('01','11');
INSERT INTO aa VALUES ('01','11');
-- 螨虫复制
INSERT INTO aa SELECT * FROM untitled;
INSERT INTO aa (id,aa) SELECT id,aa FROM untitled;
-- 建表复制
CREATE TABLE aa AS SELECT id,aa FROM untitled;
-- 批量插入数据
INSERT INTO aa (id,aa) VALUES ('16','12'),('14','12'),('15','12');
-- 显示字符集
SHOW VARIABLES LIKE 'CHARACTER%';
-- 修改表名
RENAME TABLE aa to test;
-- 添加列
ALTER TABLE test add name VARCHAR(10);
-- 修改列类型
ALTER TABLE test MODIFY age INT(8);
-- 修改列名
ALTER TABLE test CHANGE aa age int(6);
-- 修改字符类
ALTER TABLE test CHARACTER SET utf8;
DESC test;

 
/*创建部门表*/
CREATE TABLE dept(
 deptnu INT PRIMARY KEY COMMENT '部门编号',
 dname VARCHAR(50) COMMENT '部门名称',
 addr VARCHAR(50) COMMENT '部门地址'
) DEFAULT CHARSET=utf8;

INSERT INTO dept VALUES (10, '研发部', '北京');
INSERT INTO dept VALUES (20, '工程部', '上海');
INSERT INTO dept VALUES (30, '销售部', '广州');
INSERT INTO dept VALUES (40, '财务部', '深圳');

-- 某个公司的员工表
CREATE TABLE employee(
 empno int PRIMARY KEY COMMENT '雇员编号',
 ename VARCHAR(50) COMMENT '雇员编号',
 job VARCHAR(50) COMMENT '雇员职位',
 mgr INT comment '雇员上级编号',
 hiredate DATE comment '雇佣日期',
 sal DECIMAL(7,2) comment '薪资',
 deptnu INT comment '部门编号'
);

/*创建工资等级表*/
CREATE TABLE salgrade(
 grade INT PRIMARY KEY comment '等级',
 lowsal INT comment '最低薪资',
 higsal INT comment '最高薪资'
);

/*插入emp表数据*/
INSERT INTO employee VALUES (1009, '唐僧', '董事长', NULL, '2010-11-17', 50000, 10);
INSERT INTO employee VALUES (1004, '猪八戒', '经理', 1009, '2001-04-02', 29750, 20);
INSERT INTO employee VALUES (1006, '猴子', '经理', 1009, '2011-05-01', 28500, 30);
INSERT INTO employee VALUES (1007, '张飞', '经理', 1009, '2011-09-01', 24500,10);
INSERT INTO employee VALUES (1008, '诸葛亮', '分析师', 1004, '2017-04-19', 30000, 20);
INSERT INTO employee VALUES (1013, '林俊杰', '分析师', 1004, '2011-12-03', 30000, 20);
INSERT INTO employee VALUES (1002, '牛魔王', '销售员', 1006, '2018-02-20', 16000, 30);
INSERT INTO employee VALUES (1003, '程咬金', '销售员', 1006, '2017-02-22', 12500, 30);
INSERT INTO employee VALUES (1005, '后裔', '销售员', 1006, '2011-09-28', 12500, 30);
INSERT INTO employee VALUES (1010, '韩信', '销售员', 1006, '2018-09-08', 15000,30);
INSERT INTO employee VALUES (1012, '安琪拉', '文员', 1006, '2011-12-03', 9500, 30);
INSERT INTO employee VALUES (1014, '甄姬', '文员', 1007, '2019-01-23', 7500, 10);
INSERT INTO employee VALUES (1011, '妲己', '文员', 1008, '2018-05-23', 11000, 20);
INSERT INTO employee VALUES (1001, '小乔', '文员', 1013, '2018-12-17', 8000, 20);

/*插入salgrade表数据*/
INSERT INTO salgrade VALUES (1, 7000, 12000);
INSERT INTO salgrade VALUES (2, 12010, 14000);
INSERT INTO salgrade VALUES (3, 14010, 20000);
INSERT INTO salgrade VALUES (4, 20010, 30000);
INSERT INTO salgrade VALUES (5, 30010, 99990);

SELECT * FROM dept;
SHOW VARIABLES LIKE 'CHARACTER%';
alter database aaa default charset utf8;
```

```sql

```

