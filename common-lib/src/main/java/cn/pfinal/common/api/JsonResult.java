package cn.pfinal.common.api;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

@Data
@JsonIgnoreProperties(value = {"success"})
public class JsonResult<T> {
    private String code;
    private String message;
    private T data;

    //成功, 没有数据
    public JsonResult() {
        this.data = null;
        this.code = "SUCCESS";
        this.message = "";
    }

    //成功，有数据
    public JsonResult(T data) {
        this.data = data;
        this.message = "";
        this.code = "SUCCESS";
    }

    //成功或失败，决于status
    public JsonResult(boolean status, String message) {
        this.data = null;
        this.message = message;
        this.code = status ? "SUCCESS" : "ERROR";
    }

    public JsonResult(String code, String message) {
        this.data = null;
        this.message = message;
        this.code = code;
    }

    public JsonResult(String code, String message, T data) {
        this.data = data;
        this.message = message;
        this.code = code;
    }

    public JsonResult(boolean status, String message, T data) {
        this.data = data;
        this.message = message;
        this.code = status ? "SUCCESS" : "ERROR";
    }

    public Boolean isSuccess() {
        return code.equals("SUCCESS");
    }
}
