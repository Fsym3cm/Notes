# IO与NIO

### 一，IO流总结

1. #### 按操作方式分类结构图

   ![](Photo/IO1.png)

2. #### 按操作对象分类结构图

   ![](Photo/IO2.PNG)

### 二，IO流体系总结

1. #### IO流的分类

   - 按照流的流向分，可以分为输入流和输出流。
   - 按照操作单元划分，可以划分为字节流和字符流。
   - 按照流的角色划分为节点流和处理流。

2. #### 流的原理浅析

   IO流共涉及40多个类，这些类看上去很杂乱无章，但实际上很有规整，而且彼此之间存在非常紧密的联系，IO流的40多个类都是从如下4个抽象基类中派生出来的。

   - InputStream/Reader：所有的输入流的基类，前者是字节输入流，后者是字符输入流。
   - OutputStream/Writer：所有输出流的基类，前者是字节输出流，后者是字符输出流。

3. #### 常用的IO流的用法

### 三，IO面试题

#### 一，NIO概览

1. ##### NIO简介

   Java NIO是java 1.4之后新出的一套IO接口，NIO的N可以理解为Non-blocking，不单纯是New。

2. ##### NIO的特性以及与IO的区别

   - IO是面向流的，NIO是面向缓冲区的。
   - IO流是阻塞的，NIO流是不阻塞的。
   - NIO有选择器，而IO流没有。

3. ##### 读数据和写数据的方式

   - 从通道进行数据读取：创建一个缓冲区，然后通道读取数据。
   - 从通道进行数据写入：创建一个缓冲区，填充数据，并要求通道写入数据。

4. ##### NIO核心组件简单介绍

   - Channels
   - Buffers
   - Selectors

#### 二，NIO之Buffer(缓冲区)

1. ##### Buffer(缓冲区)介绍

   - Java NIO Buffers用于和NIO Channel交互。我们从Channel中读取数据到buffers里，从Buffer把数据写入到Channels。
   - Buffer本质上就是一块内存区。
   - 一个Buffer有三个属性是必须掌握的，分别是：capacity容量，position位置，limit限制。
     - capacity：含义与模式无关，Buffer的一个固定的大小值，Buffer满了需要将其清空才能再写。
     - position：含义取决于Buffer处在读模式还是写模式(初始值为0，写或者读操作的当前位置)
       - 写模式时，初始的position之为0，其值最大可为capacity - 1
       - 读模式时，position会被重置为0
     - limit：含义取决于Buffer处在读模式还是写模式(写limit = capacity，读limit等于最多可以读取到的数据)
       - 写模式时，limit等于Buffer的capacity
       - 读模式时，limit表示你最多能读到多少数据

2. ##### Buffer的常见方法

   - Buffer clear()
   - Buffer flip()
   - Buffer rewind()
   - Buffer position(int newPosition)

3. ##### Buffer的使用方式/方法介绍

   - 分配缓冲区(Allocating a Buffer)

     ```Java
     ByteBuffer buf = ByteBuffer.allocate(28);//以ByteBuffer为例子
     ```

   - 写入数据到缓冲区(Writing Date to a Buffer)

   **写入数据到Buffer有两种方法**

   1. 从Channel中写数据到Buffer

      ```java
      int bytesRead = inChannel.read(buf);//read into buffer
      ```

   2. 通过put写数据

      ```java
      buf.put(127);
      ```

