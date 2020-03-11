## JavaScript 第三季

### 第一章 内置对象 

#### 1.1 概述

- 内置对象是JavaScript引擎默认支持的对象，无需声明即可使用
- 无论客户端还是服务器端都支持
- 它们是使用该语言实现自定义功能的基础

**内置对象的分类**：

-  数据包装对象：表示特定的数据类型
-  Object，Array，Function，Boolean，Number， String
-  实用工具对象：提供功能的对象
-  Math，Date，RegExp
-  错误对象：错误处理中catch捕获的对象
-  Error，EvalError，RangeError，ReferenceError，SyntaxError，TypeError，URIError

**思路**：

- 概念
- 构造函数
- 属性
- 实例方法
- 静态方法

#### 1.2 Global  

**Global**

- 该对象根本不存在，可以当成预定义对象
- 全局方法及全局对象都属于该对象
- 在浏览器环境中，Global即是window

| 值       | 描述           |
| -------- | -------------- |
| Infinity | 正无穷大的数字 |
| NaN      | 不是数值的值   |

**方法**  

| **方法名**                             | **描述**                                  |
| -------------------------------------- | ----------------------------------------- |
| escape，unescape                       | 用转义序列替换特殊字符对字符串编码与解码  |
| encodeURI，decodeURI                   | 通过转义字符对URI编码与解码               |
| encodeURIComponent ,decodeURIComponent | 通过转义字符对URI的组成部分进行编码与解码 |
| eval                                   | 执行JavaScript字符串                      |
| isFinite                               | 判断一个值是否是无穷大                    |
| isNaN                                  | 判断一个值是否是非数值                    |
| parseFloat                             | 将字符串解析为浮点数值                    |
| parseInt                               | 将字符串解析为整数                        |

**escape**：不会对ASCII字母和数字进行编码，也不会对下面这些ASCII标点符号进行编码： *@-_+./

**encodeURI**：

- 不会对 ASCII 字母和数字进行编码，也不会对下面这些 ASCII 标点符号进行编码：-_.!~*'()
- 对以下在 URI 中具有特殊含义的 ASCII 标点符号，encodeURI()函数是不会进行转义的：;/?:@&=+$,#

**encodeURIComponent**：

- 不会对 ASCII 字母和数字进行编码，也不会对这些 ASCII 标点符号进行编码：-_.!~*'()
- 这些用于分隔 URI 组件的标点符号会编码：;/?:@&=+$,#

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			console.log(Infinity);
			console.log(NaN);
			
			console.log(escape("Hello,老谭*/"));
			console.log(unescape("Hello%2C%u8001%u8C2D*/"));
			
			console.log(encodeURI("http://www.baidu.com?wd=老谭"));
			console.log(decodeURI("http://www.baidu.com?wd=%E8%80%81%E8%B0%AD"));
		
			console.log(encodeURIComponent("http://www.baidu.com?wd=老谭&p=你好"));
			console.log(decodeURIComponent("http%3A%2F%2Fwww.baidu.com%3Fwd%3D%E8%80%81%E8%B0%AD%26p%3D%E4%BD%A0%E5%A5%BD"))
		
			eval("var a=10;");
			console.log(a);
			
			console.log(isFinite(10/0));
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
global.html:7  Infinity
global.html:8  NaN
global.html:10  Hello%2C%u8001%u8C2D*/
global.html:11  Hello,老谭*/
global.html:13  http://www.baidu.com?wd=%E8%80%81%E8%B0%AD
global.html:14  http://www.baidu.com?wd=老谭
global.html:16      http%3A%2F%2Fwww.baidu.com%3Fwd%3D%E8%80%81%E8%B0%AD%26p%3D%E4%BD%A0%E5%A5%BD
global.html:17  http://www.baidu.com?wd=老谭&p=你好
global.html:20  10
global.html:22  false
```

#### 1.3 Object

##### 1.3.1 Object-1

**Object是所有对象的父对象，所有自定义对象都继承自该对象**

| **构造函数**      | **描述**                                                     |
| ----------------- | ------------------------------------------------------------ |
| new Object()      | 创建空对象                                                   |
| new Object(value) | 指定一个原始值作为参数，会自动转换为String，Number或Boolean对象 |

注意：**即使不作为构造函数调用，效果也一样**

| **属性**    | **描述**               |
| ----------- | ---------------------- |
| constructor | 指向当前对象的构造函数 |

**实例方法**  ：

| **方法名**           | **描述**                                     |
| -------------------- | -------------------------------------------- |
| hasOwnProperty       | 判断指定的属性是否是对象的自有属性           |
| isPrototypeOf        | 判断当前对象是否是指定对象的原型             |
| propertyIsEnumerable | 检查属性是否存在且可以用for/in枚举           |
| toString             | 返回对象的字符串表示，一般子对象会重写该方法 |
| valueOf              | 返回当前对象的原始值                         |

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var obj1=new Object();
			obj1.name="老谭";
			obj1.address="成都";
			
			var obj2=new Object("laotan");
			console.log(obj2 instanceof String);
			console.log(obj2.constructor);
			
			console.log(obj1.hasOwnProperty("name"));
			function User(){
				
			}
			User.prototype=obj1;
			var user=new User();
			console.log(obj1.isPrototypeOf(user));
			
			console.log(obj1.propertyIsEnumerable("address"));
			
			console.log(obj1.toString());
			console.log(obj1);
			console.log(obj2.valueOf());
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
object-1.html:12  true
object-1.html:13  ƒ String() { [native code] }
object-1.html:15  true
object-1.html:21  true
object-1.html:23  true
object-1.html:25  [object Object]
object-1.html:26  {name: "老谭", address: "成都"}
object-1.html:27  laotan
```

##### 1.3.2 Object-2

**静态方法**  

| **方法名**                | **描述**                                                     |
| ------------------------- | ------------------------------------------------------------ |
| create                    | 使用指定的原型与属性创建新对象                               |
| defineProperty            | 创建或配置指定对象的某个属性                                 |
| defineProperties          | 创建或配置指定对象的一个或多个属性                           |
| getOwnPropertyDescription | 获取指定对象和指定属性的特性描述                             |
| getOwnPropertyNames       | 获取对象所有非继承属性名的数组                               |
| getPrototypeOf            | 返回指定对象的原型                                           |
| keys                      | 获取对象所有非继承可枚举属性名的数组                         |
| freeze                    | 将指定对象设置为不可改变，即不可增加或删除属性及改变属性的值 |
| isFrozen                  | 判断当前对象是否已冻结                                       |
| seal                      | 密封对象，即阻止向指定对象添加或删除属性，对继承属性无影响   |
| isSealed                  | 判断当前对象是否是密封的                                     |
| isExtensiable             | 判断当前对象是否能添加新的属性                               |
| preventExtensions         | 阻止向对象添加新属性                                         |

```js
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var obj1 = {
				id: 1,
				name: "老谭"
			}

			var obj2 = Object.create(obj1,{
				age:{
					value:20,
					writable:true,
					enumerable:true
				},
				address:{
					value:"成都",
					writable:true,
					enumerable:false
				}
			});
			console.log(obj1.isPrototypeOf(obj2));
			for(var p in obj2){
				console.log(p);
			}
			console.log(Object.getOwnPropertyDescriptor(obj2,"address").enumerable);
			var pnames=Object.getOwnPropertyNames(obj2);
			for(var p in pnames){
				console.log(pnames[p]);
			}
			console.log(Object.getPrototypeOf(obj2));
			var pnames2=Object.keys(obj2);
			for(var p in pnames2){
				console.log(pnames2[p]);
			}
			console.log("-------------------------");
			var obj3={
				id:2,
				name:"laotan"
			}
			obj3.address="成都";
			console.log(obj3.address);
			Object.freeze(obj3);
			obj3.age=20;
			console.log(obj3.age);
			obj3.address="武汉";
			console.log(obj3.address);
			console.log(Object.isFrozen(obj3));
			
			var obj4={
				id:4,
				name:"laotan"
			}
			Object.seal(obj4);
			obj4.name="老谭";
			console.log(obj4.name);
			delete obj4.name;
			console.log(obj4.name);
			console.log(Object.isSealed(obj4));
			
			var obj5={
				id:5,
				name:"laotan"
			}
			Object.preventExtensions(obj5);
			console.log(Object.isExtensible(obj5));
			obj5.address="成都";
			console.log(obj5.address);
		</script>
	</head>

	<body>
	</body>

</html> 
```

运行结果：

```js
object-2.html:25  true
object-2.html:27  age
object-2.html:27  id
object-2.html:27  name
object-2.html:29  false
object-2.html:32  age
object-2.html:32  address
object-2.html:34  {id: 1, name: "老谭"}
object-2.html:37  age
object-2.html:39  -------------------------
object-2.html:45  成都
object-2.html:48  undefined
object-2.html:50  成都
object-2.html:51  true
object-2.html:59  老谭
object-2.html:61  老谭
object-2.html:62  true
object-2.html:69  false
object-2.html:71  undefined
```

#### 1.4 Array

##### 1.4.1 Array-1

**Array**：表示JavaScript中的数组

| **构造函数**         | **描述**                                                     |
| -------------------- | :----------------------------------------------------------- |
| new Array()          | 创建空数组                                                   |
| new Array(size)      | 创建指定大小的数组，超出范围(负数或大于232-1)会 抛出RangeError |
| new Array(e1,e2,…en) | 创建具有指定初始元素的数组                                   |

注意：**不作为构造函数调用，结果是一样的**  

| **属性** | **描述**                                                     |
| -------- | ------------------------------------------------------------ |
| length   | 数组元素的数量，可读可写，当元素不连续时，其等于最后一个的序号加1，改变length可以裁减或扩充数组 |

**实例方法**  ：

| **方法名** | **描述**                                                     |
| ---------- | ------------------------------------------------------------ |
| concat     | 将元素增加到数组中，并返回新数组                             |
| join       | 将数组的所有元素拼接成一个字符串并返回                       |
| reverse    | 倒序数组                                                     |
| slice      | 返回数组的一部分，两个参数表示起始位置与结束位置             |
| splice     | 插入，删除或替换数组元素                                     |
| sort       | 对数组的元素排序，不带参数则按字符编码顺序排序，也可传入比较函数。若有undefined则永远在末尾 |
| pop        | 移除数组的最后一个元素                                       |
| push       | 把元素添加到数组的最后                                       |
| shift      | 移除数组的第一个元素                                         |
| unshift    | 在数组头部插入元素                                           |

```js
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var a1 = [1, 2, 3];
			var a2 = new Array();
			var a3 = a1.concat(4, 5, 6);
			for(var i = 0; i < a3.length; i++) {
				console.log(a3[i]);
			}
			for(var i = 0; i < a1.length; i++) {
				console.log(a1[i]);
			}
			a3 = a1.concat(4, [5, 6]);
			for(var i = 0; i < a3.length; i++) {
				console.log(a3[i]);
			}
			var a4 = a1.join(":");
			console.log(a4);
			a1.reverse();
			for(var i = 0; i < a1.length; i++) {
				console.log(a1[i]);
			}
			var a5 = a3.slice(1, 3);
			for(var i = 0; i < a5.length; i++) {
				console.log(a5[i]);
			}
			var a6 = a3.splice(2, 2);
			for(var i = 0; i < a6.length; i++) {
				console.log(a6[i]);
			}
			for(var i = 0; i < a3.length; i++) {
				console.log(a3[i]);
			}
			a6 = a3.splice(1, 2, "a", "b", "c");
			for(var i = 0; i < a6.length; i++) {
				console.log(a6[i]);
			}
			for(var i = 0; i < a3.length; i++) {
				console.log(a3[i]);
			}
			var a7 = [1, 6, 2, 4, 8, 3, 5];
			//a7.sort();
			a7.sort(function(a, b) {
				if(a > b) {
					return -1;
				} else if(a < b) {
					return 1;
				} else {
					return 0;
				}
			})
			for(var i = 0; i < a7.length; i++) {
				console.log(a7[i]);
			}
			var a8 = [1, 2, 3, 4, 5];
			console.log(a8.pop());
			for(var i = 0; i < a8.length; i++) {
				console.log(a8[i]);
			}
			console.log(a8.pop());
			for(var i = 0; i < a8.length; i++) {
				console.log(a8[i]);
			}
			a8.push(10);
			for(var i = 0; i < a8.length; i++) {
				console.log(a8[i]);
			}
			var a9 = [1, 2, 3, 4, 5];
			console.log(a9.shift());
			for(var i = 0; i < a9.length; i++) {
				console.log(a9[i]);
			}
			a9.unshift(20);
			for(var i = 0; i < a9.length; i++) {
				console.log(a9[i]);
			}
		</script>
	</head>

	<body>
	</body>

</html>
```

运行结果：

