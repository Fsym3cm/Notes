# Java基础

## 一：面向对象

#### 1.1 面向对象概述

将一个项目（或者一个事件）分成更小的项目，每一个部分负责一方面的功能，最后由这些部分组成一个整体。这种方法适合多人工作。

 面向对象（Object Oriented）把构成问题的transaction分解成各个对象，而建立对象的目的也不是为了完成一个个步骤，而是为了描述某个事物在解决整个问题的过程中所发生的行为，意在写出通用代码，加强代码重用，屏蔽差异性。

我们把这些具有相同属性和相同方法的对象进行一步的封装，抽象出来类这个概念类就是个模子，确定了对象应该具有的属性和方法，对象是根据类创建出来的，类不占内存，对象占内存。

例如现实中的汽车，我们能看得见摸得着汽车有发动机、有车门等，行为可以承载我们去任何地方！**那在软件中我们要怎么做呢？我们先创建汽车这个类，创建汽车的门发动机等这个只是“模子”，要想使用我们创建的汽车，需要把这个类实例化下！，那这个汽车就可以跑了。

类就是一类事物，而对象就是一个事物，一类事物中包含若干的事物（而这其中的具体的事物就是对象），比如说：车，你可能想到的是很多车，因为你没法具体到哪辆车，这就是一个类的概念，而如果说，我家的那辆轿车，你肯定就可以想到那具体的一辆车，而这个具体的车就是对象的概念

#### 1.2 面向对象三个基本特征

 面向对象的三个基本特征是：**封装**、**继承**、**多态**。 

**封装**：它是面向对象的特征之一，是对象和类概念的主要特性。封装，也就是把客观事物封装成抽象的类，并且类可以把自己的数据和方法只让可信的类或者对象操作，对不可信的进行信息隐藏。

**继承**：面向对象编程 (OOP) 语言的一个主要功能就是“继承”。继承是指这样一种能力：它可以使用现有类的所有功能，并在无需重新编写原来的类的情况下对这些功能进行扩展。通过继承创建的新类称为“子类”或“派生类”。被继承的类称为“基类”、“父类”或“超类”。继承的过程，就是从一般到特殊的过程。要实现继承，可以通过“继承”（Inheritance）和“组合”（Composition）来实现。

在某些 OOP 语言中，一个子类可以继承多个基类。但是一般情况下，一个子类只能有一个基类，要实现多重继承，可以通过多级继承来实现。

 继承概念的实现方式有三类：实现继承、接口继承和可视继承。

1：实现继承是指使用基类的属性和方法而无需额外编码的能力；

2：接口继承是指仅使用属性和方法的名称、但是子类必须提供实现的能力；

3：可视继承是指子窗体（类）使用基窗体（类）的外观和实现代码的能力。

在考虑使用继承时，有一点需要注意，那就是两个类之间的关系应该是“属于”关系。例如，Employee 是一个人，Manager 也是一个人，因此这两个类都可以继承 Person 类。但是 Leg 类却不能继承 Person 类，因为腿并不是一个人。

抽象类仅定义将由子类创建的一般属性和方法，创建抽象类时，请使用关键字 Interface 而不是 Class。

OO开发范式大致为：划分对象→抽象类→将类组织成为层次化结构(继承和合成) →用类与实例进行设计和实现几个阶段。

**多态**：它是允许你将父对象设置成为和一个或更多的他的子对象相等的技术，赋值之后，父对象就可以根据当前赋值给它的子对象的特性以不同的方式运作。简单的说，就是一句话：允许将子类类型的指针赋值给父类类型的指针。

实现多态，有二种方式，**覆盖**，**重载**。

**覆盖**是指子类重新定义父类的虚函数的做法。

**重载**是指允许存在多个同名函数，而这些函数的参数表不同（或许参数个数不同，或许参数类型不同，或许两者都不同）。

其实，重载的概念并不属于“面向对象编程”，重载的实现是：编译器根据函数不同的参数表，对同名函数的名称做修饰，然后这些同名函数就成了不同的函数（至少对于编译器来说是这样的）。如，有两个同名函数：`function func(p: integer):integer;` 和 `function func(p: string):integer;` ，那么编译器做过修饰后的函数名称可能是这样的：`int_fun`、`st_func`。对于这两个函数的调用，在编译器间就已经确定了，是静态的（记住：是静态）。也就是说，它们的地址在编译期就绑定了（早绑定），因此，重载和多态无关！真正和多态相关的是“覆盖”。当子类重新定义了父类的虚函数后，父类指针根据赋给它的不同的子类指针，动态（记住：是动态！）的调用属于子类的该函数，这样的函数调用在编译期间是无法确定的（调用的子类的虚函数的地址无法给出）。因此，这样的函数地址是在运行期绑定的（晚绑定）。结论就是：重载只是一种语言特性，与多态无关，与面向对象也无关！引用一句Bruce Eckel的话：“不要犯傻，如果它不是晚绑定，它就不是多态。”

那么，多态的作用是什么呢？我们知道，封装可以隐藏实现细节，使得代码模块化；继承可以扩展已存在的代码模块（类）；它们的目的都是为了——代码重用。而多态则是为了实现另一个目的——接口重用！多态的作用，就是为了类在继承和派生的时候，保证使用“家谱”中任一类的实例的某一属性时的正确调用。

#### 1.3 类声明与定义类

在使用类之前，必须**先声明**它，然后才可以声明变量，并创建对象。

**类声明**的语法如下:

```java
[标识符] class 类名称
  {
      //类的成员变量
      //类的方法
  }
```

 在上面的语法格式中，**[标识符]** 可以是**public**、**private**、**protected**或者**完全省略**这个修饰符。 

 在声明一个类后，还需要对类进行定义。 

 **定义类**的语法如下：

```java
class 类名称
{
	// 定义属性
	数据类型 属性；      //零到多个属性
	// 定义构造函数
	类名称（参数，…）   //零个到多个构造方法
	{
	}
	// 定义方法
	返回值的数据类型 方法名称（参数1，参数2…） //零到多个方法
	{
    	程序语句 ;
   	 	return 表达式 ;
	}
}
```

类中各个成员之间，**定义的先后顺序没有任何影响**。各成员可相互调用**，但值得注意的是，static修饰的成员不能访问没有static修饰的成员。**

```java
public class Static {
	private int i;
	public static void f() {
		i++;	// 错误，静态方法 f() 无法访问非静态属性 i 
	}
}
```

**属性**用于定义该类或该类的实例所包含的各种数据。

**方法**则用于定义类中的行为特征或功能实现（即对数据的各种操作）。

**构造方法**是一种特殊的方法，专用于**构造该类的实例**（如实例的初始化、分配实例内存空间等），Java语言通过new关键字来调用构造方法，从而返回该类的实例。

#### 1.4 成员变量与局部变量区别

而在Java语言中，最基本的单位是类，类就是用来体现事物的。

用类class来描述事物也是如此

  **属性**：对应类中的成员变量  

  **行为**：对应类中的成员函数

  **定义类其实就是在定义类中的成员（成员变量和成员函数）**

  拓展：类是一个抽象的概念，而对象就是类的具体的存在，体现。例如：生活中的汽车，可以看做一个类，我们称之为汽车类，每一台车都有颜色和轮胎数（可以定义为属性，即成员变量），每一台车都可以跑（即车的行为，对应类总的成员函数），我们把汽车实例化一下，即会产生一个对象，比如奔驰、宝马（BMW）。

 Demo 1： 

```java
public class Car {
    private String color; // 定义汽车颜色，全局变量
    private int numLuntai; // 定义汽车轮胎数，全局变量

    public Car(String color, int numLuntai){
        super();
        this.color = color;
        this.numLuntai = numLuntai;
    }
    public void run() {
        System.out.println(this.numLuntai+ "个轮子的" +this.color + "轿车在马路上行驶着");
    }
}
```

```java
public class ClassTest {
    public static void main(String[] args){
        Car bmw = new Car("黑色", 4);      // 创建一个轿车对象，名字为bmw
        bmw.run();
    }
}
```

运行结果：

```java
4个轮子的黑色轿车在马路上行驶着
```

其中color和numLuntai就称为Car 类的**成员变量**，这个属性能够用来描述一个类的属性，否则，它就应该定义为**局部变量**。

   例如一个for循环中的i即是局部变量。

```java
 for(int i = 0; i < args.length; i++) {
     ......
 }
```

又例如写在成员方法中变量是局部变量。 

```java
public class Car {
    private String color; // 定义汽车颜色，全局变量
    private int numLuntai; // 定义汽车轮胎数，全局变量
    
    public Car(String color, int numLuntai){
        super();
        this.color = color;
        this.numLuntai = numLuntai;
    }
    public void run() {
        String carName=”宝马牌”;    //这个就是局部变量
        System.out.println(this.numLuntai+ "个轮子的" +this.color + carName+"轿车在马路上行驶着");
    }
}
publicclass ClassTest {
    public static void main(String[] args){
        Car bmw = new Car("黑色", 4);      // 创建一个轿车对象，名字为bmw
        bmw.run();
    }
}
```

结果：

```java
4个轮子的黑色宝马牌轿车在马路上行驶着
```

**成员变量**和**局部变量**的区别：
        **成员变量**：

1. 成员变量定义在类中，在整个类中都可以被访问。

2. 成员变量随着对象的建立而建立，随着对象的消失而消失，存在于对象所在的堆内存中。

3. 成员变量有默认初始化值。


  **局部变量**：

1. 局部变量只定义在局部范围内，如：函数内，语句内等，只在所属的区域有效。

2. 局部变量存在于栈内存中，作用的范围结束，变量空间会自动释放。

3. 局部变量没有默认初始化值


 

  在使用变量时需要遵循的原则为：**就近原则**

  首先在局部范围找，有就使用；接着在成员位置找。

#### 1.5 成员方法

方法的定义：方法是类或对象的行为特征的抽象。

- Java中的方法不能独立存在，所有的方法必须定义在类中。
- 使用 “类名.方法” 或 “对象.方法” 的形式调用。
- 语法格式：

```java
权限修饰符　返回值类型　方法名（参数类型　参数名） {

　　　　　　// 方法体

　　　　　　// 返回值

　}
```

 方法分类：

- 无参数无返回值
- 有参数无返回值
- 无参数有返回值
- 有参数有返回值

```java
public class Method {
    
    public void aMethod() {
        System.out.println("无参数无返回值的方法");
    }
    
    public void bMethod(int b) {
        System.out.println("有参数无返回值的方法");
    }
    
    public int cMethod() {
        System.out.println("无参数有返回值的方法");
        return 10;
    }
    
    public int dMethod(int d) {
        System.out.println("有参数有返回值的方法");
        return d;
    }

    public static void main(String[] args) {
        int ret;
　　　　　// 创建Method类的对象
        Method md = new Method();
　　　　　// 通过对象.方法调用
        md.aMethod();
        md.bMethod(10);
        ret = md.cMethod();
        ret = md.dMethod(10);
        System.out.println(ret);
    }
}
```

方法的**参数**：方法可以没有参数，或者有多个参数，参数类型可以是**任意类型**，方法参数也是局部变量

**参数为引用数据类型时：**

当对象实例作为参数传递给方法时，传递的是对象的引用，为地址传递，接受参数的方法可以改变参数的值。

**参数为简单数据类型时：**

传递的是参数的副本，为值传递，接受参数的方法中不会改变参数的值。

```java
public class MethodParam {
    
    /** 
     * 方法的参数为基本数据类型时，传递的是值的副本（值拷贝）
     * 方法中不会改变元参数的值
     */
    public void swap(int a, int b) {//a, b为形参
        int tmp;
        tmp = a;
        a = b;
        b = tmp;
    }
    
    int x = 100, y = 200;
    
    /**
     * 方法的参数为引用数据类型时，传递的对象的引用（传地址）
     * 方法中可以改变参数的值
     */
    public void swap2(MethodParam mp) {
        int tmp = mp.x;
        mp.x = mp.y;
        mp.y = tmp;
    }

    public static void main(String[] args) {
        MethodParam mp = new MethodParam();
        
        int m = 10, n = 20;
        System.out.println("交换前：a = "+m+",b = "+n);
        mp.swap(m, n);// m,n为实参
        System.out.println("交换后：a = "+m+",b = "+n);
        
        System.out.println("交换前：x = "+mp.x+",y = "+mp.y);
        mp.swap2(mp);
        System.out.println("交换后：x = "+mp.x+",y = "+mp.y);
    }

}
```

运行结果：

```java
test.HelloWorld
交换前：a = 10,b = 20
交换后：a = 10,b = 20
交换前：x = 100,y = 200
交换后：x = 200,y = 100

Process finished with exit code 0
```

#### 1.6 包作用

1.  把功能相似或相关的类或接口组织在同一个包中，**方便类的查找和使用**。 
2. 如同文件夹一样，包也采用了树形目录的存储方式。同一个包中的类名字是不同的，不同的包中的类的名字是可以相同的，当同时调用两个不同包中相同类名的类时，应该加上包名加以区别。因此，包可以**避免名字冲突**。       
3. 包也**限定了访问权限**，拥有包访问权限的类才能访问某个包中的类。

#### 1.7 包定义和引入

在一个.java文件中可以一个public类和多个非public类，如果要将这些类组织在一个包当中，则在.java文件中除注释以外的第一行使用关键字package即可实现。当需要调用此包中的类时，就可以使用关键字import进行导入。在**定义包**的时候，应该注意几点:

1. 为了尽量使包名保持唯一性，包名通常**采用小写、按倒写互联网址**的形式进行定义。如:com.hank.www表示包文件放置的文件路径为com/hank/www。
2. 在进行命名包时，应该**避免使用与系统发生冲突**的名字，如`java.lang`、`java.swing`等。

**包的导入**：import本质是通过查找环境变量中的绝对路径来完成导入（右键执行该文件，环境变量第一个元素是当前文件夹路径）。

**导包**：

1. 保证包所在文件夹在**环境变量**中
2. 导入的文件夹名就是**包名**

#### 1.8 常用包

1. `java.lang`包，最基础的包、核心类库。常用类有`String`、`Math`、`Thread`、`Object`、包装类`Integer`、`Character`等，常用接口有`Runnable`、`Iterable`、`Comparable`。
2. `java.util`包，实用工具包。常用类有`Arrays`、`Scanner`、`Random`、`HashSet`、`HashMap、ArrayList`,`Date`等，常用接口有`Collection`、`Set`、`List`等。
3. `java.io`包，提供数据输入输出。常用类有`File`、`FileInputStream`、`Reader`等提供文件、字节输入输出的类。
4. `java.net`包，为网络连接提供服务。常用类有`Socket`、`ServerSocket`、`URL`等。
5. `java.sql`包，连接数据库的包。要实现`jdbc`类库。
6. `java.awt`、(`javax.awt`)包，创建用户界面、绘图的。常用类有`Button`、`Panel`、（`JButton`、`JPanel`）等。

#### 1.9 方法重载

**方法重载**是让类以统一的方式处理不同类型数据的一种手段。调用方法时通过传递给它们的**不同个数**和**类型的参数**来决定具体使用哪个方法，这就是**多态性**。所谓方法重载是指在一个类中，多个方法的方法名相同，但是参数列表不同。参数列表不同指的是参数个数、参数类型或者参数的顺序不同。

方法的重载在实际应用中也会经常用到。不仅是一般的方法，构造方法也可以重载。

在方法重载时，方法之间需要存在一定的联系，因为这样可以**提高程序的可读性**，一般只重载功能相似的方法。

**重载**是指我们可以定义一些名称相同的方法，通过定义不同的参数来区分这些方法，然后再调用时，Java虚拟机就会根据不同的参数列表来选择合适的方法执行。也就是说，当一个重载方法被调用时，**Java用参数的类型或个数来决定实际调用的重载方法**。因此，每个重载方法的参数的类型或个数必须是不同。

虽然每个重载方法可以有不同的返回类型，但**返回类型并不足以区分**所使用的是哪个方法。

当Java调用一个重载方法是，参数与调用参数匹配的方法被执行。在使用重载要注意以下的几点:

1. 在使用重载时只能通过不同的参数列表，必须具有不同的参数列表。
2. 不能通过访问权限、返回类型、抛出的异常进行重载。
3. 方法的异常类型和数目不会对重载造成影响。
4. 可以有不同的返回类型，只要参数列表不同就可以了。
5. 可以有不同的访问修饰符。
6. 可以抛出不同的异常。

#### 1.10 封装性与访问控制

| 权限      | 类内 | 同包 | 不同包子类 | 不同包非子类 |
| --------- | ---- | ---- | ---------- | ------------ |
| public    | ✔    | ✔    | ✔          | ✔            |
| protected | ✔    | ✔    | ✔          | ✘            |
| default   | ✔    | ✔    | ✘          | ✘            |
| private   | ✔    | ✘    | ✘          | ✘            |

**私有级别**

私有级别的关键字是**private**，私有级别的成员变量和方法只能在其所在类的内部自由使用，在其他的类中则不允许直接访问。私有级别限制性最高。示例代码如下：

```java
  // PrivateClass.java文件
public class PrivateClass {            
    private int x;                     
  
    public PrivateClass() {            
          x = 100;
      }
      private void printX() {            
          System.out.println("Value Of x is" + x);
     }
 }
 
 // HelloWorld.java文件调用PrivateClass
 public class HelloWorld {
     public static void main(String[] args) {
 
         PrivateClass p;
         p = new PrivateClass();
 
         //编译错误，PrivateClass中的方法 printX()不可见
         p.printX();                    
     }
}
```

  上述代码第2行声明`Private Class`类，其中的代码第3行是声明私有实例变量x，代码第5行是声明公有的构造方法。代码第8行声明私有实例方法。`Hello World`类中代码第22行会有编译错误，因为`Private Class`中`printX()`的方法是私有方法。 

***默认级别***

默认级别没有关键字，也就是没有访问修饰符，默认级别的成员变量和方法，可以在其所在类内部和同一个包的其他类中被直接访问，但在不同包的类中则不允许直接访问。示例代码如下：

```java
// DefaultClass.java文件
package com.Kevin;
 
public class DefaultClass {
  
    int x;                            
  
    public DefaultClass() {
          x = 100;
    }
 
    void printX() {                   
         System.out.println("Value Of x is" + x);
     }
    
}
```

上述代码第6行的x变量前没有访问限制修饰符，代码第12行的方法也是没有访问限制修饰符。它们的访问级别都有默认访问级别。

在相同包（`com. Kevin`）中调用`Default Class`类代码如下：

```java
 // com.Kevin包中HelloWorld.java文件
 package com.Kevin;
 
 public class HelloWorld {
 
    public static void main(String[] args) {
 
         DefaultClass p;
         p = new DefaultClass();
         p.printX();    
    }
 }
```

默认访问级别可以在同一包中访问，上述代码可以编译通过。

在不同的包中调用`Default Class`类代码如下：

```java
 // 默认包中HelloWorld.java文件
 import com.Kevin.DefaultClass;
  
 public class HelloWorld {
 
     public static void main(String[] args) {
 
         DefaultClass p;
         p = new DefaultClass();
        // 编译错误，DefaultClass中的方法 printX()不可见
         p.printX();    
     }
 }
```

  该`HelloWorld.java`文件与`Default Class`类不在同一个包中，`printX()`是默认访问级别，所以`p.printX()`方法无法编译通过。

***共有级别***

   公有级别的关键字是**public**，公有级别的成员变量和方法可以在任何场合被直接访问，是最宽松的一种访问控制等级。示例代码如下：

```java
// PublicClass.java文件
package com.Kevin;

public class PublicClass {
 
     public int x;                 
 
     public PublicClass() {
         x = 100;
     }
 
    public void printX() {        
        System.out.println("Value Of x is" + x);
     }

}
```

上述代码第6行的x变量是保护级别，代码第12行的方法也是保护级别。

在相同包（`com. Kevin`）中调用P`rotected Class`类代码如下：

```java
 // 默认包中HelloWorld.java文件
package com.Kevin;
  
import com.Kevin.ProtectedClass;
  
 public class HelloWorld {
  
     public static void main(String[] args) {
  
        ProtectedClass p;
        p = new ProtectedClass();
         // 同一包中可以直接访问ProtectedClass中的方法 printX()
        p.printX();
 
    }
 }
```

同一包中保护访问级别与默认访问级别一样，可以直接访问`Protected Class`的`printX()`方法，上述代码可以编译通过。

在不同的包中调用`Protected Class`类代码如下：

```java
// 默认包中HelloWorld.java文件
import com.Kevin.ProtectedClass; 

public class HelloWorld {

   public static void main(String[] args) {
       
        ProtectedClass p;
        p = new ProtectedClass();
       // 编译错误，不同包中不能直接访问保护方法printX()
       p.printX();
     
    }
}
```

该`HelloWorld.java`文件与`Protected Class`类不在同一个包中，不同包中不能直接访问保护方法`printX()`，所以`p.printX()`方法无法编译通过。

在不同的包中继承Protected Class类代码如下：

```java
 // 默认包中SubClass.java文件
 import com.Kevin.ProtectedClass;
 
 public class SubClass extends ProtectedClass {
 
     void display() {
         //printX()方法是从父类继承过来
         printX();                            
         //x实例变量是从父类继承过来
         System.out.println(x);               
     }
 }
```

**访问成员**有两种方式：一种是**调用**，即通过类或对象调用它的成员，如p.printX()语句；另一种是**继承**，即子类继承父类的成员变量和方法。

公有访问级别任何情况下两种方式都可以；

- 默认访问级别在同一包中两种访问方式都可以，不能在包之外访问；
- 保护访问级别在同一包中与默认访问级别一样，两种访问方式都可以。但是在不同包之外只能继承访问；
- 私有访问级别只能在本类中通过调用方法访问，不能继承访问。

　提示　访问类成员时，在能满足使用的前提下，应尽量限制类中成员的可见性，访问级别顺序是：私有级别→默认级别→保护级别→公有级别。

#### 1.11 静态变量和静态方法

**static** 是Java中的一个关键字，我们不能声明普通外层类或者包为静态的。

**静态变量**：我们可以将类级别的变量声明为static。静态变量是属于类的，而不是属于类创建的对象或实例。因为静态变量被类的所有实例共用，所以非线程安全的。通常静态变量还和关键字final一起用，作为所有对象共用的资源或常量。如果静态变量不是私有的，那么可以通过`ClassName.variableName`来访问它.

```java
//静态变量的例子
private static int count;
public static String str;
public static final String DB_USER = "myuser"

```

**静态方法**，类似于静态变量，静态方法也属于类，不属于实例的。静态方法只能访问类的静态变量，或调用类的静态方法。通常**静态方法作为工具方法**，被其它类使用，而不需要创建类的实例。譬如集合类、Wrapper类(String, Integer等)和工具类(`java.util`中的类)都有很多静态方法。通常java程序的开始就是一个`main()`方法，它就是个静态方法。

```java
//静态方法的例子
public static void setCount(int count) {
    if(count > 0)
    StaticExample.count = count;
}

//静态工具方法
public static int addInts(int i, int...js){
    int sum=i;
    for(int x : js) sum+=x;
    return sum;
}
```

#### 1.12 静态代码块

**静态块**就是类加载器加载对象时，要执行的一组语句。它用于初始化静态变量。通常用于类加载的时候创建静态资源。我们在静态块中不能访问非静态变量。我们可以在一个类中有多个静态块，尽管这么做没什么意义。静态块只会在类加载到内存中的时候执行一次。

```java
static{
    //在类被加载的时候用于初始化资源
    System.out.println("StaticExample static block");
    //仅能访问静态变量和静态方法
    str="Test";
    setCount(2);
}
```

**静态类**：我们对嵌套类使用static关键字。static不能用于最外层的类。静态的嵌套类和其它外层的类别无二致，嵌套只是为了方便打包。

## 二：对象

#### 2.1 创建对象

先写个举例的class

```java
public class Dog{
    public Dog(){
        super();	
    }	
}
```

1、第一种：**new**一个

```java
Dog jack = new Dog();
```

2、第二种：利用**class的反射机制**，该种方式适用于有无参构造方法的，有参数的也可以用反射

```java
Class dogClass = Dog.class; //拿到class Dog的 Class实例对象
Dog rose = (Dog) dogClass.newInstance(); //调用Class的实例方法 newInstance（）创建Dog的实例对象
```

每一个class（字节码文件，此处可能是interface），都是Class的一个对象

```java
Class dogClass = Class.forName("Dog");
Dog rose = (Dog) dogClass.newInstance();
```

用了两种获得Dog的class对象的方式，第一种是类名.class, 第二种是Class.forName("类名")

3、第三种：利用**java对象的序列化与反序列化技术**（对象在内存中的分配方式，在本地里保存一份一模一样的，然后再从本地取出来用（这叫反序列化），相当于把一个对象的状态（实例变量）完全保存住了,游戏里经常使用，利用封装类：ObjectOutputStream序列化,ObjectInputStream反序列化。

前提：Java中，该类必须实现接口Serializable（这是一个标记interface）

```java
public class CreateFour implements Serializable {
	
	public static void main(String args[]) {
		CreateFour fCreateFour = new CreateFour();
		ObjectOutputStream objectStream;
		try {
			objectStream = new ObjectOutputStream(new FileOutputStream("res/obj.txt"));
			objectStream.writeObject(fCreateFour);
			
			ObjectInputStream objectInputStream = new ObjectInputStream(new FileInputStream("res/obj.txt"));
			CreateFour cloneFour = (CreateFour) objectInputStream.readObject();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
```

 4、第四种：利用Object下的**native**方法`clone（）`,该类必须实现Cloneable接口，不然`clone（）`时会抛出异常`CloneNotSupportedException` 

```java
protected native Object clone() throws CloneNotSupportedException;
```

```java
public class CreateFour implements Cloneable {
	
	public static void main(String args[]) {
		CreateFour f = new CreateFour();
		try {
			CreateFour cloneObject = (CreateFour) f.clone();
		} catch (CloneNotSupportedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
```

**总结**： new、反射、 利用对象字节流反序列化，还有利用clone（）方法，都会开辟新的内存空间，就是在jvm中的堆内存复制一个与源对象相同的新的对象（千万不要以为旧引用与新引用对应的是同一个对象哦） 

#### 2.2 空对象

**空对象**就是一个正常的对象，只不过你用这个对象来替代null。 

**作用**：  当使用null表示缺少对象时，在每次引用前都要测试其是否为null，因此需要在代码中加入判断语句，当判断语句变多时，代码就变得杂乱，使用空对象可以减少判断的语句。 

判断**空指针异常问题**：

```java
public boolean function (String params){
    if (params == null || params.equals("")) {
        //todo
    }
}
```

#### 2.3 构造方法

构造方法作用： 是定义在java类中的一个用来初始化对象的方法，用new+构造方法，创建一个新的对象，并可以给对象中的实例进行赋值。

**语法规则**：

1. 方法名必须与类名相同
2. **无返回值类型**，也不能用void修饰（有任何返回值类型的方法都不是构造方法）
3. 可以指定参数，也可以不指定参数；分为有参构造方法和无参构造方法

构造方法的**特点**：

1. 当没有指定构造方法时，系统会自动添加无参的构造方法。
2. 构造方法可以重载：方法名相同，但参数不同的多个方法，调用时会自动根据不同的参数选择相应的方法。
3. 构造方法是不被继承的。
4. 当我们手动的指定了构造方法时，无论是有参的还是无参的，系统都将不会再添加无参的构造方法。

```java
class class_name {
    public class_name(){}    // 默认无参构造方法
    public ciass_name([paramList]){}    // 定义构造方法
    …
    // 类主体
}
```

 在一个类中，与类名相同的方法就是构造方法。每个类可以具有多个构造方法，但要求它们各自包含不同的方法参数。 

#### 2.4 默认构造方法

**默认构造方法:** 

- 在java语言中，每个类至少有一个构造方法。如果程序中没有显式定义任何构造方法，那么java语言将自动提供一个隐含的默认构造方法。只要程序中已经显式定义了构造方法,那么java语言将不再提供隐含的默认构造方法。
- 子类含有默认构造方法，父类没有默认构造方法，会报错

```java
class B{
   //B(){};//如果没有默认构造方法，子类有默认构造方法会报错
   public B(String name){
   System.out.println("A and B");
   }
}
public class A extends B{
    
}
```

由于在A中没有显示的定义构造方法，因此，A的默认无参构造方法被隐式的调用，因为A是B的子类，所以A的默认构造方法会自动的调用B的无参构造方法，然而B没有无参构造方法，因为B显示的定义了构造方法，因此，程序不能被编译。


#### 2.5 构造方法重载

构造方法主要有无参构造方法和有参构造方法两种，示例如下： 

```java
public class MyClass {
    private int m;    // 定义私有变量
    MyClass() {
        // 定义无参的构造方法
        m = 0;
    }
    MyClass(int m) {
        // 定义有参的构造方法
        this.m = m;
    }
}
```

该示例定义了两个构造方法，分别是无参构造方法有参构造方法在一个类中定义多个具有不同参数的同名方法，这就是方法的**重载**。

类的构造方法不是要求必须定义的。如果类中显式地定义了一个或多个构造方法，则 Java 不再提供默认构造方法。

提示：无参数的构造方法也被称为 Nullary 构造方法。只有编译程序自动加入的构造方法，才称为默认构造函数。如果自行编写无参数、没有内容的构造函数，就不称为默认构造函数了（只是 Nullary 构造函数）。虽然只是名词定义，不过认证考试时要区别一下两者的不同。

 要在不同的条件下使用不同的初始化行为创建类的对象，这时候就需要在一个类中创建多个构造方法。下面通过一个示例来演示构造方法的使用。

1. 首先在员工类 Worker 中定义两个构造方法，代码如下： 

   ```java
   public class Worker {
       public String name;    // 姓名
       private int age;    // 年龄
       // 定义带有一个参数的构造方法
       public Worker(String name) {
           this.name = name;
       }
       // 定义带有两个参数的构造方法
       public Worker(String name,int age) {
           this.name = name;
           this.age = age;
       }
       public String toString() {
           return "大家好！我是新来的员工，我叫"+name+"，今年"+age+"岁。";
       }
   }
   ```

   ​       在 Worker 类中定义了两个属性，其中 name 属性不可改变。分别定义了带有一个参数和带有两个参数的构造方法，并对其属性进行初始化。最后定义了该类的 toString() 方法，返回一条新进员工的介绍语句。

   ​       提示：Object 类具有一个 `toString()` 方法，该方法是个特殊的方法，创建的每个类都会继承该方法，它返回一个 String 类型的字符串。如果一个类中定义了该方法，则在调用该类对象时，将会自动调用该类对象的 `toString()` 方法返回一个字符串，然后使用 `System.out.println(对象名)` 就可以将返回的字符串内容打印出来。

