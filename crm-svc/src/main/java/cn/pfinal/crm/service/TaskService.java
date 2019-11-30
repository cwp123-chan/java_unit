package cn.pfinal.crm.service;

import cn.pfinal.crm.dto.CreateTaskRequest;
import cn.pfinal.crm.dto.TaskDto;
import cn.pfinal.crm.mapper.TaskMapper;
import cn.pfinal.crm.model.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TaskService {
    @Autowired
    TaskMapper taskMapper;
    public List<Task> getAll(){
        List<TaskDto> taskDto = new ArrayList<TaskDto>();
        taskDto = taskMapper.getAll();
        System.out.println(taskDto);
        List T = new ArrayList();
        return T;
    }

    public void create(CreateTaskRequest request){
        Task task = new Task();
        String name = request.getName();
        String phone = request.getPhone();
        task.setName(name);
        task.setPhone(phone);
        taskMapper.insert(task);
        System.out.println();
    }
}