4. ##### Buffer常用方法测试

   ```java
   public class ByteBufferMethods {
       public static void main(String[] args) {
   
           //分配缓冲区（Allocating a Buffer）
           ByteBuffer buffer = ByteBuffer.allocate(33);
           System.out.println("-------------Test reset-------------");
           //clear()方法，position将被设回0，limit被设置成 capacity的值
           buffer.clear();
           // 设置这个缓冲区的位置
           buffer.position(5);
   
           //将此缓冲区的标记设置在其位置。没有buffer.mark();这句话会报错
           buffer.mark();
           buffer.position(10);
           System.out.println("before reset:" + buffer);
           //将此缓冲区的位置重置为先前标记的位置。（buffer.position(5)）
           buffer.reset();
           System.out.println("after reset:" + buffer);
   
           System.out.println("-------------Test rewind-------------");
           buffer.clear();
           buffer.position(10);
           //返回此缓冲区的限制。
           buffer.limit(15);
           System.out.println("before rewind:" + buffer);
           //把position设为0，mark设为-1，不改变limit的值
           buffer.rewind();
           System.out.println("before rewind:" + buffer);
   
           System.out.println("-------------Test compact-------------");
           buffer.clear();
           buffer.put("abcd".getBytes());
           System.out.println("before compact:" + buffer);
           System.out.println(new String(buffer.array()));
           // limit = position;position = 0;mark = -1; 翻转，也就是让flip之后的position到limit这块区域变成之前的0到position这块，
           // 翻转就是将一个处于存数据状态的缓冲区变为一个处于准备取数据的状态
           buffer.flip();
           System.out.println("after flip:" + buffer);
           //get()方法：相对读，从position位置读取一个byte，并将position + 1，为下次读写作准备
           System.out.println((char) buffer.get());
           System.out.println((char) buffer.get());
           System.out.println((char) buffer.get());
           System.out.println("after three gets:" + buffer);
           System.out.println("\t" + new String(buffer.array()));
           // 把从position到limit中的内容移到0到limit-position的区域内，position和limit的取值也分别变成limit - position、capacity。
           // 如果先将positon设置到limit，再compact，那么相当于clear()
           buffer.compact();
           System.out.println("after compact:" + buffer);
           System.out.println("\t" + new String(buffer.array()));
   
           System.out.println("-------------Test get-------------");
           buffer = ByteBuffer.allocate(32);
           buffer.put((byte) 'a').put((byte) 'b').put((byte) 'c').put((byte) 'd').put((byte) 'e').put((byte) 'f');
           System.out.println("before flip():" + buffer);
           // 转换为读取模式
           buffer.flip();
           System.out.println("before get():" + buffer);
           System.out.println((char) buffer.get());
           System.out.println("after get():" + buffer);
           // get(index)不影响position的值
           System.out.println((char) buffer.get(2));
           System.out.println("after get(index):" + buffer);
           byte[] dst = new byte[10];
           buffer.get(dst, 0, 2);
           System.out.println("after get(dst, 0, 2):" + buffer);
           System.out.println("\t dst:" + new String(dst));
           System.out.println("buffer now is:" + buffer);
           System.out.println("\t" + new String(buffer.array()));
   
           System.out.println("-------------Test put-------------");
           ByteBuffer bb = ByteBuffer.allocate(32);
           System.out.println("before put(byte):" + bb);
           System.out.println("after put(byte):" + bb.put((byte) 'z'));
           System.out.println("\t" + bb.put(2, (byte) 'c'));
           // put(2,(byte) 'c')不改变position的位置
           System.out.println("after put(2,(byte) 'c'):" + bb);
           System.out.println("\t" + new String(bb.array()));
           // 这里的buffer是 abcdef[pos=3 lim=6 cap=32]
           bb.put(buffer);
           System.out.println("after put(buffer):" + bb);
           System.out.println("\t" + new String(bb.array()));
       }
   }
   ```

#### 三，NIO之Channel(通道)

1. ##### Channel(通道)介绍

   - 通常来说NIO中的所有IO都是从Channel(通道)开始的。
   - NIO Channel(通道)与流的区别。
     - 通道可以读也可以写，流一般来说是单向的(只能读或者写，所以之前我们使用流进行IO操作时候需要分别创建一个输入流和输出流)。
     - 通道可以异步读写。
     - 通道总是基于缓冲区Buffer来读写。

