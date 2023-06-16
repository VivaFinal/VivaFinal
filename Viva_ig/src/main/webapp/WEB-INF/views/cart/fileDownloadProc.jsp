 <%@page import="java.io.File"%>
 <%@page import="java.io.*"%>
 <%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <title>Insert title here</title>
 </head>
 <body>
 
<% 
  // �ٿ���� ������ �̸��� ������
  String fileName = request.getParameter("fileName");
  // �ٿ���� ������ ����Ǿ� �ִ� ���� �̸�
  String saveFolder = "File";
  
  // Context�� ���� ������ �˾ƿ�
  ServletContext context = getServletContext(); // ������ ���� ȯ�������� ������
  
  // ���� ������ ����Ǿ� �ִ� ������ ���
  String realFolder = context.getRealPath("saveFolder");
  // �ٿ���� ������ ��ü ��θ� filePath�� ����
  String filePath = realFolder + "\\" + fileName;
  
  try{
out.clear();

out = pageContext.pushBody();

   // �ٿ���� ������ �ҷ���
   File file = new File(filePath);
   byte b[] = new byte[4096];
   
   // page�� ContentType���� �������� �ٲٱ� ���� �ʱ�ȭ��Ŵ
   response.reset();
   //�ش� ������ Ÿ���� MIME�����̴�. 
   response.setContentType("application/octet-stream");
   //.mov -> video/quicktime
   //.one -> application/onenote
   //.ppt -> application/vnd.ms-powerpoint
   //.txt -> text/plain
   //.ini -> application/octet-stream (octect-stream�� 8��Ʈ�� �� �����Ͷ�� ��)
   //.wav -> audio/wav
   
   // �ѱ� ���ڵ�
   // '8859_1'�� 1����Ʈ�� �ش��ϴ� 256���� �ڵ忡 ����, �� 0x00 ~ 0xff ������ ��� �ڵ忡 ���� �����Ǵ� ���ڸ� ���� �ִ�.
   //�ݸ� 8859_1���� ���� ���ڸ� �Ŵ����� �ִ� 'EUC-KR', 
   //�̰��� Ȯ������ 'MS949' �� ������ ��� ���ڸ� �� �����Ѵٰ� ���ܵ� �� ���� 'UTF-8' ����
   //���� ���ڴ� Ȯ���� ������ ��� ����Ʈ ���� ���� �����Ǵ� ���ڸ� ���� �ִ� ���� �ƴϴ�.
   String Encoding = new String(fileName.getBytes("UTF-8"), "8859_1");
   
   // ���� ��ũ�� Ŭ������ �� �ٿ�ε� ���� ȭ���� ��µǰ� ó���ϴ� �κ�
   response.setHeader("Content-Disposition", "attachment; filename = " + Encoding);
  
   // ������ ���� ������ �о���� ���ؼ� ����
   FileInputStream is = new FileInputStream(filePath);
  
   // ���Ͽ��� �о�� ���� ������ �����ϴ� ���Ͽ� ���ֱ� ���ؼ� ����
   ServletOutputStream sos = response.getOutputStream();
   
   int numRead;
   // ����Ʈ �迭 b�� 0�� ���� numRead�� ���� ���Ͽ� ���� (���)
   while((numRead = is.read(b, 0, b.length)) != -1){
	   sos.write(b, 0, numRead);
   }
   
   sos.flush();
   sos.close();
   is.close();
   
  } catch(Exception e){
	  e.printStackTrace();
  }
 %>
 </body>
 </html>