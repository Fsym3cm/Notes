### CSS

### 1. CSS概述



##### 1.1功能

> 为html元素定义样式，并将之应用于任意多的页面中。



##### 1.2 使用方式

```html
/*外部样式表: */
 <link rel="stylesheet" type="text/css" href="xxx.css">
/*内部样式表: */
body{
color:blue
}
/*内联方式: */
<tr style="display:none"></tr>

```

### 2. 基本选择器

> 1. 内联样式优先级1000
> 2. id选择器优先级100
> 3. 类和伪类优先级10
> 4. 元素选择器优先级1
> 5. 通配符优先级0
> 6. 继承的样式没有优先级



##### 2.1 基本选择器

> - 标签选择器：针对一类标签
> - ID选择器：针对某一个特定的标签使用
> - 类选择器：针对你想要的所有标签使用
> - 通用选择器（通配符）：针对所有的标签都适用（不建议使用）



##### 2.1.1 标签选择器：选择器的名字代表html页面上的标签

```html
<head>
    <meta charset="UTF-8">
    <title>Title</title>
<style type="text/css">      
        span{
            color: red;
        }
    </style>
</head>
<body>
    <p>学完了安卓，继续学<span>前端</span>哟</p>
</body>

```

> 【注意】
>
> （1）所有的标签，都可以是选择器。比如ul、li、label、dt、dl、input、div等。
>
> （2）无论这个标签藏的多深，一定能够被选择上。
>
> （3）选择的所有，而不是一个。



##### 2.1.2 ID选择器：规定用`#`来定义（名字自定义）

> id选择器的选择符是“#”。
>
> 任何的HTML标签都可以有id属性。表示这个标签的名字。这个标签的名字，可以任取，但是：
>
> （1）只能有字母、数字、下划线。
> （2）必须以字母开头。
> （3）不能和标签同名。比如id不能叫做body、img、a。
> （4）大小写严格区分，也就是说aa,和AA是两个不同的ID.

```html
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style type="text/css">
        #mytitle
        {
            border:3px dashed green;
        }
    </style>
</head>
<body>
<h1 id="mytitle">你好</h1>
</body>
```

> 一个标签可以被多个css选择器选择 。



##### 2.1.3 类选择器：规定用圆点`.`来定义

> 特性1：类选择器可以被多种标签使用.特性2：同一个标签可以使用多个类选择器 用空格隔开

```html
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style type="text/css">
        .oneclass/*定义类选择器*/{
            width:800px;
        }
    </style>
</head>
<body>
<h1 id="mytitle">你好</h1>
<h2 class="oneclass">你好</h2>
<h3 class="classone  classtwo">我是一个h3啊</h3>
</body>
```

> 问题：到底用id还是用class？
>
> 答案：尽可能的用class，除非极特殊的情况可以用id。
>
> 原因：id是js用的。也就是说，js要通过id属性得到标签，所以css层面尽量不用id，要不然js就很别扭。另一层面，我们会认为一个有id的元素，有动态效果。



##### 2.1.4 通配符`*`

> 匹配任何标签（引出属性选择器*[title（="..."）]{...}，匹配所有带有title标签的，a[href
> （="..."）][title（="..."）]{color:red}将同时有 href（="..."）和 title（="..."）属性的 HTML 超链接的文本设置为红色等）



##### 2.2 高级选择器

> 高级选择器：
>
> - 后代选择器：用空格隔开
> - 交集选择器：用`.`隔开
> - 并集选择器（分组选择器）：用逗号隔开
> - 伪类选择器



##### 2.2.1 后代选择器

```html
<style type="text/css">
        .div1 p{
            color:red;
        }
    </style>
/*空格就表示后代 .div1 p 表示.div1的后代所有的p。这两个标签不一定是连续紧挨着的，只要保持一个后代的关联即可。也就是说，选择的是后代，不一定是儿子*/
<style type="text/css">
        h3 b i{
            color:red ; 
        }
</style>
/*定义了<h3>标签中的<b>标签中的<i>标签的样式。*/
```



### 3. 属性选择器

> 1.[attribute]:匹配具有attribute属性的元素
>
> 如：div[id]:匹配所有具备id属性的div
>
> 2.element[attr1][attr2] 匹配所有具备attr1属性以及attr2属性的element元素
>
> 如：div[id][class] 匹配同时具备id和class属性的div
>
> 3.element[attr=value] 匹配attr属性值为value的element元素
>
> 如：input[type=text] 或 input[type='text']，匹配type为text的input元素
>
> 4.element[attr~=value] 匹配attr属性值为一个值列表，并在此列表中包含单词value的element元素
>
> 如：  <div class="content warning important lf"></div>  
>
> div[class~=content]:   能匹配
> div[class~=lf]:              能匹配
> div[class~=on]:           不能匹配
>
> 5.element[attr^=value] 匹配attr属性值，以value开始的element元素
>
> 如：div[class^=my]: 匹配class属性值以my开始的div元素
>
> 6.element[attr$=value] 匹配attr属性值，以value作为结束的element元素
>
> 如：div[class$=over]: 匹配class属性值以over作为结束的div元素
>
> 7.element[attr*=value] 匹配attr属性值中【包含】value的element元素
>
> 如：div[class*=on] 匹配class属性值中包含on的div元素



### 4. 伪类选择器（1）



##### 4.1动态伪类

```html
.demo a:link {color:gray;}/*链接没有被访问时前景色为灰色*/
.demo a:visited{color:yellow;}/*链接被访问过后前景色为黄色*/
.demo a:hover{color:green;}/*鼠标悬浮在链接上时前景色为绿色*/
.demo a:active{color:blue;}/*鼠标点中激活链接那一下前景色为蓝色*/

```

> - **:hover**用于当用户把鼠标移动到元素上面时的效果；
> - **:active**用于用户点击元素那一下的效果（正发生在点的那一下，松开鼠标左键此动作也就完成了）
> - **:focus**用于元素成为焦点，这个经常用在表单元素上。



##### 4.2 状态伪类

> 1. :enabled 可用的元素
> 2. :disabled   *不可用的元素* 
> 3. :checked  *选择的元素* 



##### 4.3 否定选择器

> ：empty 选择的元素里面没有任何内容
>
> ：not 选择不匹配该选择器的元素



### 5. 伪类选择器（2）

> 结构伪类：从标记的层次结构来匹配元素
>
> 1. :first-child   匹配属于父元素中的首个子元素
> 2. :last-child   匹配属于其父元素中的最后一个子元素
> 3. :nth-child(n)   匹配属于其父元素中的第n个子元素
> 4. :nth-last-child   匹配某个元素的一个或多个特定的子元素，从这个元素的最后一个子元素开始算
> 5. :nth-of-type()     选择指定的元素
> 6. :nth-last-of-type()     选择指定的元素，从最后一个开始算
> 7. :first-of-type   选择器匹配属于其父元素的特定类型的首个子元素的每个元素可以看作为 nth-of-type(1)
> 8. :last-of-type    选择器匹配属于其父元素的特定类型的最后一个子元素的每个元素可以看作为 nth-last-of-type(1)
> 9. :only-child    选择器匹配属于其父元素的唯一子元素的每个元素
> 10. :only-of-type   选择器匹配属于其父元素的特定类型的唯一子元素的每个元素