2. 在 TestWorker 类中创建 main() 方法作为程序的入口处，在 main() 方法中调用不同的构造方法实例化 Worker 对象，并对该对象中的属性进行初始化，代码如下： 

   2. 

   ```java
   public class TestWorker {
       public static void main(String[] args) {
           System.out.println("-----------带有一个参数的构造方法-----------");
           // 调用带有一个参数的构造方法
           Worker worker1 = new Worker("张强");
           System.out.println(worker1);
           System.out.println("-----------带有两个参数的构造方法------------");
           // 调用带有两个参数的构造方法
           Worker worker2 = new Worker("李丽",25);
           System.out.println(worker2);
       }
   }
   ```

    在上述代码中，创建了两个不同的 Worker 对象：一个是姓名为张强的员工对象，一个是姓名为李丽、年龄为 25 的员工对象。对于第一个 Worker 对象 Worker 1，并未指定 age 属性值，因此程序会将其值采用默认值 0。对于第二个 Worker 对象 Worker 2，分别对其指定了 name 属性值和 age 属性值，因此程序会将传递的参数值重新赋值给 Worker 类中的属性值。

   ```java
   -----------带有一个参数的构造方法-----------
   大家好！我是新来的员工，我叫张强，今年0岁。
   -----------带有两个参数的构造方法------------
   大家好！我是新来的员工，我叫李丽，今年25岁。
   ```


#### 2.6 构造方法封装

 类的封装性不只是体现在对属性的封装上，实际上的方法也是可以被封装的，当然，在方法的封装中也包含了对构造方法的封装。如下代码就是对构造方法进行了封装。 

```java
class TestClass{
   static TestClass tc=new TestClass();
   private TestClass(){
      System.out.println(“构造方法被封装了！”);
   }
   public void print(){
   System.out.println(“类中的方法！”);
   }
}
public class TestDemo{
   public static void main(String[] args){
     TestClass tt=null;
     tt=TestClass.tc;//把对象tc传递给了对象tt,也就是调用了构造方法，
     tt.print();
     System.out.println(“你好！”);
     }
}
```

#### 2.7 this关键字

当一个对象创建后，Java虚拟机（JVM）就会给这个对象分配一个引用自身的指针，这个指针的名字就是 this。

因此，this只能在类中的非静态方法中使用，静态方法和静态的代码块中绝对不能出现this，并且this只和特定的对象关联，而不和类关联，同一个类的不同对象有不同的this。

**1、使用this来区分当前对象。**

Java中为解决变量的命名冲突和不确定性问题，引入关键字**this代表其所在方法的当前对象的引用**：

1. 构造方法中指该构造器所创建的新对象；
2. 方法中指调用该方法的对象；

3. 在类本身的方法或构造器中引用该类的实例变量（全局变量）和方法。

​     this只能用在构造器或者方法中，用于获得调用当前的构造器方法的对象引用。可以和任何的对象引用一样来处理这个this对象。

说明：

1. 当实例变量和局部变量重名，JAVA平台会按照先局部变量、后实例变量的顺序寻找。即，方法中使用到的变量的寻找规律是先找局部变量，再找实例变量。如果没用找到，将会有一个编译错误而无法通过编译。

2. 如果使用`this.a`，则不会在方法（局部变量）中寻找变量a,而是直接去实例变量中去寻找，如果寻找不到，则会有一个编译错误。

3. 在一个方法内，如果没有出现局部变量和实例变量重名的情况下，是否使用this关键字是没有区别的。

4. 在同一个类中，Java普通方法的互相调用可以省略this+点号，而直接使用方法名+参数。因为Java编译器会帮我们加上。


**2、在构造器中使用this来调用对象本身的其他构造器。**

在构造器中使用this（[args_list]）；可以调用对象本身的其他的构造器。直接使用this()加上类构造器所需要的参数。就可以调用类本身的其他构造器了。如果类中有多个其他构造器定义，系统将自动根据this()中的参数个数和类型来找出类中相匹配的构造器。

注意： 在构造器中可以通过this()方式来调用其他的构造器。但在一个构造器中最多只能调用一个其他的构造器。并且，对其他构造器的调用动作必须放在构造器的起始处（也就是构造器的首行），否则编译的时候将会出现错误，另外不能在构造器以外的地方以这种方式调用构造器。

**3、this关键字还有一个重大的作用就是返回类的引用。如在代码中，可以使用return this来返回某个类的引用。此时，这个this关键字就代表类的名称。**

1. **把this作为参数传递**

　　当你要把自己作为参数传递给别的对象时，也可以用this。如：

```
public class A{

public A(){
    new B(this).print();
}

public void print(){
      System.out.println("From A!");
 }

public static void main(String[] args) {
      new A();
   }
}
 
public class B{
   A a;
   public B(A a){
      this.a = a;
   }
 
   public void print(){
      a.print();
      System.out.println("From B!");
   }
}
```

运行结果：

```java
From A!
From B!
```

在这个例子中，对象A的构造函数中，用new B(this)把对象A自己作为参数传递给了对象B的构造函数。

2. 注意**匿名类和内部类**中的中的this。

有时候，我们会用到一些内部类和匿名类，如事件处理。当在匿名类中出现this时，这个this则指的是匿名类或内部类本身。这时如果我们要使用外部类的方法和变量的话，则应该加上外部类的类名。如下面这个例子：

```java
public class C {
   int i = 1;
   public C(){
      Thread thread = new Thread(){
        public void run(){
           for(;;){//表示是死循环
              C.this.run();//调用外部方法run()
              try {
                 sleep(1000);
              } catch (InterruptedException e) {
                 e.printStackTrace();
              }
           }
        }
      };//注意这里有分号;
      thread.start();
   }

   public void run(){
      System.out.println("i = " + i);
      i++;
   }

   public static void main(String[] args) throws Exception {
      new C();
   }
}
```

**运行结果：**每一秒产生一个数：1,2,3 ……

　在上面这个例子中, thread 是一个匿名类对象，在它的定义中，它的 run 函数里用到了外部类的 run 函数。这时由于函数同名，直接调用就不行了。这时有两种办法，一种就是把外部的 run 函数换一个名字，但这种办法对于一个开发到中途的应用来说是不可取的。那么就可以用这个例子中的办法用外部类的类名加上 this 引用来说明要调用的是外部类的方法 run。

3. this关键字最大的作用是，让类的一个方法，**访问**该类的另一个方法或者属性。

```java
public class Baby{

   public void wakeUp(){
      System.out.println("宝宝醒啦");
   }

   public void eat(){
      Baby baby = new Baby();
      baby.wakeUp();
      System.out.println("吃东西");
   }
}
```

这样不符合逻辑。这就相当于本对象的`eat`方法，需要调用另一个对象的`wakeUp`方法。

我们看这个例子:

```java
public class Baby{

   public void wakeUp(){
      System.out.println("宝宝醒啦");
   }

   public void eat(){
      this.wakeUp();
      System.out.println("吃东西");
   }
}
```

这样就符合逻辑了。自己的eat方法，还需要自己的一个wakeup方法。

**java允许同一个对象的方法直接调用该对象的属性或者方法，所以this可以省略。**

 

**注意：java中为什么在static中不能使用this关键字**

   Static方法是类方法，先于任何的实例（对象）存在。即Static方法在类加载时就已经存在了，但是对象是在创建时才在内存中生成。而this指代的是当前的对象

在方法中定义使用的this关键字,它的值是当前对象的引用.也就是说你只能用它来调用属于当前对象的方法或者使用this处理方法中成员变量和局部变量重名的情况.

而且,更为重要的是**this**和**super**都无法出现在static 修饰的方法中,static 修饰的方法是属于类的,该方法的调用者可能是一个类,而不是对象.如果使用的是类来调用而不是对象,

则 this就无法指向合适的对象.所以static 修饰的方法中不能使用this.

#### 2.8 对象销毁

一个对象被当作垃圾回收的情况主要如下两种。
1. 对象的引用超过其作用范围。

  ```java
  {
   Object o=new Object();    //对象o的作用范围，超过这个范围对象将被视为垃圾
  }  
  ```

2. 对象被赋值为 null。

  ```java
  {
   Object o=new Object();
   o=null;    //对象被赋值为null将被视为垃圾
  }
  ```

  在 Java 的 Object 类中还提供了一个 protected 类型的 finalize() 方法，因此任何 Java 类都可以覆盖这个方法，在这个方法中进行释放对象所占有的相关资源的操作。

  在 Java 的 Object 类中还提供了一个 protected 类型的 finalize() 方法，因此任何 Java 类都可以覆盖这个方法，在这个方法中进行释放对象所占有的相关资源的操作。

在 Java 虚拟机的堆区，每个对象都可能处于以下三种状态之一。

(1) **可触及状态**：当一个对象被创建后，只要程序中还有引用变量引用它，那么它就始终处于可触及状态。

(2) **可复活状态**：当程序不再有任何引用变量引用该对象时，该对象就进入可复活状态。在这个状态下，垃圾回收器会准备释放它所占用的内存，在释放之前，会调用它及其他处于可复活状态的对象的 finalize() 方法，这些 finalize() 方法有可能使该对象重新转到可触及状态。

(3) **不可触及状态**：当 Java 虚拟机执行完所有可复活对象的 finalize() 方法后，如果这些方法都没有使该对象转到可触及状态，垃圾回收器才会真正回收它占用的内存。

注意：调用 System.gc() 或者 Runtime.gc() 方法也不能保证回收操作一定执行，它只是提高了 Java 垃圾回收器尽快回收垃圾的可能性。

## 三： 继承与多态 

#### 3.1  Java中的继承 

继承是java面向对象编程技术的一块基石，因为它允许创建分等级层次的类。

继承就是子类继承父类的特征和行为，使得子类对象（实例）具有父类的实例域和方法，或子类从父类继承方法，使得子类具有父类相同的行为。

```java
class Animal{
	void eat(){
		System.out.println("Animal eat");
	}
	void sleep(){
		System.out.println("Animal sleep");
	}
	void breathe(){
		System.out.println("Animal breathe");
	}
}
 
class Fish extends Animal{
}
 
public class TestNew {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Animal an = new Animal();
		Fish fn = new Fish();
		
		an.breathe();
		fn.breathe();
	}
}
```

 在eclipse执行得：Animal breathe! Animal breathe!
        **.java**文件中的每个类都会在文件夹bin下生成一个对应的.class文件。执行结果说明派生类继承了父类的所有方法。 

####  3.2 调用父类构造方法 

 子类可以通过 super 关键字来调用一个由父类定义的构造方法，格式如下： 

```java
super(parameter-list);
```

 其中，parameter-list 指定了父类中构造方法所需的所有参数。super() 必须是在子类构造方法的主体第一行。

例如，在 Person 类中指定了两个构造方法。示例代码如下： 

```java
public People(String name,int age,String sex,String sn)
{
    this.name=name;
    this.age=age;
    this.sex=sex;
    this.sn=sn;
}
public People(String name,String sn)
{
    this.name=name;
    this.sn=sn;
}
```

 那么，Student 类继承了 Person 类，就可以使用 super 语句来定义 Student 类的构造方法。示例代码如下： 

```java
public Student(String name,int age,String sex,String sn,String stuno,String department)
{
    super(name,age,sex,sn);    //调用父类中含有4个参数的构造方法
    this.stuNo=stuno;
    this.department=department;
}
public Student(String name,String sn,String stuNo)
{
    super(name,sn);    //调用父类中含有两个参数的构造方法
    this.stuNo=stuNo;
}
```

   从上述 Student 类构造方法代码可以看出，**super 用来直接调用父类中的构造方法**，使用它可以使书写代码更简洁方便。 

 使用 **super 访问父类中的成员**与 this 关键字的使用相似，只不过它引用的是子类的父类，基本形式如下： 

```java
super.member
```

其中，member 是父类中的方法或属性名称。这种形式多用于子类的成员名隐藏了父类中的同名成员的情况。

在 Animal 类和 Cat 类中分别定义了 public 类型的 name 属性和 private 类型的 name 属性，并且 Cat 类继承 Animal 类。那么，我们可以在 Cat 类中通过 super 关键字来访问父类 Animal 中的 name 属性，通过 this 关键字来访问本类中的 name 属性，如下面的代码：

```java
//父类Animal的定义
public class Animal
{
    public String name;    //动物名字
}
//子类Cat的定义
public class Cat extends Animal
{
    private String name;    //名字
    public Cat(String aname,String dname)
    {
        super.name=aname;    //通过super关键字来访问父类中的name属性
        this.name=dname;    //通过this关键字来访问本类中的name属性
    }
    public String toString()
    {
        return"我是"+super.name+"，我的名字叫"+this.name;
    }
    public static void main(String[] args)
    {
        Animal cat=new Cat("动物","喵星人");
        System.out.println(cat);
    }
}
```

上述代码演示了使用 super 实现子类的成员名隐藏父类中同名成员的情况。尽管 Cat 类中的属性 name 隐藏了 Animal 类中的 name 属性，但是 super 允许访问父类中的 name 属性。另外，super 还可以用于调用被子类隐藏的方法。

```java
我是动物，我的名字叫喵星人
```

####  3.3成员变量隐藏 

首先，我们在编写子类的时候，我们仍然可以声明一些新的成员变量，其中有一种特殊的情况就是，所声明的成员变量的名字和从父类继承来的成员变量的名字相同（声明的类型可以不同），在这种情况下，子类就会隐藏所继承的成员变量。
注：子类继承的方法只能操作子类继承和隐藏的成员变量。（意思就是说子类继承的方法所操作的成员变量一定是被子类继承和隐藏的成员变量。）子类新定义的方法可以操作子类继承和子类新声明的成员变量，但是无法操作子类隐藏的成员变量，如果非要操作隐藏的成员变量，需要用到关键字super，例如`super.x`、`super.play()`就是访问和调用被子类隐藏的成员变量x和方法play()。
下面看看测试：先是成员变量的隐藏

```java
/**
 * 父类
 */
package Test;

public class people {
	public String s = "我是父类的s";

}
```

```java
/**
 * 子类
 */
package Test;

public class student extends people {
	public String s = "我是子类的s";

	public static void main(String[] args) {
		student he = new student();   //创建一个子类的对象
		System.out.println(he.s);

	}

}
```

 可以看到输出的s是子类的成员变量，父类的s则被子类的隐藏了 

结果：

```java
我是子类的s
```

 **直接引用父类的实例变量**： 

```java
/**
 * 父类
 */
package Test;

public class people {
	public String s = "我是父类的s";

}
```

```java
/**
 * 子类
 */
package Test;

public class student extends people {
	public String s = "我是子类的s";
	void prints(){
		System.out.println("不用关键字super时：" + s);
		System.out.println( "使用关键字super时："+ super.s);
	}

	public static void main(String[] args) {
		student he = new student();
           he.prints();
		//System.out.println(he.s);

	}

}
```

 测试结果： 

```java
不用关键字super时：我是子类的s
使用关键字super时：我是父类的s
```

 **通过super来调用父类方法**： 

```java
/**
 * 父类
 */
package Test;

public class people {
	public String s = "我是父类的s";
	void prinfs(){
		System.out.println(s);
	}

}
```

```java
/**
 * 子类
 */
package Test;

public class student extends people {
	public String s = "我是子类的s";
	void prints(){
		System.out.println(s);
		//System.out.println("不用关键字super时：" + s);
		//System.out.println( "使用关键字super时："+ super.s);
	}
	void work(){
		prints();
		super.prinfs();
	}

	public static void main(String[] args) {
		student he = new student();
          // he.prints();
		//System.out.println(he.s);
           he.work();

	}

}
```

结果：

```java
我是子类的s
我是父类的s
```



#### 3.4 方法的覆盖 

在类继承中，子类可以修改从父类继承来的行为，也就是说子类能创建一个与父类方法有不同功能的方法，但具有相同的：名称、 返回类型、 参数列表。
方法覆盖的原则

- 覆盖方法必须和父类中被覆盖方法具有相同的方法名称、输入参数和返回值类型。
- 覆盖方法不能使用比父类中被覆盖方法更严格的访问权限。
- 覆盖方法不能比父类中被覆盖方法抛出更多的异常

**覆盖和重载比较**

- 重载方法： 在一个类中用相同的名字创建多个方法（每个方法的参数表不同）
- 方法覆盖： 在一个类中创建的方法与父类中方法的名字、 返回类型和参数表相同，覆盖是针对两个类说的，而且必须是子类（或孙类，孙孙类等）覆盖掉父类的方法

#### 3.5 多态概念 

多态现实意义理解：现实事物经常会体现出多种形态，如学生，学生是人的一种，则一个具体的同学张三既是学生也是人，即出现两种形态。                                                                                                            

Java作为面向对象的语言，同样可以描述一个事物的多种形态。如Student类继承了Person类，一个Student的对象便既是Student，又是Person。

**多态**体现为父类引用变量可以指向子类对象。

 **前提条件**：必须有子父类关系。

注意：在使用多态后的父类引用变量调用方法时，会调用子类重写后的方法。

**定义格式**：父类类型 变量名=new 子类类型();

多态的转型分为向上转型和向下转型两种

- **向上转型**：多态本身就是向上转型过的过程
  **使用格式**：父类类型 变量名=new 子类类型();

  **适用场景**：当不需要面对子类类型时，通过提高扩展性，或者使用父类的功能就能完成相应的操作。

- **向下转型**：一个已经向上转型的子类对象可以使用强制类型转换的格式，将父类引用类型转为子类引用各类型
  **使用格式**：子类类型 变量名=（子类类型） 父类类型的变量；

​       **适用场景**：当要使用子类特有功能时。

```java
/*
对象的多态性：动物 x = new 猫();
函数的多态性：函数重载、重写
1、多态的体现
		父类的引用指向了自己的子类对象
		父类的引用也可以接收自己的对象
2、多态的前提
		必须是类与类之间只有关系，要么继承或实现
		通常还有一个前提，存在覆盖
3、多态的好处
		多态的出现大大的提高了程序的扩展性
4、多态的弊端
		只能使用父类的引用访问父类的成员
5、多态的应用
6、注意事项
*/
 
/*
需求：
猫，狗。
*/
 
abstract class Animal
{
	abstract void eat();
}
 
class Cat extends Animal
{
	public void eat()
	{
		System.out.println("吃鱼");
	}
	public void catchMouse()
	{
		System.out.println("抓老鼠");
	}
}
 
class Dog extends Animal
{
	public void eat()
	{
		System.out.println("吃骨头");
	}
	public void kanJia()
	{
		System.out.println("看家");
	}
}
 
class DuoTaiDemo
{
	public static void main(String[] args)
	{
		function(new Cat());
		function(new Dog());
		
		Animal a = new Cat();//向上转型
		a.eat();
		
		Cat c = (Cat)a;//向下转型
		c.catchMouse();
		
		
	}
	
	public static void function(Animal a)
	{
		a.eat();
		//用于子类型有限
		//或判断所属类型进而使用其特有方法
		if(a instanceof Cat)
		{
			Cat c = (Cat)a;
			c.catchMouse();
		}
		else if(a instanceof Dog)
		{
			Dog c = (Dog)a;
			c.kanJia();
		}
	}
	
}	
```



#### 3.7引用类型转换 

java的引用类型转换分为两种：

1. 向上类型转换，是小类型到大类型的转换
2. 向下类型转换，是大类型到小类型的转换

现存在一个Animal动物类，猫子类和狗子类继承于Animal父类；

```java
public class Animal {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public void eat() {
        
    }
}

public class Cat extends Animal {
    public void eatFish() {
        System.out.println("猫吃鱼");
    }
}

public class Dog extends Animal {
    public void eatBone() {
        System.out.println("狗吃骨头");
    }
}
```

 　实例化一个cat对象，如下： 

```java
 1 Cat cat1 = new Cat();   //使用子类引用实例化子类对象
 2 
 3 Animal cat2 = cat1; 
 4 //此时为向上引用转换，小类型转换为大类型，并没有风险
 5 
 6 //Cat cat3 = cat2;   //报错
 7 //由于cat2已经是Animal类的引用，所以此时为向下引用转换，即大类型转换为小类型，有数据溢出的风险
 8 //虽然有风险，但也可以强制转换
 9 Cat cat3 = (Cat)cat2;  //强制转换成功
10 
11 //Dog dog1 = cat2;         //因为子类不同所以不能这样引用
12 //Dog dog1 = (Dog)cat2; //即使强制转换也不行
```

虽然向下引用转换会存在风险，但是可以利用java的`instanceof`关键字去解决这个问题。`instanceof`运算符用法：判断是一个实例对象是否属于一个类，是返回true，否则返回false。这样我们可以优化上面的代码避免强制转换类型时出现的问题：

```java
/**  
* instanceof运算符用法  
* 运算符是双目运算符,左面的操作元是一个对象,右面是一个类.当  
* 左面的对象是右面的类创建的对象时,该运算符运算的结果是true,否则是false  
*   
* 说明:(1)一个类的实例包括本身的实例,以及所有直接或间接子类的实例  
* (2)instanceof左边操作元显式声明的类型与右边操作元必须是同种类或右边是左边父类的继承关系,  
* (3)不同的继承关系下,编译出错  
*/         
if(cat2 instanceof Dog) {
    Dog dog = (Dog)cat2;
}else {
    System.out.println("并不能转换");
}
```

   但是当子类实例对象统一放进父类引用对象数组时，若要使用子类中的方法，必须先向下转换类型为子类引用，不然编译器会报错 

```java
Animal[] animals = {
    new Cat(),
    new Dog()
};

//animals[1].eatFish();   //报错
if(animals[1] instanceof Cat) {
    Cat cat = (Cat)animals[1];
}
```

#### 3.8 再谈final关键字 

 final变量：

1. 对于基本数据类型而言，说明变量值不能改变。而对于对象引用类型而言，则说明变量不能被重新赋值，指向新的对象。但是变量所引用的对象却可以被修改。

2. 变量的值可以在编译时确定，也可以是运行时随机生成的值来初始化。

3. 一个既是static又是final的变量只占据一段不能改变的内存空间。

4. 方法的参数列表中的参数可以是final类型，但是方法体内却无法修改参数。

5. 可以将某一个变量声明成final，却不给取赋值，而这个便是'空白final‘。但是，编译器都会确保空白final在使用前必须初始化。所以既然没在定义处初始化变量，那只能在构造函数里面进行处理了。

   下面展示一个例子，说明上面说到的几点知识：

### 四： 抽象类与接口 

#### 4.1 抽象类 

 1、子类继承抽象类的话，必须覆写抽象类的所有抽象方法 

```java
abstract class LeagueOfLegendsPlayer {
    public static final String TEAM = "RNG";
    private String name = "Uzi";
    public String getName(){
        return name;
}
    public void setName(String name){
        this.name = name;
}
    public abstract print();
}
```

```java
class print extends LeagueOfLegendsPlayer{
    public void print(){
        System.out.println("TEAM:"+TEAM)
        System.out.println("name:"+name)
   }
}
```

 **抽象类的特点：** 

1. 如果一个类中有抽象方法，那么这个类一定是抽象类
2. 抽象类中不一定有抽象方法
3. 抽象类中可以存在抽象方法
4. 抽象类中可以存在构造方法
5. 抽象类中可以存在普通属性、方法、静态属性和静态方法
6. 抽象类中的抽象方法需要有子类实现，如果子类不实现，则子类也需要定义为抽象的


#### 4.2 接口概念 

**接口的特点：**

1. 接口中的方法，永远都被public来修饰

2. 接口中没有构造方法，也不能实例化接口对象
3. 接口中只有方法的声明，没有方法体
4. 接口中只有常量，如果定义变量，在编译的时候都会默认加上“public static final”
5. 接口中定义的方法都需要实现类来实现，如果实现类不能实现接口中的所有方法，则实现类需要定义为抽象类
6. 静态方法不能被子类重写（覆盖），因此接口中不定声明静态方法
7. 使用接口可以实现多继承

#### 4.3 接口声明和实现 

使用interface来定义一个接口。接口定义类似类的定义，分为接口的声明和接口体，其中接口体由常量定义和方法定义两部分组成。定义接口的**基本格式**如下： 

```java
[修饰符] interface 接口名 [extends 父接口名列表]{
[public] [static] [final] 常量;
[public] [abstract] 方法;
}
```

修饰符：可选参数public，如果省略，则为默认的访问权限；

接口名：指定接口的名称，默认情况下，接口名必须是合法的Java标示符，一般情况下，要求首字符大写；

extends  父接口名列表：可选参数，指定定义的接口继承于哪个父接口。当使用extends关键字时，父接口名为必选参数。

方法：接口中的方法只有定义而不能有实现

例如：

```java
public interface IStudent {
    final int X = 10;

    float getScore(int studentNo);

    int getStudentAge(int StudentNo);
}
```

接口的**实现**，Java实现接口，用implements：

```java
[修饰符] class <类名> [extends 父类名] [implements 接口列表]{
}
```

**修饰符：**可选参数，用于指定类的访问权限，可选值为public、abstract和final。

**类名：**必选参数，用于指定类的名称，类名必须是合法的Java标识符。一般情况下，要求首字母大写。

**extends 父类名**：可选参数，用于指定要定义的类继承于哪个父类。当使用extends关键字时，父类名为必选参数。

**implements 接口列表：**可选参数，用于指定该类实现的是哪些接口。当使用implements关键字时，接口列表为必选参数。当接口列表中存在多个接口名时，各个接口名之间使用逗号分隔。

```java
public class Cire implements CalInterface   
{  
    public float getArea(float r)   
    {  
        float area=PI*r*r;//计算圆面积并赋值给变量area  
        return area;//返回计算后的圆面积  
    }  
    public float getCircumference(float r)   
    {  
        float circumference=2*PI*r;      //计算圆周长并赋值给变量circumference  
        return circumference;           //返回计算后的圆周长  
    }  
    public static void main(String[] args)   
    {  
        Cire c = new Cire();  
        float f = c.getArea(2.0f);  
        System.out.println(Float.toString(f));  
    }  
}
```

 在类的继承中，只能做单重继承，而实现接口时，一次则可以实现多个接口，每个接口间使用逗号“,”分隔。这时就可能出现常量或方法名冲突的情况，解决该问题时，如果常量冲突，则需要明确指定常量的接口，这可以通过“接口名.常量”实现。如果出现方法冲突时，则只要实现一个方法就可以了。 

#### 4.4 接口与多继承 

- 接口是没有静态代码块或者构造方法的。
- 一个类的直接父类是唯一的，但是一个类可以同时实现多个接口。
- 接口和接口是继承关系，可以多继承。

格式：

```java
public class MyInterfaceImple implement MyInterfaceA,MyInterfaceB {  
    //覆盖抽象方法
}
```

- 如果实现类所实现的多个接口中存在重复的抽象方法，只需要覆盖一次就行，他们的要求是一样的。
- 如果实现类没有覆盖重写所有接口当中的所有抽象方法，那么实现类就必须是一个抽象类。
- 多个接口当中的默认方法如果重复。那么实现类和子接口必须进行默认方法的覆盖重写，并带着default关键字。
- 一个类直接父类中的方法，和接口当中的默认方法产生了冲突，优先用父类当中的方法。

```java
//接口MyInterfaceA
public interface MyinterfaceA {
    //错误写法，接口不能有静态代码块
//    static {
//
//    }
    //接口不能有构造方法
    public abstract  void methodA();

    public abstract  void method();

    public default  void methodDefault() {

        System.out.println("默认方法AAA");

    }
}
```

```java
//接口MyInterfaceB
public interface MyinterfaceB {

    public abstract  void methodB();

    public abstract  void method();

    public default void methodDefault() {

       System.out.println("默认方法BBB");
    }

}
```

```java
#接口的实现类MyInterfaceImple
public class MyInterfaceImple implements  MyinterfaceA ,MyinterfaceB {

    @Override

    public void methodA() {

        System.out.println("覆盖重写了A方法");

    }
    

    @Override

    public void methodB() {

        System.out.println("覆盖重写了B方法");

    }

    //对继承的多个接口的冲突方法只需要覆盖重写一次。

    @Override

    public void method() {

        System.out.println("覆盖重写A,B相同的方法。");

    }

    //对多个接口中的重名的默认方法进行覆盖重写

    @Override

    public void methodDefault() {

    }
    
}
```

```java
//子接口MyInterface,继承了接口MyInterfaceA和接口MyInterfaceB
public interface MyInterface extends MyInterfaceA,MyInterfaceB {
    @Override

    default void methodDefault() {

    }

}
```

```java
//抽象类MyAbstractImple,实现了接口MyInterfaceA和接口MyInterfaceB
//如果实现类没有覆盖重写所有接口当中的所有抽象方法，那么实现类就必须是一个抽象类。
public abstract MyAbstractImple implements MyInterfaceA,MyInterfaceB {

    @Override

    default void methodDefault() {
    }

}

```

#### 4.5 接口继承 

```java
package practice;
 
public interface A
{
 
	public void getName();
}
```

```java
package practice;
 
public interface B extends A
{
	public void getUser();
}
```

```java
package practice;
 
public class C implements B
{
 
	@Override
	public void getName()
	{
		// TODO Auto-generated method stub
 
	}
	@Override
	public void getUser()
	{
		// TODO Auto-generated method stub
 
	}
	
}
```

**关系梳理**: 接口A有个方法get Name()，接口B继承接口A,不用复写接口A的方法，写接口B自己的东西(业务)即可,当一个类C去继承B接口的时候，是需要复写两个接口中的方法的实现的——语法层

**意义**：举个都知道的东西——书。接口就是一种高度的抽象,直白点就是某种类型的行为,就是为了通用方法、一个上级接收不同下级的实例，去做各自的事情。

- 《语文》——此处的接口A

- 课本第一章——接口B

- 具体的课文——类C

  接口继承接口 就类似分级目录,梳理层次结构

#### 4.6  Java 8新特性默认方法和静态方法 

**1、默认方法**

为了提高代码的可重用性。接口的默认方法有助于在扩展系统功能的同时，不对现有的继承关系及类库产生很大的影响。例如在JDK1.8中，Java集合框架的Collection接口增加了stream()等默认方法，这些默认方法即增强了集合的功能，又能保证对低版本的JDK的兼容。

举个简单的例子，假如有一个Animal接口其中有fly()和swim()方法，有一个鸟类Bird和一个鱼类Fish同时实现这个接口，代码如下：

```java
//Animal接口
public interface Animal {
    void run();
    void swim();
}
```

