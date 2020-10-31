---
title: array 
tags: [java, array]
---

### 创建

- 声明  
```
double[] a;
```
- 创建 
```
a = new double[10];
```
- 初始化 
```
a[0] = 1; a[2] = 2
```

### 使用

- 找出最大值
- 计算平均值
- 复制数组

以上都是一次 for 循环. 比较简单。

- 颠倒数组

```
public static void reverse(double[] a) {
    int n = a.length;
    for (int i = 0; i < n / 2; i++) {
        double temp = a[i];
        a[i] = a[n - 1 - i];
        a[n - 1 - i] = temp;
}
```

需要注意的是，如果 n 是奇数，例如 n = 5 ， 5/2 = 2. index = 2, 会被忽略掉。





