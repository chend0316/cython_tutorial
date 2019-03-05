# cython_tutorial
各个章节下都有`run_me.sh`用来编译、运行对应的案例。

## ch1，入门

1. 一个hello world项目
2. Python调用C语言动态库
3. 和2是一样的，但是使用手工gcc的方式进行编译

## ch2，封装C函数、结构体

1. Cython已经为我们封装好了很多实用的函数，那么如何调用呢？
2. 假设已经用C实现了一个队列算法，如何编写wrapper实现将C函数封装给Python调用

## ch3，代码管理

1. 通过pxd文件回避Python符号和C符号同名的问题
