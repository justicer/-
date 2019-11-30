package com.gh.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.gh.controllers.WordUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;


@Controller
@RequestMapping(value="/erweima")
public class TestEWM {
	
	@RequestMapping(value="/ToMakeCode")
	public String showAddCode(HttpServletRequest request,HttpServletResponse response) {
		return "erweima";
		
	}
	 
	 //  导出word
	 @RequestMapping(value="/word")  
		public String word(Model model,HttpServletRequest request,String ids){
			
			WordUtil mdoc = new WordUtil();  
			String path = Word.class.getResource("/").getPath();
			Map<String, Object> dataMap = new HashMap<String, Object>();  
			
			String[] idsArray = ids.split(",");// 把获取到的数进行分割
			
			//int j =108;// 总数
			int j = 144;
			// 判断 如果添加的数小于总数，就自动增加0 填补空缺
	         int idLen= idsArray.length;
			if(idLen < j) {
				for(int k = 0; k < j - idLen; k++) {
					idsArray = insert(idsArray, Integer.toString(k+200));
				}
			}
			
			List<String> list01 =new ArrayList<String>();
			List<String> list02 =new ArrayList<String>();
			for(int o = 0; o < idsArray.length; o++) {
				if(idsArray[o].length() == 8) {
					list01.add(idsArray[o]);
				}else {
					list02.add(idsArray[o]);
				}
			}
			
			list01.addAll(list02);
			
			int width=150;
	         int height=150;
	         String format="png";
	         for(int a = 0; a < list01.size(); a++) {
		        	 //String contents="https://sslwx.zrchn.com/a/b/deviceno=BP"+list01.get(a);
		        	 String contents=list01.get(a);
			         HashMap<EncodeHintType, Comparable> map=new HashMap<EncodeHintType, Comparable>();
			         map.put(EncodeHintType.CHARACTER_SET, "utf-8");
			         map.put(EncodeHintType.ERROR_CORRECTION,ErrorCorrectionLevel.M);
			         map.put(EncodeHintType.MARGIN, 0);
			         try {
			        	 if(list01.get(a).length() == 8) {
			        		 BitMatrix bm = new MultiFormatWriter().encode(contents, BarcodeFormat.QR_CODE, width, height);
			        		//调用去除白边方法
				             bm = deleteWhite(bm);//删除白边
				             Path file=new File(path+"/erweima"+list01.get(a)+".png").toPath();
				             //Path file=new File("D:/xunlei/"+list01.get(a)+".png").toPath();
				             
				             MatrixToImageWriter.writeToPath(bm, format, file);
			        	 }
			         } catch (WriterException e) {
			             e.printStackTrace();
			         } catch (IOException e) {
			             e.printStackTrace();
			         }
				}
			
			
			//Arrays.sort(idsArray,Collections.reverseOrder());// 字符串数组 倒序排列
			//String[] BPIds=arraySort(idsArray);
	         
			// 循环添加到集合中
			for (int i = 0; i < list01.size(); i++) {
					int id = i+1;
		        	
		        	if(list01.get(i).length() == 8) {
		        		dataMap.put("bp"+id, list01.get(i)); 
		        		dataMap.put("image"+id, mdoc.getImageStr(path+"/erweima"+list01.get(i)+".png"));
		        		//dataMap.put("image"+id, mdoc.getImageStr("D:/xunlei/"+list01.get(i)+".png"));
		        	}else {
		        		dataMap.put("bp"+id, 0); 
		        		dataMap.put("image"+id, mdoc.getImageStr(path+"/img/空白.png"));
		        		//dataMap.put("image"+id, mdoc.getImageStr("D:/xunlei/空白.png"));
		        	}
	        	}
			
	        mdoc.createDoc(dataMap, "F:/新 LED.doc");  
	        model.addAttribute("message","导出word成功");  

	        return null;
		}
	 
	 
	 // 字符数组追加字符串的方法
	 private static String[] insert(String[] arr, String str) {
		    int size = arr.length;  //获取数组长度
		    String[] tmp = new String[size + 1];  //新建临时字符串数组，在原来基础上长度加一
		    for (int i = 0; i < size; i++){  //先遍历将原来的字符串数组数据添加到临时字符串数组
		        tmp[i] = arr[i];
		    }
		    tmp[size] = str;  //在最后添加上需要追加的数据
		    return tmp;  //返回拼接完成的字符串数组
		}
	 
	 
	 /**
	      * 删除白边
	      * */
	 private static BitMatrix deleteWhite(BitMatrix matrix) {
	        int[] rec = matrix.getEnclosingRectangle();
	        int resWidth = rec[2] + 1;
	        int resHeight = rec[3] + 1;
	 
	        BitMatrix resMatrix = new BitMatrix(resWidth, resHeight);
	        resMatrix.clear();
	        for (int i = 0; i < resWidth; i++) {
	            for (int j = 0; j < resHeight; j++) {
	                if (matrix.get(i + rec[0], j + rec[1]))
	                    resMatrix.set(i, j);
	            }
	        }
	        return resMatrix;
	    }
	
	 
	 //  制作二维码
    @RequestMapping(value="/makeCode")
    public String showUserName(HttpServletRequest request, Model model,String code){
        
    	 int width=150;
         int height=150;
         String format="png";
         String contents="https://sslwx.zrchn.com/a/b/deviceno=BP"+code;
         HashMap<EncodeHintType, Comparable> map=new HashMap<EncodeHintType, Comparable>();
         map.put(EncodeHintType.CHARACTER_SET, "utf-8");
         map.put(EncodeHintType.ERROR_CORRECTION,ErrorCorrectionLevel.M);
         map.put(EncodeHintType.MARGIN, 0);
         try {
             BitMatrix bm = new MultiFormatWriter().encode(contents, BarcodeFormat.QR_CODE, width, height);
             Path file=new File("D:/"+code+".png").toPath();
             MatrixToImageWriter.writeToPath(bm, format, file);
         } catch (WriterException e) {
             e.printStackTrace();
         } catch (IOException e) {
             e.printStackTrace();
         }
         
         return "erweima";
       
    }
    
	
    
}