```java
//Bird.java
public class Bird implements Animal {

    @Override
    public void swim() {
        // do nothing
    }

    @Override
    public void fly() {
        System.out.println("birds can fly...");
    }
}
```

```java
//Fish.java
public class Fish implements Animal {

    @Override
    public void swim() {
        System.out.println("fish can swim......");
    }

    @Override
    public void fly() {
        // donothing
    }
}
```

从上代码可以看到，因为Animal中定义了fly()和swim()方法，所以所有实现它的类都要覆写这两个方法，在Bird类中，鸟会飞，不会游泳，但是又必须要实现swim()方法，Fish类不会飞，但是又必须要实现fly()方法。代码出现冗余。

假如现在又有了新的需求，需要在Animal接口中再增加一个cry()方法，那么之前所有实现了Animal接口的方法势必都在再覆写cry()方法，整个系统中可能会有很多地方需要同步修改，而此时，default方法和静态方法就显得尤为必要了。

　　改写上面的例子：

```java
//Animal.java
public interface Animal {
    default void fly() {
        System.out.println("birds can fly...");
    }

    default void swim() {
        System.out.println("fishes can swim......");
    }
}　
```

```java
//Bird.java
public class Bird implements Animal {
}
```

```java
//Fish.java
public class Fish implements Animal {
}
```

```java
//测试类
public class TestMain {

    public static void main(String[] args) {

        Bird bird = new Bird();
        bird.fly();

        Fish fish = new Fishe();
        fish.swim();
    }
}
```

运行结果：

```java
birds can fly...
fishes can swim......
```

 从修改后代码可以看出，代码得到了复用，Animal实现类中也没有了冗余。 

**2、静态方法**

假如有一个Animal工厂接口，该接口中有一个静态方法create()专门生产不同的Animal，在JDK1.8后由于引入了Lambda表达式，使子类不用覆写该接口的create()方法也可以生产任意的Animal，代码如下：

```java
public interface AnimalFactory {
 
    static Animal create(Supplier<Animal> supplier) {
        return supplier.get();
    }
}
```

```java
//测试类
public class TestAnimalFactory {

    public static void main(String[] args) {

        // 生产一只鸟
        Animal bird = AnimalFactory.create(Bird::new);
        bird.fly();
　　　　　// 生产一条鱼
        Animal fish = AnimalFactory.create(Fishe::new);
        fish.swim();
    }
}
```

　运行结果：

```java
birds can fly...
fishes can swim......
```

**3、接口静态方法的“类优先”原则**

　　如果一个接口实现类提供了具体的实现，那么接口中具有相同名称和参数的默认方法会被忽略，如改写之前的Bird类：

```java
 public class Bird implements Animal {
 
     public void fly() {
         System.out.println("Bird类中的fly方法：birds can fly...");
     }
 }
```

```java
//测试类
public class TestMain {

    public static void main(String[] args) {

        Bird bird = new Bird();
        bird.fly();
    }
}
```

　运行结果：

```java
Bird类中的fly方法：birds can fly...
```

　可见，调用的是Bird类中自己的fly()方法而不是Animal接口中的默认方法。

**4、接口冲突**

　　假如一个类实现了两个接口，两个接口中都有同样的默认方法，哪个是有效的？

　　答案是：两个都无效！

　　该类必须要覆该方法来解决冲突，否则编译器将会报错。

#### 4.7 抽象类与接口区别 

**接口和抽象类的区别之处：**

1. 接口中所有的方法隐含都是抽象的，而抽象类则可以同时包含抽象和非抽象的方法
2. 类可以实现很多个接口，但是只能继承一个抽象类
3. 类可以不实现抽象类和接口声明的所有方法，在这种情况下，类也必须得声明成是抽象的
4. 抽象类可以在不提供接口方法实现的情况下实现接口
5. java接口中声明的变量默认都是final的，抽象类可以包含非final变量
6. java接口中的成员函数默认都是public的，抽象类中的成员函数可以是private，protected或者是public的
7. 接口是绝对抽象的，不可以被实例化。抽象类也不可以被实例化，但是如果它包含main方法的话是可以被调用的

**开发中的区别：**

-  interface表示的是"like a"关系，如同一个接口，可以预先进行开发，且不需依赖其他功能的实现
-  abstract class表示的是"is a"关系， 需要先有很多实体类然后抽象出一个抽象类来进行开发

### 五： 枚举类 

#### 5.1 枚举概述 

用法：

```java
package enumcase;

public enum SeasonEnum {
    SPRING,SUMMER,FALL,WINTER;
}
```

1. enum和class,interface的地位一样
2. 使用enum定义的枚举类默认继承了`java.lang.Enum`，而不是继承Object类。枚举类可以实现一个或多个接口。
3. 枚举类的所有实例都必须放在第一行展示，不需使用new 关键字，不需显式调用构造器。自动添加public static final修饰。
4. 使用enum定义、非抽象的枚举类默认使用final修饰，不可以被继承。
5. 枚举类的构造器只能是私有的。

#### 5.2 最简单形式的枚举类 

```java
// 创建一个枚举类
package com.lihaogn.test;
public enum SeasonEnum {
	
	// 定义四个枚举实例
	SPRING,SUMMER,AUTUMN,WINTER;

}

// 测试类
package com.lihaogn.test;
public class Test {
	public static void main(String[] args) {
		for (SeasonEnum s : SeasonEnum.values()) {
			System.out.println(s);
		}
	}
}

// result
SPRING
SUMMER
AUTUMN
WINTER
```

#### 5.3 枚举类中成员变量和成员方法 

 枚举类型有很多的成员方法，可以将枚举类型看做是一个类，它集成于java.lang.Enum类。它具有以下方法：  

| 方法名称    | 具体含义                                         | 使用方法                     |
| ----------- | ------------------------------------------------ | ---------------------------- |
| Values()    | 该方法可以将枚举类型成员以数组方式返回           | 枚举类型.values()            |
| valuesOf()  | 该方法可以实现将普通字符串转换为枚举类型         | 枚举类型名称.valuesOf("ABC") |
| compareTo() | 该方法用于比较两个枚举对象在定义时的顺序枚举队形 | 枚举对象.compareTo()         |
| Ordinal()   | 该方法用于得到枚举成员的位置索引                 | 枚举对象.ordinal()           |



```java
public class ShowEnum {
    enum Constants2{
        A,B,C ; //可以没有分号,将常量放在枚举类型中
    }
    //定以比较枚举类型的方法，参数为枚举类型
    public static void compare(Constants2 c){
        //根据values（）方法返回的数组做循环操作
        for (int i = 0; i < Constants2.values().length;i++){
            //将比较结果返回
            System.out.println(c+"与"+Constants2.values()[i]+"的比较结果:"+c.compareTo(Constants2.values()[i]));
        }
    }
    public static void main(String[] args) {
        //调用compare方法
        compare(Constants2.valueOf("B"));
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        //循环有values返回的数组
        for(int i = 0; i <Constants2.values().length;i++){
            //将枚举成员变量打印
            System.out.println("枚举成员变量为："+Constants2.values()[i]);
        }
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        for(int i = 0;i <Constants2.values().length;i++){
            //
            System.out.println(Constants2.values()[i]+"在枚举类型中的索引位置为："+Constants2.values()[i].ordinal());
        }
    }
    
}
```

运行结果：

```java
B与A的比较结果:1
B与B的比较结果:0
B与C的比较结果:-1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
枚举成员变量为：A
枚举成员变量为：B
枚举成员变量为：C
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
A在枚举类型中的索引位置为：0
B在枚举类型中的索引位置为：1
C在枚举类型中的索引位置为：2
```



```java
package com.lzw;
import static java.lang.System.*;
interface d {
    public String getDescription();
    
    public int getI();
}

public enum AnyEnum implements d {
    Constants_A { // 可以在枚举类型成员内部设置方法
        public String getDescription() {
            return ("我是枚举成员A");
        }
        
        public int getI() {
            return i;
        }
    },
    Constants_B {
        public String getDescription() {
            return ("我是枚举成员B");
        }
        
        public int getI() {
            return i;
        }
    },
    Constants_C {
        public String getDescription() {
            return ("我是枚举成员C");
        }
        
        public int getI() {
            return i;
        }
    },
    Constants_D {
        public String getDescription() {
            return ("我是枚举成员D");
        }
        
        public int getI() {
            return i;
        }
    };
    private static int i = 5;
    
    public static void main(String[] args) {
        for (int i = 0; i < AnyEnum.values().length; i++) {
            out.println(AnyEnum.values()[i] + "调用getDescription()方法为："
                    + AnyEnum.values()[i].getDescription());
            out.println(AnyEnum.values()[i] + "调用getI()方法为："
                    + AnyEnum.values()[i].getI());
        }
    }
}
```

运行结果：

```java
Constants_A调用getDescription()方法为：我是枚举成员A
Constants_A调用getI()方法为：5
Constants_B调用getDescription()方法为：我是枚举成员B
Constants_B调用getI()方法为：5
Constants_C调用getDescription()方法为：我是枚举成员C
Constants_C调用getI()方法为：5
Constants_D调用getDescription()方法为：我是枚举成员D
Constants_D调用getI()方法为：5
```



#### 5.4  枚举类构造方法 

```java
public class EnumlndexTest {
    enum Constants2 {
        Constants_A("枚举成员A"),
        Constants_B("枚举成员B"), 
        Constants_C("枚举成员C"), 
        Constants_D(3);
        private String description;
        private int i = 4;
    
        private Constants2() {

        }

        private Constants2(String description){
           this.description =  description;
       }

        private Constants2(int i) {
            this.i = this.i + i;
        }

        public String getDescription() {
            return description;
        }

        public int geti() {
            return i;
        }
    
  
  }
    public static void main(String[] args) {
     for(int i = 0;i < Constants2.values().length;i++){
         System.out.println(Constants2.values()[i]+"调用getDescription()方法为："+Constants2.values()[i].getDescription());
     }
     System.out.println(Constants2.valueOf("Constants_D")+"调用geti() 方法为："+Constants2.valueOf("Constants_D").geti());
   }
}
```

运行结果：

```java
Constants_A调用getDescription()方法为：枚举成员A
Constants_B调用getDescription()方法为：枚举成员B
Constants_C调用getDescription()方法为：枚举成员C
Constants_D调用getDescription()方法为：null
Constants_D调用get i() 方法为：7
```

分析：将枚举类型中的构造方法设置为private，防止客户代码实例化一个枚举对象

上述代码中的getDescription()方法也可以放在接口中，如下代码：

在项目中创建d接口和枚举类型的Any Enum类，在枚举类型Any Enum类中实现带方法的接口，使每个枚举类型成员实现该接口中的方法。

#### 5.5 枚举常用方法 

 **一：存放常量** 

```java
public enum EnumTest {
    RED, GREEN, BLANK, YELLOW
}
```

 **二：switch** 

```java
public class Test2 {
    public static void main(String[] args) {
        EnumTest color=EnumTest.BLANK;
        switch (color) {
            case RED:
                color = EnumTest.GREEN;
                break;
            case YELLOW:
                color = EnumTest.RED;
                break;
            case GREEN:
                color = EnumTest.YELLOW;
                break;
        }
    }
}
```

 **三：枚举中添加方法** 

```java
public enum EnumTest {
    RED("红色", 1), GREEN("绿色", 2), BLANK("白色", 3), YELLO("黄色", 4);
    private String name;
    private int index;

    // 构造方法
    private EnumTest(String name, int index) {
        this.name = name;
        this.index = index;
    }

    // 普通方法
    public static String getName(int index) {
        for (EnumTest c : EnumTest.values()) {
            if (c.getIndex() == index) {
                return c.name;
            }
        }
        return null;
    }

    // get set 方法
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }
}
```

 **四：覆盖枚举的方法** 

```java
 //覆盖方法  
    @Override  
    public String toString() {  
        return this.index+"_"+this.name;  
    } 
```

 **五：实现接口** 

```java
public interface Behaviour {  
        void print();  
        String getInfo();  
    }
    //接口方法  
    @Override  
    public String getInfo() {  
        return this.name;  
    }  
    //接口方法  
    @Override  
    public void print() {  
        System.out.println(this.index+":"+this.name);  
    }
```

 **六：使用接口组织枚举** 

```
public interface Food {  
    enum Coffee implements Food{  
        BLACK_COFFEE,DECAF_COFFEE,LATTE,CAPPUCCINO  
    }  
    enum Dessert implements Food{  
        FRUIT, CAKE, GELATO  
    }  
}
```

 **七：关于枚举的集合** 

`java.util.EnumSet`和`java.util.EnumMap`是两个枚举集合。`Enum Set`保证集合中的元素不重复；`Enum Map`中的 key是enum类型，而value则可以是任意类型。

### 六： Java常用类 

#### 6.1 toString()方法 

1. `toString()`方法在Object类里定义的，其返回值类型为String类型，返回类名和它的引用地址

2. 在进行String类与其他类型的连接操作时，自动调用`toString()`方法，demo如下

   ```java
   Date now = new Date();
   System.out.println("now = " + now);//相当于下一行代码
   System.out.println("now = " + now.toString());
   ```

   

3. 实际应用中，可以根据需要在用户自定义类型中重写`toString()`方法，如String类重写了`toString()`方法，返回字符串的值，dome如下 

   ```java
   System.out.println(s1);//相当于下一行代码
   System.out.println(s1.toString());
   ```

4. 基本数据类型转换为String类型是，调用了对应包装类的`toString()`方法，demo如下： 

   ```java
   int a = 10；
   System.out.println("a = " + a);
   ```

用例： toString（）方法将对象转换为字符串 

```java
package sample;
class Villain {
    private String name;
    protected void set(String nm) {
       name = nm;
    }
    public Villain(String name) {
       this.name = name;
    }
    public String toString() {
       return "I'm a Villain and my name is " + name;
    }
}
public class Orc extends Villain {
    private int orcNumber;
    public Orc(String name, int orcNumber) {
       super(name);
       this.orcNumber = orcNumber;
    }
    public void change(String name, int orcNumber) {
       set(name);
       this.orcNumber = orcNumber;
    }
    public String toString() {
       return "Orc" + orcNumber + ":" + super.toString();
    }
    public static void main(String[] args) {
       Orc orc = new Orc("Limburger", 12);
       System.out.println(orc);
       orc.change("Bob", 19);
       System.out.println(orc);
    }
}
```

结果：

```java
sample . Orc@11b86e7   sample .Orc@11b86e7
```

如果去掉注释，即加入2个toString（）方法后，得到

结果：

```java
Orc12:I'm a Villain and my name is Limburger  Orc19:I'm a Villain and my name is Bob
```



#### 6.2 对象比较方法 

***1、equals的作用及与==的区别。***

- equals被用来判断两个对象是否相等。
- equals通常用来比较两个对象的内容是否相等，==用来比较两个对象的地址是否相等。
- equals方法默认等同于“==”
- Object类中的equals方法定义为判断两个对象的地址是否相等（可以理解成是否是同一个对象），地址相等则认为是对象相等。这也就意味着，我们新建的所有类如果没有复写equals方法，那么判断两个对象是否相等时就等同于“==”，也就是两个对象的地址是否相等。

Object类中equals的方法实现如下：

```java
public boolean equals(Object obj) {
        return (this == obj);
    }
```

但在我们的实际开发中，通常会认为两个对象的内容相等时，则两个对象相等，equals返回true。对象内容不同，则返回false。

所以可以总结为两种情况

1、类未复写equals方法，则使用equals方法比较两个对象时，相当于==比较，即两个对象的地址是否相等。地址相等，返回true，地址不相等，返回false。

2、类复写equals方法，比较两个对象时，则走复写之后的判断方式。通常，我们会将equals复写成：当两个对象内容相同时，则equals返回true，内容不同时，返回false。

举个例子

```java
public class EqualTest {
   public static void main(String[] args) {
      Person p1 = new Person(10,"张三");
      Person p2 = new Person(10,"张三");
      System.out.println(p1.equals(p2));
      }
}
  class Person{
    int age;
    String name;
    public Person(int age, String name) {
    super();
    this.age = age;
    this.name = name;
}
  public int getAge() {
    return age;
}
  public void setAge(int age) {
  this.age = age;
}
  public String getName() {
  return name;
}
  public void setName(String name) {
    this.name = name;
    }
}
```

Person未复写equals方法，则默认使用了Object中的equals，即为两个对象（`p1`和`p2`）的内存地址判断，`p1`和`p2`很明显内存地址不同，所以输出结果很明显为false。

如果我们复写equals方法呢？我们认为名字和年龄一样的就是同一个人，那么`p1`和`p2`都表示10岁的张三，这两个对象应该是相等的。复写的equals方法如下：

```java
 @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Person other = (Person) obj;
        if (age != other.age)
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        return true;
    }
```

同样的，执行上述用例，得到的结果是true。

BTW：如果equals方法返回true，那么==是否也是true？

不一定是true。equals返回true有两种可能，一种是两个对象地址相同，一种是两个对象内容相同。当内容相同时，地址可能不同，所以==比较的结果可能为false。

我们把main方法加上对==的判断，如下：

```java
 public static void main(String[] args) {
        Person p1 = new Person(10,"张三");
        Person p2 = new Person(10,"张三");
        System.out.println(p1.equals(p2));
        System.out.println(p1 == p2);
    }
```

输出结果很明显 p 1==p 2的结果是false。

补充Java中对Equals的要求：

1.  对称性：如果x .equals(y)返回是"true"，那么`y.equals(x)`也应该返回是"true"。 
2.  反射性：`x.equals(x)`必须返回是"true"。 
3.  类推性：如果x .equals(y)返回是"true"，而且`y.equals(z)`返回是"true"，那么z .equals(x)也应该返回是"true" 。
4.  一致性：如果`x.equals(y)`返回是"true"，只要x和y内容一直不变，不管你重复`x.equals(y)`多少次，返回都是"true"。 
5.  非空性，`x.equals(null)`，永远返回是"false"；x .equals(和x不同类型的对象)永远返回是"false"。



#### 6.3 数值包装类 

 Java 中预定义了八种基本数据类型，包括：byte，int，long，double，float，boolean，char，short。基本类型与对象类型最大的不同点在于，**基本类型基于数值，对象类型基于引用**。 

基本类型的变量在栈的局部变量表中直接存储的具体数值，而对象类型的变量则存储的堆中引用。

显然，相对于基本类型的变量来说，**对象类型的变量需要占用更多的内存空间**。

上面说到，基本类型基于数值，所以基本类型是没有类而言的，是不存在类的概念的，也就是说，变量只能存储数值，而不具备操作数据的方法。对象类型则截然不同，变量实际上是某个类的实例，可以拥有属性方法等信息，不再单一的存储数值，可以提供各种各样对数值的操作方法，但代价就是牺牲一些性能并占用更多的内存空间。

之所以 Java 里没有一刀切了基本类型，就是看在基本类型占用内存空间相对较小，在计算上具有高于对象类型的性能优势，当然缺点也是不言而喻的。

所以一般都是结合两者在不同的场合下适时切换，那么 Java 中提供了哪些「包装类型」来弥补「基本类型」不具备面向对象思想的劣势呢？

| 基本类型 | 包装类    |
| -------- | --------- |
| boolean  | Boolean   |
| byte     | Byte      |
| short    | Short     |
| int      | Integer   |
| long     | Long      |
| float    | Float     |
| double   | Double    |
| char     | Character |

可以看到，除了 int 和 char 两者的包装类名变化有些大以外，其余六种基本类型对应的包装类名，都是大写了首字母而已。

下面我们以 int 和 Integer 为例，通过源码简单看看包装类具体是如何实现的。

**int 与 Integer**

首先需要明确一点的是，既然 Integer 是 int 的包装类型，那么必然 Integer 也能像 int 一样存储整型数值。

```java
/**
 * The value of the {@code Integer}.
 *
 * @serial
 */
private final int value;
```

Integer 类的内部定义了一个私有字段 value，专门用于保存一个整型数值，整个包装类就是围绕着这个 value 封装了各种不同操作的方法。

而接着我们看看如何构建一个包装类实例：

```java
public Integer(int value) {
    this.value = value;
}
```

```java
public Integer(String s) throws NumberFormatException {
    this.value = parseInt(s, 10);
}
```

Integer 类中提供两种构造器给我们构建和初始化一个 Integer 类实例。第一种比较直接，允许你直接传入一个整型数值对 value 进行初始化。第二种间接一点，允许你传入一个数字的字符串，Integer 内部会尝试着将字符串向整型数值进行转换，如果成功则初始化 value，否则将抛出一个异常。

所以我们可以通过以下代码将一个 int 类型变量转换成一个 Integer 的包装类实例：

```
int age = 22;
Integer iAge = new Integer(age);
```

 接着，我们知道使用 System.out.println 方法打印一个 Integer 实例时，虚拟机会使用 Integer 实例的 toString 方法的返回值作为打印方法的参数。

  **Integer 内部实现将一个数值转换为一个整型数值**

```java
public String toString() {
    return toString(value);
}
```

  首先，默认无参的 toString 方法会调用内部有参的另一个 toString 方法。 

```java
public static String toString(int i) {
    if (i == Integer.MIN_VALUE)
        return "-2147483648";
    int size = (i < 0) ? stringSize(-i) + 1 : stringSize(i);
    char[] buf = new char[size];
    getChars(i, size, buf);
    return new String(buf, true);
}
```

如果你的值等于 Integer .MIN_VALUE，那么直接返回预定义好的字符串即可，否则将会通过一个方法 stringSize 确定当前传入的整数 i 是一个几位的整数，也就是它需要使用几个字符进行表示，该方法的具体细节我们等会说，这是一个实现很优雅的算法。

确定了 size，于是可以创建字符数组，并通过 getChars 方法完成数值向字符串的转换，并最后构建一个字符串对象返回。

#### 6.4  Character类 

1. java中char类型占2个字节、16位可以存放汉子，字母和数字占一个字节，一个字节8位，中文占2个字节，16位；

2. char类型赋值

   ```java
   char a=’a’; //任意单个字符，加单引号。
   
   char a=’中’;//任意单个中文字，加单引号。
   
   char a=111;//整数。0~65535。十进制、八进制、十六进制均可。输出字符编码表中对应的字符
   ```

 3. Character类中的is Whitespace方法用来判断指定字符是否为空白字符，空白字符包括：空格、tab键、换行 

    ```java
            System.out.println(Character.isWhitespace('c'));
            //空格
            System.out.println(Character.isWhitespace(' '));
            //换行
            System.out.println(Character.isWhitespace('\n'));
            //tab键
            System.out.println(Character.isWhitespace('\t'));
    ```

    

 4. 字符串String类中有一个char-At方法来获取字符串中的字符

```java
        String s = "nihaoHHH换行";
        s.charAt(1);
```

#### 6.5 Boolean类 

 Java 有一种表示逻辑值的简单类型，称为布尔型。它的值只能是真或假这两个值中的一个。它是所有的诸如下面的程序说明了布尔类型的使用：  

```java
// Demonstrate boolean values. 
class BoolTest { 
  public static void main(String args[]) { 
    boolean b; 
 
    b = false; 
    System.out.println("b is " + b); 
    b = true; 
    System.out.println("b is " + b); 
    // a boolean value can control the if statement 
    if(b) System.out.println("This is executed."); 
    b = false; 
    if(b) System.out.println("This is not executed."); 
    // outcome of a relational operator is a boolean value 
    System.out.println("10 > 9 is " + (10 > 9)); 
  } 
}
```

 这个程序的运行结果如下所示：  

```java
1 b is false 2 b is true 3 This is executed. 4 10 > 9 is true  
```

 关于这个程序有3件有趣的事情要注意。首先，你已经看到，当用方法println ( ) 输出布尔的值时，显示的是“true ”或“false”。第二，布尔变量的值本身就足以用来控制if语句。没有必要将if语句写成像下面这样：  

   `if(b == true) ...`  

 第三，关系运算符（例如<）的结果是布尔值。这就是为什么表达式10>9 的显示值是“true”。此外，在表达式10>9 的两边额外的加上括号是因为加号“+”运算符比运算符“>”的优先级要高。



####  6.6 自动装箱和拆箱 

```java
 //自动装箱
 Integer total = 99;
 
 //自动拆箱
 int totalprim = total;
```

```java
package day1119;
 
public class TestBox {
    public static void main(String[] args) {
        //自动装箱，底层其实执行了Integer a=Integer.valueOf(1);
        Integer a = 1;
        //自动拆箱，底层其实执行了int b=a.intValue();
        int b = a;
    }
}
```

Integer的`valueOf（int i）`方法可以将一个基本数据类型转化为对应的包装类型，即装箱方法。

而Integer的`intValue（）`方法则可以将一个包装类型转化为对应的基本数据类型，即拆箱方法。

**装箱与自动装箱的区别**
        **装箱**：利用Integer的构造方法`Integer（int value）`，即`Integer c=new Integer(1);`

**自动装箱**：或者叫隐式装箱，直接给Integer赋值，即Integer d=1,在编译的时候，会调用`Integer.valueOf（）`方法完成装箱。

相比而言，自动装箱可能比装箱具有更高的效率，体现在自动装箱的缓存上，下面从几道题目来讲自动装箱的缓存。

#### 6.7 Math类 

 Java的Math类封装了很多与数学有关的属性和方法。

```java
private void mathMethod(){
 
        /**
         * Math.sqrt()//计算平方根
         * Math.cbrt()//计算立方根
         * Math.hypot(x,y)//计算 (x的平方+y的平方)的平方根
         */
 
        Log.d("TAG","Math.sqrt(16)----:"+Math.sqrt(16));//4.0
        Log.d("TAG","Math.cbrt(8)----:"+Math.cbrt(8));//2.0
        Log.d("TAG","Math.hypot(3,4)----:"+Math.hypot(3,4));//5.0
 
        /**
         * Math.pow(a,b)//计算a的b次方
         * Math.exp(x)//计算e^x的值
         * */
 
        Log.d("TAG","------------------------------------------");
        Log.d("TAG","Math.pow(3,2)----:"+Math.pow(3,2));//9.0
        Log.d("TAG","Math.exp(3)----:"+Math.exp(3));//20.085536923187668
 
        /**
         * Math.max();//计算最大值
         * Math.min();//计算最小值
         * */
 
        Log.d("TAG","------------------------------------------");
        Log.d("TAG","Math.max(2.3,4.5)----:"+Math.max(7,15));//15
        Log.d("TAG","Math.min(2.3,4.5)----:"+Math.min(2.3,4.5));//2.3
 
        /**
         * Math.abs求绝对值
         */
 
        Log.d("TAG","------------------------------------------");
        Log.d("TAG","Math.abs(-10.4)----:"+Math.abs(-10.4));//10.4
        Log.d("TAG","Math.abs(10.1)----:"+Math.abs(10.1));//10.1
 
        /**
         * Math.ceil天花板的意思，就是返回大的值
         */
 
        Log.d("TAG","------------------------------------------");
        Log.d("TAG","Math.ceil(-10.1)----:"+Math.ceil(-10.1));//-10.0
        Log.d("TAG","Math.ceil(10.7)----:"+Math.ceil(10.7));//11.0
        Log.d("TAG","Math.ceil(-0.7)----:"+Math.ceil(-0.7));//-0.0
        Log.d("TAG","Math.ceil(0.0)----:"+Math.ceil(0.0));//0.0
        Log.d("TAG","Math.ceil(-0.0)----:"+Math.ceil(-0.0));//-0.0
        Log.d("TAG","Math.ceil(-1.7)----:"+Math.ceil(-1.7));//-1.0
 
        /**
         * Math.floor地板的意思，就是返回小的值
         */
 
        Log.d("TAG","------------------------------------------");
        Log.d("TAG","Math.floor(-10.1)----:"+Math.floor(-10.1));//-11.0
        Log.d("TAG","Math.floor(10.7)----:"+Math.floor(10.7));//10.0
        Log.d("TAG","Math.floor(-0.7)----:"+Math.floor(-0.7));//-1.0
        Log.d("TAG","Math.floor(0.0)----:"+Math.floor(0.0));//0.0
        Log.d("TAG","Math.floor(-0.0)----:"+Math.floor(-0.0));//-0.0
 
        /**
         * Math.random 取得一个大于或者等于0.0小于不等于1.0的随机数[0,1)
         */
 
        Log.d("TAG","------------------------------------------");
        Log.d("TAG","Math.random()----:"+Math.random());//输出[0,1)间的随机数 0.8979626325354049
        Log.d("TAG","Math.random()*100----:"+Math.random()*100);//输出[0,100)间的随机数 32.783762836248144
 
        /**
         * Math.rint 四舍五入
         * 返回double值
         */
 
        Log.d("TAG","------------------------------------------");
        Log.d("TAG","Math.rint(10.1)----:"+Math.rint(10.1));//10.0
        Log.d("TAG","Math.rint(10.7)----:"+Math.rint(10.7));//11.0
        Log.d("TAG","Math.rint(-10.5)----:"+Math.rint(-10.5));//-10.0
        Log.d("TAG","Math.rint(-10.51)----:"+Math.rint(-10.51));//-11.0
        Log.d("TAG","Math.rint(-10.2)----:"+Math.rint(-10.2));//-10.0
        Log.d("TAG","Math.rint(9)----:"+Math.rint(9));//9.0
 
 
        /**
         * Math.round 四舍五入
         * float时返回int值，double时返回long值
         */
 
        Log.d("TAG","------------------------------------------");
        Log.d("TAG","Math.round(10.1)----:"+Math.round(10.1));//10
        Log.d("TAG","Math.round(10.7)----:"+Math.round(10.7));//11
        Log.d("TAG","Math.round(-10.5)----:"+Math.round(-10.5));//-10
        Log.d("TAG","Math.round(-10.51)----:"+Math.round(-10.51));//-11
        Log.d("TAG","Math.round(-10.2)----:"+Math.round(-10.2));//-10
        Log.d("TAG","Math.round(9)----:"+Math.round(9));//9
 
        /**
         * Math.nextUp(a) 返回比a大一点点的浮点数
         * Math.nextDown(a) 返回比a小一点点的浮点数
         * Math.nextAfter(a,b) 返回(a,b)或(b,a)间与a相邻的浮点数 b可以比a小
         * */
 
        Log.d("TAG","------------------------------------------");
        Log.d("TAG","Math.nextUp(1.2)----:"+Math.nextUp(1.2));//1.2000000000000002
        Log.d("TAG","Math.nextDown(1.2)----:"+Math.nextDown(1.2));//1.1999999999999997
        Log.d("TAG","Math.nextAfter(1.2, 2.7)----:"+Math.nextAfter(1.2, 2.7));//1.2000000000000002
        Log.d("TAG","Math.nextAfter(1.2, -1)----:"+Math.nextAfter(1.2, -1));//1.1999999999999997
 
    }
```

