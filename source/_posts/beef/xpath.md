---
title: xpath
tags: ['scrapy']
date: 2020-02-14 07:07:43
---


### 取前几个

position()<=n

```
//dl[@class="collateral-tabs"]//dd[position()<=2]
```

### 取最后一个

last()


```
//dl[@class="collateral-tabs"]//dd[last()]
```

类似

```
//dl[@class="collateral-tabs"]//dd[last()-1]
//dl[@class="collateral-tabs"]//dd[last()-2]
```

### and

```
<script type="text/javascript">
var defaultPageData = {"page":{"country":"CN","language":"EN","designer":"","section":"handbags","categories":["handbags","newarrivals"],"type":"product detail"},"products":[],"site":{"name":"saks.com","is_mobile":"false","is_production":"true"},"visitor":{"account_id":"","currency_code":"CNY","email_address":"","logged_in":"false","loyalty_id":"","personalization_id":"","session_id":"1582602692332npPo069Ct-CuwJ1UDfsMFbHsp51u4xaVonbVTxEtyHNpF4tcTwZskHAh"}};
var visitorData = defaultPageData.visitor || { currency_code : ''};

defaultPageData.visitor = {
account_id: getCookie('AccountId') || '',
currency_code: getCookie('E4X_CURRENCY') || visitorData.currency_code,
email_address: getCookie('UserName') || '',
logged_in: getCookie('AccountId') ? 'logged in' : 'logged out',
loyalty_id: getCookie('Loyalty_id') || '',
personalization_id: getCookie('saksAnonymousId') || '',
session_id: getCookie('sessionID') || '',
md5_email_address: getCookie('md5_email_address') || '',
sha256_email_address: getCookie('sha256_email_address') || ''
};
</script>
```


定位到当前的 script

```
//script[@type="text/javascript" and contains(.,'var defaultPageData =')]

转为 xpath:
response.xpath('//script[@type="text/javascript" and contains(.,"var defaultPageData =")]').extract()
```



