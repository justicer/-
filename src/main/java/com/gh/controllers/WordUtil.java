package  com.gh.controllers;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.util.Map;

import sun.misc.BASE64Encoder;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class WordUtil {

	private Configuration configuration = null;  
	
	public WordUtil(){
		configuration = new Configuration();
		configuration.setDefaultEncoding("utf-8");  
	}
	
	public void createDoc(Map<String,Object> dataMap,String fileName) {  
		System.out.println(WordUtil.class.getClassLoader().getResource("/template/"));
	    configuration.setClassForTemplateLoading(WordUtil.class, "/template/");  
	    Template t=null;  
	    try {  
	        //t = configuration.getTemplate("test03.ftl");
	    	t = configuration.getTemplate("BP号模板测试.ftl");
	    } catch (IOException e) {  
	        e.printStackTrace();  
	    }  
	    File outFile = new File(fileName);  
	    Writer out = null;  
	    FileOutputStream fos=null;  
	    try {  
	        fos = new FileOutputStream(outFile);  
	        OutputStreamWriter oWriter = new OutputStreamWriter(fos,"UTF-8");  
	         out = new BufferedWriter(oWriter);   
	    } catch (FileNotFoundException | UnsupportedEncodingException e1) {  
	        e1.printStackTrace();  
	    }  
	       
	    try {  
	        t.process(dataMap, out);  
	        out.close();  
	        fos.close();  
	    } catch (TemplateException e) {  
	        e.printStackTrace();  
	    } catch (IOException e) {  
	        e.printStackTrace();  
	    }  
	}  
	
	 public String getImageStr(String imgFile){
        InputStream in=null;
        byte[] data=null;
        try {
            in=new FileInputStream(imgFile);
            data=new byte[in.available()];
            in.read(data);
            in.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        BASE64Encoder encoder=new BASE64Encoder();
        return encoder.encode(data);
    }
}
