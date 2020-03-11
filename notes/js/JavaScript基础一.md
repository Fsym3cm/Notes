JavaScript基础

## JavaScript 第一季

### 第一章 JavaScript概述

诞生与1995年，由Netscape公司设计及实现

它是一种脚本语言，主要用于Web前端开发中，运行在浏览器中，目前也开始用于服务器端

一个完整的实现包括以下三部分：

![](../../Typora/js图片/JavaScript组成部分.jpg)

**JavaScript典型使用场景(前端)**

-  客户端数据有效性检验
-  页面特效
-  使用Ajax与服务器端进行数据交互
-  实现富客户端

**JavaScript基本执行原理**

![](../../Typora/js图片/JavaScript基本执行原理.PNG)

**JavaScript的特点**

-  解释型语言
-  弱类型
-  动态类型
-  基于对象
-  事件驱动

**ECMAScript**

由Ecma国际通过ECMA-262标准化的脚本程序设计语言该语言不提供实现，但规定了语言基础，所以可以在此基础上实现与扩展,JavaScript，Adobe ActionScript都是其实现

**发展历史：**

1998年6月，ECMAScript 2.0版发布

2015年6月17日，ECMAScript 6发布正式版本，即ECMAScript 2015。

###          第二章 JavaScript入门  

1. 在页面使用JavaScript

   使用<script>标签直接将代码写在该标签内

