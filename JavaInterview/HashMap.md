# `HashMap`

​		`HashMap`主要用来存放键值对，它基于哈希表的Map接口实现，是常用的Java集合之一。

​		`JDK1.8`之前`HashMap`由数组+链表组成，数组是`HashMap`的主体，链表则是为了解决哈希冲突而存在的(“拉链法”解决冲突)，`JDK1.8`以后在解决哈希冲突时有了较大的变化，当链表长度大于阀值(默认为8)时，将链表转化为红黑树(将链表转化成红黑树前会判断，如果当前数组的长度小于64，那么会选择先进行数组扩容，而不是转换为红黑树)，以减少搜索时间，具体可以参考`treeifyBin`方法。

### 底层数据结构分析

#### `JDK1.8`之前

​		`JDK1.8`之前`HashMap`底层是**数组加链表**结合在一起使用也就是**链表散列**。**`HashMap`通过Key的`hashCode`经过扰动函数处理后得到的hash值，然后通过`(n - 1) & hash`判断当前元素存放的位置(这里的n指的是数组的长度)，如果当前元素存在元素的话，就判断该元素与要存入的元素的hash值以及key是否相同，如果相同的话，直接覆盖，不相同就通过拉链法解决冲突。**

​		**所谓扰动函数指的就是`HashMap`的hash方法。使用hash方法也就是扰动函数是为了防止一些实现比较差的`hashCode()`方法，换句话说就是使用扰动函数之后可以减少碰撞。**

#### `JDK1.8` `HashMap`的hash方法源码：

`JDK1.8` 的hash方法相比于`JDK1.7` 方法更加简化但是原理不变。

```java
static final int hash(Object key) {
    int h;
     // key.hashCode()：返回散列值也就是hashcode
     // ^ ：按位异或
     // >>>: 无符号右移，忽略符号位，空位都以0补齐
    return (key == null) ? 0 : (h = key.hashCode()) ^ (h >>> 16);
}
```

`JDK1.7` 的hash方法源码。

```java
static int hash(int h) {
    // 此函数确保hashCode仅在以下方面有所不同
    // 每个位位置的常数倍数是有界的
    // 碰撞次数（默认情况下为8）。

    h ^= (h >>> 20) ^ (h >>> 12);
    return h ^ (h >>> 7) ^ (h >>> 4);
}
```

相对于`JDK1.8` 的hash方法，`JDK1.7` 的hash方法性能会稍差一点点，因为毕竟扰动了4次。

所谓**“拉链法”**就是：将数组和链表相结合。也就是说创建一个链表数组，数组中的每一格就是一个链表。若碰到hash冲突，就将冲突的值加到链表中即可。

![](Photo/ZipperMethod.png)

#### `JDK1.8` 之后

相比于之前的版本，`JDK1.8` 在解决哈希冲突时有了较大的变化，当链表长度大于阈值(默认为8)时，将链表转化为红黑树，以减少搜索时间。

![](Photo/RedBlackTree.png)

**类的属性：**

```java
public class HashMap<K,V> extends AbstractMap<K,V>
    implements Map<K,V>, Cloneable, Serializable {
	//序列号
    private static final long serialVersionUID = 362498820763181265L;
	// 默认的初始容量是16
    static final int DEFAULT_INITIAL_CAPACITY = 1 << 4; // aka 16
	// 最大容量
    static final int MAXIMUM_CAPACITY = 1 << 30;
	// 默认的填充因子
    static final float DEFAULT_LOAD_FACTOR = 0.75f;
	// 当桶(bucket)上的结点数大于这个值时会转成红黑树
    static final int TREEIFY_THRESHOLD = 8;
	// 当桶(bucket)上的结点数小于这个值时树转链表
    static final int UNTREEIFY_THRESHOLD = 6;
    // 桶中结构转化为红黑树对应的table的最小大小
    static final int MIN_TREEIFY_CAPACITY = 64;
    
    // 存储元素的数组，总是2的幂次倍
    transient Node<k,v>[] table; 
    // 存放具体元素的集
    transient Set<map.entry<k,v>> entrySet;
    // 存放元素的个数，注意这个不等于数组的长度。
    transient int size;
    // 每次扩容和更改map结构的计数器
    transient int modCount;   
    // 临界值 当实际大小(容量*填充因子)超过临界值时，会进行扩容
    int threshold;
    // 加载因子
    final float loadFactor;
}
```

- **`loadFactor`加载因子**

  `loadfactor`加载因子是控制数组存放数据的疏密程度，`loadfactor`越趋近与1，那么数组中存放的数据(entry)也就越多，越密，也就是会让链表的长度增加，`loadfactor`越小，越趋近于0，数组中存放的数据(entry)也就越少，越稀疏。

