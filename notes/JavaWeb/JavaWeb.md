# JavaWeb

### 一. JavaWeb开发入门

##### 1.1  Web开发的相关知识

WEB，在英语中web即表示网页的意思，它用于表示Internet主机上供外界访问的资源。
　　Internet上供外界访问的Web资源分为：

1. **静态web资源（如html 页面）：指web页面中供人们浏览的数据始终是不变。**
2. **动态web资源：指web页面中供人们浏览的数据是由程序产生的，不同时间点访问web页面看到的内容各不相同**。

　　静态web资源开发技术：Html
　　常用动态web资源开发技术：JSP/Servlet、ASP、PHP等
　　在Java中，动态web资源开发技术统称为Javaweb。

##### 1.2  Web应用程序

 WEB应用程序指供浏览器访问的程序，通常也简称为web应用。例如有a.html 、b.html…..多个web资源，这多个web资源用于对外提供服务，此时应把这多个web资源放在一个目录中，以组成一个web应用（或web应用程序）
　　一个web应用由多个静态web资源和动态web资源组成，如:html、css、js文件，Jsp文件、java程序、支持jar包、配置文件等等。
　　**Web应用开发好后，若想供外界访问，需要把web应用所在目录交给web服务器管理，这个过程称之为虚似目录的映射** 

##### 1.3  静态Web

 *htm、*html，这些是网页的后缀，如果现在在一个服务器上直接读取这些内容，那么意味着是把这些网页的内容通过网络服务器展现给用户。 

​       在静态WEB程序中，客户端使用WEB浏览器（IE、FireFox等）经过网络(Network)连接到服务器上，使用HTTP协议发起一个请求（Request），告诉服务器我现在需要得到哪个页面，所有的请求交给WEB服务器，之后WEB服务器根据用户的需要，从文件系统（存放了所有静态页面的磁盘）取出内容。之后通过WEB服务器返回给客户端，客户端接收到内容之后经过浏览器渲染解析，得到显示的效果。

　　**静态WEB中存在以下几个缺点：**

　　**1、Web页面中的内容无法动态更新，所有的用户每时每刻看见的内容和最终效果都是一样的。**

　　为了可以让静态的WEB的显示更加好看，可以加入了JavaScript以完成一些页面上的显示特效，但是这些特效都是在客户端上借助于浏览器展现给用户的，所以在服务器上本身并没有任何的变化。

　　实现静态WEB客户端动态效果的手段：

-  JavaScript
-  VBScript

　　在实际的开发中JavaScript使用得最多。

​        **2、静态WEB无法连接数据库，无法实现和用户的交互。**

　　使用数据库保存数据是现在大多数系统的选择，因为数据库中可以方便地管理数据，增删改查操作可以使用标准的SQL语句完成。

##### 1.4  动态Web

 所谓的动态不是指页面会动，主要的特性的是：“WEB的页面展示效果因时因人而变”，而且动态WEB具有交互性，WEB的页面的内容可以动态更新。 

动态WEB中，程序依然使用客户端和服务端，客户端依然使用浏览器（IE、FireFox等），通过网络(Network)连接到服务器上，使用HTTP协议发起请求（Request），现在的所有请求都先经过一个WEB Server Plugin（服务器插件）来处理，此插件用于区分是请求的是静态资源(*.htm或者是*.htm)还是动态资源。

　　如果WEB Server Plugin发现客户端请求的是静态资源(*.htm或者是*.htm)，则将请求直接转交给WEB服务器，之后WEB服务器从文件系统中取出内容，发送回客户端浏览器进行解析执行。