2. ##### FileChannel(用于文件的数据读写)

   ```java
   public class FileChannelTxt {
       public static void main(String[] args) throws IOException {
           // 创建File通道
           RandomAccessFile aFile  = new RandomAccessFile("src/data/nio-data", "rw");
           FileChannel inChannel = aFile.getChannel();
           // 读数据
           ByteBuffer buf = ByteBuffer.allocate(48);
           int bytesRead = inChannel.read(buf);
           // 写数据
           String newData = "New String to write to file..." + System.currentTimeMillis();
           ByteBuffer buf2 = ByteBuffer.allocate(48);
           buf2.clear();
           buf2.put(newData.getBytes());
           buf2.flip();
           inChannel.write(buf2);
           /*while(buf2.hasRemaining()){
               inChannel.write(buf2);
           }*/
           while(bytesRead != -1){
               System.out.println("Read" + bytesRead);
               //Buffer有两种模式，写模式和读模式。在写模式下调用flip()之后，Buffer从写模式变成读模式
               buf.flip();
               //如果还有未读内容
               while (buf.hasRemaining()){
                   System.out.print((char) buf.get());
               }
               buf.clear();
               bytesRead = inChannel.read(buf);
           }
           aFile.close();
       }
   }
   
   ```

3. ##### DatagramChannel(用于UDP的数据读写)

   ```java
   public class DatagramChannelSender {
       public static void main(String[] args) throws IOException {
   
           DatagramChannel channel = DatagramChannel.open();
           ByteBuffer buffer = ByteBuffer.wrap("下雨的夜晚很安静".getBytes("utf-8"));
           int send = channel.send(buffer, new InetSocketAddress("localhost",10022));
           System.out.println(send);
           channel.close();
       }
   }
   
   public class DatagramChannelReveiver {
       public static void main(String[] args) throws IOException{
           DatagramChannel channel =DatagramChannel.open();
           channel.socket().bind(new InetSocketAddress(10022));
   
           ByteBuffer buffer = ByteBuffer.allocate(60);
           while(channel.receive(buffer) == null){
               try {
                   Thread.sleep(1000);
               } catch (InterruptedException e) {
                   e.printStackTrace();
               }
           }
   
           buffer.flip();
           String recStr = Charset.forName("utf-8").newDecoder().decode(buffer).toString();
           System.out.println(recStr);
   
           channel.close();
       }
   }
   ```

4. ##### SocketChannel(用于TCP的数据读写，一般是客户端实现)

   ```java
   public class WebClient {
       public static void main(String[] args) throws IOException {
           // 创建Socket通道
           SocketChannel socketChannel = SocketChannel.open();
           socketChannel.connect(new InetSocketAddress("127.0.0.1", 3333));
           // 创建写数据缓存区对象
           ByteBuffer writeBuffer  = ByteBuffer.allocate(128);
           writeBuffer.put("hello WebServer this is from WebClient".getBytes());
           writeBuffer.flip();
           socketChannel.write(writeBuffer);
   
           // 创建读数据缓存区对象
           ByteBuffer readBuffer = ByteBuffer.allocate(128);
           socketChannel.read(readBuffer);
   
           StringBuffer stringBuffer= new StringBuffer();
           readBuffer.flip();
           while(readBuffer.hasRemaining()){
               stringBuffer.append((char) readBuffer.get());
           }
           System.out.println("从服务器端接收到的数据" + stringBuffer);
           socketChannel.close();
       }
   }
   ```

