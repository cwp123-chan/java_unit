package cn.pfinal.crm.mapper;

import cn.pfinal.crm.dto.TaskDto;
import cn.pfinal.crm.model.Task;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface TaskMapper {
    @Select("SELECT * FROM crm_task")
    List<TaskDto> getAll();

    @Insert("INSERT INTO crm_Task (company_id,lead_id,level_id,name,sex,phone) VALUES (#{companyId},#{leadId},#{levelId},#{name},#{sex},#{phone})")
    @Options(useGeneratedKeys = true,keyProperty = "id")
    void insert(Task Task);

}