　　如果WEB Server Plugin发现客户端请求的是动态资源（*.jsp、*.asp/*.aspx、*.php），则先将请求转交给WEB Container(WEB容器)，在WEB Container中连接数据库，从数据库中取出数据等一系列操作后动态拼凑页面的展示内容，拼凑页面的展示内容后，把所有的展示内容交给WEB服务器，之后通过WEB服务器将内容发送回客户端浏览器进行解析执行。

### 二.  Http协议

##### 2.1  什么是Http协议

​      HTTP是hypertext transfer  protocol（超文本传输协议）的简写，它是TCP/IP协议的一个应用层协议，用于定义WEB浏览器与WEB服务器之间交换数据的过程。客户端连上web服务器后，若想获得web服务器中的某个web资源，需遵守一定的通讯格式，HTTP协议用于定义客户端与web服务器通迅的格式。 

##### 2.2  Http1.0和Http1.1的区别

​         在HTTP1.0协议中，客户端与web服务器建立连接后，只能获得一个web资源。
　　 在HTTP1.1协议，允许客户端与web服务器建立连接后，在一个连接上获取多个web资源。 

##### 2.3  Http请求

Http请求包括的内容：客户端连上服务器后，向服务器请求某个web资源，称之为客户端向服务器发送了一个HTTP请求。

一个完整的HTTP请求包括如下内容：一个请求行、若干消息头、以及实体内容

##### 2.4  Http响应

Http响应包括的内容： 一个HTTP响应代表服务器向客户端回送的数据，它包括： 一个状态行、若干消息头、以及实体内容 。 

### 三.  Servlet开发

##### 3.1  Servlet简介

 Servlet是sun公司提供的一门用于开发动态web资源的技术。
　　Sun公司在其API中提供了一个servlet接口，用户若想用发一个动态web资源(即开发一个Java程序向浏览器输出数据)，需要完成以下2个步骤：
　　1、编写一个Java类，实现servlet接口。
　　2、把开发好的Java类部署到web服务器中。
　　按照一种约定俗成的称呼习惯，通常我们也把实现了servlet接口的java程序，称之为Servlet 

##### 3.2  Servlet的运行过程

 Servlet程序是由WEB服务器调用，web服务器收到客户端的Servlet访问请求后：
　　①Web服务器首先检查是否已经装载并创建了该Servlet的实例对象。如果是，则直接执行第④步，否则，执行第②步。
　　②装载并创建该Servlet的一个实例对象。 
　　③调用Servlet实例对象的init()方法。
　　④创建一个用于封装HTTP请求消息的HttpServletRequest对象和一个代表HTTP响应消息的HttpServletResponse对象，然后调用Servlet的service()方法并将请求和响应对象作为参数传递进去。
　　⑤WEB应用程序被停止或重新启动之前，Servlet引擎将卸载Servlet，并在卸载之前调用Servlet的destroy()方法。  

##### 3.3  Servlet接口实现类

-  Servlet接口SUN公司定义了两个默认实现类，分别为：GenericServlet、HttpServlet。

　　HttpServlet指能够处理HTTP请求的servlet，它在原有Servlet接口上添加了一些与HTTP协议处理方法，它比Servlet接口的功能更为强大。因此开发人员在编写Servlet时，通常应继承这个类，而避免直接去实现Servlet接口。
　　HttpServlet在实现Servlet接口时，覆写了service方法，该方法体内的代码会自动判断用户的请求方式，如为GET请求，则调用HttpServlet的doGet方法，如为Post请求，则调用doPost方法。因此，开发人员在编写Servlet时，通常只需要覆写doGet或doPost方法，而不要去覆写service方法。

```java
package gacl.servlet.study;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletDemo1 extends HttpServlet {

    /**
     * The doGet method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to get.
     * 
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException if an error occurred
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
        out.println("<HTML>");
        out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
        out.println("  <BODY>");
        out.print("    This is ");
        out.print(this.getClass());
        out.println(", using the GET method");
        out.println("  </BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
    }

    /**
     * The doPost method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to post.
     * 
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException if an error occurred
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
        out.println("<HTML>");
        out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
        out.println("  <BODY>");
        out.print("    This is ");
        out.print(this.getClass());
        out.println(", using the POST method");
        out.println("  </BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
    }

}
```

##### 3.4  Servlet访问URL映射配置

```xml
<servlet>
    <servlet-name>ServletDemo1</servlet-name>
    <servlet-class>gacl.servlet.study.ServletDemo1</servlet-class>
  </servlet>

  <servlet-mapping>
    <servlet-name>ServletDemo1</servlet-name>
    <url-pattern>/servlet/ServletDemo1</url-pattern>
  </servlet-mapping>
```

##### 3.5  Servlet与普通Java类的区别

Servlet是一个供其他Java程序（Servlet引擎）调用的Java类，它不能独立运行，它的运行完全由Servlet引擎来控制和调度。
　　针对客户端的多次Servlet请求，通常情况下，服务器只会创建一个Servlet实例对象，也就是说Servlet实例对象一旦创建，它就会驻留在内存中，为后续的其它请求服务，直至web容器退出，servlet实例对象才会销毁。
　　在Servlet的整个生命周期内，Servlet的init方法只被调用一次。而对一个Servlet的每次访问请求都导致Servlet引擎调用一次servlet的service方法。对于每次访问请求，Servlet引擎都会创建一个新的HttpServletRequest请求对象和一个新的HttpServletResponse响应对象，然后将这两个对象作为参数传递给它调用的Servlet的service()方法，service方法再根据请求方式分别调用doXXX方法。 

　　如果在<servlet>元素中配置了一个<load-on-startup>元素，那么WEB应用程序在启动时，就会装载并创建Servlet的实例对象、以及调用Servlet实例对象的init()方法。

##### 3.6  Servlet的线程安全问题

​    当多个客户端并发访问同一个Servlet时，web服务器会为每一个客户端的访问请求创建一个线程，并在这个线程上调用Servlet的service方法，因此service方法内如果访问了同一个资源的话，就有可能引发线程安全问题。例如下面的代码：

不存在线程安全问题的代码：

```java
package gacl.servlet.study;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletDemo3 extends HttpServlet {

    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        /**
         * 当多线程并发访问这个方法里面的代码时，会存在线程安全问题吗
         * i变量被多个线程并发访问，但是没有线程安全问题，因为i是doGet方法里面的局部变量，
         * 当有多个线程并发访问doGet方法时，每一个线程里面都有自己的i变量，
         * 各个线程操作的都是自己的i变量，所以不存在线程安全问题
         * 多线程并发访问某一个方法的时候，如果在方法内部定义了一些资源(变量，集合等)
         * 那么每一个线程都有这些东西，所以就不存在线程安全问题了
         */
        int i=1;
        i++;
        response.getWriter().write(i);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