5. ##### ServerSocketChannel(允许我们监听TCP链接请求，每个请求会创建一个SocketChannel，一般是服务器实现)

   ```java
   public class WebServer {
       public static void main(String[] args) throws IOException {
           try {
               ServerSocketChannel ssc = ServerSocketChannel.open();
               ssc.socket().bind(new InetSocketAddress("127.0.0.1", 3333));
               SocketChannel socketChannel = ssc.accept();
               // 创建写数据缓存区对象
               ByteBuffer writeBuffer  = ByteBuffer.allocate(128);
               writeBuffer.put("hello WebClient  this is from WebServer".getBytes());
               writeBuffer.flip();
               socketChannel.write(writeBuffer);
               // 创建读数据缓存区对象
               ByteBuffer readBuffer = ByteBuffer.allocate(128);
               socketChannel.read(readBuffer);
               StringBuffer stringBuffer= new StringBuffer();
               readBuffer.flip();
               while(readBuffer.hasRemaining()){
                   stringBuffer.append((char) readBuffer.get());
               }
               System.out.println("从客户端端接收到的数据" + stringBuffer);
               socketChannel.close();
               ssc.close();
           } catch (IOException e){
               e.printStackTrace();
           }
       }
   } 
   ```

6. ##### Scatter / Gather

   - Scatter：从一个Channel读取的信息分散到N个缓存区中。
   - Gather：将N个Buffer里面的内容按照顺序发生到一个Channel。

7. ##### 通道之间的数据传输

   - 在NIO中如果一个Channel是FileChannel类型的，那么他可以直接把数据传输到另一个channel。
   - transferFrom()：transferFrom方法把数据从通道源传输到FileChannel。
   - transferTo()：transferTo方法把FileChannel数据传输到另一个Channel。

#### 四，NIO之Selector(选择器)

1. ##### Selector(选择器)介绍

   - Selector一般称为选择器，他是NIO核心组件中的一个，用于检测一个或多个NIO Channel的状态是否处于可读，可写。如此可以实现单线程管理多个Channels，也就是可以管理多个网络链接。
   - 使用Selector的好处在于使用更少的线程来就可以来处理通道了，相比使用多个线程，避免了线程上下文切换带来的开销。

2. ##### Select(选择器)的使用方法介绍

   - Selector的创建

     ```java
     Selector selector = Selector.open();
     ```

   - 注册Channel到Selector(Channel必须是非阻塞的)

     ```java
     channel.configureBlocking(false);
     SelectionKey key = channel.register(selector, Selectionkey.OP_READ);
     ```

   - SelectionKey介绍

     一个SelectionKey键表示了一个特定的通道对象和一个特定的选择器对象之间的注册关系。

   - 从Selector中选择Channel(Selecting Channels via a Selector)

     选择器维护注册过的通道集合，并且这种注册关系都被封装在SelectionKey当中。

   - 停止选择的方法

     weakup()方法和close()方法。

3. 模板代码

   ```java
   ServerSocketChannel ssc = ServerSocketChannel.open();
   ssc.socket().bind(new InetSocketAddress("localhost", 8080));
   ssc.configureBlocking(false);
   
   Selector selector = Selector.open();
   ssc.register(selector, SelectionKey.OP_ACCEPT);
   
   while(true) {
       int readyNum = selector.select();
       if (readyNum == 0) {
           continue;
       }
   
       Set<SelectionKey> selectedKeys = selector.selectedKeys();
       Iterator<SelectionKey> it = selectedKeys.iterator();
   
       while(it.hasNext()) {
           SelectionKey key = it.next();
   
           if(key.isAcceptable()) {
               // 接受连接
           } else if (key.isConnectable()) {  
               // 与远程服务器建立连接  
           } else if (key.isReadable()) {
               // 通道可读
           } else if (key.isWritable()) {
               // 通道可写
           }
   
           it.remove();
       }
   }
   ```

