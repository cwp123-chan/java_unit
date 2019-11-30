package cn.pfinal.crm.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
public class CreateTaskRequest {
    @NotNull
    private int companyId;
    private int leadId;
    private int levelId;
    @Size(max = 20)
    private String name;
    private int sex;
    private String phone;
    public String getName(){
        return this.name;
    }
}