```js
array-1.html:12  1
array-1.html:12  2
array-1.html:12  3
array-1.html:12  4
array-1.html:12  5
array-1.html:12  6
array-1.html:15  1
array-1.html:15  2
array-1.html:15  3
array-1.html:19  1
array-1.html:19  2
array-1.html:19  3
array-1.html:19  4
array-1.html:19  5
array-1.html:19  6
array-1.html:22  1:2:3
array-1.html:25  3
array-1.html:25  2
array-1.html:25  1
array-1.html:29  2
array-1.html:29  3
array-1.html:33  3
array-1.html:33  4
array-1.html:36  1
array-1.html:36  2
array-1.html:36  5
array-1.html:36  6
array-1.html:40  2
array-1.html:40  5
array-1.html:43  1
array-1.html:43  a
array-1.html:43  b
array-1.html:43  c
array-1.html:43  6
array-1.html:57  8
array-1.html:57  6
array-1.html:57  5
array-1.html:57  4
array-1.html:57  3
array-1.html:57  2
array-1.html:57  1
array-1.html:60  5
array-1.html:62  1
array-1.html:62  2
array-1.html:62  3
array-1.html:62  4
array-1.html:64  4
array-1.html:66  1
array-1.html:66  2
array-1.html:66  3
array-1.html:70  1
array-1.html:70  2
array-1.html:70  3
array-1.html:70  10
array-1.html:73  1 
array-1.html:75  2
array-1.html:75  3
array-1.html:75  4
array-1.html:75  5
array-1.html:79  20
array-1.html:79  2
array-1.html:79  3
array-1.html:79  4
array-1.html:79  5
```

##### 1.4.1 Array-2

**实例方法**

| 方法名      | 描述                                                     |
| ----------- | -------------------------------------------------------- |
| forEach     | 为数组的每个元素调用指定的函数，该函数可带3个参数        |
| every       | 判断测试函数对每一个元素是否都为真，数组为空时，返回true |
| some        | 判断测试函数对至少一个元素是否为真                       |
| filter      | 返回符合断言函数的数组元素                               |
| map         | 从数组的元素计算出新的元素                               |
| reduce      | 从数组的元素计算一个值，其参数最多可带4个参数            |
| reduceRight | 从右向左缩减数组                                         |
| indexOf     | 根据指定的元素获取其索引                                 |
| lastIndexOf | 根据指定的元素获取最后一个索引                           |

```js
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var a1 = [1, 2, 3, 4, 5];
			a1.forEach(function(e, index, a) {
				console.log(e + "," + index + "," + a);
				//a[index]++;
				e++;
			});
			console.log(a1);
			var a2 = [2, 4, 6];
			console.log(a2.every(function(e) {
				return e % 2 == 0
			}));
			console.log(a2.some(function(e) {
				return e > 6;
			}));

			var a3 = [1, 2, 3, 4, 5];
			console.log(a3.filter(function(e) {
				return e % 2 == 0;
			}));
			var a4 = [1, 2, 3, 4, 5];
			console.log(a4.map(function(e) {
				return e * 10;
			}));
			console.log(a4);
			console.log(a4.reduce(function(x, y) {
				return x - y;
			}));
			console.log(a4.reduceRight(function(x, y) {
				return x - y;
			}));
			var a5 = [1, 2, 3, 4, 6, 1, 2, 3, 1, 2];
			console.log(a5.indexOf(2, 3));
			console.log(a5.lastIndexOf(2));
			console.log(a5.lastIndexOf("2"));
		</script>
	</head>

	<body>
	</body>

</html>
```

 运行结果：

```js
array-2.html:10  1,0,1,2,3,4,5
array-2.html:10  2,1,1,2,3,4,5
array-2.html:10  3,2,1,2,3,4,5
array-2.html:10  4,3,1,2,3,4,5
array-2.html:10  5,4,1,2,3,4,5
array-2.html:14  (5) [1, 2, 3, 4, 5]
array-2.html:16  true
array-2.html:19  false
array-2.html:24  (2) [2, 4]
array-2.html:28  (5) [10, 20, 30, 40, 50]
array-2.html:31  (5) [1, 2, 3, 4, 5]
array-2.html:32  -13
array-2.html:35  -5
array-2.html:39  6
array-2.html:40  9
array-2.html:41  -1
```

#### 1.5 String

**String**：表示JavaScript中的字符串

| **构造函数**      | **描述**                                           |
| ----------------- | -------------------------------------------------- |
| new String()      | 创建空字符串                                       |
| new String(value) | 使用字面量创建字符串，或使用基本数据类型创建字符串 |

| **属性** | **描述**         |
| -------- | ---------------- |
| length   | 字符串中的字符数 |

**实例方法**：

| **方法名**  | **描述**                                               |
| ----------- | ------------------------------------------------------ |
| charAt      | 获取指定位置的字符                                     |
| concat      | 将若干值连成字符串                                     |
| indexOf     | 获取指定的字符或字符串的索引                           |
| lastIndexOf | 获取指定的字符或字符串的最后一个索引                   |
| match       | 使用正则表达式进行模式匹配。返回结果数组               |
| replace     | 使用正则表达式进行查找与替换                           |
| search      | 查找符合正则表达式的子串的索引，没有结果返回-1         |
| split       | 使用字符串或正则表达式分隔，然后将分隔的多个子字符串组 |
| substr      | 截取子字符串                                           |
| substring   | 截取子字符串                                           |
| toLowerCase | 将字符串转换为小写                                     |
| toUpperCase | 将字符串转换为大写                                     |
| trim        | 去掉字符串头尾的空格                                   |

  

```js
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var s1 = new String();
			var s2 = new String("老谭");
			var s3 = new String(1);
			var s4 = "laotan";
			
			console.log(s1.length);
			console.log(s2.length);
			for(var p in s2){
				console.log(p+":"+s2[p]);
			}
			var s5="abcdefghDeijk";
			console.log(s5.charAt(2));
			console.log(s5.charAt(-2));
			console.log(s5.concat("abc",true));
			console.log(s5.indexOf("de",5));
			console.log(s5.lastIndexOf("de"));
			console.log(s5.match(/de/gi));
			console.log(s5.replace(/de/gi,"one"));
			console.log(s5);
			console.log(s5.search(/de/gi,"de"));
			console.log(s5.split("e"));
			console.log(s5.split(/de/gi));
			console.log(s5.substr(2,5));
			console.log(s5.substring(2,5));
			console.log(s5.substring(2));
			console.log(s5.substring(-2));
			console.log(s5.toLowerCase());
			console.log(s5.toUpperCase());
			console.log("   abc   ".trim())
		</script>
	</head>

	<body>
	</body>

</html>
```

运行结果：

```js
string.html:13  0
string.html:14  2 
string.html:16  0:老
string.html:16  1:谭
string.html:19  c
string.html:20 
string.html:21  abcdefghDeijkabctrue
string.html:22  -1
string.html:23  3
string.html:24  (2) ["de", "De"]
string.html:25  abconefghoneijk
string.html:26  abcdefghDeijk
string.html:27  3
string.html:28  (3) ["abcd", "fghD", "ijk"]
string.html:29  (3) ["abc", "fgh", "ijk"]
string.html:30  cdefg
string.html:31  cde
string.html:32  cdefghDeijk
string.html:33  abcdefghDeijk
string.html:34  abcdefghdeijk
string.html:35  ABCDEFGHDEIJK
string.html:36  abc
```

#### 1.6 Boolean

**Boolean对象**：表示JavaScript中的布尔类型  

| **构造函数**       | **描述**                                           |
| ------------------ | -------------------------------------------------- |
| new Boolean(value) | 参数表示存储的Boolean的值，或者要转化为Boolean的值 |

| 方法名   | 描述                      |
| -------- | ------------------------- |
| toString | 返回字符串”true”或”false” |
| valueOf  | 返回原始布尔值            |

```js
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var b1 = true;
			var b2=new Boolean(true);
			var b3=new Boolean(null);
			console.log(b3.toString());
			console.log(typeof b3.toString());
			var b4=new Boolean("abc");
			console.log(b4.valueOf());
			console.log(typeof b4.valueOf());
		</script>
	</head>

	<body>
	</body>

</html>
```

 运行结果：

```js
boolean.html:11  false
boolean.html:12  string
boolean.html:14  true
boolean.html:15  boolean
```

#### 1.7 Number

**Number对象**：表示JavaScript中的数值类型

| **构造函数**      | **描述**                                     |
| ----------------- | -------------------------------------------- |
| new Number(value) | 使用指定的值创建数值，参数是非数值则进行转换 |

| **常量**          | **描述** |
| ----------------- | -------- |
| MAX_VALUE         | 最大数值 |
| MIN_VALUE         | 最小数值 |
| NaN               | 非数值   |
| NEGATIVE_INFINITY | 负无穷   |
| POSITIVE_INFINITY | 正无穷   |

**实例方法**      

| 实例方法 | 描述                                 |
| -------- | ------------------------------------ |
| toString | 使用指定的进制将数字转换为字符串     |
| toFixed  | 将数值转换为包含指定小数位数的字符串 |
| valueOf  | 返回数值的原始值                     |

```js
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var num1 = 120;
			var num2 = 12.35;
			var num3 = new Number(10);
			var num4 = new Number(false);
			console.log(typeof num4);
			console.log(num4 instanceof Number);
			console.log(Number.MAX_VALUE);
			console.log(Number.MIN_VALUE);
			console.log(Number.NEGATIVE_INFINITY);
			console.log(Number.POSITIVE_INFINITY);
			console.log(num1.toString(8));
			console.log(num2.toFixed(1));
			console.log(num2.toFixed(0));
			//console.log(num2.toFixed(-1));
			console.log(num4);
			console.log(num4.valueOf());
			console.log(typeof num4.valueOf());
		</script>
	</head>

	<body>
	</body>

</html>
```

运行结果：

```js
number.html:12  object
number.html:13  true
number.html:14  1.7976931348623157e+308
number.html:15  5e-324
number.html:16  -Infinity
number.html:17  Infinity
number.html:18  170
number.html:19  12.3
number.html:20  12
number.html:22  Number {0}
number.html:23  0
number.html:24  number
```

#### 1.8 Function  

**Function对象**：表示JavaScript中的函数

| **构造函数**            | **描述**                                            |
| ----------------------- | --------------------------------------------------- |
| new Function(args,body) | args：任意多个字符串参数   body：表示函数体的字符串 |

| 属性      | 描述                             |
| --------- | -------------------------------- |
| length    | 函数的形参数量                   |
| arguments | 函数的实参数组，不推荐使用       |
| caller    | 调用该函数的函数引用，不推荐使用 |
| prototype | 原型，给构造函数使用的对象       |

**实例方法**

| 方法名 | 描述                                                       |
| ------ | ---------------------------------------------------------- |
| call   | 将函数作为指定对象的方法来调用，传递给它的是指定的参数数组 |
| apply  | 将函数作为指定对象的方法来调用，传递给它的是指定的参数     |
| bind   | 返回一个新函数                                             |

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var f1=new Function("num1","num2","return num1+num2");
			console.log(f1(1,2));
		</script>
	</head>
	<body>
	</body>
</html>

```

运行结果：

```js
function.html:8   3
```

#### 1.9 Math  

**Math**：该对象的属性为若干与数学运算相关的常量和静态函数，它并无构造函数

| **常量** | **描述**              |
| -------- | --------------------- |
| E        | 常量e，自然对数的底数 |
| PI       | 圆周率                |

**静态函数**：

| 方法名 | 描述                       |
| ------ | -------------------------- |
| abs    | 计算绝对值                 |
| ceil   | 向上取整                   |
| floor  | 向下取整                   |
| max    | 返回最大值                 |
| min    | 返回最小值                 |
| pow    | 求幂                       |
| random | 产生一个随机数,范围是[0,1) |
| round  | 四舍五入                   |
| sqrt   | 计算平方根                 |

```js
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			console.log(Math.E);
			console.log(Math.PI);
			console.log(Math.abs(-10));
			console.log(Math.ceil(5.6));
			console.log(Math.ceil(-5.6));
			console.log(Math.floor(5.6));
			console.log(Math.floor(-5.6));
			console.log(Math.max(5,10));
			console.log(Math.min(5,10));
			console.log(Math.pow(2,3));
			console.log(Math.random());
			console.log(Math.round(1.5));
			console.log(Math.round(1.4575));
			console.log(Math.sqrt(4.5));
		</script>
	</head>

	<body>
	</body>

