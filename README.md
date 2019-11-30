# java_unit
java项目初始化骨架

#### 1. 依赖包

* Spring web 
  Spring Boot DevTools
  MyBatis Framework
  Mysql Driver
  LomBok

#### 2. 架构体系(spring)

#### 3. sql与api 见文件

#### 4. 模块网址( [http://design.it266.com/crm/#g=1&p=%E5%AE%A2%E6%88%B7%E6%89%B9%E6%B3%A8](http://design.it266.com/crm/#g=1&p=客户批注) )

#### 5. 架构网址

 https://start.spring.io/ 

#### 6. 模块分解

```
common-lib 			公共维护模块 (数据验证 token等)
crm-api				方法定义类(用于暴露给客户端的方法 [非实现类])
			Dto				用于暴露给客户端数据的类(限制和检验返回数据)
			api				对url分析 并进行路由分配
crm-svc				方法实现类(用于单模块实现定义类中的方法)
			controller 		实现返回给Dto数据的查验,与筛选 以及逻辑代码
			mapper			用于对数据库进行操作
			model			定义数据库中的实体类
			service			逻辑代码
```

#### 7. 后期更新.......