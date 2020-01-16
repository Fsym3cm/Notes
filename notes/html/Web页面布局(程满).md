## Web页面布局 

### 1:布局概述

什么是布局：用来确定页面上不同组件和元素的尺寸和位置 

符合Web标准页面布局的好处：

- 结构与表现相分离 
- 易于维护与改版 
- 信息跨平台使用  
- 减少服务器端成本 
- 加快解析速度 
- 搜索引擎友好

### 2:定位

#### 定位概述

CSS定位不仅可以使元素脱离文档流， 也可以允许精确定位。

不适合对网页进行整体布局设计。

可以用于产生一些页面效果，如固定的对联广告 。

#### 定位的相关属性

|   属性   | 初始值 | 描述                                               |
| :------: | ------ | -------------------------------------------------- |
| position | static | 控制元素如何定位                                   |
|   top    | auto   | 指定定位元素离上边的偏移                           |
|   left   | auto   | 指定定位元素离左边的偏移                           |
|  right   | auto   | 指定定位元素离右边的偏移                           |
|  bottom  | auto   | 指定定位元素离下边的偏移                           |
| z-index  | auto   | 设置定位元素在垂直方向的出现顺序，相对值大的在上面 |

position:

可选值： 

static，默认值，元素位于普通文档流中 

relative，相对它在普通文档流中的位置，不影响 其他元素的定位 

absolute，使元素(包括子元素)脱离文档流 

​    当父元素使用了position时，相对于父元素定位 否则相对于页面定位 

 fixed，与absolute类似，但总是相对于浏览器定位

```
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<style>
	body{
		margin:0;
		padding:0;
	}
	#div1{
		width:300px;
		height:300px;
		background:red;
		position:relative;
		top:40px;
		left:50px;
		z-index:10;
	}
	
	#div2{
		width:300px;
		height:1500px;
		background:blue;
		position:absolute;
		top:140px;
		left:150px;
		z-index:20;
	}
	#div21{
		width:100px;
		height:100px;
		background:yellow;
		position:absolute;
		top:140px;
		left:150px;
	}
	#div3{
		width:100px;
		height:100px;
		background:yellow;
		position:fixed;
		top:140px;
		left:150px;
	}
</style>
</head>

<body>
<div id="div1">
</div>
<div id="div2">
	<div id="div21">
    </div>
</div>
<div id="div3">
</div>
</body>
</html>

```



### 3:浮动1

#### 浮动的概念

  在标准流中，默认情况下块级元素在水平方向会自动伸展，而在垂直方向上依次从上往下排列。
  浮动可以将元素从标准流中脱离出来，使其向父元素的一边靠齐，同时会将旁边的空间留出来给其它元素使用。

#### 相关属性的设置

float属性
该属性可以设置元素的浮动方向
可选值：
  left，浮动到父元素的左边
  right，浮动到父元素的右边
  none，默认值，不浮动

```
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<style>
	#main{
		width:960px;
		margin:0 auto;
	}
	#main img{
		float:right;
	}
</style>
</head>
<body>
	<div id="main">
    	<img src="img/panda.jpg" />
        大熊猫（学名：Ailuropoda melanoleuca，英文名称：Giant panda），属于食肉目、熊科、熊猫亚科的一种哺乳动物，体色为黑白两色，它有着圆圆的脸颊，大大的黑眼圈，胖嘟嘟的身体，标志性的内八字的行走方式，也有解剖刀般锋利的爪子。是世界上最可爱的动物之一。
大熊猫已在地球上生存了至少800万年，被誉为“活化石”和“中国国宝”，世界自然基金会的形象大使，是世界生物多样性保护的旗舰物种。据第三次全国大熊猫野外种群调查，全世界野生大熊猫不足1600只，属于中国国家一级保护动物。截止2011年10月，全国圈养大熊猫数量为333只。大熊猫最初是吃肉的，经过进化，99%的食物都是竹子了，但牙齿和消化道还保持原样，仍然划分为食肉目。野外大熊猫的寿命为18～20岁，圈养状态下可以超过30岁。
大熊猫是中国特有物种，现存的主要栖息地是中国四川、陕西和甘肃的山区。
大熊猫（学名：Ailuropoda melanoleuca，英文名称：Giant panda），属于食肉目、熊科、熊猫亚科的一种哺乳动物，体色为黑白两色，它有着圆圆的脸颊，大大的黑眼圈，胖嘟嘟的身体，标志性的内八字的行走方式，也有解剖刀般锋利的爪子。是世界上最可爱的动物之一。
大熊猫已在地球上生存了至少800万年，被誉为“活化石”和“中国国宝”，世界自然基金会的形象大使，是世界生物多样性保护的旗舰物种。据第三次全国大熊猫野外种群调查，全世界野生大熊猫不足1600只，属于中国国家一级保护动物。截止2011年10月，全国圈养大熊猫数量为333只。大熊猫最初是吃肉的，经过进化，99%的食物都是竹子了，但牙齿和消化道还保持原样，仍然划分为食肉目。野外大熊猫的寿命为18～20岁，圈养状态下可以超过30岁。
    </div>
</body>
</html>
```