```

存在线程安全问题的代码：

```java
package gacl.servlet.study;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletDemo3 extends HttpServlet {

    int i=1;
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        i++;
        try {
            Thread.sleep(1000*4);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        response.getWriter().write(i+"");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
```

针对Servlet的线程安全问题，Sun公司是提供有解决方案的：**让Servlet去实现一个SingleThreadModel接口，如果某个Servlet实现了SingleThreadModel接口，那么Servlet引擎将以单线程模式来调用其service方法。**
　　查看Sevlet的API可以看到，SingleThreadModel接口中没有定义任何方法和常量，**在Java中，把没有定义任何方法和常量的接口称之为标记接口**，经常看到的一个最典型的标记接口就是"**Serializable**"，这个接口也是没有定义任何方法和常量的，标记接口在Java中有什么用呢？主要作用就是给某个对象打上一个标志，告诉JVM，这个对象可以做什么，比如实现了"**Serializable**"接口的类的对象就可以被序列化，还有一个"Cloneable"接口，这个也是一个标记接口，在默认情况下，Java中的对象是不允许被克隆的，就像现实生活中的人一样，不允许克隆，但是只要实现了"Cloneable"接口，那么对象就可以被克隆了。

　　让**Servlet实现了SingleThreadModel接口，**只要在Servlet类的定义中增加实现SingleThreadModel接口的声明即可。  
　　**对于实现了SingleThreadModel接口的Servlet，Servlet引擎仍然支持对该Servlet的多线程并发访问，其采用的方式是产生多个Servlet实例对象，并发的每个线程分别调用一个独立的Servlet实例对象**。
　　实现SingleThreadModel接口并不能真正解决Servlet的线程安全问题，因为Servlet引擎会创建多个Servlet实例对象，而真正意义上解决多线程安全问题是指一个Servlet实例对象被多个线程同时调用的问题。事实上，在Servlet API 2.4中，已经将SingleThreadModel标记为Deprecated（过时的）。  

##### 3.7 ServletConfig讲解——配置Servlet初始化参数

在Servlet的配置文件web.xml中，可以使用一个或多个<init-param>标签为servlet配置一些初始化参数。

例如：

```xml
<servlet>
    <servlet-name>ServletConfigDemo1</servlet-name>
    <servlet-class>gacl.servlet.study.ServletConfigDemo1</servlet-class>
    <!--配置ServletConfigDemo1的初始化参数 -->
    <init-param>
        <param-name>name</param-name>
        <param-value>gacl</param-value>
    </init-param>
     <init-param>
        <param-name>password</param-name>
        <param-value>123</param-value>
    </init-param>
    <init-param>
        <param-name>charset</param-name>
        <param-value>UTF-8</param-value>
    </init-param>
</servlet>
```

##### 3.8  通过ServletConfig获取Servlet的初始化参数

 　当servlet配置了初始化参数后，web容器在创建servlet实例对象时，会自动将这些初始化参数封装到ServletConfig对象中，并在调用servlet的init方法时，将ServletConfig对象传递给servlet。进而，我们通过ServletConfig对象就可以得到当前servlet的初始化参数信息。 

例如：

```java
package gacl.servlet.study;

import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletConfigDemo1 extends HttpServlet {

    /**
     * 定义ServletConfig对象来接收配置的初始化参数
     */
    private ServletConfig config;
    
    /**
     * 当servlet配置了初始化参数后，web容器在创建servlet实例对象时，
     * 会自动将这些初始化参数封装到ServletConfig对象中，并在调用servlet的init方法时，
     * 将ServletConfig对象传递给servlet。进而，程序员通过ServletConfig对象就可以
     * 得到当前servlet的初始化参数信息。
     */
    @Override
    public void init(ServletConfig config) throws ServletException {
        this.config = config;
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //获取在web.xml中配置的初始化参数
        String paramVal = this.config.getInitParameter("name");//获取指定的初始化参数
        response.getWriter().print(paramVal);
        
        response.getWriter().print("<hr/>");
        //获取所有的初始化参数
        Enumeration<String> e = config.getInitParameterNames();
        while(e.hasMoreElements()){
            String name = e.nextElement();
            String value = config.getInitParameter(name);
            response.getWriter().print(name + "=" + value + "<br/>");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doGet(request, response);
    }

}
```

##### 3.9 ServletConText对象

 　WEB容器在启动时，它会为每个WEB应用程序都创建一个对应的ServletContext对象，它代表当前web应用。
　　ServletConfig对象中维护了ServletContext对象的引用，开发人员在编写servlet时，可以通过ServletConfig.getServletContext方法获得ServletContext对象。
　　由于一个WEB应用中的所有Servlet共享同一个ServletContext对象，因此Servlet对象之间可以通过ServletContext对象来实现通讯。ServletContext对象通常也被称之为context域对象。 

##### 3.10  多个Servlet通过ServletContext对象实现数据共享

　　范例：ServletContextDemo1和ServletContextDemo2通过ServletContext对象实现数据共享

```java
package gacl.servlet.study;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletContextDemo1 extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String data = "xdp_gacl";
        /**
         * ServletConfig对象中维护了ServletContext对象的引用，开发人员在编写servlet时，
         * 可以通过ServletConfig.getServletContext方法获得ServletContext对象。
         */
        ServletContext context = this.getServletConfig().getServletContext();//获得ServletContext对象
        context.setAttribute("data", data);  //将data存储到ServletContext对象中
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}



package gacl.servlet.study;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletContextDemo2 extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext context = this.getServletContext();
        String data = (String) context.getAttribute("data");//从ServletContext对象中取出数据
        response.getWriter().print("data="+data);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

```

 先运行ServletContextDemo1，将数据data存储到ServletContext对象中，然后运行ServletContextDemo2就可以从ServletContext对象中取出数据了，这样就实现了数据共享

##### 3.11  用servletContext实现请求转发

```java
package gacl.servlet.study;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletContextDemo4 extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String data = "<h1><font color='red'>abcdefghjkl</font></h1>";
        response.getOutputStream().write(data.getBytes());
        ServletContext context = this.getServletContext();//获取ServletContext对象
        RequestDispatcher rd = context.getRequestDispatcher("/servlet/ServletContextDemo5");//获取请求转发对象(RequestDispatcher)
        rd.forward(request, response);//调用forward方法实现请求转发
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}


package gacl.servlet.study;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletContextDemo5 extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getOutputStream().write("servletDemo5".getBytes());
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doGet(request, response);
    }

}

