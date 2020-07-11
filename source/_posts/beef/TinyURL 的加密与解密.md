---
title: TinyURL 的加密与解密
tags: ['leetcode']
date: 2020-01-27 10:20:39
---

https://leetcode-cn.com/problems/encode-and-decode-tinyurl/

TinyURL是一种URL简化服务， 比如：当你输入一个URL https://leetcode.com/problems/design-tinyurl 时，它将返回一个简化的URL http://tinyurl.com/4e9iAk.

要求：设计一个 TinyURL 的加密 encode 和解密 decode 的方法。你的加密和解密算法如何设计和运作是没有限制的，你只需要保证一个URL可以被加密成一个TinyURL，并且这个TinyURL可以用解密方法恢复成原本的URL。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/encode-and-decode-tinyurl
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。


### java

![](https://beer-1256523277.cos.ap-shanghai.myqcloud.com/blog/20200127200727.png)

- 简单 hashMap  计数

```
public class TinyURL {

public static void main(String[] args) {
TinyURL tinyURL = new TinyURL();
String longUrl = "https://leetcode.com/problems/design-tinyurl";
//http://tinyurl.com/4e9iAk.
String shortUrl = tinyURL.encode(longUrl);
System.out.println(shortUrl);
System.out.println(tinyURL.decode(shortUrl));
}

Map<Integer, String> hashMap = new HashMap<>();
int i = 0;

// Encodes a URL to a shortened URL.
public String encode(String longUrl) {
hashMap.put(i, longUrl);
return "http://tinyurl.com/" + i++;
}

// Decodes a shortened URL to its original URL.
public String decode(String shortUrl) {
return hashMap.get(Integer.valueOf(shortUrl.replace("http://tinyurl.com/", "")));
}
}
```