```java
Math.sqrt(16)----:4.0
Math.cbrt(8)----:2.0
Math.hypot(3,4)----:5.0
------------------------------------------
Math.pow(3,2)----:9.0
Math.exp(3)----:20.085536923187668
------------------------------------------
Math.max(2.3,4.5)----:15
Math.min(2.3,4.5)----:2.3
------------------------------------------
Math.abs(-10.4)----:10.4
Math.abs(10.1)----:10.1
------------------------------------------
Math.ceil(-10.1)----:-10.0
Math.ceil(10.7)----:11.0
Math.ceil(-0.7)----:-0.0
Math.ceil(0.0)----:0.0
Math.ceil(-0.0)----:-0.0
Math.ceil(-1.7)----:-1.0
------------------------------------------
Math.floor(-10.1)----:-11.0
Math.floor(10.7)----:10.0
Math.floor(-0.7)----:-1.0
Math.floor(0.0)----:0.0
Math.floor(-0.0)----:-0.0
------------------------------------------
Math.random()----:0.8979626325354049
Math.random()*100----:32.783762836248144
------------------------------------------
Math.rint(10.1)----:10.0
Math.rint(10.7)----:11.0
Math.rint(-10.5)----:-10.0
Math.rint(-10.51)----:-11.0
Math.rint(-10.2)----:-10.0
Math.rint(9)----:9.0
------------------------------------------
Math.round(10.1)----:10
Math.round(10.7)----:11
Math.round(-10.5)----:-10
Math.round(-10.51)----:-11
Math.round(-10.2)----:-10
Math.round(9)----:9
------------------------------------------
Math.nextUp(1.2)----:1.2000000000000002
Math.nextDown(1.2)----:1.1999999999999997
Math.nextAfter(1.2, 2.7)----:1.2000000000000002
Math.nextAfter(1.2, -1)----:1.1999999999999997
```

#### 6.8 大数值 

在 Java 中提供了大数字的操作类，即 `java.math.BigInteger` 类与  `java.math.BigDecimal` 类。这两个类用于高精度计算，体重 BigInteger 类是针对大整数的处理类，而  `BigDecimal`  类则是针对大小数的处理类。

1.1   BigInteger 

BigInteger  类型的数字范围较 Integer 类型的数字范围要大得多。 Integer 是 int 的包装类， int 的最大值是 2³¹-1 ，如果要计算更大的数字，使用 Integer 数据类型就无法实现了，所以 Java 中提供了 BigInteger 类来处理更大的数字。 BigInteger 支持任意精度的整数，也就是说在运算中 BigInteger 类型可以准确地表示任何大小的整数值而不会丢失任何信息。

在 BigInteger 类中封装了多种操作，除了基本的加、减、乘、除操作之外，还提供了绝对值、相反数、最大公约数以及判断是否为质数等操作。

使用 BigInteger 类，可以实例化一个 BigInteger 对象，并自动调用相应的构造函数。 BigInteger 类具有很多构造函数，但最直接的一种方式是参数以字符串形式代表要处理的数字。

语法如下 ：

```java
public BigInteger(String val)
```

 其中 ， val 是十进制字符串。

  如果将 2 转换为 BigInteger 类型，可以使用一下语句进行初始化操作 ：

```java
BigInteger twoInstance = new BigInteger("2");     //将十进制 2 转换为 BigInteger 形式
```

参数 2 的双引号不能省略，因为参数是以字符串的形式存在的。

  一旦创建了对象实例，就可以调用 BigInteger 类中的一些方法进行运算操作，包括基本的数学运算和位运算以及一些取相反数、取绝对值等操作。下面列举几种常用运算方法 ：

```java
（ 1 ） public BigInteger add(BigInteger val)  ：                     做加法运算
（ 2 ） public BigInteger subtract(BigInteger val)  ：                做减法运算
（ 3 ） public BigInteger multiply(BigInteger val)  ：                做乘法运算
（ 4 ） public BigInteger divide(BigInteger val)  ：                  做除法运算
（ 5 ） public BigInteger remainder(BigInteger val)  ：               做取余运算
（ 6 ） public BigInteger[] divideAndRemainder (BigInteger val)  ：   用数组返回余数和商，结果数组中第一个值为商，第二个值为余数
（ 7 ） public BigInteger pow(int exponent)  ：                       进行取参数的 exponent 次方操作
（ 8 ） public BigInteger negate()  ：                                取相反数
（ 9 ） public BigInteger shiftLeft(int n)  ：                        将数字左移 n 位，如果 n 为负数，做右移操作
（ 10 ）public BigInteger shiftRight(int n)  ：                       将数字右移 n 位，如果 n 为负数，做左移操作
（ 11 ）public BigInteger and(BigInteger val) ：                      做与操作
（ 12 ）public BigInteger or(BigInteger val)  ：                      做或操作
（ 13 ）public int compareTo(BigInteger val)  ：                      做数字比较操作
（ 14 ）public boolean equals(Object x)  ：                           当参数 x 是 BigInteger 类型的数字并且数值相等时，返回 true 
（ 15 ）public BigInteger min(BigInteger val)   ：                    返回较小的数值
（ 16 ）public BigInteger max(BigInteger val)   ：                    返回较大的数值
```

   eg ： 创建类，在类的主方法中创建 BigInteger 类的实例对象，调用该对象的各种方法实现大整数的加、减、乘、除和其他运算，并输出运算结果。 

```java
import java.math.BigInteger;
public class BigIntegerDemo {
    public static void main(String[] args) {
        BigInteger bigInteger = new BigInteger("4");//实例化一个大数字
        System.out.println("加法操作：" + bigInteger.add(new BigInteger("2")));
        System.out.println("减法操作：" + bigInteger.subtract(new BigInteger("2")));
        System.out.println("乘法操作：" + bigInteger.multiply(new BigInteger("2")));
        System.out.println("除法操作：" + bigInteger.divide(new BigInteger("2")));
        System.out.println("取商操作：" + bigInteger.divideAndRemainder(new BigInteger("3"))[0]);
        System.out.println("取余数操作：" + bigInteger.divideAndRemainder(new BigInteger("3"))[1]);
        System.out.println("做 2 次方操作：" + bigInteger.pow(2));
        System.out.println("取相反数操作：" + bigInteger.negate());
    }
}
```

 运行结果为 ： 

```java
加法操作：6
减法操作：2
乘法操作：8
除法操作：2
取商操作：1
取余数操作：1
做 2 次方操作：16
取相反数操作：-4
```

 1.2  `BigDecimal`

`BigDecima`l 和  `BigInteger` 都能用来实现大数字的运算，不同的是 `BigDecimal` 加入了小数的概念。一般的 float 型和 double 型数据只可以用来做科学计算或工程计算，但由于在商业计算中要求数字精度比较高，所以要用到 `java.math.BigDecimal` 类。 ~类支持任何精度的定点数，可以用它来精确计算货币值。

在 Big Decimal 类中常用的两个构造方法如下 ：

```java
public BigDecimal(double val) :    实例化时将双精度型转换为 BigDecimal 类型
public BigDecimal(String val) :    实例化时将字符串形式转换为 BigDecimal 类型
```

  `BigDecimal` 类型的数字可以用来做超大的浮点数的运算，如加、减、乘、除等，但是在所有的运算中除法是最复杂的，因为在除不尽的情况下末位小数点的处理是需要考虑的。

  下面列举 Big Decimal 类中实现加、减、乘、除的方法 ：

```java
public BigDecimal add(BigDecimal augend) ：做加法操作
public BigDecimal subtract(BigDecimal subtrahend) ：做减法操作
public BigDecimal multiply(BigDecimal multiplicand) ：做乘法操作
public BigDecimal divide(BigDecimal divisor , int sacle ,int roundingMode) ：做除法操作，方法中 3 个参数分别代表除数、商的小数点后的位数、近似处理模式
```

  在上述方法中，Big Decimal 类中 divide() 方法有多种设置，用于返回商末位小数点的处理，这些模式的名称与含义如下 ：             

​                                  Big Decimal 类中 divide() 方法的多种处理模式 

| 模式                         | 含义                                                         |
| ---------------------------- | ------------------------------------------------------------ |
| Big Decimal. ROUND_UP        | s商的最后一位如果大于 0 ，则向前进位，正负数都如此           |
| Big Decimal .ROUND_DOWN      | 商的最后一位无论是什么数字都省略                             |
| Big Decimal .ROUND_CEILING   | 商如果是正数，按照 ROUND_UP 模式处理,如果是负数，按照 ROUND_DOWN 模式处理。这种模式的处理都会使近似值大于等于实际值。 |
| Big Decimal .ROUND_FLOOR     | 与 ROUND_CEILING 模式相反，商如果是正数，按照 ROUND_DOWN 模式处理；如果是负数，按照ROUND_UP 模式处理。这种模式的处理都会使近似值小于等于实际值。 |
| Big Decimal .ROUND_HALF_DOWN | 对商进行四舍五入操作，如果商最后一位小于等于 5，则做舍弃操作；如果最后一位大于 5 ，则做进位操作，如 7.5 ≈ 7 |
| Big Decimal .ROUND_HALF_UP   | 对商进行四舍五入操作，如果商的最后一位小于 5 则舍弃；如果大于等于 5 ，进行进位操作，如 7.5 ≈ 8 |
| Big Decimal ROUND_HALF_EVEN  | 如果商的倒数第二位为奇数，则按照 ROUND_HALF_UP 处理；如果为偶数，则按照 ROUND_HALF_DOWN 处理，如 7.5 ≈ 8 , 8.5 ≈ 8 |

 eg ： 创建类，在类中分别定义 add() 、sub() 、mul() 和 div() 方法实现加、减、乘、除运算，并输出运算结果。 

```java
import java.math.BigDecimal;
public class BigDecimalDemo {
    static final int location = 10;
    /**
     * 定义加法方法，参数为加数与被加数
     * @param value1 相加的第一个数
     * @param value2 相加的第二个数
     * @return 两数之和
     */
    public BigDecimal add(double value1 , double value2) {
	//实例化 Decimal 对象
        BigDecimal b1 = new BigDecimal(Double.toString(value1));
        BigDecimal b2 = new BigDecimal(Double.toString(value2));
        return b1.add(b2);        //调用加法方法
    }
    /**
     * 定义减法方法，参数为减数与被减数
     * @param value1 被减数
     * @param value2 减数
     * @return 运算结果
     */
    public BigDecimal sub(double value1 , double value2) {
	//实例化 Decimal 对象
        BigDecimal b1 = new BigDecimal(Double.toString(value1));
        BigDecimal b2 = new BigDecimal(Double.toString(value2));
        return b1.subtract(b2);        //调用减法方法
    }
    /**
     * 定义乘法方法，参数为乘数与被乘数
     * @param value1 第一个乘数
     * @param value2 第二个乘数
     * @return 运算结果
     */
    public BigDecimal mul(double value1 , double value2) {
    	//实例化 Decimal 对象
        BigDecimal b1 = new BigDecimal(Double.toString(value1));
        BigDecimal b2 = new BigDecimal(Double.toString(value2));
        return b1.multiply(b2);        //调用乘法方法
    }
    /**
     * 定义除法方法，参数为除数与被除数
     * @param value1 被除数
     * @param value2 除数
     * @return 运算结果
     */
    public BigDecimal div(double value1 , double value2) {
        return div(value1, value2,location);//调用自定义除法方法
    }
    public BigDecimal div(double value1 , double value2 ,int b) {
        if (b<0) {
	    System.out.println("b 值必须大于等于 0");
        }
        BigDecimal b1 = new BigDecimal(Double.toString(value1));
        BigDecimal b2 = new BigDecimal(Double.toString(value2));
        //调用除法方法，商小数点保留 b 位，并将结果进行四舍五入操作
        return b1.divide(b2,b,BigDecimal.ROUND_HALF_UP);
    }
    public static void main(String[] args) {
        BigDecimalDemo b = new BigDecimalDemo();
        System.out.println("两个数字相加结果：" + b.add(-7.5, 8.9));
        System.out.println("两个数字相减结果：" + b.sub(-7.5, 8.9));
        System.out.println("两个数字相乘结果：" + b.mul(-7.5, 8.9));
        System.out.println("两个数字相除结果，结果小数后保留 10 位：" + b.div(10,2));
        System.out.println("两个数字相除，保留小数后 5 位：" + b.div(-7.8,8.9,5));
    }
}
```

   运行结果为：

```java
两个数字相加结果：1.4
两个数字相减结果：-16.4
两个数字相乘结果：-66.75
两个数字相除结果，结果小数后保留 10 位：5.0000000000
两个数字相除，保留小数后 5 位：-0.87640
```

#### 6.9 Date类 

1、 Date(int year, int month, int date); 直接写入年份是得不到正确的结果的。 因为java中Date是从1900年开始算的，所以前面的第一个参数只要填入从1900年后过了多少年就是你想要得到的年份。 月需要减1，日可以直接插入。 这种方法用的比较少，常用的是第二种方法。

2、 这种方法是将一个符合特定格式，比如yyyy-MM-dd,的字符串转化成为Date类型的数据。 首先，定义一个Date类型的对象 Date date = null; 再定义一个String类型的符合格式的字符串 `String dateStr = "2010-9-10";` 把这个字符串进行拆分 `String[ ]  dateDivide = dateStr.split("-");` 把年月日分别取出，赋给Calendar，用 Calendar的`getTime()`;取得日期再赋给date。

```java
import java.util.Calendar;

import java.util.Date;

 

public class Main4 {

 

/**

 * @param args

 */

  public static void main(String[] args) {

  Date date=null;

  String dateStr="2010-9-10";

  String[] dateDivide=dateStr.split("-");

    if(dateDivide.length==3){

       int year = Integer.parseInt(dateDivide [0].trim());//去掉空格
 
       int month = Integer.parseInt(dateDivide [1].trim());

       int day = Integer.parseInt(dateDivide [2].trim());

       Calendar c = Calendar.getInstance();//获取一个日历实例

       c.set(year, month-1, day);//设定日历的日期

       date = c.getTime();

      }

      System.out.println(date);
   } 
   
}

```

**Date类型的比较**

Date a;   Date b;

假设现在你已经实例化了a和b

`a.after(b)`返回一个boolean，如果a的时间在b之后（不包括等于）返回true

`b.before(a)`返回一个boolean，如果b的时间在a之前（不包括等于）返回true

`a.equals(b)`返回一个boolean,如果a的时间和b相等返回true

```java
import java.text.SimpleDateFormat;

import java.util.Calendar;

import java.util.Date;

 

public class Main4 {

 

  /**

   * @param args

  */

  public static void main(String[] args) {

  //Date date=null;

  //String dateStr="2010-9-10";

  //String[] dateDivide=dateStr.split("-");

  //if(dateDivide.length==3){

  //         int year = Integer.parseInt(dateDivide [0].trim());//去掉空格

  //     int month = Integer.parseInt(dateDivide [1].trim());

  //     int day = Integer.parseInt(dateDivide [2].trim());

  //     Calendar c = Calendar.getInstance();//获取一个日历实例

  //     c.set(year, month-1, day);//设定日历的日期

  //     date = c.getTime();

  //}

  //            System.out.println(date);

  //Date类型常用的操作函数
 
  //1.-----计算某一个月份的最大天数

  Calendar calendar=Calendar.getInstance();

  //使用set方法之前必须先clear一下，否则很多信息会继承自系统当前时间

  //calendar.clear();

  //calendar.set(Calendar.YEAR,2018);

  //calendar.set(Calendar.MONTH,3-1);

  //int day=calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

  // 2.------Calendar和Date的转化

  //-----Calendar转化为Date--

  Date date=calendar.getTime();

  System.out.println(date);//Sat Mar 24 11:39:55 CST 2018

    //-----Date转化为Calendar--

  Date date1=new Date();

  Calendar calendar1=Calendar.getInstance();

  calendar1.setTime(date1);

  //3.----计算一年中的第几星期是几号

  SimpleDateFormat df=new SimpleDateFormat();

  Calendar calen=Calendar.getInstance();

  calen.set(Calendar.YEAR,2018);

  calen.set(Calendar.WEEK_OF_YEAR,4);

  calen.set(Calendar.DAY_OF_WEEK,4);

  System.out.println(df.format(calen.getTime()));

  //add方法

  SimpleDateFormat dff=new SimpleDateFormat("yyyy-MM-dd");

  Calendar calll=Calendar.getInstance();

  calll.set(Calendar.YEAR,2018);

  calll.set(Calendar.MONTH,4);

  calll.set(Calendar.DAY_OF_MONTH,24);

  calll.add(Calendar.DATE,-4);

  Date dateee=calll.getTime();

  System.out.println(dff.format(dateee));

  calll.add(Calendar.DAY_OF_MONTH,-4);

  //calll.add(Calendar.DATE,-4); 相等

  Date datee1=calll.getTime();

  System.out.println(dff.format(datee1));

  }

}
```

#### 6.11 Calendar类 

**获取时间**

```java
    // 使用默认时区和语言环境获得一个日历
    Calendar cal = Calendar.getInstance();
    // 赋值时年月日时分秒常用的6个值，注意月份下标从0开始，所以取月份要+1
    System.out.println("年:" + cal.get(Calendar.YEAR));
    System.out.println("月:" + (cal.get(Calendar.MONTH) + 1));       
    System.out.println("日:" + cal.get(Calendar.DAY_OF_MONTH));
    System.out.println("时:" + cal.get(Calendar.HOUR_OF_DAY));
    System.out.println("分:" + cal.get(Calendar.MINUTE));
    System.out.println("秒:" + cal.get(Calendar.SECOND));
```

 今天是 2018 年 2 月 12 日，运行结果： 

```java
年:2018
月:2
日:12
时:15
分:57
秒:39
```

**设置时间**

 月份的下标从 0 开始，设置时同样需要注意，比如我们设置为 2 月 15 日除夕当晚的倒计时的最后一秒：2018-02-15 23:59:59
可以这样： 

```java
    // 或者6个字段分别进行设置，由于月份下标从0开始赋值月份要-1
    cal.set(Calendar.YEAR, 2018);
    cal.set(Calendar.MONTH, Calendar.FEBRUARY);
    cal.set(Calendar.DAY_OF_MONTH, 15);
    cal.set(Calendar.HOUR_OF_DAY, 23);
    cal.set(Calendar.MINUTE, 59);
    cal.set(Calendar.SECOND, 59);
    System.out.println(cal.getTime());
```

 打印的时间结果为： 

```java
    Thu Feb 15 23:59:59 CST 2018
```

时间计算
add方法：
比如在除夕当晚最后一秒，add 一秒：

    Calendar cal = Calendar.getInstance();
    System.out.println(cal.getTime());
    cal.set(2018, 1, 15, 23, 59, 59);
    cal.add(Calendar.SECOND, 1);
    System.out.println(cal.getTime());

打印时间结果如下，日期会自动进入下一天：

    Thu Feb 15 23:59:59 CST 2018
    Fri Feb 16 00:00:00 CST 2018

再比如 1 月 31 号的时候，月份加一，会出现怎样结果：

    Calendar cal = Calendar.getInstance();
    cal.set(2018, 1, 31, 8, 0, 0);
    System.out.println(cal.getTime());
    cal.add(Calendar.MONTH, 1);
    System.out.println(cal.getTime());

运行结果：

    Wed Jan 31 08:00:00 CST 2018
    Wed Feb 28 08:00:00 CST 2018

说明 add 月份时，会将不存在的日期归为当月日历的最后一天。

#### 6.12 Java 8新日期时间相关类 

```java
package org.jsirenia.date;

import java.io.Serializable;
import java.time.DayOfWeek;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
/**
 * java日期api用起来不够简洁，而且有些用法比较难记。
 * 所以做一些封装，应付常用场景。
 * 这个类有点“上帝类“的感觉，但是真的方便啊，比起java自带的难记的api。
 * @author Administrator
 *
 */
public class MyDateTime implements  Comparable<MyDateTime>, Serializable {
	private static final long serialVersionUID = 1L;
	private static final ZoneId zone = ZoneId.systemDefault();
	private static final ZoneOffset zoneOffset = ZoneOffset.UTC;
	private LocalDateTime dt;
	private static final Map<String,DateTimeFormatter> formatters = new ConcurrentHashMap<>();
	//第一部分：构造
	public static MyDateTime now(){
		return fromLocalDateTime(LocalDateTime.now());
	}
	public static MyDateTime yesterday(){
		return now().plusDays(-1);
	}
	public static MyDateTime tomorrow(){
		return now().plusDays(1);
	}
	public static MyDateTime fromLocalDateTime(LocalDateTime dt){
		MyDateTime d = new MyDateTime();
		d.dt = dt;
		return d;
	}
	public static MyDateTime of(int year,int month,int dayOfMonth,int hour,int minute,int second,int millisecond,int nanoOfSecond){
		LocalDateTime dt = LocalDateTime.of(year, month, dayOfMonth, hour, minute, millisecond, nanoOfSecond);
		return fromLocalDateTime(dt);
	}
	public static MyDateTime of(int year,int month,int dayOfMonth,int hour,int minute,int second,int millisecond){
		return of(year,month,dayOfMonth,hour,minute,second,millisecond,0);
	}
	public static MyDateTime of(int year,int month,int dayOfMonth,int hour,int minute,int second){
		return of(year,month,dayOfMonth,hour,minute,second,0,0);
	}
	public static MyDateTime of(int year,int month,int dayOfMonth,int hour,int minute){
		return of(year,month,dayOfMonth,hour,minute,0,0,0);
	}
	public static MyDateTime of(int year,int month,int dayOfMonth,int hour){
		return of(year,month,dayOfMonth,hour,0,0,0,0);
	}
	public static MyDateTime of(int year,int month,int dayOfMonth){
		return of(year,month,dayOfMonth,0,0,0,0,0);
	}
	public static MyDateTime of(LocalDate localDate,LocalTime localTime){
		return fromLocalDateTime(localTime.atDate(localDate));
	}
	public static MyDateTime ofInstant(Instant instant){
		return fromLocalDateTime(LocalDateTime.ofInstant(instant, zone));
	}
	public static MyDateTime ofEpochSecond(long epochSecond){
		return ofInstant(Instant.ofEpochSecond(epochSecond));
	}
	public static MyDateTime ofEpochMilli(long epochMilli) {
		return ofInstant(Instant.ofEpochMilli(epochMilli));
	}
	public static MyDateTime ofEpochSecond(long epochSecond, int nanoOfSecond){
		return ofInstant(Instant.ofEpochSecond(epochSecond,nanoOfSecond));
	}
	//第二部分：解析
	public static MyDateTime parseDateTime(String text){
		return fromLocalDateTime(LocalDateTime.parse(text));
	}
	public static MyDateTime parseDateTime(String text,String pattern){
		DateTimeFormatter format = findFormatter(pattern);
		return fromLocalDateTime(LocalDateTime.parse(text,format));
	}
	public static MyDateTime parseDate(String text){
		return fromLocalDateTime(LocalDate.parse(text).atStartOfDay());
	}
	public static MyDateTime parseDate(String text,String pattern){
		DateTimeFormatter format = findFormatter(pattern);
		return fromLocalDateTime(LocalDate.parse(text,format).atStartOfDay());
	}
	public static MyDateTime parseTime(String text){
		return fromLocalDateTime(LocalDate.now().atTime(LocalTime.parse(text)));
	}
	public static MyDateTime parseTime(String text,String pattern){
		DateTimeFormatter format = findFormatter(pattern);
		return fromLocalDateTime(LocalDate.now().atTime(LocalTime.parse(text,format)));
	}
	//第三部分：格式化
	public String formatDate(){
		return dt.toLocalDate().toString();
	}
	public String formatDate(String pattern){
		DateTimeFormatter format = findFormatter(pattern);
		return dt.toLocalDate().format(format);
	}
	public String formatDateTime(){
		return dt.toString();
	}
	public String formatDateTime(String pattern){
		DateTimeFormatter format = findFormatter(pattern);
		return dt.format(format);
	}
	public String formatTime(){
		return dt.toLocalTime().toString();
	}
	public String formatTime(String pattern){
		DateTimeFormatter format = findFormatter(pattern);
		return dt.toLocalTime().format(format);
	}
	//第四部分：转换成java日期
	public LocalDate toLocalDate(){
		return dt.toLocalDate();
	}
	public LocalTime toLocalTime(){
		return dt.toLocalTime();
	}
	public Instant toInstant(){
		return dt.toInstant(zoneOffset);
	}
	public Date toDate(){
		return Date.from(dt.toInstant(zoneOffset));
	}
	public LocalDateTime toLocalDateTime(){
		return dt;
	}
	//第五部分：计算
	public MyDateTime plusDays(int days){
		return fromLocalDateTime(dt.plusDays(days));
	}
	public MyDateTime plusYears(int years){
		return fromLocalDateTime(dt.plusYears(years));
	}
	public MyDateTime plusWeeks(int weeks){
		return fromLocalDateTime(dt.plusWeeks(weeks));
	}
	public MyDateTime plusMonths(int months){
		return fromLocalDateTime(dt.plusMonths(months));
	}
	public MyDateTime plusHours(int hours){
		return fromLocalDateTime(dt.plusHours(hours));
	}
	public MyDateTime plusMinutes(int minutes){
		return fromLocalDateTime(dt.plusMinutes(minutes));
	}
	public MyDateTime plusSeconds(int seconds){
		return fromLocalDateTime(dt.plusSeconds(seconds));
	}
	public MyDateTime plusNanos(int nanos){
		return fromLocalDateTime(dt.plusNanos(nanos));
	}
	//第六部分：调整值
	public MyDateTime previousOrSameMonday(){
		return fromLocalDateTime(dt.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY)));
	}
	public MyDateTime previousOrSameTuesday(){
		return fromLocalDateTime(dt.with(TemporalAdjusters.previousOrSame(DayOfWeek.TUESDAY)));
	}
	public MyDateTime previousOrSameWendesday(){
		return fromLocalDateTime(dt.with(TemporalAdjusters.previousOrSame(DayOfWeek.WEDNESDAY)));
	}
	public MyDateTime previousOrSameThursday(){
		return fromLocalDateTime(dt.with(TemporalAdjusters.previousOrSame(DayOfWeek.THURSDAY)));
	}
	public MyDateTime previousOrSameFriday(){
		return fromLocalDateTime(dt.with(TemporalAdjusters.previousOrSame(DayOfWeek.FRIDAY)));
	}
	public MyDateTime previousOrSameSaturday(){
		return fromLocalDateTime(dt.with(TemporalAdjusters.previousOrSame(DayOfWeek.SATURDAY)));
	}
	public MyDateTime previousOrSameSunday(){
		return fromLocalDateTime(dt.with(TemporalAdjusters.previousOrSame(DayOfWeek.SUNDAY)));
	}
	public MyDateTime previousOrSameWeekDay(DayOfWeek dayOfWeek){
		return fromLocalDateTime(dt.with(TemporalAdjusters.previousOrSame(dayOfWeek)));
	}
	public MyDateTime withYear(int year){
		return fromLocalDateTime(dt.withYear(year));
	}
	public MyDateTime withMonth(int month){
		return fromLocalDateTime(dt.withMonth(month));
	}
	public MyDateTime withDayOfMonth(int dayOfMonth){
		return fromLocalDateTime(dt.withDayOfMonth(dayOfMonth));
	}
	public MyDateTime withDayOfYear(int dayOfYear){
		return fromLocalDateTime(dt.withDayOfYear(dayOfYear));
	}
	public MyDateTime withHour(int hour){
		return fromLocalDateTime(dt.withHour(hour));
	}
	public MyDateTime withMinute(int minute){
		return fromLocalDateTime(dt.withMinute(minute));
	}
	public MyDateTime withSecond(int second){
		return fromLocalDateTime(dt.withSecond(second));
	}
	public MyDateTime withNanoOfSecond(int nanoOfSecond){
		return fromLocalDateTime(dt.withNano(nanoOfSecond));
	}
	//第七部分：时间段
	public long daysBetween(MyDateTime date){
		return dt.toLocalDate().toEpochDay()-date.dt.toLocalDate().toEpochDay();
	}
	public long secondsBetween(MyDateTime date){
		return dt.toEpochSecond(zoneOffset)-date.dt.toEpochSecond(zoneOffset);
	}
	//第八部分：比较
	public boolean isBefore(MyDateTime date){
		return dt.isBefore(date.dt);
	}
	public boolean isAfter(MyDateTime date){
		return dt.isAfter(date.dt);
	}
	public boolean isEqual(MyDateTime date){
		return dt.isEqual(date.dt);
	}
	public int compareTo(MyDateTime date) {
		return dt.compareTo(date.dt);
	}
	//第九部分：提取值
	public long toEpochSecond(){
		return dt.toEpochSecond(zoneOffset);
	}
	public long toEpochMilli(){
		return dt.toInstant(zoneOffset).toEpochMilli();
	}
	public long getNano(){
		return dt.toInstant(zoneOffset).getNano();
	}
	//第十部分：
	
	private static DateTimeFormatter findFormatter(String pattern){
		DateTimeFormatter format = formatters.get(pattern);
		if(format==null){
			format = DateTimeFormatter.ofPattern(pattern);
			formatters.put(pattern, format);
		}
		return format;
	}
}
```

### 七： 内部类 

#### 7.1 内部类概述 

Java语言中允许在一个类（或方法、代码块）的内部定义另一个类，后者称为“内部类”（Inner Classes），也称为“嵌套类”（Nested Classes），封装它的类称为“外部类”。内部类与外部类之间存在逻辑上的隶属关系，内部类一般只用在封装它的外部类或代码块中使用。

**内部类的作用**
内部类的作用如下：

- 封装。将不想公开的实现细节封装到一个内部类中，内部类可以声明为私有的，只能在所在外部类中访问。
- 提供命名空间。静态内部类和外部类能够提供有别于包的命名空间。
- 便于访问外部类成员。内部类能够很方便访问所在外部类的成员，包括私有成员也能访问。

**内部类的分类**：有名内部类和匿名内部类。有名内部类又按照作用域不同可以分为：局部内部类和成员内部类，成员内部类又分为：实例内部类和静态内部类。

![](C:\Users\CM\Desktop\Typora\java 图片\内部类分类图.png)



#### 7.2 成员内部类 

**实例内部类**