</html>
```

  运行结果：

```js
math.html:8  2.718281828459045
math.html:9  3.141592653589793
math.html:10  10
math.html:11  6
math.html:12  -5
math.html:13  5
math.html:14  -6
math.html:15  10
math.html:16  5
math.html:17  8
math.html:18  0.33363097421042087
math.html:19  2
math.html:20  1
math.html:21  2.1213203435596424
```

#### 1.10 Date  

**Date**：表示日期时间          

  

| **构造函数**                                       | **描述**                                                     |
| -------------------------------------------------- | ------------------------------------------------------------ |
| new Date()                                         | 当前日期与时间                                               |
| new Date(milliseconds)                             | 参数是自1970年1月1号午夜至今的毫秒数                         |
| new Date(datestring)                               | 参数是字符串格式的日期，格式：month dd,yyyy hh:mm:ss         |
| new  Date(year,month,day,hours,minutes,seconds,ms) | 参数是年，月，日，时，分，秒，毫秒                                                                                        year：如果是0-99之间的数则加上1900          month：0-11之间的整数                                                          day：1-31之间的整数                                                                 hours：0-23之间的整数                                                                        minutes：0-59之间的整数                                                                                seconds：0-59之间的整数                                                          ms：0-999之间的整数 |

**实例方法**：

| **方法名**                      | **描述**                                |
| ------------------------------- | --------------------------------------- |
| getDate/setDate                 | 返回/设置一月中的日期值                 |
| getDay/setDay                   | 返回/设置一周中的日期值                 |
| getFullYear/setFullYear         | 返回/设置年份                           |
| getMonth/setMonth               | 返回/设置月份,值是1-11                  |
| getHours/setHours               | 返回/设置小时数                         |
| getMinutes/setMinutes           | 返回/设置分钟数                         |
| getSeconds/setSeconds           | 返回/设置秒数                           |
| getMilliseconds/setMilliseconds | 返回/设置毫秒数                         |
| getTime/setTime                 | 返回Date对象内部的毫秒表示形式          |
| toUTCString                     | 将Date转换成字符串,使用世界时间         |
| toLocaleString                  | 将Date转换成字符串,使用本地时间格式     |
| toLocaleDateString              | 将Date转换成日期字符串,使用本地时间格式 |
| toLocaleTimeString              | 将Date转换成时间字符串,使用本地时间格式 |

 **静态方法**：

| 方法名 | 描述                                           |
| ------ | ---------------------------------------------- |
| now    | 得到当前时间，自1970-1-1午夜开始后的毫秒数     |
| parse  | 解析一个日期及时间的字符串表示，返回内部毫秒数 |

 

```
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var d1 = new Date();
			var d2 = new Date(24 * 60 * 60 * 1000);
			var d3 = new Date("9 3,2017 16:56:12");
			var d4 = new Date(2017, 8, 3, 16, 57, 23, 249);
			
			console.log(d1.getFullYear()+"-"+(d1.getMonth()+1)+"-"+d1.getDate());
			console.log(d1.getTime());
			d1.setMonth(10);
			console.log(d1.getFullYear()+"-"+(d1.getMonth()+1)+"-"+d1.getDate());
			d1=new Date();
			console.log(d1.toUTCString());
			console.log(d3.toLocaleString());
			console.log(d3.toLocaleDateString());
			console.log(d3.toLocaleTimeString());
			
			console.log(d1);
			console.log(Date.now());
			console.log(Date.parse("9 3,2017 16:56:12"));
		</script>
	</head>

	<body>
	</body>

</html>
```

运行结果：

```js
ate.html:13  2019-11-24
date.html:14  1574594155595
date.html:16  2019-11-24
date.html:18  Sun, 24 Nov 2019 11:15:55 GMT
date.html:19  2017/9/3 下午4:56:12
date.html:20  2017/9/3
date.html:21  下午4:56:12
date.html:23  Sun Nov 24 2019 19:15:55 GMT+0800 (中国标准时间)
date.html:24  1574594155604
date.html:25  1504428972000
```

#### 1.11 RegExp  

**RegExp**：用于模式匹配的正则表达式

可以使用如下字面量为其赋值：/pattern/attributes

| **构造函数**                   | **描述**                                                     |
| ------------------------------ | ------------------------------------------------------------ |
| new RegExp(pattern,attributes) | pattern:模式字符串或正则表达式                                                                                          attributes:可选,包含任意”g”,”i”,”m”属性,若pattern是正则表达式,则其必须省略 |

| **属性**   | **描述**               |
| ---------- | ---------------------- |
| global     | 是否有”g”属性          |
| ignoreCase | 是否有”i”属性          |
| lastIndex  | 最后匹配的位置         |
| multiline  | 是否有”m”属性          |
| source     | 对应正则表达式的源文本 |

**实例方法**

| 方法名 | 描述                       |
| ------ | -------------------------- |
| exec   | 执行模式匹配               |
| test   | 测试字符串是否包含某个模式 |

```js
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var p1 = /de/igm;
			var p2 = new RegExp("de", "ig");
			console.log(p2.global+","+p2.ignoreCase+","+p2.multiline+","+p2.source);
			var s="abcdefgDescferDE";
			//console.log(p2.exec(s));
			do{
				r=p2.exec(s);
				console.log(r);
			}while(r!=null);
			
			console.log(p2.test(s));
		</script>
	</head>

	<body>
	</body>

</html>
```

运行结果：

```js
regexp.html:10  true,true,false,de
regexp.html:15  ["de", index: 3, input: "abcdefgDescferDE"]
regexp.html:15  ["De", index: 7, input: "abcdefgDescferDE"]
regexp.html:15  ["DE", index: 14, input: "abcdefgDescferDE"]
regexp.html:15  null
regexp.html:18  true
```

#### 1.12 JSON  

**JSON**：ECMAScript 5中引入，用于处理JSON与字符串之间转换的对象

**方法**：

| **方法名**                                                   | **描述**                                                     |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| parse(s)                                                                  parse(s,reviver) | 将字符串解析为JSON                                                                                     s:要解析的字符串                                                                                                                               reviver:用于转换解析值的可选函数 |
| stringify(o)                                                stringify(o,filter)                                                                                                                   stringify(o,filter,intent) | 将指定的参数o转换为字符串，会调用o的toJSON方法                                o：要转换为字符串的JSON对象,数组或原始值                                             filter：可选函数,在转换前做一些替换,或一个数组,包含要转换的属性名                                                                   intent：可选参数,指定缩进及缩进的空格数，最大是10 |

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var s='{"id":1,"name":"laotan"}';
			var r=JSON.parse(s);
			console.log(r.id+","+r.name);
			r=JSON.parse(s,function(k,v){
				console.log(k);
				if(k==""){
					return v;
				}
				return v+="test";
			});
			console.log(r.id+","+r.name);
		</script>
	</head>
	<body>
	</body>
</html>
```

   运行结果：

```js
json1.html:9  1,laotan
json1.html:11  id
json1.html:11  name
json1.html:11 
json1.html:17  1test,laotantest
```

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			var data={
				id:1,
				gender:1,
				name:"laotan",
				address:"成都"
			};
			console.log(JSON.stringify(data));
			console.log(JSON.stringify(data,["name","address"]));
			console.log(JSON.stringify(data,["name","address"],4));
			console.log(JSON.stringify(data,function(k,v){
				console.log(k+","+v);
				if(k=="gender"){
					if(v==1){
						return "男";
					}else{
						return "女";
					}
				}
				return v;
			}));
			
			var names=["Tom","Jack","Rose"];
			console.log(names);
			console.log(JSON.stringify(names));
			console.log(JSON.stringify(names,["1"]));
			console.log(JSON.stringify(names,function(k,v){
				console.log(k+","+v);
				if(k==1){
					return v+"test";
				}
				return v;
			},4));
		</script>
	</head>
	<body>
	</body>
</html>

```

运行结果：

```js
json2.html:13  {"id":1,"gender":1,"name":"laotan","address":"成都"}
json2.html:14  {"name":"laotan","address":"成都"}
json2.html:15  {
     "name": "laotan",
     "address": "成都"
 }
json2.html:17  ,[object Object]
json2.html:17  id,1
json2.html:17  gender,1
json2.html:17  name,laotan
json2.html:17  address,成都
json2.html:16  {"id":1,"gender":"男","name":"laotan","address":"成都"}
json2.html:29  (3) ["Tom", "Jack", "Rose"]
json2.html:30  ["Tom","Jack","Rose"]
json2.html:31  ["Tom","Jack","Rose"]
json2.html:33  ,Tom,Jack,Rose
json2.html:33  0,Tom
json2.html:33  1,Jack
json2.html:33  2,Rose
json2.html:32  [
     "Tom",
     "Jacktest",
     "Rose"
 ]
```

## JavaScript 第四季

### 第一章 事件

#### 1.1 浏览器基本工作原理

**浏览器的主要功能**：将用户使用URI指定位置的Web资源呈现出来，它需要从服务器请求资源，并将其显示在浏览器窗口中资源的格式通常是HTML，也包括PDF、image及其他格式

**浏览器主要组件-1**：

####  ![](..\..\实习学习笔记\js图片\JavaScript基本执行原理.PNG)



#### 2.1 事件处理概述

- JavaScript与HTML之间是通过事件交互的

- 使用事件监听程序对事件的发生做出响应

#### 2.2 事件驱动编程模式

- 通过注册事件监听函数来写程序

- 之后在注册的事件发生时异步调用这些函数

#### 2.3 核心概念

- **事件**：用户或浏览器执行的某种动作，它并不是JavaScript对象

- **事件类型**：也可以叫事件名称，说明发生什么类型事件的字符串，如：click，mouseover

- **事件处理程序或事件监听程序**：处理或响应事件的函数

- **事件目标**：发生的事件或与之相关的对象
- **事件对象**：与特定事件相关且包含有关该事件详细信息的对象。作为参数传给事件处理程序

- **事件传播**：浏览器决定哪个对象触发其事件处理程序的过程

#### 2.4 注册事件处理程序

注册事件处理程序的方式：

- HTML事件处理程序

- DOM0级事件处理程序
- DOM2级事件处理程序
- IE事件处理程序

1. **HTML事件处理程序**

HTML事件处理程序，即设置HTML标签属性为事件处理程序

- 该属性一般以on开头，如：
  - onclick：处理鼠标单击事件
  - onfocus：处理获得焦点事件

- 缺点：
  - HTML与JavaScript耦合度高
  - 存在时差问题
  - 处理程序中的作用域存在兼容性问题

2. **DOM0级事件处理程序**

- DOM0级事件处理程序，即设置脚本对象属性为事件处理程序，兼容性好

- 该属性都是小写的，如：
  - onclick：处理单击事件

- 设置该属性的值为null，则会删除该事件处理程序

3. **DOM2级事件处理程序**

- DOM2级事件处理程序，使用DOM节点的addEventListener()及removeEventListener()函数添加与删除事件处理程序
- addEventListener()接收三个参数：事件类型，事件处理函数，处理程序调用的阶段(默认false：冒泡阶段，可省略；true：捕获阶段)
- 多次调用相同参数的addEventListener()函数则只会调用一次
- IE9之前不支持

4. **IE事件处理程序**

- IE事件处理程序，使用DOM元素的attachEvent()和detachEvent()函数添加与删除事件处理程序

- attachEvent()接收两个参数：事件名及函数
- attachEvent()允许相同的事件处理程序注册多次

#### 2.5 调用事件处理程序

调用事件处理程序：

- 参数
- 作用域
- 返回值
- 调用顺序

1.  事件处理程序的参数

-  通常事件对象会作为事件处理程序的参数或全局对象的属性来使用
-  该参数提供了与事件有关的信息

2. 事件处理程序的作用域

- DOM0与DOM2级事件处理程序：
  - 事件处理程序在事件目标上定义
  - 事件处理程序中的this即是事件目标

- IE事件处理程序:
  - 事件处理程序作为函数调用，在全局对象上定义
  - 事件处理程序中的this是window对象

- HTML事件处理程序：
  - 作用域特殊，会产生兼容性问题

3. 事件处理程序的返回值

- 使用HTML事件处理程序或DOM0级事件处理程序时，事件处理程序的返回值是false则不执行默认操作

4. 调用顺序

- 优先调用HTML事件处理程序

- 使用addEventListener注册的处理程序按照它们的注册顺序调用

- 使用attachEvent注册的处理程序可能按照任意顺序调用

### 第二章 事件传播

#### 2.1 事件流

 事件流描述的是从页面中接收事件的顺序

-  3种方式：
   - 事件冒泡
   - 事件捕获
   - DOM事件流

####  2.2 事件冒泡

- IE的事件流称为事件冒泡(event bubbling)
- 事件由最具体的元素接收，然后逐级向上传播到较为不具体的元素

- 所有的现代浏览器都支持事件冒泡，一般冒泡到window对象

#### 2.3 事件捕获

- Netscape团队提出的事件流称为事件捕获(event capturing)

- 不太具体的节点应该更早接收到事件，而最具体的节点应该最后接收到事件

- 老版本浏览器不支持，但现代浏览器支持这种事件流

#### 2.4 DOM事件流

- 包括三个阶段：事件捕获阶段，处于目标阶段和事件冒泡阶段
- IE8及更早版本不支持  

#### 2.5 事件委托

Event Delegate：父元素监听子元素的冒泡

```js
<ul id="cities">
    <li>北京</li>
    <li>上海</li>
    <li>成都</li>
</ul>
<script type="text/javascript">
    document.getElementById("cities").addEventListener("click",function(e){
    	alert(e.target.innerText);
	})
