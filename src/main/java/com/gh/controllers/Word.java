package com.gh.controllers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gh.controllers.WordUtil;;

@Controller
public class Word {

	
	@RequestMapping(value="/word")  
	public String word(Model model,HttpServletRequest request){
		
		WordUtil mdoc = new WordUtil();  
		 
		Map<String, Object> dataMap = new HashMap<String, Object>();  
        
        dataMap.put("BPCode01", "222222"); 
        dataMap.put("BPCode02", "01"); 
        dataMap.put("BPCode03", "123"); 
        dataMap.put("BPCode04", "3344"); 
        dataMap.put("BPCode05", "5555"); 
        dataMap.put("BPCode06", "6666"); 
        dataMap.put("BPCode07", "7777"); 
        dataMap.put("BPCode08", "8888"); 
        dataMap.put("BPCode09", "9999"); 
        dataMap.put("BPCode10", "1010"); 
        dataMap.put("BPCode11", "11111"); 
        dataMap.put("BPCode12", "121212"); 
        dataMap.put("BPCode13", "13131313"); 
        dataMap.put("BPCode14", "14141414"); 
        //����ͼƬ
        System.out.println(Word.class.getResource("/").getPath());
        String path = Word.class.getResource("/").getPath();
        dataMap.put("img01", mdoc.getImageStr(path+"img/Chrysanthemum.jpg"));
        
        mdoc.createDoc(dataMap, "E:/word001.doc");  
        
        model.addAttribute("message","导出word成功");  

        return "HelloWorld";
	}
	
	
}
