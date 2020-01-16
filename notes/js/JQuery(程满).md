# JQuery

### 第一章 JQuery教程

##### 1.1 JQuery教程

jQuery 是一个 JavaScript 库。

jQuery 极大地简化了 JavaScript 编程。

jQuery 很容易学习。

JQuery实列：

```HTML
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"> 
<title>菜鸟教程(runoob.com)</title> 
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
</script>
<script>
$(document).ready(function(){
  $("p").click(function(){
    $(this).hide();
  });
});
</script>
</head>
<body>
<p>如果你点我，我就会消失。</p>
<p>继续点我!</p>
<p>接着点我!</p>
</body>
</html>
```

##### 1.2  JQuery简介

###### 1.2.1什么是JQuery

jQuery是一个JavaScript函数库。

jQuery是一个轻量级的"写的少，做的多"的JavaScript库。

jQuery库包含以下功能：

- HTML 元素选取
- HTML 元素操作
- CSS 操作
- HTML 事件函数
- JavaScript 特效和动画
- HTML DOM 遍历和修改
- AJAX
- Utilities

**提示：** 除此之外，Jquery还提供了大量的插件。

###### 1.2.2 为什么使用JQuery

目前网络上有大量开源的 JS 框架, 但是 jQuery 是目前最流行的 JS 框架，而且提供了大量的扩展。

很多大公司都在使用 jQuery， 例如:

- Google
- Microsoft
- IBM
- Netflix



##### 1.3  JQuery语法

通过 jQuery，您可以选取（查询，query） HTML 元素，并对它们执行"操作"（actions）。



jQuery 语法是通过选取 HTML 元素，并对选取的元素执行某些操作。

基础语法： **$(\*selector\*).\*action\*()**

- 美元符号定义 jQuery
- 选择符（selector）"查询"和"查找" HTML 元素
- jQuery 的 action() 执行对元素的操作

实例:

- $(this).hide() - 隐藏当前元素
- $("p").hide() - 隐藏所有 <p> 元素
- $("p.test").hide() - 隐藏所有 class="test" 的 <p> 元素
- $("#test").hide() - 隐藏所有 id="test" 的元素

###### 1.3.1  文档就绪事件

```js
$(document).ready(function(){
 
   // 开始写 jQuery 代码...
 
});
```

这是为了防止文档在完全加载（就绪）之前运行 jQuery 代码，即在 DOM 加载完成后才可以对 DOM 进行操作。

如果在文档没有完全加载之前就运行函数，操作可能失败。下面是两个具体的例子：

- 试图隐藏一个不存在的元素
- 获得未完全加载的图像的大小

**提示：**简洁写法（与以上写法效果相同）

```javascript
$(function(){
 
   // 开始写 jQuery 代码...
 
});
```

jQuery 入口函数与 JavaScript 入口函数的区别：

-  jQuery 的入口函数是在 html 所有标签(DOM)都加载之后，就会去执行。
-  JavaScript 的 window.onload 事件是等到所有内容，包括外部图片之类的文件加载完后，才会执行。