</script>
```

### 第三章 事件对象

#### 3.1 事件对象概述

在元素触发事件时，会产生一个事件对象，该对象包含有事件相关的信息，包括：

- 事件类型
- 触发事件的元素
- 特定的事件信息：鼠标的位置，键盘的键码值

事件对象可以用于

- 获取事件的详细信息
- 阻止冒泡

#### 3.2 DOM事件对象的获取

 事件对象是事件处理程序中的参数

#### 3.3 DOM中事件对象的通用属性

| 属性          | 类型    | 详情                                                         |
| ------------- | ------- | ------------------------------------------------------------ |
| bubbles       | Boolean | 只读属性，表明事件是否冒泡                                   |
| cancelable    | Boolean | 只读属性，表明是否可以取消该事件的默认行为                   |
| currentTarget | Element | 只读属性，正在处理事件的元素，与this相同                     |
| target        | Element | 只读属性，触发该事件的元素                                   |
| eventPhase    | Integer | 只读属性，调用事件处理程序的阶段：1：捕获阶段；2：处于目标阶段；3：冒泡阶段 |
| isTrusted     | Boolean | true：浏览器生成的事件，false：自定义事件                    |



```javascript
<input type="button" value="按钮" id="btn1" />
<script type="text/javascript">
    document.getElementById("btn1").addEventListener("click", function(e) {
        alert(e);
        alert("bubbles:" + e.bubbles);
        alert("cancelable:" + e.cancelable);
        alert("currentTarget:" + e.currentTarget);
        alert("target:" + e.target);
        alert("eventPhase:" + e.eventPhase);
        alert("type:" + e.type);
        alert("isTrusted:" + e.isTrusted);
	});
</script>
```



#### 3.4  DOM中事件对象的方法

| 方法                     | 作用                                                         |
| ------------------------ | ------------------------------------------------------------ |
| preventDefault           | 取消事件的默认行为，如果cancelable为true，则可以使用该方法   |
| stopImmediatePropagation | 取消事件的进一步捕获或冒泡，同时阻止任何事件处理程序被调用   |
| stopPropagation          | 取消事件的进一步捕获或冒泡，如果bubbles为true，则可以使用该方法 |

//preventDefault方法示例

```javascript
<a href="http://www.baidu.com" id="a1">百度</a>
<script type="text/javascript">
    document.getElementById("a1").addEventListener("click",function(e){
    	e.preventDefault();
	})
</script>
```

//stopImmediatePropagation方法示例

//stopPropagation方法示例

```javascript
<head>
    <meta charset="UTF-8">
    <title></title>
	<style type="text/css">
        #outer {
        	border: 1px solid red
        }

        #inner {
        	border: 1px solid black
        }
    </style>
</head>

<body>
    <div id="outer">
    	<p>Outer</p>
		<div id="inner">
    		Inner
		</div>
	</div>
	<script type="text/javascript">
		var outer = document.getElementById("outer");
		var inner = document.getElementById("inner");

		outer.addEventListener("click", function() {
			alert("outer");
		});

		inner.addEventListener("click", function(e) {
            alert("inner1");
            e.stopImmediatePropagation();
            //e.stopPropagation();
        });
		inner.addEventListener("click", function(e) {
    			alert("inner2");
    			//e.stopImmediatePropagation();
    			//e.stopPropagation();
		});
	</script>
</body>
```

#### 3.5 IE中事件对象的获取

- 使用全局对象window的属性event获取

- 使用attachEvent的参数event获取

#### 3.6 IE中事件对象的通用属性

| 属性         | 类型    | 详情                                                  |
| ------------ | ------- | ----------------------------------------------------- |
| cancelBubble | Boolean | 默认为false，设置为true可以取消事件冒泡               |
| returnValue  | Boolean | 设置为false可以取消事件的默认行为                     |
| srcElement   | Element | 只读属性，触发该事件的元素，与DOM事件对象的target相同 |

//示例代码如下

```javascript
<a href="http://www.baidu.com" id="a1">百度</a>
<script type="text/javascript">
	function getEvent(event){
		return event?event:window.event;
	}
	function getTarget(event){
		if(event.target){
			return event.target;
		}else{
			return event.srcElement;
		}
	}
	function preventDegault(event){
		if(event.preventDefault){
			event.preventDefault();
		}else{
			event.returnValue=false;
		}
	}
	//document.getElementById("a1").attachEvent("onclick",function(){
	//		alert(event.cancelBubble+","+event.returnValue+","+event.srcElement+","+event.type);
	//	event.returnValue=false;
	//})
	document.getElementById("a1").onclick=function(event){
	var e=getEvent(event);
	preventDegault(e);
}
```

#### 3.7 跨浏览器的事件对象

 判断事件处理程序的参数及属性或方法来决定如何获取与使用事件对象



### 第四章 文档事件

#### 4.1 文档事件概述

当浏览器对页面操作时会触发文档事件

- 包括：
  - 文档加载：load
  - 页面滚动：scroll

##### load事件

-  页面元素(文档，图片)加载完成后触发
-  一般用于在页面内容加载完成之后为元素注册事件处理程序

##### scroll事件

-  滚动元素时触发
-  一般用于实现某些特定的效果，如某些元素在滚动到一定位置时固定

//示例代码如下

```javascript
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			body{
				height:1500px
			}
		</style>
		<script type="text/javascript">
			window.addEventListener("load", function() {
				var btn=document.getElementById("btn1");
				btn.addEventListener("click",function(){
					alert("click");
				})
			})
			window.addEventListener("scroll",function(){
				console.log("scroll")
			})
		</script>
	</head>

	<body>
		<button id="btn1">按钮</button>
		<script type="text/javascript">
		</script>
	</body>
```

### 第五章  鼠标事件

#### 5.1 鼠标事件概述

使用鼠标操作元素时，会触发鼠标事件

- 包括：
  - 单击：click
  - 上下文：contextmenu
  - 双击：dblclick
  - 鼠标按下：mousedown
  - 鼠标释放：mouseup
  - 鼠标悬停：mouseover
  - 鼠标离开：mouseout
  - 鼠标进入：mouseenter
  - 鼠标离开：mouseleave
  - 鼠标移动：mousemove

#### 5.2 鼠标事件对象的属性

- clientX：鼠标点击时离浏览器左边的距离
- clientY：鼠标点击时离浏览器上边的距离
- pageX：鼠标点击时离页面左边的距离
- pageY：鼠标点击时离页面上边的距离
- screenX：鼠标点击时离屏幕左边的距离
- screenY：鼠标点击时离屏幕上边的距离

#### 5.3 click事件

-  单击主鼠标(通常时左边按钮)或者按下回车键触发
-  在依次触发mousedown和mouseup之后click事件才会触发

#### 5.4 contextmenu事件

-  单击鼠标右键时触发，一般用于产生右键菜单

-  一般会取消事件的默认行为

#### 5.5 mouseover/mouseout事件

-  mouseover：当鼠标位于元素外部，首次移入元素之内时触发

-  mouseout：鼠标在元素上方，将其移到另一个元素(父元素或子元素也可以)时触发
-  一般用于显示/隐藏提示信息或详细信息

#### 5.6  mouseenter/mouseleave事件

-  mouseenter：当鼠标位于元素外部，首次移入元素之内时触发，不冒泡，移到子元素不触发

-  mouseleave：鼠标在元素上方，将其移到另一个元素时触发，不冒泡，移到子元素不触发

#### 5.7 mousemove事件

-  鼠标在元素内移动时重复触发

```javascript
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style>
			#div1{
				width:200px;
				height:200px;
				border:1px red solid
			}
		</style>
		<script type="text/javascript">
			window.addEventListener("load",function(){
				var btn=document.getElementById("btn");
				btn.addEventListener("click",function(){
					alert("click");
				})
				document.getElementById("div1").addEventListener("mouseover",function(){
					console.log("mouseover");
				})
				document.getElementById("div1").addEventListener("mouseout",function(){
					console.log("mouseout");
				})
				document.getElementById("div1").addEventListener("mousemove",function(){
					console.log("mousemove");
				})
			})
			window.addEventListener("contextmenu",function(e){
				alert("contextmenu");
				alert(e.clientX+","+e.clientY);
				alert(e.pageX+","+e.pageY);
				alert(e.screenX+","+e.screenY);
				e.preventDefault();
			})
		</script>
	</head>
	<body>
		<button id="btn">按钮</button>
		<div id="div1"></div>
	</body>
```

### 第六章 滑轮事件

#### 6.1 滑轮事件概述

 使用鼠标滑轮时会触发鼠标滑轮事件

 包括：

- 滑轮转动：wheel

- 一般实现图片的缩放或幻灯片切换效果

#### 6.2 鼠标滑轮事件对象的属性

-  wheelDelta：滑轮的偏移量，向前滚动时是120的倍数，向后滚动时是-120的倍数，一般判断正负即可

-  deltaX，deltaY，deltaZ：三个纬度上的偏移值

//示例代码如下

``` javascript
<img src="img/logo.jpg" width="100px" height="60px" id="img1" />
<script type="text/javascript">
    window.addEventListener("load", function() {
    	document.getElementById("img1").addEventListener("wheel", function(e) {
            if(e.wheelDelta > 0) {
                document.getElementById("img1").width += 10;
                document.getElementById("img1").height += 5;
            }else{
                document.getElementById("img1").width -= 10;
                document.getElementById("img1").height -= 5;
            }
   		})
	})
</script>
```

### 第七章 键盘事件

#### 7.1 键盘事件概述

 使用键盘时，会触发键盘事件，一般用于文本框

 包括：

- 按下任意键：keydown

- 按下字符键：keypress

- 释放键盘按键：keyup

#### 7.2 事件触发

-  按下字符键，依次触发：

   - keydown，keypress，keyup

   - keydown，keypress是文本框发生变化之前；keypress是文本框发生变化之后

-  按下非字符键，依次触发：
   - keydown，keyup

#### 7.3 事件对象的属性

-  keyCode：键盘上键对应ASCII码，未标准化

-  key：字符串形式的键名
-  location：按键的位置(0:默认;1:左边;2:右边;3:小键盘)
-  shifyKey,ctrlKey,altKey,metaKey：布尔值，表示Shift,Ctrl,Alt,Meta(Window)是否按下

//enter键换行示例

```javascript
<form action="" method="post">
			<input type="text" name="txt" id="txt" value="" /><br />
			<input type="text" name="pwd" id="txt" value="" />
			<input type="button" value="提交"/>
</form>
		
<script type="text/javascript">
		document.getElementById("txt").addEventListener("keydown",function(event){
				
			if(event.keyCode==13){
				event.target.nextElementSibling.nextElementSibling.focus();
			}
			})
			document.getElementById("txt").addEventListener("keypress",function(e){
				console.log("keypress");
				console.log(e.keyCode,e.key,e.location);
			})	
</script>
```

### 第八章 文本事件

#### 8.1 文本事件概述

 用户输入(不管来源)文本时会触发文本事件

 包括：

- 文本输入后：input
- 文本输入前：textinput
- 选择文本：select

#### 8.2 input事件

- 在文本插入文本框之后触发
- IE中使用propertychange事件

#### 8.3 textinput事件

- 该事件是对keypress事件的补充，DOM3级事件，在文本插入文本框之前触发，可取消

- 暂未得到支持，Webkit浏览器使用的事件名为textInput

- 事件对象的data属性表示输入的字符

#### 8.4 select事件

- 触发条件：
  - 用户选中了文本框的文本且鼠标释放时
  - IE8中及更早版本，选择一个字符(不必释放鼠标)

- 得到选择的文本字符串：
  - 使用目标元素的selectionStart及selectionEnd表示选择的文本起始与结束索引
  - IE8及更早的版本使用document.selection.createRange().text

//示例代码如下

```javascript
<input type="text" name="" id="username" />
<script type="text/javascript">
		document.getElementById("username").addEventListener("input", 	function() {
				console.log(document.getElementById("username").value);
		})
		document.getElementById("username").addEventListener("textInput", function(e) {
				console.log(document.getElementById("username").value);
				console.log(e.data);
		})
		document.getElementById("username").addEventListener("select", function(e) {
				console.log(document.getElementById("username").value);
				console.log(e.data);
				console.log("select");
				console.log(e.target.value.substring(e.target.selectionStart, e.target.selectionEnd));
		})
```

### 第九章 表单事件

#### 9.1 表单事件

在表单提交或重置时，会触发此事件

包括：

- 表单提交：submit

- 表单重置：reset

#### 9.2 submit事件

- 在表单提交(点击提交按钮)时触发此事件

- 一般用于表单数据的有效性校验，事件处理程序返回false，表单不会提交 

#### 9.3 reset事件

-  在表单重置(点击重置按钮或使用调用表单对象的reset函数)时触发此事件 

#### 9.4 change事件

-  表单文本输入控件失去焦点且元素内容发生改变时触发此事件

-  下拉框在改变选项时触发此事件

```javascript
<form action="http://www.baidu.com" id="form1" method="post">
        <input type="text" name="" id="username" value="laotan"/>
         <slect name="" id="num">
        	<option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select>
        <input type="submit" value="提交"/>
        <input type="reset" value="重置"/>