### 4:浮动2

#### 浮动布局 

 一列 固定宽度，宽度自适应 

```
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<style>
	#main{
		width:960px;
		height:400px;
		border:2px red solid;
		margin:0 auto;
	}
</style>
</head>

<body>
	<div id="main">
    </div>
</body>
</html>

```

  二列 固定宽度，宽度自适应，右列宽度自适应 

```
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<style>
	#main{
		width:960px;
		height:400px;
		border:2px red solid;
		margin:0 auto;
	}
	
	#left{
		width:30%;
		height:400px;
		border:2px blue solid;
		float:left;
	}
	#right{
		height:400px;
		border:2px yellow solid;
	}
</style>
</head>

<body>
	<div id="main">
    	<div id="left">
        </div>
        <div id="right">
        </div>
    </div>
</body>
</html>
```

  三列 中间列宽度自适应

```
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<style>
	#main{
		width:80%;
		height:400px;
		border:2px red solid;
		margin:0 auto;
	}
	
	#left{
		width:200px;
		height:600px;
		border:2px blue solid;
		float:left;
	}
	#left2{
		width:200px;
		height:600px;
		border:2px blue solid;
		float:left;
		clear:both;
	}
	#right{
		width:200px;
		height:400px;
		border:2px blue solid;
		float:right;
	}
	#center{
		margin:0 210px;
		height:400px;
		border:2px red solid;
	}
</style>
</head>

<body>
	<div id="main">
    	<div id="left">
        </div>
        <div id="right">
        </div>
        <div id="center">
        </div>
        <div id="left2">
        </div>
    </div>
</body>
</html>

```

#### 清除浮动

clear属性 ：

 该属性用于清除浮动 

 可选值： 

- left，强制元素定位在左浮元素下面的新行    
- right，强制元素定位在右浮元素下面的新行 

- both，强制元素定位在任何浮动元素下面的新行

-  none，默认值，不清除浮动


### 5:多列布局

#### 多列布局的概念及使用场景 

什么是多列布局：

创建多个列来对文本进行布局 

文本内容会自动一列一列的填充，且会自动保持每列的高度均衡一致 

扩展自盒子模型 

主要用于对大段文本的排列

#### 相关属性的设置

| 属性         | 初始值  | 描述                             |
| ------------ | ------- | -------------------------------- |
| column-count |         | 设置列的具体个数                 |
| column-width |         | 控制列的宽度                     |
| column-gap   | 1em     | 设置列之间的间隙                 |
| column-rule  |         | 设置列边的样式                   |
| column-fill  | balance | 规定如何对列进行填充             |
| columns      |         | column-count与column-width的简写 |

图片的大小与列不一致：使用自适应，设置其宽度为100% ，设置图片的绝对大小。