```java
//外部类
public class Outer {

    public static void main(String[] args) {

        // 通过外部类访问内部类
        Outer outer = new Outer();
        outer.test();

        System.out.println("-------直接访问内部类------");
        // 直接访问内部类
        Outer.Inner inner =  outer.new Inner();
        inner.display();
    }

    // 外部类成员变量
    private int x = 10;

    // 外部类方法
    private void print() {
        System.out.println("调用外部方法...");
    }

    // 测试调用内部类
    public void test() {
        Inner inner = new Inner();
        inner.display();
    }

    // 内部类
    class Inner {

        // 内部类成员变量
        private int x = 5;

        // 内部类方法
        void display() {

            // 访问外部类的成员变量x
            System.out.println("外部类成员变量 x = " + Outer.this.x);
            // 访问内部类的成员变量x
            System.out.println("内部类成员变量 x = " + this.x);
            System.out.println("内部类成员变量 x = " + x);

            // 调用外部类的成员方法
            Outer.this.print();
            print();
        }
    }
}
```

运行结果：

```java
外部类成员变量 x = 10
内部类成员变量 x = 5
内部类成员变量 x = 5
调用外部方法...
调用外部方法...
-------直接访问内部类------
外部类成员变量 x = 10
内部类成员变量 x = 5
内部类成员变量 x = 5
调用外部方法...
调用外部方法...
```

**提示**　内部类编译成功后生成的字节码文件是“外部类$内部类.class”。

**静态内部类**

静态内部类与静态变量类似，在声明的时候使用关键字static修饰，静态内部类只能访问外部类静态成员，所以静态内部类使用的场景不多。但可以提供有别于包的命名空间。

示例代码如下：

```java
//外部类
public class View {

    public static void main(String[] args) {

        // 直接访问内部类
        View.Button button = new View.Button();
        button.onClick();
    }

    // 外部类实例变量
    private int x = 20;
    // 外部类静态变量
    private static int staticX = 10;

    // 静态内部类
    static class Button {

        // 内部类方法
        void onClick() {
            //访问外部类的静态成员
            System.out.println(staticX);
            //不能访问外部类的非静态成员
            // System.out.println(x); //编译错误
        }
    }
}
```

结果：10

从代码View .Button button = new View .Button()可见，在实例化静态内部时应采用“**内部类.静态内部类**”形式。

#### 7.3 局部内部类 

局部内部类就是**在方法体或代码块中定义的内部类**，局部内部类的**作用域**仅限于方法体或代码块中。局部内部类访问级别只能是**默认**的，不能是公有的、私有的和保护的访问级别。局部内部类也不能是静态，即不能使用static修饰。局部内部类可以访问外部类所有成员。

示例代码如下：

```java
//外部类
public class Outer {

    public static void main(String[] args) {

            Outer outer = new Outer();
            outer.add(100, 300);

    }

    // 外部类成员变量
    private int value = 10;

    // 外部类方法
    public void add(final int x, int y) {
        //局部变量
        int z = 100;

        // 定义内部类
        class Inner {
            // 内部类方法
            void display() {
                int sum = x + z + value;
                System.out.println("sum = " + sum);
            }
        }

        // Inner inner = new Inner();
        // inner.display();
        //声明匿名对象
        //匿名对象适合只运行一次情况下。匿名对象写法使代码变得简洁
        new Inner().display();
    }
}
```

结果：210

#### 7.4 匿名内部类 

```java
public interface OnClickListener {
    void onClick();
}
```

```java
//外部类
abstract class Figure {
    // 绘制几何图形方法
    public abstract void onDraw();
}
class Person {

    String name;
    int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    @Override
    public String toString() {
        return "Person [name=" + name
                + ", age=" + age + "]";
    }
}
public class View {

    public static void main(String[] args) {

        View v = new View();
        // 方法参数是匿名内部类
        v.handler(new OnClickListener() {

            @Override
            public void onClick() {
                System.out.println("实现接口的匿名内部类...");
            }

        });

        //继承类的匿名内部类
        Figure f = new Figure() {
            @Override
            public void onDraw() {
                System.out.println("继承类的匿名内部类...");
            }
        };

        //具体类作为内部类
        Person person = new Person("Tony", 18) {
            @Override
            public String toString() {
                return "匿名内部类.实现 "
                        + " Person[name=" + name
                        + ", age=" + age + "]";
            }
        };

        //打印过程自动调用person的 toString()方法
        System.out.println(person);

    }

    public void handler(OnClickListener listener) {
        listener.onClick();
    }
}
```

运行结果：

```java
实现接口的匿名内部类...
匿名内部类.实现  Person[name=Tony, age=18]
```

### 八：  Java 8函数式编程基础 

#### 8.1 Lambda表达式概述

 Lambda表达式标准语法形式如下：

```java
(参数列表) -> {
    //Lambda表达式体
}
```

其中，Lambda表达式参数列表与接口中方法参数列表形式一样，Lambda表达式体实现接口方法。

 **匿名内部类：** 

```java
interface ILambdaTest1{
    void print(String s);
}
public class LambdaTest1 {
    public static void main(String[] args) {
        //传统内部类的实现
        LambdaUse(new ILambdaTest1() {
            @Override
            public void print(String s) {
                System.out.println(s);
            }
        }, "hello world");
    }
    public static void LambdaUse(ILambdaTest1 lambda,String string){
        lambda.print(string);
    }

}
```

 **lambda表达式：** 

```java
@FunctionalInterface
interface ILambdaTest1{
    void print(String s);
}
public class LambdaTest1 {
    public static void main(String[] args) {
        //lambda表达式的实现
        LambdaUse((String s)->{ System.out.println(s);},"Hello world.");
    }
    public static void LambdaUse(ILambdaTest1 lambda,String string){
        lambda.print(string);
    }
}
```
 **输出：** 

```java
Hello world.
```

使用条件： 接口只能有一个抽象方法 ，该接口可以使用 @FunctionalInterface 注解

#### 8.2 Lambda表达式简化形式 

```java
@FunctionalInterface
interface ILambdaCaculator{
    int result(int a,int b);
}
public class LambdaTest1{
    public static void main(String[] args) {
        // Lambda表达式实现ILambdaCaculator接口
        //标准形式
        System.out.println("add :"+LambdaUse((int a, int b)->{ return a+b;},12,14));
        //省略形式
        System.out.println("sub :"+LambdaUse((a,b)->a-b,12,14));
    }
    public static int LambdaUse(ILambdaCaculator lambda,int a,int b){
        return lambda.result(a, b);
    }
}

```

输出值：

```java
add :26
sub :-2

```

#### 8.3 作为参数使用Lambda表达式

```java
@FunctionalInterface
interface ILambdaCaculator {
    int result(int a, int b);
}

public class LambdaTest1 {

    public static void main(String[] args) {

        int n1 = 10;
        int n2 = 5;

        // 打印计算结果加法计算结果
        display((a, b) -> {
            return a + b;
        }, n1, n2);

        // 打印计算结果减法计算结果
        display((a, b) -> a - b, n1, n2);

    }

    /**
     * 打印计算结果
     *
     * @param calc Lambda表达式
     * @param n1   操作数1
     * @param n2   操作数2
     */
    public static void display(Calculable calc, int n1, int n2) {
        System.out.println(calc.calculateInt(n1, n2));
    }
}
```

输出结果：

```java
15
5
```

上面代码display方法即使用lambda表达式作为参数。

#### 8.4 捕获局部变量 

```java
//可计算接口
@FunctionalInterface
interface Calculable {
    // 计算两个int数值
    int calculateInt(int a, int b);
}

public class LambdaTest1 {
    public static void main(String[] args) {
        System.out.println("add :" + add());
        System.out.println("add :" + add().calculateInt(10, 5));
        LambdaTest1 test1 = new LambdaTest1();
        System.out.println("add :" + test1.sub());
        System.out.println("sub :" + test1.sub().calculateInt(10, 5));
    }

    // 实例成员变量
    private int value = 10;
    // 静态成员变量
    private static int staticValue = 5;

    // 静态方法，进行加法运算
    public static Calculable add() {
        Calculable result = (int a, int b) -> {
            // 访问静态成员变量，不能访问实例成员变量
            staticValue++;
            int c = a + b + staticValue; // this.value;
            return c;
        };
        return result;
    }

    // 实例方法，进行减法运算
    public Calculable sub() {

        Calculable result = (int a, int b) -> {
            // 访问静态成员变量和实例成员变量
            staticValue++;
            this.value++;
            int c = a - b - staticValue - this.value;
            return c;
        };
        return result;
    }
}
```

**输出结果**：

```java
add :LambdaTest1$$Lambda$1/1747585824@448139f0
add :21
add :LambdaTest1$$Lambda$2/2074407503@7699a589
sub :-13
```

#### 8.5 方法引用

方法引用分为：静态方法的方法引用和实例方法的方法引用。它们的语法形式如下：

- 类型名::静态方法        // 静态方法的方法引用
- 实例名::实例方法        // 实例方法的方法引用

```java
//可计算接口
@FunctionalInterface
interface Calculable {
    // 计算两个int数值
    int calculateInt(int a, int b);
}

public class LambdaTest1 {
    public static void main(String[] args) {

        int n1 = 10;
        int n2 = 5;

        // 打印计算结果加法计算结果
           // 静态方法的方法引用
        display(LambdaDemo::add, n1, n2);

        LambdaDemo d = new LambdaDemo();

        // 打印计算结果减法计算结果
           // 实例方法的方法引用
        display(d::sub, n1, n2);

    }

    /**
     * 打印计算结果
     * @param calc Lambda表达式
     * @param n1  操作数1
     * @param n2 操作数2
     */
    public static void display(Calculable calc, int n1, int n2) {
        System.out.println(calc.calculateInt(n1, n2));
    }
    public static class LambdaDemo {

        // 静态方法，进行加法运算
        // 参数列表要与函数式接口方法calculateInt(int a, int b)兼容
        public static int add(int a, int b) {
            return a + b;
        }

        // 实例方法，进行减法运算
        // 参数列表要与函数式接口方法calculateInt(int a, int b)兼容
        public int sub(int a, int b) {
            return a - b;
        }
    }
}
```

结果：

```java
15
5
```

### 九：异常处理

#### 9.1 异常处理概述

**异常**是指程序在运行过程中出现的不正常情况或错误。为了加强程序的健壮性，程序设计时必须考虑程序在运行时可能发生的异常情况，并作出相应的处理。在用传统的语言编程时，程序员只能通过函数的返回值来发出错误的信息，这易于导致很多错误。而在Java语言中，通过面向对象的方法来处理程序运行时的异常。当出现异常情况时，一个Exception对象就产生了，并交由异常处理程序处理，异常处理程序是使程序得以恢复正常运行的处理过程。

   Java的异常处理机制描述如下：在一个方法的运行过程中，如果发生了异常，则这个方法（或者是Java虚拟机）生成一个代表该异常的对象（它包含了异常的详细信息），并把它交给运行时系统，运行时系统寻找相应的代码来处理这一异常。把生成异常对象并把它交给运行时系统的过程称为抛出一个异常。

运行时系统寻找相应的代码来处理这一异常，系统在方法调用栈中查找，从产生异常的方法开始进行回朔，沿着被调用的顺序往前寻找，知道找到包含相应处理程序的方法为止。这一过程成为捕捉一个异常。

 Java的异常是一个对象，所有异常都直接或间接地继承Throwable类。Throwable类是所有异常的超类。它有两个子类Error和Exception。

  （1）Error类及其子类由Java虚拟机生成并抛出，包括动态链接失败、虚拟机错误等。Java程序不应捕捉这些异常。

  （2）Exception类及其子类（Runtime Exception和IO Exception）代表Java程序中可能发生的异常，并且应用程序可以捕捉这些异常。

Java将异常分为两种类型：编译时**检查性异常**和**非检查性异常**（又称**运行时异常**）。对于**检查性异常**，在程序中必须对其进行处理，否则编译器会指出错误。对于**非检查性异常**，程序中可以不做处理，直接由运行时系统来处理。编译器要求Java程序必须捕捉或声明所有的编译时异常（或称非运行时异常）。

   Runtime Exception异常是Java虚拟机在运行时生成的异常，其产生比较繁琐，处理麻烦，对程序可读性和运行效率影响较大。因此由系统监测，用户可不做处理，系统将它们交给缺省的异常处理程序。当然，必要时用户可对其进行处理。

 在Java类库中每个类包都定义了异常类，这些异常类分为两大类——**Error类**及**Exception类**，后者是java程序中需要大量处理的。除了java类库所定义的异常类之外，用户也可以通过继承已有的异常类（一般从Throwable或Exception类继承）来定义自己的异常类，并在程序中使用。

#### 9.2 异常类继承层次

![image-20191108160357995](C:\Users\CM\Desktop\Typora\java 图片\Java异常类继承层次.jpeg)

##### 9.2.1 Throwable类

所有的异常类都直接或间接地继承于java. lang. Throwable类，在Throwable类有几个非常重要的方法：

- `String get Message()`：获得发生异常的详细消息。
- `void print Stack Trace()`：打印异常堆栈跟踪信息。
- `String toString()`：获得异常对象的描述。
- 跟踪是方法调用过程的轨迹，它包含了程序执行过程中方法调用的顺序和所在源代码行号。

```java
public class HelloWorld {

    public static void main(String[] args) {

        int a = 0;
        int result = divide(5, a);
        System.out.printf("divide(%d, %d) = %d", 5, a, result);
    }

    public static int divide(int number, int divisor) {

        try {
            return number / divisor;
        } catch (Throwable throwable) {

            System.out.println("getMessage() : " + throwable.getMessage());

            System.out.println("toString() : " + throwable.toString());

            System.out.println("printStackTrace()输出信息如下：");
            throwable.printStackTrace();
        }

        return 0;
    }
}
```

运行结果：

```java
getMessage() : / by zero
toString() : java.lang.ArithmeticException: / by zero
printStackTrace()输出信息如下：
java.lang.ArithmeticException: / by zero
	at HelloWorld.divide(HelloWorld.java:13)
	at HelloWorld.main(HelloWorld.java:6)
divide(5, 0) = 0
```

##### 9.2.2 Error和Exception

Throwable有两个直接子类：**Error**和**Exception**。

- Error是程序无法恢复的严重错误，程序员根本无能为力，只能让程序终止。例如：JVM内部错误、内存溢出和资源耗尽等严重情况。
- Exception是程序可以恢复的异常，它是程序员所能掌控的。例如：除零异常、空指针访问、网络连接中断和读取不存在的文件等。本章所讨论的异常处理就是对Exception及其子类的异常处理。

##### 9.2.3　受检查异常和运行时异常

Exception类可以分为：受检查异常和运行时异常。

- 受检查异常是除RuntimeException以外的异常类。它们的共同特点是：编译器会检查这类异常是否进行了处理，即要么捕获（try-catch语句），要么不抛出（通过在方法后声明throws），否则会发生编译错误。它们种类很多，前面遇到过的日期解析异常ParseException。
- 运行时异常是继承Runtime Exception类的直接或间接子类。运行时异常往往是程序员所犯错误导致的，健壮的程序不应该发生运行时异常。它们的共同特点是：编译器不检查这类异常是否进行了处理，也就是对于这类异常不捕获也不抛出，程序也可以编译通过。由于没有进行异常处理，一旦运行时异常发生就会导致程序的终止，这是用户不希望看到的。

```java
public class HelloWorld {

    public static void main(String[] args) {

        int a = 0;
        int result = divide(5, a);
        System.out.printf("divide(%d, %d) = %d", 5, a, result);
    }

    public static int divide(int number, int divisor) {

        //判断除数divisor非零，防止运行时异常
        if (divisor != 0) {
            return number / divisor;
        }
        return 0;
    }

}
```

运行结果：

```java
divide(5, 0) = 0
```

#### 9.3 捕获异常

**原则**：当前方法有能力解决，则捕获异常进行处理；没有能力解决，则抛出给上层调用方法处理。如果上层调用方法还无力解决，则继续抛给它的上层调用方法，异常就是这样向上传递直到有方法处理它，如果所有的方法都没有处理该异常，那么JVM会终止程序运行。

##### 9.3.1　try-catch语句

捕获异常是通过try-catch语句实现的，最基本try-catch语句语法如下：

```java
try{
    //可能会发生异常的语句
} catch(Throwable e){
    //处理异常e
}
```

- try代码块

try代码块中应该包含执行过程中可能会发生异常的语句。一条语句是否有可能发生异常，这要看语句中调用的方法。例如日期格式化类Date Format的日期解析方法parse()，该方法的完整定义如下：

```java
public Date parse(String source) throws ParseException
```

方法后面的throws Parse Exception说明：当调用parse()方法时有可以能产生Parse Exception异常。

**静态方法、实例方法和构造方法都可以声明抛出异常，凡是抛出异常的方法都可以通过try-catch进行捕获，当然运行时异常可以不捕获。一个方法声明抛出什么样的异常需要查询API文档。**

- catch代码块


每个try代码块可以伴随一个或多个catch代码块，用于处理try代码块中所可能发生的多种异常。catch(Throwable e)语句中的e是捕获异常对象，e必须是Throwable的子类，异常对象e的作用域在该catch代码块中。

下面看看一个try-catch示例：

```java
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class HelloWorld {

    public static void main(String[] args) {
        Date date = readDate();
        System.out.println("日期  = " + date);
    }

    // 解析日期
    public static Date readDate() {

        try {
            String str = "2018-8-18";     //"201A-18-18"
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            // 从字符串中解析日期
            //解析方法parse()有可能发生ParseException异常，ParseException是受检查异常
            Date date = df.parse(str);
            return date;
        } catch (ParseException e) {
            System.out.println("处理ParseException…");
            e.printStackTrace();
        }
        return null;
    }
}
```

运行结果：

```java
日期  = Sat Aug 18 00:00:00 CST 2018
```

##### 9.3.2　多catch代码块

如果try代码块中有很多语句会发生异常，而且发生的异常种类又很多。那么可以在try后面跟有多个catch代码块。多catch代码块语法如下：

```java
try{
    //可能会发生异常的语句
} catch(Throwable e){
    //处理异常e
} catch(Throwable e){
    //处理异常e
} catch(Throwable e){
    //处理异常e
}
```

- 在多个catch代码情况下，当一个catch代码块捕获到一个异常时，其他的catch代码块就不再进行匹配。
- 当捕获的多个异常类之间存在父子关系时，捕获异常顺序与catch代码块的顺序有关。一般先捕获子类，后捕获父类，否则子类捕获不到。

```java
import java.io.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class HelloWorld {

    public static void main(String[] args) {
        Date date = readDate();
        System.out.println("读取的日期  = " + date);
    }

    public static Date readDate() {

        FileInputStream readfile = null;
        InputStreamReader ir = null;
        BufferedReader in = null;
        try {
            readfile = new FileInputStream("E:\\IDEA Room\\test\\src\\123.txt");
            ir = new InputStreamReader(readfile);
            in = new BufferedReader(ir);
            // 读取文件中的一行数据
            String str = in.readLine();
            if (str == null) {
                return null;
            }

            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date date = df.parse(str);
            return date;

        } catch (FileNotFoundException e) {
            System.out.println("处理FileNotFoundException...");
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println("处理IOException...");
            e.printStackTrace();
        } catch (ParseException e) {
            System.out.println("处理ParseException...");
            e.printStackTrace();
        }
        return null;
    }
}
```

运行结果：

```java
读取的日期  = Fri Dec 08 00:00:00 CST 2017
```

##### 9.3.3 try-catch语句嵌套

```java
import java.io.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class HelloWorld {

    public static void main(String[] args) {
        Date date = readDate();
        System.out.println("读取的日期  = " + date);
    }

    public static Date readDate() {

        FileInputStream readfile = null;
        InputStreamReader ir = null;
        BufferedReader in = null;
        try {
            readfile = new FileInputStream("E:\\IDEA Room\\test\\src\\123.txt");
            ir = new InputStreamReader(readfile);
            in = new BufferedReader(ir);

            try {
                String str = in.readLine();
                if (str == null) {
                    return null;
                }

                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                Date date = df.parse(str);
                return date;

            } catch (ParseException e) {
                System.out.println("处理ParseException...");
                e.printStackTrace();
            }

        } catch (FileNotFoundException e) {
            System.out.println("处理FileNotFoundException...");
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println("处理IOException...");
            e.printStackTrace();
        }
        return null;
    }
}
```

##### 9.3.4　多重捕获

多catch代码块客观上提高了程序的健壮性，但是程序代码量大大增加。如果有些异常虽然种类不同，但捕获之后的处理是相同的

```java
try{
    //可能会发生异常的语句
} catch (FileNotFoundException e) {
    //调用方法methodA处理
} catch (IOException e) {
    //调用方法methodA处理
} catch (ParseException e) {
    //调用方法methodA处理
}
```

三个不同类型的异常，要求捕获之后的处理都是调用method A方法。是否可以把这些异常合并处理，Java 7推出了多重捕获（multi-catch）技术，可以帮助解决此类问题 

```java
try{
    //可能会发生异常的语句
} catch (IOException | ParseException e) {
    //调用方法methodA处理
}
```

在catch中多重捕获异常用“|”运算符连接起来。

#### 9.4 释放资源

有时在try-catch语句中会占用一些非Java资源，如：打开文件、网络连接、打开数据库连接和使用数据结果集等，这些资源并非Java资源，不能通过JVM的垃圾收集器回收，需要程序员释放。为了确保这些资源能够被释放可以使用finally代码块或Java 7之后提供自动资源管理（Automatic Resource Management）技术。

##### 9.4.1 finally代码块

try-catch语句后面还可以跟有一个finally代码块：

```java
try{
    //可能会生成异常语句
} catch(Throwable e1){
    //处理异常e1
} catch(Throwable e2){
    //处理异常e2
} catch(Throwable eN){
    //处理异常eN
} finally{
    //释放资源
}
```

无论try正常结束还是catch异常结束都会执行finally代码块

![](C:\Users\CM\Desktop\Typora\java 图片\异常处理流程.jpeg)

```java
import java.io.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class HelloWorld {

    public static void main(String[] args) {
        Date date = readDate();
        System.out.println("读取的日期  = " + date);
    }

    public static Date readDate() {

        FileInputStream readfile = null;
        InputStreamReader ir = null;
        BufferedReader in = null;
        try {
            readfile = new FileInputStream("E:\\IDEA Room\\test\\src\\123.txt");
            ir = new InputStreamReader(readfile);
            in = new BufferedReader(ir);
            // 读取文件中的一行数据
            String str = in.readLine();
            if (str == null) {
                return null;
            }

            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date date = df.parse(str);
            return date;

        } catch (FileNotFoundException e) {
            System.out.println("处理FileNotFoundException...");
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println("处理IOException...");
            e.printStackTrace();
        } catch (ParseException e) {
            System.out.println("处理ParseException...");
            e.printStackTrace();
        } finally {
            try {
                if (readfile != null) {
                    readfile.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                if (ir != null) {
                    ir.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                if (in != null) {
                    in.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}

```

运行结果同上

##### 9.4.2　自动资源管理

使用finally代码块释放资源会导致程序代码大量增加，一个finally代码块往往比正常执行的程序还要多。在Java 7之后提供自动资源管理（Automatic Resource Management）技术，可以替代finally代码块，优化代码结构，提高程序可读性。

**自动资源管理**是在try语句上的扩展，语法如下：

```java
try (声明或初始化资源语句) {
    //可能会生成异常语句
} catch(Throwable e1){
    //处理异常e1
} catch(Throwable e2){
    //处理异常e1
} catch(Throwable eN){
    //处理异常eN
}
```

在try语句后面添加一对小括号“()”，其中是声明或初始化资源语句，可以有多条语句语句之间用分号“;”分隔。

```java
import java.io.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class HelloWorld {

    public static void main(String[] args) {
        Date date = readDate();
        System.out.println("读取的日期  = " + date);
    }

    public static Date readDate() {

        // 自动资源管理
        try (FileInputStream readfile = new FileInputStream("E:\\IDEA Room\\test\\src\\123.txt");
             InputStreamReader ir = new InputStreamReader(readfile);
             BufferedReader in = new BufferedReader(ir)) {

            // 读取文件中的一行数据
            String str = in.readLine();
            if (str == null) {
                return null;
            }

            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date date = df.parse(str);
            return date;

        } catch (FileNotFoundException e) {
            System.out.println("处理FileNotFoundException...");
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println("处理IOException...");
            e.printStackTrace();
        } catch (ParseException e) {
            System.out.println("处理ParseException...");
            e.printStackTrace();
        }
        return null;
    }
}
```

运行结果同上

声明或初始化三个输入流，这三条语句放到在try语句后面小括号中，语句之间用分号“;”分隔，这就是自动资源管理技术了，采用了自动资源管理后不再需要finally代码块，不需要自己close这些资源，释放过程交给了JVM。

#### 9.5 throws与声明方法抛出异常

在一个方法中如果能够处理异常，则需要捕获并处理。但是本方法没有能力处理该异常，捕获它没有任何意义，则需要在方法后面声明抛出该异常，通知上层调用者该方法有可以发生异常。

方法后面声明抛出使用throws关键字，

```java
 class className {

           [public | protected | private ] [static] [final | abstract] [native] [synchronized]
                   type methodName([paramList]) [throws exceptionList] {
                         //方法体
            }
   }
```

其中参数列表之后的[throws exception List]语句是声明抛出异常。方法中可能抛出的异常（除了Error和Runtime Exception及其子类外）都必须通过throws语句列出，多个异常之间采用逗号（,）分隔。

```java
import java.io.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class HelloWorld {

    public static void main(String[] args) {
        //main()方法是捕获异常进行处理
        try {
            Date date = readDate();
            System.out.println("读取的日期  = " + date);
        } catch (IOException e) {
            System.out.println("处理IOException...");
            e.printStackTrace();
        } catch (ParseException e) {
            System.out.println("处理ParseException...");
            e.printStackTrace();
        }

    }

    public static Date readDate() throws IOException, ParseException {

        // 自动资源管理
        FileInputStream readfile = new FileInputStream("E:\\IDEA Room\\test\\src\\123.txt");
        InputStreamReader ir = new InputStreamReader(readfile);
        BufferedReader in = new BufferedReader(ir);

        // 读取文件中的一行数据
        String str = in.readLine();
        if (str == null) {
            return null;
        }

        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date date = df.parse(str);
        return date;
    }

}
```

运行结果同上

一旦read Date()方法声明抛出了异常，那么它的调用者main()方法，也会面临同样的问题：要么捕获自己处理，要么抛出给上层调用者。如果一旦发生异常main()方法也选择抛出那么程序运行就会终止。

#### 9.6 自定义异常类

为了提高代码的可重用性，自己开发了一些Java类库或框架，其中少不了自己编写了一些异常类。实现自定义异常类需要继承Exception类或其子类，如果自定义运行时异常类需继承Runtime Exception类或其子类。

```java
class MyException extends Exception {
    //无参数的默认构造方法，异常描述信息是空的
    public MyException() {

    }
    //字符串参数的构造方法，message是异常描述信息，getMessage()方法可以获得这些信息
    public MyException(String message) {
        super(message);
    }
}
```

#### 9.7 throw与显式抛出异常

**throws**用于方法后声明抛出异常，而**throw**关键字用来人工引发异常。本节之前读者接触到的异常都是由于系统生成的，当异常发生时，系统会生成一个异常对象，并将其抛出。但也可以通过throw语句显式抛出异常，语法格式如下：

```java
   throw Throwable或其子类的实例
```

所有Throwable或其子类的实例都可以通过throw语句抛出。

显式抛出异常目的有很多，例如不想某些异常传给上层调用者，可以捕获之后重新显式抛出另外一种异常给调用者。

```
import java.io.*;
import java.text.*;
import java.util.Date;

public class HelloWorld {

    public static void main(String[] args) {
        try {
            Date date = readDate();
            System.out.println("读取的日期  = " + date);
        } catch (MyException e) {
            System.out.println("处理MyException...");
            e.printStackTrace();
        }
    }

    public static Date readDate() throws MyException {

        // 自动资源管理
        try (FileInputStream readfile = new FileInputStream("E:\\IDEA Room\\test\\src\\123.txt");
             InputStreamReader ir = new InputStreamReader(readfile);
             BufferedReader in = new BufferedReader(ir)) {

            // 读取文件中的一行数据
            String str = in.readLine();
            if (str == null) {
                return null;
            }

            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date date = df.parse(str);
            return date;

        } catch (FileNotFoundException e) {
            throw new MyException(e.getMessage());
        } catch (IOException e) {
            throw new MyException(e.getMessage());
        } catch (ParseException e) {
            System.out.println("处理ParseException...");
            e.printStackTrace();
        }
        return null;
    }

    private static class MyException extends Exception {
        //无参数的默认构造import java.io.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class HelloWorld {

    public static void main(String[] args) {
        try {
            Date date = readDate();
            System.out.println("读取的日期  = " + date);
        } catch (MyException e) {
            System.out.println("处理MyException...");
            e.printStackTrace();
        }
    }

    public static Date readDate() throws MyException {

        // 自动资源管理
        try (FileInputStream readfile = new FileInputStream("E:\\IDEA Room\\test\\src\\123.txt");
             InputStreamReader ir = new InputStreamReader(readfile);
             BufferedReader in = new BufferedReader(ir)) {

            // 读取文件中的一行数据
            String str = in.readLine();
            if (str == null) {
                return null;
            }

            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date date = df.parse(str);
            return date;

        } catch (Exception e) {
            throw new MyException(e.getMessage());
        }
    }

    private static class MyException extends Exception {
        //无参数的默认构造方法，异常描述信息是空的
        public MyException() {
            String message = "error";
            System.out.println(message);
        }

        //字符串参数的构造方法，message是异常描述信息，getMessage()方法可以获得这些信息
        public MyException(String message) {
            super(message);
        }
    }
}方法，异常描述信息是空的
        public MyException() {

        }

        //字符串参数的构造方法，message是异常描述信息，getMessage()方法可以获得这些信息
        public MyException(String message) {
            super(message);
        }
    }
}
```

结果同上

### 十：对象容器——集合

当你有很多书时，你会考虑买一个书柜，将你的书分门别类摆放进入。使用了书柜不仅仅使房间变得整洁，也便于以后使用书时方便查找。在计算机中管理对象亦是如此，当获得多个对象后，也需要一个容器将它们管理起来，这个容器就是集合。

集合本质是基于某种数据结构数据容器。常见的数据结构：数组（Array）、集（Set）、队列（Queue）、链表（Linked list）、树（Tree）、堆（Heap）、栈（Stack）和映射（Map）等结构。

#### 10.1 集合概述

Java中提供了丰富的集合接口和类，它们来自于java.util包。下图是Java主要的集合接口和类，从图中可见Java集合类型分为：Collection和Map，Collection子接口有：Set、Queue和List等接口。每一种集合接口描述了一种数据结构。