### 6. 伪元素选择器

##### 6.1 作用

> 向某些选择器设置特殊效果

##### 6.2 与伪类的区别

> 1.伪类针对特殊状态的元素
>
> 2.伪元素是对元素中的特殊内容进行操作



##### 6.3 伪元素详解

> ::first-line：选中元素的第一行
>
> ::first-letter：选中元素的第一个字母
>
> ::before和::after这两个主要用来给元素的前面或后面插入内容，通常和"content"一起配合使用，经常用来清除浮动
>
> ::selection： 对选择的元素应用样式

```html
.clearfix::before,.clearfix::after {
    content: ".";
    display: block;
    height: 0;
    visibility: hidden;
}
.clearfix::after {
    clear: both;
}
.clearfix {
    zoom: 1;
}
```



### 7. CSS单位

##### 7.1 尺寸

| ex   | 一个 ex 是一个字体的 x-height。 (x-height 通常是字体尺寸的一半。) |
| ---- | ------------------------------------------------------------ |
| em   | 1em 等于当前的字体尺寸。2em 等于当前字体尺寸的两倍。         |
| px   | 像素 (计算机屏幕上的一个点)                                  |
| %    | 百分比                                                       |



### 8. 颜色

```html
p{background-color:#0000ff;}
p{background-color:rgb(255,0,0);}
p
{background-color:rgba(255,0,0,0.5);}
p
{background-color:hsla(120,65%,75%,0.3);}
```

