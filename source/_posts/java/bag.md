---
title: bag 
tags: [java, bag]
---

### 定义

一种不支持从中删除元素的集合数据类型。


### class

方法

- add(T t)
- isEmpty()
- size()
- iterator 支持访问


```

import java.util.ArrayList;
import java.util.Iterator;

public class Bag<T> implements Iterable<T> {

    private ArrayList<T> list;

    public Bag() {
        this.list = new ArrayList<>();
    }

    public Bag(int capacity) {
        this.list = new ArrayList<>(capacity);
    }

    void add(T data) {
        list.add(data);
    }

    boolean isEmpty() {
        return this.list.isEmpty();
    }

    int size() {
        return this.list.size();
    }

    @Override
    public Iterator<T> iterator() {
        return this.list.iterator();
    }
}

class BagTest {
    public static void main(String[] args) {
        Bag<Integer> bag = new Bag<>();
        bag.add(1);
        bag.add(2);
        bag.add(3);

        for (Integer value : bag) {
            System.out.println(value);
        }
    }
}
```
