package cn.pfinal.crm.controller;

import cn.pfinal.common.api.JsonResult;
import cn.pfinal.crm.dto.CreateTaskRequest;
import cn.pfinal.crm.dto.TaskDto;
import cn.pfinal.crm.mapper.TaskMapper;
import cn.pfinal.crm.model.Task;
import cn.pfinal.crm.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/v1/task")
@Validated
public class TaskController {

    @Autowired
    TaskService taskService;
    @Autowired
    TaskMapper taskMapper;

    @GetMapping(path = "/list")
    JsonResult<List<TaskDto>> listTasks() {

        List<TaskDto> TaskList = new ArrayList<>();
        TaskList = taskMapper.getAll();
        System.out.println(TaskList);
        return new JsonResult<List<TaskDto>>(TaskList);
    }

    @GetMapping(path = "/get")
    JsonResult<TaskDto> getTask() {

        return new JsonResult<TaskDto>(null);
    }

    @PostMapping(path = "/create")
    JsonResult createTask(@RequestBody @Valid CreateTaskRequest request) {
        taskService.create(request);
        return new JsonResult("request");
    }

    @PostMapping(path = "/update")
    JsonResult update() {
        return new JsonResult();
    }
}
