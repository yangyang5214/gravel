---
title: celery
tags: [celery,python]
---

> Celery is a simple, flexible, and reliable distributed system to process vast amounts of messages, while providing operations with the tools required to maintain such a system.

简单 灵活 可靠 分布式 处理大量请求 同时提供此系统相关工具

### 前言

有个项目中用到了 celery。有个坑是, 前同事定义的 broker 队列，任务设置了 expired，然后消费的时候把已超时的任务都跳过。恰巧某个时间点的任务有点多。导致 队列的 任务数量，维持在了 1万+，消费的时候都正好超时，就导致任务都没跑，数据都得不到更新。

[Celery - Distributed Task Queue — Celery 5.0.1 documentation](https://docs.celeryproject.org/)

### 架构

![](https://beer-1256523277.cos.ap-shanghai.myqcloud.com/blog/20201027175616.png)


感觉就是一个 producer/consumer 架构。

#### broker

a message transport 

一个接收和分发消息的中介。

- redis 
- RabbitMQ

[Brokers — Celery 5.0.1 documentation](https://docs.celeryproject.org/en/master/getting-started/brokers/index.html#broker-overview)

#### producer

@app.task

delay 生成任务到 broker

#### consumer

worker 消费 broker 中的任务

#### backend

任务的执行结果

### 简单使用

#### hello world

创建一个 worker

``` 
from celery import Celery

# ssh -N -L 6379:127.0.0.1:6379 pi
app = Celery('tasks', broker='redis://localhost')


@app.task
def add(x, y):
    return x + y
```

运行

``` 
celery -A hello_world worker --loglevel=INFO

-A, --app APPLICATION
worker  Start worker instance.
```
调用

``` 
from hello_world import add

add.delay(3, 4)
add.delay(10, 4)
```

![](https://beef-1256523277.cos.ap-chengdu.myqcloud.com/bed/20201101140749.png)

可以看到执行结果。如果是调用 api 发送数据并且不关注失败重试，可以用此功能。

返回值


使用 backend

``` 
from celery import Celery

# ssh -N -L 6379:127.0.0.1:6379 pi
app = Celery('tasks', broker='redis://localhost', backend='redis://localhost/1')


@app.task
def add(x, y):
    return x + y
```

``` 
from hello_world2 import add

result = add.delay(3, 4)
print(result)
print(result.result)

# result
0124405b-6529-4eed-9846-410cde313207
7
```

> celery worker --help. 可以看到更多参数支持。例：-c --concurrency

### 配置

有比较完善，优雅的配置方式. 以下几种方式

- app.conf
```
app.conf.task_serializer = 'json'
```

- app.conf.update

``` 
app.conf.update(
    task_serializer='json',
    accept_content=['json'],  # Ignore other content
    result_serializer='json',
    timezone='Europe/Oslo',
    enable_utc=True,
)
```
- config_from_object

``` 
app.config_from_object('celeryconfig')

# celeryconfig.py file
broker_url = 'pyamqp://'
result_backend = 'rpc://'
task_serializer = 'json'
result_serializer = 'json'
accept_content = ['json']
timezone = 'Europe/Oslo'
enable_utc = True
```

### 生产环境使用

- celery main

``` 
from celery import Celery

# ssh -N -L 6379:127.0.0.1:6379 pi
app = Celery('celery_main',
             broker='redis://localhost',
             backend='redis://localhost/1',
             include=['task1', 'task2']
             )

# Optional configuration, see the application user guide.
app.conf.update(
    result_expires=3600,
)
```

include 添加所有任务，根据任务职能分开

- task1

``` 
from celery_main import app

@app.task
def add(x, y):
    return x + y

```

- task2

``` 
from celery_main import app

@app.task
def sub(x, y):
    return x - y
```

可以看到任务已加载

![](https://beef-1256523277.cos.ap-chengdu.myqcloud.com/bed/20201101144816.png)


### 后台启动 多个任务

use multi

multi -A 可以接多个 app

``` 
$ celery multi --help
Usage: celery multi [OPTIONS]

  Start multiple worker instances.

Options:
  --help  Show this message and exit.
```


``` 
celery multi satrt CELERYD_NODES  -A celery_main worker --loglevel=INFO
celery multi stop CELERYD_NODES  -A celery_main worker --loglevel=INFO
```



### Designing Work-flows

https://docs.celeryproject.org/en/stable/getting-started/next-steps.html#canvas-designing-work-flows








