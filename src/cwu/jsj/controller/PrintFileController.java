package cwu.jsj.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.ejb.BeforeCompletion;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cwu.jsj.model.Files;
import cwu.jsj.model.Price;
import cwu.jsj.service.PrintFileService;

@Controller
@RequestMapping("/printFile")
public class PrintFileController {
	@Resource
	private PrintFileService printFileService;
	@RequestMapping("/list.do")
	public String dolist(HttpSession session,HttpServletRequest request) {
		int userId = (int) session.getAttribute("userId");
		
		// 获取文件列表
		List<Files> files = printFileService.getFiles(userId);
		
		request.setAttribute("flist", files);
		
		return "user/user_PrintFile";
	}
	
	@RequestMapping("/pay")
	public String printFile(HttpServletRequest request,int fileId,String fileName,String printCopies,int urgentStatus,int printType,String printRemark){
		
		Map<String, String> Msg = new HashMap<String, String>();
		
		if(printCopies == null || printCopies.trim().length() == 0){
			Msg.put("printCopiesNull", "请输入打印份数");
			return "user/PrintFile";
		}
		Price price = printFileService.getPrintPrice(urgentStatus, printType);
		//打印每一页的单价
		double printPrice = price.getPayAmount();
		//文档页码
		int pageNum = 10;
		String pageNumstr = Integer.toString(pageNum);
		Msg.put("pageNum", pageNumstr);
		
		int printCop = Integer.parseInt(printCopies);
		//计算打印需支付的总金额
		double payAmount = pageNum*printPrice*printCop;
		
		String fileIdStr = Integer.toString(fileId);
		Msg.put("fileId", fileIdStr);
		
		try {
			String fName = new String(fileName.getBytes("gbk"),"utf-8");
			Msg.put("fileName", fName);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Msg.put("printCopies", printCopies);
		
		if(urgentStatus==0){
			Msg.put("urgentStatus", "否");
		}
		if(urgentStatus==1){
			Msg.put("urgentStatus", "是");
		}
		if(printType==1){
			Msg.put("printType", "黑白单面");
		}
		if(printType==2){
			Msg.put("printType", "黑白双面");
		}
		if(printType==3){
			Msg.put("printType", "彩色单面");
		}
		if(printType==4){
			Msg.put("printType", "彩色双面");
		}
		if(printRemark == null || printRemark.trim().length() == 0){
			Msg.put("printRemark", "无");
		}else{
			Msg.put("printRemark", printRemark);
		}
		
		String payAmountStr = Double.toString(payAmount);
		Msg.put("payAmount", payAmountStr);
		
		request.setAttribute("Msg", Msg);
		return "user/user_Pay";
	}
	
	
	
	@RequestMapping("/deleteFile")
	public String deleteFile(int fileId){
		Files files=printFileService.getRfilename(fileId);
		String rfilename=files.getRfileName();
		File file=new File("F:/1ZQ/SSMuploadFile",rfilename);
		//删除本地文件
		file.delete();
		//删除数据库记录
		printFileService.deleteFile(fileId);
		return "redirect:/printFile/list.do";
	}
	
	@RequestMapping("/upload.do")
	public String doUpload(MultipartFile uploadFile,HttpSession session,HttpServletRequest request) throws Exception{
		
		// 上传
		String uploadMsg = "";
	
		if(uploadFile.getSize()>0){
			String filename = uploadFile.getOriginalFilename();
			
			if(filename.endsWith("doc")||filename.endsWith("pdf")||filename.endsWith("docx")){
				//获取文件后缀名
				String suffix = filename.substring(filename.lastIndexOf(".") + 1);

				int userId = (int) session.getAttribute("userId");
				String rfilename1=String.valueOf(userId);
				//获取系统当前时间
				Date date = new Date();
				SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
				String uploadTimeStr=dateFormat.format(date);
				Date uploadTime = dateFormat.parse(uploadTimeStr);
				//时间戳
				long timeStam = uploadTime.getTime();
				String rfilename2 = Long.toString(timeStam);
				//文件重命名：userId-系统当前时间戳.文件名后缀
				String rfilename =rfilename1+ "-"+rfilename2+"."+suffix;

				// 保存文件信息
				int files = printFileService.uploadFile(userId, filename, rfilename, uploadTime);
				if(files!=0){
					//存储
					File file = new File("F:/1ZQ/SSMuploadFile",rfilename);
					uploadFile.transferTo(file);
					uploadMsg = "上传成功";
				}else{
					uploadMsg = "上传失败，请重试";
				}
				
			}else{
				uploadMsg = "暂不支持该种格式的文档";
			}
		}else{
			uploadMsg = "请选择文件后再上传";
		}
		
		// 设置值
		request.setAttribute("uploadMsg", uploadMsg);
		
		return "forward:/printFile/list.do";
	}
}
