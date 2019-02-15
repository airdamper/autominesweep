==[toc]



## 一.基本操作

### 1.界面
根据提示操作，一眼能看懂的都能用，一眼看不懂的基本用不上。
>主界面

![主界面](https://s2.ax1x.com/2019/02/14/kBr9dx.jpg)




























左侧数列菜单能用的只有`我的脚本`和`快速引导`。
- 快速引导：新建脚本的地方，有一个最近打开的列表。
    + 新建脚本：新建页，插入命令完成脚本制作。
    + 录制脚本：弹出录制界面。
    + 第一次写脚本：有一个新手引导教程，按步骤提示插入命令过程。
- 我的脚本：存放已经写好的脚本位置，也可以导入其他人的脚本，样例脚本也在这里。
### 2.录制
>点击录制操作鼠标键盘，自动保存操作动作。完成简单的重复操作比较实用。

![录制界面](https://s2.ax1x.com/2019/02/14/kBrpe1.jpg)












<br/>录制内容冗余命令很多，延时也比较长，可以在录制后适当优化。
*提示：录制时注意动作的重复衔接。*



### 3.UI精灵
用来定制用户配置界面，以控件的形式使用，控件包含属性和事件，主要用于增加体验感，一般用不上。<br/>
针对这部分内容可以看自带样例脚本：`按键精灵脚本界面演示<一键启动>`<br/>
正常使用如果需要做一些简单的初始化设置，可以通过`UserVar`来实现。可以查看样例脚本：`自动喊话`

>自动喊话用户自定义界面

![自定义界面](https://s2.ax1x.com/2019/02/15/kDghjO.jpg)






















## 二.命令功能

q语言，查看比较方便，有点像注释。<br/>
通过插入的形式添加,双击可以编辑,编辑还是代码样式的。
>脚本编辑页面

![命令界面](https://s2.ax1x.com/2019/02/14/kBDuPU.jpg)



























- 命令：可用命令内容，可以进行插入操作
    + 基本命令：常规输入动作。
    + 全部命令：自带命令库。
- 脚本页：显示编辑脚本的地方。
    + 普通：q语言显示，可以当做注释看。
    + 源文件：真正的命令代码。
- 帮助：选择某个命令式会有具体帮助信息和样例展示。







### 基础语法
弱语言，每个函数基本都会有使用的样例，照着写就可以了。

没什么要求，没有语法错误都就可以运行。*尽量避免变量同名，有时候可能会因为变量重名出现bug。*

#### 变量定义
- 一般变量：直接用就行了，不需要定义。

- 特殊变量：如可变数组什么的要使用一些关键字`ReDim`修饰。

>具体可以在`按键精灵 - 全部命令 > 标准VBS命令 > 语句`中查看。

![语句命令](https://s2.ax1x.com/2019/02/15/kD50iQ.jpg)














#### 循环

```
For i = 0 To 10
	TracePrint i
Next
```
可以使用`UBound`返回最大数组下表。
关于数组的操作可以在`按键精灵 - 全部命令 > 标准VBS命令 > 函数 > 数组函数`中查看。

![数组函数](https://s2.ax1x.com/2019/02/15/kDIRXt.jpg)







#### 比较
判断条件写法：
- 等于：`=`
- 不等于：`<>`
- 大于&小于：`>` `<`
- 大于等于&小于等于：`>=` `<=`
- 与：`and`
- 或：`or`

使用if语句进行判断：
```c
//条件可以是：a > b or a <= c and a = "X"
If 判断条件 Then
//满足条件执行的内容。
End If

//if else结构
If 判断条件 Then
    //满足条件执行
Else
    //不满足条件时执行
    ...
    //if语句可以嵌套
    If 条件2 Then
    End If
End If


//elseIf结构
If 条件1 Then 
//满足条件1执行
ElseIf 条件2 Then
//满足条件2执行
Else 
//都不满足时执行
End If
```

#### 选择结构

switch-case语句的写法。

```c
Select Case result
	Case 1
	TracePrint "hello"
	Case 2
	TracePrint "bye"
	Case Else
	TracePrint "cancel"
End Select
```


#### 函数
> 定义

使用关键字Function+加函数名开始，使用End Function结束。
```c
//函数名为add，有两个参数：a，b。
Function add(a,b)
//如果函数有返回值可以。
 add = a + b
//固定写法，使用End Function结束。
End Function
```
还有一个子函数的概念，可以忽略，使用函数即可，子函数作为代码块和函数用法一致，但是没有返回值。

> 调用
- 无返回值：参数可以省略`()`

```c
//无参数，直接使用函数名调用。
action_function
//有参数
action_function_parameter p1,p2,p3
```

- 有返回值：参数必须带`()`，否则报语法错误。
```c
//参数使用括号包裹
result = action_function(p1,p2,p3)
```





### 常用命令
####  输入模拟
- 鼠标输入：点击，移动，拖拽，滚轮等。
- 键盘输入：点击，按住，组合按键等。

根据需要可以组合，如果不清楚具体如何组合可以先录制一个对应动作的脚本，查看其源码。

####  延时等待
默认每条语句执行有一定的延时，模拟组合动作时常用。
```c
    //单位：毫秒
    Delay 1000
```





####  打印输出
用于简单调试
>控制台输出：```TracePrint "输出内容"```<br/>
>消息框输出：```MessageBox "输出内容"```<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;```MsgBox "内容",样式,"标题"```

*MsgBox可以用于流程控制或者异常处理。*

>文本输出：

可以查看自带样例脚本：`按键精灵自我介绍`

在打开记事本中的写法。
```c
Function WriteToTxt(data,x,y)
    //查找记事本的句柄
	txtHwnd = Plugin.Window.Find(0, "新建文本文档.txt - 记事本")
	//控件句柄
	txtHwnd = Plugin.Window.FindEx(txtHwnd, 0, "Edit", 0)
	//输出
	Call Plugin.Window.SendString(txtHwnd, "输出内容")
End Function
```

## 三.抓抓
必备工具，用于确定坐标、颜色、查找句柄等。

![抓抓](https://s2.ax1x.com/2019/02/15/kDHN4O.jpg)




























## 四.调试
设置断点：输入变量名查看变量内容。

![调试窗口](https://s2.ax1x.com/2019/02/15/kDHRPS.jpg)














## 五.应用

> ```应用1：``` **网站测试**[^footnote]



```
sequenceDiagram
进入下一所学校->>列表循环:遍历评选列表
列表循环->>评分操作: 点击进入
评分操作->>列表循环: 进入下一个评选项
评分操作->>进入下一所学校: 完成一次脚本循环
```





&nbsp;


通过脚本属性页面可以设置脚本循环次数，中途可以人为停止。
&nbsp;


>脚本属性界面

![属性界面](https://s2.ax1x.com/2019/02/14/kBrCo6.jpg)



















----------------------

> ```应用2：``` **xp扫雷**[^footnote1]
```
graph LR
更新数据-->遍历
遍历-->策略1
遍历-->...
遍历-->策略N
策略1-->标记
... --> 标记
策略N --> 标记
标记-->点击
点击-->更新数据
遍历-->无符合项
无符合项-->停止
```

[^footnote]: [时序图](https://www.baidu.com/s?ie=UTF-8&wd=%E6%97%B6%E5%BA%8F%E5%9B%BE)：一般用不上。
[^footnote1]: [状态机](https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&tn=baidu&wd=%E7%8A%B6%E6%80%81%E6%9C%BA&oq=%25E6%2597%25B6%25E5%25BA%258F%25E5%259B%25BE&rsv_pq=a187cc8f0002c05e&rsv_t=6c71GbBBpq4%2BCVfRZl8O0%2F9eiQxfvW831NmK9IzjuKHiYpYW2ltp1%2Flq6jI&rqlang=cn&rsv_enter=1&rsv_sug3=11&rsv_sug1=9&rsv_sug7=100&bs=%E6%97%B6%E5%BA%8F%E5%9B%BE)：也没啥用，跟流程图似的。