```
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<style>
	div{
		/*
		column-count:5;
		column-width:10px;*/
		column-gap:30px;
		column-rule:1px red solid;
		column-fill:balance;
		columns:5 400px;
	}
</style>
</head>

<body>
<div>
　　沿着荷塘，是一条曲折的小煤屑路。这是一条幽僻的路；白天也少人走，夜晚更加寂寞。荷塘四面，长着许多树，蓊蓊(wěng)郁郁的。路的一旁，是些杨柳，和一些不知道名字的树。没有月光的晚上，这路上阴森森的，有些怕人。今晚却很好，虽然月光也还是淡淡的。
　　路上只我一个人，背着手踱着。这一片天地好像是我的；我也像超出了平常的自己，到了另一世界里。我爱热闹，也爱冷静；爱群居，也爱独处。像今晚上，一个人在这苍茫的月下，什么都可以想，什么都可以不想，便觉是个自由的人。白天里一定要做的事，一定要说的话，现在都可不理。这是独处的妙处，我且受用这无边的荷香月色好了。
　　曲曲折折的荷塘上面，弥望的是田田的叶子。叶子出水很高，像亭亭的舞女的裙。层层的叶子中间，零星地点缀着些白花，有袅娜(niǎo,nuó)地开着的，有羞涩地打着朵儿的；正如一粒粒的明珠，又如碧天里的星星，又如刚出浴的美人。微风过处，送来缕缕清香，仿佛远处高楼上渺茫的歌声似的。这时候叶子与花也有一丝的颤动，像闪电一般，霎时传过荷塘的那边去了。叶子本是肩并肩密密地挨着，这便宛然有了一道凝碧的波痕。叶子底下是脉脉(mò)的流水，遮住了，不能见一些颜色；而叶子却更见风致了。
 <img src="img/bg.jpg" width="1000px"/>
　　月光如流水一般，静静地泻在这一片叶子和花上。薄薄的青雾浮起在荷塘里。叶子和花仿佛在牛乳中洗过一样；又像笼着轻纱的梦。虽然是满月，天上却有一层淡淡的云，所以不能朗照；但我以为这恰是到了好处——酣眠固不可少，小睡也别有风味的。月光是隔了树照过来的，高处丛生的灌木，落下参差的斑驳的黑影，峭楞楞如鬼一般；弯弯的杨柳的稀疏的倩影，却又像是画在荷叶上。塘中的月色并不均匀；但光与影有着和谐的旋律，如梵婀(ē)玲(英语violin小提琴的译音)上奏着的名曲。
　　荷塘的四面，远远近近，高高低低都是树，而杨柳最多。这些树将一片荷塘重重围住；只在小路一旁，漏着几段空隙，像是特为月光留下的。树色一例是阴阴的，乍看像一团烟雾；但杨柳的丰姿，便在烟雾里也辨得出。树梢上隐隐约约的是一带远山，只有些大意罢了。树缝里也漏着一两点路灯光，没精打采的，是渴睡人的眼。这时候最热闹的，要数树上的蝉声与水里的蛙声；但热闹是他们的，我什么也没有。
　　忽然想起采莲的事情来了。采莲是江南的旧俗，似乎很早就有，而六朝时为盛；从诗歌里可以约略知道。采莲的是少年的女子，她们是荡着小船，唱着艳歌去的。采莲人不用说很多，还有看采莲的人。那是一个热闹的季节，也是一个风流的季节。梁元帝《采莲赋》里说得好：
　　于是妖童媛(yuán)女，荡舟心许；鷁(yì)首徐回，兼传羽杯；欋(zhào)将移而藻挂，船欲动而萍开。尔其纤腰束素，迁延顾步；夏始春余，叶嫩花初，恐沾裳而浅笑，畏倾船而敛裾(jū)。
　　可见当时嬉游的光景了。这真是有趣的事，可惜我们现在早已无福消受了。
　　于是又记起《西洲曲》里的句子：
　　采莲南塘秋，莲花过人头；低头弄莲子，莲子清如水。今晚若有采莲人，这儿的莲花也算得“过人头”了；只不见一些流水的影子，是不行的。这令我到底惦着江南了。
　　这样想着，猛一抬头，不觉已是自己的门前；轻轻地推门进去，什么声息也没有，妻已睡熟好久了。
</div>
</body>
</html>
```



### 6:弹性盒布局1

#### 弹性盒布局的概念 

  其目的是提供一种更加高效的方式来对容 器中的元素进行布局、对齐和分配空间

  已经被主流浏览器所支持，可以在Web 应 用开发中使用

- 每个弹性框布局包含两个轴，弹性项目沿其依次排列的那根轴称为主轴(main axis)。垂直于主轴的那根轴称为侧轴(crossaxis)。
- 弹性容器的主轴起点(main start)/主轴终点(main end)和侧轴起点(crossstart)/侧轴终点(cross end)描述了弹性项目排布的起点与终点。它们具体取决于弹性容器的主轴与侧轴中，由writing-mode 确立的方向（从左到右、从右到左，等等）。
- 根据弹性容器的主轴与侧轴，弹性项目的宽和高中，对应主轴的称为主轴尺寸(main size)，对应侧轴的称为侧轴尺寸(cross size)。
  

#### 容器相关属性的设置