- **`loadFactor`加载因子太大导致查找元素效率低，太小导致数组利用率低，存放的数据会很分散。`loadFactor`的默认值为`0.75f`，是官方给出的一个比较好的临界值。**

  给定的默认容量为16，负载因子为0.75。Map在使用过程中不断的往里面存放数据，当数据达到了16 * 0.75 = 12就需要将当前16的容量进行扩容，而扩容这个过程涉及到了rehash，复制数据等操作，所以非常消耗性能。

- `threhold`

  `threhold = capacity * loadFactor`，当Size >= threshold的时候，那么就要考虑对数组的扩增，也就是说，这个意思就是**衡量数组是否需要扩增的一个标准**。

**Node节点类源码：**

```java
static class Node<K,V> implements Map.Entry<K,V> {
    	// 哈希值，存放元素到hashmap中时用来与其他元素hash值比较
        final int hash;
        final K key; //键
        V value;//值
        Node<K,V> next;//指向下一个节点

        Node(int hash, K key, V value, Node<K,V> next) {
            this.hash = hash;
            this.key = key;
            this.value = value;
            this.next = next;
        }

        public final K getKey()        { return key; }
        public final V getValue()      { return value; }
        public final String toString() { return key + "=" + value; }
		// 重写hashCode()方法
        public final int hashCode() {
            return Objects.hashCode(key) ^ Objects.hashCode(value);
        }

        public final V setValue(V newValue) {
            V oldValue = value;
            value = newValue;
            return oldValue;
        }

        public final boolean equals(Object o) {
            if (o == this)
                return true;
            if (o instanceof Map.Entry) {
                Map.Entry<?,?> e = (Map.Entry<?,?>)o;
                if (Objects.equals(key, e.getKey()) &&
                    Objects.equals(value, e.getValue()))
                    return true;
            }
            return false;
        }
    }
```

**`TreeNode`节点类源码：**

```java
static final class TreeNode<K,V> extends LinkedHashMap.Entry<K,V> {
        TreeNode<K,V> parent;  // 红黑树链接
        TreeNode<K,V> left;
        TreeNode<K,V> right;
        TreeNode<K,V> prev;    // 删除后需要取消链接
        boolean red;           // 判断颜色
        TreeNode(int hash, K key, V val, Node<K,V> next) {
            super(hash, key, val, next);
        }

        // 返回根节点
        final TreeNode<K,V> root() {
        	// this指代该类同时声明p，同时指行无限循环
            for (TreeNode<K,V> r = this, p;;) {
            	//当r.parent为空时，则r为根节点否则，将判断节点向上移动。
                if ((p = r.parent) == null)
                    return r;
                r = p;
            }
        }
```

### `HashMap`源码分析

#### 构造方法

`HashMap`中有四个构造方法，它们分别如下：

```java
// 构造一个具有指定“容量大小”和“加载因子”的构造函数
public HashMap(int initialCapacity, float loadFactor) {
    if (initialCapacity < 0)
        throw new IllegalArgumentException("Illegal initial capacity: " +
                                           initialCapacity);
    if (initialCapacity > MAXIMUM_CAPACITY)
        initialCapacity = MAXIMUM_CAPACITY;
    if (loadFactor <= 0 || Float.isNaN(loadFactor))
        throw new IllegalArgumentException("Illegal load factor: " +
                                           loadFactor);
    this.loadFactor = loadFactor;
    this.threshold = tableSizeFor(initialCapacity);
}

// 指定“容量大小”的构造函数
public HashMap(int initialCapacity) {
    this(initialCapacity, DEFAULT_LOAD_FACTOR);
}

// 默认构造方法
public HashMap() {
    this.loadFactor = DEFAULT_LOAD_FACTOR; // 所有其他字段默认
}

// 包含另一个“Map”的构造函数
public HashMap(Map<? extends K, ? extends V> m) {
    this.loadFactor = DEFAULT_LOAD_FACTOR;
    putMapEntries(m, false);//下面会分析到这个方法
}
```

#### `putMapEntries`方法：

