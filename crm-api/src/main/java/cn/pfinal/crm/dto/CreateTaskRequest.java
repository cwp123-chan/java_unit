package cn.pfinal.crm.dto;

import lombok.Data;

import javax.validation.constraints.*;

@Data
public class CreateTaskRequest {
    @Min(value = 1,message = "company_id不能为空")
    private int companyId;
    private int leadId;
    private int levelId;
    private String name;
    private int sex;
    private String phone;
    public String getName(){
        return this.name;
    }
}