| 属性                                                         | 描述                                       |
| :----------------------------------------------------------- | :----------------------------------------- |
| color-profile                                                | 允许使用源的颜色配置文件的默认以外的规范   |
| [opacity](https://www.runoob.com/cssref/css3-pr-opacity.html) | 设置一个元素的透明度级别                   |
| rendering-intent                                             | 允许超过默认颜色配置文件渲染意向的其他规范 |

### 9. 样式继承

##### 9.1 定义

> 继承是指我们设置上级(父级)的CSS样式，上级（父级）及以下的子级（下级）都具有此属性。一般只有文字文本具有继承特性，如文字大小、文字加粗、文字颜色、字体等。但注意有一些css样式是不具有继承性的。 

```html
<p style="color:red;">如果你不知道自己<span>想做什么该做什么</span>，那你什么都做不好。</p>
/*(父级：p)文字颜色为红色，而子级(span)未设置文字颜色，但是文字具有继承特性，所以子级文字内容依然是红色。*/

```



### 10. 样式优先级



> 内联定义，即在对象的标记内使用对象的style属性定义适用的样式表属性
>
> 格式 :<div style="内容"><div>

> 链入内部
>
> CSS内链接是由<style></style>标记对放在<head></head>中，在<style>中有一个类型属性type，后面接test/css，表示CSS文本

```html
 <style type="text/css">
  /*这里写CSS内容*/
 </style>

```

> css外链接是把CSS文件放在网页外面，通过链接<link>使CSS文件对本网页的样式有效，就相当于C语言的.h文件喽。
>
> <link>里面的属性有type、rel、href，其中type固定为text/css，rel（即样式表）固定为stylesheet，href自然指的就是css文件的地址了，语法格式为：
>
> <link type="text/css" rel="stylesheet"  href="css文件的存放地址">

> 解决CSS冲突的优先级规则：
> ● CSS层叠样式表引入方法的优先级：内联式>内嵌式>链接式>导入式
> ● 在多个外部样式中，后出现的样式的优先级高于先出现的样式，也就是俗称的覆盖
> ● 在样式中，选择器的优先级：ID样式>class样式>标记样式（以权重比喻：id的权重为100，class的权重为10,标签名的权重为1）
> ● 在样式后面加一个!important，例如这样：.abc {background:#fff !improtant;} 这个样式的优先级就会默认提升到顶级，全局样式就无法影响到它了。
> 注意：!important要写在分号的前面
> 优先级：
> 就近原则（离代码越近，优先级越高）
> 选择范围越小，优先级越高。细化CSS，通过多加父元素的选择符一层层包住，缩小选择范围





### 11. 字体样式

| 属性        | 说明                         |
| ----------- | ---------------------------- |
| font        | 在一个声明中设置所有字体属性 |
| font-family | 规定文本的字体系列           |
| font-size   | 规定文本的字体尺寸           |
| font-style  | 规定文本的字体样式           |
| font-varian | 规定文本的字体样式           |
| font-weight | 规定字体的粗细               |

##### 11.1 font-family

- font - family：属性指定一个元素的字体。

**family-name** - 指定的系列名称：具体字体的名称，比如："times"、"courier"、"arial"。

**generic-family** - 通常字体系列名称：serif，sans-serif

```css
p{
font-family:"Times New Roman",Georgia,Serif;
} 
```

##### 11.2 font-size

- font-size： 属性用于设置字体大小。

##### 11.3 font-style

- font-style：属性指定文本的字体样式。

| 值      | 描述                                   |
| ------- | -------------------------------------- |
| normal  | 默认值。浏览器显示一个标准的字体样式。 |
| italic  | 浏览器会显示一个斜体的字体样式。       |
| oblique | 浏览器会显示一个倾斜的字体样式。       |
| inherit | 规定应该从父元素继承字体样式。         |

```css
p{font-style:oblique} 
```

##### 11.4 font-varian

- font-varian： 属性主要用于定义小型大写字母文本

```css
p{
font-variant:small-caps;
} 
```

##### 11.5 font-weight

- font-weight：属性设置文本的粗细

```css
p {font-weight:normal;}
```

| 值      | 描述                     |
| ------- | ------------------------ |
| normal  | 默认值。定义标准的字符。 |
| bold    | 定义粗体字符。           |
| bolder  | 定义更粗的字符。         |
| lighter | 定义更细的字符。         |

##### 11.6 Web字体

- 字体来自浏览器的下载

- 使用@font-face声明

- 实例：

​             @font-face{

​                  font-family:myfont;

​               src:url(font/CHILD.TTF)

​                                  }

### 12. 文本样式-1

##### 12.1 letter-spacing 和 word-spacing

- letter-spacing 属性增加或减少字符间的空白（字符间距）

| 值       | 描述                                           |
| -------- | ---------------------------------------------- |
| normal   | 默认。规定字符间没有额外的空间。               |
| *length* | 定义字符间的固定空间（允许使用负值）。         |
| inherit  | 规定应该从父元素继承 letter-spacing 属性的值。 |

- word-spacing属性增加或减少字与字之间的空白。

| 值       | 描述                                         |
| -------- | -------------------------------------------- |
| normal   | 默认。定义单词间的标准空间。                 |
| *length* | 定义单词间的固定空间。                       |
| inherit  | 规定应该从父元素继承 word-spacing 属性的值。 |

##### 12.2 text-align

- text-align属性指定元素文本的水平对齐方式。

| 值      | 描述                                       |
| ------- | ------------------------------------------ |
| left    | 把文本排列到左边。默认值：由浏览器决定。   |
| right   | 把文本排列到右边。                         |
| center  | 把文本排列到中间。                         |
| justify | 实现两端对齐文本效果。                     |
| inherit | 规定应该从父元素继承 text-align 属性的值。 |

##### 12.3 text-decoration

- text-decoration 属性规定添加到文本的修饰，下划线、上划线、删除线等。

| 值           | 描述                                            |
| ------------ | ----------------------------------------------- |
| none         | 默认。定义标准的文本。                          |
| underline    | 定义文本下的一条线。                            |
| overline     | 定义文本上的一条线。                            |
| line-through | 定义穿过文本下的一条线。                        |
| blink        | 定义闪烁的文本。                                |
| inherit      | 规定应该从父元素继承 text-decoration 属性的值。 |

##### 12.4 text-indent

- text-indent 属性规定文本块中首行文本的缩进。

| 值       | 描述                                        |
| -------- | ------------------------------------------- |
| *length* | 定义固定的缩进。默认值：0。                 |
| *%*      | 定义基于父元素宽度的百分比的缩进。          |
| inherit  | 规定应该从父元素继承 text-indent 属性的值。 |

##### 12.6 text-transform

- text-transform 属性控制文本的大小写。

| 值         | 描述                                           |
| ---------- | ---------------------------------------------- |
| none       | 默认。定义带有小写字母和大写字母的标准的文本。 |
| capitalize | 文本中的每个单词以大写字母开头。               |
| uppercase  | 定义仅有大写字母。                             |
| lowercase  | 定义无大写字母，仅有小写字母。                 |
| inherit    | 规定应该从父元素继承 text-transform 属性的值。 |

##### 12.7 vertical-align

- vertical-align 属性设置一个元素的垂直对齐方式。

| baseline    | 默认。元素放置在父元素的基线上。                             |
| ----------- | ------------------------------------------------------------ |
| sub         | 垂直对齐文本的下标。                                         |
| super       | 垂直对齐文本的上标                                           |
| top         | 把元素的顶端与行中最高元素的顶端对齐                         |
| text-top    | 把元素的顶端与父元素字体的顶端对齐                           |
| middle      | 把此元素放置在父元素的中部。                                 |
| bottom      | 把元素的底端与行中最低的元素的顶端对齐。                     |
| text-bottom | 把元素的底端与父元素字体的底端对齐。                         |
| length      |                                                              |
| %           | 使用 "line-height" 属性的百分比值来排列此元素。允许使用负值。 |
| inherit     | 规定应该从父元素继承 vertical-align 属性的值。               |

##### 12.8 line-height

- 设置以百分比计的行高

| 值       | 描述                                                 |
| -------- | ---------------------------------------------------- |
| normal   | 默认。设置合理的行间距。                             |
| *number* | 设置数字，此数字会与当前的字体尺寸相乘来设置行间距。 |
| *length* | 设置固定的行间距。                                   |
| *%*      | 基于当前字体尺寸的百分比行间距。                     |
| inherit  | 规定应该从父元素继承 line-height 属性的值。          |

##### 12.9 white-space

- white-space属性指定元素内的空白怎样处理

| 值       | 描述                                                         |
| -------- | ------------------------------------------------------------ |
| normal   | 默认。空白会被浏览器忽略。                                   |
| pre      | 空白会被浏览器保留。其行为方式类似 HTML 中的 <pre> 标签。    |
| nowrap   | 文本不会换行，文本会在在同一行上继续，直到遇到 <br> 标签为止。 |
| pre-wrap | 保留空白符序列，但是正常地进行换行。                         |
| pre-line | 合并空白符序列，但是保留换行符。                             |
| inherit  | 规定应该从父元素继承 white-space 属性的值。                  |

### 13. 文本格式-2

##### 13.1 text-decoration-style

- text-decoration-style 属性规定线条如何显示。

| 值      | 描述                       |
| ------- | -------------------------- |
| solid   | 默认值。线条将显示为单线。 |
| double  | 线条将显示为双线。         |
| dotted  | 线条将显示为点状线。       |
| dashed  | 线条将显示为虚线。         |
| wavy    | 线条将显示为波浪线。       |
| initial | 设置该属性为它的默认值。   |
| inherit | 从父元素继承该属性。       |

##### 13.2 text-overflow

- text-overflow属性指定当文本溢出包含它的元素，应该发生什么。

| 值       | 描述                                 |
| -------- | ------------------------------------ |
| clip     | 修剪文本。                           |
| ellipsis | 显示省略符号来代表被修剪的文本。     |
| *string* | 使用给定的字符串来代表被修剪的文本。 |

##### 13.3 text-shadow

- text-shadow 属性应用于阴影文本。

| 值         | 描述                             |
| ---------- | -------------------------------- |
| *h-shadow* | 必需。水平阴影的位置。允许负值。 |
| *v-shadow* | 必需。垂直阴影的位置。允许负值。 |
| *blur*     | 可选。模糊的距离。               |
| *color*    | 可选。阴影的颜色。               |

##### 13.4 word-wrap

- text-wrap属性指定文本换行规则。

| 值           | 描述                                                         |
| ------------ | ------------------------------------------------------------ |
| normal       | 只在允许的换行点进行换行。                                   |
| none         | 不换行。元素无法容纳的文本会溢出。                           |
| unrestricted | 在任意两个字符间换行。                                       |
| suppress     | 压缩元素中的换行。浏览器只在行中没有其他有效换行点时进行换行。 |

### 14.盒子模型-1

##### 14.1 概念

- 盒子模型将HTML元素当成一个盒子
- 盒子的位置由页面流决定

##### 14.2 设置宽度和高度

| 属性  | 描述           |
| ----- | -------------- |
| heigh | 设置元素的高度 |
| width | 设置元素的宽度 |

##### 14.3 设置内边距

| 属性           | 说明                         |
| -------------- | ---------------------------- |
| padding        | 在一个声明中设置所有填充属性 |
| padding-bottom | 设置元素的底填充             |
| padding-left   | 设置元素的左填充             |
| padding-right  | 设置元素的右填充             |
| padding-top    | 设置元素的顶部填充           |

##### 14.4 设置外边距

| 属性          | 说明                           |
| ------------- | ------------------------------ |
| margin        | 在一个声明中设置所有外边距属性 |
| margin-bottom | 设置元素的下外边距             |
| margin-left   | 设置元素的左外边距             |
| margin-right  | 设置元素的右外边距             |
| margin-top    | 设置元素的上外边距             |

##### 14.5 叠加外边距

- 垂直方向上的外边距会叠加

### 15.盒子模型-2

##### 15.1 盒子的类型

- 块级

- 行内

- 表元素

- 列表元素
- 每个元素都是以上类型之一
- 可以使用display属性改变类型

##### 15.2 display的属性值

| 值           | 描述                                                 |
| ------------ | ---------------------------------------------------- |
| block        | 此元素将显示为块级元素，此元素前后会带有换行符。     |
| inline       | 默认。此元素会被显示为内联元素，元素前后没有换行符。 |
| inline-block | 行内块元素。                                         |
| list-item    | 此元素会作为列表显示。                               |
| none         | 此元素不会被显示。                                   |

##### 15.3 visibility属性

| 值       | 描述                                                         |
| -------- | ------------------------------------------------------------ |
| visible  | 默认值。元素是可见的。                                       |
| hidden   | 元素是不可见的。                                             |
| collapse | 当在表格元素中使用时，此值可删除一行或一列，但是它不会影响表格的布局。被行或列占据的空间会留给其他内容使用。如果此值被用在其他的元素上，会呈现为 "hidden"。 |
| inherit  | 规定应该从父元素继承 visibility 属性的值。                   |

##### 15.4 处理溢出

- overflow：overflow属性指定如果内容溢出一个元素的框，会发生什么。

| 值      | 描述                                                     |
| ------- | -------------------------------------------------------- |
| visible | 默认值。内容不会被修剪，会呈现在元素框之外。             |
| hidden  | 内容会被修剪，并且其余内容是不可见的。                   |
| scroll  | 内容会被修剪，但是浏览器会显示滚动条以便查看其余的内容。 |
| auto    | 如果内容被修剪，则浏览器会显示滚动条以便查看其余的内容。 |
| inherit | 规定应该从父元素继承 overflow 属性的值。                 |

### 16. 边框样式-1

##### 16.1 边框宽度，颜色与样式

| 属性                | 初始值   | 描述           |
| ------------------- | -------- | -------------- |
| border-top-color    | 当前颜色 | 设置上边框颜色 |
| border-right-color  | 当前颜色 | 设置右边框颜色 |
| border-bottom-color | 当前颜色 | 设置下边框颜色 |
| border-left-color   | 当前颜色 | 设置左边框颜色 |
| border-top-style    | none     | 设置上边框样式 |
| border-right-style  | none     | 设置右边框样式 |
| border-bottom-style | none     | 设置下边框样式 |
| border-left-style   | none     | 设置左边框样式 |
| border-top-width    | medium   | 设置上边框样式 |
| border-right-width  | medium   | 设置右边框样式 |
| border-bottom-width | medium   | 设置下边框样式 |
| border-left-width   | medium   | 设置左边框样式 |

- border-color属性设置一个元素的四个边框颜色。此属性可以有一到四个值。

```css
p{
border-style:solid;
border-color:#ff0000 #0000ff;
} 
```

- border-style属性设置一个元素的四个边框的样式。此属性可以有一到四个值。

```css
p{
border-style:dotted solid double dashed
}
上边框是点状
右边框是实线
下边框是双线
左边框是虚线
```

- border-width属性设置一个元素的四个边框的宽度。此属性可以有一到四个值。

```css
p{
    border-style:solid;
    border-width:15px;
}
```

##### 16.2 产生圆角的属性

- border-radius 属性是一个最多可指定四个 border - * - radius 属性的复合属性.

```css
#div1{
        border:2px solid;
        border-radius:25px;
}
```

###### 16.2.1 圆角值

- 一个值：产生平滑的圆角

- 一个百分比：元素是方形的，产生平滑圆角，否则，浏览器计算宽与高的百分比

- 两个值：第一个是水平半径，第二个是垂直半径

- 值为0：方形角



### 17. 边框样式-2

##### 17.1 边框阴影

- box-shadow属性可以设置一个或多个下拉阴影的框。

```css
#div2{
    width:100px;
    height:100px;
    border: 1px blue solid;
    box-shadow: 10px 10px 5px #888888;
}

```

- box-shadow: *h-shadow v-shadow blur spread color* inset;

**注意：**boxShadow 属性把一个或多个下拉阴影添加到框上。该属性是一个用逗号分隔阴影的列表，每个阴影由 2-4 个长度值、一个可选的颜色值和一个可选的 inset 关键字来规定。省略长度的值是 0。

| 值         | 说明                                                         |
| ---------- | ------------------------------------------------------------ |
| *h-shadow* | 必需的。水平阴影的位置。允许负值                             |
| *v-shadow* | 必需的。垂直阴影的位置。允许负值                             |
| *blur*     | 可选。模糊距离                                               |
| *spread*   | 可选。阴影的大小                                             |
| *color*    | 可选。阴影的颜色。在[CSS颜色值](https://www.runoob.com/cssref/css_colors_legal.aspx)寻找颜色值的完整列表 |
| inset      | 可选。从外层的阴影（开始时）改变阴影内侧阴影                 |

##### 17.2 边框图片

| 值                    | 描述                                                         |
| --------------------- | ------------------------------------------------------------ |
| *border-image-source* | 用于指定要用于绘制边框的图像的位置                           |
| *border-image-slice*  | 图像边界向内偏移                                             |
| *border-image-width*  | 图像边界的宽度                                               |
| *border-image-outset* | 用于指定在边框外部绘制 border-image-area 的量                |
| *border-image-repeat* | 用于设置图像边界是否应重复（repeat）、拉伸（stretch）或铺满（round）。 |

```css
 #div4{
            width: 200px;
            height: 200px;
            border: 5px red solid;
            border-image-source: url("1018135_3.jpg");
            border-image-slice:23;
            border-image-repeat: repeat;
        }
```

##### 17.3 轮廓

| 值              | 描述                                      |
| --------------- | ----------------------------------------- |
| *outline-color* | 规定边框的颜色。                          |
| *outline-style* | 规定边框的样式。                          |
| *outline-width* | 规定边框的宽度。                          |
| inherit         | 规定应该从父元素继承 outline 属性的设置。 |

```css
#div2{
            width: 200px;
            height: 200px;
            border: 10px red solid;
            outline-style: dashed;
            outline-width: 10px;
        }
```

### 18. 背景样式-1

##### 18.1 设置元素的背景颜色

| 属性                  | 描述                                                         |
| --------------------- | ------------------------------------------------------------ |
| background            | 复合属性。设置对象的背景特性。                               |
| background-attachment | 设置或检索背景图像是随对象内容滚动还是固定的。必须先指定background-image属性。 |
| background-color      | 设置或检索对象的背景颜色。                                   |
| background-image      | 设置或检索对象的背景图像。                                   |
| background-position   | 设置或检索对象的背景图像位置。必须先指定background-image属性。 |
| background-repeat     | 设置或检索对象的背景图像如何铺排填充。必须先指定background-image属性。 |
| background-clip       | 指定对象的背景图像向外裁剪的区域。                           |
| background-origin     | S设置或检索对象的背景图像计算background-position时的参考原点(位置)。 |
| background-size       | 检索或设置对象的背景图像的尺寸大小。                         |

- background-repeat：默认情况下，重复background-image的垂直和水平方向。

```css
body{
background-image:url('7.jpg');
background-repeat:repeat-y;
} 
```

| 值        | 说明                                          |
| --------- | --------------------------------------------- |
| repeat    | 背景图像将向垂直和水平方向重复。这是默认      |
| repeat-x  | 只有水平位置会重复背景图像                    |
| repeat-y  | 只有垂直位置会重复背景图像                    |
| no-repeat | background-image不会重复                      |
| inherit   | 指定background-repeat属性设置应该从父元素继承 |

- background-attachment：设置背景图像是否固定或者随着页面的其余部分滚动。

```css
body{
    background-image:url('7.jpg');
    background-repeat:no-repeat;
    background-attachment:fixed;
}
```

| 值      | 描述                                                |
| ------- | --------------------------------------------------- |
| scroll  | 背景图片随着页面的滚动而滚动，这是默认的。          |
| fixed   | 背景图片不会随着页面的滚动而滚动。                  |
| local   | 背景图片会随着元素内容的滚动而滚动。                |
| initial | 设置该属性的默认值                                  |
| inherit | 指定 background-attachment 的设置应该从父元素继承。 |

- background-position：属性设置背景图像的起始位置。

```css
body
{
background-image:url('7.jpg');
background-repeat:no-repeat;
background-attachment:fixed;
background-position:center;
} 
```

- background-origin:属性指定background-position属性应该是相对位置。

```css
div
{
background-image:url('7.jpg');
background-repeat:no-repeat;
background-position:left;
background-origin:content-box;
} 
```

| 值          | 描述                       |
| ----------- | -------------------------- |
| padding-box | 背景图像填充框的相对位置   |
| border-box  | 背景图像边界框的相对位置   |
| content-box | 背景图像的相对位置的内容框 |

- background-clip:属性指定背景绘制区域。

```css
div
{
    background-color:yellow;
    background-clip:content-box;
}
```

| 值          | 说明                                             |
| ----------- | ------------------------------------------------ |
| border-box  | 默认值。背景绘制在边框方框内（剪切成边框方框）。 |
| padding-box | 背景绘制在衬距方框内（剪切成衬距方框）。         |
| content-box | 背景绘制在内容方框内（剪切成内容方框）。         |

- background-size:属性指定背景图片大小。

```css
div
{
    background:url(7.jpg);
    background-size:80px 60px;
    background-repeat:no-repeat;
}
```

| 值         | 描述                                                         |
| ---------- | ------------------------------------------------------------ |
| length     | 设置背景图片高度和宽度。第一个值设置宽度，第二个值设置的高度。如果只给出一个值，第二个是设置为 auto(自动) |
| percentage | 将计算相对于背景定位区域的百分比。第一个值设置宽度，第二个值设置的高度。如果只给出一个值，第二个是设置为"auto(自动)" |
| cover      | 此时会保持图像的纵横比并将图像缩放成将完全覆盖背景定位区域的最小大小。 |
| contain    | 此时会保持图像的纵横比并将图像缩放成将适合背景定位区域的最大大小。 |

### 19. 背景样式-2

##### 19.1 设置元素的多个图片属性

- 以逗号隔开的多个图片作为背景图片

- 其他属性的值与图片对应起来进行指定

- 第一个图片作为前景图片，其他图片显示在后面

##### 19.2 CSS Sprite

- CSS精灵，CSS雪碧

- 一种网页图片应用处理方式，他允许将一个页面涉及到的所有零星图片都包含到一张大图中去

- 然后使用背景相关的属性将需要的图片部分显示出来

###### 为何使用？

- 减少网页到的http请求，提高页面性能

- 减少图片大小

- 解决网页设计师图片命名

- 维护网页风格更加方便

### 20. 列表样式

| 属性                | 说明                           |
| ------------------- | ------------------------------ |
| list-style          | 在一个声明中设置所有的列表属性 |
| list-style-image    | 将图象设置为列表项标记         |
| list-style-position | 设置列表项标记的放置位置       |
| list-style-type     | 设置列表项标记的类型           |

##### 20.1 list-style-type

- list-style-type :属性设置列表项标记的类型。

###### 无序列表的可选值：

- disc

- circle

- square

###### 有序列表的可选值：

- decimal

- lower-roman，upper-roman

- lower-alpha，upper-alpha

###### 不显示符号

- none

```css
#ul1{list-style-type:circle}
ul{list-style-type:square}
```

##### 20.2 list-style-position

- list-style-position: 属性指示如何相对于对象的内容绘制列表项标记。

| 值      | 描述                                                         |
| ------- | ------------------------------------------------------------ |
| inside  | 列表项目标记放置在文本以内，且环绕文本根据标记对齐。         |
| outside | 默认值。保持标记位于文本的左侧。列表项目标记放置在文本以外，且环绕文本不根据标记对齐。 |
| inherit | 规定应该从父元素继承 list-style-position 属性的值。          |

```css
ul {
    list-style-position: inside;
}
```

### 21. 表格样式

##### 21.1 表格样式相关属性

| 属性                                                         | 说明                                       | CSS  |
| :----------------------------------------------------------- | :----------------------------------------- | :--- |
| [border-collapse](https://www.runoob.com/cssref/pr-border-collapse.html) | 规定是否合并表格边框                       | 2    |
| [border-spacing](https://www.runoob.com/cssref/pr-border-spacing.html) | 规定相邻单元格边框之间的距离               | 2    |
| [caption-side](https://www.runoob.com/cssref/pr-tab-caption-side.html) | 规定表格标题的位置                         | 2    |
| [empty-cells](https://www.runoob.com/cssref/pr-tab-empty-cells.html) | 规定是否显示表格中的空单元格上的边框和背景 | 2    |
| [table-layout](https://www.runoob.com/cssref/pr-tab-table-layout.html) | 设置用于表格的布局算法                     | 2    |

##### 21.2  border-collapse

**可选值：**

- separate：默认值，边框会被分开
- collapse：如果可能边框会合并为一个单一的边框

```css
table
  {
  border-collapse:collapse;
  }
```

##### 21.3 caption-size

**可选值：**

- top:默认值，表格标题在表格上面。
- bottom:表格标题在表格下面。

```css
caption
  {
  caption-side:bottom;
  }

```

##### 21.4 empty-cells

**可选值：**

- hide:空单元格的边框与背景不会显示
- show:默认值，边框与背景都会显示

```css
table
  {
  border-collapse:separate;
  empty-cells:hide;
  }
```

##### 21.5 table-layout

**可选值：**

- auto：默认值，列宽度适合最宽的元素
- fix：每个列的宽度是固定的

```css
table
  {
  table-layout:fixed;
  }
```

### 22. 生成内容

##### 22. 1 生成内容概述

1. 使用CSS动态产生内容
2. 但是这些内容不是HTML或DOM的一部分
3. 产生的内容可以是文本，图片，引号，序号等

##### 22.2 相关属性



| 属性                                                         | 说明                                                   | CSS  |
| :----------------------------------------------------------- | :----------------------------------------------------- | :--- |
| [content](https://www.runoob.com/cssref/pr-gen-content.html) | 与 :before 以及 :after 伪元素配合使用，来插入生成内容  | 2    |
| [counter-increment](https://www.runoob.com/cssref/pr-gen-counter-increment.html) | 递增或递减一个或多个计数器                             | 2    |
| [counter-reset](https://www.runoob.com/cssref/pr-gen-counter-reset.html) | 创建或重置一个或多个计数器                             | 2    |
| [quotes](https://www.runoob.com/cssref/pr-gen-quotes.html)   | 设置嵌套引用的引号类型                                 | 2    |
| crop                                                         | 允许replaced元素只是作为一个对象代替整个对象的矩形区域 | 3    |
| move-to                                                      | 从流中删除元素，然后在文档中后面的点上重新插入。       | 3    |
| page-policy                                                  | 判定基于页面的给定元素的适用于计数器的字符串值         | 3    |

##### 22.3 content

**可选值：**

- none：不产生内容

- normal：与none相同

- 字符串：该字符串会生成

- url():外部资源通常是图片

- attr(x):使用选择元素的x属性

- counter()：生成一个数字序列

- open-quote：插入quotes属性定义的开始引号

- close-quote：插入quotes属性定义的关闭引号

- no-open-quote:忽略开始引号

- no-close-quote:忽略关闭引号

  ```css
  a:after
    {
    content: " (" attr(href) ")";
    }
  ```



##### 22.4 counter-reset

- 设置序号的初始值，用一个数字表示

- 默认为0

  ```css
  body
    {
    counter-reset:section;
    }
  
  h1
    {
    counter-reset:subsection;
    }
  
  h1:before
    {
    content:"Section " counter(section) ". ";
    counter-increment:section;
    }
  
  h2:before
    {
    counter-increment:subsection;
    content:counter(section) "." counter(subsection) " ";
    }
  ```

##### 22.5 counter-increment

- 设置序号产生的增量

- 默认为1

  ```css
  body
    {
    counter-reset:section;
    }
  
  h1
    {
    counter-reset:subsection;
    }
  
  h1:before
    {
    content:"Section " counter(section) ". ";
    counter-increment:section;
    }
  
  h2:before
    {
    counter-increment:subsection;
    content:counter(section) "." counter(subsection) " ";
    }
  ```

##### 22.6 counter()

- 该函数可接收一个或两个参数，用于计算序号中的一个值
- 第一个参数为counter-reset设置的变量
- 第二个参数为数字的样式

##### 22.7 quotes

**可选值：**

- none。规定 conents 属性的 open-quote 和 close-quote 的值不会产生任何引号
- string string string string 前面两个值规定下一级引号嵌套。

```css
q:lang(en)
  {
  quotes: '"' '"' "'" "'";
  }
```

### 23. 打印样式

##### 23.1 打印样式概述

- 利用它可以非常方便的实现打印页面中的指定内容和分页打印
- 在打印页面时，需要关注的有:
  - 内容
  - 边距
- 打印样式不能指定打印页面的大小和方向

##### 23.2 媒体类型（Media Type）

1. 媒体类型允许指定文件将如何在不同媒体呈现

   类型：

   - all：默认值，应用于所有设备
   - print：打印时应用
   - screen：最常用，应用样式到计算机的屏幕上
   - tv：应用样式到电视或类似的设备上
   - projection：应用到投影仪上



2. 设置媒体类型

- ``` <link href="common.css" rel="stylesheet" media="screen[, print]">```

- ```
  <style media=" print">
  body {
  background-color: #FFF;
  }
  </style>
  ```

- ```css
  @media print {
  body {
  background-color: #FFF;
      }
  }
  ```

##### 23.3 控制页面打印内容

1. 设置打印颜色

   一般设置为黑色文本和白色背景

2. 设置不打印的内容

   使用display：none

##### 23.4 设置页面边距

1. @page用于设置页面边距

2. 使用margin设置边距值

   单位应该使用in，cm，mm，pt，pc

3. 也可以使用伪类：:first，:left，:right 

##### 23.5 内容分页

| 属性                                                         | 说明                                                 | CSS  |
| :----------------------------------------------------------- | :--------------------------------------------------- | :--- |
| orphans                                                      | 设置当元素内部发生分页时必须在页面底部保留的最少行数 | 2    |
| [page-break-after](https://www.runoob.com/cssref/pr-print-pageba.html) | 设置元素后的分页行为                                 | 2    |
| [page-break-before](https://www.runoob.com/cssref/pr-print-pagebb.html) | 设置元素前的分页行为                                 | 2    |
| [page-break-inside](https://www.runoob.com/cssref/pr-print-pagebi.html) | 设置元素内部的分页行为                               | 2    |
| widows                                                       | 设置当元素内部发生分页时必须在页面顶部保留的最少行数 | 2    |

##### 23.6 page-break-before  page-break-after

**可选值：**

- auto：默认值浏览器决定是否换页

- always：强制换页

- avoid：避免换页

  ```css
  <style>
  @media print
  {
  table {page-break-before:always;}
  }
  </style>
  ```

  ```css
  <style>
  @media print
  {
  table {page-break-after:always;}
  }
  </style>
  ```

##### 23.7 page-break-inside

**可选值：**

- auto

- avoid：一般用于列表，图片

  ```css
  <style>
  @media print
  {
  table {page-break-inside:avoid;}
  }
  </style>
  ```

### 24. 滤镜

##### 24.1 概述

滤镜主要是用来实现页面元素的各种效果，一般用于图片

##### 24.2 filter 属性

1. 语法

   filter：滤镜名（参数）  默认值是none，没有继承性

2. 滤镜名

   - grayscale 灰度

   - sepia 褐色

   - saturate 饱和度

   - hue-rotate色相旋转

   - invert 反色

   - opacity 透明度

   - brightness 亮度

   - contrast 对比度

   - blur 模糊

   - drow-shadow 阴影

     ```css
     img
     {
     opacity:0.4;
     filter:alpha(0.6);
     }
     ```

### 25. 鼠标样式

##### 25.1 概述

CSS提供了cursor属性控制在特定元素上的鼠标样式

##### 25.2 属性值

| 值        | 描述                                                         |
| :-------- | :----------------------------------------------------------- |
| *url*     | 需使用的自定义光标的 URL。注释：请在此列表的末端始终定义一种普通的光标，以防没有由 URL 定义的可用光标。 |
| default   | 默认光标（通常是一个箭头）                                   |
| auto      | 默认。浏览器设置的光标。                                     |
| crosshair | 光标呈现为十字线。                                           |
| pointer   | 光标呈现为指示链接的指针（一只手）                           |
| move      | 此光标指示某对象可被移动。                                   |
| e-resize  | 此光标指示矩形框的边缘可被向右（东）移动。                   |
| ne-resize | 此光标指示矩形框的边缘可被向上及向右移动（北/东）。          |
| nw-resize | 此光标指示矩形框的边缘可被向上及向左移动（北/西）。          |
| n-resize  | 此光标指示矩形框的边缘可被向上（北）移动。                   |
| se-resize | 此光标指示矩形框的边缘可被向下及向右移动（南/东）。          |
| sw-resize | 此光标指示矩形框的边缘可被向下及向左移动（南/西）。          |
| s-resize  | 此光标指示矩形框的边缘可被向下移动（北/西）。                |
| w-resize  | 此光标指示矩形框的边缘可被向左移动（西）。                   |
| text      | 此光标指示文本。                                             |
| wait      | 此光标指示程序正忙（通常是一只表或沙漏）。                   |
| help      | 此光标指示可用的帮助（通常是一个问号或一个气球）。           |

```css
input{
cursor:default
}
```

### 26. 渐变

##### 26.1 渐变概述

1. CSS3引入的渐变可以在两个或多个颜色之间产生平滑的过渡。

2. 分类

   - 线性渐变：向下/向上/向左/向右/对角方向

     

   - 径向渐变：由它们的中心定义



##### 26.2 使用语法

在CSS的background-image使用相关函数作为值

| [linear-gradient()](https://www.runoob.com/cssref/func-linear-gradient.html) | 创建一个线性渐变的 "图像"(从上到下)       |
| :----------------------------------------------------------- | :---------------------------------------- |
| [radial-gradient()](https://www.runoob.com/cssref/func-radial-gradient.html) | 用径向渐变创建 "图像"。 (center to edges) |
| [repeating-linear-gradient()](https://www.runoob.com/cssref/func-repeating-linear-gradient.html) | 创建重复的线性渐变 "图像"                 |
| [repeating-radial-gradient()](https://www.runoob.com/cssref/func-repeating-radial-gradient.html) | 创建重复的径向渐变 "图像"                 |

##### 26.3  linear-gradient()

1. 一个可选的角度或方向的至少两个颜色

   参数：

   - direction，to 后面使用top，right，button，left组合表示渐变方向
   - angle，角度
   - 颜色及可选开始位置：可以在颜色后加上一个长度或百分比

```css
div{
background-image:linear-gradient(to right,red,blue)
}
```

```css
div{
background-image:linear-gradient(180degt,red,blue)
}
```

##### 26.4 radial-gradient()

1. 用法：至少定义有、两种颜色结点，也可以指定渐变的中心、形状。

   参数：

   - shape：circle或ellipse
   - size：设置形状的半径，长度或关键字
   - position：位置，默认是center，可以设置两个长度
   - color及可选起始位置：逗号分隔的颜色，必须的

shape，size，position以空格分开，shape，size顺序任意，但position要在其后，color在最后

```css
div{
background-image:radial-gradient(circle 30px ,blue,red)
}
```

##### 26.5 size

1. 圆形，只接收一个值，表示半径
2. 椭圆形，接收两个值，长度或百分比，分别表示水平半径和垂直半径
3. 关键字
   - closest-side：半径长度为圆心到离圆心最近的边
   - farthest-side：半径长度为圆心到离圆心最远的边
   - closest-corner：半径长度为圆心到离圆心最近的角
   - farthest-corner：半径长度为圆心 到离圆心最远的角

### 27. 转换

##### 27.1 转换的概念

1. Transform ，CSS3引入，可以使元素改变形状、尺寸和位置的一种效果转换
2. 可以使用2D或3D转换来转换元素
3. 包括：移动、缩放、转动、拉长或拉伸

##### 27.2 转换相关属性

| 属性                                                         | 说明                   | CSS  |
| :----------------------------------------------------------- | :--------------------- | :--- |
| [transform](https://www.runoob.com/cssref/css3-pr-transform.html) | 适用于2D或3D转换的元素 | 3    |
| [transform-origin](https://www.runoob.com/cssref/css3-pr-transform-origin.html) | 允许您更改转化元素位置 | 3    |

##### 27.3 transfrom的属性值

| 值                                                           | 描述                                    |
| :----------------------------------------------------------- | :-------------------------------------- |
| none                                                         | 定义不进行转换。                        |
| matrix(*n*,*n*,*n*,*n*,*n*,*n*)                              | 定义 2D 转换，使用六个值的矩阵。        |
| matrix3d(*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*) | 定义 3D 转换，使用 16 个值的 4x4 矩阵。 |
| translate(*x*,*y*)                                           | 定义 2D 转换。                          |
| translate3d(*x*,*y*,*z*)                                     | 定义 3D 转换。                          |
| translateX(*x*)                                              | 定义转换，只是用 X 轴的值。             |
| translateY(*y*)                                              | 定义转换，只是用 Y 轴的值。             |
| translateZ(*z*)                                              | 定义 3D 转换，只是用 Z 轴的值。         |
| scale(*x*[,*y*]?)                                            | 定义 2D 缩放转换。                      |
| scale3d(*x*,*y*,*z*)                                         | 定义 3D 缩放转换。                      |
| scaleX(*x*)                                                  | 通过设置 X 轴的值来定义缩放转换。       |
| scaleY(*y*)                                                  | 通过设置 Y 轴的值来定义缩放转换。       |
| scaleZ(*z*)                                                  | 通过设置 Z 轴的值来定义 3D 缩放转换。   |
| rotate(*angle*)                                              | 定义 2D 旋转，在参数中规定角度。        |
| rotate3d(*x*,*y*,*z*,*angle*)                                | 定义 3D 旋转。                          |
| rotateX(*angle*)                                             | 定义沿着 X 轴的 3D 旋转。               |
| rotateY(*angle*)                                             | 定义沿着 Y 轴的 3D 旋转。               |
| rotateZ(*angle*)                                             | 定义沿着 Z 轴的 3D 旋转。               |
| skew(*x-angle*,*y-angle*)                                    | 定义沿着 X 和 Y 轴的 2D 倾斜转换。      |
| skewX(*angle*)                                               | 定义沿着 X 轴的 2D 倾斜转换。           |
| skewY(*angle*)                                               | 定义沿着 Y 轴的 2D 倾斜转换。           |
| perspective(*n*)                                             | 为 3D 转换元素定义透视视图。            |

##### 27.4 transfrom-origin

1. 默认值是元素的中心点
2. 其值可以是长度，百分比或关键字

##### 27.5 matrix()函数

1. 2D转换可以使用带6个参数的matrix()函数

2. 参数说明:

   第1个和第4个参数：控制水平和垂直的缩放

   第2个和第3个参数：控制水平和垂直的拉伸

   第5个和第6个参数：控制水平和垂直的移动

**注意：**当有多个转换样式应用于同一个元素时，转换函数不会叠加

示例：

```css
div{transform:rotate(5deg) scale(2);}

.foo{transform:rotate(10deg);}
```

### 28.  过渡

##### 28.1 过渡(transition)概述

让元素的某些属性在固定的时间内从一个值变化到另一个值

##### 28.2 相关属性

| 属性                                                         | 说明                                                         | CSS  |
| :----------------------------------------------------------- | :----------------------------------------------------------- | :--- |
| [transition](https://www.runoob.com/cssref/css3-pr-transition.html) | 此属性是 transition-property、transition-duration、transition-timing-function、transition-delay 的简写形式。 | 3    |
| [transition-property](https://www.runoob.com/cssref/css3-pr-transition-property.html) | 设置用来进行过渡的 CSS 属性。                                | 3    |
| [transition-duration](https://www.runoob.com/cssref/css3-pr-transition-duration.html) | 设置过渡进行的时间长度。                                     | 3    |
| [transition-timing-function](https://www.runoob.com/cssref/css3-pr-transition-timing-function.html) | 设置过渡进行的时序函数。                                     | 3    |
| [transition-delay](https://www.runoob.com/cssref/css3-pr-transition-delay.html) | 指定过渡开始的时间。                                         | 3    |

##### 28.3 transition-property

- 其值可为单个属性或多个属性

- 多个属性以逗号分隔

  ```css
  div
  {
  transition-property:width;
  }
  ```

##### 28.4 transition-duration

- 其值时以秒或毫秒为单位的过渡执行的时长

- 指定一个值，则所有的过渡执行相同的时长

- 指定多个值，则以相同的顺序应用时长，并且会循环应用

  ```css
  div
  {
  transition-duration: 5s;
  }
  ```

##### 28.5 transition-timing-function

可接受一个或多个函数作为值

- ease：慢速启动，中间快速，慢速结束

- linear：以相同速度进行过渡

- ease-in：慢速启动，快速结束

- ease-out：快速启动，慢速结束

- ease-in-out：与ease类似，但结束更慢

- cubic-bezier()：以贝塞尔曲线指定

- step-start：过渡发生在开始

- step-end ：过渡发生在结束

- steps()：效果出现在指定的时间间隔上

  ```css
  div
  {
  transition-timing-function: linear;
  }
  ```

##### 28.6 transition-delay

- 可以使用该属性设置部分或全部过渡效果的延迟执行

- 多个值使用逗号分隔

- 值可为负数，此时立即执行，但效果有偏移量

  ```css
  div
  {
  transition-delay: 2s;
  }
  ```

##### 28.7 transition

设置单个属性值的过渡效果，使用逗号分隔多个设置

语法：

- transition：属性 时长 延时 效果函数

- 省略属性，则设置所有的属性

- 省略延时，默认是0ms

- 省略效果函数，默认是ease

  ```css
  div
  {
  width:100px;
  transition: width 2s;
  ```

##### 28.8 局限

- transform需要时间触发，所以没法在网页加载时自动发生
- transform是一次性的，不等重复发生，除非一再触发
- transform只能定义初始状态和结束状态，不能定义中间状态，所以说只有两个状态
- 一条transform规则，只能定义一个属性的变化，不能涉及多个属性

### 29. 动画

##### 29.1动画(animation)概述

- 在一段固定的时间内以某一频率改变其CSS某个或某些值，从而达到视觉上的转换动画效果
- 很多方面都是可以控制的，包括动画运行时间，包括开始值和结束值，还有动画的暂停和延迟其开始时间等

##### 29.2 实现步骤

产生动画需要两个阶段的处理：

- Keyframe：
  - 描述每个阶段属性的状态
  - 使用Keyframe
- 使用相关属性将动画应用于元素上

##### 29.3 @Keyframe规则

- 可以使用0%到100%中间的百分数定义动画各阶段的属性值
- from表示0%
- to表示100%

##### 29.4 相关属性

| 属性                                                         | 描述                                                         | CSS  |
| :----------------------------------------------------------- | :----------------------------------------------------------- | :--- |
| [@keyframes](https://www.runoob.com/cssref/css3-pr-animation-keyframes.html) | 定义一个动画,@keyframes定义的动画名称用来被animation-name所使用。 | 3    |
| [animation](https://www.runoob.com/cssref/css3-pr-animation.html) | 复合属性。检索或设置对象所应用的动画特效。                   | 3    |
| [animation-name](https://www.runoob.com/cssref/css3-pr-animation-name.html) | 检索或设置对象所应用的动画名称 ,必须与规则@keyframes配合使用，因为动画名称由@keyframes定义 | 3    |
| [animation-duration](https://www.runoob.com/cssref/css3-pr-animation-duration.html) | 检索或设置对象动画的持续时间                                 | 3    |
| [animation-timing-function](https://www.runoob.com/cssref/css3-pr-animation-timing-function.html) | 检索或设置对象动画的过渡类型                                 | 3    |
| [animation-delay](https://www.runoob.com/cssref/css3-pr-animation-delay.html) | 检索或设置对象动画的延迟时间                                 | 3    |
| [animation-iteration-count](https://www.runoob.com/cssref/css3-pr-animation-iteration-count.html) | 检索或设置对象动画的循环次数                                 | 3    |
| [animation-direction](https://www.runoob.com/cssref/css3-pr-animation-direction.html) | 检索或设置对象动画在循环中是否反向运动                       | 3    |
| [animation-play-state](https://www.runoob.com/cssref/css3-pr-animation-play-state.html) | 检索或设置对象动画的状态                                     | 3    |

##### 29.5 animation-name

可以指定多个逗号分隔的@Keyframes规则名以应用多个动画

```css
div
{
animation:mymove 5s infinite;
}
```

##### 29.6 animation-duration

可以指定多个逗号分隔时间值，与多个animation-name对应

```css
div
{
animation-duration:2s;
}
```

##### 29.7 animation-timing-function

两种方式应用：

- 在@keyframes规则中分别指定

- 在样式中统一指定

  ```css
  div
  {
  animation-timing-function:2s;
  ```

应用规则：

- 先应用@keyframes规则中的
- 如果@keyframes规则中没有指定，则应用样式中的
- 否则，使用默认值ease

##### 29.8 animation-iteration-count

- 默认，动画只会执行一次

- 可选值：

  - 数字，可以是整数或小数，不允许是负数

  - 关键字infinite，表示无限次执行

    ```css
    div
    {
    animation-iteration-count:3;
    ```

##### 29.9 animation-direction

**可选值：**

- normal，默认值，按照@Keyframes规则定义的顺序执行

- reverse，以@Keyframes规则定义的相反顺序执行

- alternate，从1开始计数，奇数以正常顺序执行，偶数以相反顺序执行

- alternate-reverse：从1开始计数，偶数以正常顺序执行，奇数以相反顺序执行

  ```css
  div
  {
  animation-direction:alternate;
  }
  ```

##### 29.10 animation-play-state

**可选值：**

- running，默认值，动画正常运行

- paused，动画暂停，会保持当前状态

  ```css
  div
  {
  animation-play-state:paused;
  }
  ```

##### 29.11 animation-delay

指定为负数，动画会开始执行，但会有偏移量

```css
div
{
animation-delay:2s;
}
```

##### 29.11 animation-fill-mode

**可选值：**

- none，默认值，动画结束时，程序返回初始值

- forwards，属性保留最后keyframe设置的值

- backwards，若动画有延迟，则开始时的属性值为第一个keyframe设置的值

- both，同时应用forwards和backwards的规则

  ```css
  h1
    {
    animation-fill-mode: forwards;
    }
  ```

##### 29.12 animation

- 接收所有属性的有效值除了animation-play-state
- 第一个时间值为animation-duraction的值
- 第二个时间值为animation-delay的值

### 30. 浏览器引擎前缀

##### 30.1 浏览器引擎的概述

- 即渲染引擎，也称为浏览器内核
- 负责对网页语法的解释并渲染[显示)网页
- 不同的浏览器内核对网页编写语法的解释
  也有不同  

##### 30.2 常见的浏览器引擎

- Trident：IE
- Gecko：Firefox
- Presto：Opera以前用，现在用Wenkit
- Webkit：Safari,Chrome

##### 30.3 什么时浏览器引擎前缀

- Vendor Prefix 是一些放在CSS属性前的小字符串
- 用来确保这种属性只在特定的浏览器渲染引擎下才能识别和生效

##### 30.4 为何需要加前缀

- 试验一些还未成为标准的的CSS属性一-也许
  永远不会成为标准
- 对新出现的标准的CSS3属性特征做实验性
  的实现
- 对CSS3中一些新属性做等效语义的个性实
  现

##### 30.5 常见的浏览器引擎前缀

- Trident:.-ms :◆Gecko: -moz 
- Presto: -0
- Webkit: -webkit

```css
.box {
-moz-border-radius: 5px;

-webkit-border-radius: 5px;

-o-border-radius: 5px;

border-radius: 5px;

}  
```

##### 30.6一般用法

- 将前缀样式放在前面
- 不带前缀的样式放在后面