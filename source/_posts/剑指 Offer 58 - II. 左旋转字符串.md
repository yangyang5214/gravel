---
title: 剑指 Offer 58 - II. 左旋转字符串
tags: [剑指offer]
date: 2020-09-28 13:07:24
---

### 题目

![](https://beef-1256523277.cos.ap-chengdu.myqcloud.com/bed/20200928210649.png)


### 思路


这有啥做的。直接 sub  -> append


卧槽 看了官方题解，感觉也没啥啊。。。


### 解题

不知道有什么不妥当

```
def reverse_left_words(s: str, n: int) -> str:
return s[n:] + s[0:n]
```







