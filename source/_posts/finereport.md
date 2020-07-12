---
title: finereport
tags: [tools]
date: 2020-02-22 09:26:08
---

---
吐槽

[支持的数据库](https://help.finereport.com/doc-view-2458.html#3)

> mysql 居然只支持到 5.7 🙄。Mac 默认是 8.x，需要下载指定版本

```
brew install mysql@5.7
brew services start mysql@5.7
```

接 [FineReport \\| beer](https://www.hexianwei.com/2019/01/06/FineReport-10.0/) ，继续写~~~


---
本 blog 记录一些网友提问的功能，其实很多官方的已经很完善了。我也会同时标注！

### url 动态传参


引入原话：

> 网友A: 就是报表先用帆软的设计器做出来。我现在想把这些报表集成到公司自己开发的系统里面。就是集成到项目里。但是报表查询的数据、我想根据不同的人登陆系统、查看不同的数据、实现动态过滤查询


其实就是 url 动态传参数，传递到模板。

---
未解决。没找到解决方案。




