---
title: Beer Search Log
tags: [beer_search,beer]
date: 2020-07-14 14:13:07
---

## 2020-07-14

新建 git 项目


- springboot 新建 catalog project. 提供api

引入一些基本的包。


- scrapy project。爬虫

```
scrapy startproject dung_beetle

scrapy genspider example "http://example.com/"

```


- 新建 heaven 项目。 vue

```
vue create heaven
cd heaven
npm run build
```

## 2020-07-15


- 安装 jdk 8


树莓派没 jdk 13 没 arm 版本。。。，只能用 jdk 8

```
# 获取 是 32 还是 64
getconf LONG_BIT

wget https://download.oracle.com/otn/java/jdk/8u261-b13/a4634525489241b9a9e1aa73d9e118e6/jdk-8u261-linux-arm32-vfp-hflt.tar.gz?AuthParam=1594774329_59c3f80f0e37f5ed2de4df1e3d340ae9



sudo vim  /etc/profile

# append
export JAVA_HOM=/home/pi/java/jdk1.8.0_261
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

source /etc/profile

java -version
```

- 安装 es

```
https://www.elastic.co/cn/downloads/elasticsearch

wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.8.0-linux-x86_64.tar.gz

tar -zxvf elasticsearch-7.8.0-linux-x86_64.tar.gz

cd elasticsearch-7.8.0/bin/

./elasticsearch

```


elasticsearch.yml

```
bootstrap.system_call_filter: false
xpack.ml.enabled: false

# 默认是127.0.0.1. 我想通过局域网访问
network.host: 192.168.31.158


# 如果修改了 node.name 则 initial_master_nodes 也需要修改，我这就一个
node.name: q
cluster.initial_master_nodes: ["q"]

```

成功

```
$ curl http://192.168.31.158:9200/ | jq .
{
"name": "q",
"cluster_name": "beer",
"cluster_uuid": "TPe-e-KuQnmoHeKFb81XFA",
"version": {
"number": "7.8.0",
"build_flavor": "default",
"build_type": "tar",
"build_hash": "757314695644ea9a1dc2fecd26d1a43856725e65",
"build_date": "2020-06-14T19:35:50.234439Z",
"build_snapshot": false,
"lucene_version": "8.5.1",
"minimum_wire_compatibility_version": "6.8.0",
"minimum_index_compatibility_version": "6.0.0-beta1"
},
"tagline": "You Know, for Search"
}
pi@raspberrypi:~/java/elasticsearch-7.8.0/config $
```

- python


自带  python2 and python3

- scrapy

```
pip3 install scrapy
```

不知道我的安装为什么在这个目录。设置 alias 好了
```
$ cat ~/.bash_aliases
alias python='/usr/bin/python3'
alias scrapy='/home/pi/.local/bin/scrapy'
```


- node

```
https://npm.taobao.org/mirrors/node/latest-v14.x/

wget https://npm.taobao.org/mirrors/node/latest-v14.x/node-v14.0.0-linux-armv7l.tar.gz

tar -zxvf node-v14.0.0-linux-armv7l.tar.gz

cd node-v14.0.0-linux-armv7l

node --version

如果不行的话，简单粗暴设置 alias

alias node='/home/pi/java/node-v14.0.0-linux-armv7l/bin/node'
alias npm='/home/pi/java/node-v14.0.0-linux-armv7l/bin/npm'
```



## 2020-07-16

- postgresql 安装

唉吆喂，今天亏成狗哦。

https://www.youtube.com/watch?v=qtCeXcwIEAQ

参考这篇就好，背景音乐很好，很放松。

```
apt install postgresql
create user pi with password '111111';
alter user pi with superuser;
create database pi;
psql
```

## 2020-07-17

blog 没背景图片了，先爬一些背景图片玩玩吧。

http://www.win4000.com/meinvtag4_1.html

```
cd spiders
scrapy genspider meitu 'http://www.win4000.com/meinvtag4_1.html'
```

新建 SpiderBase 类。整合一些方法

```
def remove_url_params(self, url):
return url[:url.find('?')]
```


## 2020-07-18


接着昨天的爬背景图片。

http://www.win4000.com/meinvtag4_1.html


commit: https://github.com/yangyang5214/beer_search/commit/1eda9219d0ed4a4f606747564cf23d7dbc586fa1

文件: spider_win4000.py


运行:
```
python spider_main.py -n win4000
```

爬下来整合到 blog 的背景图片。

```

if __name__ == '__main__':
import os

# 重命名
index = 0
path = '/Users/beer/code/gravel/themes/hexo-theme-matery/source/medias/featureimages/'
for file in os.listdir(path):
file_path = path + file
os.system('mv {} {}.jpg'.format(file_path, path + index))
index = index + 1

# 生成 featureImages
for i in range(500):
print("  - /medias/featureimages/{}.jpg".format(i))
```





