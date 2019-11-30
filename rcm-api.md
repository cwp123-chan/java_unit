## 接口列表

| 接口 |  描述       |
| -------- | ------------- |
| v1/lead | 线索列表 |
| v1/lead/create | 新增线索 |
| v1/lead/update | 修改线索 |
| v1/lead/detail | 线索详情 |
| v1/lead/deal | 线索处理 |
| v1/lead/assign | 线索分配 |
| v1/task | 任务列表 |
| v1/task/create | 新增任务 |
| v1/task/update | 编辑任务 |
| v1/task/detail | 任务详情 |
| v1/task/assign | 任务分配 |
| v1/task/faid | 任务失败申请 |
| v1/note | 跟进记录 |
| v1/note/create | 添加跟进记录 |
| v1/note/update | 添加跟进记录 |
| v1/proposal | 批注列表 |
| v1/proposal/create | 添加批注 |
| v1/proposal/update | 修改批注 |




## 接口示例

#### 新增线索

接口地址

```
{version}/lead/create
```

请求方式

```
POST
```

参数说明

| 字段 |  类型   | 是否必须  |  默认值 |  说明  |
| -------- | ------------- |-------- | ------------- |-------- |
| company_id | int |true | 无 |公司ID |
| source_id | int |true | 无 |来源 （1:来电登记 2:到店登记）  |
| ... | int |true | 无 | 无  |

格式示例（Content-Type:application/json）
```javascript
{
    "company_id":1001,
    "source_id":1,
    "channel_id":1,
    "name":"张三",
    "sex":1,
    "phone":"15162698888",
    "phone2":"15162696666",
    "content":"咨询一下相关优惠",
    "remark":"这个人购买意向很强",
    "product_id":1001,
    "sale_id":1001,
    "describe":"",
    "extra":{
        "call_start":"2019-11-28 10:10:10",
        "call_length":"2:45"
    },
    "status":1,
    "task":{
        "province_id":100,
        "city_id":2188,
        "district_id":199999,
        "address":"万荣路1188号",
        "level_id":1,
        "work":"阿里巴巴"
    }
}
```

返回结构

```javascript
{
    "code": "SUCCESS",
    "message": "操作成功"  
    "data":{
        "id":1001
    }
}
```

返回码

| code |  描述       |
| -------- | ------------- |
| SUCCESS | 成功 |
| ERROR | 失败 |
| ... | 系统错误 |