display：flex | inline-flex
将元素定义为弹性容器，其子元素则成为弹性项目。值 flex 使弹性容器成为块级元素。值 inline-flex 使弹性容器成为单个不可分的行内级元素。

flex-direction： row | row-reverse | column | column-reverse
该属性指定了内部元素是如何在 flex 容器中布局的，定义了主轴的方向(正方向或反方向)。

row和row-reverse表示主轴的方向为水平轴，其轴方向受容器文本方向影响。当direction属性为ltr时，row表示从左到右定向的水平轴，而 row-reverse 表示从右到左; 如果 direction 属性是 rtl，row表示从右到左定向的轴，而 row-reverse 表示从左到右。
column表示主轴方向为垂直轴

flex-wrap：nowrap | wrap | wrap-reverse
用于指定Flex子项是否换行

nowrap表示元素被放在一行，不换行，这可能导致溢出 flex 容器，为默认值。wrap表示换行。而wrap-reverse表示垂向上行排列的方向反转

flex-flow：<'flex-direction'> || <'flex-wrap'>
其是flex-direction 和 flex-wrap 的简写

element {
  flex-flow: column-reverse wrap;
}

justify-content：flex-start | flex-end | center |space-between | space-around
用于指定主轴(水平方向)上Flex子项的对齐方式

  flex-start表示与行的起始位置对齐；flex-end表示与行的结束位置对齐；center表示与行中间对齐；space-between表示两端对齐，中间间距相等。要注意特殊情况，当剩余空间为负数或者只有一个项时，效果等同于flex-start；space-around表示间距相等，中间间距是两端间距的2倍。要注意特殊情况，当剩余空间为负数或者只有一个项时，效果等同于center。

align-items：stretch | flex-start | flex-end | center | baseline
用于指定侧轴(垂直方向)上Flex子项的对齐方式

  stretch表示弹性元素被在侧轴方向被拉伸到与容器相同的高度或宽度（默认值，当        项目未设置高度或为auto时被拉伸）；flex-start表示与侧轴开始位置对齐；flex-end表示与侧轴的结束位置对齐；center表示与侧轴中间对齐；baseline表示基线对齐，当行内轴与侧轴在同一线上，即所有Flex子项的基线在同一线上时，效果等同于flex-start

align-content：flex-start | flex-end | center | space-between | space-around | stretch
  该属性只作用于多行的情况下，用于多行的对齐方式

   stretch表示拉伸所有行来填满剩余空间。剩余空间平均的分配给每一行；flex-start表示各行与侧轴开始位置对齐，第一行紧靠侧轴开始边界，之后的每一行都紧靠前面一行；flex-end表示各行与侧轴的结束位置对齐，最后一行紧靠侧轴结束边界，之后的每一行都紧靠前面一行；center表示各行与侧轴中间对其；space-between表示两端对齐，中间间距相等。要注意特殊情况，当剩余空间为负数时，效果等同于flex-start；space-around表示各行之间间距相等，中间间距是两端间距的2倍。要注意特殊情况，当剩余空间为负数时，效果等同于center；

```
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<style type="text/css">
	#container{
		display:flex;
		flex-direction:row;
		border:1px red solid;
		width:600px;
		height:500px;
		flex-wrap:wrap;
		justify-content:space-around;
		align-items:baseline;
		align-content:space-around;
	}
	.item{
		border:1px blue solid;
		width:100px;
		/*height:100px;*/
	}
</style>
</head>

<body>
	<div id="container">
    	<div class="item">1
        </div>
        <div class="item">2
        </div>
        <div class="item">3
        </div>
        <div class="item">4
        </div>
        <div class="item">5
        </div>
        <div class="item">6
        </div>
        <div class="item">7
        </div>
        <div class="item">8
        </div>
        <div class="item">9
        </div>
        <div class="item">10
        </div>
    </div>
</body>
</html>

```



### 7:弹性盒布局2

条目相关属性的设置：

| 属性        | 描述                                                         |
| ----------- | ------------------------------------------------------------ |
| order       | 指定条目的顺序，值是整数，默认是0                            |
| flex-grow   | 指定条目的放大比例，其决定了条目占用剩余空间的比例，值是 整数，默认是0，不进行放大 |
| flex-basis  | 与width和height属性相同，用来指定条目大小                    |
| flex-shrink | 指定条目的缩小比例，其决定了条目相对容其他条目在空间不足 时自动收缩，值是整数，默认是1，设置为0则不收缩 |
| flex        | flex-grow、flex-shrink和flex-basis的简写                     |
| align-self  | 指定条目自身的对齐方式                                       |

