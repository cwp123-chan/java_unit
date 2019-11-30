package cn.pfinal.crm.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TaskDto {
    private long id;
    private int companyId;
    private int leadId;
    private int levelId;
    private String name;
    private int sex;
    private String phone;
    private String phone2;
    private int provinceId;
    private int cityId;
    private int districtId;
    private String address;
    private int productId;
    private String comparison;
    private String wechat;
    private String qq;
    private String email;
    private String idCard;
    private String work;
    private String remark;
    private int saleId;
    private int status;
    private String createdBy;
    private String createdAt;
    private String updatedAt;
    private int isDeleted;
}