```java
final void putMapEntries(Map<? extends K, ? extends V> m, boolean evict) {
    int s = m.size();
    if (s > 0) {
        //判断table是否初始化
        if (table == null) { // pre-size
            //未初始化：s为m的实际元素个数
            float ft = ((float)s / loadFactor) + 1.0F;
            // 如果ft小于容量则t = ft否则 t = MAXIMUM_CAPACITY(最大容量)
            int t = ((ft < (float)MAXIMUM_CAPACITY) ?
                     (int)ft : MAXIMUM_CAPACITY);
            // 如果t大于阈值则初始化阈值
            if (t > threshold)
                // 对于给定的目标容量，返回两倍大小的幂。
                threshold = tableSizeFor(t);
        }
        // 已初始化，并且m元素个数大于阈值，进行扩容处理
        else if (s > threshold)
            resize();
        // 将m中的所有元素添加至HashMap中
        for (Map.Entry<? extends K, ? extends V> e : m.entrySet()) {
            K key = e.getKey();
            V value = e.getValue();
            putVal(hash(key), key, value, false, evict);
        }
    }
}
```

#### put方法

`HashMap`只提供了put用于添加元素，`putVal`方法只是给put方法调用的一个方法，并没有提供给用户使用。

**对`putVal`方法添加元素的分析如下：**

- 如果定位到的数组位置没有元素就直接插入。
- 如果定位到的数组位置有元素就和要插入的key比较，如果Key相同就直接覆盖，如果Key不相同，就判断p是否是一个树节点，如果是就调用`e = ((TreeNode<K, V>)p).putTreeVal(this, tab, hash, key, value)`将元素添加进入。如果不是就遍历链表插入(插入的是链表尾部)。

![](Photo/Put.png)

```java
public V put(K key, V value) {
    return putVal(hash(key), key, value, false, true);
}

final V putVal(int hash, K key, V value, boolean onlyIfAbsent,
               boolean evict) {
    Node<K,V>[] tab; Node<K,V> p; int n, i;
    // table未初始化或者长度为0，进行扩容
    if ((tab = table) == null || (n = tab.length) == 0)
        n = (tab = resize()).length;
    // (n - 1) & hash 确定元素存放在哪个桶中，桶为空，新生成结点放入桶中(此时，这个结点是放在数组中)
    if ((p = tab[i = (n - 1) & hash]) == null)
        tab[i] = newNode(hash, key, value, null);
    else { //桶中已经存在元素
        Node<K,V> e; K k;
        // 比较桶中第一个元素(数组中的结点)的hash值相等，key相等
        if (p.hash == hash &&
            ((k = p.key) == key || (key != null && key.equals(k))))
             // 将第一个元素赋值给e，用e来记录
            e = p;
        // hash值不相等，即key不相等；为红黑树结点
        else if (p instanceof TreeNode)
             // 放入树中
            e = ((TreeNode<K,V>)p).putTreeVal(this, tab, hash, key, value);
        else { //为链表结点
             // 在链表最末插入结点
            for (int binCount = 0; ; ++binCount) {
                // 到达链表的尾部
                if ((e = p.next) == null) {
                    // 在尾部插入新结点
                    p.next = newNode(hash, key, value, null);
                    // 结点数量达到阈值，转化为红黑树
                    if (binCount >= TREEIFY_THRESHOLD - 1) // -1 for 1st
                        treeifyBin(tab, hash);
                    // 跳出循环
                    break;
                }
                // 判断链表中结点的key值与插入的元素的key值是否相等
                if (e.hash == hash &&
                    ((k = e.key) == key || (key != null && key.equals(k))))
                    // 相等，跳出循环
                    break;
                // 用于遍历桶中的链表，与前面的e = p.next组合，可以遍历链表
                p = e;
            }
        }
        // 表示在桶中找到key值、hash值与插入元素相等的结点
        if (e != null) { // existing mapping for key
            // 记录e的value
            V oldValue = e.value;
            // onlyIfAbsent为false或者旧值为null
            if (!onlyIfAbsent || oldValue == null)
                //用新值替换旧值
                e.value = value;
            // 访问后回调
            afterNodeAccess(e);
            // 返回旧值
            return oldValue;
        }
    }
    // 结构性修改
    ++modCount;
    // 实际大小大于阈值则扩容
    if (++size > threshold)
        resize();
    // 插入后回调
    afterNodeInsertion(evict);
    return null;
}
//允许LinkedHashMap后处理的回调
```

### `JDK1.7` put方法的源码

**对于put方法的分析如下：**

- 如果定位到的数组位置没有元素就直接插入。
- 如果定位到的数组位置有元素，遍历以这个元素为头结点的链表，依次和插入的Key比较，如果Key相同就直接覆盖，不同就采用头插法插入元素。

