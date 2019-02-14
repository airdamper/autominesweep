# autominesweep
按键精灵自动扫雷（xp版）




<html>
    <h1>按键精灵基本操作</h1>
</html>

[toc]
## 一.基本操作
### 1.界面
>根据汉字提示操作
### 2.录制
>点击录制操作鼠标键盘操作内容
### 3.UI精灵
>需要使用启用
## 二.命令功能
>q语言，查看比较方便，有点像注释。
### 常用命令
####  1.输入模拟
>鼠标输入：点击，移动，拖拽，滚轮。。。

>键盘输入：点击，按住，组合件。。。
####  2.打印输出
用于简单调试
>控制台输出：```TracePrint "输出内容"```

>消息框输出：```MessageBox("输出内容")```

>文本输出：

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

####  3.等待
```c
    //单位：毫秒
    Delay 1000
```
### 基础语法
弱语言，每个函数基本都会有使用的样例，照着写就可以了。

没什么要求，主要尽量避免变量同名，有时候可能会因为变量重名出bug。



#### 变量定义
- 一般变量：直接定义

- 可变数组：使用redom定义
    
#### 循环

```
For i = 0 To 10
	TracePrint i
Next
```

#### 比较
#### 函数
> 定义
```c
//函数名为add，有两个参数：a，b。
function add(a,b)
//如果函数有返回值可以。
 add = a + b
//固定写法，使用end function结束。
end function
```
> 调用
- 无返回值

```c
//无参数，直接使用函数名调用。
action_function
//有参数
action_function_parameter p1,p2,p3
```

- 有返回值
## 三.调试

```c
//参数使用括号包裹
result = action_function(p1,p2,p3)
```