4. 客户端与服务端简单交互实例

   服务端：

   ```java
   public class WebServer {
       public static void main(String[] args) {
           try {
               ServerSocketChannel ssc = ServerSocketChannel.open();
               ssc.socket().bind(new InetSocketAddress("127.0.0.1", 8000));
               ssc.configureBlocking(false);
   
               Selector selector = Selector.open();
               // 注册 channel，并且指定感兴趣的事件是 Accept
               ssc.register(selector, SelectionKey.OP_ACCEPT);
   
               ByteBuffer readBuff = ByteBuffer.allocate(1024);
               ByteBuffer writeBuff = ByteBuffer.allocate(128);
               writeBuff.put("received".getBytes());
               writeBuff.flip();
   
               while (true) {
                   int nReady = selector.select();
                   Set<SelectionKey> keys = selector.selectedKeys();
                   Iterator<SelectionKey> it = keys.iterator();
   
                   while (it.hasNext()) {
                       SelectionKey key = it.next();
                       it.remove();
   
                       if (key.isAcceptable()) {
                           // 创建新的连接，并且把连接注册到selector上，而且，
                           // 声明这个channel只对读操作感兴趣。
                           SocketChannel socketChannel = ssc.accept();
                           socketChannel.configureBlocking(false);
                           socketChannel.register(selector, SelectionKey.OP_READ);
                       }
                       else if (key.isReadable()) {
                           SocketChannel socketChannel = (SocketChannel) key.channel();
                           readBuff.clear();
                           socketChannel.read(readBuff);
   
                           readBuff.flip();
                           System.out.println("received : " + new String(readBuff.array()));
                           key.interestOps(SelectionKey.OP_WRITE);
                       }
                       else if (key.isWritable()) {
                           writeBuff.rewind();
                           SocketChannel socketChannel = (SocketChannel) key.channel();
                           socketChannel.write(writeBuff);
                           key.interestOps(SelectionKey.OP_READ);
                       }
                   }
               }
           } catch (IOException e) {
               e.printStackTrace();
           }
       }
   }
   ```

   客户端：

   ```java
   public class WebClient {
       public static void main(String[] args) throws IOException {
           try {
               SocketChannel socketChannel = SocketChannel.open();
               socketChannel.connect(new InetSocketAddress("127.0.0.1", 8000));
   
               ByteBuffer writeBuffer = ByteBuffer.allocate(32);
               ByteBuffer readBuffer = ByteBuffer.allocate(32);
   
               writeBuffer.put("hello".getBytes());
               writeBuffer.flip();
   
               while (true) {
                   writeBuffer.rewind();
                   socketChannel.write(writeBuffer);
                   readBuffer.clear();
                   socketChannel.read(readBuffer);
               }
           } catch (IOException e) {
           }
       }
   }
   ```

   运行结果：

   先运行服务端，再运行客户端，服务端会不断收到客户端发送过来的消息。

   ```java
   received：hello
   received：hello
   received：hello
   received：hello
   received：hello
   ```

#### 五，NIO之path和Files

1. ##### 文件I/O基石(path)

   - 创建一个path
   - File和Path之间的转换，File和URI之间的转换
   - 获取Path的相关信息
   - 移除Path中的冗余项

2. ##### Files类

   - Files.exists()检测文件路径是否存在
   - Files.createFile()创建文件
   - Files.createDirectories()和Files.createDirectory()创建文件夹
   - Files.delete()方法，可以删除一个文件或目录
   - Files.copy()方法可以把一个文件从一个位置复制到另一个位置
   - 获取文件属性
   - 遍历文件夹
   - Files.walkFileTree()遍历整个目录

#### 六，NIO学习总结以及新特性介绍

##### 内存映射

这个功能主要是为了提高大文件的读写速度而设计的。内存映射文件能让你创建和修改那些大到无法读入内存的文件。有了内存映射文件，你就可以认为文件已经全部读进了内存，然后把它当成一个非常大的数组来访问了。将文件的一段区域映射到内存中，比传统的文件处理速度要快很多。内存映射文件它虽然最终也是要从磁盘读取数据，但是它并不需要将数据读取到OS内核缓冲区，而是直接将进程的用户私有地址空间中的一部分区域与文件对象建立起映射关系，就好像直接从内存中读，写文件一样，速度很快。

