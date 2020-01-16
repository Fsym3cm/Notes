#  Mybatis

###  一. Mybatis环境搭建 



##### 1.1 案例步骤

1.  首先建立项目java web 
2.  导入mybatis所需的jar包 
3.  创建数据库数据（mysql） 
4.  mysql驱动配置文件 
5.  添加mybatis配置文件mybatis.cfg.xml 
6.  创建对应的实体对象 
7.  创建方法接口UserMapper.java和定义操作t_user表的sql映射文件UserMapper.xml` 
8.  做测试





#####  1.2 maven项目导入依赖

```xml

<!--https://mvnrepository.com/artifact/org.mybatis -->
<dependency>
  <groupId>org.mybatis</groupId>
  <artifactId>mybatis</artifactId>
  <version>x.x.x</version>
</dependency>
```



#####  1.3 添加mybatis配置文件mybatis.cfg.xml 

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>;

<!-- 引入外部配置文件 -->
  <properties resource="mysql.properties"></properties>
   
  <environments default="development">   <!-- mysql -->
    <environment id="development">
     <!-- type="JDBC" 代表使用JDBC的提交和回滚来管理事务 -->
      <transactionManager type="JDBC"/>
      <dataSource type="POOLED">
        <property name="driver" value="${driver}"/>
        <property name="url" value="${url}"/>
        <property name="username" value="${username}"/>
        <property name="password" value="${password}"/>
      </dataSource>
    </environment>
  </environments>
  <!-- 配置映射文件 -->
  <mappers>
    <mapper resource="org/mybatis/example/BlogMapper.xml"/>
  </mappers>
</configuration>
```



##### 1.4  创建对应的实体对象 

##### ![](C:\Users\qwer\Desktop\Typora\typora img\Mybatis-1.png)

```java

import java.io.Serializable;

  public class UserBean implements Serializable{
  
      private static final long serialVersionUID = 1L;
     private Integer id;
     private String username;
     private String password;
     private Double account;
     
     public UserBean() {
         super();
     }
    
    public UserBean(String username, String password, Double account) {
         super();
         this.username = username;
         this.password = password;
         this.account = account;
     }
 
     public UserBean(Integer id, String username, String password, Double account) {
         super();
        this.id = id;
         this.username = username;
         this.password = password;
         this.account = account;
    }
 
     public Integer getId() {
         return id;
     }
 
    public void setId(Integer id) {
         this.id = id;
     }
 
     public String getUsername() {
         return username;
     }

     public void setUsername(String username) {
         this.username = username;
     }
 
    public String getPassword() {
        return password;
     }
 
     public void setPassword(String password) {
         this.password = password;
     }
 
     public Double getAccount() {
         return account;
     }
 
     public void setAccount(Double account) {
        this.account = account;
     }

     @Override
     public String toString() {
         return "UserBean [id=" + id + ", username=" + username + ", password="
                + password + ", account=" + account + "]";
 }    
}

```



##### 1.5.1 创建方法接口UserMapper.java和定义操作t_user表的sql映射文件UserMapper.xml 

![](C:\Users\qwer\Desktop\Typora\typora img\Mybatis-2.png)

```java
import java.util.List;

import com.cy.mybatis.beans.UserBean;

public interface UserMapper {
    /**
     * 新增用戶
     * @param user
     * @return
     * @throws Exception
     */
    public int insertUser(UserBean user) throws Exception;
    /**
     * 修改用戶
     * @param user
     * @param id
     * @return
     * @throws Exception
     */
    public int updateUser (UserBean user,int id) throws Exception;
     /**
      * 刪除用戶
      * @param id
      * @return
      * @throws Exception
      */
    public int deleteUser(int id) throws Exception;
    /**
     * 根据id查询用户信息
     * @param id
     * @return
     * @throws Exception
     */
    public UserBean selectUserById(int id) throws Exception;
     /**
      * 查询所有的用户信息
      * @return
      * @throws Exception
      */
    public List<UserBean> selectAllUser() throws Exception;
}
```



##### 1.5.2 定义操作t_user表的sql映射文件UserMapper.xml 

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org/DTD Mapper 3.0" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.cy.mybatis.mapper.UserMapper">
<!-- 自定义返回结果集 -->
   <resultMap id="userMap" type="UserBean">
        <id property="id" column="id" javaType="java.lang.Integer"></id>
        <result property="username" column="username" javaType="java.lang.String"></result>
        <result property="password" column="password" javaType="java.lang.String"></result>
        <result property="account" column="account" javaType="java.lang.Double"></result>
    </resultMap>