```

### 四.  HttpServletResponse对象

##### 4.1HttpServletResponse对象介绍

 　HttpServletResponse对象代表服务器的响应。这个对象中封装了向客户端发送数据、发送响应头，发送响应状态码的方法。查看HttpServletResponse的API，可以看到这些相关的方法 

##### 4.2HttpServletResponse对象常见应用

###### 4.2.1**范例：使用Response实现文件下载** 

```java
package gacl.response.study;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * @author gacl
 * 文件下载
 */
public class ResponseDemo02 extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        downloadFileByOutputStream(response);//下载文件，通过OutputStream流
    }

    /**
     * 下载文件，通过OutputStream流
     * @param response
     * @throws FileNotFoundException
     * @throws IOException
     */
    private void downloadFileByOutputStream(HttpServletResponse response)
            throws FileNotFoundException, IOException {
        //1.获取要下载的文件的绝对路径
        String realPath = this.getServletContext().getRealPath("/download/1.JPG");
        //2.获取要下载的文件名
        String fileName = realPath.substring(realPath.lastIndexOf("\\")+1);
        //3.设置content-disposition响应头控制浏览器以下载的形式打开文件
        response.setHeader("content-disposition", "attachment;filename="+fileName);
        //4.获取要下载的文件输入流
        InputStream in = new FileInputStream(realPath);
        int len = 0;
        //5.创建数据缓冲区
        byte[] buffer = new byte[1024];
        //6.通过response对象获取OutputStream流
        OutputStream out = response.getOutputStream();
        //7.将FileInputStream流写入到buffer缓冲区
        while ((len = in.read(buffer)) > 0) {
        //8.使用OutputStream将缓冲区的数据输出到客户端浏览器
            out.write(buffer,0,len);
        }
        in.close();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
```

###### 4.2.2生成随机图片用作验证码

```java
package gacl.response.study;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ResponseDemo03 extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setHeader("refresh", "5");//设置refresh响应头控制浏览器每隔5秒钟刷新一次
        //1.在内存中创建一张图片
        BufferedImage image = new BufferedImage(80, 20, BufferedImage.TYPE_INT_RGB);
        //2.得到图片
        //Graphics g = image.getGraphics();
        Graphics2D g = (Graphics2D)image.getGraphics();
        g.setColor(Color.WHITE);//设置图片的背景色
        g.fillRect(0, 0, 80, 20);//填充背景色
        //3.向图片上写数据
        g.setColor(Color.BLUE);//设置图片上字体的颜色
        g.setFont(new Font(null, Font.BOLD, 20));
        g.drawString(makeNum(), 0, 20);
        //4.设置响应头控制浏览器浏览器以图片的方式打开
        response.setContentType("image/jpeg");//等同于response.setHeader("Content-Type", "image/jpeg");
        //5.设置响应头控制浏览器不缓存图片数据
        response.setDateHeader("expries", -1);
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        //6.将图片写给浏览器
        ImageIO.write(image, "jpg", response.getOutputStream());
    }

    /**
     * 生成随机数字
     * @return
     */
    private String makeNum(){
        Random random = new Random();
        String num = random.nextInt(9999999)+"";
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 7-num.length(); i++) {
            sb.append("0");
        }
        num = sb.toString()+num;
        return num;
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
```

##### 4.3 通过response实现请求重定向

　　请求重定向指：**一个web资源收到客户端请求后，通知客户端去访问另外一个web资源，这称之为请求重定向。**

　　应用场景：用户登陆，用户首先访问登录页面，登录成功后，就会跳转到某个页面，这个过程就是一个请求重定向的过程

　　实现方式：response.sendRedirect(String location)，即调用response对象的sendRedirect方法实现请求重定向
　　sendRedirect内部的实现原理：**使用response设置****302状态码和设置location响应头实现重定向。

```java
package gacl.response.study;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ResponseDemo04 extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /**
         * 1.调用sendRedirect方法实现请求重定向,
         * sendRedirect方法内部调用了
         * response.setHeader("Location", "/JavaWeb_HttpServletResponse_Study_20140615/index.jsp");
         * response.setStatus(HttpServletResponse.SC_FOUND);//设置302状态码，等同于response.setStatus(302);
         */
        response.sendRedirect("/JavaWeb_HttpServletResponse_Study_20140615/index.jsp");
        
        //2.使用response设置302状态码和设置location响应头实现重定向实现请求重定向
        //response.setHeader("Location", "/JavaWeb_HttpServletResponse_Study_20140615/index.jsp");
        //response.setStatus(HttpServletResponse.SC_FOUND);//设置302状态码，等同于response.setStatus(302);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