2. 引入外部JavaScript文件(一般以js为后缀

   <script>的位置通常放<head>中为了避免呈现网页出现延迟，可以放在body内容后部

3. 变量的声明与赋值

   ```js
   定义变量
   var  count;
   
   赋值
   count = 5;
   
   var count = 10;
   var x, y, z = 10;
   ```

   “var” － 用于声明变量的关键字“count” － 变量名

   同时声明和赋值变量

   声明多个变量

4. 词法结构

   - 区分大小写

   - 注释：单行: //   多行: /*      */

   - 标识符:使用驼峰命名法，尽量有意义，不能使用关键字

   - 可选的分号：建议不省略分号

5. 浏览器中查看效果

   - 使用alert函数，将信息弹出

   - 使用console.log函数，将信息输出到浏览器的控制台

### 第三章 变量与数据类型

**变量用于保存值的一个符号**，当程序需要将值保存起来以备以后使用时，可以将值赋值给一个变量。

**变量的声明**

 使用var关键字声明变量

```JS
var name; //默认值是undefined

var num=3;
```

 省略var表示该变量是一个全局变量，不推荐

 可同时声明多个变量，变量之间使用逗号隔开

**变量的命名规则**

-  字母，下划线，美元符号，数字组成
- 不能是数字开头
- 不能是关键字

 **数据类型的概念**

-  它决定了在内存中开辟一个多大的空间给这个变量来存储数据
-  JavaScript中的变量的数据类型是由变量的值决定的
-  按照惯例：采用驼峰大小写格式，即首字母小写，其他单词的首字母大写

**数据类型的分类**

| 5种基本(简单)数据类型 | **1种引用 (复杂)数据类型** |
| --------------------- | -------------------------- |
| 字符串：String        | 对象：Object               |
| 数值:Number           |                            |
| 布尔：Boolean         |                            |
| 空：null              |                            |
| 未定义：Undefined     |                            |

**typeof操作符**

  该操作符可以判断数据的数据类型，返回一个字符串：

- undefined： 如果这个值未定义
- boolean：值是布尔值
- string：值是字符串
- number：值是数字
- object：值是对象或null
- function：值是函数

####         3.1 数据类型之数值

**Number**

1. 所有的数值都以IEEE-764 64位存储

2. 可以使用字面量赋值

3. 支持三种进制，但进行数学运算时都转换为10进制

   - 十进制：最基本的数值

   - 八进制：严格模式下无效，以0开头，后面跟0-7之间的数，超出范围则忽略前面的0，而当成10进制

   - 十六进制：以0x开头，后面跟0-9，A-F(大小写都行)之间的数

**浮点数值**

-  数字中必须包含一个小数点，且之后必须有至少一位数字
-  由于其占用的内存空间是整数的两倍，所以合适的浮点数会自动转换为整数
-  对于极大或极小的数，可以使用科学计数法

**数值范围**

-  数值的范围在Number.MAX_VALUE与Number.MIN_VALUE之间
-  超出该范围，该数值会自动转换为Infinity或-Infinity

**NaN**

-  Not a Number，非数值，是一个特殊的数值，表示本来要返回数值的操作未返回数值的情况
-  使用isNaN()判断是否不是数值

 特点：

- 任何涉及NaN的操作都会返回NaN
- NaN与任何值都不相等

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
//			"use strict";
			var num1=10;
			var num2=0237;
			var num3=0x123F;
			console.log(num2);
			console.log(num3);
			
			var num4=1.5;
			var num5=2.00;
			
			console.log(Number.MAX_VALUE+","+Number.MIN_VALUE);
			
			console.log(NaN==NaN);
			console.log(typeof NaN);
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
number-1.html:11  159
number-1.html:12  4671
number-1.html:17  1.7976931348623157e+308,5e-324
number-1.html:19  false
number-1.html:20  number
```

#### 3.2 数值转换  

 有三个函数可以将非数值转换为数值：

- Number()
-  parseInt()
-  parseFloat()

**Number()**：该函数可以用于任何数据类型

转换规则：

1. 如果是Boolean值，true和false分别转换为1和0

2. 如果是数字，则简单的传入和返回

3. 如果是null，返回0

4. 如果是undefined，返回NaN

5. 如果是字符串：

   - 只包含数字，转换为十进制数，会忽略前面的0

   - 包含有效的浮点格式，转换为对应的浮点数，忽略前面的0

   - 包含有效的16进制数，则转换为对应的十进制数

   - 字符串是空的，转换为0

   - 除此之外，转换为NaN

6. 如果是对象，调用其valueOf()方法，然后依据前面的规则转换，如果返回的是NaN，则调用对象的toString()方法，则再次依据前面的规则进行转换

**parseInt()**： 更合理的转换

-  会忽略前面的空格，直到找到第一个非空格字符，接着继续往后解析字符，直到解析完或遇到一个非数字字符
-  可以传入进制作为参数

 **parseFloat()**： 用于将字符串转换为浮点数值

- 第一个小数点是有效的，后面的小数点是无效的
- 始终忽略0
- 不能指定进制作为参数
- 如果能转换为整数，则会转换为整数

 

```js
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			console.log(Number(123));
			console.log(typeof Number("34"));
			console.log(Number(false));
			console.log(Number(null));
			console.log(Number(undefined));
			console.log(Number("034"));
			console.log(Number("03.14"));
			console.log(Number("0x34a")); //0x即16进制
			console.log(Number(""));
			console.log(Number("abc"));
			
			console.log(parseInt("123px"));
			
			console.log(parseInt("123",9));
			
			console.log(parseFloat("12.3.12.3"));
		</script>
	</head>

	<body>
	</body>
</html>
```

 运行结果：

```js
number-2.html:8  123
number-2.html:9  number
number-2.html:10  0
number-2.html:11  0
number-2.html:12  NaN
number-2.html:13  34
number-2.html:14  3.14
number-2.html:15  842
number-2.html:16  0
number-2.html:17  NaN
number-2.html:19  123
number-2.html:21  102
number-2.html:23  12.3
```

#### 3.3 数据类型之布尔  

 **布尔类型表示真或假，具有两个值：true和false**

**Boolean**

- 可以对任何类型的变量调用Boolean函数返回一个Boolean值
- 在条件结构中会自动进行转换

转换规则：                                                                

| 数据类型  | 转换为true的值 | 转换为false的值 |
| --------- | -------------- | --------------- |
| Boolean   | true           | false           |
| String    | 任何非空字符串 | 空字符串        |
| Number    | 任何非零数字   | 0和NaN          |
| Object    | 任何对象       | Null            |
| Undefined |                | undefined       |

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var b1=true;
			var b2="false";
			console.log(typeof b1);
			console.log(typeof b2);
			
			console.log(Boolean(true));
			console.log(Boolean("  "));
			console.log(Boolean(100));
			console.log(Boolean(0));
			console.log(Boolean(NaN));
			console.log(Boolean(null));
			console.log(Boolean(undefined));
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
boolean.html:9  boolean
boolean.html:10  string
boolean.html:12  true
boolean.html:13  true
boolean.html:14  true
boolean.html:15  false
boolean.html:16  false
boolean.html:17  false
boolean.html:18  false
```

#### 3.4 数据类型之字符串  

字符串代表0个或多个字符组成的字符序列，它的特点是不可变。

**赋值方式**

-  可以使用双引号或单引号表示
-  使用new String()

**其他数据类型转换为字符串**

1.  调用toString()方法，数值调用该方法则可以传入一个参数表示基数(进制)

2. 使用String()函数

   - 如果值有toString()，则调用之

   - 如果值是null，则返回”null”

   - 如果值是undefined，则返回” undefined”

3. 使其与””相加

**转义字符**：是一些特殊的字符字面量，用于表示非打印字符，或具有其他用途的字符

| 字面量 | 含义 | 字面量 | 含义                      |
| ------ | ---- | ------ | ------------------------- |
| \n     | 换行 | \\\    | 斜杠                      |
| \t     | 制表 | \’     | 单引号                    |
| \b     | 空格 | \”     | 双引号                    |
| \r     | 回车 | \xnn   | 16进制代码表示字符        |
| \f     | 进纸 | \unnn  | 16进制代码表示Unicode字符 |

#### 3.5 数据类型之null与undefined

**Null**

-  该类型只有唯一的值null
-  表示空对象，使用typeof会返回object
-  null==undefined返回的是true

**Undefined**

1. Undefined类型唯一的值就是undefined

2. 在使用var声明变量但未赋初始值时该变量的值就是undefined

3. 与未声明的变量之间的比较

   - 后者会产生错误

   - 使用typeof都会得到undefined

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			console.log(typeof null);
			console.log(null == undefined);
			var num=undefined;
			console.log(num);
			
			//console.log(num1);
			console.log(typeof num1);
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
null.html:7  object
null.html:8  true
null.html:10  undefined
null.html:13  undefined
```

### 第四章 运算符

#### 4.1 运算符-1

- 运算符用于将一个或多个变量连接成一个完整的表达式进行运算
-  JavaScript中的运算符可以应用于很多不同的数据类型，它们在运算前会自动转换成合适的数据类型，然后再进行运算

运算符分类

 

1. 按照参与运算的变量数量分类：

   - 一元运算符

   - 二元运算符

   - 三元运算符

2. 按照功能分类：

   - 赋值

   - 数学

   - 比较

   - 逻辑

   - 条件

   - 逗号

   - 位运算（使用少不介绍）

**一元运算符**：只能操作一个数的运算符称为一元运算符

-  +与-
-  ++与--
-  typeof，delete，void

**+ 与 -**

1. **+**
- 放在数值前，表示正数
  
- 放在非数值前，会像Number()一样对参与运算的数进行转换
  
2. **-**
- 放在数值前，表示负数
  
- 放在非数值前，规则与+一样，只是结果是负数

**赋值运算符**

- 语法：变量=表达式或值
- 将右边的值赋值给左边

**数学运算符**

- +(加)：进行数字相加或字符串拼接
- -(减)：进行数字相减 
- *(乘)：进行数字相乘 
- /(除)：进行数字相除
- %(求余)：进行数字求余

**复合赋值运算符**

 将赋值运算符与其他运算符结合使用，以简化赋值操作

**语法**：在=前添加其他运算符

```js
示例：

  var num = 100;

  num += 200;
```

**++与--**

- 对值进行自增1或自减1
- 在操作数之后，先参与其他运算再增加或减少1
- 在操作数之前，先增加或减少1再进行运算

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var num=10;
			var num1=+num;
			num1=-num;
			console.log(num1)
			console.log(12+23);
			console.log("12"+23);
			console.log(true+12);
			console.log("a"+true+12);
			
			console.log(12/5);
			console.log(12%5);//2
			console.log(-12%5);//-2
			console.log(12%-5);//2
			console.log(-12%-5);//-2
			
			console.log("12"-"10");
			console.log("12"/"10");
			console.log("abc"/"de");
			
			var num2=10;
			num2+=20;
			console.log(num2);
			
			var num3=10;
			num3++;
			console.log(num3);
			num3--;
			console.log(num3);
			++num3;
			console.log(num3);
			--num3;
			console.log(num3);
			
			console.log(num3++);//10
			console.log(num3);//11
			console.log(num3--);//11
			console.log(num3);//10
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
operator-1.html:10  -10
operator-1.html:11  35
operator-1.html:12  1223
operator-1.html:13  13
operator-1.html:14  atrue12
operator-1.html:16  2.4
operator-1.html:17  2
operator-1.html:18  -2
operator-1.html:19  2
operator-1.html:20  -2
operator-1.html:22  2
operator-1.html:23  1.2
operator-1.html:24  NaN
operator-1.html:28  30
operator-1.html:32  11
operator-1.html:34  10
operator-1.html:36  11
operator-1.html:38  10
operator-1.html:40  10
operator-1.html:41  11
operator-1.html:42  11
operator-1.html:43  10
```

#### 4.2 运算符-2  

**比较运算符**

 比较运算符的结果是布尔类型

- \>：大于

- <：小于
- =：大于或等于
- <=：小于或等于
- ==：等于，只要值相等或转换之后的值相等，结果就是true
- !=：不等于
- ===：全等于，需要数据类型一致且值相等，结果才是true
- !==：不全等于

 **逻辑运算符**

1. &&(与)

   - 只要&&前面是false，结果都是&&前面的值

   - 只要&&前面是true，结果都是&&后面的值

2. ||(或)

   - 只要“||”前面为false，结果都返回“||”后面的值。

   - 只要“||”前面为true，结果都返回“||”前面的值。

3. !(非)

   - 一元运算符，结果是参与运算的值取反

**注意：&&和||有短路的特点**

```js
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			console.log(4 > 3);
			console.log(400 > "abc"); //当数字和字符串比较时，字符串即变成NAN
			console.log(true == 1);
			console.log(true === true);
			console.log(null == undefined);
			console.log(null === undefined);
			console.log(null == null);
			console.log(undefined === undefined);
			console.log(NaN === NaN);
			console.log(true && true);
			console.log(true && false);
			console.log(false && false);
			console.log(false && true);
			
			console.log(true&&"abc");
			console.log(undefined&&"abc");
			
			console.log(false||"abc");
			console.log(undefined||"abc");
			console.log("abc"||"");
			
			console.log(!"abc");
			
			var num=10;
			console.log(num>10&&num++<15);
			console.log(num);//10
			console.log(num<20 || num-->10);
			console.log(num);
		</script>
	</head>

	<body>
	</body>

</html>
```

运行结果：

```js
operator-2.html:8  true
operator-2.html:9  false
operator-2.html:10  true
operator-2.html:11  true
operator-2.html:12  true
operator-2.html:13  false
operator-2.html:14  true
operator-2.html:15  true
operator-2.html:16  false
operator-2.html:17  true
operator-2.html:18  false
operator-2.html:19  false
operator-2.html:20  false
operator-2.html:22  abc
operator-2.html:23  undefined
operator-2.html:25  abc
operator-2.html:26  abc
operator-2.html:27  abc
operator-2.html:29  false
operator-2.html:32  false
operator-2.html:33  10
operator-2.html:34  true
operator-2.html:35  10
```

#### 4.3 运算符-3

**条件(三元)运算符**

语法：

- 表达式1?表达式2 :表达式3

规则：

- 当表达式1的值为true时，结果是表达式2的值

- 当表达式1的值为false时，结果是表达式3的值

**逗号运算符**

-  允许在一条语句中执行多个操作
-  用于赋值，则返回表达式中的最后一个值

**运算符的优先级**

- JavaScript中的运算符优先级是一套规则
- 该规则在计算表达式时控制运算符执行的顺序
- 具有较高优先级的运算符先于较低优先级的运算符执行
- 具有相同优先级的运算符按从左至右的顺序求值
- 小括号可用来改变运算符优先级所决定的求值顺序

**常见运算符的优先级顺序(高到低)**

- ++， --，!
- ，/， %
- +，-
- < ，<=， >， >=
- == != === !==
- &&
- ||
- ?:
- =
- 复合赋值
- 逗号

### 第五章 条件语句

#### 5.1 条件-1

**if条件结构**

```js
//基本的if条件结构
if ( 条件) {
//语句

}

//if-else结构

if ( 条件 ) {
//语句1 }else {
//语句2
 
}

//多重if结构

if ( 条件 ) {
//语句

}
else if ( 条件
//语句

}
else {
//语句

}
```

```js
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var num = 11;
			if (num % 2 == 0) {
				console.log("偶数");
			} else {
				console.log("奇数");
			}
			var score = -19;
			if (score >= 90 && score <= 100) {
				console.log("优");
			} else if (score >= 80 && score < 90) {
				console.log("良");
			} else if (score >= 60 && score < 80) {
				console.log("中");
			} else if (score >= 0 && score < 60) {
				console.log("差");
			} else {
				console.log("分数不合法");
			}
		</script>
	</head>

	<body>
	</body>

</html>
```

运行结果：

```js
if.html:12  奇数
if.html:24  分数不合法
```

#### 5.2 条件-2  

**switch结构**

```js
switch (表达式) {     //计算表达式的值
 
    case  值1:
          语句;      //如果等于值1
        break;

    case 值 2:       //如果等于值2
         语句;
        break;

   default:          //如果没有找到匹配的值
        语句;
        
}

```

**switch结构的特点**

- switch语句中可使用任意数据类型
-  每个case的值可以是常量，也可以是变量，甚至表达式
-  进行比较时，进行全等比较
-  break可以省略

```js
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var num = 4;
			switch (num) {
				default:
					console.log("d");
				case 1:
					console.log("a");
					break;
				case 2:
					console.log("b");
					//break;
				case 3:
					console.log("c");
					//break;
				
			}
		</script>
	</head>

	<body>
	</body>

</html>
```

运行结果：

```js
switch.html:11  d
switch.html:13  a
```

### 第六章 循环     

#### 6.1 循环-1  

循环结构：循环是重复的执行相同的代码

 JavaScript中的循环实现方式

-  while
-  do-while
-  for
-  for..in

 **while循环**  

```js
while ( 循环条件 ) {  //符合条件，循环继续执行；否则，循环退出

循环操作              //循环中被重复执行的操作

}

```

**do-while循环**  

```js
do {                    //先执行一遍循环操作

循环操作
 
} while ( 循环条件 );    //符合条件，循环继续执行；否则，循环退出
```

​    **特点：先执行，再判断**

while循环和do-while循环的区别 

1. 语法不同：while先判断再执行，do-while先执行再判断。

2. 初始情况不满足循环条件时

   - while循环一次都不会执行

   - do-while循环不管任何情况都至少执行一次

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var i=1;
			while(i<10){
				console.log(i*2);
				i++;
			}
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
while.html:9  2
while.html:9  4
while.html:9  6
while.html:9  8
while.html:9  10
while.html:9  12
while.html:9  14
while.html:9  16
while.html:9  18
```

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var i=1;
			do{
				console.log(i*2);
				i++;
			}while(i<10);
		</script>
	</head>
	<body>
	</body>
</html>

```

运行结果：同上。

#### 6.2 循环-2  

**for循环的语法和执行顺序**

```js
for (   var i = 0 ;	i  < 100 ;	i++ ) {

console.log(“跟老谭学JavaScript-”+i);

}
```

特殊情况：**for语句中的三个语句都是可选的** 

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			//计算1-100之间的整数之和
			var result=0;
			for(var i=1;i<=100;i++){
				result+=i;
			}
			console.log(result);
			/*for(var i=0;i<100;){
				
			}*/
		</script>
	</head>
	<body>
	</body>
</html>

```

运行结果：

```js
for.html:12  5050
```

#### 6.3 循环-3  

**break**：改变程序控制流

用于do-while、while、for中时，可跳出循环而执行循环后面的语句

```js
while(…) {
……
break;         //跳出整个循环
……
}

```

**break通常在循环中与条件语句一起使用**

**continue**：只能用在循环里

作用：跳过循环体中剩余的语句而执行下一次循环

```js
while(…) {

……

continue;      //继续下一次循环

……

}
```

 **continue通常与条件语句一起使用，加速循环**

break对比continue

1. 使用场合

   - break可用于switch结构和循环结构中

   - continue只能用于循环结构中

2. 作用（循环结构中）

   - break语句终止某个循环，程序跳转到循环块外的下一条语句。

   - continue跳出本次循环，进入下一次循环

**循环结构总结：需要多次重复执行一个或多个任务的问题考虑使用循环来解决。**

**相同点：**

- 无论哪一种循环结构，都有4个必不可少的部分：初始部分、循环条件、循环体、迭代部分。

**不同点：**

1. 语法

2. 执行顺序

   - while 循环：先判断，再执行

   - do-while循环：先执行，再判断

   - for循环：先判断，再执行

3. 适用情况

   - 循环次数确定的情况，通常选用for循环

   - 循环次数不确定的情况，通常选用while和do-while循环

```js
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var result = 0;
			for (var i = 1;; i++) {
				result += i;
				if (result >= 2000) {
					console.log(i);
					break;
				}
			}
		</script>
	</head>

	<body>
	</body>

</html>
```

运行结果：

```js
break.html:12  63
```

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			for(var i=1;i<=100;i++){
				if(i%3!=0){
					continue;
				}
				console.log(i);
			}
		</script>
	</head>
	<body>
	</body>
</html>

```

运行结果：

```js
continue.html:11  3
continue.html:11  6
continue.html:11  9
continue.html:11  12
continue.html:11  15
continue.html:11  18
continue.html:11  21
continue.html:11  24
continue.html:11  27
continue.html:11  30
continue.html:11  33
continue.html:11  36
continue.html:11  39
continue.html:11  42
continue.html:11  45
continue.html:11  48
continue.html:11  51
continue.html:11  54
continue.html:11  57
continue.html:11  60
continue.html:11  63
continue.html:11  66
continue.html:11  69
continue.html:11  72
continue.html:11  75
continue.html:11  78
continue.html:11  81
continue.html:11  84
continue.html:11  87
continue.html:11  90
continue.html:11  93
continue.html:11  96
continue.html:11  99
```

### 第七章 数组  

-  数组是值的有序集合
-  每一个值称为元素，每个元素在数组中都有一个位置，该位置称为索引
- 数组是对象的一种特殊形式

**数组的特点**

-  无类型：数组元素可以是任意类型
-  动态：长度可以根据需要增加或减少

**创建数组**  

```js
var a=[];

var a=[10,”hello”,true];

var a=[10,,20,];

var a=new Array();

var a=new Array(10);

var a=new Array(1,2,3,”hello”);
```

**元素的赋值与读取**

使用[ ]访问数组中的一个元素:

```js
a[0]=10;

var num=a[0];
```

**索引**

-  从0开始，是一个0-2*32-2的正整数
-  在使用时，会自动转换为对应的字符串

**length属性**

-  表示数组的长度
-  可以使用程序修改其值
-  可以根据数组中元素的数量自动增加

**数组遍历**

```js
for(var i=0;i<a.length;i++){ 

console.log(a[i]);

}

for(var i in a){

console.log(a[i]);

}
```

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var num=[1,2,3,4,5,"one",true];
			num["0"]=10;
			console.log(num["5"]);
			num[10]=10;
			console.log(num.length);
			num.length=2;
			console.log(num[19]);
			
			var num2=[1,2,3,4,5];
			num2[10]=11;
			for (var i=0;i<num2.length;i++) {
				console.log(num2[i]);
			}
			
			for(var i in num2){
				console.log(num2[i]);
			}
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var num=[1,2,3,4,5,"one",true];
			num["0"]=10;
			console.log(num["5"]);
			num[10]=10;
			console.log(num.length);
			num.length=2;
			console.log(num[19]);
			
			var num2=[1,2,3,4,5];
			num2[10]=11;
			for (var i=0;i<num2.length;i++) {
				console.log(num2[i]);
			}
			
			for(var i in num2){
				console.log(num2[i]);
			}
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
array.html:9  one
array.html:11  11
array.html:13  undefined
array.html:18  1
array.html:18  2
array.html:18  3
array.html:18  4
array.html:18  5
5array.html:18  undefined
array.html:18  11
array.html:22  1
array.html:22  2
array.html:22  3
array.html:22  4
array.html:22  5
array.html:22  11
```

### 第八章 函数  

函数允许将一些可以重复执行的代码组合在一起，以后可以任意重复使用

 在JavaScript中，函数是对象，有自己的属性和方法

**函数声明**

```js
function //关键字
  add(num1,num2){  //函数名 参数列表

    var r=num1+num2;
      return r;    //返回值
    
}

```

**函数的调用**

```js
var result=add(1,2);  //返回结果 实际参数
```

传入的实际参数数量可以与形式参数数量不等

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function add(){
				console.log("跟老谭学JavaScript!");
			}
			
			function add2(num){
				console.log(num+2);
			}
			
			function add3(num1,num2){
				console.log(num2);
				if(num2==undefined){
					num2=0;
				}
				var r=num1+num2;
				return r;
			}
			
			add();
			add2(1);
			var r=add3(2,4);
			console.log(r);
			console.log(add3(1,3));
			console.log(add3(1,2,3));
			console.log(add3(1));
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
function.html:8  跟老谭学JavaScript!
function.html:12  3
function.html:16  4
function.html:27  6
function.html:16  3
function.html:28  4
function.html:16  2
function.html:29  3
function.html:16  undefined
function.html:30  1
```



## JavaScript 第二季

### 第一章 JavaScript 对象定义

#### 1.1 对象的概念

在 JavaScript 中，对象是王。如果您理解了对象，就理解了 JavaScript。

在 JavaScript 中，几乎“所有事物”都是对象。

- 布尔是对象（如果用 *new* 关键词定义）

- 数字是对象（如果用 *new* 关键词定义）
- 字符串是对象（如果用 *new* 关键词定义）
- 日期永远都是对象
- 算术永远都是对象
- 正则表达式永远都是对象
- 数组永远都是对象
- 函数永远都是对象
- 对象永远都是对象

所有 JavaScript 值，除了原始值，都是对象。

#### 1.2 JavaScript 原始值

*原始值*指的是没有属性或方法的值。

*原始数据类型*指的是拥有原始值的数据。

JavaScript 定义了 5 种原始数据类型：

- string
- number
- boolean
- null
- undefined

原始值是一成不变的（它们是硬编码的，因此不能改变）。

假设 x = 3.14，您能够改变 x 的值。但是您无法改变 3.14 的值。

| 值        | 类型      | 注释                       |
| :-------- | :-------- | :------------------------- |
| "Hello"   | strin     | "Hello" 始终是 "Hello"     |
| 3.14      | number    | 3.14 始终是 3.14           |
| true      | boolean   | true 始终是 true           |
| false     | boolean   | false 始终是 false         |
| null      | null      | (object) null 始终是 null  |
| undefined | undefined | undefined 始终是 undefined |

#### 1.3 对象是包含变量的变量

JavaScript 变量能够包含单个的值：

```javascript
var person = "Bill Gates";
```

对象也是变量。但是对象能够包含很多值。

值按照*名称 : 值*对的形式编写（名称和值以冒号分隔）。

```js
var person = {firstName:"Bill", lastName:"Gates", age:62, eyeColor:"blue"};
```

 JavaScript 对象是*命名值*的集合。 

#### 1.4 对象属性

JavaScript 对象中的命名值，被称为*属性*。

| 属性      | 值    |
| :-------- | :---- |
| firstName | Bill  |
| lastName  | Gates |
| age       | 62    |
| eyeColor  | blue  |

以名称值对书写的对象类似于：

- PHP 中的关联数组
- Python 中的字典
- C 中的哈希表
- Java 中的哈希映射
- Ruby 和 Perl 中的散列

#### 1.5 对象方法

方法是可以在对象上执行的*动作*。

对象属性可以是原始值、其他对象以及函数。

*对象方法*是包含*函数定义*的对象属性。

| 属性      | 值                                                        |
| :-------- | :-------------------------------------------------------- |
| firstName | Bill                                                      |
| lastName  | Gates                                                     |
| age       | 62                                                        |
| eyeColor  | blue                                                      |
| fullName  | function() {return this.firstName + " " + this.lastName;} |

JavaScript 对象是被称为属性和方法的命名值的容器。

#### 1.6 创建 JavaScript 对象

通过 JavaScript，您能够定义和创建自己的对象。

有不同的方法来创建对象：

- 定义和创建单个对象，使用对象文字。
- 定义和创建单个对象，通过关键词 new。
- 定义对象构造器，然后创建构造类型的对象。

在 ECMAScript 5 中，也可以通过函数 Object.create() 来创建对象。

#### 1.7 使用对象字面量

这是创建对象最简答的方法。

使用对象文字，您可以在一条语句中定义和创建对象。

对象文字指的是花括号 {} 中的名称:值对（比如 age:62）。

下面的例子创建带有四个属性的新的 JavaScript 对象：

```
var person = {firstName:"Bill", lastName:"Gates", age:62, eyeColor:"blue"};
```

空格和折行不重要。对象定义可横跨多行：

```
var person = {
    firstName:"Bill",
    lastName:"Gates",
    age:62,
    eyeColor:"blue"
};
```

#### 1.8 使用 JavaScript 关键词 new

```javascript
var person = new Object();
person.firstName = "Bill";
person.lastName = "Gates";
person.age = 50;
person.eyeColor = "blue"; 
```

上面的两个例子结果是一样的。无需使用 new Object()。

出于简易性、可读性和执行速度的考虑，请使用第一种创建方法（对象文字方法）。

#### 1.9 JavaScript 对象是易变的

对象是易变的：它们通过引用来寻址，而非值。

如果 person 是一个对象，下面的语句不会创建 person 的副本：

```
var x = person;  // 这不会创建 person 的副本。
```

对象 x *并非* person 的副本。它*就是* person。x 和 person 是同一个对象。

对 x 的任何改变都将改变 person，因为 x 和 person 是相同的对象。

```
var person = {firstName:"Bill", lastName:"Gates", age:62, eyeColor:"blue"}
 
var x = person;
x.age = 10;           // 这将同时改变 both x.age 和 person.age
```

**注释：**JavaScript 变量不是易变的。只有 JavaScript 对象如此。

### 第二章 JavaScript 对象属性

**属性是任何 JavaScript 对象最重要的部分。**

#### 2.1 JavaScript 属性

属性指的是与 JavaScript 对象相关的值。

JavaScript 对象是无序属性的集合。

属性通常可以被修改、添加和删除，但是某些属性是只读的。

#### 2.2 访问 JavaScript 属性

访问对象属性的语法是：

```javascript
objectName.property           // person.age

objectName["property"]       // person["age"]

objectName[expression]       // x = "age"; person[x]
```

表达式必须计算为属性名。

```javascript
person.firstname + " is " + person.age + " years old.";

person["firstname"] + " is " + person["age"] + " years old.";
```

#### 2.3 JavaScript for...in 循环

JavaScript for...in 语句遍历对象的属性。

#### 2.4 语法

```javascript
for (variable in object) {
    要执行的代码
}
```

for...in 循环中的代码块会为每个属性执行一次。

循环对象的属性：

```javascript
var person = {fname:"Bill", lname:"Gates", age:62}; 

for (x in person) {
    txt += person[x];
}
```

#### 2.5 添加新属性

您可以通过简单的赋值，向已存在的对象添加新属性。

假设 person 对象已存在 - 那么您可以为其添加新属性：

```
person.nationality = "English";
```

您不能使用预留词作为属性名（或方法名）。请使用 JavaScript 命名规则。

#### 2.6 删除属性

delete 关键词从对象中删除属性：

```javascript
var person = {firstName:"Bill", lastName:"Gates", age:62, eyeColor:"blue"};
delete person.age;   // 或 delete person["age"];
```

delete 关键词会同时删除属性的值和属性本身。

删除完成后，属性在被添加回来之前是无法使用的。

delete 操作符被设计用于对象属性。它对变量或函数没有影响。

delete 操作符不应被用于预定义的 JavaScript 对象属性。这样做会使应用程序崩溃。

#### 2.7 属性值

所有属性都有名称。此外它们还有值。

值是属性的特性之一。

其他特性包括：可列举、可配置、可写。

这些特性定义了属性被访问的方式（是可读的还是可写的？）

在 JavaScript 中，所有属性都是可读的，但是只有值是可修改的（只有当属性为可写时）。

（ECMAScript 5 拥有获取和设置所有属性特性的方法）

#### 2.8 原型属性

JavaScript 对象继承了它们的原型的属性。

`delete` 关键词不会删除被继承的属性，但是如果您删除了某个原型属性，则将影响到所有从原型继承的对象。

### 第三章 JavaScript 对象方法

```javascript
var person = {
  firstName: "Bill",
  lastName : "Gates",
  id       : 648,
  fullName : function() {
    return this.firstName + " " + this.lastName;
  }
};
```

#### 3.1 JavaScript 方法

JavaScript 方法是能够在对象上执行的动作。

JavaScript *方法*是包含*函数定义*的属性。

| 属性      | 值                                                        |
| :-------- | :-------------------------------------------------------- |
| firstName | Bill                                                      |
| lastName  | Gates                                                     |
| age       | 62                                                        |
| eyeColor  | blue                                                      |
| fullName  | function() {return this.firstName + " " + this.lastName;} |

方法是存储为对象属性的函数。

#### 3.2 this 关键词

在 JavaScript 中，被称为 this 的事物，指的是拥有该 JavaScript 代码的对象。

this 的值，在函数中使用时，是“拥有”该函数的对象。

请注意 this 并非变量。它是关键词。您无法改变 this 的值。

#### 3.3 访问对象方法

```javascript
请使用如下语法创建对象方法：
methodName : function() { 代码行 }

请使用如下语法创建对象方法：
objectName.methodName()
```

您通常会把 fullName() 描述为 person 对象的方法，把 fullName 描述为属性。

fullName 属性在被通过 () 调用后会以函数形式执行。

```javascript
此例访问 person 对象的 fullName() 方法：
name = person.fullName();

如果您访问 fullName 属性时没有使用 ()，则将返回函数定义：
name = person.fullName;
```

#### 3.4 使用内建方法

此例使用 String 对象的 toUpperCase() 方法，把文本转换为大写：

```javascript
var message = "Hello world!";
var x = message.toUpperCase();
```

x 的值，在以上代码执行后将是：

```javascript
HELLO WORLD!
```

#### 3.5 添加新的方法

向对象添加方法是在构造器函数内部完成的：

```javascript
function person(firstName, lastName, age, eyeColor) {
    this.firstName = firstName;  
    this.lastName = lastName;
    this.age = age;
    this.eyeColor = eyeColor;
    this.changeName = function (name) {
        this.lastName = name;
    };
}
```

changeName() 函数 name 的值赋给了 person 的 lastName 属性。

现在您可以尝试：

```js
myMother.changeName("Jobs");
```

通过用 myMother “替代” this，JavaScript 清楚您指的是哪个 person。

### 第四章 JavaScript 对象访问器

#### 4.1 JavaScript 访问器（Getter 和 Setter）

ECMAScript 5 (2009) 引入了 Getter 和 Setter。

Getter 和 Setter 允许您定义对象访问器（被计算的属性）。

**JavaScript Getter（get 关键词）**

本例使用 lang 属性来获取 language 属性的值。

```js
// 创建对象：
var person = {
  firstName: "Bill",
  lastName : "Gates",
  language : "en",
  get lang() {
    return this.language;
  }
};

// 使用 getter 来显示来自对象的数据：
document.getElementById("demo").innerHTML = person.lang;
```

**JavaScript Setter（set 关键词）**

本例使用 lang 属性来设置 language 属性的值。

```js
var person = {
  firstName: "Bill",
  lastName : "Gates",
  language : "",
  set lang(lang) {
    this.language = lang;
  }
};

// 使用 setter 来设置对象属性：
person.lang = "en";

// 显示来自对象的数据：
document.getElementById("demo").innerHTML = person.language;
```

**JavaScript 函数还是 Getter？**

下面两个例子的区别在哪里？

```
//例子一
var person = {
  firstName: "Bill",
  lastName : "Gates",
  fullName : function() {
    return this.firstName + " " + this.lastName;
  }
};

// 使用方法来显示来自对象的数据：
document.getElementById("demo").innerHTML = person.fullName();
```

```
//例子二
var person = {
  firstName: "Bill",
  lastName : "Gates",
  get fullName() {
    return this.firstName + " " + this.lastName;
  }
};

// 使用 getter 来显示来自对象的数据：
document.getElementById("demo").innerHTML = person.fullName;
```

例子 1 以函数形式访问 fullName：person.fullName()。

例子 2 以属性形式访问 fullName：person.fullName。

第二个例子提供了更简洁的语法。

#### 4.2 数据质量

使用 getter 和 setter 时，JavaScript 可以确保更好的数据质量。

在本例中，使用 lang 属性以大写形式返回 language 属性的值：

```js
// Create an object:
var person = {
  firstName: "Bill",
  lastName : "Gates",
  language : "en",
  get lang() {
    return this.language.toUpperCase();
  }
};

// 使用 getter 来显示来自对象的数据：
document.getElementById("demo").innerHTML = person.lang;
```

在本例中，使用 lang 属性将大写值存储在 language 属性中：

```
var person = {
  firstName: "Bill",
  lastName : "Gates",
  language : "",
  set lang(lang) {
    this.language = lang.toUpperCase();
  }
};

// 使用 getter 来设置对象属性：
person.lang = "en";

// 显示来自对象的数据：
document.getElementById("demo").innerHTML = person.language;
```

**为什么使用 Getter 和 Setter？**

- 它提供了更简洁的语法
- 它允许属性和方法的语法相同
- 它可以确保更好的数据质量
- 有利于后台工作

#### 4.3 一个计数器实例

```js
var obj = {
  counter : 0,
  get reset() {
    this.counter = 0;
  },
  get increment() {
    this.counter++;
  },
  get decrement() {
    this.counter--;
  },
  set add(value) {
    this.counter += value;
  },
  set subtract(value) {
    this.counter -= value;
  }
};

// 操作计数器：
obj.reset;
obj.add = 5;
obj.subtract = 1;
obj.increment;
obj.decrement;
Object.defineProperty()
```

Object.defineProperty() 方法也可用于添加 Getter 和 Setter：

```js
// 定义对象
var obj = {counter : 0};

// 定义 setters
Object.defineProperty(obj, "reset", {
  get : function () {this.counter = 0;}
});
Object.defineProperty(obj, "increment", {
  get : function () {this.counter++;}
});
Object.defineProperty(obj, "decrement", {
  get : function () {this.counter--;}
});
Object.defineProperty(obj, "add", {
  set : function (value) {this.counter += value;}
});
Object.defineProperty(obj, "subtract", {
  set : function (value) {this.counter -= value;}
});

// 操作计数器：
obj.reset;
obj.add = 5;
obj.subtract = 1;
obj.increment;
obj.decrement;
```

### 第五章 数组与数据类型

#### 5.1 数组进阶

- 数组是一个特殊的对象
- 其索引是对象的属性，是字符串，其元素是对象属性的值
- 使用从0开始的数字索引，在使用时会将数字转换为字符串

使用属性赋值与取值

```js
var cities=[];
cities.bj="北京";
cities["cd"]="成都";
```

设置属性值为数组，形成对维数组

```
cities.北京=["海淀","朝阳"];
cities["成都"]=["青羊","武侯"];
```

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var nums=[10,20,30];
			for(var p in nums){
				console.log(typeof p);
				console.log(p+":"+nums[p]);
			}
			console.log(nums[1]);
			console.log(nums["1"]);
			//console.log(nums."1");
			
			var cities=[];
			//cities.bj="北京";
			//cities["cd"]="成都";
			
			//console.log(cities["bj"]);
			//console.log(cities.cd);
			cities.北京=["海淀","朝阳"];
			cities["成都"]=["青羊","武侯"];
			
			for(var p in cities){
				for(var area in cities[p]){
					console.log(cities[p][area]);
				}
			}
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
array.html:9  string
array.html:10  0:10
array.html:9  string
array.html:10  1:20
array.html:9  string
array.html:10  2:30
array.html:12  20
array.html:13  20
array.html:27  海淀
array.html:27  朝阳
array.html:27  青羊
array.html:27  武侯
```

####  5.2 深入理解数据类型  

**区别**

1. 存储：
   -  基本数据类型存储的是数据
   -  引用数据类型存储的是内存中的某个位置的引用（地址）

2. 属性和方法：
   -  基本数据类型没有属性和方法
   -  引用数据类型可以拥有属性和方法

3. 变量的复制：
   -  基本数据类型直接复制值
   -  引用数据类型复制的是引用

**函数的传参方式**

-  基本数据类型按值传递
-  引用数据类型按址传递

**包装类型与自动类型转换**

 在使用基本数据类型调用属性或方法时，会自动将基本数据类型转换为对应的引用类型，该引用类型称为包装类型

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var num1=10;
			var num2=num1;
			num1++;
			console.log(num2);
			
			var user={
				age:20
			}
			var user2=user;
			user.age=30;
			console.log(user2.age);
			
			function test1(num){
				num++;
			}
			var a=10;
			test1(a);
			console.log(a);
			
			function test2(u){
				u.age++;
			}
			test2(user);
			console.log(user.age);
			
			var name="laotan";
			console.log("老谭".length); //String
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
datatype.html:10  10
datatype.html:17  30
datatype.html:24  10
datatype.html:30  31
datatype.html:33  2
```

### 第六章 函数  

#### 6.1 函数表达式

声明一个函数并将其赋值给一个变量

```js
var f1 = function(){
}

var f2 = function(num1,num2){
	return num1+num2;
}

var f3 = function sum(num1,num2){
	return num1+num2;
}
```

**函数表达式与函数声明的区别**  

函数声明的重要特征是函数声明提升(hosting),即在函数执行之前会先读取函数声明

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
		
			console.log(f1(2,4));
			function f1(num1,num2){
				console.log("f1");
				return num1+num2;
			}
			
			var f2=function(){
				console.log("f2");
			}
			f2();
			
			var num=11;
			if(num%2==0){
				var test1=function(){
					console.log("偶数");
				}
			}else{
				var test1=function(){
					console.log("奇数");
				}
			}
			test1();
		</script>
	</head>
	<body>
	</body>
</html>

```

运行结果：

```js
function.html:10  f1
function.html:8  6
function.html:15  f2
function.html:26  奇数
```

#### 6.2 函数参数 

**arguments** ： 在函数体中，属性arguments会自动声明，表示函数的实际参数，它是一个类数组对象

 它具有以下属性：

-  length：只读，表示实参的个数
-  callee：标准属性，指代当前正在执行的函数

**arguments的使用**

- 可以判断arguments的长度决定函数的执行逻辑
-  实现递归

```
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			//"use strict"
			function add(num1,num2){
				if(arguments.length==1){
					console.log("一个参数");
				}else{
					console.log("不是一个参数");
				}
				//console.log(arguments.length);
				//console.log(arguments.callee);
			}
			add(1);
			
			function f(num){
				if(num==1){
					return 1;
				}else{
					return num*arguments.callee(num-1);
				}
			}
			console.log(f(4));
			var f1=f;
			f=null;
			console.log(f1(4));
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
arguments.html:10  一个参数
arguments.html:26  24
arguments.html:29  24
```

#### 6.3 函数使用方式-1

**函数作为数据使用**

1.  与一般数据的不同在于：

   - 函数包含代码

   -  函数可以执行

2. 函数可以：
   - 赋值给变量
   -  作为函数的参数(callback)
   -  作为函数的返回值

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function f1(){
				console.log("函数");
			}
			f1();
			var f2=function(){
				console.log("函数2");
			}
			f2();
			
			var f3=f1;
			console.log(f3);
			f3();
			
			function f4(f,num1,num2){
				f(num1,num2);
			}
			function add(num1,num2){
				console.log(num1+num2);
			}
			f4(add,2,3);
			
			function f5(){
				function f6(){
					console.log("函数6");
				}
				return f6;
			}
			f5()();
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
usefunction-1.html:8  函数
usefunction-1.html:12  函数2
usefunction-1.html:17  ƒ f1(){
				 console.log("函数");
			 }
usefunction-1.html:8  函数
usefunction-1.html:24  5
usefunction-1.html:30  函数6
```

#### 6.4 函数使用方式-2

**匿名函数**：没有名称的函数

用法：

- 匿名回调函数：将匿名函数作为其他函数的参数
- 立即执行函数表达式：定义匿名函数并立即执行

**匿名回调函数**

- 无需为函数命名，导致更少的全局变量 
- 将一个函数的功能委托给另一个函数
- 有助于性能提升

**立即执行函数表达式**

 IIFE：Immediately Invoked Function Expression，它无需使用全局变量就可以完成功能

 适合执行单次功能或初始化工作

 缺点：不能重复执行该函数

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function test1(f1,f2){
				return f1()+f2();
			}
			
			function f1(){
				return 1;
			}
			
			function f2(){
				return 2;
			}
			
			console.log(test1(function(){    //匿名回调函数
				return 1;
			},function(){
				return 2;
			}));
			
			(function(num){                  //立即执行函数表达式
				//var num=10;
				console.log("iife"+num);
			})(20);
			
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
usefunction-2.html:19  3
usefunction-2.html:27  iife20
```

#### 6.5 构造函数

构造函数：使用new关键字调用的函数，其一般首字母大写

**作用：**

- 可以创建对象
- 为对象定义属性，且可以对属性初始化
- 可以定义基本类型及引用类型的普通属性
- 可以使用Object.defineProperty()等函数定义属性

**有返回值的构造函数**：构造函数里没有显式调用return时，默认返回this，也就是新创建的实例对象

 当构造函数里调用return时，分两种情况：

-  return的是基本数据类型，则忽略return值，返回this
-  return的是Object，则返回该值

**注意点**

- 若构造方法无参数，可直接在new后使用函数名
- 不使用new调用构造函数，则作为普通函数调用
- 严格模式下，不允许将函数体中有this的函数作为普通函数调用

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			//"use strict"
			function User(name,age){
				this.name=name;
				this.age=age;
				return {
					name:"Tom"
				};
			}
			
			var u1=new User("zhangsan",20);
			var u2=new User("lisi",23);
			
			console.log(u1.name+","+u1.age);
			
			function Person(){
				this.name="Jack";
			}
			Person();
			var p1=new Person;
			console.log(p1.name);
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
constructor.html:19  Tom,undefined
constructor.html:26  Jack
```

#### 6.6 函数的属性与方法 

**函数的属性**

| 属性      | 说明                             |
| --------- | -------------------------------- |
| length    | 函数的形参数量                   |
| arguments | 函数的实参数组，不推荐使用       |
| caller    | 调用该函数的函数引用，不推荐使用 |
| prototype | 原型，给构造函数使用的对象       |

**函数的方法**

| 方法名 | 说明                                                       |
| ------ | ---------------------------------------------------------- |
| apply  | 将函数作为指定对象的方法来调用，传递给它的是指定的参数数组 |
| call   | 将函数作为指定对象的方法来调用，传递给它的是指定的参数     |
| bind   | 返回一个新函数                                             |

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function f1(num1,num2){
				console.log(num1+num2);
			}
			console.log(f1.length);
			
			f1.apply(null,[1,2]);
			f1.call(null,1,2);
			
			var user={
				num1:10,
				num2:20
			}
			function f2(num3){
				console.log(this.num1+this.num2+num3);
			}
			f2.apply(user,[30]);
			f2.call(user,30);
			
			function f3(num1,num2){
				console.log(num1+num2);
			}
			
			var f4=f3.bind(null,1);
			f4(2);
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
function-2.html:10  2
function-2.html:8  3
function-2.html:8  3
function-2.html:20  60
function-2.html:20  60
function-2.html:26  3
```

####  6.7 作用域

**作用域**：

- Scope：限制变量与函数可访问的范围及生命周期的一套规则
- 通常认为在JavaScript中没有块作用域，只有函数作用域
- JavaScript使用词法作用域模型       

 **全局作用域**：

-  在代码中任何地方都能访问到的变量或函数拥有全局作用域
-  最外层函数和在最外层函数外面定义的变量拥有全局作用域
- 未定义直接赋值的变量自动声明为拥有全局作用域
-  在浏览器中所有window对象的属性拥有全局作用域

**函数作用域**：在函数中声明的变量或函数只能在该函数或嵌套的函数中使用

**词法作用域**：也称为静态作用域，它是在编写代码时将变量和函数写在哪里来决定的，即创建它们时决定作用域，而不是执行时。

 **声明提升**：

-  无论作用域中的函数和变量声明出现在什么地方，都将在代码本身被执行前首先进行处理，这个过程被称为提升
-  函数的提升优先于变量的提升

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			for(var i=0;i<10;i++){
				console.log(i);
			}
			console.log(i);
			if(2>1){
				var num=10;
			}
			console.log(num);
			
			function f1(){
				var num1=10;
				num3=30;
				console.log(num1);
			}
			f1();
			console.log(num3);
			
			var num2=10;
			function f3(){
				var num2=20;
				console.log(num2);
			}
			f3();
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
scope.html:8  0
scope.html:8  1
scope.html:8  2
scope.html:8  3
scope.html:8  4
scope.html:8  5
scope.html:8  6
scope.html:8  7
scope.html:8  8
scope.html:8  9
scope.html:10  10
scope.html:14  10
scope.html:19  10
scope.html:22  30
scope.html:27  20
```

#### 6.8 闭包

**闭包**：

-  闭包(Closure)是指有权访问另一个函数作用域中变量的函数
- 当函数可以记住并访问所在的词法作用域时，就产生了闭包，即使函数是在当前词法作用域之外执行
- 只要使用了回调函数，实际上就是在使用闭包

 **注意点**：

- 过度使用闭包会大量占用内存，导致性能下降
- 闭包只能取得包含函数中任何变量的最后一个值

```js
//eg1
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function f1(){
				var num=10;
				function f2(){
					console.log(num);
				}
				//f2();
				return f2;
			}
			f1()();
			//console.log(num);
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
closuer-1.html:10  10
```



```js
//eg2
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function f1(){
				var num=10;
				function f2(){
					num++;
					console.log(num);
				}
				//f2();
				return f2;
			}
			var f3=f1();
			f3();
			f3();
			f3();
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
closure-2.html:11 11
closure-2.html:11 12
closure-2.html:11 13
```

 

```js
//eg3 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function f1(num1){
				function f2(num1){
					console.log(num1+num1);
				}
				return f2;
			}
			var f3=f1(10);
			f3(15);
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
closuer-3.html:9  30
```

​             

```js
//eg4
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function test(){
				var funs=[];
				for(var i=0;i<5;i++){
					funs[i]=(function(num){
						return function(){
							return num;
						}
					})(i);
				}
				return funs;
			}

			for(var i=0;i<5;i++){
				console.log(test()[i]());
			}
		</script>
	</head>
	<body>
		
	</body>
</html>
```

​     运行结果：

```js
closuer-4.html:20  0
closuer-4.html:20  1
closuer-4.html:20  2
closuer-4.html:20  3
closuer-4.html:20  4
```

### 第七章 this

#### 7.1 this-1

**执行环境**：即execution context，每当函数被调用的时候，就会产生一个新的执行环境。

每个执行环境都有一个与之关联的**变量对象**，环境中定义的所有变量和函数都保存在该对象中分为：

-  全局环境：是最外层的一个执行环境
-  局部环境：每个函数都有一个自己的执行环境

![](../../../Desktop/Typora/js图片/执行环境.PNG)       **执行环境的构建过程**：

- 创建 arguments变量

- 创建作用域链
- 初始化变量
- 最后为 this变量赋值

**this关键字**：

-  this 总是指向一个对象，而具体指向哪个对象是在运行时基于函数的执行环境动态绑定的，而非函数被声明时的环境
-  this是执行环境关联的变量对象的一个属性
-  this自动定义在所有函数的作用域中

**其不指向函数自身，不指向函数的作用域**

**this的好处**：this 提供了一种更优雅的方式来隐式“传递”一个对象引用，因此可以将API 设计得更加简洁并且易于复用

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function f1(num){
				console.log(num);
				f1.count++;
			}
			f1.count=0;
			
			f1(1);
			f1(2);
			f1(3);
			
			console.log(f1.count);
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
this-1.html:8  1
this-1.html:8  2
this-1.html:8  3
this-1.html:17  3
```

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function f1(){
				var num=10;
				this.f2();
			}
			
			function f2(){
				console.log(this.num);
			}
			
			f1();
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
this-2.html:13  undefined
```

#### 7.2 this-2

**this的指向(绑定)**

实际应用中，this 的指向大致可以分为以下几种：

- 默认绑定：作为普通函数调用，this指向全局对象(严格模式除外)
- 隐式绑定：作为对象的方法调用，this指向该对象
- new绑定：构造函数调用，this指向使用new创建出来的对象
- 显式绑定：使用函数的call，apply，bind(硬绑定)方法时this指向第一个参数

**总结：谁调用this就指定的谁**

```js
//默认绑定
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var num=10;
			function f1(){
				//"use strict"
				console.log(this.num);
				console.log(this);
			}
			f1();
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
this-3.html:10   10
this-3.html:11   Window {postMessage: ƒ, blur: ƒ, focus: ƒ, close: ƒ, frames: Window, …}
```

```js
//隐式绑定
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function getInfo(){
				return this.name;
			}
			var user={
				name:"老谭",
				getInfo:getInfo
			}
			console.log(user.getInfo());
			
			var user2={
				name:"laotan",
				user:user,
				getInfo:getInfo
			}
			console.log(user2.getInfo());
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
this-4.html:14  老谭
this-4.html:21  laotan
```

```js
//new绑定
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function User(){
				this.name="老谭";
			}
			var user1=new User();
			console.log(user1.name);
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
this-5.html:11  老谭
```

```js
//显示绑定
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var user1={
				name:"老谭"
			}
			var user2={
				name:"laotan"
			}
			function getInfo(){
				return this.name;
			}
			console.log(getInfo.call(user1));
			console.log(getInfo.call(user2));
			console.log(getInfo.apply(user2));
			
			var getInfo2=getInfo.bind(user2);
			console.log(getInfo2());
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
this-6.html:16  老谭
this-6.html:17  laotan
this-6.html:18  laotan
this-6.html:21  laotan
```

#### 7.3 this-3

**优先级**

- 函数是否在new 中调用（new 绑定）？如果是的话 this 绑定的是新创建的对象
- 函数是否通过call、apply（显式绑定）或者硬绑定调用？如果是的话，this 绑定的是指定的对象
- 函数是否在某个上下文对象中调用（隐式绑定）？如果是的话，this 绑定的是那个上下文对象
- 如果都不是的话，使用默认绑定。如果在严格模式下，就绑定到undefined，否则绑定到全局对象

**总结：谁调用this就指定的谁**

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function f1(){
				console.log(this.num);
			}
			var obj1={
				num:1,
				f:f1
			}
			var obj2={
				num:2,
				f:f1
			}
			obj1.f();
			obj2.f();
			
			obj1.f.call(obj2);
			obj2.f.call(obj1);
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
this-7.html:8 1
this-7.html:8 2
this-7.html:8 2
this-7.html:8 1
```

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function f1(num){
				this.num=num;
			}
			var obj1={
				f:f1
			}
			
			var obj2=new obj1.f(1);
			console.log(obj1.num);
			console.log(obj2.num);
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
this-8.html:15  undefined
this-8.html:16  1
```

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function f1(num){
				this.num=num;
			}
			var obj1={};
			var f2=f1.bind(obj1);
			f2(1);
			console.log(obj1.num);//1
			var obj2=new f2(2);
			console.log(obj1.num);//1
			console.log(obj2.num);//2
			
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
this-9.html:13  1
this-9.html:15  1
this-9.html:16  2
```

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function f1(){
				console.log(this.num);
			}
			var obj1={
				num:1,
				f:f1
			}
			obj1.f();
			var f2=obj1.f;
			var num=2;
			f2();
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
this-10.html:8  1
this-10.html:8  2
```

#### 7.4 this-4

**隐式丢失**：当把某个函数赋值给某个变量，调用时this可能会有丢失的情况

**被忽略的this**： 如果将null或undefined传入call，apply或bind，则其中的this会被忽略

**间接引用**：它最容易在赋值时发生，它会应用默认绑定规则

**闭包中的this**：在闭包中的this一般应用默认绑定规则，在浏览器环境中即绑定window对象

**总结：谁调用this就指定的谁**

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function f1(){
				console.log(this.num);
			}
			function f2(f){
				f();
			}
			var obj1={
				num:1,
				f:f1
			}
			obj1.f();
			f2(obj1.f);
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
this-11.html:8  1
this-11.html:8  undefined
```

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function f1(){
				console.log(this.num);
			}
			var num=1;
		
			f1.call(null);
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```
this-12.html:8 1
```

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function f1(){
				console.log(this.num);
			}
			var obj1={
				num:1,
				f:f1
			}
			var obj2={
				num:2
			}
			obj1.f();
			//(obj2.f=obj1.f)();
			obj2.f=obj1.f;
			obj2.f();
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
this-13.html:8  1
this-13.html:8  2
```

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var obj1={
				num:1
			}
			function f1(){
				var t=this;
				function f2(){
					return t.num;
				}
				return f2;
			}
			console.log(f1()());
			var f3=f1.call(obj1);
			console.log(f3());
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
this-14.html:17 undefined
this-14.html:19 1
```

### 第八章 原型与继承

#### 8.1 原型-1

**原型**

- 每一个函数都有一个属性：prototype
- 该属性指向函数的原型对象，该对象包含所有实例共享的属性和方法，其中默认只有一个constructor属性，指向函数本身

![](..\..\..\Desktop\Typora\js图片\原型，构造函数与对象之间的关系.jpg)

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function Person(){
				
			}
			console.log(Person.prototype);
			console.log(Person.prototype.constructor);
			
			var person1=new Person();
			var person2=new Person();
			
			console.log(person1.__proto__===Person.prototype);
			
			Person.prototype.name="老谭";
			var person3=new Person();
			console.log(person3.name);
			console.log(person1.name);
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
prototype-1.html:10  {constructor: ƒ}
prototype-1.html:11  ƒ Person(){
				
			 }
prototype-1.html:16  true
prototype-1.html:20  老谭
prototype-1.html:21  老谭
```

#### 8.2 原型-2

**向原型增加属性或方法**

- 可以往函数原型上增加属性或方法的方式为创建的对象增加新属性或新方法
- 原型属性上增加单个属性或方法(之前创建的对象也起作用)
- 将一个对象赋值给原型属性

自有属性 vs 原型属性

-  无论是自有属性还是原型属性，使用上并无区别
- 在访问对象的属性时，首先会找对象自有属性，如果没有找到则找创建该对象的构造函数的原型对象(即对象的\__proto__指向的对象)
- 当自有属性与原型属性具有相同名称时，优先使用自有属性
- 可以使用对象的hasOwnProperty函数判断属性是否是自有属性

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function Person(){
				
			}
			
			
			/*Person.prototype.name="老谭";
			Person.prototype.getName=function(){
				return this.name;
			}*/
			Person.prototype={
				name:"laotan",
				getName:function(){
					return this.name;
				}
			}
			
			var person1=new Person();
			console.log(person1.name);
			console.log(person1.getName());
		</script>
	</head>
	<body>
	</body>
</html>

```

运行结果：

```js
prototype-2.html:24  laotan
prototype-2.html:25  laotan
```

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function Person(){
				//this.name="laotan";
			}
			
			Person.prototype.name="老谭";
			Person.prototype.address="成都";
			
			var person1=new Person();
			console.log(person1.name+","+person1.address);
			console.log(person1.hasOwnProperty("name"));
		</script>
	</head>
	<body>
	</body>
</html>

```

运行结果：

```js
prototype-3.html:15  老谭,成都
prototype-3.html:16  false
```

#### 8.3 继承-1

**继承的概念**：继承是指一个对象直接使用另一对象的属性和方法

其好处：

- 减少重复代码
- 方便维护和扩展

**使用原型链实现继承**

这种方式是JavaScript实现继承的默认(内置)方法，其基本思想是利用原型让一个引用类型继承另一个引用类型的属性和方法

![](..\..\..\Desktop\Typora\js图片\原型链继承.jpg)

**两点说明**

1. 所有引用类型都继承自Object，即所有函数的原型默认都是Object实例
2. 实例是任意原型链中出现的构造函数的类型

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function Parent(){
				this.name="Parent";
				this.getName=function(){
					return this.name;
				}
			}
			
			function Son(){
				
			}
			
			function GrandSon(){
				
			}
			
			Son.prototype=new Parent();
			GrandSon.prototype=new Son();
			
			var son1=new Son();
			console.log(son1.name);
			console.log(son1.getName());
			
			var grandSon1=new GrandSon();
			console.log(grandSon1.name);
			
			console.log(grandSon1 instanceof GrandSon);
			console.log(grandSon1 instanceof Son);
			console.log(grandSon1 instanceof Parent);
			console.log(grandSon1 instanceof Object);
			
		</script>
	</head>
	<body>
	</body>
</html>

```

运行结果：

```js
inherit-1.html:26 Parent
inherit-1.html:27 Parent
inherit-1.html:30 Parent
inherit-1.html:32 true
inherit-1.html:33 true
inherit-1.html:34 true
inherit-1.html:35 true
```

#### 8.4 继承-2

**方法重写**

- 在子类型的原型中可以重新定义超类型中存在的方法，称为方法重写
- 方法重写要放在替换原型语句之后

**使用原型链存在的问题**

- 使用字面量创建原型会导致继承时的原型链切断
- 创建子类实例时，不能向超类型的构造函数中传递参数
- 父类型的属性会在每个子类型实例中共享

```
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function Parent(name){
				this.name=name;
				this.getName=function(){
					return this.name;
				}
				this.address=["成都","内江"];
			}
			
			function Son(){
				/*this.getName=function(){
					return "Sons";
				}*/
			}
			/*Son.prototype.getName=function(){
					return "Sons";
			}*/
			Son.prototype=new Parent("Parent");
			/*Son.prototype={
				getName:function(){
					return "Sons";
				}
			}*/
			
			
			var son1=new Son();
			console.log(son1.getName());
			console.log(son1 instanceof Parent);
			
			console.log(son1.address);
			son1.address[2]="德阳";
			console.log(son1.address);
			var son2=new Son();
			console.log(son2.address);
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
inherit-2.html:32  Parent
inherit-2.html:33  true
inherit-2.html:35  (2) ["成都", "内江"]
inherit-2.html:37  (3) ["成都", "内江", "德阳"]
inherit-2.html:39  (3) ["成都", "内江", "德阳"]
```

#### 8.5 继承-3

**借用构造函数**：又称为伪造对象或经典继承，其基本思想是在子类型构造函数内部调用父类型构造函数

优缺点

-  优点：可以为父类型的构造方法传参
-  缺点：函数不可复用

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function Parent(name){
				this.name=name;
				this.address=["成都","内江"];
				
			}
			Parent.prototype.getName=function(){
					return name;
				}
			
			function Son(){
				Parent.call(this,"Parent");
			}
			
			var son1=new Son();
			
			console.log(son1.address);
			console.log(son1.name);
			son1.address[2]="德阳";
			son1.name="父类型";
		    console.log(son1.address);
		    console.log(son1.name);
			//console.log(son1.getName());
			var son2=new Son();
			console.log(son2.name);
			console.log(son2.address);
			console.log(son2.getName());
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
inherit-3.html:22 ( 2) ["成都", "内江"]
inherit-3.html:23  Parent
inherit-3.html:26  (3) ["成都", "内江", "德阳"]
inherit-3.html:27  父类型
inherit-3.html:30  Parent
inherit-3.html:31  (2) ["成都", "内江"]
inherit-3.html:32  Uncaught TypeError: son2.getName is not a function
     at inherit-3.html:32
 (anonymous) @ inherit-3.html:32
```

#### 8.6 继承-4

**组合继承**：又称为伪经典继承，将原型链与借用构造函数的技术组合到一起

**思路**：使用原型链实现对原型属性和方法的继承，通过借用构造函数实现对实例属性的继承

**优点**

- 实现了函数复用
- 保证每个实例有自己的属性

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function Parent(name){
				this.name=name;
				this.address=["成都","内江"];
			}
			
			Parent.prototype.getName=function(){
				return this.name;
			}
			
			function Son(name){
				Parent.call(this,name);
			}
			
			Son.prototype=new Parent();
			
			var son1=new Son("张三");
			console.log(son1.getName());
			son1.address[2]="绵阳";
			console.log(son1.address);
			var son2=new Son("李四");
			console.log(son2.getName());
			console.log(son2.address);
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
inherit-4.html:23  张三
inherit-4.html:25  (3) ["成都", "内江", "绵阳"]
inherit-4.html:27  李四
inherit-4.html:28  (2) ["成都", "内江"]
```

### 第九章 错误处理与严格模式

#### 9.1 错误处理-1

- 错误又叫异常，是程序在执行过程中出现的非预期问题
-  出现错误时，程序一般会终止运行

```js
//catch或finally可省略不写
try{
	return 1;          //可能导致错误的代码  
	}catch(error){
	   return 2;       //在错误时将执行的代码
	}finally{
	   return 3;       //无论是否出错都将执行的代码
	}
```

**如果在finally子句有return，则try和catch中的return都将被忽略**

**错误信息**

- 在catch中捕获的错误对象包含以下属性：
- name：错误类型
- message：错误信息 

 **错误类型**  

| **错误类型**   | **描述**                                                     |
| -------------- | ------------------------------------------------------------ |
| Error          | 基类型，其他错误类型继承自它，目的是供开发人员自定义错误类型 |
| EvalError      | 没有将eval()作为函数调用，抛出此错误                         |
| RangeError     | 数值超出范围时抛出此错误                                     |
| ReferenceError | 找不到对象时抛出此错误                                       |
| SyntaxError    | 语法错误，很少直接抛出                                       |
| TypeError      | 执行特定类型的操作时变量的类型不符合要求                     |
| URIError       | URI格式不正确抛出此错误                                      |

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
				var obj1={
					num:1
				};
				function f1(obj1){
					try{
						console.log(obj1.num);
					}catch(error){
						console.log(error.name+":"+error.message);
					}finally{
						console.log("都要执行");
					}
				}
				f1(null);
				console.log("hello");
				
				function f2(){
					try{
						return 1;
					}catch(error){
						return 2;
					}finally{
						return 3;
					}
				}
				console.log(f2());
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```
error-1.html:14  TypeError:Cannot read property 'num' of null
error-1.html:16  都要执行
error-1.html:20  hello
error-1.html:31  3
```

#### 9.2 错误处理-2

**抛出错误**

-  使用throw可以随时抛出错误
-  要给throw指定一个值，该值的类型并无要求
-  遇到throw时，代码会立即停止执行，当try-catch捕获到抛出的错误时，代码才会继续执行

**自定义错误类型**

- 自定义错误类型可以很好的与内置错误类型区分开
- 可以通过继承Error创建自定义错误类型
- 需要指定name与message属性

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function div(num1,num2){
				if(num2==0){
					throw new Error("除数不能为0");
				}
				return num1/num2;
			}
			
			try{
				console.log(div(10,0));
			}catch(error){
				console.log(error);
			}
		</script>
	</head>
	<body>
	</body>
</html>

```

运行结果：

```js
error-2.html:17     Error: 除数不能为0
                 at div (error-2.html:9)
                 at error-2.html:15
```

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			function MyError(message){
				this.name="MyError";
				this.message=message;
			}
			
			MyError.prototype=new Error();
			
			function div(num1,num2){
				if(num2<=0){
					throw new MyError("除数不能为非正数!");
				}
				return num1/num2;
			}
			
			try{
				console.log(div(10,0));
			}catch(error){
				console.log(error.name+","+error.message);
			}
		</script>
	</head>
	<body>
	</body>
</html>

```

运行结果：

```js
error-3.html:24   MyError,除数不能为非正数!
```

#### 9.3 严格模式

**严格模式**：strict mode，该模式使得JavaScript在更严格的条件下运行

**目的：**

- 减少怪异行为
- 保证代码运行更安全
- 提高编译器效率，增加运行速度
- 为未来新版本的JavaScript做好铺垫

**进入方式**：

- 使用”use strict”进入严格模式
- 作用于整个脚本文件：将"use strict"放在脚本文件的第一行
- 作用于单个函数:将"use strict"放在函数体的第一行

**对代码的影响(部分)**：

- 不允许省略var声明变量
- 不允许在非构造函数中使用this
- 不允许在函数内部使用其属性caller，callee， arguments
- 不允许对象有重名属性
- 不允许函数有重名参数
- 不允许在非函数的代码块内声明函数

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			//"use strict"
			num1=10;
			console.log(num1);
			
			function User(){
				this.name="老谭";
			}
			
			var user1=new User();
			User();
			
			function f1(){
				console.log(f1.caller+","+f1.callee+","+f1.arguments);
			}
			f1();
			var User={
				name:"laotan",
				name:"老谭"
			}
			function f1(num,num){
				return num+num;
			}
			console.log(f1(1,2));
			if(true){
				function f1(){
					
				}
			}
				
		</script>
	</head>
	<body>
	</body>
</html>

```

运行结果：

```js
strict-1.html:9  10
strict-1.html:29  4
```