![img](https://www.runoob.com/wp-content/uploads/2019/05/20171231003829544.jpeg)

##### 1.4 JQuery选择器

###### 1.4.1 元素选择器

jQuery 元素选择器基于元素名选取元素。

```
$("p")
```

###### 1.4.2 #id 选择器

jQuery #id 选择器通过 HTML 元素的 id 属性选取指定的元素。

页面中元素的 id 应该是唯一的，所以您要在页面中选取唯一的元素需要通过 #id 选择器。

```
$("#test")
```

###### 1.4.3 .class选择器

jQuery 类选择器可以通过指定的 class 查找元素。

语法如下：

$(".test")

##### 1.5 jQuery事件

页面对不同访问者的响应叫做事件。

事件处理程序指的是当 HTML 中发生某些事件时所调用的方法。

实例：

- 在元素上移动鼠标。
- 选取单选按钮
- 点击元素

在事件中经常使用术语"触发"（或"激发"）例如： "当您按下按键时触发 keypress 事件"。

常见 DOM 事件：

| 鼠标事件                                                     | 键盘事件                                                     | 表单事件                                                  | 文档/窗口事件                                             |
| :----------------------------------------------------------- | :----------------------------------------------------------- | :-------------------------------------------------------- | :-------------------------------------------------------- |
| [click](https://www.runoob.com/jquery/event-click.html)      | [keypress](https://www.runoob.com/jquery/event-keypress.html) | [submit](https://www.runoob.com/jquery/event-submit.html) | [load](https://www.runoob.com/jquery/event-load.html)     |
| [dblclick](https://www.runoob.com/jquery/event-dblclick.html) | [keydown](https://www.runoob.com/jquery/event-keydown.html)  | [change](https://www.runoob.com/jquery/event-change.html) | [resize](https://www.runoob.com/jquery/event-resize.html) |
| [mouseenter](https://www.runoob.com/jquery/event-mouseenter.html) | [keyup](https://www.runoob.com/jquery/event-keyup.html)      | [focus](https://www.runoob.com/jquery/event-focus.html)   | [scroll](https://www.runoob.com/jquery/event-scroll.html) |
| [mouseleave](https://www.runoob.com/jquery/event-mouseleave.html) |                                                              | [blur](https://www.runoob.com/jquery/event-blur.html)     | [unload](https://www.runoob.com/jquery/event-unload.html) |
| [hover](https://www.runoob.com/jquery/event-hover.html)      |                                                              |                                                           |                                                           |

###### 1.5.1 事件方法语法

在 jQuery 中，大多数 DOM 事件都有一个等效的 jQuery 方法。

页面中指定一个点击事件：

$("p").click();

下一步是定义什么时间触发事件。您可以通过一个事件函数实现：

$("p").click(function(){    // 动作触发后执行的代码!! });

###### 1.5.2 常用的 jQuery 事件方法

$(document).ready()

$(document).ready() 方法允许我们在文档完全加载完后执行函数。该事件方法在 [jQuery 语法](https://www.runoob.com/jquery/jquery-syntax.html) 章节中已经提到过。

click()

click() 方法是当按钮点击事件被触发时会调用一个函数。

该函数在用户点击 HTML 元素时执行。

dblclick()

当双击元素时，会发生 dblclick 事件。

mouseenter()

当鼠标指针穿过元素时，会发生 mouseenter 事件。

mouseleave()

当鼠标指针离开元素时，会发生 mouseleave 事件。

mousedown()

当鼠标指针移动到元素上方，并按下鼠标按键时，会发生 mousedown 事件。

mouseup()

当在元素上松开鼠标按钮时，会发生 mouseup 事件。

hover()

hover()方法用于模拟光标悬停事件。

focus()

当元素获得焦点时，发生 focus 事件。

当通过鼠标点击选中元素或通过 tab 键定位到元素时，该元素就会获得焦点。

blur()

当元素失去焦点时，发生 blur 事件。

**一.keypress,keydown,keyup的区别:**

-  1.keydown：在键盘上按下某键时发生,一直按着则会不断触发（opera浏览器除外）, 它返回的是键盘代码;
-  2.keypress：在键盘上按下一个按键，并产生一个字符时发生, 返回ASCII码。注意: **shift、alt、ctrl**等键按下并不会产生字符，所以监听无效 ,换句话说, 只有按下能在屏幕上输出字符的按键时keypress事件才会触发。若一直按着某按键则会不断触发。
-  3.keyup：用户松开某一个按键时触发, 与keydown相对, 返回键盘代码

### 第二章 jQuery效果

##### 2.1 jQuery隐藏显示

###### 2.1.1 jQuery hide() 和 show()

```javascript
$("#hide").click(function(){
  $("p").hide();
});
 
$("#show").click(function(){
  $("p").show();
});
```

**语法:**

$(*selector*).hide(*speed,callback*);

$(*selector*).show(*speed,callback*);

可选的 speed 参数规定隐藏/显示的速度，可以取以下值："slow"、"fast" 或毫秒。

可选的 callback 参数是隐藏或显示完成后所执行的函数名称。

```javascript
$("button").click(function(){
  $("p").hide(1000);
});
```

###### 2.1.2 jQuery toggle()

通过 jQuery，您可以使用 toggle() 方法来切换 hide() 和 show() 方法。

显示被隐藏的元素，并隐藏已显示的元素：

```
$("button").click(function(){
  $("p").toggle();
});

语法:
$(selector).toggle(speed,callback);
可选的 speed 参数规定隐藏/显示的速度，可以取以下值："slow"、"fast" 或毫秒。

可选的 callback 参数是隐藏或显示完成后所执行的函数名称。
```

##### 2.2 JQuery淡入淡出

###### 2.2.1 jQuery Fading 方法

通过 jQuery，您可以实现元素的淡入淡出效果。

jQuery 拥有下面四种 fade 方法：

- fadeIn()
- fadeOut()
- fadeToggle()
- fadeTo()

###### 2.2.2 jQuery fadeIn() 方法

jQuery fadeIn() 用于淡入已隐藏的元素。

**语法:**

$(*selector*).fadeIn(*speed,callback*);

可选的 speed 参数规定效果的时长。它可以取以下值："slow"、"fast" 或毫秒。.

可选的 callback 参数是 fading 完成后所执行的函数名称。

```JavaScript
$("button").click(function(){
  $("#div1").fadeIn();
  $("#div2").fadeIn("slow");
  $("#div3").fadeIn(3000);
});
```

###### 2.2.3 jQuery fadeOut() 方法

jQuery fadeOut() 方法用于淡出可见元素。

**语法:**

$(*selector*).fadeOut(*speed,callback*);

可选的 speed 参数规定效果的时长。它可以取以下值："slow"、"fast" 或毫秒。

可选的 callback 参数是 fading 完成后所执行的函数名称。

```JavaScript
$("button").click(function(){
  $("#div1").fadeOut();
  $("#div2").fadeOut("slow");
  $("#div3").fadeOut(3000);
});
```

###### 2.2.4jQuery fadeToggle() 方法

jQuery fadeToggle() 方法可以在 fadeIn() 与 fadeOut() 方法之间进行切换。

如果元素已淡出，则 fadeToggle() 会向元素添加淡入效果。

如果元素已淡入，则 fadeToggle() 会向元素添加淡出效果。

**语法:**

$(*selector*).fadeToggle(*speed,callback*);

可选的 speed 参数规定效果的时长。它可以取以下值："slow"、"fast" 或毫秒。

可选的 callback 参数是 fading 完成后所执行的函数名称。

```javascript
$("button").click(function(){
  $("#div1").fadeToggle();
  $("#div2").fadeToggle("slow");
  $("#div3").fadeToggle(3000);
});
```

###### 2.2.5 jQuery fadeTo() 方法

jQuery fadeTo() 方法允许渐变为给定的不透明度（值介于 0 与 1 之间）。

**语法:**

$(*selector*).fadeTo(*speed,opacity,callback*);

必需的 speed 参数规定效果的时长。它可以取以下值："slow"、"fast" 或毫秒。

fadeTo() 方法中必需的 opacity 参数将淡入淡出效果设置为给定的不透明度（值介于 0 与 1 之间）。

可选的 callback 参数是该函数完成后所执行的函数名称。

```javascript
$("button").click(function(){
  $("#div1").fadeTo("slow",0.15);
  $("#div2").fadeTo("slow",0.4);
  $("#div3").fadeTo("slow",0.7);
});
```

##### 2.3 JQuery 滑动

###### 2.3.1 滑动方法

通过 jQuery，您可以在元素上创建滑动效果。

jQuery 拥有以下滑动方法：

- slideDown()
- slideUp()
- slideToggle()

###### 2.3.2 jQuery slideDown() 方法

jQuery slideDown() 方法用于向下滑动元素。

**语法:**

$(*selector*).slideDown(*speed,callback*);

可选的 speed 参数规定效果的时长。它可以取以下值："slow"、"fast" 或毫秒。

可选的 callback 参数是滑动完成后所执行的函数名称。

下面的例子演示了 slideDown() 方法：

```javascript
$("#flip").click(function(){
  $("#panel").slideDown();
});
```

###### 2.3.3 jQuery slideUp() 方法

jQuery slideUp() 方法用于向上滑动元素。

**语法:**

$(*selector*).slideUp(*speed,callback*);

可选的 speed 参数规定效果的时长。它可以取以下值："slow"、"fast" 或毫秒。

可选的 callback 参数是滑动完成后所执行的函数名称。

下面的例子演示了 slideUp() 方法：

```javascript
$("#flip").click(function(){
  $("#panel").slideUp();
});
```

###### 2.3.4 jQuery slideToggle() 方法

jQuery slideToggle() 方法可以在 slideDown() 与 slideUp() 方法之间进行切换。

如果元素向下滑动，则 slideToggle() 可向上滑动它们。

如果元素向上滑动，则 slideToggle() 可向下滑动它们。

$(*selector*).slideToggle(*speed,callback*);

可选的 speed 参数规定效果的时长。它可以取以下值："slow"、"fast" 或毫秒。

可选的 callback 参数是滑动完成后所执行的函数名称。

下面的例子演示了 slideToggle() 方法：

```javascript
$("#flip").click(function(){
  $("#panel").slideToggle();
});
```

##### 2.4 Jquery动画

###### 2.4.1 jQuery 动画 - animate() 方法

jQuery animate() 方法用于创建自定义动画。

**语法：**

$(*selector*).animate({*params*}*,speed,callback*);

必需的 params 参数定义形成动画的 CSS 属性。

可选的 speed 参数规定效果的时长。它可以取以下值："slow"、"fast" 或毫秒。

可选的 callback 参数是动画完成后所执行的函数名称。

下面的例子演示 animate() 方法的简单应用。它把 <div> 元素往右边移动了 250 像素：

```javascript
$("button").click(function(){
  $("div").animate({left:'250px'});
});
```

###### 2.4.2 jQuery animate() - 操作多个属性

请注意，生成动画的过程中可同时使用多个属性：

```javascript
$("button").click(function(){
  $("div").animate({
    left:'250px',
    opacity:'0.5',
    height:'150px',
    width:'150px'
  });
});
```

##### 2.5 JQuery停止动画

###### jQuery stop() 方法

jQuery stop() 方法用于停止动画或效果，在它们完成之前。

stop() 方法适用于所有 jQuery 效果函数，包括滑动、淡入淡出和自定义动画。

**语法:**

$(*selector*).stop(*stopAll,goToEnd*);

可选的 stopAll 参数规定是否应该清除动画队列。默认是 false，即仅停止活动的动画，允许任何排入队列的动画向后执行。

可选的 goToEnd 参数规定是否立即完成当前动画。默认是 false。

因此，默认地，stop() 会清除在被选元素上指定的当前动画。

下面的例子演示 stop() 方法，不带参数：

```javascript
$("#stop").click(function(){
  $("#panel").stop();
});
```

### 第三章 JQuery HTML

##### 3.1 JQuery 捕获

###### 3.1.1 获得内容 - text()、html() 以及 val()

三个简单实用的用于 DOM 操作的 jQuery 方法：

- text() - 设置或返回所选元素的文本内容
- html() - 设置或返回所选元素的内容（包括 HTML 标记）
- val() - 设置或返回表单字段的值

下面的例子演示如何通过 jQuery text() 和 html() 方法来获得内容：

```javascript
$("#btn1").click(function(){
  alert("Text: " + $("#test").text());
});
$("#btn2").click(function(){
  alert("HTML: " + $("#test").html());
});

$("#btn1").click(function(){
  alert("值为: " + $("#test").val());
});
```

###### 3.1.2 获取属性 - attr()

jQuery attr() 方法用于获取属性值。

下面的例子演示如何获得链接中 href 属性的值：

```javascript
$("button").click(function(){
  alert($("#runoob").attr("href"));
});
```

##### 3.2 Jquery设置

###### 3.2.1 设置内容 - text()、html() 以及 val()

我们将使用前一章中的三个相同的方法来设置内容：

- text() - 设置或返回所选元素的文本内容
- html() - 设置或返回所选元素的内容（包括 HTML 标记）
- val() - 设置或返回表单字段的值

下面的例子演示如何通过 text()、html() 以及 val() 方法来设置内容：

```javascript
$("#btn1").click(function(){
    $("#test1").text("Hello world!");
});
$("#btn2").click(function(){
    $("#test2").html("<b>Hello world!</b>");
});
$("#btn3").click(function(){
    $("#test3").val("RUNOOB");
});
```

###### 3.2.2 text()、html() 以及 val() 的回调函数

上面的三个 jQuery 方法：text()、html() 以及 val()，同样拥有回调函数。回调函数有两个参数：被选元素列表中当前元素的下标，以及原始（旧的）值。然后以函数新值返回您希望使用的字符串。

下面的例子演示带有回调函数的 text() 和 html()：

```javascript
$("#btn1").click(function(){
    $("#test1").text(function(i,origText){
        return "旧文本: " + origText + " 新文本: Hello world! (index: " + i + ")"; 
    });
});
 
$("#btn2").click(function(){
    $("#test2").html(function(i,origText){
        return "旧 html: " + origText + " 新 html: Hello <b>world!</b> (index: " + i + ")"; 
    });
});
```

3.2.3 设置属性 - attr()

jQuery attr() 方法也用于设置/改变属性值。

下面的例子演示如何改变（设置）链接中 href 属性的值：

```javascript
$("button").click(function(){
  $("#runoob").attr("href","http://www.runoob.com/jquery");
});
```

##### 3.3 添加元素

###### 3.3.1 添加新的 HTML 内容

我们将学习用于添加新内容的四个 jQuery 方法：

- append() - 在被选元素的结尾插入内容
- prepend() - 在被选元素的开头插入内容
- after() - 在被选元素之后插入内容
- before() - 在被选元素之前插入内容

3.3.2 jQuery append() 方法

jQuery append() 方法在被选元素的结尾插入内容（仍然该元素的内部）。

$("p").append("追加文本");

------

###### 3.3.3jQuery prepend() 方法

jQuery prepend() 方法在被选元素的开头插入内容。

$("p").prepend("在开头追加文本");

------

###### 3.3.4通过 append() 和 prepend() 方法添加若干新元素

在上面的例子中，我们只在被选元素的开头/结尾插入文本/HTML。

不过，append() 和 prepend() 方法能够通过参数接收无限数量的新元素。可以通过 jQuery 来生成文本/HTML（就像上面的例子那样），或者通过 JavaScript 代码和 DOM 元素。

在下面的例子中，我们创建若干个新元素。这些元素可以通过 text/HTML、jQuery 或者 JavaScript/DOM 来创建。然后我们通过 append() 方法把这些新元素追加到文本中（对 prepend() 同样有效）：

function appendText() {    var txt1="<p>文本。</p>";              // 使用 HTML 标签创建文本    var txt2=$("<p></p>").text("文本。");  // 使用 jQuery 创建文本    var txt3=document.createElement("p");    txt3.innerHTML="文本。";               // 使用 DOM 创建文本 text with DOM    $("body").append(txt1,txt2,txt3);        // 追加新元素 }

------

###### 3.3.5jQuery after() 和 before() 方法

jQuery after() 方法在被选元素之后插入内容。

jQuery before() 方法在被选元素之前插入内容。

$("img").after("在后面添加文本");  $("img").before("在前面添加文本");

------

###### 3.3.6通过 after() 和 before() 方法添加若干新元素

after() 和 before() 方法能够通过参数接收无限数量的新元素。可以通过 text/HTML、jQuery 或者 JavaScript/DOM 来创建新元素。

在下面的例子中，我们创建若干新元素。这些元素可以通过 text/HTML、jQuery 或者 JavaScript/DOM 来创建。然后我们通过 after() 方法把这些新元素插到文本中（对 before() 同样有效）：

function afterText() {    var txt1="<b>I </b>";                    // 使用 HTML 创建元素    var txt2=$("<i></i>").text("love ");     // 使用 jQuery 创建元素    var txt3=document.createElement("big");  // 使用 DOM 创建元素    txt3.innerHTML="jQuery!";    $("img").after(txt1,txt2,txt3);          // 在图片后添加文本 }

##### 3.4 删除元素

###### 3.4.1 jQuery remove() 方法

jQuery remove() 方法删除被选元素及其子元素。

$("#div1").remove();

###### 3.4.2 jQuery empty() 方法

jQuery empty() 方法删除被选元素的子元素。

$("#div1").empty();

------

###### 3.4.3 过滤被删除的元素

jQuery remove() 方法也可接受一个参数，允许您对被删元素进行过滤。

该参数可以是任何 jQuery 选择器的语法。

下面的例子删除 class="italic" 的所有 <p> 元素：

$("p").remove(".italic");

##### 3.5 CSS类

###### 3.5.1 jQuery addClass() 方法

下面的例子展示如何向不同的元素添加 class 属性。当然，在添加类时，您也可以选取多个元素：

$("button").click(function(){  $("h1,h2,p").addClass("blue");  $("div").addClass("important"); });

您也可以在 addClass() 方法中规定多个类：

$("button").click(function(){  $("body div:first").addClass("important blue"); });

------

###### 3.5.2 jQuery removeClass() 方法

下面的例子演示如何在不同的元素中删除指定的 class 属性：

$("button").click(function(){  $("h1,h2,p").removeClass("blue"); });

------

###### 3.5.3 jQuery toggleClass() 方法

下面的例子将展示如何使用 jQuery toggleClass() 方法。该方法对被选元素进行添加/删除类的切换操作：

$("button").click(function(){  $("h1,h2,p").toggleClass("blue"); });

##### 3.6 CSS方法

###### 3.6.1 返回 CSS 属性

如需返回指定的 CSS 属性的值，请使用如下语法：

css("*propertyname*");

下面的例子将返回首个匹配元素的 background-color 值：

$("p").css("background-color");

------

###### 3.6.2 设置 CSS 属性

如需设置指定的 CSS 属性，请使用如下语法：

css("*propertyname*","*value*");

下面的例子将为所有匹配元素设置 background-color 值：

$("p").css("background-color","yellow");

------

###### 3.6.3 设置多个 CSS 属性

如需设置多个 CSS 属性，请使用如下语法：

css({"*propertyname*":"*value*","*propertyname*":"*value*",...});

下面的例子将为所有匹配元素设置 background-color 和 font-size：

$("p").css({"background-color":"yellow","font-size":"200%"});

### 第四章 JQuery遍历

##### 4.1 JQuery遍历

###### 4.1.1 什么是遍历？

jQuery 遍历，意为"移动"，用于根据其相对于其他元素的关系来"查找"（或选取）HTML 元素。以某项选择开始，并沿着这个选择移动，直到抵达您期望的元素为止。

下图展示了一个家族树。通过 jQuery 遍历，您能够从被选（当前的）元素开始，轻松地在家族树中向上移动（祖先），向下移动（子孙），水平移动（同胞）。这种移动被称为对 DOM 进行遍历。

![jQuery Dimensions](https://www.runoob.com/images/img_travtree.png)

图示解析：

- <div> 元素是 <ul> 的父元素，同时是其中所有内容的祖先。
- <ul> 元素是 <li> 元素的父元素，同时是 <div> 的子元素
- 左边的 <li> 元素是 <span> 的父元素，<ul> 的子元素，同时是 <div> 的后代。
- <span> 元素是 <li> 的子元素，同时是 <ul> 和 <div> 的后代。
- 两个 <li> 元素是同胞（拥有相同的父元素）。
- 右边的 <li> 元素是 <b> 的父元素，<ul> 的子元素，同时是 <div> 的后代。
- <b> 元素是右边的 <li> 的子元素，同时是 <ul> 和 <div> 的后代。



| ![lamp](https://www.runoob.com/images/lamp.jpg) | 祖先是父、祖父、曾祖父等等。后代是子、孙、曾孙等等。同胞拥有相同的父。 |
| ----------------------------------------------- | ------------------------------------------------------------ |
|                                                 |                                                              |

------

###### 4.1.2 遍历 DOM

jQuery 提供了多种遍历 DOM 的方法。

遍历方法中最大的种类是树遍历（tree-traversal）。

##### 4.2 Jquery祖先

###### 4.2.1 jQuery parent() 方法

parent() 方法返回被选元素的直接父元素。

该方法只会向上一级对 DOM 树进行遍历。

下面的例子返回每个 <span> 元素的的直接父元素：

$(document).ready(function(){  $("span").parent(); });

------

###### 4.2.2jQuery parents() 方法

parents() 方法返回被选元素的所有祖先元素，它一路向上直到文档的根元素 (<html>)。

下面的例子返回所有 <span> 元素的所有祖先：

$(document).ready(function(){  $("span").parents(); });

您也可以使用可选参数来过滤对祖先元素的搜索。

下面的例子返回所有 <span> 元素的所有祖先，并且它是 <ul> 元素：

$(document).ready(function(){  $("span").parents("ul"); });

------

###### 4.2.3 jQuery parentsUntil() 方法

parentsUntil() 方法返回介于两个给定元素之间的所有祖先元素。

下面的例子返回介于 <span> 与 <div> 元素之间的所有祖先元素：

$(document).ready(function(){  $("span").parentsUntil("div"); });

##### 4.3 JQuery后代

###### 4.3.1 jQuery children() 方法

children() 方法返回被选元素的所有直接子元素。

该方法只会向下一级对 DOM 树进行遍历。

下面的例子返回每个 <div> 元素的所有直接子元素：

$(document).ready(function(){  $("div").children(); });

您也可以使用可选参数来过滤对子元素的搜索。

下面的例子返回类名为 "1" 的所有 <p> 元素，并且它们是 <div> 的直接子元素：

$(document).ready(function(){  $("div").children("p.1"); });

------

###### 4.3.2 jQuery find() 方法

find() 方法返回被选元素的后代元素，一路向下直到最后一个后代。

下面的例子返回属于 <div> 后代的所有 <span> 元素：

$(document).ready(function(){  $("div").find("span"); });

下面的例子返回 <div> 的所有后代：

$(document).ready(function(){  $("div").find("*"); });

##### 4.4 JQuery同胞

###### 4.4.1 jQuery siblings() 方法

siblings() 方法返回被选元素的所有同胞元素。

下面的例子返回 <h2> 的所有同胞元素：

$(document).ready(function(){  $("h2").siblings(); });

您也可以使用可选参数来过滤对同胞元素的搜索。

下面的例子返回属于 <h2> 的同胞元素的所有 <p> 元素：

$(document).ready(function(){  $("h2").siblings("p"); });

------

###### 4.4.2 jQuery next() 方法

next() 方法返回被选元素的下一个同胞元素。

该方法只返回一个元素。

下面的例子返回 <h2> 的下一个同胞元素：

$(document).ready(function(){  $("h2").next(); });

------

###### 4.4.3 jQuery nextAll() 方法

nextAll() 方法返回被选元素的所有跟随的同胞元素。

下面的例子返回 <h2> 的所有跟随的同胞元素：

$(document).ready(function(){  $("h2").nextAll(); });

------

###### 4.4.4 jQuery nextUntil() 方法

nextUntil() 方法返回介于两个给定参数之间的所有跟随的同胞元素。

下面的例子返回介于 <h2> 与 <h6> 元素之间的所有同胞元素：

$(document).ready(function(){  $("h2").nextUntil("h6"); });

------

###### 4.4.5 jQuery prev(), prevAll() & prevUntil() 方法

prev(), prevAll() 以及 prevUntil() 方法的工作方式与上面的方法类似，只不过方向相反而已：它们返回的是前面的同胞元素（在 DOM 树中沿着同胞之前元素遍历，而不是之后元素遍历）。

### 第五章 JQuery过滤

##### 5.1 jQuery - AJAX 简介

###### 5.1.1 什么是 AJAX？

AJAX = 异步 JavaScript 和 XML（Asynchronous JavaScript and XML）。

简短地说，在不重载整个网页的情况下，AJAX 通过后台加载数据，并在网页上进行显示。

------

##### 5.2 jQuery - AJAX load() 方法

###### 5.2.1 jQuery load() 方法

jQuery load() 方法是简单但强大的 AJAX 方法。

load() 方法从服务器加载数据，并把返回的数据放入被选元素中。

**语法:**

$(selector).load(URL,data,callback);

必需的 *URL* 参数规定您希望加载的 URL。

可选的 *data* 参数规定与请求一同发送的查询字符串键/值对集合。

可选的 *callback* 参数是 load() 方法完成后所执行的函数名称。

**这是示例文件（"demo_test.txt"）的内容：**

<h2>jQuery AJAX 是个非常棒的功能！</h2> <p id="p1">这是段落的一些文本。</p>

下面的例子会把文件 "demo_test.txt" 的内容加载到指定的 <div> 元素中：

$("#div1").load("demo_test.txt");

也可以把 jQuery 选择器添加到 URL 参数。

下面的例子把 "demo_test.txt" 文件中 id="p1" 的元素的内容，加载到指定的 <div> 元素中：

$("#div1").load("demo_test.txt #p1");

可选的 callback 参数规定当 load() 方法完成后所要允许的回调函数。回调函数可以设置不同的参数：

- *responseTxt* - 包含调用成功时的结果内容
- *statusTXT* - 包含调用的状态
- *xhr* - 包含 XMLHttpRequest 对象

下面的例子会在 load() 方法完成后显示一个提示框。如果 load() 方法已成功，则显示"外部内容加载成功！"，而如果失败，则显示错误消息：

$("button").click(function(){  $("#div1").load("demo_test.txt",function(responseTxt,statusTxt,xhr){    if(statusTxt=="success")      alert("外部内容加载成功!");    if(statusTxt=="error")      alert("Error: "+xhr.status+": "+xhr.statusText);  }); });

##### 5.3  jQuery - AJAX get() 和 post() 方法

###### 5.3.1 HTTP 请求：GET vs. POST

两种在客户端和服务器端进行请求-响应的常用方法是：GET 和 POST。

- *GET* - 从指定的资源请求数据
- *POST* - 向指定的资源提交要处理的数据

GET 基本上用于从服务器获得（取回）数据。注释：GET 方法可能返回缓存数据。

POST 也可用于从服务器获取数据。不过，POST 方法不会缓存数据，并且常用于连同请求一起发送数据。

如需学习更多有关 GET 和 POST 以及两方法差异的知识，请阅读我们的 [HTTP 方法 - GET 对比 POST](https://www.runoob.com/tags/html-httpmethods.html)。

------

###### 5.3.2 jQuery $.get() 方法

$.get() 方法通过 HTTP GET 请求从服务器上请求数据。

### 语法：

$.get(*URL*,*callback*);

必需的 *URL* 参数规定您希望请求的 URL。

可选的 *callback* 参数是请求成功后所执行的函数名。

下面的例子使用 $.get() 方法从服务器上的一个文件中取回数据：

$("button").click(function(){  $.get("demo_test.php",function(data,status){    alert("数据: " + data + "\n状态: " + status);  }); });

$.get() 的第一个参数是我们希望请求的 URL（"demo_test.php"）。

第二个参数是回调函数。第一个回调参数存有被请求页面的内容，第二个回调参数存有请求的状态。

------

###### 5.3.3 jQuery $.post() 方法

$.post() 方法通过 HTTP POST 请求向服务器提交数据。

**语法:**

$.post(*URL,data,callback*);

必需的 *URL* 参数规定您希望请求的 URL。

可选的 *data* 参数规定连同请求发送的数据。

可选的 *callback* 参数是请求成功后所执行的函数名。

下面的例子使用 $.post() 连同请求一起发送数据：

$("button").click(function(){    $.post("/try/ajax/demo_test_post.php",    {        name:"菜鸟教程",        url:"http://www.runoob.com"    },    function(data,status){        alert("数据: \n" + data + "\n状态: " + status);    }); });

$.post() 的第一个参数是我们希望请求的 URL ("demo_test_post.php")。

然后我们连同请求（name 和 url）一起发送数据。

"demo_test_post.php" 中的 PHP 脚本读取这些参数，对它们进行处理，然后返回结果。

第三个参数是回调函数。第一个回调参数存有被请求页面的内容，而第二个参数存有请求的状态。