align-self属性
可选值： 

- auto：默认值,条目对齐方式会根据其容器alignitems来决定  
- flex-start:条目与容器侧轴开始处对齐 
- flex-end:条目与容器侧轴结束处对齐 
- center:条目与容器侧轴中间处对齐 
- baseline:条目与文本基线对齐 
- stretch:条目拉伸填满容器的长度或宽度

```
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<style type="text/css">
	#container{
		display:flex;
		flex-direction:row;
		border:1px red solid;
		width:600px;
		height:500px;
		flex-wrap:nowrap;
		justify-content:space-around;
		align-items:flex-start;
		align-content:space-around;
	}
	.item{
		border:1px blue solid;
		width:100px;
		/*height:100px;*/
	}
	
	#item1{
		order:3;
	}
	#item2{
		order:-2;
		flex-grow:2;
		font-size:40px;
		align-self:baseline;
	}
	#item3{
		order:-3;
		flex-grow:2;
		/*flex-basis:200px;
		flex-shrink:0;*/
		flex-shrink:2;
		align-self:baseline
	}
</style>
</head>

<body>
	<div id="container">
    	<div class="item" id="item1">1
        </div>
        <div class="item" id="item2">2
        </div>
        <div class="item" id="item3">3
        </div>
        <div class="item" id="item4">4
        </div>
        <div class="item" id="item5">5
        </div>
        <div class="item">6
        </div>
        <div class="item">7
        </div>
        <div class="item">8
        </div>
        <div class="item">9
        </div>
        <div class="item">10
        </div>
    </div>
</body>
</html>

```



### 8:网格布局1

#### 网格布局的概念 

  将页面在二维平面上分割成很多个内容块， 这些内容块都占据自己的区域，可以将这 些区域想像成是一个虚拟的网格 。

  在网格布局模型中，网格容器的子元素能 任意定位在预先定义的弹性或固定尺寸的 网格中。

网格布局的优点 ：

  与表格布局相比，它在CSS而不是HTML中 实现 

  依赖于媒体查询实现响应式布局

在Chrome中可以启用

#### 相关属性的设置

  

| 属性                  | 描述                         |
| --------------------- | ---------------------------- |
| display               | 指定是否是网格容器           |
| grid-template-columns | 设置网格容器的列             |
| grid-template-rows    | 设置网格容器的行             |
| grid-template-areas   | 为单元格赋一个名字           |
| grid-auto-flow        | 设置单元格元素自动布局的方式 |
| align-items           | 设置单元格元素的对齐方式     |

display
可选值： grid，作为块级元素 

inline-grid，作为行级元素



grid-template-columns 

可选值： 数字，对列进行划分 

字符串与数字，对列划分并命名

repeat关键字，浏览器支持不好



grid-template-rows 

可选值： 数字，对行进行划分  字符串与数字，对行划分并命名   

repeat关键字，浏览器支持不好



grid-template-areas 

可选值： 多个空格隔开的字符串



grid-auto-flow
可选值： row，自动从左向右排列，一行放满则换行 

column，自动从上向下排列，一列放满则换列



align-items
可选值： stretch，默认值，扩展单元格元素以填充单元格定义的空间 

start，根据单元格元素的内容从起始处进行扩展 

end，根据单元格元素的内容从结束处进行扩展 

center，根据单元格元素的内容居中显示在单元格中

### 9:网格布局2

单元格相关属性的设置:

 

| 属性             | 描述               |
| ---------------- | ------------------ |
| grid-row         | 设置占用的行       |
| grid-row-start   | 设置起始行         |
| grid-row-end     | 设置起始列         |
| grid-column      | 设置占用的列       |
| grid-colum-start | 设置起始列         |
| grid-colum-end   | 设置结束列         |
| grid-area        | 指定占用的一个区域 |

grid-row
可选值： 

数字，占有哪一行 

数字1 / 数字2，从起始行到结束行(不包括) 

数字1/span 数字2，从起始行跨指定数量的行 

字符串 

字符串1/字符串2

grid-area
可选值:row-start / column-start / row-end / columnend，占用区域根据行与列的起始与结束位置设定 

字符串，其值与grid-template-areas中指定的值对应