```

### 五.  HttpServletRequest对象

##### 5.1 HttpServletRequest介绍

　　HttpServletRequest对象代表客户端的请求，当客户端通过HTTP协议访问服务器时，HTTP请求头中的所有信息都封装在这个对象中，通过这个对象提供的方法，可以获得客户端请求的所有信息。

##### 5.2  Request常用方法

###### 5.2.1 获取客户机信息

 　   **getRequestURL方法返回客户端发出请求时的完整URL。**
　　**getRequestURI方法返回请求行中的资源名部分。**
　　**getQueryString 方法返回请求行中的参数部分。**
　　getPathInfo方法返回请求URL中的额外路径信息。额外路径信息是请求URL中的位于Servlet的路径之后和查询参数之前的内容，它以“/”开头。
　　**getRemoteAddr方法返回发出请求的客户机的IP地址。**
　　getRemoteHost方法返回发出请求的客户机的完整主机名。
　　getRemotePort方法返回客户机所使用的网络端口号。
　　getLocalAddr方法返回WEB服务器的IP地址。
　　getLocalName方法返回WEB服务器的主机名。 

###### 5.2.2 获得客户机请求头

 　   getHeader(string name)方法:String 
　　getHeaders(String name)方法:Enumeration 
　　getHeaderNames()方法  

###### 5.2.3 获得客户机请求参数（客户端提交的数据）

- getParameter(String)方法**(常用)**
- getParameterValues(String name)方法**(常用)**
- getParameterNames()方法(**不常用**)
- getParameterMap()方法**(编写框架时常用)**

##### 5.3  request接收表单提交中文参数乱码问题

###### 5.3.1 以POST方式提交表单中文参数的乱码问题

```java
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>request接收中文参数乱码问题</title>
  </head>
  
  <body>
      <form action="<%=request.getContextPath()%>/servlet/RequestDemo04" method="post">
          用户名：<input type="text" name="userName"/>
          <input type="submit" value="post方式提交表单"> 
      </form>
  </body>
</html>
```

###### 5.3.2 POST方式提交中文数据乱码产生的原因和解决办法

可以看到，**之所以会产生乱码，就是因为服务器和客户端沟通的编码不一致造成的，因此解决的办法是：在\**客户端\**和服务器之间设置一个统一的编码，之后就按照此编码进行数据的传输和接收。**

　　由于客户端是以UTF-8字符编码将表单数据传输到服务器端的，因此服务器也需要设置以UTF-8字符编码进行接收，要想完成此操作，服务器可以直接使用从ServletRequest接口继承而来的"setCharacterEncoding(charset)"方法进行统一的编码设置。

##### 5.4 Request对象实现请求转发

###### 请求转发的基本概念

　　**请求转发：指一个web资源收到客户端请求后，通知服务器去调用另外一个web资源进行处理。**
　　请求转发的应用场景：MVC设计模式

　　在Servlet中实现请求转发的两种方式：

　　**1、通过ServletContext的getRequestDispatcher(String path)方法，该方法返回一个RequestDispatcher对象，调用这个对象的forward方法可以实现请求转发。**

将请求转发的test.jsp页面

```java
1 RequestDispatcher reqDispatcher =this.getServletContext().getRequestDispatcher("/test.jsp");
2 reqDispatcher.forward(request, response);
```

 　**2、通过request对象提供的getRequestDispatche(String path)方法，该方法返回一个RequestDispatcher对象，调用这个对象的forward方法可以实现请求转发。** 

```java
 request.getRequestDispatcher("/test.jsp").forward(request, response);
