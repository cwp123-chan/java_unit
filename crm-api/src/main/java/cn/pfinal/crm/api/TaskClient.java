package cn.pfinal.crm.api;

import cn.pfinal.common.api.JsonResult;
import cn.pfinal.crm.CrmConstant;
import cn.pfinal.crm.dto.CreateTaskRequest;
import cn.pfinal.crm.dto.TaskDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.validation.Valid;
import java.util.List;

@FeignClient(name = CrmConstant.SERVICE_NAME, path = "/v1/task", url = "http://127.0.0.1:8080")
public interface TaskClient {
    @GetMapping(path = "/list")
    JsonResult<List<TaskDto>> listTasks();

    @GetMapping(path = "/get")
    JsonResult<TaskDto> getTask();

    @PostMapping(path = "/create")
    JsonResult create(@RequestBody @Valid CreateTaskRequest request);

    @PostMapping(path = "/update")
    JsonResult update();

}