</form>
	<script type="text/javascript">
			var form1=document.getElementById("form1");
			form1.addEventListener("submit",function(e){
				//return false;
				e.preventDefault(); //取消事件的默认动作
			})
			form1.addEventListener("reset",function(e){
				//return false;
				e.preventDefault(); //取消事件的默认动作
			})
			var username=document.getElementById("username");
			username.addEventListener("change",function(){
				console.log(username.value);
			})
			var num=document.getElementById("num");
			num.addEventListener("change",function(){
				console.log(num.value);
			})
	</script>
```

### 第十章 焦点事件

#### 10.1 焦点事件概述

元素获取焦点或失去焦点时，会触发对应的焦点事件，鼠标，键盘(Tab)或JavaScript都可以操作焦点的获得及失去

包括：

- 获得焦点：focus，不冒泡

- 失去焦点：blur，不冒泡

- 获得焦点：focusin，冒泡

- 失去焦点：focusout，冒泡

#### 10.2 focus事件

-  元素获得焦点时触发

-  一般用于改变元素样式 

#### 10.3 blur事件

-  元素失去焦点时触发

-  一般用于数据有效性校验

//示例代码如下

```javascript
<input type="text" name="" id="txt1" />
<input type="text" name="" id="txt2" />
<script type="text/javascript">
    var txt2=document.getElementById("txt2");
    txt2.addEventListener("focus",function(){
        console.log("focus");
    })
    txt2.addEventListener("blur",function(){
        console.log("blur");
        console.log(txt2.value);
    })
</script>
```

### 第十一章 拖放事件

#### 11.1 拖放事件概述

-  拖放(Drag-and-Drop DnD)是在拖放源与拖放目标之间传输数据
-  HTML5引入了拖放相关API

-  使用鼠标选择元素并拖动，到达目标元素时释放鼠标，会触发拖放相关事件
-  包括：
   - 拖动开始：dragstart，作用在被拖动元素上
   - 拖放完成：dragend，作用在被拖动元素上
   - 进入目标元素：dragenter，作用在目标元素上
   - 在目标元素上移动：dragover，作用在目标元素上
   - 在目标元素上释放拖放元素：drop， 作用在目标元素上

#### 11.2 拖放事件对象的属性

- dataTransfer：数据传输的媒介

- 属性：
  - dropEffect：当前选择的操作类型，可能的值：copy，move，link，none
  - effectAllowed：设置允许的操作类型
  - files：被拖放文件的FileList

- 方法：
- setData：存储数据
- getData：获取数据

#### 11.3 注意事项

-  不涉及操作系统与浏览器之间的拖放操作

-  鼠标事件不会触发

-  要设置被拖放元素的draggable为true

-  在dragover事件处理程序中要调用事件对象的preventDefault()方法

//示例代码如下

```javascript
<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			#src{
				width:100px;
				height:100px;
				border:1px red solid;
			}
			#target{
				width:200px;
				height:200px;
				border:1px blue solid;
			}
			
		</style>
</head>
<body>
		<div id="src" draggable="true"></div>
		<div id="target"></div>
		<script type="text/javascript">
			var src=document.getElementById("src");
			var target=document.getElementById("target");
			
			src.addEventListener("dragstart",function(event){
				event.dataTransfer.setData("Text","Hello Laotan!");
			})
			
			target.addEventListener("dragover",function(event){
				event.preventDefault();
			})
			target.addEventListener("drop",function(event){
				target.appendChild(src);
				var info=event.dataTransfer.getData("Text");
				alert(info)
			})
		</script>
</body>
```

### 第十二章 模拟事件

#### 12.1 模拟事件概述

-  事件通常是由用户操作触发的

-  使用JavaScript也可以触发事件

-  在Web应用的自动化测试中特别有用

#### 12.2 模拟事件的实现

-  使用document.createEvent()声明事件对象，参数为字符串：
   - UIEvents，UIEvent
   - MouseEvents，MouseEvent
   - CustomEvent

-  调用事件对象的initEvent或initCustomEvent方法为事件设置属性
-  在HTML元素上使用dispatchEvent方法触发事件 

 //示例代码如下

```javascript
<button id="btn1">按钮</button>
<script type="text/javascript">
        var btn1=document.getElementById("btn1");
        btn1.addEventListener("myEvent",function(event){
                alert("MyEvent");
                alert(event.detail);
		});

        var myEvent=document.createEvent("CustomEvent");
        myEvent.initCustomEvent("myEvent",true,true,"Hello");
        btn1.dispatchEvent(myEvent);
</script>
```

### 第十三章 window

#### 13.1 BOM的概念

- rower Object Model，浏览器对象模型

- 是组成JavaScript的一部分

#### 13.2 BOM对象

 window及其属性：

-  location

-  history
-  navigator
-  screen 

#### 13.3 window对象概述

window对象是BOM的核心，代表浏览器窗口的一个实例

在浏览器中代表全局对象(Global)：

- 可访问全局对象Global中的属性和方法，且可以省略window

- 在全局作用域中声明的属性和函数都是window的属性和方法

- 页面元素设置了id属性，则其值会作为window的属性，但是如果已存在该属性，不会更新其值 

#### 13.4 window对象的属性

| 属性                  | 说明                             |
| --------------------- | -------------------------------- |
| screenX，screenY      | 浏览器窗口离屏幕左边和上边的距离 |
| screenTop，screenLeft | 浏览器窗口离屏幕左边和上边的距离 |
| innerHeight           | 文档显示区的高度                 |
| innerWidth            | 文档显示区的宽度                 |
| outerHeight           | 浏览器窗口的高度                 |
| outerWidth            | 浏览器窗口的宽度                 |

浏览器支持差异

- IE和 Opera 支持 screenLeft 和 screenTop，而Safari 支持 screenX 和 screenY

- IE不支持innerHeight和innerWidth属性。使用document.documentElement 或document.body （与 IE 的版本相关）的clientWidth 和 clientHeight 属性作为替代

- IE 不支持outerHeight和outerWidth属性，且没有提供替代的属性

#### 13.5 window对象的方法

| 方法        | 作用                                                       |
| ----------- | ---------------------------------------------------------- |
| alert       | 弹出对话框，将接收到的字符参数显示给用户                   |
| confirm     | 弹出确认对话框，有确认和取消两个按钮，分别返回true和false  |
| prompt      | 弹出输入对话框，用户可以输入文本信息                       |
| print       | 弹出打印对话框                                             |
| open        | 打开新的浏览器窗口，当前大多数浏览器默认会屏蔽，不建议使用 |
| setTimeout  | 在指定的时间后执行代码                                     |
| setInterval | 每隔一定的时间执行一次代码                                 |

//示例代码如下

```javascript
		<input type="" name="username" id="location" value="" />
		<button id="cfm">确认</button>
		<button id="prop">输入</button>
		<button id="print">打印</button>
		<button id="open">打开</button>
		<script type="text/javascript">
			//alert(window.location);
			varcfm=document.getElementById("cfm");
			cfm.addEventListener("click",function(){
				if(confirm("确认吗?")){
					alert("ok");
				}else{
					alert("no");
				}
			})
			var prop=document.getElementById("prop");
			prop.addEventListener("click",function(){
				var info= prompt("请输入信息","默认值");
				alert(info);
			})
			var printbtn=document.getElementById("print");
			printbtn.addEventListener("click",function(){
				print();
			})
			var openbtn=document.getElementById("open");
			openbtn.addEventListener("click",function(){
				open("http://www.baidu.com","","width=400,height=300");
			})
			
			function test1(){
				console.log("one");
				setTimeout(test1,1000);
			}
			
			//setTimeout(test1,1000);
			
			setInterval(function(){
				console.log("two");
			},1000);
		</script>

```

### 第十四章 location

#### 14.1 location对象概述

-  location对象表示文档的地址，即URL

-  既是window对象的属性，也是document对象的属性

-  设置location对象提供的属性值或调用其提供的方法可以跳转到指定的页面

#### 14.2 location对象的属性

| 属性     | 说明                                        |
| -------- | ------------------------------------------- |
| protocol | 协议                                        |
| host     | 主机名与端口                                |
| hostname | 主机名                                      |
| port     | 端口                                        |
| href     | 完整的URL字符串，可设置其值以跳转到其他页面 |
| pathname | 路径，以/开头                               |
| search   | 查询字符串，以?开头                         |
| hash     | 锚点信息，以#开头，没有则返回空字符串       |

#### 14.3 location对象的方法

| 方法    | 作用                                                         |
| ------- | ------------------------------------------------------------ |
| assign  | 改变浏览器的地址跳转到指定参数表示的其他页面会产生历史记录   |
| replace | 与assign作用类似，但不会产生历史记录                         |
| reload  | 重新加载页面：无参数，可能从缓存中加载；参数为true，从服务器加载 |

//示例代码如下

```javascript
		<button id="go">跳转</button>
		<script type="text/javascript">
			var go=document.getElementById("go");
			go.addEventListener("click",function(){
				//location.href="bom-window.html";
				//location.assign("bom-window.html");
				location.replace("bom-window.html");
			})

			console.log(location.protocol);
			console.log(location.host);
			console.log(location.hostname);
			console.log(location.port);
			console.log(location.href);
			console.log(location.pathname);
			console.log(location.search);
			console.log(location.hash);	
		</script>
```

### 第十五章 history

#### 15.1 history对象概述

-  是window对象的属性

-  代表用户浏览网站的历史记录
   - 出于安全原因，不允许使用JavaScript获取到浏览过的URL

#### 15.2 history对象的属性

| 属性   | 说明               |
| ------ | ------------------ |
| length | 保存历史记录的数量 |

#### 15.3 history对象的方法

| 方法    | 作用                                                         |
| ------- | ------------------------------------------------------------ |
| go      | 在历史记录中任意跳转 参数是：1，正整数，则前进；否则，后退；2，字符串，跳转到历史记录中包含此字符串的第一个URL |
| back    | 后退一页，无参数，等同go(-1)                                 |
| forward | 前进一页，无参数，等同go(1)                                  |

//示例代码如下

```javascript
	<a href="bom-history-2.html">第一个页面</a>
	<button onclick="history.forward()">到第二个页面</button>
	<script type="text/javascript">
		alert(history.length);
	</script>
```

#### 15.4 navigator

**window对象的属性是识别客户端浏览器的事实标准**

| 属性       | 描述                                                         |
| ---------- | ------------------------------------------------------------ |
| appName    | 完整的浏览器名称                                             |
| appVersion | 并无标准格式，通常以数字开头，后面跟包含浏览器厂商和版本信息的字符串 |
| userAgent  | 并无标准格式，得到由客户端发送的user-agent首部字段的值该值可以被客户端修改 |
| platform   | 表示浏览器的操作系统平台                                     |

```JS
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">
			console.log(navigator.appName);
			console.log(navigator.appVersion);
			console.log(navigator.userAgent);
			console.log(navigator.platform);
		</script>
	</head>
	<body>
	</body>
</html>
```

运行结果：

```js
bom-navagator.html:7  Netscape
bom-navagator.html:8  5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.119 Safari/537.36
bom-navagator.html:9  Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.119 Safari/537.36
bom-navagator.html:10  Win32
```

### 第十六章 DOM

#### 16.1 DOM概述

**DOM概述**

- Document Object Model:文档对象模型
- 将XML或HTML文档表示为树形结构
- 利用DOM API，开发人员可以对文档的某部分进行添加，修改及删除

**DOM规范**

- DOM 1级规范，1998年10月成为W3C的推荐标准，为基本的文档结构及查询提供了接口
- DOM 2级及3级扩展了DOM API，以满足操作XML的所有需求

```html
<!DOCTYPE html>
<html>
	<head>
		<title>Sample Document</title>
	</head>
	<body>
		<h1>An HTML Document</h1>
		<p>This is a<i>simple</i>document</p>	
	</body>
</html>

```

**HTML文档的树状表示**

![](C:/Users/CM/Desktop/Typora/js图片/dom图.PNG)

**DOM中的类型层次结构**

![](C:\Users\CM\Desktop\Typora\js图片\DOM结构图.PNG)

#### 16.2 DOM核心对象

**Node**

- Node实例代表文档树中的一个单独的节点
- Node是所有节点类型的父类型

```js
使用属性nodeType表示节点类型：

Node.ELEMENT_NODE (1)

Node.ATTRIBUTE_NODE (2)

Node.TEXT_NODE (3)

Node.CDATA_SECTION_NODE (4)

Node.ENTITY_REFERENCE_NODE (5)

Node.ENTITY_NODE (6)

Node.PROCESSING_INSTRUCTION_NODE (7)

Node.COMMENT_NODE (8)

Node.DOCUMENT_NODE (9)

Node.DOCUMENT_TYPE_NODE (10)

Node.DOCUMENT_FRAGMENT_NODE (11)

