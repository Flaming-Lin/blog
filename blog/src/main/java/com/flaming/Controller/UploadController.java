package com.flaming.Controller;

import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.UUID;

@Controller
@RequestMapping(value = "/upload")
public class UploadController {

    private static final Logger logger = LoggerFactory.getLogger(UploadController.class.getPackage().getName());

    @RequestMapping(value = "/picUpload", method = RequestMethod.POST)
    @ResponseBody
    public String picUpload(HttpServletRequest request, HttpServletResponse response,
                                @RequestParam(value = "editormd-image-file", required = false) MultipartFile picFile) {
        try{
            logger.debug("enter the requestMapping '/upload/picUpload'");
            request.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Type", "text/html");
            String rootPath = request.getSession().getServletContext().getRealPath("");

            String URIpath = "";
            if(!picFile.isEmpty()){
                String uuid = UUID.randomUUID().toString().replaceAll("-","");
                String contentType = picFile.getContentType();
                String imgType = contentType.substring(contentType.indexOf("/")+1);
                URIpath = "/upload/" + uuid + "." + imgType;
                picFile.transferTo(new File(rootPath + URIpath));
            }

            JSONObject json = new JSONObject();
            json.put("success", 1);
            json.put("message", "upload succeed！");
            json.put("url", ".." + URIpath);
            logger.debug("exit the requestMapping '/upload/picUpload'");
            return json.toJSONString();
        } catch (Exception e){
            logger.error(e.getMessage());
            JSONObject json = new JSONObject();
            json.put("success", 0);
            return json.toJSONString();
        }
    }
}
