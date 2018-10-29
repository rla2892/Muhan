<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page language="java" import="java.util.*, java.security.*, java.io.*, java.net.*" %>
    <%!
    /**==============================================================
      Description        :  사용 함수 선언
    ==============================================================**/
     /**
     * nullcheck
     * @param str, Defaultvalue
     * @return
     */

     public static String nullcheck(String str,  String Defaultvalue ) throws Exception
     {
          String ReturnDefault = "" ;
          if (str == null)
          {
              ReturnDefault =  Defaultvalue ;
          }
          else if (str == "" )
         {
              ReturnDefault =  Defaultvalue ;
          }
          else
          {
                      ReturnDefault = str ;
          }
           return ReturnDefault ;
     }
     /**
     * BASE64 Encoder
     * @param str
     * @return
     */
    public static String base64Encode(String str)  throws java.io.IOException {
        sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
        byte[] strByte = str.getBytes();
        String result = encoder.encode(strByte);
        return result ;
    }

    /**
     * BASE64 Decoder
     * @param str
     * @return
     */
    public static String base64Decode(String str)  throws java.io.IOException {
        sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
        byte[] strByte = decoder.decodeBuffer(str);
        String result = new String(strByte);
        return result ;
    }
    %>
    <%
    /**==============================================================
      Description        : 캐릭터셋 정의
      EUC-KR: @ page contentType="text/html;charset=EUC-KR
      UTF-8: @ page contentType="text/html;charset=UTF-8
    ==============================================================**/
    %>
    <%@ page contentType="text/html;charset=UTF-8"%>
    <%
    /**==============================================================
      Description        :  사용자 샘플코드
    ==============================================================**/
    String charsetType = "UTF-8"; //EUC-KR 또는 UTF-8

    request.setCharacterEncoding(charsetType);
    response.setCharacterEncoding(charsetType);
    //String  action     = nullcheck(request.getParameter("action"), "");
    String  action     = nullcheck((String) request.getAttribute("action"), "");
    if(action.equals("go")) {

        String sms_url = "";
        sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL (고정)(필수)
        String user_id = base64Encode("rla2892"); // SMS아이디	(고정)(필수)
        String secure = base64Encode("728bc393ac8c645b934eb475045d2a39");//인증키	(고정)(필수)
        //String msg = base64Encode(nullcheck(request.getParameter("msg"), ""));	//메세지 내용(수정)(필수)
        String msg = base64Encode(nullcheck((String)request.getAttribute("msg"), ""));	//메세지 내용(수정)(필수)
        //String rphone = base64Encode(nullcheck(request.getParameter("rphone"), ""));//받는 번호. (수정)(필수)
        String rphone = base64Encode(nullcheck((String) request.getAttribute("rphone"), ""));//받는 번호. (수정)(필수)
        
        //보내는 번호. (고정)(필수)
        String sphone1 = base64Encode(nullcheck(request.getParameter("sphone1"), ""));
        String sphone2 = base64Encode(nullcheck(request.getParameter("sphone2"), ""));
        String sphone3 = base64Encode(nullcheck(request.getParameter("sphone3"), ""));
        sphone1 = base64Encode("010");
        sphone2 = base64Encode("8527");
        sphone3 = base64Encode("8929");
        
        //고려 불필요 (고정)(선택)
        String rdate = base64Encode(nullcheck(request.getParameter("rdate"), ""));
        String rtime = base64Encode(nullcheck(request.getParameter("rtime"), ""));
        String mode = base64Encode("1");
        String subject = "";
        if(nullcheck(request.getParameter("smsType"), "").equals("L")) {
            subject = base64Encode(nullcheck(request.getParameter("subject"), ""));
        }
        
        //무조건 테스트	(수정)(선택)
        //String testflag = base64Encode(nullcheck(request.getParameter("testflag"), ""));
        String testflag = base64Encode(nullcheck((String)request.getAttribute("testflag"), ""));
        //testflag =base64Encode("Y");
        
        String destination = base64Encode(nullcheck(request.getParameter("destination"), ""));
        
        //고려 불필요. (고정)(선택) 반복 정보. 
        String repeatFlag = base64Encode(nullcheck(request.getParameter("repeatFlag"), ""));
        String repeatNum = base64Encode(nullcheck(request.getParameter("repeatNum"), ""));
        String repeatTime = base64Encode(nullcheck(request.getParameter("repeatTime"), ""));
        
        //프로세스 후 돌아가는 페이지. (고정). Store_order_check.do 로 돌아가야 함.
        String returnurl = nullcheck(request.getParameter("returnurl"), "");
        returnurl="Store_order_check.do";//리턴 URL
        
        String nointeractive = nullcheck(request.getParameter("nointeractive"), "");
        
        //sms타입 (고정)(필수). sms로 고정. lms,mms 사용 안함. 무조건 한글 30자 내. 없으면 sms임. S(단문) L(장문)
        String smsType = base64Encode(nullcheck(request.getParameter("smsType"), ""));
        smsType = base64Encode("S");

        String[] host_info = sms_url.split("/");
        String host = host_info[2];
        String path = "/" + host_info[3];
        int port = 80;

        // 데이터 맵핑 변수 정의
        String arrKey[]
            = new String[] {"user_id","secure","msg", "rphone","sphone1","sphone2","sphone3","rdate","rtime"
                        ,"mode","testflag","destination","repeatFlag","repeatNum", "repeatTime", "smsType", "subject"};
        String valKey[]= new String[arrKey.length] ;
        valKey[0] = user_id;
        valKey[1] = secure;
        valKey[2] = msg;
        valKey[3] = rphone;
        valKey[4] = sphone1;
        valKey[5] = sphone2;
        valKey[6] = sphone3;
        valKey[7] = rdate;
        valKey[8] = rtime;
        valKey[9] = mode;
        valKey[10] = testflag;
        valKey[11] = destination;
        valKey[12] = repeatFlag;
        valKey[13] = repeatNum;
        valKey[14] = repeatTime;
        valKey[15] = smsType;
        valKey[16] = subject;

        String boundary = "";
        Random rnd = new Random();
        String rndKey = Integer.toString(rnd.nextInt(32000));
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] bytData = rndKey.getBytes();
        md.update(bytData);
        byte[] digest = md.digest();
        for(int i =0;i<digest.length;i++)
        {
            boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
        }
        boundary = "---------------------"+boundary.substring(0,11);

        // 본문 생성
        String data = "";
        String index = "";
        String value = "";
        for (int i=0;i<arrKey.length; i++)
        {
            index =  arrKey[i];
            value = valKey[i];
            data +="--"+boundary+"\r\n";
            data += "Content-Disposition: form-data; name=\""+index+"\"\r\n";
            data += "\r\n"+value+"\r\n";
            data +="--"+boundary+"\r\n";
        }

        //out.println(data);

        InetAddress addr = InetAddress.getByName(host);
        Socket socket = new Socket(host, port);
        // 헤더 전송
        BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), charsetType));
        wr.write("POST "+path+" HTTP/1.0\r\n");
        wr.write("Content-Length: "+data.length()+"\r\n");
        wr.write("Content-type: multipart/form-data, boundary="+boundary+"\r\n");
        wr.write("\r\n");

        // 데이터 전송
        wr.write(data);
        wr.flush();

        // 결과값 얻기
        BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(),charsetType));
        String line;
        String alert = "";
        ArrayList tmpArr = new ArrayList();
        while ((line = rd.readLine()) != null) {
            tmpArr.add(line);
        }
        wr.close();
        rd.close();

        String tmpMsg = (String)tmpArr.get(tmpArr.size()-1);
        String[] rMsg = tmpMsg.split(",");
        String Result= rMsg[0]; //발송결과
        String Count= ""; //잔여건수
        if(rMsg.length>1) {Count= rMsg[1]; }

                        //발송결과 알림
        if(Result.equals("success")) {
            alert = "성공적으로 발송하였습니다.";
            alert += " 잔여건수는 "+ Count+"건 입니다.";
        }
        else if(Result.equals("reserved")) {
            alert = "성공적으로 예약되었습니다";
            alert += " 잔여건수는 "+ Count+"건 입니다.";
        }
        else if(Result.equals("3205")) {
            alert = "잘못된 번호형식입니다.";
        }
        else {
            alert = "[Error]"+Result;
        }

        out.println(nointeractive);

        if(nointeractive.equals("1") && !(Result.equals("Test Success!")) && !(Result.equals("success")) && !(Result.equals("reserved")) ) {
            out.println("<script>alert('" + alert + "')</script>");
        }
        else if(!(nointeractive.equals("1"))) {
        	//성공
            out.println("<script>alert('" + nullcheck((String) request.getAttribute("rphone"), "") + "')</script>");
            out.println("<script>alert('" + alert + "')</script>");
        }

        
        out.println("<script>location.href='"+returnurl+"';</script>");
    }
    %>