```

 request对象同时也是一个域对象(Map容器)，开发人员通过request对象在实现转发时，把数据通过request对象带给其它web资源处理。 

　request对象作为一个域对象(Map容器)使用时，主要是通过以下的四个方法来操作

- setAttribute(String name,Object o)方法，将数据作为request对象的一个属性存放到request对象中，例如：request.setAttribute("data", data);
- getAttribute(String name)方法，获取request对象的name属性的属性值，例如：request.getAttribute("data")
- removeAttribute(String name)方法，移除request对象的name属性，例如：request.removeAttribute("data")
- getAttributeNames方法，获取request对象的所有属性名，返回的是一个，例如：Enumeration<String> attrNames = request.getAttributeNames();

##### 5.5  请求重定向和请求转发的区别

 　一个web资源收到客户端请求后，**通知服务器去调用另外一个web资源**进行处理，称之为请求转发/307。
　　一个web资源收到客户端请求后，**通知浏览器去访问另外一个web资源**进行处理，称之为请求重定向/302。 

### 六.  使用Cookie进行会话管理

##### 6.1 会话的概念

 会话可简单理解为：用户开一个浏览器，点击多个超链接，访问服务器多个web资源，然后关闭浏览器，整个过程称之为一个会话。
　　有状态会话：一个同学来过教室，下次再来教室，我们会知道这个同学曾经来过，这称之为有状态会话。 

##### 6.2  会话过程中要解决的问题

 　每个用户在使用浏览器与服务器进行会话的过程中，不可避免各自会产生一些数据，程序要想办法为每个用户保存这些数据。 

##### 6.3 保存会话数据的两种技术

###### 6.3.1  Cookie

　　Cookie是客户端技术，程序把每个用户的数据以cookie的形式写给用户各自的浏览器。当用户使用浏览器再去访问服务器中的web资源时，就会带着各自的数据去。这样，web资源处理的就是用户各自的数据了。

###### 6.3.2  Session

　　Session是服务器端技术，利用这个技术，服务器在运行时可以为每一个用户的浏览器创建一个其独享的session对象，由于session为用户浏览器独享，所以用户在访问服务器的web资源时，可以把各自的数据放在各自的session中，当用户再去访问服务器中的其它web资源时，其它web资源再从用户各自的session中取出数据为用户服务。

##### 6.4 Java提供的操作Cookie的API

| No.  | 方法                                                         | 类型     | 描述                                                         |
| ---- | ------------------------------------------------------------ | -------- | ------------------------------------------------------------ |
| 1    | [Cookie](https://www.cnblogs.com/xdp-gacl/p/3803033.html#Cookie(java.lang.String, java.lang.String))([String](http://java.sun.com/j2se/1.5/docs/api/java/lang/String.html) name, [String](http://java.sun.com/j2se/1.5/docs/api/java/lang/String.html) value) | 构造方法 | 实例化Cookie对象，传入cooke名称和cookie的值                  |
| 2    | public [String](http://java.sun.com/j2se/1.5/docs/api/java/lang/String.html) getName() | 普通方法 | 取得Cookie的名字                                             |
| 3    | public [String](http://java.sun.com/j2se/1.5/docs/api/java/lang/String.html) getValue() | 普通方法 | 取得Cookie的值                                               |
| 4    | public void setValue([String](http://java.sun.com/j2se/1.5/docs/api/java/lang/String.html) newValue) | 普通方法 | 设置Cookie的值                                               |
| 5    | public void setMaxAge(int expiry)                            | 普通方法 | 设置Cookie的最大保存时间，即cookie的有效期，当服务器给浏览器回送一个cookie时，如果在服务器端没有调用setMaxAge方法设置cookie的有效期，那么cookie的有效期只在一次会话过程中有效，**用户开一个浏览器，点击多个超链接，访问服务器多个web资源，然后关闭浏览器，整个过程称之为一次会话**，当用户关闭浏览器，会话就结束了，此时cookie就会失效，如果在服务器端使用setMaxAge方法设置了cookie的有效期，比如设置了30分钟，那么当服务器把cookie发送给浏览器时，此时cookie就会在客户端的硬盘上存储30分钟，在30分钟内，即使浏览器关了，cookie依然存在，在30分钟内，打开浏览器访问服务器时，浏览器都会把cookie一起带上，这样就可以在服务器端获取到客户端浏览器传递过来的cookie里面的信息了，这就是cookie设置maxAge和不设置maxAge的区别，不设置maxAge，那么cookie就只在一次会话中有效，一旦用户关闭了浏览器，那么cookie就没有了，那么浏览器是怎么做到这一点的呢，我们启动一个浏览器，就相当于启动一个应用程序，而服务器回送的cookie首先是存在浏览器的缓存中的，当浏览器关闭时，浏览器的缓存自然就没有了，所以存储在缓存中的cookie自然就被清掉了，而如果设置了cookie的有效期，那么浏览器在关闭时，就会把缓存中的cookie写到硬盘上存储起来，这样cookie就能够一直存在了。 |
| 6    | public int getMaxAge()                                       | 普通方法 | 获取Cookies的有效期                                          |
| 7    | public void setPath([String](http://java.sun.com/j2se/1.5/docs/api/java/lang/String.html) uri) | 普通方法 | 设置cookie的有效路径，比如把cookie的有效路径设置为"/xdp"，那么浏览器访问"xdp"目录下的web资源时，都会带上cookie，再比如把cookie的有效路径设置为"/xdp/gacl"，那么浏览器只有在访问"xdp"目录下的"gacl"这个目录里面的web资源时才会带上cookie一起访问，而当访问"xdp"目录下的web资源时，浏览器是不带cookie的 |
| 8    | public [String](http://java.sun.com/j2se/1.5/docs/api/java/lang/String.html) getPath() | 普通方法 | 获取cookie的有效路径                                         |
| 9    | public void setDomain([String](http://java.sun.com/j2se/1.5/docs/api/java/lang/String.html) pattern) | 普通方法 | 设置cookie的有效域                                           |
| 10   | public String getDomain()                                    | 普通方法 | 获取cookie的有效域                                           |

##### 6.5 Cookie注意细节

1. 一个Cookie只能标识一种信息，它至少含有一个标识该信息的名称（NAME）和设置值（VALUE）。
2. 一个WEB站点可以给一个WEB浏览器发送多个Cookie，一个WEB浏览器也可以存储多个WEB站点提供的Cookie。
3. 浏览器一般只允许存放300个Cookie，每个站点最多存放20个Cookie，每个Cookie的大小限制为4KB。
4. **如果创建了一个cookie，并将他发送到浏览器，默认情况下它是一个会话级别的cookie（即存储在浏览器的内存中），用户退出浏览器之后即被删除。若希望浏览器将该cookie存储在磁盘上，则需要使用maxAge，并给出一个以秒为单位的时间。将最大时效设为0则是命令浏览器删除该cookie。**

##### 6.6 cookie中存取中文

 要想在cookie中存储中文，那么必须使用URLEncoder类里面的encode(String s,String enc）方法进行中文转码 

 在获取cookie中的中文数据时，再使用URLDecoder类里面的decode(String s, String enc)进行解码， 

### 七.  Session

##### 7.1 Session简单介绍

 在WEB开发中，服务器可以为每个用户浏览器创建一个会话对象（session对象），注意：一个浏览器独占一个session对象(默认情况下)。因此，在需要保存用户数据时，服务器程序可以把用户数据写到用户浏览器独占的session中，当用户使用浏览器访问其它程序时，其它程序可以从用户的session中取出该用户的数据，为用户服务。

##### 7.2  Session和Cookie的主要区别

- Cookie是把用户的数据写给用户的浏览器。
- Session技术把用户的数据写到用户独占的session中。
- Session对象由服务器创建，开发人员可以调用request对象的getSession方法得到session对象。

##### 7.3  Session实现原理

 服务器创建session出来后，会把session的id号，以cookie的形式回写给客户机，这样，只要客户机的浏览器不关，再去访问服务器时，都会带着session的id号去，服务器发现客户机浏览器带session id过来了，就会使用内存中与之对应的session为之服务 

### 八.  JSP

##### 8.1 什么是JSP？

​       JSP全称是Java Server Pages，它和servle技术一样，都是SUN公司定义的一种用于开发动态web资源的技术。
　　JSP这门技术的最大的特点在于，写jsp就像在写html，但它相比html而言，html只能为用户提供静态数据，而Jsp技术允许在页面中嵌套java代码，为用户提供动态数据。 

##### 8.2  JSP原理

 　浏览器向服务器发请求，不管访问的是什么资源，其实都是在访问Servlet，所以当访问一个jsp页面时，其实也是在访问一个Servlet，服务器在执行jsp的时候，首先把jsp翻译成一个Servlet，所以我们访问jsp时，其实不是在访问jsp，而是在访问jsp翻译过后的那个Servlet。

​     HttpJspBase类是继承HttpServlet的，所以HttpJspBase类是一个Servlet，而index_jsp又是继承HttpJspBase类的，所以index_jsp类也是一个Servlet，所以当浏览器访问服务器上的index.jsp页面时，其实就是在访问index_jsp这个Servlet，index_jsp这个Servlet使用_jspService这个方法处理请求。 

​     在jsp中编写的java代码和html代码都会被翻译到_jspService方法中去，在jsp中编写的java代码会原封不动地翻译成java代码，如<%out.print("Hello Jsp");%>直接翻译成out.print("Hello Jsp");，而HTML代码则会翻译成使用**out.write("\r\n");**的形式输出到浏览器。在jsp页面中编写的html排版标签都是以**out.write("\r\n");**的形式输出到浏览器，浏览器拿到html代码后才能够解析执行html代码。 

##### 8.3  JSP页面中的java代码服务器是如何执行

 　在jsp中编写的java代码会被翻译到_jspService方法中去，当执行_jspService方法处理请求时，就会执行在jsp编写的java代码了，所以Jsp页面中的java代码服务器是通过调用_jspService方法处理请求时执行的。 

##### 8.4  JSP九个内置对象

| NO.  | 内置对象        | 类型                                       |
| ---- | --------------- | ------------------------------------------ |
| 1    | **pageContext** | **javax.servlet.jsp.PageContext**          |
| 2    | **request**     | **javax.servlet.http.HttpServletRequest**  |
| 3    | **response**    | **javax.servlet.http.HttpServletResponse** |
| 4    | **session**     | **javax.servlet.http.HttpSession**         |
| 5    | **application** | **javax.servlet.ServletContext**           |
| 6    | **config**      | **javax.servlet.ServletConfig**            |
| 7    | out             | javax.servlet.jsp.JspWriter                |
| 8    | page            | java.lang.Object                           |
| 9    | exception       | java.lang.Throwable                        |

### 九.  Filter学习

##### 9.1  Filter简介

 　Filter也称之为过滤器，它是Servlet技术中最激动人心的技术，WEB开发人员通过Filter技术，对web服务器管理的所有web资源：例如Jsp, Servlet, 静态图片文件或静态 html  文件等进行拦截，从而实现一些特殊的功能。例如实现URL级别的权限访问控制、过滤敏感词汇、压缩响应信息等一些高级功能。
　　Servlet API中提供了一个Filter接口，开发web应用时，如果编写的Java类实现了这个接口，则把这个java类称之为过滤器Filter。通过Filter技术，开发人员可以实现用户在访问某个目标资源之前，对访问的请求和响应进行拦截， 

##### 9.2  Filter是如何实现拦截

　　Filter接口中有一个doFilter方法，当我们编写好Filter，并配置对哪个web资源进行拦截后，WEB服务器每次在调用web资源的service方法之前，都会先调用一下filter的doFilter方法，因此，在该方法内编写代码可达到如下目的：

1. 调用目标资源之前，让一段代码执行。
2. 是否调用目标资源（即是否让用户访问web资源）。
3. 调用目标资源之后，让一段代码执行。

　　web服务器在调用doFilter方法时，会传递一个filterChain对象进来，filterChain对象是filter接口中最重要的一个对 象，它也提供了一个doFilter方法，开发人员可以根据需求决定是否调用此方法，调用该方法，则web服务器就会调用web资源的service方 法，即web资源就会被访问，否则web资源不会被访问。

##### 9.3  Filter的生命周期

###### 9.3.1、Filter的创建

　　Filter的创建和销毁由**WEB服务器负责**。 web 应用程序**启动时**，web 服务器将**创建Filter 的实例对象**，并调用其init方法，完成对象的初始化功能，从而为后续的用户请求作好拦截的准备工作**，****filter对象只会创建一次，init方法也只会执行一次**。通过init方法的参数，可获得代表当前filter配置信息的FilterConfig对象。

###### 9.3.2、Filter的销毁

　　Web容器调用destroy方法销毁Filter。destroy方法在Filter的生命周期中仅执行一次。在destroy方法中，可以释放过滤器使用的资源

###### 9.3.3、FilterConfig接口

　　用户在配置filter时，可以使用<init-param>为filter配置一些初始化参数，当web容器实例化Filter对象，调用其init方法时，会把封装了filter初始化参数的filterConfig对象传递进来。因此开发人员在编写filter时，通过filterConfig对象的方法，就可获得：
　　String getFilterName()：得到filter的名称。
　　String getInitParameter(String name)： 返回在部署描述中指定名称的初始化参数的值。如果不存在返回null.
　　Enumeration getInitParameterNames()：返回过滤器的所有初始化参数的名字的枚举集合。
　　public ServletContext getServletContext()：返回Servlet上下文对象的引用。

##### 9.4  Filter的部署

　　Filter的部署分为两个步骤：

　　1、注册Filter

　　2、映射Filter

###### 9.4.1 注册Filter

开发好Filter之后，需要在web.xml文件中进行注册，这样才能够被web服务器调用

　　在web.xml文件中注册Filter范例：

```xml
<filter>
          <description>FilterDemo02过滤器</description>
          <filter-name>FilterDemo02</filter-name>
          <filter-class>me.gacl.web.filter.FilterDemo02</filter-class>
          <!--配置FilterDemo02过滤器的初始化参数-->
          <init-param>
              <description>配置FilterDemo02过滤器的初始化参数</description>
              <param-name>name</param-name>
              <param-value>gacl</param-value>
          </init-param>
          <init-param>
              <description>配置FilterDemo02过滤器的初始化参数</description>
              <param-name>like</param-name>
              <param-value>java</param-value>
          </init-param>