<!-- 在各种标签中的id属性必须和接口中的方法名相同 ， id属性值必须是唯一的，不能够重复使用。parameterType属性指明查询时使用的参数类型，resultType属性指明查询返回的结果集类型-->    
<!-- useGeneratedKeys：（ 仅 对 insert 有 用 ） 这 会 告 诉 MyBatis 使 用 JDBC 的getGeneratedKeys 
            方法来取出由数据（比如：像 MySQL 和 SQLServer 这样的数据库管理系统的自动递增字段）内部生成的主键。默认值： false。 -->    
<!--keyProperty： （仅对 insert有用）标记一个属性， MyBatis 会通过 getGeneratedKeys或者通过 insert 语句的 selectKey 子元素设置它的值。默认：不设置。 -->
<!--#{}中的内容，为占位符，当参数为某个JavaBean时，表示放置该Bean对象的属性值  -->


    <insert id="insertUser" useGeneratedKeys="true" keyProperty="id">
        insert into t_user (username,password,account) values (#{username},#{password},#{account})
    </insert>
    
    <update id="updateUser" >
      update t_user set username=#{username},password=#{password},account=#{account} where id=#{id}
    </update>
    
    <delete id="deleteUser" parameterType="int">
     delete from t_user where id=#{id}  
    </delete>
    
    <select id="selectUserById" parameterType="int" resultMap="userMap">
     select * from t_user where id=#{id}
    </select>
    
    <select id="selectAllUser" resultMap="userMap">
     select * from t_user
    </select>
    
    
</mapper>
```

 这时需要为mybatis.cfg.xml里注册UserMapper.xml文件。 

```xml
<mappers>
        <!-- 告知映射文件方式1，一个一个的配置
        <mapper resource="com/cy/mybatis/mapper/UserMapper.xml"/>-->
        <!-- 告知映射文件方式2，自动扫描包内的Mapper接口与配置文件 -->
        <package name="com/cy/mybatis/mapper"/>
    </mappers>
```



##### 1.5.3 Sql注入：

通过客户端传入参数的方式，将sql语句注入程序中，这样的情况就叫sql注入

$   先把传过来的参数与SQL语句进行拼接，  形成新的sql语句直接执行整个sql语句，  存在sql注入风险

占位符   先把写好的sql语句进行预编译，再将参数设置进来。自动检查参数中是否包含sql语句，如果包含就执行失败， 避免了sql语句注入

建议全部使用#{}占位符的方式.

```xml

<select id = "selectUserById" parameterType="int" resultType="com.hd.pojo.User">
        SELECT * FROM t_user WHERE id = #{id}
</select>
```



##### 1.6 测试

![](C:\Users\qwer\Desktop\Typora\typora img\Mybatis-3.png)

```java
package com.cy.mybatis.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.cy.mybatis.beans.UserBean;
import com.cy.mybatis.tools.DBTools;
import com.cy.mybatis.mapper.UserMapper;

public class UserService {

   
15      
    public static void main(String[] args) {
          insertUser();
//        deleteUser();
//        selectUserById();
//        selectAllUser();
    }

    
    /**
     * 新增用户
     */
    private static void insertUser() {
        SqlSession session = DBTools.getSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        UserBean user = new UserBean("懿", "1314520", 7000.0);
        try {
            mapper.insertUser(user);
            System.out.println(user.toString());
             session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.rollback();
        }
    }
    
    
    /**
     * 删除用户
     */
    private static void deleteUser(){
        SqlSession session=DBTools.getSession();
        UserMapper mapper=session.getMapper(UserMapper.class);
        try {
            mapper.deleteUser(1);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.rollback();
        }
    }
    
    
    /**
     * 根据id查询用户
     */
    private static void selectUserById(){
        SqlSession session=DBTools.getSession();
        UserMapper mapper=session.getMapper(UserMapper.class);
        try {
        UserBean user=    mapper.selectUserById(2);
        System.out.println(user.toString());
            
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.rollback();
        }
    }
    
    /**
     * 查询所有的用户
     */
    private static void selectAllUser(){
        SqlSession session=DBTools.getSession();
        UserMapper mapper=session.getMapper(UserMapper.class);
        try {
        List<UserBean> user=mapper.selectAllUser();
        System.out.println(user.toString());
        session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.rollback();
        }
    }
    

}
```

##### 1.7 注意事项

1.接口的名字建议和映射文件的名字保持一致

   Namespace 必须和接口的相对路径名保持一致

2.在配置文件中的resultType必须和接口中的方法名的返回值类型保持一致

3.配置文件中的参数类型，必须和接口中的参数的类型保持一致

4.配置文件中的id必须和接口中的方法名保持一致

### 二.动态sql

##### 2.1 if标签 

```java
<if test="id != '' and id != null">
    and id = #{id}
</if>
```

```java
<!-- 定义sql片段
id：sql片段的唯 一标识

经验：是基于单表来定义sql片段，这样话这个sql片段可重用性才高
在sql片段中不要包括 where
 -->
<sql id="query_user_where">
    <if test="userCustom!=null">
        <if test="userCustom.sex!=null and userCustom.sex!=''">
            AND user.sex = #{userCustom.sex}
        </if>
        <if test="userCustom.username!=null and userCustom.username!=''">
            AND user.username LIKE '%${userCustom.username}%'
        </if>
    </if>
</sql>

```

```java
<!-- 用户信息综合查询
    #{userCustom.sex}:取出pojo包装对象中性别值
    ${userCustom.username}：取出pojo包装对象中用户名称
 -->
<select id="findUserList" parameterType="com.iot.mybatis.po.UserQueryVo"
        resultType="com.iot.mybatis.po.UserCustom">
    SELECT * FROM user
    <!--  where 可以自动去掉条件中的第一个and -->
    <where>
        <!-- 引用sql片段 的id，如果refid指定的id不在本mapper文件中，需要前边加namespace -->
        <include refid="query_user_where"></include>
        <!-- 在这里还要引用其它的sql片段  -->
    </where>
</select>
```



Test 使用ognl表达式的发方法取值  可以if条件

并且 and

或者 or

如果有多个条件，不知道是第一个成立and的位置不好放，就在任何一个位置都可能会出异常，使用where标签解决

##### 2.2 Where标签

能够自动去除  前and

如果所有的条件都不成立，那么where关键字自动去除

##### 2.3 Foreach 标签 

```java
<foreach collection="array" open="(" close=")" separator="," item="id">
   #{id}
</foreach>
```

##### 2.4 级联

##### 2.4.1 一对一

```java
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="com.dao.classMapper">

    <!-- 
		假设老师与班级之间的关系为一对一的关系
        根据班级id查询班级信息(带老师的信息)
        SELECT * FROM class c,teacher t WHERE c.teacher_id=t.t_id AND c.c_id=1;
    -->
    <select id="getClass" parameterType="int" resultMap="ClassResultMap">
        select * from class c, teacher t where c.teacher_id=t.t_id and c.c_id=#{id}
    </select>
    <!-- 使用resultMap映射实体类和字段之间的一一对应关系 -->
    <resultMap type="me.gacl.domain.Classes" id="ClassResultMap">
        <id property="id" column="c_id"/>
        <result property="name" column="c_name"/>
        <association property="teacher" javaType="me.gacl.domain.Teacher">
            <id property="id" column="t_id"/>
            <result property="name" column="t_name"/>
        </association>
    </resultMap>
    
    <!-- 
    方式二：嵌套查询：通过执行另外一个SQL映射语句来返回预期的复杂类型
        SELECT * FROM class WHERE c_id=1;
        SELECT * FROM teacher WHERE t_id=1   //1 是上一个查询得到的teacher_id的值
    -->
     <select id="getClass2" parameterType="int" resultMap="ClassResultMap2">
        select * from class where c_id=#{id}
     </select>
     <!-- 使用resultMap映射实体类和字段之间的一一对应关系 -->
     <resultMap type="me.gacl.domain.Classes" id="ClassResultMap2">
        <id property="id" column="c_id"/>
        <result property="name" column="c_name"/>
        <association property="teacher" column="teacher_id" select="getTeacher"/>
     </resultMap>
     
     <select id="getTeacher" parameterType="int" resultType="me.gacl.domain.Teacher">
        SELECT t_id id, t_name name FROM teacher WHERE t_id=#{id}
     </select>

</mapper>

```

##### 2.4.2 一对多

 mybatis使用resultMap的collection对关联查询的多条记录映射到一个list集合属性中。 

```java
<!-- 
        根据classId查询对应的班级信息,包括学生,老师,班级与老师为一对一，班级与学生为一对多
     -->
    <!-- 
    方式一: 嵌套结果: 使用嵌套结果映射来处理重复的联合结果的子集
    SELECT * FROM class c, teacher t,student s WHERE c.teacher_id=t.t_id AND c.C_id=s.class_id AND  c.c_id=1
     -->
    <select id="getClass3" parameterType="int" resultMap="ClassResultMap3">
        select * from class c, teacher t,student s where c.teacher_id=t.t_id and c.C_id=s.class_id and  c.c_id=#{id}
    </select>
    <resultMap type="me.gacl.domain.Classes" id="ClassResultMap3">
        <id property="id" column="c_id"/>
        <result property="name" column="c_name"/>
        <association property="teacher" column="teacher_id" javaType="me.gacl.domain.Teacher">
            <id property="id" column="t_id"/>
            <result property="name" column="t_name"/>
        </association>
        <!-- ofType指定students集合中的对象类型 -->
        <collection property="students" ofType="me.gacl.domain.Student">
            <id property="id" column="s_id"/>
            <result property="name" column="s_name"/>
        </collection>
    </resultMap>
    
    <!-- 
        方式二：嵌套查询：通过执行另外一个SQL映射语句来返回预期的复杂类型
            SELECT * FROM class WHERE c_id=1;
            SELECT * FROM teacher WHERE t_id=1   //1 是上一个查询得到的teacher_id的值
            SELECT * FROM student WHERE class_id=1  //1是第一个查询得到的c_id字段的值
     -->
     <select id="getClass4" parameterType="int" resultMap="ClassResultMap4">
        select * from class where c_id=#{id}
     </select>
     <resultMap type="me.gacl.domain.Classes" id="ClassResultMap4">
        <id property="id" column="c_id"/>
        <result property="name" column="c_name"/>
        <association property="teacher" column="teacher_id" javaType="me.gacl.domain.Teacher" select="getTeacher2"></association>
        <collection property="students" ofType="me.gacl.domain.Student" column="c_id" select="getStudent"></collection>
     </resultMap>
     
     <select id="getTeacher2" parameterType="int" resultType="me.gacl.domain.Teacher">
        SELECT t_id id, t_name name FROM teacher WHERE t_id=#{id}
     </select>
     
     <select id="getStudent" parameterType="int" resultType="me.gacl.domain.Student">
        SELECT s_id id, s_name name FROM student WHERE class_id=#{id}
     </select>

```

##### 2.4.3 多对多

```java
<!-- 查询用户及购买的商品 -->
<resultMap type="com.iot.mybatis.po.User" id="UserAndItemsResultMap">
    <!-- 用户信息 -->
    <id column="user_id" property="id"/>
    <result column="username" property="username"/>
    <result column="sex" property="sex"/>
    <result column="address" property="address"/>

    <!-- 订单信息
    一个用户对应多个订单，使用collection映射
     -->
    <collection property="ordersList" ofType="com.iot.mybatis.po.Orders">
        <id column="id" property="id"/>
        <result column="user_id" property="userId"/>
        <result column="number" property="number"/>
        <result column="createtime" property="createtime"/>
        <result column="note" property="note"/>

        <!-- 订单明细
         一个订单包括 多个明细
         -->
        <collection property="orderdetails" ofType="com.iot.mybatis.po.Orderdetail">
            <id column="orderdetail_id" property="id"/>
            <result column="items_id" property="itemsId"/>
            <result column="items_num" property="itemsNum"/>
            <result column="orders_id" property="ordersId"/>

            <!-- 商品信息
             一个订单明细对应一个商品
             -->
            <association property="items" javaType="com.iot.mybatis.po.Items">
                <id column="items_id" property="id"/>
                <result column="items_name" property="name"/>
                <result column="items_detail" property="detail"/>
                <result column="items_price" property="price"/>
            </association>

        </collection>

    </collection>
</resultMap>

```



### 三.Mybaits 初始化流程

##### 3.1初始化流程

- 调用SqlSessionFactoryBuilder对象的build(inputStream)方法；
- SqlSessionFactoryBuilder会根据输入流inputStream等信息创建XMLConfigBuilder对象;
- SqlSessionFactoryBuilder调用XMLConfigBuilder对象的parse()方法；
- XMLConfigBuilder对象返回Configuration对象；
- SqlSessionFactoryBuilder根据Configuration对象创建一个DefaultSessionFactory对象；
- SqlSessionFactoryBuilder返回 DefaultSessionFactory对象给Client，供Client使用。
  

```java
@Before
	public void setUp() throws Exception {
		// 创建sqlSessionFactory

		// mybatis配置文件
		String resource = "SqlMapConfig.xml";
		// 得到配置文件流
		InputStream inputStream = Resources.getResourceAsStream(resource);

		// 创建会话工厂，传入mybatis的配置文件信息
		sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(inputStream);
	}

```

### 四. spring和mybatis整合

##### 4.1整合思路

- 需要spring通过单例方式管理`SqlSessionFactory`。
- spring和mybatis整合生成代理对象，使用`SqlSessionFactory`创建`SqlSession`。（spring和mybatis整合自动完成）
- 持久层的mapper都需要由spring进行管理。