Node.NOTATION_NODE (12)
```

**Node的属性**

**nodeName：节点名**

- 元素节点：标签名
- 属性节点：属性名
- 文本节点：#text
- 文档节点：#document

**nodeValue：节点值**

- 文本节点：文本
- 属性节点：属性值
- 文档节点与元素节点不可用

**Document**，代表XML或HTML文档，是DOM的核心，其子类型HTMLDocument代表HTML文档，window对象的document属性即是其实例。

**document对象的属性**

-  title：文档title值
-  URL：文档的url表示
-  domain：域
-  referrer：来源页面的URL

**document对象的方法**

- write：将字符串参数插入到调用它的脚本元素的位置
- writeln：与write类似，但会加一个换行(\n)
- getSelection：得到文档中选取的文本字符串

**Element**

- 代表XML或HTML中的元素，提供了对元素的标签名、子节点及特性的访问
- 在HTML中访问元素的标签名可以使用nodeName或tagName，返回的字符串全部大写形式
- HTML文档中的元素使用HTMLElement或其子类型表示

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>document</title>
	</head>
	<body>
		<input type="text" name="" id="info" />
		<input type="button" id="btn1" value="选择" />
		<script type="text/javascript">
			console.log(document.nodeType);
			var info=document.getElementById("info");
			console.log(info.tagName);
			console.log(info.nodeType);
			console.log(info.nodeName);
			console.log(document.nodeName);
			console.log(document.nodeValue);
			console.log(document.title);
			console.log(document.URL);
			console.log(document.domain);
			console.log(document.referrer);
			
			document.write("hello laotan");
			var btn=document.getElementById("btn1");
			btn.addEventListener("click",function(){
				console.log(document.getSelection());
			})
		</script>
	</body>
</html>

```

运行结果：

```js
dom-coreobject.html:11 9
dom-coreobject.html:13 INPUT
dom-coreobject.html:14 1
dom-coreobject.html:15 INPUT
dom-coreobject.html:16 #document
dom-coreobject.html:17 null
dom-coreobject.html:18 document
dom-coreobject.html:19 http://127.0.0.1:8848/javascript-4/dom-coreobject.html
dom-coreobject.html:20 127.0.0.1
dom-coreobject.html:21 http://127.0.0.1:8848/javascript-4/dom-coreobject.html
dom-coreobject.html:26 Selection {anchorNode: body, anchorOffset: 1, focusNode: body, focusOffset: 1, isCollapsed: true, …}
```

#### 16.3 选取元素

在DOM编程中，根据某些条件获取特定的元素是其他操作的基础，使用Document提供的方法选取元素，window的属性document即是Document的子类型HTMLDocument的实例。

**获取元素的方式**

**使用document提供的方法：**

- getElementById
- getElementsByName
- getElementsByTagName
- getElementsByClassName
- querySelector
- querySelectorAll

**使用document提供的属性：**

- body，head，all，forms，images，links

**getElementById：**页面上任何元素都可以有id属性，且值唯一，该方法通过id返回一个特定的Element对象

**getElementsByName：**

- 该方法来自HTMLDocument，只对HTML文档有效
- 该方法通过元素的name属性选取多个Node
- 返回NodeList对象，类似只读数组
- 为某些元素(form,img)设置name属性，该属性为自动加到document对象上

**getElementsByTagName：**

- 通过标签名选取元素
- 返回NodeList对象
- 可以传入*，选取页面所有的元素
- 可以在某个元素上调用此方法，选取该元素的后代元素

**getElementsByClassName：**

- class属性的值可以是一个字符串或以空格隔开的字符串
- 通过元素的class属性选取元素，返回HTMLCollection对象
- 参数格式与class属性的值格式一致，元素的class属性值与参数都匹配才能选取到

**querySelector：**通过CSS选择器选取第一个匹配的元素，没有选取到元素则返回null

**querySelectorAll：**

- 通过CSS选择器选取所有匹配的元素
- 返回NodeList对象
- 没有选取到元素则返回空的NodeList对象

**使用HTMLDocument的属性**

-  body：选取body元素
- head：选取head元素
- all：选取所有元素
- forms：选取所有表单
- images：选取所有图片
- links：选取所有超链接

**all是HTMLAllCollection对象，后三个属性是HTMLCollection类型不推荐使用**

```js
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>

	<body>
		<input type="checkbox" name="sports" />足球
		<div id="div1">
			<input type="checkbox" name="sports" />篮球
			<input type="checkbox" name="sports" />排球
		</div>
		<p class="class1 class2"></p>
		<p class="class1"></p>
		<script type="text/javascript">
			var sports=document.getElementsByName("sports");
			console.log(sports);
			var sports=document.getElementsByTagName("input");
			console.log(sports.length);
			var sports2=document.getElementById("div1").getElementsByTagName("input");
			console.log(sports2.length);
			var p = document.getElementsByClassName("class2 class1");
			console.log(p.length);
			var div=document.querySelector(".class1");
			console.log(div)
			var div=document.querySelectorAll(".class1");
			console.log(div[0])i
		</script>
	</body>

</html>
```

运行结果：

```js
dom-select.html:19  NodeList(3) [input, input, input]
dom-select.html:21  3
dom-select.html:23  2
dom-select.html:25  1
dom-select.html:27  <p class="class1 class2"></p>
dom-select.html:29  <p class="class1 class2"></p>
```

#### 16.4 访问元素属性

**HTML属性(attribute)：**HTML标签中的属性，DOM属性的改变不会导致HTML属性变化

**DOM属性(property)：**DOM对象上的属性，映射HTML属性，HTML属性的变化会导致DOM属性变化

**访问HTML属性：**

使用HTMLElement提供的方法访问：

- getAttribute：获取属性的值
- setAttribute：设置属性的值
- hasAttribute：判断是否有指定的属性
- removeAttribute：删除属性

**它们的参数与HTML标签的属性名一致，不区分大小写，可以访问自定义属性**

使用Node的attributes属性该属性是一个NamedNodeMap，其中存储代表元素属性的Attr对象提供的方法：

- getNamedItem(name)
- removeNamedItem(name)
- setNamedItem(node)
- item(position)

**访问DOM属性：**

1.  HTMLElement对象定义了的读/写属性，它们映射了HTML元素的通用属性及事件处理属性：id，className，title，on*

2. HTMLElement的子对象定义了特定元素的特定属性：

   - HTMLInputElement：type，value，readOnly，checked，disabled

   - HTMLImageElement ：src

   - HTMLFormElement：action，method

**style属性：**

- 使用HTML属性：得到样式字符串
- 使用DOM属性：得到CSSStyleDeclaration对象

**事件属性：**

-  使用HTML属性：得到函数代码的字符串
-  使用DOM属性：得到函数本身

**访问数据集属性**

- Element中声明的dataset属性用于保存HTML5中以”data-”开头的自定义属性
- 访问时将”data-”去掉且去掉后面出现的”-”，以驼峰命名法命名属性名，如：
- data-my-attr应该使用dataset.myAttr访问
- 删除dataset中的属性会同步删除元素对应的自定义属性

```js
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>

	<body>
		<input type="text" data-my-attr="myattr" name="" id="username" value="laotan" style="color: red;" onclick="alert(1)" />
		<button id="btn1">按钮1</button>
		<button id="btn2">按钮2</button>
		<script type="text/javascript">
			var username = document.getElementById("username");
			console.log(username.getAttribute("type"));
			console.log(username.getAttribute("readonly"));
			username.setAttribute("type","radio");
			console.log(username.hasAttribute("readonly"));
			username.removeAttribute("readonly");
						var attrs=username.attributes;
						for(var i=0;i<attrs.length;i++){
							console.log(attrs[i].nodeName+","+attrs[i].nodeValue);
						}
			console.log(username.id);
			console.log(username.readOnly);
			document.getElementById("btn1").addEventListener("click", function() {
				console.log(username.getAttribute("value"));
				console.log(username.value);
			})
			document.getElementById("btn2").addEventListener("click", function() {
				username.setAttribute("value", "老谭");
			})
			
				console.log(username.getAttribute("style"))
				console.log(username.style)
				console.log(username.getAttribute("onclick"));
				console.log(username.onclick);
				console.log(username.getAttribute("data-myattr"));
				console.log(username["data-myattr"]);
			
			console.log(username.dataset.myAttr)
			delete username.dataset.myAttr;
		</script>
	</body>

</html>
```

运行结果：

```js
dom-property.html:15  text
dom-property.html:16  null
dom-property.html:18  false
dom-property.html:22  type,radio
dom-property.html:22  data-my-attr,myattr
dom-property.html:22  name,
dom-property.html:22  id,username
dom-property.html:22  value,laotan
dom-property.html:22  style,color: red;
dom-property.html:22  onclick,alert(1)
dom-property.html:24  username
dom-property.html:25  false
dom-property.html:34  color: red;
dom-property.html:35  CSSStyleDeclaration {0: "color", alignContent: "", alignItems: "", alignSelf: "", alignmentBaseline: "", all: "", …}
dom-property.html:36  alert(1)
dom-property.html:37  ƒ onclick(event) {
  alert(1)
}
dom-property.html:38  null
dom-property.html:39  undefined
dom-property.html:41  myattr
dom-property.html:27  laotan
dom-property.html:28  laotan
dom-property.html:27  老谭
dom-property.html:28  老谭
```

#### 16.5 访问元素内容

 元素内容是指在标签体中的内容，格式：

- 纯文本
- 带标签的HTML字符串文本
- 节点

**访问元素内容的方式**

1. 使用Element的innerText或textContent属性区别：
   - textContent将元素后代的Text元素简单串联在一起   
   - innerText不返回script标签中的内容，忽略多余空白，保留表格格式

2. 使用Element的innerHTML属性，该属性会保留标签以使浏览器识别

3. 作为Text节点，访问其nodeValue

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<div id="div1">
			<p>段落1</p>
			<p>段落2</p>
			<script type="text/javascript">
				var num=10;
			</script>
			<table>
				<tr>
					<td>1</td>
					<td>2</td>
					<td>3</td>
				</tr>
				<tr>
					<td>4</td>
					<td>5</td>
					<td>6</td>
				</tr>
				<tr>
					<td>7</td>
					<td>8</td>
					<td>9</td>
				</tr>
			</table>
		</div>
		<div id="div2"></div>
		<script type="text/javascript">
			console.log(document.getElementById("div1").textContent);
			document.getElementById("div2").innerText="DIV2";
			console.log(document.getElementById("div1").innerHTML);
			document.getElementById("div2").innerHTML="<b>DIV2</b>";
			console.log(document.getElementById("div1").firstElementChild.firstChild.nodeValue);
		</script>
	</body>
</html>

```

运行结果：

```js
dom-content.html:34 
                段落1
                段落2

                    var num=10;



                        1
                        2
                        3


                        4
                        5
                        6


                        7
                        8
                        9

			
		
dom-content.html:36 
                <p>段落1</p>
                <p>段落2</p>
                <script type="text/javascript">
                    var num=10;
                </script>
                <table>
                    <tbody><tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>8</td>
                        <td>9</td>
                    </tr>
                </tbody></table>
		
dom-content.html:38 段落1
```

#### 16.6 文档导航

**当选取了节点/元素之后，要选取与之相关的节点/元素，如父，子，兄弟等**

![](..\..\Typora\js图片\文档导航.PNG)

**导航的方式**

- 作为节点树
- 作为元素树

**作为节点树** 

- 在Node中定义了如下属性：
- parentNode：父节点
- childNodes：子节点，只读的NodeList对象
- firstChild：第一个子节点
- lastChild：最后一个子节点
- nextSibling：下一个兄弟节点
- previoursSibling：前一个兄弟节点

**作为元素树：**元素树会忽略Text及Comment节点

- Element提供了以下属性：
- children：子元素，只读的NodeList对象
- firstElementChild：第一个子元素
- lastElementChild：最后一个子元素
- nextElementSibling：下一个兄弟元素
- previoursElementSibling：前一个兄弟元素
- childElementCount：子元素的数量

```js
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>

	<body>
		<div id="parent">
			<ul id="names">
				<li>Tom</li>
				<li>Jack</li>
				<li>Rose</li>
			</ul>
			<ul id="names2">
				<li>Tom</li>
				<li>Jack</li>
				<li>Rose</li>
			</ul>
		</div>
		<script type="text/javascript">
			var names = document.getElementById("names");
			console.log(names.parentNode.id);
			var child = names.childNodes;
				for(var i = 0; i < child.length; i++) {
					console.log(child[i].nodeType);
				}
			console.log(names.nextSibling.nextSibling);
			var child = names.children;
				for(var i = 0; i < child.length; i++) {
					console.log(child[i].innerText);
				}
			console.log(names.nextElementSibling);
		</script>
	</body>