本章重点介绍List、Set和Map接口。

![](C:\Users\CM\Desktop\Typora\java 图片\Java主要的集合接口和类.jpeg)

#### 10.2 List集合

List集合中的元素是有序的，可以重复出现。图20-2是一个班级集合数组，这个集合中有一些学生，这些学生是有序的，顺序是他们被放到集合中的顺序，可以通过序号访问他们。这就像老师给进入班级的人分配学号，第一个报到的是“张三”，老师给他分配的是0，第二个报到的是“李四”，老师给他分配的是1，以此类推，最后一个序号应该是“学生人数-1”。

![](C:\Users\CM\Desktop\Typora\java 图片\List集合.jpeg)

List接口的实现类有：**ArrayList** 和 **LinkedList**。ArrayList是基于动态数组数据结构的实现，LinkedList是基于链表数据结构的实现。ArrayList访问元素速度优于LinkedList，LinkedList占用的内存空间比较大，但LinkedList在批量插入或删除数据时优于ArrayList。

不同的结构对应于不同的算法，有的考虑节省占用空间，有的考虑提高运行效率，对于程序员而言，它们就像是“熊掌”和“鱼肉”，不可兼得！提高运行速度往往是以牺牲空间为代价的，而节省占用空间往往是以牺牲运行速度为代价的。

##### 10.2.1　常用方法

List接口继承自**Collection**接口，List接口中的很多方法都继承自Collection接口的。List接口中常用方法如下。

1. 操作元素

   - `get(int index)`：返回List集合中指定位置的元素。
   - `set(int index, Object element)`：用指定元素替换List集合中指定位置的元素。
   - `add(Object element)`：在List集合的尾部添加指定的元素。该方法是从Collection集合继承过来的。
   - `add(int index, Object element)`：在List集合的指定位置插入指定元素。
   - `remove(int index)`：移除List集合中指定位置的元素。
   - `remove(Object element)`：如果List集合中存在指定元素，则从List集合中移除第一次出现的指定元素。该方法是从Collection集合继承过来的。
   - `clear()`：从List集合中移除所有元素。该方法是从Collection集合继承过来的。

2. 判断元素

   - `isEmpty()`：判断List集合中是否有元素，没有返回true，有返回false。该方法是从Collection集合继承过来的。
   - `contains(Object element)`：判断List集合中是否包含指定元素，包含返回true，不包含返回false。该方法是从Collection集合继承过来的。

   

3. 查询元素

   - `indexOf(Object o)`：从前往后查找List集合元素，返回第一次出现指定元素的索引，如果此列表不包含该元素，则返回-1。
   - `lastIndexOf(Object o)`：从后往前查找List集合元素，返回第一次出现指定元素的索引，如果此列表不包含该元素，则返回-1。

4. 其他

   - `iterator()`：返回迭代器（Iterator）对象，迭代器对象用于遍历集合。该方法是从Collection集合继承过来的。
   - `size()`：返回List集合中的元素数，返回值是int类型。该方法是从Collection集合继承过来的。
   - `subList(int fromIndex, int toIndex)`：返回List集合中指定的 `fromIndex`（包括 ）和 `toIndex`（不包括）之间的元素集合，返回值为List集合。

   ```java
   import java.util.ArrayList;
   import java.util.List;
   
   public class HelloWorld {
   
       public static void main(String[] args) {
   
           List list = new ArrayList();
   
           String b = "B";
   
           //向集合中添加元素
           list.add("A");
           list.add(b);
           list.add("C");
           list.add(b);
           list.add("D");
           list.add("E");
   
           //打印集合元素个数
           System.out.println("集合size = " + list.size());
           //打印集合
           System.out.println(list);
   
           //从前往后查找集合中的"B"元素
           System.out.println("indexOf(\"B\") = " + list.indexOf(b));
           //从后往前查找集合中的"B"元素
           System.out.println("lastIndexOf(\"B\") = " + list.lastIndexOf(b));
   
           //删除集合中第一个"B"元素
           list.remove(b);
           System.out.println("remove(3)前： " + list);
           //判断集合中是否包含"B"元素
           System.out.println("是否包含\"B\"：" + list.contains(b));
   
           //删除集合第4个元素
           list.remove(3);
           System.out.println("remove(3)后： " + list);
           //判断集合是否为空
           System.out.println("list集合是空的：" + list.isEmpty());
   
           System.out.println("替换前：" + list);
           //替换集合第2个元素
           list.set(1, "F");
           System.out.println("替换后：" + list);
   
           //清空集合
           list.clear();
           System.out.println(list);
   
   
           // 重新添加元素
           list.add(1);//发生自动装箱
           list.add(3);
   
           int item = (Integer)list.get(0);//发生自动拆箱
       }
   }
   ```

运行结果：

```java
集合size = 6
[A, B, C, B, D, E]
indexOf("B") = 1
lastIndexOf("B") = 3
remove(3)前： [A, C, B, D, E]
是否包含"B"：true
remove(3)后： [A, C, B, E]
list集合是空的：false
替换前：[A, C, B, E]
替换后：[A, F, B, E]
[]
```

##### 10.2.2　遍历集合

集合最常用的操作之一是遍历，遍历就是将集合中的每一个元素取出来，进行操作或计算。List集合遍历有三种方法：

1. 使用for循环遍历：List集合可以使用for循环进行遍历，for循环中有循环变量，通过循环变量可以访问List集合中的元素。
2. 使用for-each循环遍历：for-each循环是针对遍历各种类型集合而推出的，笔者推荐使用这种遍历方法。
3. 使用迭代器遍历：Java提供了多种迭代器，List集合可以使用Iterator和List-Iterator迭代器。

```java
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class HelloWorld {

    public static void main(String[] args) {

        List list = new ArrayList();

        String b = "B";
        // 向集合中添加元素
        list.add("A");
        list.add(b);
        list.add("C");
        list.add(b);
        list.add("D");
        list.add("E");

        // 1.使用for循环遍历
        System.out.println("--1.使用for循环遍历--");
        for (int i = 0; i < list.size(); i++) {
            System.out.printf("读取集合元素(%d): %s \n", i, list.get(i));
        }

        // 2.使用for-each循环遍历
        System.out.println("--2.使用for-each循环遍历--");
        for (Object item : list) {
            String s = (String) item;
            System.out.println("读取集合元素: " + s);
        }

        // 3.使用迭代器遍历
        System.out.println("--3.使用迭代器遍历--");
        Iterator it = list.iterator();
        while (it.hasNext()) {
            Object item = it.next();
            String s = (String) item;
            System.out.println("读取集合元素: " + s);
        }
    }
}

```

运行结果：

```java
--1.使用for循环遍历--
读取集合元素(0): A 
读取集合元素(1): B 
读取集合元素(2): C 
读取集合元素(3): B 
读取集合元素(4): D 
读取集合元素(5): E 
--2.使用for-each循环遍历--
读取集合元素: A
读取集合元素: B
读取集合元素: C
读取集合元素: B
读取集合元素: D
读取集合元素: E
--3.使用迭代器遍历--
读取集合元素: A
读取集合元素: B
读取集合元素: C
读取集合元素: B
读取集合元素: D
读取集合元素: E
```



#### 10.3  Set集合

Set集合是由一串无序的，不能重复的相同类型元素构成的集合。下图是一个班级的Set集合。这个Set集合中有一些学生，这些学生是无序的，不能通过类似于List集合的序号访问，而且不能有重复的同学。

![](C:\Users\CM\Desktop\Typora\java 图片\Set集合.jpeg)

**List与Set集合的区别**：List集合中的元素是有序的、可重复的，而Set集合中的元素是无序的、不能重复的。List集合强调的是有序，Set集合强调的是不重复。当不考虑顺序，且没有重复元素时，Set集合和List集合可以互相替换的。

Set接口直接实现类主要是**HashSet**，HashSet是基于**散列表**数据结构的实现。

##### 10.3.1　常用方法

Set接口也继承自Collection接口，Set接口中大部分都是继承自Collection接口，这些方法如下。

1. 操作元素
   - `add(Object element)`：在Set集合的尾部添加指定的元素。该方法是从Collection集合继承过来的。
   - `remove(Object element)`：如果Set集合中存在指定元素，则从Set集合中移除该元素。该方法是从Collection集合继承过来的。
   - `clear()`：从Set集合中移除所有元素。该方法是从Collection集合继承过来的。
2. 判断元素
   - `is-Empty()`：判断Set集合中是否有元素，没有返回true，有返回false。该方法是从Collection集合继承过来的。
   - `contains(Object element)`：判断Set集合中是否包含指定元素，包含返回true，不包含返回false。该方法是从Collection集合继承过来的。
3. 其他
   - `iterator()`：返回迭代器（Iterator）对象，迭代器对象用于遍历集合。该方法是从Collection集合继承过来的。
   - `size()`：返回Set集合中的元素数，返回值是int类型。该方法是从Collection集合继承过来的。

```java
import java.util.HashSet;
import java.util.Set;

public class HelloWorld {

    public static void main(String[] args) {

        Set set = new HashSet();

        String b = "B";

        // 向集合中添加元素
        set.add("A");
        set.add(b);
        set.add("C");
        set.add(b);
        set.add("D");
        set.add("E");

        // 打印集合元素个数
        System.out.println("集合size = " + set.size());
        // 打印集合
        System.out.println(set);

        // 删除集合中第一个"B"元素
        set.remove(b);
        // 判断集合中是否包含"B"元素
        System.out.println("是否包含\"B\"：" + set.contains(b));
        // 判断集合是否为空
        System.out.println("set集合是空的：" + set.isEmpty());

        // 清空集合
        set.clear();
        System.out.println(set);
    }
}
```

运行结果：

```java
集合size = 5
[A, B, C, D, E]
是否包含"B"：false
set集合是空的：false
[]
```

##### 10.3.2　遍历集合

Set集合中的元素由于没有序号，所以不能使用for循环进行遍历，但可以使用for-each循环和迭代器进行遍历。事实上这两种遍历方法也是继承自**Collection**集合，也就是说所有的Collection集合类型都有这两种遍历方式。

```java
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class HelloWorld {

    public static void main(String[] args) {

        Set set = new HashSet();

        String b = "B";
        // 向集合中添加元素
        set.add("A");
        set.add(b);
        set.add("C");
        set.add(b);
        set.add("D");
        set.add("E");

        // 1.使用for-each循环遍历
        System.out.println("--1.使用for-each循环遍历--");
        for (Object item : set) {
            String s = (String) item;
            System.out.println("读取集合元素: " + s);
        }

        // 2.使用迭代器遍历
        System.out.println("--2.使用迭代器遍历--");
        Iterator it = set.iterator();
        while (it.hasNext()) {
            Object item = it.next();
            String s = (String) item;
            System.out.println("读取集合元素: " + s);
        }
    }
}
```

运行结果：

```java
读取集合元素: B
读取集合元素: C
读取集合元素: D
读取集合元素: E
--2.使用迭代器遍历--
读取集合元素: A
读取集合元素: B
读取集合元素: C
读取集合元素: D
读取集合元素: E
```

#### 10.4  Map集合

Map（映射）集合表示一种非常复杂的集合，允许按照某个键来访问元素。Map集合是由两个集合构成的，一个是键（key）集合，一个是值（value）集合。键集合是Set类型，因此不能有重复的元素。而值集合是Collection类型，可以有重复的元素。Map集合中的键和值是成对出现的。

下图是Map类型的“国家代号”集合。键是国家代号集合，不能重复。值是国家集合，可以重复。

![](C:\Users\CM\Desktop\Typora\java 图片\Map集合.jpeg)

**Map集合特性**：适合通过键快速访问值，就像查英文字典一样，键就是要查的英文单词，而值是英文单词的翻译和解释等。有的时候，一个英文单词会对应多个翻译和解释，这是与Map集合特性对应的。

Map接口直接实现类主要是**HashMap**，HashMap是基于**散列表**数据结构的实现。

##### 10.4.1　常用方法

Map集合中包含两个集合（键和值），所以操作起来比较麻烦，Map接口提供很多方法用来管理和操作集合。主要的方法如下。

1. 操作元素

   - `get(Object key)`：返回指定键所对应的值；如果Map集合中不包含该键值对，则返回null。
   - `put(Object key, Object value)`：指定键值对添加到集合中。
   - `remove(Object key)`：移除键值对。
   - `clear()`：移除Map集合中所有键值对。

2. 判断元素

   - `isEmpty()`：判断Map集合中是否有键值对，没有返回true，有返回false。
   - `containsKey(Object key)`：判断键集合中是否包含指定元素，包含返回true，不包含返回false。
   - `containsValue(Object value)`：判断值集合中是否包含指定元素，包含返回true，不包含返回false。

3. 查看集合

   - `key-Set()`：返回Map中的所有键集合，返回值是Set类型。
   - `values()`：返回Map中的所有值集合，返回值是Collection类型。
   - `size()`：返回Map集合中键值对数。

```java
import java.util.HashMap;
import java.util.Map;

public class HelloWorld {

    public static void main(String[] args) {

        Map map = new HashMap();

        map.put(102, "张三");
        map.put(105, "李四");
        map.put(109, "王五");
        map.put(110, "董六");
        //"李四"值重复
        map.put(111, "李四");
        //109键已经存在，替换原来值"王五"
        map.put(109, "刘备");


        // 打印集合元素个数
        System.out.println("集合size = " + map.size());
        // 打印集合
        System.out.println(map);

        // 通过键取值
        System.out.println("109 - " + map.get(109));
        System.out.println("108 - " + map.get(108));    

        // 删除键值对
        map.remove(109);
        // 判断键集合中是否包含109
        System.out.println("键集合中是否包含109：" + map.containsKey(109));
        // 判断值集合中是否包含 "李四"
        System.out.println("值集合中是否包含：" + map.containsValue("李四"));

        // 判断集合是否为空
        System.out.println("集合是空的：" + map.isEmpty());

        // 清空集合
        map.clear();
        System.out.println(map);
    }
}
```

运行结果：

```
集合size = 5
{102=张三, 105=李四, 109=刘备, 110=董六, 111=李四}
109 - 刘备
108 - null
键集合中是否包含109：false
值集合中是否包含：true
集合是空的：false
{}
```

##### 10.4.2 遍历集合

Map集合遍历与List和Set集合不同，Map有两个集合，因此遍历时可以只遍历值的集合，也可以只遍历键的集合，也可以同时遍历。这些遍历过程都可以使用for-each循环和迭代器进行遍历。

```java
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class HelloWorld {

    public static void main(String[] args) {

        Map map = new HashMap();

        map.put(102, "张三");
        map.put(105, "李四");
        map.put(109, "王五");
        map.put(110, "董六");
        map.put(111, "李四");

        // 1.使用for-each循环遍历
        System.out.println("--1.使用for-each循环遍历--");
        // 获得键集合
        Set keys = map.keySet();                                    
        for (Object key : keys) {
            int ikey = (Integer) key; // 自动拆箱                   ②
            String value = (String) map.get(ikey); // 自动装箱      ③
            System.out.printf("key=%d - value=%s \n", ikey, value);
        }

        // 2.使用迭代器遍历
        System.out.println("--2.使用迭代器遍历--");
        // 获得值集合
        Collection values = map.values();
        // 遍历值集合
        Iterator it = values.iterator();
        while (it.hasNext()) {
            Object item = it.next();
            String s = (String) item;
            System.out.println("值集合元素: " + s);
        }
    }
}

```

运行结果：

```java
--1.使用for-each循环遍历--
key=102 - value=张三 
key=105 - value=李四 
key=109 - value=王五 
key=110 - value=董六 
key=111 - value=李四 
--2.使用迭代器遍历--
值集合元素: 张三
值集合元素: 李四
值集合元素: 王五
值集合元素: 董六
值集合元素: 李四
```

### 十一：泛型

泛型可以最大限度地重用代码、保护类型的安全以及提高性能。泛型特性对Java影响最大是集合框架的使用。

#### 11.1  概述

```java
import java.util.ArrayList;
import java.util.List;

public class HelloWorld {

    public static void main(String[] args) {

        List list = new ArrayList();

        // 向集合中添加元素
        list.add("1");
        list.add("2");
        list.add("3");
        list.add("4");
        list.add("5");

        // 遍历集合
        //取出的元素是Object类型
        for (Object item : list) {
            //强制类型转换
            Integer element = (Integer) item;                
            System.out.println("读取集合元素: " + element);
        }
    }
}
```

运行结果：

```java
Exception in thread "main" java.lang.ClassCastException: java.lang.String cannot be cast to java.lang.Integer
	at HelloWorld.main(HelloWorld.java:19)
```

从异常堆栈跟踪信息可知，在源代码代码第23行试图将java. lang. String对象java. lang. Integer对象。

强制类型转换是有风险的，如果不进行判断就臆断进行类型转换会发生Class-Cast-Exception异常。

修改过的代码：

```java
import java.util.ArrayList;
import java.util.List;

public class HelloWorld {

    public static void main(String[] args) {
        //使用string泛型
        List<String> list = new ArrayList<String>();           

        // 向集合中添加元素
        list.add("1");
        list.add("2");
        list.add("3");
        list.add("4");
        list.add("5");
        //list.add(new Date); //发生编译错误

        // 遍历集合
        // 使用for-each循环遍历
        for (String item : list) {
            //Integer element = (Integer) item;
            System.out.println("读取集合元素: " + item);
        }

    }
}
```

输出结果：

```java
读取集合元素: 1
读取集合元素: 2
读取集合元素: 3
读取集合元素: 4
读取集合元素: 5
```

**泛型作用**：尖括号中可以任何的引用类型，它限定了集合中是能存放该种类型的对象，

#### 11.2 使用泛型

泛型对于Java影响最大就是集合了，Java 5之后所有的集合类型都可以有泛型类型，可以限定存放到集合中的类型。打开图20-1类图或打开API文档，会发现集合类型后面会有<E>，如：`Collection<E>`、`List<E>`、`ArrayList<E>`、`Set<E>`和Map<K,V>，这说明这些类型是支持泛型的。尖括号中的E、K和V等是类型参数名称，它们是实际类型的占位符。

**Set集合**使用泛型

```
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class HelloWorld {

    public static void main(String[] args) {

        Set<String> set = new HashSet<String>();
        // 向集合中添加元素
        set.add("A");
        set.add("D");
        set.add("E");
         //set.add(231);类型不符合String

        // 1.使用for-each循环遍历
        System.out.println("--1.使用for-each循环遍历--");
        for (Object item : set) {
            String s = (String) item;
            System.out.println("读取集合元素: " + s);
        }

        // 2.使用迭代器遍历
        System.out.println("--2.使用迭代器遍历--");
        Iterator it = set.iterator();
        while (it.hasNext()) {
            Object item = it.next();
            String s = (String) item;
            System.out.println("读取集合元素: " + s);
        }
    }
}

```

运行结果：

```
--1.使用for-each循环遍历--
读取集合元素: A
读取集合元素: D
读取集合元素: E
--2.使用迭代器遍历--
读取集合元素: A
读取集合元素: D
读取集合元素: E
```

**Map集合**使用泛型

```java
import java.util.*;

public class HelloWorld {

    public static void main(String[] args) {

        Map<Integer, String> map = new HashMap<Integer, String>();

        map.put(102, "张三");
        map.put(105, "李四");
        map.put(109, "王五");
        map.put(110, "董六");

        // 1.使用for-each循环遍历
        System.out.println("--1.使用for-each循环遍历--");
        // 获得键集合
        Set<Integer> keys = map.keySet();
        for (Integer key : keys) {
            String value = map.get(key);
            System.out.printf("key=%d - value=%s \n", key, value);
        }

        // 2.使用迭代器遍历
        System.out.println("--2.使用迭代器遍历--");
        // 获得值集合
        Collection<String> values = map.values();
        // 遍历值集合
        Iterator<String> it = values.iterator();
        while (it.hasNext()) {
            String item = it.next();
            System.out.println("值集合元素: " + item);
        }
    }
}
```

运行结果：

```java
--1.使用for-each循环遍历--
key=102 - value=张三 
key=105 - value=李四 
key=109 - value=王五 
key=110 - value=董六 
--2.使用迭代器遍历--
值集合元素: 张三
值集合元素: 李四
值集合元素: 王五
值集合元素: 董六
```

#### 11.3 自定义泛型类

根据自己的需要也可以自定义泛型类、泛型接口和带有泛型参数的方法。下面通过一个示例介绍一下泛型类。数据结构中有一种“队列”（queue）数据结构（如图21-3所示），它的特点是遵守“先入先出”（FIFO）规则。

![](C:\Users\CM\Desktop\Typora\java 图片\队列.jpeg)

```java
import java.util.ArrayList;
import java.util.List;

/**
 * 自定义的泛型队列集合
 */
public class HelloWorld {

    public static void main(String[] args) {

        Queue<String> q = new Queue<String>();
        q.queue("A");
        q.queue("C");
        q.queue("B");
        q.queue("D");
        //q.queue(1);//编译错误

        System.out.println(q);
        q.dequeue();

        System.out.println(q);

    }


    public static class Queue<T> {

        // 声明保存队列元素集合items
        private List<T> items;

        // 构造方法初始化是集合items
        public Queue() {
            this.items = new ArrayList<T>();
        }

        /**
         * 入队方法
         *
         * @param item 参数需要入队的元素
         */
        public void queue(T item) {
            this.items.add(item);
        }

        /**
         * 出队方法
         *
         * @return 返回出队元素
         */
        public T dequeue() {
            if (items.isEmpty()) {
                return null;
            } else {
                return this.items.remove(0);
            }
        }

        @Override
        public String toString() {
            return items.toString();
        }
    }
}
```

运行结果：

```java
[A, C, B, D]
[C, B, D]
```

#### 11.4 自定义泛型接口

自定义泛型接口与自定义泛型类类似，定义的方式完全一样。

```java
import java.util.*;
/**
 * 自定义的泛型队列集合
 */
interface IQueue<T> {

    /**
     * 入队方法
     * @param item 参数需要入队的元素
     */
    public void queue(T item);

    /**
     * 出队方法
     * @return 返回出队元素
     */
    public T dequeue();
}

/**
 * 自定义的泛型队列集合
 */
class ListQueue<T> implements IQueue<T> {

    // 声明保存队列元素集合items
    private List<T> items;

    // 构造方法初始化是集合items
    public ListQueue() {
        this.items = new ArrayList<T>();
    }

    /**
     * 入队方法
     * @param item 参数需要入队的元素
     */
    @Override
    public void queue(T item) {
        this.items.add(item);
    }

    /**
     * 出队方法
     * @return 返回出队元素
     */
    @Override
    public T dequeue() {
        if (items.isEmpty()) {
            return null;
        } else {
            return this.items.remove(0);
        }
    }

    @Override
    public String toString() {
        return items.toString();
    }

}

public class HelloWorld {

    public static void main(String[] args) {

        //需指定具体泛型类型
        ListQueue<String> qs = new ListQueue<String>();
        qs.queue("a");
        qs.queue("b");
        qs.queue("c");
        qs.queue("d");

        System.out.println(qs);
        qs.dequeue();
        System.out.println(qs);

        ListQueue<Integer> qi = new ListQueue<Integer>();
        qi.queue(1);
        qi.queue(2);
        qi.queue(3);
        qi.queue(4);

        System.out.println(qi);
        qi.dequeue();
        System.out.println(qi);
    }
}

```

运行结果：

```java
[a, b, c, d]
[b, c, d]
[1, 2, 3, 4]
[2, 3, 4]
```

#### 11.5 泛型方法

在方法中也可以使用泛型，即方法的参数类型或返回值类型，可以用类型参数表示。假设笔者想编写一个能够比较对象大小的方法，实现代码如下：

```java
public class HelloWorld {


    public static void main(String[] args) {

        System.out.println(isEquals(new Integer(1), new Integer(5)));
        System.out.println(isEquals(1, 5));// 发生了自动装箱
        System.out.println(isEquals(new Double(1.0), new Double(1.0)));
        System.out.println(isEquals(1.0, 1.0));// 发生了自动装箱
        // System.out.println(isEquals("A", "A")); //编译错误

    }

    // 限定类型参数为Number，如果去掉即可比较其它类型的对象
    public static <T extends Number> boolean isEquals(T a, T b) {
        return a.equals(b);
    }

}
```

使用泛型的类型参数限定一个边界。

### 十二：文件管理与I/O流

程序经常需要访问文件和目录，读取文件信息或写入信息到文件，在Java语言中对文件的读写是通过I/O流技术实现的。

#### 12.1 文件管理

Java语言使用File类对文件和目录进行操作，查找文件时需要实现Filename-Filter或File-Filter接口。另外，读写文件内容可以通过FileInputStream、File-Output-Stream、File-Reader和File-Writer类实现，它们属于I/O流。这些类和接口全部来源于java.io包。

##### 12.1.1 File类

File类表示一个与平台无关的文件或目录。File类名很有欺骗性，初学者会误认为是File对象只是一个文件，但它也可能是一个目录。

File类中常用的方法如下。

1. 构造方法

   - `File(String path)`：如果`path`是实际存在的路径，则该File对象表示的是目录；如果`path`是文件名，则该`File`对象表示的是文件。
   - `File(String path, String name)`：`path`是路径名，`name`是文件名。
   - `File(File dir, String name)`：`dir`是路径对象，name是文件名。

2. 获得文件名

   - `String getName( )`：获得文件的名称，不包括路径。
   - `String getPath( )`：获得文件的路径。
   - `String getAbsolutePath( )`：获得文件的绝对路径。
   - `String getParent( )`：获得文件的上一级目录名。

3. 文件属性测试

   - `boolean exists( )`：测试当前File对象所表示的文件是否存在。

   - `boolean canWrite( )`：测试当前文件是否可写。
   - `boolean canRead( )`：测试当前文件是否可读。
   - `boolean isFile( )`：测试当前文件是否是文件。
   - `boolean isDirectory( )`：测试当前文件是否是目录。

4. 文件操作

   - `long lastModified( )`：获得文件最近一次修改的时间。
   - `long length( )`：获得文件的长度，以字节为单位。
   - `boolean delete( )`：删除当前文件。成功返回 true，否则返回false。
   - `boolean renameTo(File dest)`：将重新命名当前File对象所表示的文件。成功返回 true，否则返回false。

5. 目录操作

   - `boolean mkdir( )`：创建当前File对象指定的目录。

   - `String[] list()`：返回当前目录下的文件和目录，返回值是字符串数组。

   - `String[] list(FilenameFilter filter)`：返回当前目录下满足指定过滤器的文件和目录，参数是实现`FilenameFilter`接口对象，返回值是字符串数组。

   - `File[] listFiles()`：返回当前目录下的文件和目录，返回值是File数组。

   - `File[] list-Files(File-name-Filter filter)`：返回当前目录下满足指定过滤器的文件和目录，参数是实现File-name-Filter接口对象，返回值是File数组。

   - `File[] listFiles(FileFilter filter)`：返回当前目录下满足指定过滤器的文件和目录，参数是实现File-Filter接口对象，返回值是File数组。

对目录操作有两个过滤器接口：`FilenameFilter`和`FileFilter`。它们都只有一个抽象方法`accept`,`FilenameFilter`接口中的`accept`方法如下：

- `boolean accept(File dir, String name)`：测试指定`dir`目录中是否包含文件名为`name`的文件。

`FileFilter`接口中的`accept`方法如下：

- `boolean accept(File pathname)`：测试指定路径名是否应该包含在某个路径名列表中。

##### 12.1.2 文件过滤

```java
import java.io.File;
import java.io.FileFilter;

public class Test {

    public static void main(String[] args) {
        String path = "C:/Users/CM/Desktop/Typora";
        File file = new File(path);
        // 获得该文件夹内的所有文件
        MyFileFilter mf = new MyFileFilter();
        //使用过滤器过滤文件
        File[] array = file.listFiles(mf);
        //foreach遍历输出
//        for (File file1:array){
//            System.out.println(file1);
//        }
    }

    static class MyFileFilter implements FileFilter {
//      public boolean accept(File pathname) {
//           return false;
//      }
        @Override
        //重写accept的方法
        public boolean accept(File file) {
            //当读取的文件为文件夹时
            if (file.isDirectory()) {
                //输出文件夹名称及路径
                System.out.println(file.getName());
                System.out.println(file);
                return true;
            } else {//当读取的文件为文件时
                //获得文件夹的姓名
                String name = file.getName();
                //匹配后缀为.md的文件
                if (name.endsWith(".md")) {
                    //输出文件夹名称及路径
                    System.out.println(file.getName());
                    System.out.println(file);
                    return true;
                }
            }
            return false;
        }
    }
}
```

该方法中通过判断文件名是否指定的扩展名结尾则返回true，否则返回false。

#### 12.2 I/O流概述

以CPU为中心，从外部设备读取数据到内存，进而再读入到CPU，这是输入（Input，缩写I）过程；将内存中的数据写入到外部设备，这是输出（Output，缩写O）过程。所以输入输出简称为I/O。

##### 12.2.1 Java流设计理念

如下图所示，数据输入的数据源有多种形式，如文件、网络和键盘等，键盘是默认的标准输入设备。而数据输出的目的地也有多种形式，如文件、网络和控制台，控制台是默认的标准输出设备。

![](C:\Users\CM\Desktop\Typora\java 图片\Java流设计理念.jpeg)

所有的输入形式都抽象为输入流，所有的输出形式都抽象为输出流，它们与设备无关。

##### 12.2.2　流类继承层次

以字节为单位的流称为字节流，以字符为单位的流称为字符流。Java SE提供4个顶级抽象类，两个字节流抽象类：`InputStream`和`OutputStream`；两个字符流抽象类：Reader和Writer。

1. 字节输入流

   字节输入流根类是`InputStream`。

   ![](C:\Users\CM\Desktop\Typora\java 图片\主要的字节输入.jpeg)

   ![](C:\Users\CM\Desktop\Typora\java 图片\字节输入流类继承层次.jpeg)

2. 字节输出流

   字节输出流根类是`OutputStream`。

   ![](C:\Users\CM\Desktop\Typora\java 图片\主要的字节输出流.jpeg)

   ![](C:\Users\CM\Desktop\Typora\java 图片\字节输出流类继承层次.jpeg)

3. 字符输入流

   字符输入流根类是Reader，这类流以16位的Unicode编码表示的字符为基本处理单位。

   ![](C:\Users\CM\Desktop\Typora\java 图片\主要的字节输入.jpeg)

   ![](C:\Users\CM\Desktop\Typora\java 图片\字符输入流类继承层次.jpeg)