</filter>
```

　　<description>用于添加描述信息，该元素的内容可为空，<description>可以不配置。

　　<filter-name>用于为过滤器指定一个名字，该元素的内容不能为空。
　　<filter-class>元素用于指定过滤器的完整的限定类名。
　　<init-param>元素用于为过滤器指定初始化参数，它的子元素<param-name>指定参数的名字，<param-value>指定参数的值。在过滤器中，可以使用FilterConfig接口对象来访问初始化参数。如果过滤器不需要指定初始化参数，那么<init-param>元素可以不配置。

###### 9.4.2  映射Filter

　　在web.xml文件中注册了Filter之后，还要在web.xml文件中映射Filter

```xml
<!--映射过滤器-->
  <filter-mapping>
      <filter-name>FilterDemo02</filter-name>
      <!--“/*”表示拦截所有的请求 -->
      <url-pattern>/*</url-pattern>
  </filter-mapping>
```

 　<filter-mapping>元素用于设置一个 Filter 所负责拦截的资源。一个Filter拦截的资源可通过两种方式来指定：Servlet 名称和资源访问的请求路径
　　<filter-name>子元素用于设置filter的注册名称。该值必须是在<filter>元素中声明过的过滤器的名字
　　<url-pattern>设置 filter 所拦截的请求路径(过滤器关联的URL样式)
　　<servlet-name>指定过滤器所拦截的Servlet名称。
　　<dispatcher>指定过滤器所拦截的资源被 Servlet  容器调用的方式，可以是REQUEST,INCLUDE,FORWARD和ERROR之一，默认REQUEST。用户可以设置多个<dispatcher> 子元素用来指定 Filter 对资源的多种调用方式进行拦截。如下： 

```xml
<filter-mapping>
    <filter-name>testFilter</filter-name>
   <url-pattern>/index.jsp</url-pattern>
   <dispatcher>REQUEST</dispatcher>
   <dispatcher>FORWARD</dispatcher>
</filter-mapping>
```

　　<dispatcher> 子元素可以设置的值及其意义：

1. REQUEST：当用户直接访问页面时，Web容器将会调用过滤器。如果目标资源是通过RequestDispatcher的include()或forward()方法访问时，那么该过滤器就不会被调用。
2. INCLUDE：如果目标资源是通过RequestDispatcher的include()方法访问时，那么该过滤器将被调用。除此之外，该过滤器不会被调用。
3. FORWARD：如果目标资源是通过RequestDispatcher的forward()方法访问时，那么该过滤器将被调用，除此之外，该过滤器不会被调用。
4. ERROR：如果目标资源是通过声明式异常处理机制调用时，那么该过滤器将被调用。除此之外，过滤器不会被调用。