</html>
```

运行结果：

```js
dom-navigator.html:24  parent
dom-navigator.html:27  3
dom-navigator.html:27  1
dom-navigator.html:27  3
dom-navigator.html:27  1
dom-navigator.html:27  3
dom-navigator.html:27  1
dom-navigator.html:27  3
dom-navigator.html:29  <ul id="names2">…</ul>
dom-navigator.html:32  Tom
dom-navigator.html:32  Jack
dom-navigator.html:32  Rose
dom-navigator.html:34  <ul id="names2">…</ul>
```

#### 16.7 操作节点

**创建节点**

**使用Document提供的方法：**

**createElement**

- 创建新的元素节点
- 参数是不区分大小的标签名 

**createTextNode**

- 创建文本节点
- 参数是字符串 

**cloneNode**

- 克隆存在的节点
- 参数为true进行深克隆，false则为浅克隆

**插入节点**

 **使用Node提供的方法：**

**appendChild：**

- 在需要插入元素的节点上调用
- 参数是待插入的节点，会成为元素最后一个子节点

**insertBefore：**

- 第一个参数是待插入的节点
- 第二个参数是已存在的节点，将新节点插入其前面

**替换节点**

**使用Node提供的方法：**

**replaceChild：**

- 删除一个子节点并用新的节点替换它，在父节点上调用
- 第一个参数是新节点，第二个参数是需要替换的节点

**删除节点**

**使用Node提供的方法：**

**removeChild：**

- 删除子节点，在要删除的节点的父节点上调用
- 参数是要删除的节点

**DocumentFragment**

-  特殊的Node，作为其他节点的临时容器
-  类似Document，但它不是文档的一部分
-  它将一组节点当成一个节点处理，可以提高性能
-  使用document.createDocumentFragment创建它

**新节点上的事件注册**

-  之前注册的事件处理程序在创建节点后不起作用
-  使用事件代理解决

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<div id="div1"></div>
		<button id="createul">创建无序列表</button>
		<button id="createli">创建列表项</button>
		<button id="cloneul">克隆无序列表</button>
		<button id="replaceli">替换列表项</button>
		<button id="deleteli">删除列表项</button>
		<script type="text/javascript">
//			var allli=document.getElementsByClassName("class1");
//			for(var i=0;i<allli.length;i++){
//				allli.addEventListener("click",function(){
//					alert(this.innerText);
//				})
//			}
			document.body.addEventListener("click",function(event){
				if(event.target.className=="class1"){
					alert(event.target.innerText);
				}
			})
			var createul=document.getElementById("createul");
			createul.addEventListener("click",function(){
				var newUL=document.createElement("ul");
				newUL.id="newul";
				var newLI1=document.createElement("li");
				newLI1.className="class1";
				var name1=document.createTextNode("Tom");
				var newLI2=document.createElement("li");
				newLI2.className="class1";
				var name2=document.createTextNode("Jack");
				
				newLI1.appendChild(name1);
				newLI2.appendChild(name2);
				
				var df=document.createDocumentFragment();
				df.appendChild(newLI1);
				df.appendChild(newLI2);
				//newUL.appendChild(newLI1);
				//newUL.appendChild(newLI2);
				newUL.appendChild(df);
				
				document.getElementById("div1").appendChild(newUL);
			})
			var cloneul=document.getElementById("cloneul");
			cloneul.addEventListener("click",function(){
				var ul=document.getElementById("newul");
				
				document.body.appendChild(ul.cloneNode(false));
			})
			var createli=document.getElementById("createli");
			createli.addEventListener("click",function(){

				var newLI1=document.createElement("li");
				var name1=document.createTextNode("Rose");
								
				newLI1.appendChild(name1);
				var ul=document.getElementById("newul");			
				ul.insertBefore(newLI1,ul.lastElementChild);
				
			})
			var replaceli=document.getElementById("replaceli");
			replaceli.addEventListener("click",function(){

				var newLI1=document.createElement("li");
				var name1=document.createTextNode("老谭");
								
				newLI1.appendChild(name1);
				var ul=document.getElementById("newul");			
				ul.replaceChild(newLI1,ul.lastElementChild);
				
			})
			var deleteli=document.getElementById("deleteli");
			deleteli.addEventListener("click",function(){

				var ul=document.getElementById("newul");			
				ul.removeChild(ul.lastElementChild);
				
			})
		</script>
	</body>
</html>

```

#### 16.8 集合对象

- DOM中提供的某些方法会得到若干节点，这些节点会以集合对象的方法存储，类似于只读数组的操作
- document.getElementsByName返回NodeList
- document.forms返回HTMLCollection
- node.attributest返回NamedNodeMap

**集合对象的动态性**

- 每当文档发生变化时，它们都会更新
- 它们始终保持最新、最准确的信息
- 每次访问集合对象意味着一次查询，尽量少用以提升性能

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<input type="checkbox" name="sports" />足球
		<input type="checkbox" name="sports" />篮球
		<input type="checkbox" name="sports" />排球
		<input type="button" value="删除" id="delBtn"/>
		<script type="text/javascript">
			var delBtn=document.getElementById("delBtn");
			delBtn.addEventListener("click",function(){
				var sports=document.getElementsByName("sports");
				for(var i=0;i<sports.length;i++){
					if(sports[i].checked){
						
						document.body.removeChild(sports[i].nextSibling);
						document.body.removeChild(sports[i]);
						i--;
					}
				}
			})
		</script>
	</body>
</html>
```

#### 16.9 操作表单

- 在HTML中，表单由form标签表示
- 在JavaScript中，表单由HTMLFormElement表示，它继承自HTMLElement

**HTMLFormElement对象的属性**

| 属性     | 描述                                       |
| -------- | ------------------------------------------ |
| name     | 表单名称                                   |
| action   | 处理表单的URL                              |
| method   | 发送HTTP的请求类型                         |
| enctype  | 请求编码类型                               |
| elements | 表单中所有控件的集合，类型为HTMLCollection |
| length   | 表单中控件的数量                           |
| submit   | 提交表单                                   |
| reset    | 重置表单                                   |

**使用elements属性访问表单控件**

- elements是一个有序列表，保存着表单中所有的控件，顺序与标签出现的顺序一致
- 可以按照位置及名称访问表单控件：
  - elements[0]
  - elements["username"]

如果有多个同名的控件，得到NodeList对象

**表单控件的通用属性**

| 属性     | 描述             |
| -------- | ---------------- |
| name     | 控制名称         |
| type     | 控件类型         |
| value    | 提交给服务器的值 |
| disabled | 布尔值，是否禁用 |
| readOnly | 布尔值，是否只读 |
| tabIndex | 切换序号         |
| form     | 所属表单         |

**除form外，其他属性都是可修改的**

**表单控件的通用方法**

| 方法  | 描述     |
| ----- | -------- |
| focus | 获取焦点 |
| blur  | 失去焦点 |

**表单控件的通用事件**

| 事件   | 描述                                                         |
| ------ | ------------------------------------------------------------ |
| focus  | 获得焦点时触发                                               |
| blur   | 失去焦点时触发                                               |
| change | 文本框：失去焦点且value值有改变时触发                          下拉框：改变选项时触发 |

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<form action="http://www.baidu.com" id="form1" method="post">
			<input type="text" name="" id="username" value="laotan"/>
			<select name="" id="num">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
			</select>
			<input type="submit" value="提交"/>
			<input type="reset" value="重置"/>
		</form>
		<script type="text/javascript">
			var form1=document.getElementById("form1");
			form1.addEventListener("submit",function(e){
				//return false;
				e.preventDefault();
			})
			form1.addEventListener("reset",function(e){
				//return false;
				e.preventDefault();
			})
			var username=document.getElementById("username");
			username.addEventListener("change",function(){
				console.log(username.value);
			})
			var num=document.getElementById("num");
			num.addEventListener("change",function(){
				console.log(num.value);
			})
			
		</script>
	</body>
</html>

```

运行结果：

```js
event-form.html:34  2
event-form.html:34  1
event-form.html:34  3
```

```js
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<input type="text" name="" id="txt1" />
		<input type="text" name="" id="txt2" />
		<script type="text/javascript">
			var txt2=document.getElementById("txt2");
			txt2.addEventListener("focus",function(){
				console.log("focus");
			})
			txt2.addEventListener("blur",function(){
				console.log("blur");
				console.log(txt2.value);
			})
		</script>
	</body>
</html>

```

运行结果：

```js
event-focus.html:13  focus
event-focus.html:16  blur
```



#### 16.10 操作下拉框

HTMLSelectElement表示下拉框，除了表单控件通用的属性及方法外，它还提供了针对下拉框的属性和方法

**HTMLSelectElement的属性**

| 属性          | 描述                                                         |
| ------------- | ------------------------------------------------------------ |
| multiple      | 布尔值，是否允许多选                                         |
| options       | 下拉框中所有option元素的集合，HTMLCollection对象             |
| selectedIndex | 选中项的索引，从0开始；没有选中任何，则为-1；多选，返回第一个选项的索引 |
| size          | 下拉框中可见的选项数                                         |
| type          | select-one或select-multiple                                  |
| value         | 没有选择任何项，为空字符串                               选中一个项，该选项指定了value属性的值，则返回此值；否则，返回选项的文本  选择多个项，根据上条规则，返回第一个项的值                                                                       可设置value为某个选项的值，以使该选项默认选中 |
| add           | 增加新的选项，第一个参数是新的选项，第二个参数表示增加到哪个选项前 |
| remove        | 移除指定位置的选项，参数是选项的索引                         |

选项概述

- HTMLOptionElement表示选项
- 使用Option构造函数可以创建选项
- new Option("text","value")

HTMLOptionElement的属性

| 属性     | 描述                                       |
| -------- | ------------------------------------------ |
| value    | 选项的值                                   |
| text     | 选项的文本                                 |
| index    | 选项在options集合中的索引                  |
| label    | 选项标签                                   |
| selected | 布尔值，表示选项是否被选中，设置为true可选 |

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<select name="names" id="names" size=1>
			<option value="1" label="汤姆">Tom</option>
			<option value="2">Jack</option>
			<option value="3">Rose</option>
		</select>
		<button id="btn1">按钮</button>
		<button id="btn2">增加选项</button>
		<button id="btn3">移除选项</button>
		<button id="btn4">获取选项</button>
		<script type="text/javascript">
			var btn=document.getElementById("btn1");
			btn.addEventListener("click",function(){
				var select=document.getElementById("names");
				//alert(select.multiple);
				//alert(select.selectedIndex);
				//alert(select.size);
				//alert(select.type);
				//alert(select.value);
				select.value=3;
			})
			var btn2=document.getElementById("btn2");
			btn2.addEventListener("click",function(){
				var newOption=new Option("laotan","4");
				var select=document.getElementById("names");
				select.add(newOption,select.options[2]);
			})
			var btn3=document.getElementById("btn3");
			btn3.addEventListener("click",function(){
				var select=document.getElementById("names");
				select.remove(2);
			})
			var btn4=document.getElementById("btn4");
			btn4.addEventListener("click",function(){
				var select=document.getElementById("names");
				var option=select.options[1];
				//alert(option.text);
				//alert(option.value);
				//alert(option.index);
				//alert(option.label);
				//alert(option.selected);
				option.selected=true;
			})
		</script>
	</body>
</html>
```

#### 16.11 操作表格

- 在HTML中，表格由table标签表示，子标签包括：caption，thead，tbody，tfoot，tr，th，td等
- 表格使用HTMLTableElement表示

**HTMLTableElement的属性**

| 属性                        | 描述                                                       |
| --------------------------- | ---------------------------------------------------------- |
| caption                     | 表示caption元素，HTMLTableCaptionElement对象               |
| tBodies                     | 表示tbody元素的HTMLCollection，包含HTMLTableSectionElement |
| tFoot                       | 表示tfoot元素，HTMLTableSectionElement                     |
| tHead                       | 表示thead元素，HTMLTableSectionElement                     |
| rows                        | 表示所有行的HTMLCollection，包含HTMLTableRowElement        |
| createTHead/deleteTHead     | 创建与删除thead元素                                        |
| createTFoot/deleteTFoot     | 创建与删除tfoot元素                                        |
| createCaption/deleteCaption | 创建与删除caption元素                                      |
| insertRow                   | 向rows集合中的指定位置插入一行                             |
| deleteRow                   | 删除指定位置的行                                           |

**HTMLTableSectionElement的属性和方法**

| 属性/方法 | 描述                                                |
| --------- | --------------------------------------------------- |
| rows      | 表示其中行的HTMLCollection，包含HTMLTableRowElement |
| insertRow | 向rows集合中的指定位置插入一行，返回新插入的行      |
| deleteRow | 删除指定位置的行                                    |

**HTMLTableRowElement的属性和方法**

| 属性/方法  | 描述                                                     |
| ---------- | -------------------------------------------------------- |
| cells      | 表示行中单元格的HTMLCollection，包含HTMLTableCellElement |
| insertCell | 向cells集合中的指定位置插入单元格，返回新插入的单元格    |
| deleteCell | 删除指定位置的单元格                                     |

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<table id="table1" width="100px" border="1">
			<caption>标题</caption>
			<tr>
				<td>1</td>
			</tr>
		</table>
		<button id="info">获取属性</button>
		<button id="addrow">增加行</button>
		<button id="deleterow">删除行</button>
		<script type="text/javascript">
			var info=document.getElementById("info");
			info.addEventListener("click",function(){
				var table=document.getElementById("table1");
				alert(table.rows[0]);
			})
			var addrow=document.getElementById("addrow");
			addrow.addEventListener("click",function(){
				var table=document.getElementById("table1");
				table.insertRow(0);
				table.rows[0].insertCell(0);
				table.rows[0].cells[0].appendChild(document.createTextNode("Hello"));
			})
			var deleterow=document.getElementById("deleterow");
			deleterow.addEventListener("click",function(){
				var table=document.getElementById("table1");
				table.deleteRow(0);
			})
		</script>
	</body>
</html>

```