4. 字符输出流

   字符输出流根类是Writer，这类流以16位的Unicode编码表示的字符为基本处理单位。

   ![](C:\Users\CM\Desktop\Typora\java 图片\主要的字符输出流.jpeg)

​        ![](C:\Users\CM\Desktop\Typora\java 图片\字符输出流类继承层次.jpeg)

#### 12.3 字节流

掌握字节流的API先要熟悉它的两个抽象类：`InputStream` 和`OutputStream`，了解它们有哪些主要的方法。

下面所有方法均要可能会抛出`IOException`，因此使用时要注意处理异常。

##### 12.3.1 `InputStream`抽象类

`InputStream`是字节输入流的根类，它定义了很多方法，影响着字节输入流的行为。下面详细介绍一下。

`InputStream`主要方法如下：

- `int read()`：读取一个字节，返回0到255范围内的int字节值。如果已经到达流末尾，而且没有可用的字节，则返回值-1。
- `int read(byte b[] )`：读取多个字节，数据放到字节数组b中，返回值为实际读取的字节的数量，如果已经到达流末尾，而且没有可用的字节，则返回值-1。
- `int read(byte b[ ], int off, int len)`：最多读取`len`个字节，数据放到以下标off开始字节数组b中，将读取的第一个字节存储在元素b[off]中，下一个存储在b[off+1]中，依次类推。返回值为实际读取的字节的数量，如果已经到达流末尾，而且没有可用的字节，则返回值-1。
- `void close()`：流操作完毕后必须关闭。

##### 12.3.2 `OutputStream`抽象类

`OutputStream`是字节输出流的根类，它定义了很多方法，影响着字节输出流的行为。下面详细介绍一下。

- `OutputStream`主要方法如下：
- `void write(int b)`：将b写入到输出流，b是int类型占有32位，写入过程是写入b 的8个低位，b的24个高位将被忽略。
- `void write(byte b[ ])`：将`b.length`个字节从指定字节数组b写入到输出流。
- `void write(byte b[ ], int off, int len)`：把字节数组b中从下标`off`开始，长度为`len`的字节写入到输出流。
- `void flush()`：刷空输出流，并输出所有被缓存的字节。由于某些流支持缓存功能，该方法将把缓存中所有内容强制输出到流中。
- `void close( )`：流操作完毕后必须关闭。

##### 12.3.3 文件复制

FileInputStream和`FileOutputStream`中主要方法都是继承自`InputStream`和`OutputStream`前面两个节已经详细介绍了，这里不再赘述。

`FileInputStream`构造方法主要有：

- `FileInputStream(String name)`：创建FileInputStream对象，name是文件名。如果文件不存在则抛出`FileNotFoundException`异常。
- `FileInputStream(File file)`：通过File对象创建`FileInputStream`对象。如果文件不存在则抛出`FileNotFoundException`异常。

`FileOutputStream`构造方法主要有：

- `FileOutputStream(String name)`：通过指定name文件名创建`FileOutputStream`对象。如果name文件存在，但如果是一个目录或文件无法打开则抛出`FileNotFoundException`异常。

- `FileOutputStream(String name, boolean append)`：通过指定name文件名创建`FileOutputStream`对象，append参数如果为 true，则将字节写入文件末尾处，而不是写入文件开始处。如果name文件存在，但如果是一个目录或文件无法打开则抛出`FileNotFoundException`异常。
- `FileOutputStream(File file)`：通过File对象创建`FileOutputStream`对象。如果file文件存在，但如果是一个目录或文件无法打开则抛出`FileNotFoundException`异常。
- `FileOutputStream(File file, boolean append)`：通过File对象创建`FileOutputStream`对象，append参数如果为 true，则将字节写入文件末尾处，而不是写入文件开始处。如果file文件存在，但如果是一个目录或文件无法打开则抛出`FileNotFoundException`异常。

```java
import java.io.*;

public class Test01 {
    public static void main(String[] args) {
        try (
                FileInputStream fis = new FileInputStream("E:/IDEA Room/test/src/123.txt");

                FileOutputStream fos = new FileOutputStream("E:/IDEA Room/test/src/test/新建文本文档.txt");
        ) {
            //开始时间
            long startTime = System.nanoTime();
            // 准备一个缓冲区
            byte[] b = new byte[1024];
            // 首先读取一次
            int len = 0;
            while ((len = fis.read(b)) != -1) {
                fos.write(b, 0, len);
            }
            //结束时间
            long elapsedTime = System.nanoTime() - startTime;
            System.out.println("耗时：" + (elapsedTime / 1000000.0) + " 毫秒");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

运行结果:

```java
耗时：0.085778 毫秒
```

从输出的结果看输出了两次，每次10个字节，第一次输出结果AI-162.376容易理解，它是AI-162.3764568的前10个字符；那么第二次输出的结果456862.376令人匪夷所思，事实上前4个字符（4568）是第二次读取的，后面的6个字符（62.376）是上一次读取的。

![](C:\Users\CM\Desktop\Typora\java 图片\文件读取示意图.jpeg)

过滤流实现了**装饰器（Decorator）**设计模式，这种设计模式能够在运行时扩充一个类的功能。而继承在编译时扩充一个类的功能。

`BufferedInputStream`和`BufferedOutputStream`中主要方法都是继承自`InputStream`和`OutputStream`前面两个节已经详细介绍了，这里不再赘述。下面介绍一下它们的构造方法，`BufferedInputStream`构造方法主要有：

- `BufferedInputStream(InputStream in)`：通过一个底层输入流in对象创建缓冲流对象，缓冲区大小是默认的，默认值8192。
- `BufferedInputStream(InputStream in, int size)`：通过一个底层输入流in对象创建缓冲流对象，size指定的缓冲区大小，缓冲区大小应该是2的n次幂，这样可提供缓冲区的利用率。
- `BufferedOutputStream`构造方法主要有：
- `BufferedOutputStream(OutputStream out)`：通过一个底层输出流out 对象创建缓冲流对象，缓冲区大小是默认的，默认值8192。
- `BufferedOutputStream(OutputStream out, int size)`：通过一个底层输出流out对象创建缓冲流对象，size指定的缓冲区大小，缓冲区大小应该是2的n次幂，这样可提高缓冲区的利用率。

```java
import java.io.*;