```java
public V put(K key, V value)
    if (table == EMPTY_TABLE) { 
    inflateTable(threshold); 
    }  
    if (key == null)
        return putForNullKey(value);
    int hash = hash(key);
    int i = indexFor(hash, table.length);
    for (Entry<K,V> e = table[i]; e != null; e = e.next) { // 先遍历
        Object k;
        if (e.hash == hash && ((k = e.key) == key || key.equals(k))) {
            V oldValue = e.value;
            e.value = value;
            e.recordAccess(this);
            return oldValue; 
        }
    }

    modCount++;
    addEntry(hash, key, value, i);  // 再插入
    return null;
}
```

#### get方法

```java
public V get(Object key) {
    Node<K,V> e;
    return (e = getNode(hash(key), key)) == null ? null : e.value;
}

final Node<K,V> getNode(int hash, Object key) {
    Node<K,V>[] tab; Node<K,V> first, e; int n; K k;
    if ((tab = table) != null && (n = tab.length) > 0 &&
        (first = tab[(n - 1) & hash]) != null) {
        // 数组元素相等
        if (first.hash == hash && // always check first node
            ((k = first.key) == key || (key != null && key.equals(k))))
            return first;
        // 桶中不止一个节点
        if ((e = first.next) != null) {
            // 在树中get
            if (first instanceof TreeNode)
                return ((TreeNode<K,V>)first).getTreeNode(hash, key);
            // 在链表中get
            do {
                if (e.hash == hash &&
                    ((k = e.key) == key || (key != null && key.equals(k))))
                    return e;
            } while ((e = e.next) != null);
        }
    }
    return null;
}
```

#### resize方法

进行扩容，会伴随这一次重新hash分配，并且会遍历hash表中所有的元素，是非常耗时的。在编写程序中，要尽量避免resize。

```java
final Node<K,V>[] resize() {
    Node<K,V>[] oldTab = table;
    int oldCap = (oldTab == null) ? 0 : oldTab.length;
    int oldThr = threshold;
    int newCap, newThr = 0;
    if (oldCap > 0) {
        // 超过最大值就不再扩充了，就只好随你碰撞去吧
        if (oldCap >= MAXIMUM_CAPACITY) {
            threshold = Integer.MAX_VALUE;
            return oldTab;
        }
        // 没超过最大值，就扩充为原来的2倍
        else if ((newCap = oldCap << 1) < MAXIMUM_CAPACITY && oldCap >= DEFAULT_INITIAL_CAPACITY)
            newThr = oldThr << 1; // double threshold
    }
    else if (oldThr > 0) // initial capacity was placed in threshold
        newCap = oldThr;
    else { 
        // signifies using defaults
        newCap = DEFAULT_INITIAL_CAPACITY;
        newThr = (int)(DEFAULT_LOAD_FACTOR * DEFAULT_INITIAL_CAPACITY);
    }
    // 计算新的resize上限
    if (newThr == 0) {
        float ft = (float)newCap * loadFactor;
        newThr = (newCap < MAXIMUM_CAPACITY && ft < (float)MAXIMUM_CAPACITY ? (int)ft : Integer.MAX_VALUE);
    }
    threshold = newThr;
    @SuppressWarnings({"rawtypes","unchecked"})
        Node<K,V>[] newTab = (Node<K,V>[])new Node[newCap];
    table = newTab;
    if (oldTab != null) {
        // 把每个bucket都移动到新的buckets中
        for (int j = 0; j < oldCap; ++j) {
            Node<K,V> e;
            if ((e = oldTab[j]) != null) {
                oldTab[j] = null;
                if (e.next == null)
                    newTab[e.hash & (newCap - 1)] = e;
                else if (e instanceof TreeNode)
                    ((TreeNode<K,V>)e).split(this, newTab, j, oldCap);
                else { 
                    Node<K,V> loHead = null, loTail = null;
                    Node<K,V> hiHead = null, hiTail = null;
                    Node<K,V> next;
                    do {
                        next = e.next;
                        // 原索引
                        if ((e.hash & oldCap) == 0) {
                            if (loTail == null)
                                loHead = e;
                            else
                                loTail.next = e;
                            loTail = e;
                        }
                        // 原索引+oldCap
                        else {
                            if (hiTail == null)
                                hiHead = e;
                            else
                                hiTail.next = e;
                            hiTail = e;
                        }
                    } while ((e = next) != null);
                    // 原索引放到bucket里
                    if (loTail != null) {
                        loTail.next = null;
                        newTab[j] = loHead;
                    }
                    // 原索引+oldCap放到bucket里
                    if (hiTail != null) {
                        hiTail.next = null;
                        newTab[j + oldCap] = hiHead;
                    }
                }
            }
        }
    }
    return newTab;
}
```