运行结果：

```js
VM202:1  你好
```

#### 16.12 操作内联样式

**操作内联样式**

-  通过元素的HTML属性style
- 通过元素的DOM属性style：
- 该属性不是字符串，是CSSStyleDeclaration对象
- 该对象的属性表示元素使用style指定的CSS属性
- 属性的值都是字符串，且要带单位

**名字约定**

- CSS属性如果包含连字符(-)，JavaScript中会移除连字符，将每个连字符后面的字母大写，如： backgroundColor
- CSS属性如果是JavaScript的关键字，则在之前加上css作为前缀，如： cssFloat

**计算样式**：元素的计算样式是一组属性值，也是CSSStyleDeclaration对象，由浏览器通过把所有应用在该元素上的内联样式计算得到，是实际元素显示所使用的属性值

使用window.getComputedStyle获取其值：

- 第一个参数是元素
- 第二个参数可选，伪对象字符串

**计算样式与内联样式的区别**

- 计算样式的属性是只读的
- 计算样式的值是绝对值
- 不计算复合属性，只基于最基础的属性：如：不计算margin，而计算marginTop等

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			#div1{
				color:red;
			}
			#div1:first-letter{
				color:black
			}
		</style>
	</head>
	<body>
		<div id="div1">
			Hello
		</div>
		<script type="text/javascript">
			var div1=document.getElementById("div1");
			//div1.setAttribute("style","width:100px;height:100px;border:1px solid red");
			
			var divStyle=div1.style;
			//alert(divStyle.width);
			divStyle.width="50%";
			divStyle.height="100px";
			divStyle.border="1px solid red";
			divStyle.backgroundColor="yellow";
			divStyle.cssFloat="right";
			
			//alert(divStyle.color);
			
			var computedStyle=window.getComputedStyle(div1,":first-letter");
			console.log(computedStyle.width);
		</script>
	</body>
</html>
```

运行结果：

```jsx
inner-style.html:34  auto
```

#### 16.13 操作类样式

- 通过元素的HTML属性class
- 通过元素的DOM属性className
- 可以同时设置多个类名，以空格隔开

**classList属性**：该属性是一个只读的类数组对象，包含元素的单独类名，是动态集合

提供的方法：

- add：往元素的class属性中添加类名
- remove：从元素的class属性中删除类名
- toggle：不存在类名则添加，否则就删除
- contains：判断是否存在类名

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			.class1{
				width: 100px;
				height: 100px;
				border:1px solid red;
			}
			.class2{
				background: yellow;
			}
			.class3{
				color: blue;
			}
		</style>
	</head>
	<body>
		<div id="div1">
			Hello!
		</div>
		<button id="addClass">增加类样式</button>
		<button id="removeClass">移除类样式</button>
		<button id="toggleClass">切换类样式</button>
		<script type="text/javascript">
			var div1=document.getElementById("div1");
			//div1.setAttribute("class","class1");
			div1.className="class1 class2";
		
			var addClass=document.getElementById("addClass");
			addClass.addEventListener("click",function(){
				div1.classList.add("class3");
			})
			var removeClass=document.getElementById("removeClass");
			removeClass.addEventListener("click",function(){
				div1.classList.remove("class2");
			})
			var toggleClass=document.getElementById("toggleClass");
			toggleClass.addEventListener("click",function(){
				div1.classList.toggle("class2");
			})
			console.log(div1.classList.contains("class3"));
		</script>
	</body>
</html>

```

运行结果：

```js
class-style.html:44  false
```

#### 16.14 操作样式表

**样式表概述**

- 使用style标签声明内部样式
- 使用link标签声明外部样式

**访问样式表的方式**

- 使用常规选取元素获取方式
- 使用document. styleSheets属性：
- 该属性是StyleSheetList，只读的类数组对象
- 其中的元素是CSSStyleSheet

 **CSSStyleSheet** ：允许查询、插入和删除样式表规则

**属性：**

- cssRules：包含样式表的所有规则的数组，元素是CSSStyleRule对象，使用属性cssText获取样式规则
- disabled：是否禁用样式表

**方法：**

- insertRule：增加样式规则，参数为样式规则和索引
- deleteRule：删除样式规则，参数为索引

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			P{
				color:red;
			}
			div{
				color:blue;
			}
		</style>
		<link rel="stylesheet" type="text/css" href="css/hello.css" id="style1"/>
	</head>
	<body>
		<p>段落</p>
		<div>
			我是老谭!
		</div>
		<button id="change">换皮肤</button>
		<script type="text/javascript">
			var styleSheets=document.styleSheets;
			//alert(styleSheets[0].cssRules[1].cssText);
			//styleSheets[0].disabled=true;
			//styleSheets[0].insertRule("p{font-size:30px}",0);
			styleSheets[0].deleteRule(0);
			var change=document.getElementById("change");
			change.addEventListener("click",function(){
				//styleSheets[1].href="css/hello2.css";
				document.getElementById("style1").href="css/hello2.css";
			})
		</script>
	</body>
</html>

```

#### 16.15 操作Cookie

**Cookie概述**

- Cookie是自动在客户端与Web服务器之间来回传递的一小块信息
- 它是作为HTTP报文首部的一部分由HTTP协议处理的
- 请求首部：Cookie
- 响应首部：Set-Cookie

**Cookie的属性**

| 属性            | 描述                                        |
| --------------- | ------------------------------------------- |
| name            | Cookie的名称                                |
| Cookie的名称    | Cookie的值                                  |
| domain          | Cookie所在的域                              |
| path            | Cookie所在的目录                            |
| secure          | 设置只能在 HTTPS 连接中被浏览器传递到服务器 |
| max-age/expires | 以秒为单位设置Cookie的生存期                |

**保存Cookie**

- 将如下键值对形式的字符串赋值给document的cookie属性即可：cookiename=cookievalue;max-age=60
- 有多个Cookie需保存则重复调用赋值语句

**读取Cookie**

使用JavaScript读取document.cookie的值，然后进行字符串处理

**Cookie的优缺点**

优点：

- 可配置存储有效期
- 浏览器支持好

 缺点：

- 不适合大量数据的存储
- 需要在客户端与服务器之间来回传递，效率低

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<form action="" method="post">
			<input type="text" name="username" id="username" value="" />
			<input type="password" name="password" id="password" value="" />
			<input type="button" value="登录" id="btn"/>
			<script type="text/javascript">
				var btn=document.getElementById("btn");
				btn.addEventListener("click",function(){
					var username=document.getElementById("username").value;
					var password=document.getElementById("password").value;
					document.cookie="username="+username+";max-age=30";
					document.cookie="password="+password+";max-age=30";
				})
				console.log(document.cookie);
				var cookies=document.cookie.split(";");
				for(var i=0;i<cookies.length;i++){
					var cookie=cookies[i];
					var name=cookie.substring(0,cookie.indexOf("="));
					var value=cookie.substring(cookie.indexOf("=")+1);
					console.log(name,value);
				}
			</script>
		</form>
	</body>
</html>

```

#### 16.16 操作WebStorage

**WebStorage概述**

- 与Cookie类似，将数据存储在客户端，但无需在客户端与服务器端来回传递
- 以键值对的格式保存数据
- 键和值都是字符串

**WebStorage概述**：与Cookie类似，将数据存储在客户端，但无需在客户端与服务器端来回传递

- 以键值对的格式保存数据
- 键和值都是字符串

**Storage API**

| 方法               | 描述                     |
| ------------------ | ------------------------ |
| setItem(key,value) | 保存数据                 |
| getItem(key)       | 根据指定的键读取对应的值 |
| key(index)         | 根据指定的索引得到键     |
| clear()            | 删除所有数据             |
| removeItem(key)    | 删除指定的键对应的数据   |

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<script type="text/javascript">
			localStorage.setItem("c","China");
			localStorage.setItem("e","English");
			sessionStorage.setItem("f","France");
			console.log(localStorage.getItem("c"));
			console.log(localStorage.key(0));
			//localStorage.removeItem("e");
			//localStorage.clear();
		</script>
	</body>
</html>
```

运行结果：

```js
webstorage.html:12  China
webstorage.html:13  c
```

#### 16.17 Ajax

**Ajax概述** ：**Asynchronous**+**JavaScript**+**And**+**XML**

- 异步：发送请求后不等返回结果，由回调函数处理结果
- JavaScript：向服务器发起请求，获得返回结果，更新页面(DOM)
- XML：封装数据，现在主要使用JSON格式

**Ajax的好处**

- 使用JavaScript从服务器获取数据而不必刷新整个页面：
- 避免页面所有内容重新加载，提升响应速度
- 提供类似C/S的交互效果，操作更方便

 **XMLHttpRequest概述**：实现Ajax的核心类

使用步骤：

- 实例化
- 指定请求信息
- 设置回调函数
- 处理响应

 **XMLHttpRequest实例化**

由于浏览器的支持情况，有两种实例化方式：

- new XMLHttpRequest()
- new ActiveXObject("Microsoft.XMLHTTP");

**指定请求信息**

1. 使用XMLHttpRequest的open方法，语法如下
   - open(method,url,[async],[username],[password])

2. 参数说明：
   - method：请求类型，get/post等，不区分大小写
   - url：请求资源的URL，默认不允许跨域
   - async：是否异步，默认true，设置false，则同步请求
   - username：用户名
   - password：密码

3. 使用XMLHttpRequest的setRequestHeader设置请求头信息(首部字段)
   - 在post请求时会设置Content-Type

**设置回调函数**

- 为XMLHttpRequest注册readystatechange事件处理程序，在请求状态发生变化时会触发该事件处理程序

**处理响应**

- 在回调函数中，对readyState及status(HTTP响应状态码)进行判断，以做出不同的处理
- 处理成功完成的条件是readyState为4且status为200
- 使用responseText或responseXML属性获取响应结果

**readyState属性**：该属性指定了HTTP请求的状态

| 常量             | 值   | 描述           |
| ---------------- | ---- | -------------- |
| UNSENT           | 0    | open()尚未调用 |
| OPENED           | 1    | open()已调用   |
| HEADERS_RECEIVED | 2    | 接收到头信息   |
| LOADING          | 3    | 接收到响应主体 |
| DONE             | 4    | 响应完成       |

**注意：浏览器的表现并不一致**

**发送请求**：使用XMLHttpRequest的send方法发送请求

参数说明：

- 如果是get请求，参数可省或为null
- 如果是post请求，参数即是提交的请求数据

 **发送文本**

- 通过调用设置Content-Type的值为application/x-www-form-urlencoded
- 发送请求时将需要提交的数据以查询字符串的格式作为参数传入send()方法

**发送二进制文件**

- 使用FormData对象封装要提交的数据，作为参数传入send()方法
- 无需显式设置Content-Type的值

```html
<!DOCTYPE html>
<html>
  <head>
    <title>get.html</title>
	<meta charset="UTF-8" />
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
  
  <body>
    <input type="button" id="get" value="发送GET请求" />
    <script type="text/javascript">
    	var get=document.getElementById("get");
    	get.addEventListener("click", function(){
    		var xhr=new XMLHttpRequest();
    		xhr.open("get","get?name=laotan");
    		xhr.onreadystatechange=function(){
    			if(xhr.readyState==4 && xhr.status==200){
        			console.log(xhr.responseText);
    			}

    		}
    		xhr.send();
    	});
    </script>
  </body>
</html>

```

```html
<!DOCTYPE html>
<html>
  <head>
    <title>post.html</title>
	<meta charset="UTF-8" />
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
  
  <body>
     <input type="button" id="post" value="发送POSTT请求" />
        <input type="button" id="upload" value="发送文件请求" />
        <input type="file" id="avatar" />
      <script type="text/javascript">
    	var post=document.getElementById("post");
    	post.addEventListener("click", function(){
    		var xhr=new XMLHttpRequest();
    		xhr.open("post","post");
    		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    		xhr.onreadystatechange=function(){
    			if(xhr.readyState==4 && xhr.status==200){
        			console.log(xhr.responseText);
    			}

    		}
    		xhr.send("name=laotan");
    	});
    	
    	var upload=document.getElementById("upload");
    	upload.addEventListener("click", function(){
    		var xhr=new XMLHttpRequest();
    		xhr.open("post","upload");
    		//xhr.setRequestHeader("Content-Type", "multipart/form-data");
    		xhr.onreadystatechange=function(){
    			if(xhr.readyState==4 && xhr.status==200){
        			console.log(xhr.responseText);
    			}

    		}
    		var formData=new FormData();
    		var file=document.getElementById("avatar").files[0];
    		formData.append("avatar",file);
    		xhr.send(formData);
    	});
    	</script>
  </body>
</html>
```

