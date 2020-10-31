---
title: js
tags: [js,tools]
---

### 滑到底部

```
window.scrollTo(0,document.body.scrollHeight - 100)
```

### 点击按钮

```
.click()
```


### xpath

https://developer.mozilla.org/zh-CN/docs/Web/API/XPathResult

```
document.evaluate("(//div[@class="col-img"]//picture//img)[1]", document.body, null, 9, null).singleNodeValue.click()
```

