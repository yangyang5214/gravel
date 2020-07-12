---
title: Effective Java
tags: [book]
date: 2020-06-07 23:11:51
---

## 创建和销毁对象

### 静态工厂代替构造器

**优势:**

- 有名称。 相对于多个构造器多个参数而言好理解
- 不必每次都创建新的对象

```
public final class Boolean implements java.io.Serializable,
Comparable<Boolean>
{
/**
* The {@code Boolean} object corresponding to the primitive
* value {@code true}.
*/
public static final Boolean TRUE = new Boolean(true);

/**
* The {@code Boolean} object corresponding to the primitive
* value {@code false}.
*/
public static final Boolean FALSE = new Boolean(false);

public static Boolean valueOf(boolean b) {
return (b ? TRUE : FALSE);
}
}
```