public class Test01 {
    public static void main(String[] args) {
//        InputStreamReader ir = new InputStreamReader(System.in);
//        BufferedReader in = new BufferedReader(ir);
        try (
                FileInputStream fis = new FileInputStream("E:/IDEA Room/test/src/123.txt");
                BufferedInputStream is = new BufferedInputStream(fis);

                FileOutputStream fos = new FileOutputStream("E:/IDEA Room/test/src/test/新建文本文档.txt");
                BufferedOutputStream os = new BufferedOutputStream(fos);
        ) {
            //开始时间
            long startTime = System.nanoTime();
            // 准备一个缓冲区
            byte[] b = new byte[1024];
            // 首先读取一次
            int len = 0;
            while ((len = is.read(b)) != -1) {
                os.write(b, 0, len);
            }
            //结束时间
            long elapsedTime = System.nanoTime() - startTime;
            System.out.println("耗时：" + (elapsedTime / 1000000.0) + " 毫秒");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

运行结果：

```java
耗时：0.053333 毫秒
```

使用缓冲区可以提高文件复制的速度。

#### 2.4 字符流

字符流的API主要为两个抽象类：Reader和Writer，他们的方法都声明了抛出`IOException`，因此使用时要注意处理异常。

##### 12.4.1 Reader抽象类

Reader是字符输入流的根类，它主要方法如下：

- i`nt read()`：读取一个字符，返回值范围在`0~65535(0x00~0xffff)`之间。如果因为已经到达流末尾，则返回值-1。

- `int read(char[] cbuf)`：将字符读入到数组`cbuf`中，返回值为实际读取的字符的数量，如果因为已经到达流末尾，则返回值-1。
- i`nt read(char[] cbuf, int off, int len)`：最多读取`len`个字符，数据放到以下标off开始字符数组`cbuf`中，将读取的第一个字符存储在元素`cbuf[off]`中，下一个存储在`cbuf[off+1]`中，依次类推。返回值为实际读取的字符的数量，如果因为已经到达流末尾，则返回值-1。

- `void close()`：流操作完毕后必须关闭。

##### 12.4.2 Writer抽象类

Writer是字符输入流的根类，它主要方法如下：

- `void write(int c)`：将整数值为c的字符写入到输出流，c是int类型占有32位，写入过程是写入c的16个低位，c的16个高位将被忽略。
- `void write(char[] cbuf)`：将字符数组`cbuf`写入到输出流。
- `void write(char[] cbuf, int off, int len)`：把字符数组`cbuf`中从下标off开始，长度为`len`的字符写入到输出流。
- `void write(String str)`：将字符串`str`中的字符写入输出流。
- `void write(String str,int off,int len)`：将字符串`str` 中从索引off开始处的`len`个字符写入输出流。
- `void flush()`：刷空输出流，并输出所有被缓存的字符。由于某些流支持缓存功能，该方法将把缓存中所有内容强制输出到流中。
- `void close( )`：流操作完毕后必须关闭。

##### 12.4.3　案例：文件复制

`FileReader`构造方法主要有：

- `FileReader(String fileName)`：创建`FileReader`对象，`fileName`是文件名。如果文件不存在则抛出`FileNotFoundException`异常。
- `FileReader(File file)`：通过File对象创建`FileReader`对象。如果文件不存在则抛出`FileNotFoundException`异常。

`FileWriter`构造方法主要有：

- `FileWriter(String fileName)`：通过指定`fileName`文件名创建`FileWriter`对象。如果`fileName`文件存在，但如果是一个目录或文件无法打开则抛出`FileNotFoundException`异常。
- `FileWriter(String fileName, boolean append)`：通过指定`fileName`文件名创建`FileWriter`对象，append参数如果为 true，则将字符写入文件末尾处，而不是写入文件开始处。如果`fileName`文件存在，但如果是一个目录或文件无法打开则抛出`FileNotFoundException`异常。
- `FileWriter(File file)`：通过File对象创建`FileWriter`对象。如果file文件存在，但如果是一个目录或文件无法打开则抛出`FileNotFoundException`异常。
- `FileWriter(File file, boolean append)`：通过File对象创建`FileWriter`对象，append参数如果为 true，则将字符写入文件末尾处，而不是写入文件开始处。如果file文件存在，但如果是一个目录或文件无法打开则抛出`FileNotFoundException`异常。

注意　字符文件流只能复制文本文件，不能是二进制文件。

```java
import java.io.*;

public class Test01 {
    public static void main(String[] args) {
        try (
                FileReader in = new FileReader("E:/IDEA Room/test/src/123.txt");

                FileWriter out = new FileWriter("E:/IDEA Room/test/src/test/新建文本文档.txt");

        ) {
            //开始时间
            long startTime = System.nanoTime();
            // 准备一个缓冲区
            char[] b = new char[1024];
            // 首先读取一次
            int len = 0;
            while ((len = in.read(b)) != -1) {
                out.write(b, 0, len);
            }
            //结束时间
            System.out.println("复制完成");
            long elapsedTime = System.nanoTime() - startTime;
            System.out.println("耗时：" + (elapsedTime / 1000000.0) + " 毫秒");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

运行结果：

```java
复制完成
耗时：0.433778 毫秒
```

##### 12.4.4 使用字符缓冲流

`BufferedReader`特有方法和构造方法有：

- `String readLine()`：读取一个文本行，如果因为已经到达流末尾，则返回值null。
- `BufferedReader(Reader in)`：构造方法，通过一个底层输入流in对象创建缓冲流对象，缓冲区大小是默认的，默认值8192。
- `BufferedReader(Reader in, int size)`：构造方法，通过一个底层输入流in对象创建缓冲流对象，size指定的缓冲区大小，缓冲区大小应该是2的n次幂，这样可提高缓冲区的利用率。

`BufferedWriter`特有方法和构造方法主要有：

- `void newLine()`：写入一个换行符。
- BufferedWriter(Writerout)：构造方法，通过一个底层输出流out 对象创建缓冲流对象，缓冲区大小是默认的，默认值8192。

- `BufferedWriter(Writerout, int size)`：构造方法，通过一个底层输出流out对象创建缓冲流对象，size指定的缓冲区大小，缓冲区大小应该是2的n次幂，这样可提高缓冲区的利用率。

```java
import java.io.*;

public class Test01 {
    public static void main(String[] args) {
        try (
                FileReader is = new FileReader("E:/IDEA Room/test/src/123.txt");
                BufferedReader bis = new BufferedReader(is);

                FileWriter os = new FileWriter("E:/IDEA Room/test/src/test/新建文本文档.txt");
                BufferedWriter bos = new BufferedWriter(os);

        ) {
            //开始时间
            long startTime = System.nanoTime();
            // 准备一个缓冲区
            char[] b = new char[1024];
            // 首先读取一次
            int len = 0;
            while ((len = bis.read(b)) != -1) {
                bos.write(b, 0, len);
            }
            //结束时间
            System.out.println("复制完成");
            long elapsedTime = System.nanoTime() - startTime;
            System.out.println("耗时：" + (elapsedTime / 1000000.0) + " 毫秒");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

运行结果：

```java
复制完成
耗时：0.256444 毫秒
```

##### 12.4.5 字节流转换字符流

`InputStreamReader`构造方法如下：

- `InputStreamReader(InputStream in)`：将字节流in转换为字符流对象，字符流使用默认字符集。
- `InputStreamReader(InputStream in, String charsetName)`：将字节流in转换为字符流对象，`charsetName`指定字符流的字符集，字符集主要有：US-ASCII、ISO-8859-1、UTF-8和UTF-16。如果指定的字符集不支持会抛出`UnsupportedEncodingException`异常。

`OutputStreamWriter`构造方法如下：

- `OutputStreamWriter(OutputStream out)`：将字节流out转换为字符流对象，字符流使用默认字符集。
- `OutputStreamWriter(OutputStream out,String charsetName)`：将字节流out转换为字符流对象，`charsetName`指定字符流的字符集，如果指定的字符集不支持会抛出`UnsupportedEncodingException`异常。

```java
import java.io.*;

public class Test01 {

    public static void main(String[] args) {

        try ( // 创建字节文件输入流对象
              FileInputStream fis = new FileInputStream("E:\\IDEA Room\\test\\src\\123.txt");
              // 创建转换流对象
              InputStreamReader isr = new InputStreamReader(fis);
              // 创建字符缓冲输入流对象
              BufferedReader bis = new BufferedReader(isr);

              // 创建字节文件输出流对象
              FileOutputStream fos = new FileOutputStream("E:\\IDEA Room\\test\\src\\test\\新建文本文档.txt");
              // 创建转换流对象
              OutputStreamWriter osw = new OutputStreamWriter(fos);
              // 创建字符缓冲输出流对象
              BufferedWriter bos = new BufferedWriter(osw)) {

            String line = null;

            while ((line = bis.readLine())!= null) {
                // 开始写入数据
                bos.write(line);
                // 写一个换行符
                bos.newLine();
            }
            System.out.println("复制完成");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
```

运行结果：

```java
复制完成
```

上述流从一个文件字节流，构建转换流，再构建缓冲流，

### 十三：多线程编程

#### 13.1 基础知识

##### 13.1.1 进程

一个进程就是一个执行中的程序，而每一个进程都有自己独立的一块内存空间、一组系统资源。在进程的概念中，每一个进程的内部数据和状态都是完全独立的。

在Windows操作系统中一个进程就是一个exe或者dll程序，它们相互独立，互相也可以通信。

##### 13.1.2 线程

线程与进程相似，是一段完成某个特定功能的代码，是程序中单个顺序控制的流程，但与进程不同的是，同类的多个线程是共享一块内存空间和一组系统资源。所以系统在各个线程之间切换时，开销要比进程小的多，正因如此，线程被称为轻量级进程。一个进程中可以包含多个线程。

##### 13.1.3 主线程

Java程序至少会有一个线程，这就是主线程，程序启动后是由JVM创建主线程，程序结束时由JVM停止主线程。主线程它负责管理子线程，即子线程的启动、挂起、停止等等操作。下图所示是进程、主线程和子线程的关系，其中主线程负责管理子线程，即子线程的启动、挂起、停止等操作。

![](C:\Users\CM\Desktop\Typora\java 图片\进程、主线程和子线程关系.jpeg)

获取主线程示例代码如下：

```java
public class HelloWorld {

    //在main()方法中当前线程就是主线程
    public static void main(String[] args) {
        //获取主线程
        Thread mainThread = Thread.currentThread();

        System.out.println("主线程名：" + mainThread.getName());
    }
}

```

#### 13.2 创建子线程

Java中创建一个子线程涉及到：`java.lang.Thread`类和`java.lang.Runnable`接口。Thread是线程类，创建一个Thread对象就会产生一个新的线程。而线程执行的程序代码是在实现Runnable接口对象的run()方法中编写的，实现Runnable接口对象是线程执行对象。

线程执行对象实现Runnable接口的`run()`方法，`run()`方法是线程执行的入口，该线程要执行程序代码都在此编写的，`run()`方法称为线程体。

##### 13.2.1 实现Runnable接口

创建线程Thread对象时，可以将线程执行对象传递给它，这需要是使用Thread类如下两个构造方法：

- `Thread(Runnable target, String name)`：target是线程执行对象，实现Runnable接口。name为线程指定一个名字。
- `Thread(Runnable target)`：target是线程执行对象，实现Runnable接口。线程名字是由JVM分配的。

 sleep是静态方法它有两个版本：

- `static void sleep(long millis)`：在指定的毫秒数内让当前正在执行的线程休眠。
- `static void sleep(long millis, int nanos)`: 在指定的毫秒数加指定的纳秒数内让当前正在执行的线程休眠。

```java
//线程执行对象
class Runner implements Runnable {
    // 编写执行线程代码
    @Override
    public void run() {
        for (int i = 0; i < 10; i++) {
            // 打印次数和线程的名字
            System.out.printf("第 %d次执行 - %s\n", i,
                    Thread.currentThread().getName());

            try {
                // 随机生成休眠时间(ms)
                long sleepTime = (long) (1000 * Math.random());
                // 线程休眠
                Thread.sleep(sleepTime);
            } catch (InterruptedException e) {
            }
        }
        // 线程执行结束
        //Thread.currentThread()可以获得当前线程对象
        System.out.println("执行完成! " + Thread.currentThread().getName());
    }
}
public class HelloWorld {

    public static void main(String[] args) {

        // 创建线程t1，参数是一个线程执行对象Runner
        Thread t1 = new Thread(new Runner());
        // 开始线程t1
        t1.start();

        // 创建线程t2，参数是一个线程执行对象Runner
        Thread t2 = new Thread(new Runner(), "MyThread");
        // 开始线程t2
        t2.start();
    }
}
```

运行结果：

```java
第 0次执行 - MyThread
第 0次执行 - Thread-0
第 1次执行 - MyThread
第 1次执行 - Thread-0
第 2次执行 - MyThread
第 3次执行 - MyThread
第 2次执行 - Thread-0
第 4次执行 - MyThread
第 5次执行 - MyThread
第 6次执行 - MyThread
第 7次执行 - MyThread
第 3次执行 - Thread-0
第 4次执行 - Thread-0
第 8次执行 - MyThread
第 9次执行 - MyThread
第 5次执行 - Thread-0
执行完成! MyThread
第 6次执行 - Thread-0
第 7次执行 - Thread-0
第 8次执行 - Thread-0
第 9次执行 - Thread-0
执行完成! Thread-0
```

`start`()方法一旦调用线程进入可以执行状态，可以执行状态下的线程等待CPU调度执行，CPU调用后线程进行执行状态，运行`run()`方法。

仔细分析一下运行结果，会发现两个线程是交错运行的，感觉就像是两个线程在同时运行。但是实际上一台PC通常就只有一颗CPU，在某个时刻只能是一个线程在运行，而Java语言在设计时就充分考虑到线程的并发调度执行。对于程序员来说，在编程时要注意给每个线程执行的时间和机会，主要是通过让线程休眠的办法（调用sleep()方法）来让当前线程暂停执行，然后由其他线程来争夺执行的机会。如果上面的程序中没有用到sleep()方法，则就是第一个线程先执行完毕，然后第二个线程再执行完毕。所以用活sleep()方法是多线程编程的关键。

##### 13.2.2 继承Thread线程类

事实上Thread类也实现了Runnable接口，所以Thread类也可以作为线程执行对象，这需要继承Thread类，覆盖run()方法。

```java
//线程执行对象
class MyThread extends Thread {

    //无参构造方法
    public MyThread() {
        //通过super调用父类Thread构造方法
        super();
    }
    //有参构造方法
    public MyThread(String name) {
         //通过super调用父类Thread构造方法
        super(name);
    }

    // 编写执行线程代码
    @Override
    public void run() {
        for (int i = 0; i < 10; i++) {
            // 打印次数和线程的名字
            System.out.printf("第 %d次执行 - %s\n", i, getName());

            try {
                // 随机生成休眠时间
                long sleepTime = (long) (1000 * Math.random());
                // 线程休眠
                sleep(sleepTime);
            } catch (InterruptedException e) {
            }
        }
        // 线程执行结束
        System.out.println("执行完成! " + getName());
    }
}

public class HelloWorld {

    public static void main(String[] args) {

        // 创建线程t1，参数是一个线程执行对象MyThread
        Thread t1 = new Thread(new MyThread());
        // 开始线程t1
        t1.start();

        // 创建线程t2，参数是一个线程执行对象MyThread
        Thread t2 = new Thread(new MyThread("MyThread"));
        // 开始线程t2
        t2.start();
    }
}
```

##### 13.2.3 使用匿名内部类和Lambda表达式实现线程体

如果线程体使用的地方不是很多，可以不用单独定义一个类。可以使用匿名内部类或Lambda表达式直接实现Runnable接口。Runnable中只有一个方法是函数式接口，可以使用Lambda表达式。

```java
public class HelloWorld {

    public static void main(String[] args) {

        // 创建线程t1，参数是实现Runnable接口的匿名内部类
        // 使用的是Thread(Runnable target)构造方法
        Thread t1 = new Thread(new Runnable() {
            // 编写执行线程代码
            @Override
            public void run() {
                for (int i = 0; i < 10; i++) {
                    // 打印次数和线程的名字
                    System.out.printf("第%d次执行 - %s\n", i, Thread.currentThread().getName());
                    try {
                        // 随机生成休眠时间
                        long sleepTime = (long) (1000 * Math.random());
                        // 线程休眠
                        Thread.sleep(sleepTime);
                    } catch (InterruptedException e) {
                    }
                }
                // 线程执行结束
                System.out.println("执行完成! " + Thread.currentThread().getName());
            }

        });
        // 开始线程t1
        t1.start();

        // 创建线程t2，参数是实现Runnable接口的Lambda表达式
        // 使用的是Thread(Runnable target, String name)构造方法，Lambda表达式是它的第一个参数
        Thread t2 = new Thread(() -> {
            for (int i = 0; i < 10; i++) {
                // 打印次数和线程的名字
                System.out.printf("第%d次执行 - %s\n", i, Thread.currentThread().getName());
                try {
                    // 随机生成休眠时间
                    long sleepTime = (long) (1000 * Math.random());
                    // 线程休眠
                    Thread.sleep(sleepTime);
                } catch (InterruptedException e) {
                }
            }
            // 线程执行结束
            System.out.println("执行完成! " + Thread.currentThread().getName());
        }, "MyThread");
        // 开始线程t2
        t2.start();
    }
}
```

结果同上。

匿名内部类和Lambda表达式不需要定义一个线程类文件，使用起来很方便。特别是Lambda表达式使代码变得非常简洁。但是客观上匿名内部类和Lambda表达式会使代码可读性变差，对于初学者不容易理解。

#### 13.3 线程的状态

在线程的生命周期中，线程会有几种状态，如下图所示，线程有5种状态。下面分别介绍一下。

1. 新建状态

   新建状态（New）是通过new等方式创建线程对象，它仅仅是一个空的线程对象。

2. 就绪状态

   当主线程调用新建线程的start()方法后，它就进入就绪状态（Runnable）。此时的线程尚未真正开始执行run()方法，它必须等待CPU的调度。

3. 运行状态

   CPU的调度就绪状态的线程，线程进入运行状态（Running），处于运行状态的线程独占CPU，执行run()方法。

4. 阻塞状态

   因为某种原因运行状态的线程会进入不可运行状态，即阻塞状态（Blocked），处于阻塞状态的线程JVM系统不能执行该线程，即使CPU空闲，也不能执行该线程。如下几个原因会导致线程进入阻塞状态：

   - 当前线程调用sleep()方法，进入休眠状态。
   - 被其他线程调用了join()方法，等待其他线程结束。
   - 发出I/O请求，等待I/O操作完成期间。
   - 当前线程调用wait()方法。

   处于阻塞状态可以重新回到就绪状态，如：休眠结束、其他线程加入、I/O操作完成和调用notify或notifyAll唤醒wait线程。

5. 死亡状态

   线程退出run()方法后，就会进入死亡状态（Dead），线程进入死亡状态有可以是正常实现完成run()方法进入，也可能是由于发生异常而进入的。

![](C:\Users\CM\Desktop\Typora\java 图片\线程状态.jpeg)

#### 13.4 线程管理

##### 13.4.1 线程优先级

线程的调度程序根据线程决定每次线程应当何时运行，Java提供了10种优先级，分别用1~10整数表示，最高优先级是10用常量MAX_PRIORITY表示；最低优先级是1用常量MIN_PRIORITY；默认优先级是5用常量NORM_PRIORITY表示。

Thread类提供了`setPriority(int newPriority)`方法可以设置线程优先级，通过`getPriority()`方法获得线程优先级。

```java
//Runner代码同上
public class HelloWorld {

    public static void main(String[] args) {

        // 创建线程t1，参数是一个线程执行对象Runner
        Thread t1 = new Thread(new Runner());
        t1.setPriority(Thread.MAX_PRIORITY);
        // 开始线程t1
        t1.start();

        // 创建线程t2，参数是一个线程执行对象Runner
        Thread t2 = new Thread(new Runner(), "MyThread");
        t2.setPriority(Thread.MIN_PRIORITY);
        // 开始线程t2
        t2.start();
    }
}
```

多次运行上面的示例会发现，`t1`线程经常先运行，但是偶尔`t2`线程也会先运行。这些现象说明了：影响线程获得CPU时间的因素，除了受到的线程优先级外，还与操作系统有关。

##### 13.4.2 等待线程结束

在介绍现在状态时提到过join()方法，当前线程调用t1线程的join()方法，则阻塞当前线程，等待t1线程结束，如果t1线程结束或等待超时，则当前线程回到就绪状态。

Thread类提供了多个版本的join()，它们定义如下：

- `void join()`：等待该线程结束。
- `void join(long millis)`：等待该线程结束的时间最长为`millis`毫秒。如果超时为0意味着要一直等下去。
- `void join(longmillis, int nanos)`：等待该线程结束的时间最长为`millis`毫秒加`nanos`纳秒。

```java
public class HelloWorld {

    //共享变量
    static int value = 0;

    public static void main(String[] args) throws InterruptedException {

        System.out.println("主线程 开始...");

        // 创建线程t1，参数是一个线程执行对象Runner
        Thread t1 = new Thread(() -> {
            System.out.println("ThreadA 开始...");
            for (int i = 0; i < 2; i++) {
                System.out.println("ThreadA 执行...");
                value++;
            }
            System.out.println("ThreadA 结束...");

        }, "ThreadA");
        // 开始线程t1
        t1.start();
        // 主线程被阻塞，等待t1线程结束
        t1.join();
        System.out.println("value = " + value);
        System.out.println("主线程 结束...");
    }
}
```

运行结果：

```java
主线程 开始...
ThreadA 开始...
ThreadA 执行...
ThreadA 执行...
ThreadA 结束...
value = 2
主线程 结束...
```

在当前线程（主线程）中调用`t1`的`join()`方法，因此会导致主线程阻塞，等待`t1`线程结束，从运行结果可以看出主线程被阻塞了

如果尝试将`t1.join()`语句注释掉，输出结果如下：

```
主线程 开始...
value = 0
主线程 结束...
ThreadA 开始...
ThreadA 执行...
ThreadA 执行...
ThreadA 结束...
```

从结果可以看出主线程运行优先。

##### 13.4.3 线程让步

线程类Thread还提供一个静态方法`yield()`，调用`yield()`方法能够使当前线程给其他线程让步。它类似于`sleep()`方法，能够使运行状态的线程放弃CPU使用权，暂停片刻，然后重新回到就绪状态。与`sleep()`方法不同的是，`sleep()`方法是线程进行休眠，能够给其他线程运行的机会，无论线程优先级高低都有机会运行。而`yield()`方法只给相同优先级或更高优先级线程机会。

```java
//线程执行对象
class Runner implements Runnable {

    // 编写执行线程代码
    @Override
    public void run() {
        for (int i = 0; i < 10; i++) {
            // 打印次数和线程的名字
            System.out.printf("第%d次执行 - %s\n", i,
                    Thread.currentThread().getName());
            //线程让步
            Thread.yield();
        }
        // 线程执行结束
        System.out.println("执行完成! " + Thread.currentThread().getName());
    }
}
下面输出代码同上
```

##### 13.4.4 线程停止

线程体中的`run()`方法结束，线程进入死亡状态，线程就停止了。但是有些业务比较复杂，例如想开发一个下载程序，每隔一段执行一次下载任务，下载任务一般会在由子线程执行的，休眠一段时间再执行。这个下载子线程中会有一个死循环，但是为了能够停止子线程，**设置一个结束变量**。

```
import java.io.*;

public class HelloWorld {

    private static String command = "";

    public static void main(String[] args) {

        // 创建线程t1，参数是一个线程执行对象Runner
        Thread t1 = new Thread(() -> {

            // 一直循环，直到满足条件在停止线程
            while (!command.equalsIgnoreCase("exit")) {
                // 线程开始工作
                // TODO
                System.out.println("下载中...");
                try {
                    // 线程休眠
                    Thread.sleep(10000);
                } catch (InterruptedException e) {
                }
            }
            // 线程执行结束
            System.out.println("执行完成!");
        });
        // 开始线程t1
        t1.start();

        try (InputStreamReader ir = new InputStreamReader(System.in);
             BufferedReader in = new BufferedReader(ir)) {
            // 从键盘接收了一个字符串的输入
            command = in.readLine();
        } catch (IOException e) {
        }

    }
}
```

运行结果：

```java
下载中...
下载中...
exit

执行完成!
```

当在控制台输入exit，然后敲Enter键，退出程序。

#### 13.5 线程安全

在多线程环境下，访问相同的资源，有可以会引发线程不安全问题。

##### 13.5.1 临界资源问题

多一个线程同时运行，有时线程之间需要共享数据，一个线程需要其他线程的数据，否则就不能保证程序运行结果的正确性。

例如有一个航空公司的机票销售，每一天机票数量是有限的，很多售票点同时销售这些机票。下面是一个模拟销售机票系统，示例代码如下：

```java
//机票数据库
class TicketDB {

    // 机票的数量
    private int ticketCount = 5;

    // 获得当前机票数量
    public int getTicketCount() {
        return ticketCount;
    }

    // 销售机票
    public void sellTicket() {
        try {
            // 等于用户付款
            // 线程休眠，阻塞当前线程，模拟等待用户付款
            Thread.sleep(1000);
        } catch (InterruptedException e) {
        }
        System.out.printf("第%d号票,已经售出\n", ticketCount);
        ticketCount--;
    }
}
public class HelloWorld {

    public static void main(String[] args) {

        TicketDB db = new TicketDB();

        // 创建线程t1
        Thread t1 = new Thread(() -> {
            while (true) {
                int currTicketCount = db.getTicketCount();
                // 查询是否有票
                if (currTicketCount > 0) {
                    db.sellTicket();
                } else {
                    // 无票退出
                    break;
                }
            }
        });
        // 开始线程t1
        t1.start();

        // 创建线程t2
        Thread t2 = new Thread(() -> {
            while (true) {
                int currTicketCount = db.getTicketCount();
                // 查询是否有票
                if (currTicketCount > 0) {
                    db.sellTicket();
                } else {
                    // 无票退出
                    break;
                }
            }
        });
        // 开始线程t2
        t2.start();
    }
}
```

运行结果：

```java
第5号票,已经售出
第5号票,已经售出
第3号票,已经售出
第3号票,已经售出
第1号票,已经售出
第1号票,已经售出
```

问题：同一张票重复销售、出现第1号票，第3号票和5张票各卖了2次，共卖了6张票。这些问题的根本原因是多个线程间共享的数据导致数据的不一致性。

##### 13.5.2 多线程同步

为了防止多线程对临界资源的访问有时会导致数据的不一致性，Java提供了“互斥”机制，可以为这些资源对象加上一把“互斥锁”，在任一时刻只能由一个线程访问，即使该线程出现阻塞，该对象的被锁定状态也不会解除，其他线程仍不能访问该对象，这就多线程同步。线程同步保证线程安全的重要手段，但是线程同步客观上会导致性能下降。

可以通过两种方式实现线程同步，两种方式都涉及到使用synchronized关键字，一种是**synchronized方法**，使用synchronized关键字修饰方法，对方法进行同步；另一种是synchronized语句，使用synchronized关键字放在对象前面限制一段代码的执行。

1. synchronized方法

synchronized关键字修饰方法实现线程同步，方法所在的对象被锁定。

```java
//机票数据库
class TicketDB {

    // 机票的数量
    private int ticketCount = 5;

    // 获得当前机票数量
    public synchronized int getTicketCount() {
        return ticketCount;
    }

    // 销售机票
    public synchronized void sellTicket() {
        try {
            // 等于用户付款
            // 线程休眠，阻塞当前线程，模拟等待用户付款
            Thread.sleep(1000);
        } catch (InterruptedException e) {
        }
        System.out.printf("第%d号票,已经售出\n", ticketCount);
        ticketCount--;
    }
}
```

2. synchronized语句

synchronized语句方式主要用于第三方类，不方便修改它的代码情况。它可以不用修改第三方类的代码。

```java
public class HelloWorld {

    public static void main(String[] args) {

        TicketDB db = new TicketDB();

        // 创建线程t1
        Thread t1 = new Thread(() -> {
            while (true) {
                synchronized (db) {
                    int currTicketCount = db.getTicketCount();
                    // 查询是否有票
                    if (currTicketCount > 0) {
                        db.sellTicket();
                    } else {
                        // 无票退出
                        break;
                    }
                }
            }
        });
        // 开始线程t1
        t1.start();

        // 创建线程t2
        Thread t2 = new Thread(() -> {
            while (true) {
                synchronized (db) {
                    int currTicketCount = db.getTicketCount();
                    // 查询是否有票
                    if (currTicketCount > 0) {
                        db.sellTicket();
                    } else {
                        // 无票退出
                        break;
                    }
                }
            }
        });
        // 开始线程t2
        t2.start();
    }
}
```

使用synchronized语句，将需要同步的代码用大括号括起来。synchronized后有小括号，将需要同步的对象括起来。

#### 13.6 线程间通信

为了实现线程间通信，需要使用Object类中声明的5个方法：

- `void wait()`：使当前线程释放对象锁，然后当前线程处于对象等待队列中阻塞状态，如图23-7所示，等待其他线程唤醒。
- `void wait(long timeout)`：同`wait()`方法，等待timeout毫秒时间。
- `void wait(long timeout, int nanos)`：同`wait()`方法，等待`timeout`毫秒加`nanos`纳秒时间。
- `void notify()`：当前线程唤醒此对象等待队列中的一个线程，如图23-7所示该线程将进入就绪状态。
- `void notifyAll()`：当前线程唤醒此对象等待队列中的所有线程，如图23-7所示这些线程将进入就绪状态。

![](C:\Users\CM\Desktop\Typora\java 图片\线程间通信.jpeg)

```java
//堆栈类
class Stack {
    // 堆栈指针初始值为0
    private int pointer = 0;
    // 堆栈有5个字符的空间
    private char[] data = new char[5];

    // 压栈方法，加上互斥锁
    public synchronized void push(char c) {
        // 堆栈已满，不能压栈
        while (pointer == data.length) {
            try {
                // 等待，直到有数据出栈
                this.wait();
            } catch (InterruptedException e) {
            }
        }
        // 通知其他线程把数据出栈
        this.notify();
        // 数据压栈
        data[pointer] = c;
        // 指针向上移动
        pointer++;
    }

    // 出栈方法，加上互斥锁
    public synchronized char pop() {
        // 堆栈无数据，不能出栈
        while (pointer == 0) {
            try {
                // 等待其他线程把数据压栈
                this.wait();
            } catch (InterruptedException e) {
            }
        }
        // 通知其他线程压栈
        this.notify();
        // 指针向下移动
        pointer--;
        // 数据出栈
        return data[pointer];
    }
}
public class HelloWorld {

    public static void main(String args[]) {

        Stack stack = new Stack();                              

        // 下面的消费者和生产者所操作的是同一个堆栈对象stack
        // 生产者线程
        Thread producer = new Thread(() -> {
            char c;
            for (int i = 0; i < 10; i++) {
                // 随机产生10个字符
                c = (char) (Math.random() * 26 + 'A');
                // 把字符压栈
                stack.push(c);
                // 打印字符
                System.out.println("生产: " + c);
                try {
                    // 每产生一个字符线程就睡眠
                    Thread.sleep((int) (Math.random() * 1000));
                } catch (InterruptedException e) {
                }
            }

        });

        // 消费者线程
        Thread consumer = new Thread(() -> {
            char c;
            for (int i = 0; i < 10; i++) {
                // 从堆栈中读取字符
                c = stack.pop();
                // 打印字符
                System.out.println("消费: " + c);
                try {
                    // 每读取一个字符线程就睡眠
                    Thread.sleep((int) (Math.random() * 1000));
                } catch (InterruptedException e) {
                }
            }

        });

        producer.start(); // 启动生产者线程
        consumer.start(); // 启动消费者线程
    }
}
```

运行结果：

```java
生产: K
消费: K
生产: S
消费: S
生产: S
消费: S
生产: L
生产: X
生产: S
消费: S
消费: X
生产: M
生产: N
生产: L
消费: L
生产: R
消费: R
消费: N
消费: M
消费: L
```

上述代码实现了同步堆栈类，该堆栈有最多5个元素的空间，压栈方法push()，该方法是一个同步方法，在该方法中首先判断是否堆栈已满，如果已满不能压栈，调用`this.wait()`让当前线程进入对象等待状态中。如果堆栈未满，程序会往下运行调用`this.notify()`唤醒对象等待队列中的一个线程。出栈方法pop()方法，与push()方法类似。

### 十四：反射

#### 14.1 Java反射机制API

Java反射机制API主要是 java.lang.Class类和java.lang.reflect包。

##### 14.1.1　java.lang.Class类

`java.lang.Class`类是实现反射的关键所在，Class类的一个实例表示Java的一种数据类型，包括类、接口、枚举、注解（Annotation）、数组、基本数据类型和void，void是“无类型”，主要用于方法返回值类型声明，表示不需要返回值。Class没有公有的构造方法，Class实例是由JVM在类加载时自动创建的。

在程序代码中获得Class实例可以通过如下代码实现；

```java
Class clz1 = String.class; 
String str = "Hello"; 
//2.通过对象的getClass()方法 
Class clz2 = str.getClass();
```

每一种类型包括类和接口等，都有一个class静态变量可以获得Class实例。另外，每一个对象都有`getClass()`方法可以获得Class实例，该方法是由Object类提供的实例方法。 

Class类提供了很多方法可以获得运行时对象的相关信息,下面的程序代码展示了其中一些方法。

```java
public class HelloWorld {
    public static void main(String[] args) { // 获得Class实例         
        // 1.通过类型class静态变量        
        Class clz1 = String.class;
        String str = "Hello";
        // 2.通过对象的getClass()方法         
        Class clz2 = str.getClass();
        //获得int类型Class实例
        Class clz3 = int.class; 
        //获得Integer类型Class实例         
        Class clz4 = Integer.class;
        System.out.println("clz2类名称：" + clz2.getName());
        System.out.println("clz2是否为接口：" + clz2.isInterface());
        System.out.println("clz2是否为数组对象：" + clz2.isArray());
        System.out.println("clz2父类名称：" + clz2.getSuperclass().getName());
        System.out.println("clz2是否为基本类型：" + clz2.isPrimitive());
        System.out.println("clz3是否为基本类型：" + clz3.isPrimitive());
        System.out.println("clz4是否为基本类型：" + clz4.isPrimitive());
    }
}
```

运行结果:

```java
clz2类名称：java.lang.String 

clz2是否为接口：false 

clz2是否为数组对象：false 

clz2父类名称：java.lang.Object 

clz2是否为基本类型：false 

clz3是否为基本类型：true 

clz4是否为基本类型：false
```

int和Integer的区别在于int是基本数据类型，所以输出结果为true，Integer是类，是引用类型。可见Class可以描述int等基本数据类型运行时实例。

##### 14.1.2　java.lang.reflect包

`java.lang.reflect`包提供了反射中用到类，主要的类说明如下：

- `Constructor`类：提供类的构造方法信息。
-  `Field`类：提供类或接口中成员变量信息。 

- `Method`类：提供类或接口成员方法信息。
-  `Array`类：提供了动态创建和访问Java数组的方法。

-  `Modifier`类：提供类和成员访问修饰符信息。


```java
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

public class HelloWorld {

    public static void main(String[] args) {
        try {
            // 动态加载xx类的运行时对象            
            Class c = Class.forName("java.lang.String"); // 获取成员方法集合            
            Method[] methods = c.getDeclaredMethods();
            // 遍历成员方法集合            
            for (Method method : methods) {
                // 打印权限修饰符，如public、protected、private                 
                System.out.print(Modifier.toString(method.getModifiers()));
                // 打印返回值类型名称                 
                System.out.print(" " + method.getReturnType().getName() + " "); // 打印方法名称                 
                System.out.println(method.getName() + "();");
            }
        } catch (ClassNotFoundException e) {
            System.out.println("找不到指定类");
        }
    }
}
```

#### 14.2 创建对象

Java反射机制提供了另外一种创建对象方法，Class类提供了一个实例方法newInstance()，通过该方法可以创建对象，使用起来比较简单，下面两条语句实现了创建字符串String对象

```java
Class clz = Class.forName("java.lang.String");
String str = (String) clz.newInstance();
```

这两条语句相当于`String str = new String()`语句。另外，需要注意`newInstance()`方法有可以会抛出`InstantiationException`和`IllegalAccessException`异常，`InstantiationException`不能实例化异常，`IllegalAccessException`是不能访问构造方法异常。

##### 14.2.1　调用构造方法

调用方法newInstance()创建对象，这个过程中需要调用构造方法，上面的代码只是调用了String的默认构造方法。如果想要调用非默认构造方法，需要使用Constructor对象，它对应着一个构造方法，获得Constructor对象需要使用Class类的如下方法： 

`Constructor[] getConstructors()`：返回所有公有构造方法Constructor对象数组。 

`Constructor[] getDeclaredConstructors()`：返回所有构造方法Constructor对象数组。 

`Constructor getConstructor(Class... parameterTypes)`：根据参数列表返回一个共有Constructor对象。参数parameterTypes是Class数组，指定构造方法的参数列表。

`Constructor getDeclaredConstructor(Class... parameterTypes)`：根据参数列表返回一个Constructor对象。参数parameterTypes同上。 示例代码如下：

```java
import java.lang.reflect.Constructor;

public class HelloWorld {
    public static void main(String[] args) {
        try {
            Class clz = Class.forName("java.lang.String");
            // 调用默认构造方法             
            String str1 = (String) clz.newInstance();
            // 设置构造方法参数类型             
            Class[] params = new Class[1];
            // 第一个参数是String             
            params[0] = String.class;
            // 获取与参数对应的构造方法             
            Constructor constructor = clz.getConstructor(params);      // 为构造方法传递参数             
            Object[] argObjs = new Object[1];             // 第一个参数传递"Hello"             
            argObjs[0] = "Hello";
            // 调用非默认构造方法，构造方法第一个参数是String类型             
            String str2 = (String) constructor.newInstance(argObjs);
            System.out.println(str2);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

##### 依赖注入实现

Java反射机制能够在运行时动态加载类，而不是在编译期。在一些框架开发中经常将要实例化的类名保存到配置文件中，在运行时从配置文件中读取类名字符串，然后动态创建对象，建立依赖关系1。采用new创建对象依赖关系是在编译期建立的，反射机制能够将依赖关系推迟到运行时建立，这种依赖关系动态注入进来称为依赖注入。

 1依赖关系是一种非常普遍的关系，如果在A中使用了B，B变化会引起A的变化，A依赖于B。 

文件中只有一行字符串，前后没有空格，它是要配置的类全名，根据自己情况修改配置信息。 HelloWorld类代码如下：

```java
public class HelloWorld {

    public static void main(String[] args) {

        try {
            String className = readClassName();                
            Class clz = Class.forName(className);              
            // 指定参数类型
            Class[] params = new Class[3];
            // 第一个参数是String
            params[0] = String.class;
            // 第二个参数是int
            params[1] = int.class;
            // 第三个参数是String
            params[2] = String.class;

            // 获取对应参数的构造方法
            Constructor constructor = clz.getConstructor(params);
            // 设置传递参数
            Object[] argObjs = new Object[3];
            // 第一个参数传递"Tony"
            argObjs[0] = "Tony";
            // 第二个参数传递18
            argObjs[1] = 18;
            // 第三个参数传递"清华大学"
            argObjs[2] = "清华大学";

            // 调用非默认构造方法
            Object p = constructor.newInstance(argObjs);        
            System.out.println(p);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 从Configuration.ini文件中读取类名
    public static String readClassName() {
             FileInputStream readfile = null;
        InputStreamReader ir = null;
        BufferedReader in = null;
        try {
            readfile = new FileInputStream("Configuration.ini");
            ir = new InputStreamReader(readfile);
            in = new BufferedReader(ir);
            // 读取文件中的一行数据
            String str = in.readLine();
            return str;
        } catch (FileNotFoundException e) {
            System.out.println("处理FileNotFoundException...");
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println("处理IOException...");
            e.printStackTrace();
        }
        return null;
    }

}
```

通过调用`readClassName()`方法从`Configuration.ini`文件中读取类名，读取Configuration.ini文件内容，采用Java I/O技术，关于I/O流这里不再赘述。

通过从配置文件`Configuration.ini`中读取的字符串创建Class对象。然后调用三个参数构造方法创建对象，这个对象是哪个类的实例，与你的`Configuration.ini`文件中配置字符串有关。

#### 14.3 调用方法

通过反射机制还可以调用方法，这与调用构造方法类似。调用方法需要使用Method对象，它对应着一个方法，获得Method对象需要使用Class类的如下方法：

- `Method[] getMethods()`：返回所有公有方法Method对象数组。
- `Method[] getDeclaredMethods()`：返回所有方法Method对象数组。
- `Method getMethod(String name, Class... parameterTypes)`：通过方法名和参数类型返回公有方法Method对象。参数parameterTypes是Class数组，指定方法的参数列表。
- `Method getDeclaredMethod(String name, Class... parameterTypes)`：通过方法名和参数类型返回方法Method对象。参数parameterTypes同上。

```java
package com.a51work6;

public class Person {

    private String name;
    private int age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setNameAndAge(String name, int age) {
        this.name = name;
        this.age = age;
    }

    @Override
    public String toString() {
        return "Person [name=" + name + ", age=" + age + "]";
    }
}

```

现在编写一个程序通过反射机制调用Person类setNameAndAge和setName方法，具体代码如下

```
package com.a51work6;

import java.lang.reflect.Method;

public class HelloWorld {

    public static void main(String[] args) {

        try {
            Class clz = Class.forName("com.a51work6.Person");
            // 调用默认构造方法
            Person person = (Person) clz.newInstance();
            System.out.println(person);

            // 指定参数类型
            Class[] params = new Class[2];
            // 第一个参数是String
            params[0] = String.class;
            // 第二个参数是int
            params[1] = int.class;

            // 获取setNameAndAge方法对象
            Method method = clz.getMethod("setNameAndAge", params);        
            // 设置传递参数
            Object[] argObjs = new Object[2];
            // 第一个参数传递"Tony"
            argObjs[0] = "Tony";
            // 第二个参数传递18
            argObjs[1] = 18;
            //调用setNameAndAge方法
            method.invoke(person, argObjs);                                
            System.out.println(person);

            // 获取getName方法对象
            method = clz.getMethod("getName");                             
            // 调用getName方法
            Object result = method.invoke(person);                         
            System.out.println(result);

        } catch (Exception e) {
            e.printStackTrace();
                    }
    }
}


```

结果:

```java
Person [name=null, age=0]
Person [name=Tony, age=18]
Tony
```

`method.invoke(person, argObjs)`语句是调用setNameAndAge方法，person是要调用的对象，argObjs是设置要传递的参数值。

`method.invoke(person)`语句是调用person的getName方法，invoke方法会返回一个Object对象，它是调用目标方法的返回数据，本例中相当于调用getName方法返回的String类型数据。

#### 14.4 调用成员变量

通过反射机制还可以调用成员变量，调用方法需要使用Field对象，它对应着一个方法，获得Field对象需要使用Class类的如下方法：

- `Field[] getFields()`：返回所有公有成员变量Field对象数组。
- `Field[] getDeclaredFields()`：返回所有成员变量Field对象数组。
- `Field getField(String name)`：通过指定公共成员变量名返回Field对象。
- `Field getDeclaredField(String name)`：通过指定成员变量名返回Field对象。

现有一个Person类，它的代码如下：

```java
package com.a51work6;

public class Person {

    private String name = "";
    private int age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "Person [name=" + name + ", age=" + age + "]";
    }
}
```

Person类有两个私有的成员变量name和age。

提示　Java的反射机制非常强大，可在类外部调用类的私有成员变量和成员方法。这种功能看似强大，事实上却破坏了面向对象封装性。

现在编写一个程序通过反射机制调用Person类的私有成员变量name和age，具体代码如下：

```java
package com.a51work6;

import java.lang.reflect.Field;

public class HelloWorld {
 public static void main(String[] args) {

        try {
            Class clz = Class.forName("com.a51work6.Person");
            // 调用默认构造方法
            Person person = (Person) clz.newInstance();

            // 返回成员变量名为name的Field对象
            Field name = clz.getDeclaredField("name");           
            //设置成员变量accessible标志为true
            name.setAccessible(true);                            
            //为成员变量name赋值
            name.set(person, "Tony");                            

            // 返回成员变量名为age的Field对象
            Field age = clz.getDeclaredField("age");             
            //设置成员变量accessible标志为true
            age.setAccessible(true);                             
            //为成员变量age赋值
            age.set(person, 18);                                 

            // 获取成员变量保存的数据
            System.out.printf("[name:%s, age:%d]",
                    name.get(person), age.get(person));          

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

```

运行结果如下：

```java
Person [name=, age=0]
Person [name=Tony, age=18]
```

上述代码第①行和第④行是通过名字返回成员变量Field对象，注意这里是有的getDeclaredField方法，而不是getField方法，因为这两个成员变量都是私有的。代码第②行和第⑤行是设置成员变量accessible标志为true，accessible是可访问性标志，值为 true 则指示反射的对象在使用时应该取消Java语言访问检查。值为false则指示反射的对象应该实施Java语言访问检查。不仅是成员变量，方法和构造方法也可以通过setAccessible(true)设置，实现对私有方法和构造方法的访问。

代码第③行和第⑥行是调用Field的void set(Object obj, Object value)方法为成员变量赋值，其中obj要访问的目标对象，value是要赋给成员变量的数据。

代码第⑦行通过调用Field的Object get(Object obj)方法获取成员变量保存的数据，其中obj要访问的目标对象，方法返回值是成员变量的保存的数据。

### 十五：注解（Annotation）

Java 5之后可以在源代码中嵌入一些补充信息，这种补充信息称为注解（Annotation），例如在方法覆盖中使用过的@Override注解，注解都是@符号开头的。

Annotation可以翻译为“注解”或“注释”，笔者推荐翻译为“注解”，因为“注释”一词已经用于说明//、/**...*/和/*...*/等符号，这里的“注释”是英文Comment翻译。

注解并不能改变程序运行的结果，不会影响程序运行的性能。有些注解可以在编译时给用户提示或警告，有的注解可以在运行时读写字节码文件信息。

#### 15.1 基本注解

无论是哪一种注解，本质上都一种数据类型，是一种接口类型。到Java 8为止Java SE提供11种内置注解。其中有5是基本注解，它们来自于java.lang包。有6个是元注解1（Meta?Annotation），它们来自于java.lang.annotation包，自定义注解会用到元注解。

1元注解就是负责注解其他的注解。

基本注解包括：@Override、@Deprecated、@SuppressWarnings、@SafeVarargs和@FunctionalInterface。下面逐一介绍一下。

1. @Override

   @Override只能用于方法，子类覆盖父类方法（或者实现接口的方法）时可以@Override注解。编译器会检查被@Override注解的方法，确保该方法父类中存在的方法，否则会有编译错误。

2. @Deprecated
   @Deprecated用来指示API已经过时了，@Deprecated可以用来注解类、接口、成员方法和成员变量。

```java
package com.a51work6;

     @Deprecated
 public class Person {                                        

         @Deprecated
         protected String name;                                   

         private int age;

         public String getName() {
             return name;
         }

         public void setName(String name) {
             this.name = name;
         }

         public int getAge() {
             return age;
         }

         public void setAge(int age) {
             this.age = age;
         }

         @Deprecated
         public void setNameAndAge(String name, int age) {        
             this.name = name;
             this.age = age;
         }

         @Override
         public String toString() {
             return "Person [name=" + name + ", age=" + age + "]";
         }

     }
上述代码第①行类Person、第②行的成员变量name和第③行的setNameAndAge方法都被@Deprecated注解。在Eclipse中这些被注解的API都画上删除线。调用这些API代码也会有删除线，示例代码如下
     package com.a51work6;

     public class HelloWorld {
          public static void main(String[] args) {

             Person p = new Person();
             p.setNameAndAge("Tony", 20);
             p.name = "Tom";
         }
     }
```

不仅代码中有删除线，而且还有编译警告。

 3. @SuppressWarnings

    @SuppressWarnings注解用来抑制编译器警告，如果你确认程序中的警告没有问题，可以不用理会。但是就是不想看到这些警告，可以使用@SuppressWarnings注解消除这些警告。

使用@SuppressWarnings注解示例代码如下

```java
     //HelloWorld.java文件
     package com.a51work6;

     import java.util.ArrayList;
     import java.util.List;

     public class HelloWorld {

         @SuppressWarnings({ "deprecation" })            
         public static void main(String[] args) {

             Person p = new Person();                    
             p.setNameAndAge("Tony", 20);                
             p.name = "Tom";                             

         }
     }
```

上述代码第①行使用@SuppressWarnings({ "deprecation" })注解了main方法，这是由于代码第②行~第④行是编译警告，因为这些API已经过时，见上一节Person代码。@SuppressWarnings注解中的deprecation表示要抑制API已经过时。使用了@SuppressWarnings注解后会发现程序代码的警告没有了。

 4. @SafeVarargs

    在介绍@SafeVarargs注解用法之前，先来看看如下代码

```java
   //HelloWorld.java文件
     package com.a51work6;

     public class HelloWorld {

         public static void main(String[] args) {

             // 传递可变参数，参数是泛型集合
             display(10, 20, 30);                            
             // 传递可变参数，参数是非泛型集合
             display("10", 20, 30);// 会有编译警告           

         }

         public static <T> void display(T... array) {        
             for (T arg : array) {
                 System.out.println(arg.getClass().getName() + ":" + arg);
             }
         }
     }
```

代码第③行声明了一种可变参数方法display，display方法参数个数可以变化，它可以接受不确定数量的相同类型的参数。可以通过在参数类型名后面加入...的方式来表示这是可变参数。可变参数方法中的参数类型相同，为此声明参数是需要指定泛型。

但是调用可变参数方法时，应该提供相同类型的参数，代码第①行调用时没有警告，而代码第②行调用时则会发生警告，这个警告是unchecked“未检查不安全代码”，就是由于将非泛型变量赋值给泛型变量所发生的。

在可变参数display前添加@SafeVarargs注解。当然可用也可以使用`@SuppressWarnings("unchecked")`注解，但@SafeVarargs注解更适合

5. @FunctionalInterface
   @FunctionalInterface注解是Java 8增加的，用于接口的注解，声明接口是函数式接口，在前面讲解Lambda表达式时介绍过函数式接口，有关@FunctionalInterface注解不再赘述。

#### 15.2 元注解

元注解包括：@Documented、@Target、@Retention、@Inherited、@Repeatable和@Native。元注解是为其他注解进行说明的注解，当自定义一个新的注解类型时，其中可以使用元注解。这一节先介绍一下这几种元注解含义，下一节在自定义注解中详细介绍它们的使用的。

1. @Documented

   如果在一个自定义注解中引用@Documented注解，那么该注解可以修饰代码元素（类、接口、成员变量和成员方法等），javadoc等工具可以提取这些注解信息。

2. @Target

   @Target注解用来指定一个新注解的适用目标。@Target注解有一个成员（value）用来设置适用目标，value是java.lang.annotation.ElementType枚举类型的数组，ElementType描述Java程序元素类型，它有10个枚举常量

3. @Retention

   @Retention注解用来指定一个新注解的有效范围，@Retention注解有一个成员（value）用来设置保留策略，value是java.lang.annotation.RetentionPolicy枚举类型，RetentionPolicy描述注解保留策略，它有3个枚举常量，

4. @Inherited

   @Inherited注解用来指定一个新注解可以被继承。假定一个类A被该新注解修饰，那么这个A类的子类会继承该新注解。

5. @Repeatable

   @Repeatable注解是Java 8新增加的，它允许在相同的程序元素中重复注释，可重复的注释必须使用@Repeatable进行注释。

6. @Native

   @Native注解一个成员变量，指示这个变量可以被本地代码引用。常常被代码生成工具使用。

#### 15.3 自定义注解

如果前面的Java SE提供的11内置注解不能满足你的需求，可以自定义注解，注解本质是一种接口，它是java.lang.annotation.Annotation接口的子接口，是引用数据类型。

##### 15.3.1声明注解

声明自定义注解可以使用@interface关键字实现

```java
public @interface Marker{

     }
```

 上述代码声明一个Marker注解，@interface声明一个注解类型，它前面的访问限定修饰符与类一样有两种：公有访问权限和默认访问权限。

注意　关于注解源程序文件与类一样，一个源程序文件中可以声明多个注解，但只能有一个是公有访问权限的，源程序文件命名与公有访问权限的注解名一致。

Marker注解中不包含任何的成员，这种注解称为标记注解（Marked Annotation），基本注解中的@Override就属于标记注解。根据需要注解中可以包含一些成员.

注解中的成员也可以有默认值，示例代码如下

```java
     //带有默认值注解
     @interface MyAnnotation1 {

         String value() default "注解信息";

         int count() default 0;
     }
 package com.a51work6;

     @Marker                                        
     public class HelloWorld {

         @MyAnnotation(value = "Annotation")        
         private String info = "";

         @MyAnnotation1(count = 10)                 
         public static void main(String[] args) {

         }
     }
```

默认情况下注解可以修饰任意的程序元素（类、接口、成员变量、成员方法和数据类型等）。代码第①行使用@Marker注解修饰类。代码第②行是@MyAnnotation(value = "Annotation")注解修饰成员变量，其中value = "Annotation"是为value成员提供数值。代码第③行是@MyAnnotation1(count = 10) 注解修饰成员方法，@MyAnnotation1有两个成员，但是只为count成员赋值，另外一个成员value使用默认值。

##### 15.3.2　案例：使用元注解

上一节声明注解只是最基本形式的注解，对于复杂的注解可以在声明注解时使用元注解。下面通过一个案例介绍一下在自定义注解中使用元注解，在本案例中定义了两个注解。

首先看看第一个注解MyAnnotation，它用来修饰类或接口，MyAnnotation代码如下：

```java
import java.lang.annotation.ElementType;
     import java.lang.annotation.Retention;
     import java.lang.annotation.RetentionPolicy;
     import java.lang.annotation.Documented;
     import java.lang.annotation.Target;

     @Documented                                         
     @Target({ ElementType.TYPE })                       
     @Retention(RetentionPolicy.RUNTIME)                 
           public @interface MyAnnotation {                    
         String description();                          
     }
```

上述代码第⑤行是声明注解类型MyAnnotation，其中使用了三个元注解修饰MyAnnotation注解，代码第①行使用@Documented指定MyAnnotation注解信息可以被javadoc工具读取。代码第②行使用@Target({ ElementType.TYPE })指定MyAnnotation注解用于修饰类和接口等类型。代码第③行@Retention(RetentionPolicy.RUNTIME)指定MyAnnotation注解信息可以在运行时被读取。代码第⑤行的description是MyAnnotation注解的成员。



 
